SELECT client0_.id as id1_27_0_
     , clientmast1_.id as id1_35_1_
     , client0_.block_date as block_da2_27_0_
     , client0_.block_reason as block_re3_27_0_
     , client0_.block_type as block_ty4_27_0_
     , client0_.can_use_qualified_signature as can_use_5_27_0_
     , client0_.client_master_id as client_17_27_0_
     , client0_.combine_status as combine_6_27_0_
     , client0_.combined_client_id as combine18_27_0_
     , client0_.comments as comments7_27_0_
     , client0_.join_to_organization_enabled as join_to_8_27_0_
     , client0_.migrated as migrated9_27_0_
     , client0_.migration_date as migrati10_27_0_
     , client0_.session_duration as session11_27_0_
     , client0_.delete_date_time as delete_12_27_0_
     , client0_.is_deleted as is_dele13_27_0_
     , client0_.two_way_tls as two_way14_27_0_
     , client0_.user_short_name as user_sh15_27_0_
     , client0_.optlock as optlock16_27_0_
     , clientmast1_.auto_create_svo_for_paycur as auto_cre2_35_1_
     , clientmast1_.auto_create_svo_for_trans as auto_cre3_35_1_
     , clientmast1_.client_type_id as client_40_35_1_
     , clientmast1_.comments as comments4_35_1_
     , clientmast1_.cp_synch_date_time as cp_synch5_35_1_
     , clientmast1_.cp_synch_status as cp_synch6_35_1_
     , clientmast1_.ed_author as ed_autho7_35_1_
     , clientmast1_.email as email8_35_1_
     , clientmast1_.fax_code_iso as fax_code9_35_1_
     , clientmast1_.fax_country_code as fax_cou10_35_1_
     , clientmast1_.fax_full_number as fax_ful11_35_1_
     , clientmast1_.fax_number as fax_num12_35_1_
     , clientmast1_.full_name as full_na13_35_1_
     , clientmast1_.head_organization as head_or14_35_1_
     , clientmast1_.head_org_id as head_or41_35_1_
     , clientmast1_.inn as inn15_35_1_
     , clientmast1_.international_full_name as interna16_35_1_
     , clientmast1_.international_name as interna17_35_1_
     , clientmast1_.kp_id as kp_id18_35_1_
     , clientmast1_.legal_form as legal_f42_35_1_
     , clientmast1_.linked_to_cp as linked_19_35_1_
     , clientmast1_.non_synchronized as non_syn20_35_1_
     , clientmast1_.ogrn as ogrn21_35_1_
     , clientmast1_.okpo as okpo22_35_1_
     , clientmast1_.oktmo as oktmo23_35_1_
     , clientmast1_.phone_code_iso as phone_c24_35_1_
     , clientmast1_.phone_country_code as phone_c25_35_1_
     , clientmast1_.phone_full_number as phone_f26_35_1_
     , clientmast1_.phone_number as phone_n27_35_1_
     , clientmast1_.pooling_available as pooling28_35_1_
     , clientmast1_.potential as potenti29_35_1_
     , clientmast1_.registration_date as registr30_35_1_
     , clientmast1_.resident as residen31_35_1_
     , clientmast1_.segment_type_id as segment43_35_1_
     , clientmast1_.short_name as short_n32_35_1_
     , clientmast1_.slx_id as slx_id33_35_1_
     , clientmast1_.delete_date_time as delete_34_35_1_
     , clientmast1_.is_deleted as is_dele35_35_1_
     , clientmast1_.start_service_date as start_s36_35_1_
     , clientmast1_.status as status37_35_1_
     , clientmast1_.optlock as optlock38_35_1_
     , clientmast1_.vip_client as vip_cli39_35_1_
  FROM (SELECT client3_.id
			 , client3_.block_date
			 , client3_.block_reason
			 , client3_.block_type
			 , client3_.can_use_qualified_signature
			 , client3_.client_master_id
			 , client3_.combine_status
			 , client3_.combined_client_id
			 , client3_.comments
			 , client3_.join_to_organization_enabled
			 , client3_.migrated
			 , client3_.migration_date
			 , client3_.session_duration
			 , client3_.delete_date_time
			 , client3_.is_deleted
			 , client3_.two_way_tls
			 , client3_.user_short_name
			 , client3_.optlock
			 , client3_.client_master_id
		  FROM cln_client client3_
		 WHERE CAST(client3_.id AS TEXT) ILIKE $101 OR CAST(client3_.user_short_name AS TEXT) ILIKE $102
		   AND client3_.is_deleted = $112

		 UNION

		SELECT client3_.id
			 , client3_.block_date
			 , client3_.block_reason
			 , client3_.block_type
			 , client3_.can_use_qualified_signature
			 , client3_.client_master_id
			 , client3_.combine_status
			 , client3_.combined_client_id
			 , client3_.comments
			 , client3_.join_to_organization_enabled
			 , client3_.migrated
			 , client3_.migration_date
			 , client3_.session_duration
			 , client3_.delete_date_time
			 , client3_.is_deleted
			 , client3_.two_way_tls
			 , client3_.user_short_name
			 , client3_.optlock
			 , client3_.client_master_id
		  FROM cln_client client3_
		 WHERE EXISTS (SELECT 1
						 FROM cln_client_master_kpp fiscalreas6_
						WHERE fiscalreas6_.client_master_id = client3_.client_master_id
						  AND CAST(fiscalreas6_.kpp AS TEXT) ILIKE $111
					  )
		   AND client3_.is_deleted = $112

		 UNION

		SELECT client3_.id
			 , client3_.block_date
			 , client3_.block_reason
			 , client3_.block_type
			 , client3_.can_use_qualified_signature
			 , client3_.client_master_id
			 , client3_.combine_status
			 , client3_.combined_client_id
			 , client3_.comments
			 , client3_.join_to_organization_enabled
			 , client3_.migrated
			 , client3_.migration_date
			 , client3_.session_duration
			 , client3_.delete_date_time
			 , client3_.is_deleted
			 , client3_.two_way_tls
			 , client3_.user_short_name
			 , client3_.optlock
			 , client3_.client_master_id
		  FROM cln_client client3_
		 WHERE EXISTS (SELECT 1
						 FROM cln_client_master clientmast7_
						WHERE clientmast7_.id = client3_.client_master_id
						  AND (CAST(clientmast7_.id AS TEXT) ILIKE $103 OR CAST(clientmast7_.full_name AS TEXT) ILIKE $104 OR
							   CAST(clientmast7_.international_full_name AS TEXT) ILIKE $105 OR
							   CAST(clientmast7_.international_name AS TEXT) ILIKE $106 OR
							   CAST(clientmast7_.inn AS TEXT) ILIKE $107 OR CAST(clientmast7_.ed_author AS TEXT) ILIKE $108 OR
							   CAST(clientmast7_.ogrn AS TEXT) ILIKE $109 OR CAST(clientmast7_.short_name AS TEXT) ILIKE $110
							  )
					  )
		   AND client3_.is_deleted = $112
		) client0_
   JOIN cln_client_master clientmast1_
     ON clientmast1_.id = client0_.client_master_id
    AND clientmast1_.status <> $113
    AND clientmast1_.potential = $114
  WHERE EXISTS (select clientbran2_.id
 				  from cln_client_branch_relation clientbran2_
 				 where clientbran2_.client_id = client0_.id
 				   and (clientbran2_.branch_id in ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10,
 												   $11, $12, $13, $14, $15, $16, $17, $18, $19, $20,
 												   $21, $22, $23, $24, $25, $26, $27, $28, $29, $30,
 												   $31, $32, $33, $34, $35, $36, $37, $38, $39, $40,
 												   $41, $42, $43, $44, $45, $46, $47, $48, $49, $50,
 												   $51, $52, $53, $54, $55, $56, $57, $58, $59, $60,
 												   $61, $62, $63, $64, $65, $66, $67, $68, $69, $70,
 												   $71, $72, $73, $74, $75, $76, $77, $78, $79, $80,
 												   $81, $82, $83, $84, $85, $86, $87, $88, $89, $90,
 												   $91, $92, $93, $94, $95, $96, $97, $98, $99, $100
 												  )
 					   )
 				)
  ORDER BY case
             when client0_.combine_status is null then $115
             when client0_.combine_status = $116 then $117
             else $118
           end desc, client0_.id asc
  LIMIT $118;