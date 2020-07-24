## CSV headers

| File | Lines | Size |Columns |
| --- | --- | --- |--- |
| var/AddressBase/BLPU.csv | 39099225 var/AddressBase/BLPU.csv | 5.0G | RECORD_IDENTIFIER, CHANGE_TYPE, PRO_ORDER, UPRN, LOGICAL_STATUS, BLPU_STATE, BLPU_STATE_DATE, PARENT_UPRN, X_COORDINATE, Y_COORDINATE, LATITUDE, LONGITUDE, RPC, LOCAL_CUSTODIAN_CODE, COUNTRY, START_DATE, END_DATE, LAST_UPDATE_DATE, ENTRY_DATE, ADDRESSBASE_POSTAL, POSTCODE_LOCATOR, MULTI_OCC_COUNT |
| var/AddressBase/CLASSIFICATION.csv | 42903662 var/AddressBase/CLASSIFICATION.csv | 5.0G | RECORD_IDENTIFIER, CHANGE_TYPE, PRO_ORDER, UPRN, CLASS_KEY, CLASSIFICATION_CODE, CLASS_SCHEME, SCHEME_VERSION, START_DATE, END_DATE, LAST_UPDATE_DATE, ENTRY_DATE |
| var/AddressBase/DELIVERYPOINTADDRESS.csv | 29453418 var/AddressBase/DELIVERYPOINTADDRESS.csv | 3.9G | RECORD_IDENTIFIER, CHANGE_TYPE, PRO_ORDER, UPRN, UDPRN, ORGANISATION_NAME, DEPARTMENT_NAME, SUB_BUILDING_NAME, BUILDING_NAME, BUILDING_NUMBER, DEPENDENT_THOROUGHFARE, THOROUGHFARE, DOUBLE_DEPENDENT_LOCALITY, DEPENDENT_LOCALITY, POST_TOWN, POSTCODE, POSTCODE_TYPE, DELIVERY_POINT_SUFFIX, WELSH_DEPENDENT_THOROUGHFARE, WELSH_THOROUGHFARE, WELSH_DOUBLE_DEPENDENT_LOCALITY, WELSH_DEPENDENT_LOCALITY, WELSH_POST_TOWN, PO_BOX_NUMBER, PROCESS_DATE, START_DATE, END_DATE, LAST_UPDATE_DATE, ENTRY_DATE |
| var/AddressBase/HEADER.csv | 352 var/AddressBase/HEADER.csv | 24K | RECORD_IDENTIFIER, CUSTODIAN_NAME, LOCAL_CUSTODIAN_NAME, PROCESS_DATE, VOLUME_NUMBER, ENTRY_DATE, TIME_STAMP, VERSION, FILE_TYPE |
| var/AddressBase/LPI.csv | 43689946 var/AddressBase/LPI.csv | 4.8G | RECORD_IDENTIFIER, CHANGE_TYPE, PRO_ORDER, UPRN, LPI_KEY, LANGUAGE, LOGICAL_STATUS, START_DATE, END_DATE, LAST_UPDATE_DATE, ENTRY_DATE, SAO_START_NUMBER, SAO_START_SUFFIX, SAO_END_NUMBER, SAO_END_SUFFIX, SAO_TEXT, PAO_START_NUMBER, PAO_START_SUFFIX, PAO_END_NUMBER, PAO_END_SUFFIX, PAO_TEXT, USRN, USRN_MATCH_INDICATOR, AREA_NAME, LEVEL, OFFICIAL_FLAG |
| var/AddressBase/METADATA.csv | 352 var/AddressBase/METADATA.csv | 128K | RECORD_IDENTIFIER, GAZ_NAME, GAZ_SCOPE, TER_OF_USE, LINKED_DATA, GAZ_OWNER, NGAZ_FREQ, CUSTODIAN_NAME, CUSTODIAN_UPRN, LOCAL_CUSTODIAN_CODE, CO_ORD_SYSTEM, CO_ORD_UNIT, META_DATE, CLASS_SCHEME, GAZ_DATE, LANGUAGE, CHARACTER_SET |
| var/AddressBase/ORGANISATION.csv | 1265705 var/AddressBase/ORGANISATION.csv | 115M | RECORD_IDENTIFIER, CHANGE_TYPE, PRO_ORDER, UPRN, ORG_KEY, ORGANISATION, LEGAL_NAME, START_DATE, END_DATE, LAST_UPDATE_DATE, ENTRY_DATE |
| var/AddressBase/STREET.csv | 1435692 var/AddressBase/STREET.csv | 229M | RECORD_IDENTIFIER, CHANGE_TYPE, PRO_ORDER, USRN, RECORD_TYPE, SWA_ORG_REF_NAMING, STATE, STATE_DATE, STREET_SURFACE, STREET_CLASSIFICATION, VERSION, STREET_START_DATE, STREET_END_DATE, LAST_UPDATE_DATE, RECORD_ENTRY_DATE, STREET_START_X, STREET_START_Y, STREET_START_LAT, STREET_START_LONG, STREET_END_X, STREET_END_Y, STREET_END_LAT, STREET_END_LONG, STREET_TOLERANCE |
| var/AddressBase/STREETDESCRIPTOR.csv | 1550804 var/AddressBase/STREETDESCRIPTOR.csv | 158M | RECORD_IDENTIFIER, CHANGE_TYPE, PRO_ORDER, USRN, STREET_DESCRIPTION, LOCALITY, TOWN_NAME, ADMINISTRATIVE_AREA, LANGUAGE, START_DATE, END_DATE, LAST_UPDATE_DATE, ENTRY_DATE |
| var/AddressBase/SUCCESSOR.csv | 1 var/AddressBase/SUCCESSOR.csv | 4.0K | RECORD_IDENTIFIER, CHANGE_TYPE, PRO_ORDER, UPRN, SUCC_KEY, START_DATE, END_DATE, LAST_UPDATE_DATE, ENTRY_DATE, SUCCESSOR |
| var/AddressBase/TRAILER.csv | 352 var/AddressBase/TRAILER.csv | 16K | RECORD_IDENTIFIER, NEXT_VOLUME_NUMBER, RECORD_COUNT, ENTRY_DATE, TIME_STAMP |
| var/AddressBase/XREF.csv | 190773977 var/AddressBase/XREF.csv | 18G | RECORD_IDENTIFIER, CHANGE_TYPE, PRO_ORDER, UPRN, XREF_KEY, CROSS_REFERENCE, VERSION, SOURCE, START_DATE, END_DATE, LAST_UPDATE_DATE, ENTRY_DATE |
| var/organisation.csv | 421 var/organisation.csv | 156K | organisation, wikidata, name, website, twitter, statistical-geography, boundary, toid, opendatacommunities, opendatacommunities-area, billing-authority, census-area, local-authority-type, combined-authority, esd-inventories, local-resilience-forum, region, addressbase-custodian, start-date, end-date |
| var/uprn.csv | 39173615 var/uprn.csv | 1.7G | uprn, postcode, addressbase-custodian, ONSUD, ONSPD |
| var/organisation.csv | 421 var/organisation.csv | 156K | organisation, wikidata, name, website, twitter, statistical-geography, boundary, toid, opendatacommunities, opendatacommunities-area, billing-authority, census-area, local-authority-type, combined-authority, esd-inventories, local-resilience-forum, region, addressbase-custodian, start-date, end-date |
| var/osopenuprn.csv | 39207496 var/osopenuprn.csv | 1.3G | uprn, latitude, longitude |
| var/codepo.csv | 1706905 var/codepo.csv | 53M | postcode, easting, northing, local-authority-district |
| var/NSPL.csv | 5287456 var/NSPL.csv | 93M | postcode, local-authority-district |
| var/ONSPD.csv | 5287456 var/ONSPD.csv | 93M | postcode, local-authority-district |
| var/ONSUD.csv | 39169639 var/ONSUD.csv | 813M | uprn, local-authority-district |
| var/postcode.csv | 2643729 var/postcode.csv | 92M | postcode, codepo, ONSPD, NSPL |
| var/custodian-lad-count.csv | 7386 var/custodian-lad-count.csv | 192K | addressbase-custodian, ONSUD, ONSPD, count |
| var/postcode-uprn-count.csv | 1715515 var/postcode-uprn-count.csv | 19M | count, postcode |
| var/postcode-lad-uprn-count.csv | 1734225 var/postcode-lad-uprn-count.csv | 52M | postcode, ONSPD, ONSUD, count |
| var/postcode-lad-count.csv | 1715515 var/postcode-lad-count.csv | 18M | count, postcode |