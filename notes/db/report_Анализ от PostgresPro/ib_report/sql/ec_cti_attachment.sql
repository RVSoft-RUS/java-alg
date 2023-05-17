select attachment0_.currency_operation_id as currenc13_28_0_
	 , attachment0_.id as id1_28_0_
	 , attachment0_.id as id1_28_1_
	 , attachment0_.attachment_id as attachme2_28_1_
	 , attachment0_.creation_time as creation3_28_1_
	 , attachment0_.edoc_ref_id as edoc_ref4_28_1_
	 , attachment0_.client_ext_id as client_e5_28_1_
	 , attachment0_.type_id as type_id6_28_1_
	 , attachment0_.uuid as uuid7_28_1_
	 , attachment0_.extension as extensio8_28_1_
	 , attachment0_.file_name as file_nam9_28_1_
	 , attachment0_.hash as hash10_28_1_
	 , attachment0_.size as size11_28_1_
	 , attachment0_.type_ext_id as type_ex12_28_1_
  from ec_cti_attachment attachment0_
 where attachment0_.currency_operation_id=$1;