select bankrate0_.id as id1_19_
	 , bankrate0_.begin_dt as begin_dt2_19_
	 , bankrate0_.bid_rate as bid_rate3_19_
	 , bankrate0_.change_dt as change_d4_19_
	 , bankrate0_.cur1alpha_code as cur5_19_
	 , bankrate0_.cur1num_code as cur6_19_
	 , bankrate0_.cur2alpha_code as cur7_19_
	 , bankrate0_.cur2num_code as cur8_19_
	 , bankrate0_.end_dt as end_dt9_19_
	 , bankrate0_.ext_id as ext_id10_19_
	 , bankrate0_.ext_source_id as ext_sou11_19_
	 , bankrate0_.offer_rate as offer_r12_19_
	 , bankrate0_.range_cur_alpha_code as range_c13_19_
	 , bankrate0_.range_cur_num_code as range_c14_19_
	 , bankrate0_.range_max_amount as range_m15_19_
	 , bankrate0_.range_min_amount as range_m16_19_
	 , bankrate0_.rate_type as rate_ty17_19_
	 , bankrate0_.scale as scale18_19_
	 , bankrate0_.delete_date_time as delete_19_19_
	 , bankrate0_.is_deleted as is_dele20_19_
	 , bankrate0_.term as term21_19_
	 , bankrate0_.value_date as value_d22_19_
	 , bankrate0_.optlock as optlock23_19_
  from fxrate.fxrt_bank_rate bankrate0_
 where bankrate0_.begin_dt <= $1
   and (bankrate0_.end_dt is null or bankrate0_.end_dt>$2)
   and bankrate0_.rate_type = $3
   and (bankrate0_.cur2alpha_code in ($4 , $5 , $6) and bankrate0_.cur1num_code=$7 or
   	    bankrate0_.cur2num_code=$8 and bankrate0_.cur1alpha_code in ($9 , $10 , $11)
   	   )
   and bankrate0_.term = $12
 limit $13;

select bankrate0_.id as id1_19_
	 , bankrate0_.begin_dt as begin_dt2_19_
	 , bankrate0_.bid_rate as bid_rate3_19_
	 , bankrate0_.change_dt as change_d4_19_
	 , bankrate0_.cur1alpha_code as cur5_19_
	 , bankrate0_.cur1num_code as cur6_19_
	 , bankrate0_.cur2alpha_code as cur7_19_
	 , bankrate0_.cur2num_code as cur8_19_
	 , bankrate0_.end_dt as end_dt9_19_
	 , bankrate0_.ext_id as ext_id10_19_
	 , bankrate0_.ext_source_id as ext_sou11_19_
	 , bankrate0_.offer_rate as offer_r12_19_
	 , bankrate0_.range_cur_alpha_code as range_c13_19_
	 , bankrate0_.range_cur_num_code as range_c14_19_
	 , bankrate0_.range_max_amount as range_m15_19_
	 , bankrate0_.range_min_amount as range_m16_19_
	 , bankrate0_.rate_type as rate_ty17_19_
	 , bankrate0_.scale as scale18_19_
	 , bankrate0_.delete_date_time as delete_19_19_
	 , bankrate0_.is_deleted as is_dele20_19_
	 , bankrate0_.term as term21_19_
	 , bankrate0_.value_date as value_d22_19_
	 , bankrate0_.optlock as optlock23_19_
  from fxrate.fxrt_bank_rate bankrate0_
 where bankrate0_.begin_dt <= $1
   and (bankrate0_.end_dt is null or bankrate0_.end_dt>$2)
   and bankrate0_.rate_type = $3
   and bankrate0_.cur2num_code = $4
   and (bankrate0_.cur1alpha_code in ($5 , $6 , $7))
   and bankrate0_.term = $8;