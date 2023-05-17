select background0_.id as id1_42_
	 , background0_.additional_information as addition2_42_
	 , background0_.completed as complete3_42_
	 , background0_.end_time as end_time4_42_
	 , background0_.failed as failed5_42_
	 , background0_.group_id as group_id6_42_
	 , background0_.parameters as paramete7_42_
	 , background0_.result as result8_42_
	 , background0_.result_url as result_u9_42_
	 , background0_.sending_status as sending10_42_
	 , background0_.service_id as service11_42_
	 , background0_.start_time as start_t12_42_
	 , background0_.status as status13_42_
	 , background0_.time_left as time_le14_42_
	 , background0_.total as total15_42_
	 , background0_.type as type16_42_
	 , background0_.user_id as user_id17_42_
	 , background0_.user_type as user_ty18_42_
  from stmt.st_background_operations background0_
 where background0_.sending_status in ($1 , $2);