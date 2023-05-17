select currencytr0_.id as id1_55_
     , currencytr0_.archive_date as archive_2_55_
     , currencytr0_.branch_ext_id as branch_e3_55_
     , currencytr0_.channel as channel4_55_
     , currencytr0_.client_ext_id as client_e5_55_
     , currencytr0_.create_date as create_d6_55_
     , currencytr0_.delete_date as delete_d7_55_
     , currencytr0_.document_date as document8_55_
     , currencytr0_.document_number as document9_55_
     , currencytr0_.document_number_as_num as documen10_55_
     , currencytr0_.edoc_ref_id as edoc_re11_55_
     , currencytr0_.exporting_to_abs as exporti12_55_
     , currencytr0_.import_date as import_13_55_
     , currencytr0_.last_modify_date as last_mo14_55_
     , currencytr0_.last_modify_user_ext_id as last_mo15_55_
     , currencytr0_.last_modify_user_snapshot as last_mo16_55_
     , currencytr0_.note_from_receiver as note_fr17_55_
     , currencytr0_.read as read18_55_
     , currencytr0_.receive_date as receive19_55_
     , currencytr0_.send_date as send_da20_55_
     , currencytr0_.source_id as source_21_55_
     , currencytr0_.status_action as status_22_55_
     , currencytr0_.status_bank_backend_response_message as status_23_55_
     , currencytr0_.status_base as status_24_55_
     , currencytr0_.status_comment as status_25_55_
     , currencytr0_.status_extended as status_26_55_
     , currencytr0_.note_from_bank_author as note_fr27_55_
     , currencytr0_.note_from_bank_comment as note_fr28_55_
     , currencytr0_.note_from_bank_create_date as note_fr29_55_
     , currencytr0_.note_from_bank_fio as note_fr30_55_
     , currencytr0_.type_id as type_id31_55_
     , currencytr0_.uuid as uuid32_55_
     , currencytr0_.abs_doc_ref as abs_doc33_55_
     , currencytr0_.abs_doc_ref_ext as abs_doc34_55_
     , currencytr0_.account as account35_55_
     , currencytr0_.authorized_bank as authori36_55_
     , currencytr0_.auto_created as auto_cr37_55_
     , currencytr0_.bank_sign_date as bank_si38_55_
     , currencytr0_.view_form as view_fo39_55_
     , currencytr0_.edk_command_uuid as edk_com40_55_
     , currencytr0_.execution_date as executi41_55_
     , currencytr0_.executor_fio as executo42_55_
     , currencytr0_.executor_id as executo43_55_
     , currencytr0_.executor_uid as executo44_55_
     , currencytr0_.ext_id as ext_id45_55_
     , currencytr0_.external_account_operation_option as externa46_55_
     , currencytr0_.external_system as externa47_55_
     , currencytr0_.foreign_country as foreign48_55_
     , currencytr0_.head_branch_snapshot as head_br49_55_
     , currencytr0_.import_date_time as import_50_55_
     , currencytr0_.import_session_id as import_51_55_
     , currencytr0_.initial_channel as initial52_55_
     , currencytr0_.optlock_version as optlock53_55_
     , currencytr0_.print_form_attachment_id as print_f56_55_
     , currencytr0_.status_date as status_54_55_
     , currencytr0_.vk_plan_date as vk_plan55_55_
     , COALESCE((Select t.account_user_name
     	           from ec_cti_acc_account_user_name_snapshot t
     	          where (t.account_id = (currencytr0_.account ->> $6)::numeric)
     	            and (NOT t.is_deleted)
     	            and (t.user_id) = $7
     	          limit $8
     	         )
     , (currencytr0_.account->$9->$10->>$11)
     , (currencytr0_.account->$12->>$13)) as formula1_
     , ((Select t2.branch_snapshot
     	   from ec_cti.ec_cti_edoc_ref t1, ec_cti.ec_cti_edoc_branch_snapshot t2
     	  where t1.branch_snapshot_id = t2.id
     	    and t1.edoc_id = currencytr0_.id
     	  limit $14)->>$15) as formula2_
     , ((Select t2.client_snapshot
     	   from ec_cti.ec_cti_edoc_ref t1, ec_cti.ec_cti_edoc_client_snapshot t2
     	  where t1.client_snapshot_id = t2.id
     	    and t1.edoc_id = currencytr0_.id
     	  limit $16)->>$17
        ) as formula3_

     , case
         when jsonb_extract_path_text(currencytr0_.status_extended, $18) = $19 then $20 else $21
       end as formula4_
  from ec_cti_currency_transactions_info currencytr0_
 where ($22=$23 or $24=$25 and $26=$27)
   and (currencytr0_.status_base in ($1 , $2 , $3 , $4))
 limit $5;

