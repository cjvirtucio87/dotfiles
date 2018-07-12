select 
  `asap_metrics`.`ETMS_MONTHLY_DEP_CORRECTED_COUNTS`.`SERVER_ID` AS `server_ID`,
  `asap_metrics`.`ETMS_MONTHLY_DEP_CORRECTED_COUNTS`.`FLIGHT_MONTH` AS `flight_month`,
  sum(`asap_metrics`.`ETMS_MONTHLY_DEP_CORRECTED_COUNTS`.`CORRECTED_COUNT`) AS `etms_flight_count` from `asap_metrics`.`ETMS_MONTHLY_DEP_CORRECTED_COUNTS` group by `asap_metrics`.`ETMS_MONTHLY_DEP_CORRECTED_COUNTS`.`SERVER_ID`,`asap_metrics`.`ETMS_MONTHLY_DEP_CORRECTED_COUNTS`.`FLIGHT_MONTH`
