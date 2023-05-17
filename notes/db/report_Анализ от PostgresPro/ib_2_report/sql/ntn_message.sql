select message0_.id as id1_45_
	 , message0_.aggregation_event_id as aggrega28_45_
	 , message0_.announcement_id as announce2_45_
	 , message0_.attempts as attempts3_45_
	 , message0_.body as body4_45_
	 , message0_.branch_id as branch_i5_45_
	 , message0_.branch_sender_id as branch_29_45_
	 , message0_.branch_short_name as branch_s6_45_
	 , message0_.category as category7_45_
	 , message0_.channel_id as channel_8_45_
	 , message0_.client_id as client_i9_45_
	 , message0_.client_international_name as client_10_45_
	 , message0_.client_short_name as client_11_45_
	 , message0_.configuration_id as configu12_45_
	 , message0_.created_at as created13_45_
	 , message0_.delivery_time as deliver14_45_
	 , message0_.encrypted_body as encrypt15_45_
	 , message0_.event_id as event_i30_45_
	 , message0_.event_group_code as event_g31_45_
	 , message0_.expiration_time as expirat16_45_
	 , message0_.importance as importa17_45_
	 , message0_.jms_correlation_id as jms_cor18_45_
	 , message0_.jms_message_id as jms_mes19_45_
	 , message0_.language as languag20_45_
	 , message0_.signature as signatu21_45_
	 , message0_.status as status22_45_
	 , message0_.subject as subject23_45_
	 , message0_.subject_ext as subject24_45_
	 , message0_."to" as to25_45_
	 , message0_.unp_error_code as unp_err26_45_
	 , message0_.unp_message_uuid as unp_mes27_45_
	 , message0_.user_id as user_id32_45_
	 , message0_.user_type as user_ty33_45_
  from ntn_message message0_
 where $12=$13 and $14=$15 and $16=$17 and $18=$19 and $20=$21 and $22=$23
   and coalesce(message0_.expiration_time, cast($1 as timestamp))>=$2
   and message0_.category=$3 and $24=$25 and $26=$27 and $28=$29
   and (message0_.status in ($4 , $5)) and (message0_.channel_id in ($6 , $7 , $8))
   and (message0_.user_id, message0_.user_type)=($9, $10)
  order by message0_.created_at desc limit $11

select count(message0_.id) as col_0_0_
  from ntn_message message0_
 where coalesce(message0_.expiration_time, cast($1 as timestamp)) >= $2
   and message0_.category = $3
   and message0_.status in ($4, $5)
   and message0_.channel_id in ($6 , $7 , $8)
   and message0_.user_id = $9
   and message0_.user_type = $10;

select count(*) as EMAIL
  from ntn.ntn_message
 where channel_id = $1
   and status = $2
   and created_at >= now() - $3::interval;

select count(*) as SMS
  from ntn.ntn_message
 where channel_id = $1
   and status = $2
   and created_at >= now() - $3 ::interval;

select message0_.id as id1_46_
	 , message0_.aggregation_event_id as aggrega28_46_
	 , message0_.announcement_id as announce2_46_
	 , message0_.attempts as attempts3_46_
	 , message0_.body as body4_46_
	 , message0_.branch_id as branch_i5_46_
	 , message0_.branch_sender_id as branch_29_46_
	 , message0_.branch_short_name as branch_s6_46_
	 , message0_.category as category7_46_
	 , message0_.channel_id as channel_8_46_
	 , message0_.client_id as client_i9_46_
	 , message0_.client_international_name as client_10_46_
	 , message0_.client_short_name as client_11_46_
	 , message0_.configuration_id as configu12_46_
	 , message0_.created_at as created13_46_
	 , message0_.delivery_time as deliver14_46_
	 , message0_.encrypted_body as encrypt15_46_
	 , message0_.event_id as event_i30_46_
	 , message0_.event_group_code as event_g31_46_
	 , message0_.expiration_time as expirat16_46_
	 , message0_.importance as importa17_46_
	 , message0_.jms_correlation_id as jms_cor18_46_
	 , message0_.jms_message_id as jms_mes19_46_
	 , message0_.language as languag20_46_
	 , message0_.signature as signatu21_46_
	 , message0_.status as status22_46_
	 , message0_.subject as subject23_46_
	 , message0_.subject_ext as subject24_46_
	 , message0_."to" as to25_46_
	 , message0_.unp_error_code as unp_err26_46_
	 , message0_.unp_message_uuid as unp_mes27_46_
	 , message0_.user_id as user_id32_46_
	 , message0_.user_type as user_ty33_46_
  from ntn.ntn_message message0_
  join ntn.ntn_event event1_
    on event1_.id = message0_.event_id
   AND event1_.event_type_id = $1
   and ($4 is null or event1_.object_id = $5)
  join ntn.ntn_user_info_snapshot userinfosn2_
    on userinfosn2_.user_id = message0_.user_id
   and userinfosn2_.user_type = message0_.user_type
   and message0_.user_type = $3
 where message0_.user_id = $2
 order by message0_.created_at DESC
 limit $6;