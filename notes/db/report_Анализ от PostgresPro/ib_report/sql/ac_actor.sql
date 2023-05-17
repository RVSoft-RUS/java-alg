select distinct businessme7_.signature as col_0_0_
			  , businessme7_.full_auth_only as col_1_0_
			  , businessme8_.forbidden_channels as col_2_0_
		   from ac.ac_actor actor0_
		  inner join ac.ac_actor_role actorroles1_
		     on actorroles1_.actor_id = actor0_.id
		  inner join ac.ac_role_instance roleinstan2_
		     on actorroles1_.role_instance_id=roleinstan2_.id
		   left outer join ac.ac_availability_period availabili3_
		     on availabili3_.actor_role_id = actorroles1_.id
		   left outer join ac.ac_role_template roletempla4_
		     on roletempla4_.id = roleinstan2_.template_id
		   left outer join ac.ac_template_workplace templatewo5_
		     on templatewo5_.template_id = roletempla4_.id
		  inner join ac.ac_permission permission6_
		     on permission6_.role_id = roleinstan2_.id
		  inner join ac.ac_business_method businessme7_
		     on businessme7_.signature = permission6_.business_method_signature
		   left outer join ac.ac_business_method_to_actor businessme8_
		     on ($1=$4 and businessme8_.actor_id=actor0_.id and businessme8_.business_method_signature=businessme7_.signature and
		     	 (businessme8_.forbidden_channels is not null)
		     	)
		  where actor0_.user_id=$2
		    and actor0_.block_type=$5
		    and (templatewo5_.id is null or templatewo5_.workplace_signature=$3)
		    and (availabili3_.id is null or (availabili3_.start_date<=current_timestamp or availabili3_.start_date is null) and
		    	  (availabili3_.end_date>=current_timestamp or availabili3_.end_date is null)
		    	)
		 group by businessme7_.signature , businessme7_.full_auth_only , businessme8_.forbidden_channels;