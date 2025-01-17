.PHONY: init docs clean clobber prune
.DELETE_ON_ERROR:
export SPATIALITE_EXTENSION:=/usr/lib/x86_64-linux-gnu/mod_spatialite.so

DB=addresses.db

# data sources
ORGANISATION_CSV=var/organisation.csv
AddressBase_ZIP=cache/AB76GB_CSV.zip
AddressBase_HEADERS_CSV=cache/addressbase-premium-header-files.zip
AddressBase_CUSTODIANS_ZIP=cache/addressbase-local-custodian-codes.zip
CODEPO_ZIP=cache/codepo_gb.zip
ONSPD_ZIP=cache/ONSPD_MAY_2020_UK.zip
ONSUD_ZIP=cache/ONSUD_MAY_2020.zip
NSPL_ZIP=cache/NSPL_MAY_2020_UK.zip
LAD19_GEOJSON=var/lad19.geojson
LAD20_GEOJSON=var/lad20.geojson

AddressBase_DATA=\
	var/AddressBase/BLPU.csv\
	var/AddressBase/CLASSIFICATION.csv\
	var/AddressBase/DELIVERYPOINTADDRESS.csv\
	var/AddressBase/HEADER.csv\
	var/AddressBase/LPI.csv\
	var/AddressBase/METADATA.csv\
	var/AddressBase/ORGANISATION.csv\
	var/AddressBase/STREET.csv\
	var/AddressBase/STREETDESCRIPTOR.csv\
	var/AddressBase/SUCCESSOR.csv\
	var/AddressBase/TRAILER.csv\
	var/AddressBase/XREF.csv

DB_DATA=\
	var/addressbase-custodian.csv\
	var/organisation.csv\
	var/postcode.csv\
	var/uprn.csv\
	$(LAD19_GEOJSON)\
	$(LAD20_GEOJSON)


all:	docs data

#
#  exploration ..
#

# datasette server
datasette:	$(DB)
	datasette serve $(DB) \
	--config sql_time_limit_ms:50000 \
	--load-extension $(SPATIALITE_EXTENSION) \
	--metadata datasette/metadata.json \
	--template-dir datasette/templates/

# notebook server
notebook:	$(DB)
	jupyter notebook


#
#  published pages
#
docs:	docs/index.html docs/analysis/index.html

docs/index.html:	bin/render.py templates/guidance.html content/guidance.md
	@mkdir -p docs/
	python3 bin/render.py

# to include maps set notebook with "Widgets" -> "Save Widget State"
docs/analysis/index.html:	local-authority-addresses.ipynb
	@mkdir -p docs/analysis
	jupyter nbconvert local-authority-addresses.ipynb --to html --output $@

data:	addresses.db

addresses.db:	$(DB_DATA) bin/load.py
	@rm -f $@
	python3 bin/load.py $@


#
#  postcode
#
# postcode,codepo,onspd,nspl
var/postcode.csv:	var/nspl.csv var/onspd.csv var/codepo.csv bin/postcode.py
	python3 bin/postcode.py | bin/csvsort.sh -t, -k1.1 -k2.2> $@

var/nspl.csv:	$(NSPL_ZIP)
	@mkdir -p var/
	unzip -p $(NSPL_ZIP) 'Data/*.csv' | csvcut -c pcds,laua | sed -e '1{s/pcds,laua/postcode,nspl/}' -e '/^pcds,/d' > $@

var/onspd.csv:	$(ONSPD_ZIP)
	@mkdir -p var/
	unzip -p $(ONSPD_ZIP) 'Data/*.csv' | csvcut -c pcds,oslaua | sed -e '1{s/pcds,oslaua/postcode,onspd/}' -e '/^pcds,/d' > $@

# add missing headers to OS codepo
var/codepo.csv:	$(CODEPO_ZIP)
	@mkdir -p var/
	unzip -p $(CODEPO_ZIP) 'Data/CSV/*.csv' | csvcut -c 1,3,4,9 | sed -e '1i postcode,easting,northing,codepo' > $@

#
#  uprn
#
# uprn,postcode,addressbase-custodian,onsud
var/uprn.csv:	var/blpu.csv var/onsud.csv
	join --header -t, -1 1 -2 1 var/blpu.csv var/onsud.csv > $@

