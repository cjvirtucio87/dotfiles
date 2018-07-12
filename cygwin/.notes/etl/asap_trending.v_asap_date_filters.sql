select 
  `v_trending_event_count_all_airlines`.`serverID` AS `serverID`,
  `v_trending_event_count_all_airlines`.`flight_month` AS `flight_month`,
  `v_trending_event_count_all_airlines`.`study_conus_event_count` AS `study_conus_event_count`,
  `v_trending_event_count_all_airlines`.`study_event_count` AS `study_event_count`,
  `v_trending_event_count_all_airlines`.`study_name` AS `study_name`,
  `v_trending_event_count_all_airlines`.`total_conus_event_count` AS `total_conus_event_count`,
  `v_trending_event_count_all_airlines`.`total_event_count` AS `total_event_count`,
  `v_trending_event_count_all_airlines`.`etms_corr_flt_cnt` AS `etms_corr_flt_cnt` 
from 
  `asap_staging`.`v_trending_event_count_all_airlines` 
where 
  `v_trending_event_count_all_airlines`.`serverID` in (select `asap_metrics`.`v_asap_airlines_all_etms`.`serverID` from `asap_metrics`.`v_asap_airlines_all_etms` where (`asap_metrics`.`v_asap_airlines_all_etms`.`carrier_type` = 'Commercial'))
