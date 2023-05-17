select background0_.id as id1_0_
	 , background0_.additional_information as addition2_0_
	 , background0_.completed as complete3_0_
	 , background0_.end_time as end_time4_0_
	 , background0_.failed as failed5_0_
	 , background0_.group_id as group_id6_0_
	 , background0_.parameters as paramete7_0_
	 , background0_.result as result8_0_
	 , background0_.result_url as result_u9_0_
	 , background0_.sending_status as sending10_0_
	 , background0_.service_id as service11_0_
	 , background0_.start_time as start_t12_0_
	 , background0_.status as status13_0_
	 , background0_.time_left as time_le14_0_
	 , background0_.total as total15_0_
	 , background0_.type as type16_0_
	 , background0_.user_id as user_id17_0_
	 , background0_.user_type as user_ty18_0_
  from rndr.rndr_background_operations background0_
 where background0_.sending_status in ($1 , $2);