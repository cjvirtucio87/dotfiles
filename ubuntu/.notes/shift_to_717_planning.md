no more FFD runs; all 717

asias_metrics schema
- production schema
- will be renamed to asias_metrics_dev (becomes dev) on december 1

asias_metrics_dev
- dev/qa schema
- will be renamed to asias_metrics_qa (becomes qa) on november 5
- the formerly known as FFD will become the dev schema
- there will be a qa1 and qa2

asias_metrics_717
- 717 dev
- will be renamed to asias_metrics (becomes prod) on december 1

reference tables
- tables used to guide the ETL process, but not part of the actual ETL process
- manually configured

admin grant backdoor
- they should have access to ref tables (G_ICAO_CODES and G_REF_AIRCRAFT_CAT)

admin revoke backdoor
- lose access to data tables, but retain access to ref tables