select currencytr0_.id as id1_55_5_
     , currencytr0_.archive_date as archive_2_55_5_
     , currencytr0_.branch_ext_id as branch_e3_55_5_
     , currencytr0_.channel as channel4_55_5_
     , currencytr0_.client_ext_id as client_e5_55_5_
     , currencytr0_.create_date as create_d6_55_5_
     , currencytr0_.delete_date as delete_d7_55_5_
     , currencytr0_.document_date as document8_55_5_
     , currencytr0_.document_number as document9_55_5_
     , currencytr0_.document_number_as_num as documen10_55_5_
     , currencytr0_.edoc_ref_id as edoc_re11_55_5_
     , currencytr0_.exporting_to_abs as exporti12_55_5_
     , currencytr0_.import_date as import_13_55_5_
     , currencytr0_.last_modify_date as last_mo14_55_5_
     , currencytr0_.last_modify_user_ext_id as last_mo15_55_5_
     , currencytr0_.last_modify_user_snapshot as last_mo16_55_5_
     , currencytr0_.note_from_receiver as note_fr17_55_5_
     , currencytr0_.read as read18_55_5_
     , currencytr0_.receive_date as receive19_55_5_
     , currencytr0_.send_date as send_da20_55_5_
     , currencytr0_.source_id as source_21_55_5_
     , currencytr0_.status_action as status_22_55_5_
     , currencytr0_.status_bank_backend_response_message as status_23_55_5_
     , currencytr0_.status_base as status_24_55_5_
     , currencytr0_.status_comment as status_25_55_5_
     , currencytr0_.status_extended as status_26_55_5_
     , currencytr0_.note_from_bank_author as note_fr27_55_5_
     , currencytr0_.note_from_bank_comment as note_fr28_55_5_
     , currencytr0_.note_from_bank_create_date as note_fr29_55_5_
     , currencytr0_.note_from_bank_fio as note_fr30_55_5_
     , currencytr0_.type_id as type_id31_55_5_
     , currencytr0_.uuid as uuid32_55_5_
     , currencytr0_.abs_doc_ref as abs_doc33_55_5_
     , currencytr0_.abs_doc_ref_ext as abs_doc34_55_5_
     , currencytr0_.account as account35_55_5_
     , currencytr0_.authorized_bank as authori36_55_5_
     , currencytr0_.auto_created as auto_cr37_55_5_
     , currencytr0_.bank_sign_date as bank_si38_55_5_
     , currencytr0_.view_form as view_fo39_55_5_
     , currencytr0_.edk_command_uuid as edk_com40_55_5_
     , currencytr0_.execution_date as executi41_55_5_
     , currencytr0_.executor_fio as executo42_55_5_
     , currencytr0_.executor_id as executo43_55_5_
     , currencytr0_.executor_uid as executo44_55_5_
     , currencytr0_.ext_id as ext_id45_55_5_
     , currencytr0_.external_account_operation_option as externa46_55_5_
     , currencytr0_.external_system as externa47_55_5_
     , currencytr0_.foreign_country as foreign48_55_5_
     , currencytr0_.head_branch_snapshot as head_br49_55_5_
     , currencytr0_.import_date_time as import_50_55_5_
     , currencytr0_.import_session_id as import_51_55_5_
     , currencytr0_.initial_channel as initial52_55_5_
     , currencytr0_.optlock_version as optlock53_55_5_
     , currencytr0_.print_form_attachment_id as print_f56_55_5_
     , currencytr0_.status_date as status_54_55_5_
     , currencytr0_.vk_plan_date as vk_plan55_55_5_
     , COALESCE((Select t.account_user_name
                   from ec_cti.ec_cti_acc_account_user_name_snapshot t
                  where (t.account_id = (currencytr0_.account ->> 'id')::numeric) and (NOT t.is_deleted) and (t.user_id) = 'svc-dbo2-eccti' limit 1
                )

     , (currencytr0_.account->'accountType'->'fullNameLocalized'->>'ru_RU')
     , (currencytr0_.account->'accountType'->>'fullName')) as formula1_5_

     , ((Select t2.branch_snapshot
           from ec_cti.ec_cti_edoc_ref t1, ec_cti.ec_cti_edoc_branch_snapshot t2
          where t1.branch_snapshot_id = t2.id
            and t1.edoc_id = currencytr0_.id limit 1)->>'shortName'
       ) as formula2_5_

     , ((Select t2.client_snapshot
           from ec_cti.ec_cti_edoc_ref t1, ec_cti.ec_cti_edoc_client_snapshot t2
          where t1.client_snapshot_id = t2.id
            and t1.edoc_id = currencytr0_.id limit 1)->>'shortName'
       ) as formula3_5_

     , case when jsonb_extract_path_text(currencytr0_.status_extended, 'messageKey') = 'REJECT_NOT_ACKNOWLEDGED' then 1 else 2 end as formula4_5_
     , edocref1_.id as id1_76_0_
     , edocref1_.branch_snapshot_id as branch_s4_76_0_
     , edocref1_.client_snapshot_id as client_s5_76_0_
     , edocref1_.edoc_class_name as edoc_cla2_76_0_
     , edocref1_.edoc_id as edoc_id3_76_0_
     , edocbranch2_.id as id1_73_1_
     , edocbranch2_.branch_snapshot as branch_s2_73_1_
     , edocclient3_.id as id1_74_2_
     , edocclient3_.client_snapshot as client_s2_74_2_
     , docids4_.edoc_ref_id as edoc_ref4_80_7_
     , docids4_.id as id1_80_7_
     , docids4_.id as id1_80_3_
     , docids4_.edoc_ref_id as edoc_ref4_80_3_
     , docids4_.source_id as source_i2_80_3_
     , docids4_.source_type_id as source_t3_80_3_
     , attachment5_.id as id1_28_4_
     , attachment5_.attachment_id as attachme2_28_4_
     , attachment5_.creation_time as creation3_28_4_
     , attachment5_.edoc_ref_id as edoc_ref4_28_4_
     , attachment5_.client_ext_id as client_e5_28_4_
     , attachment5_.type_id as type_id6_28_4_
     , attachment5_.uuid as uuid7_28_4_
     , attachment5_.extension as extensio8_28_4_
     , attachment5_.file_name as file_nam9_28_4_
     , attachment5_.hash as hash10_28_4_
     , attachment5_.size as size11_28_4_
     , attachment5_.type_ext_id as type_ex12_28_4_
  from ec_cti.ec_cti_currency_transactions_info currencytr0_
 inner join ec_cti.ec_cti_edoc_ref edocref1_
    on edocref1_.id = currencytr0_.edoc_ref_id
  left outer join ec_cti.ec_cti_edoc_branch_snapshot edocbranch2_
    on edocbranch2_.id = edocref1_.branch_snapshot_id
  left outer join ec_cti.ec_cti_edoc_client_snapshot edocclient3_
    on edocclient3_.id = edocref1_.client_snapshot_id
  left outer join ec_cti.ec_cti_external_link docids4_
    on docids4_.edoc_ref_id = edocref1_.id
  left outer join ec_cti.ec_cti_attachment attachment5_
    on attachment5_.id = currencytr0_.print_form_attachment_id
 where currencytr0_.id=$1
 order by docids4_.id asc;