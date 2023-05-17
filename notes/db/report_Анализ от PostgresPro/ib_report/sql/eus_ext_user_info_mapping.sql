select uidset0_.ext_user_info_master_record_id as ext_user1_27_0_
     , uidset0_.user_id as user_id2_27_0_
  from eus_ext_user_info_mapping uidset0_
 where uidset0_.ext_user_info_master_record_id=$1;