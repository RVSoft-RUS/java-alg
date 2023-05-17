select actions0_.event_id as event_id6_19_0_
	 , actions0_.id as id1_19_0_
	 , actions0_.id as id1_19_1_
	 , actions0_.action_params as action_p2_19_1_
	 , actions0_.action_type as action_t3_19_1_
	 , actions0_.business_method as business4_19_1_
	 , actions0_.component_type as componen5_19_1_
	 , actions0_.event_id as event_id6_19_1_
	 , actions0_.href as href7_19_1_
	 , actions0_.description as descript8_19_1_
	 , actions0_.href_title as href_tit9_19_1_
	 , actions0_.icon as icon10_19_1_
  from ntn.ntn_action_event actions0_
 where actions0_.event_id = $1;