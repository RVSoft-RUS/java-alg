select event0_.id as id1_35_
	 , event0_.action_params as action_p2_35_
	 , event0_.announcement_id as announce3_35_
	 , event0_.body as body4_35_
	 , event0_.branch_sender_id as branch_16_35_
	 , event0_.channel as channel5_35_
	 , event0_.delivery_time as delivery6_35_
	 , event0_.encrypted_params as encrypte7_35_
	 , event0_.event_group_code as event_g17_35_
	 , event0_.event_type_id as event_t18_35_
	 , event0_.expiration_time as expirati8_35_
	 , event0_.importance as importan9_35_
	 , event0_.kpi_id as kpi_id10_35_
	 , event0_.object_id as object_11_35_
	 , event0_.params as params12_35_
	 , event0_.processed as process13_35_
	 , event0_.subject as subject14_35_
	 , event0_.ts as ts15_35_
  from ntn.ntn_event event0_
 where event0_.processed = $3
   and (event0_.expiration_time is null or event0_.expiration_time > $1)
 order by event0_.delivery_time asc, event0_.ts desc, event0_.expiration_time desc
 limit $2
   for update of event0_ skip locked;