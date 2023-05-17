SELECT identityca0_.employee_id as employee4_20_0_
     , identityca0_.id as id1_20_0_
     , identityca0_.id as id1_20_1_
     , identityca0_.division_code as division2_20_1_
     , identityca0_.doctype_snapshot as doctype_3_20_1_
     , identityca0_.employee_id as employee4_20_1_
     , identityca0_.date_exp as date_exp5_20_1_
     , identityca0_.date as date6_20_1_
     , identityca0_.issuer as issuer7_20_1_
     , identityca0_.main_document as main_doc8_20_1_
     , identityca0_.number as number9_20_1_
     , identityca0_.series as series10_20_1_
     , identityca0_.type_code as type_co11_20_1_
     , identityca0_.type_name as type_na12_20_1_
     , (SELECT LTRIM(RTRIM( CONCAT(identityca0_.series, ' ', identityca0_.number) ))) as formula7_1_
  from salary_empl.empl_identity_card identityca0_
 where identityca0_.employee_id=$1
 order by identityca0_.main_document desc;