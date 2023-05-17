select attachment0_.currency_operation_id as currenc13_29_0_
	 , attachment0_.id as id1_29_0_
	 , attachment0_.id as id1_29_1_
	 , attachment0_.attachment_id as attachme2_29_1_
	 , attachment0_.creation_time as creation3_29_1_
	 , attachment0_.edoc_ref_id as edoc_ref4_29_1_
	 , attachment0_.client_ext_id as client_e5_29_1_
	 , attachment0_.type_id as type_id6_29_1_
	 , attachment0_.uuid as uuid7_29_1_
	 , attachment0_.extension as extensio8_29_1_
	 , attachment0_.file_name as file_nam9_29_1_
	 , attachment0_.hash as hash10_29_1_
	 , attachment0_.size as size11_29_1_
	 , attachment0_.type_ext_id as type_ex12_29_1_
 from erm_cti_attachment attachment0_
where attachment0_.currency_operation_id=$1;