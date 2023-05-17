select edvkexport0_.id as id1_61_
     , edvkexport0_.attachment_id as attachm16_61_
     , edvkexport0_.attachment_type as attachme2_61_
     , edvkexport0_.contract_date as contract3_61_
     , edvkexport0_.contract_number as contract4_61_
     , edvkexport0_.edoc_id as edoc_id5_61_
     , edvkexport0_.edvk_internal_number as edvk_int6_61_
     , edvkexport0_.edvk_process_id as edvk_pro7_61_
     , edvkexport0_.finished_date as finished8_61_
     , edvkexport0_.ref_id as ref_id9_61_
     , edvkexport0_.request_id as request10_61_
     , edvkexport0_.started_date as started11_61_
     , edvkexport0_.two_hundred_thousand_max as two_hun12_61_
     , edvkexport0_.unique_contract_number as unique_13_61_
     , edvkexport0_.upload_information as upload_14_61_
     , edvkexport0_.upload_result as upload_15_61_
  from erm_cti.erm_cti_edvk_export edvkexport0_
 where edvkexport0_.request_id = $1;