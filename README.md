# How to find the local authority for an address

[Guidance](https://digital-land.github.io/local-authority-addresses) to help people building a government or other public service determine the local authority which an individual property or premises resides.

The guidance was informed by an [analysis](https://digital-land.github.io/local-authority-addresses/analysis) of addresses in England
using a [spatialite](https://www.gaia-gis.it/fossil/libspatialite/index) database which may be explored using the accompanying [datasette](https://datasette.readthedocs.io/en/stable/) server and [Jupyter](https://jupyter.org/) notebook.

<a href="https://www.flickr.com/photos/psd/50165771136/in/dateposted-public/" title="Spatialite schema"><img src="https://live.staticflickr.com/65535/50165771136_255fe99b5b_c.jpg" alt="Spatialite schema"></a>

# Data sources

The following data sources are downloaded by the [build](Makefile) process:

  * [ONS National Statistics Postcode Lookup (ONSNSPL)](https://geoportal.statistics.gov.uk/search?collection=Dataset&sort=name&tags=all(PRD_NSPL))
  * [ONS Postcode Directory (ONSPD)](https://geoportal.statistics.gov.uk/search?collection=Dataset&sort=name&tags=all(PRD_ONSPD))
  * [ONS UPRN Directory (UD)](https://geoportal.statistics.gov.uk/search?collection=Dataset&sort=name&tags=all(PRD_ONSUD))
  * [OS Code Point Open (codepo)](https://www.ordnancesurvey.co.uk/business-government/products/code-point-open)

The proprietary AddressBase dataset, has to be ordered and downloaded manually from the OS data portal:

  * [OS AddressBase Premium](https://www.ordnancesurvey.co.uk/business-government/products/addressbase-premium)

# Building the guidance and database

We recommend working in [virtual environment](http://docs.python-guide.org/en/latest/dev/virtualenvs/) before installing the python dependencies:

    $ make init
    $ make

Downloading the data and building the database and indexes can take more than an hour on an modern laptop.
To just build the guidance and content:

    $ make docs

You can explore the data in a browser using datasette:

    $ make serve

# Licence

The software in this project is open source and covered by the [LICENSE](LICENSE) file.

Data from [Office for National Statistics](https://www.ons.gov.uk/methodology/geography/licences) is licensed under the [Open Government Licence v.3.0](http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/).

UPRNs and their locations are published here under the [Open Government Licence v.3.0](http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/) as set out in the [OS Open ID policy](https://www.ordnancesurvey.co.uk/business-government/tools-support/open-mastermap-programme/open-id-policy).

Postcode and other data from OS codepo and OS AddressBase requires the attribution:
* Contains OS data © Crown copyright and database right 2020
* Contains Royal Mail data © Royal Mail copyright and Database right 2020
* Contains National Statistics data © Crown copyright and database right 2020

Otherwise all content and data in this repository is
[© Crown copyright](http://www.nationalarchives.gov.uk/information-management/re-using-public-sector-information/copyright-and-re-use/crown-copyright/)
and available under the terms of the [Open Government 3.0](https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/) licence.
