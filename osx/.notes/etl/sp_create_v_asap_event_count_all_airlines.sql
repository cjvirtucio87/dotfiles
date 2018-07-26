CREATE DEFINER=`etl_automation`@`%` PROCEDURE `sp_create_t_dataload_staging`()
BEGIN

DECLARE cmd TEXT DEFAULT ''; -- error when using VARCHAR(65535) => Column length too big for column 'text' (max = 21845); use BLOB or TEXT instead
DECLARE cur_studyFFname varchar(55);
DECLARE dnaaID VARCHAR(20);
DECLARE startDate DATE;
DECLARE endDate DATE;
DECLARE purgeDate DATE;
DECLARE noRecords INT DEFAULT 0;
DECLARE study VARCHAR(50) DEFAULT '';
DECLARE studyName VARCHAR(60);
DECLARE flightPhase VARCHAR(60);
DECLARE viewName VARCHAR(60);
DECLARE aptFieldName VARCHAR(60);
DECLARE asapFieldNname VARCHAR(60);

DECLARE curStudy CURSOR FOR SELECT study_name FROM asias_etl.t_studies; 
DECLARE CONTINUE HANDLER FOR NOT FOUND SET noRecords = 1;

set session group_concat_max_len = 100000000;

Truncate table asap_staging.`t_dataload_staging`;

			SET cmd = CONCAT('  
 select serverid, dnaa_id, flight_month, departure_airport
            ,arrival_airport, phase_of_flight
            ,case when arrival_airport not in (select airport from asap_metrics.v_nonconus_airports) 
				and departure_airport not in (select airport from asap_metrics.v_nonconus_airports)  then 1 else 0 end as conus_event
            ,airline_type
            from (
 select 
  a.serverid
  ,a.dnaa_id
  ,a.flight_start_date flight_month
,a.location_origin as departure_airport
  ,a.location_destination as arrival_airport
  ,a.location_phase as phase_of_flight
  ,a.commercial_corporate as airline_type
  from asap_metrics.v_archive_extract_all a
 ) d
 ');
  
  
			SET cmd = CONCAT('INSERT INTO t_dataload_staging ', cmd);
			-- SELECT cmd;
			SET @dynamicSql = cmd;
			PREPARE stmt FROM @dynamicSql;
			EXECUTE stmt;
			DEALLOCATE PREPARE stmt;

 
 truncate table asap_staging.t_airport_counts_dataload_no_etms;
 insert into asap_staging.t_airport_counts_dataload_no_etms (select * from asap_staging.v_airport_counts_dataload_no_etms );
 
END
