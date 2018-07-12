select 
  `a`.`server_id` AS `serverID`,
  `a`.`flight_month` AS `flight_month`,
  coalesce(`a`.`study_conus_event_count`,0) AS `study_conus_event_count`,
  coalesce(`a`.`study_event_count`,0) AS `study_event_count`,
  `a`.`study_name` AS `study_name`,
  coalesce(`b`.`asap_report_count_conus`,0) AS `total_conus_event_count`,
  coalesce(`b`.`asap_report_count_total`,0) AS `total_event_count`,
  coalesce(`f`.`etms_flight_count`,0) AS `etms_corr_flt_cnt` from ((`asap_staging`.`t_trending_counts_by_airline` `a` left join `asap_staging`.`t_trending_counts_by_airline_type` `b` on(((`a`.`flight_month` = `b`.`flight_month`) and (`a`.`study_name` = `b`.`study_name`) and (`b`.`airline_type` = 'Commercial')))) left join `asias_etl`.`support_v_dep_etms_counts_mnth_serverid` `f` on(((`a`.`flight_month` = `f`.`flight_month`) and (`a`.`server_id` = `f`.`server_ID`))))