# cleaned up AddressBase BLPU table:
# uprn,postcode,addressbase-custodian
var/blpu.csv:	var/AddressBase/BLPU.csv bin/uprn.sh
	bin/uprn.sh < var/AddressBase/BLPU.csv > $@

# unpack AddressBase into a file for each record type
$(AddressBase_DATA):	 bin/unpack-addressbase.py $(AddressBase_ZIP) $(AddressBase_HEADERS_CSV)
	@mkdir -p var/AddressBase/
	python3 bin/unpack-addressbase.py $(AddressBase_HEADERS_CSV) $(AddressBase_ZIP)

var/onsud.csv:	$(ONSUD_ZIP)
	@mkdir -p var/
	unzip -p $(ONSUD_ZIP) 'Data/*.csv' | csvcut -c uprn,lad19cd | sed -e '1{s/uprn,lad19cd/uprn,onsud/}' -e '1!{/^uprn,/d;}' | bin/csvsort.sh -t, -k1,1 -k2,2 > $@

#
#  OS list of custodian names
#
var/addressbase-custodian.csv:	$(AddressBase_CUSTODIANS_ZIP)
	@mkdir -p var/
	unzip -p $(AddressBase_CUSTODIANS_ZIP) '*.csv' | csvcut -c "Local Custodian Code,Authority" | sed -e '1{s/^Local.*$$/addressbase-custodian,name/}' -e '1!{/^.Local Custodian/d;}' | bin/csvsort.sh -u -t, -k1,1 > $@


#
#  downloads
#
download: $(DOWNLOADS)

# https://geoportal.statistics.gov.uk/datasets/ons-postcode-directory-may-2020
$(ONSPD_ZIP):
	@mkdir -p ./cache
	curl -qsL 'https://www.arcgis.com/sharing/rest/content/items/fb894c51e72748ec8004cc582bf27e83/data' > $@

# https://geoportal.statistics.gov.uk/datasets/ons-uprn-directory-may-2020
$(ONSUD_ZIP):
	@mkdir -p ./cache
	curl -qsL 'https://www.arcgis.com/sharing/rest/content/items/68879b4d8da545a395a8bc8b95572e7d/data' > $@

# https://geoportal.statistics.gov.uk/datasets/national-statistics-postcode-lookup-may-2020
$(NSPL_ZIP):
	@mkdir -p ./cache
	curl -qsL 'https://www.arcgis.com/sharing/rest/content/items/ab73ec2e38c04599b64b09b3fa1c3333/data' > $@

# https://geoportal.statistics.gov.uk/datasets/local-authority-districts-may-2020-boundaries-uk-bgc
$(LAD20_GEOJSON):
	@mkdir -p ./cache
	curl -qsL 'https://opendata.arcgis.com/datasets/54b65ffb42c2480b88a20899aff750de_0.geojson' > $@

# https://geoportal.statistics.gov.uk/datasets/local-authority-districts-december-2019-boundaries-uk-bgc 
$(LAD19_GEOJSON):
	@mkdir -p ./cache
	curl -qsL 'https://opendata.arcgis.com/datasets/0e07a8196454415eab18c40a54dfbbef_0.geojson' > $@

# https://www.ordnancesurvey.co.uk/business-government/tools-support/addressbase-premium-support
$(AddressBase_HEADERS_CSV):
	@mkdir -p ./cache
	curl -qsL 'https://www.ordnancesurvey.co.uk/documents/product-support/support/addressbase-premium-header-files.zip' > $@

# https://www.ordnancesurvey.co.uk/business-government/tools-support/addressbase-premium-support
$(AddressBase_CUSTODIANS_ZIP):
	@mkdir -p ./cache
	curl -qsL 'https://www.ordnancesurvey.co.uk/documents/product-support/support/addressbase-local-custodian-codes.zip' > $@

$(CODEPO_ZIP):
	@mkdir -p ./cache
	curl -qsL 'https://api.os.uk/downloads/v1/products/CodePointOpen/downloads?area=GB&format=CSV&redirect' > $@

$(ORGANISATION_CSV):
	@mkdir -p ./var
	curl -qsL 'https://raw.githubusercontent.com/digital-land/organisation-dataset/master/collection/organisation.csv' > $@

#
#  conventional targets
#
init:
	pip3 install -r requirements.txt

clobber:
	rm -rf ./doc/

clean:	clobber
	rm -rf ./var

prune:	clean
	rm -rf ./cache
