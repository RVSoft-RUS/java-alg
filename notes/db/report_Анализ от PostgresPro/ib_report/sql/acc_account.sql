select distinct account0_.id as id1_0_0_
     , accounttyp1_.id as id1_9_1_
     , accountsta2_.id as id1_8_2_
     , branchsnap3_.id as id1_37_3_
     , accountbal4_.id as id1_2_4_
     , accountext5_.id as id1_6_5_
     , account0_.abs_notification as abs_noti2_0_0_
     , account0_.accept_by_cib as accept_b3_0_0_
     , account0_.accept_by_smb as accept_b4_0_0_
     , account0_.account_active_passive as account_5_0_0_
     , account0_.account_balance_id as account46_0_0_
     , account0_.account_name as account_6_0_0_
     , account0_.account_number as account_7_0_0_
     , account0_.account_state_id as account47_0_0_
     , account0_.account_type_id as account48_0_0_
     , account0_.agreement_date as agreemen8_0_0_
     , account0_.agreement_number as agreemen9_0_0_
     , account0_.basic_linked_to_pkb as basic_l10_0_0_
     , account0_.bic as bic11_0_0_
     , account0_.block_date as block_d12_0_0_
     , account0_.block_reason as block_r13_0_0_
     , account0_.block_type as block_t14_0_0_
     , account0_.branch_id as branch_49_0_0_
     , account0_.client_kpp_id as client_15_0_0_
     , account0_.close_date as close_d16_0_0_
     , account0_.comment as comment17_0_0_
     , account0_.corporate_card as corpora18_0_0_
     , account0_.cur_alphabetic_code as cur_alp19_0_0_
     , account0_.cur_numeric_code as cur_num20_0_0_
     , account0_.currency_id as currenc21_0_0_
     , account0_.custom_card as custom_22_0_0_
     , account0_.develop as develop23_0_0_
     , account0_.fbank_id as fbank_i24_0_0_
     , account0_.gos as gos25_0_0_
     , account0_.irreducable_sum_available as irreduc26_0_0_
     , account0_.kib_available as kib_ava27_0_0_
     , account0_.last_modify_date as last_mo28_0_0_
     , account0_.last_synchronization as last_sy29_0_0_
     , account0_.main_page_sorting as main_pa30_0_0_
     , account0_.master_abs as master_31_0_0_
     , account0_.money_owner_deputed_acc as money_o32_0_0_
     , account0_.okv_name as okv_nam33_0_0_
     , account0_.open_date as open_da34_0_0_
     , account0_.overnight_account as overnig35_0_0_
     , account0_.payer_deputed_acc as payer_d36_0_0_
     , account0_.delete_date_time as delete_37_0_0_
     , account0_.is_deleted as is_dele38_0_0_
     , account0_.swift_code as swift_c39_0_0_
     , account0_.third_acc_bank_ru_bic as third_a40_0_0_
     , account0_.third_party_account as third_p41_0_0_
     , account0_.trust_management as trust_m42_0_0_
     , account0_.uuid as uuid43_0_0_, account0_.optlock as optlock44_0_0_
     , account0_.visible_for_dbo as visible45_0_0_
     , accounttyp1_.abs_code as abs_code2_9_1_
     , accounttyp1_.account_special_type as account_3_9_1_
     , accounttyp1_.account_type_code as account_4_9_1_
     , accounttyp1_.full_name as full_nam5_9_1_
     , accounttyp1_.open_by_client as open_by_6_9_1_
     , accounttyp1_.set_inf_account as set_inf_7_9_1_
     , accounttyp1_.short_name as short_na8_9_1_
     , accounttyp1_.delete_date_time as delete_d9_9_1_
     , accounttyp1_.is_deleted as is_dele10_9_1_
     , accounttyp1_.ui_full_name as ui_full11_9_1_
     , accounttyp1_.optlock as optlock12_9_1_
     , accountsta2_.account_special_type as account_2_8_2_
     , accountsta2_.external_id as external3_8_2_
     , accountsta2_.full_name as full_nam4_8_2_
     , accountsta2_.delete_date_time as delete_d5_8_2_
     , accountsta2_.is_deleted as is_delet6_8_2_
     , accountsta2_.system as system7_8_2_
     , accountsta2_.optlock as optlock8_8_2_
     , branchsnap3_.bank_int_id as bank_int2_37_3_
     , branchsnap3_.bic as bic3_37_3_
     , branchsnap3_.branch_code as branch_c4_37_3_
     , branchsnap3_.branch_type as branch_t5_37_3_
     , branchsnap3_.centralized_documentary as centrali6_37_3_
     , branchsnap3_.cib as cib7_37_3_
     , branchsnap3_.city_id as city_id8_37_3_
     , branchsnap3_.city_name as city_nam9_37_3_
     , branchsnap3_.code_tfu as code_tf10_37_3_
     , branchsnap3_.comment as comment11_37_3_
     , branchsnap3_.correspondent_accounts as corresp12_37_3_
     , branchsnap3_.currency_trifle as currenc13_37_3_
     , branchsnap3_.full_name as full_na14_37_3_
     , branchsnap3_.full_name_ext as full_na15_37_3_
     , branchsnap3_.head_branch_id as head_br16_37_3_
     , branchsnap3_.inf_res_acc_online as inf_res17_37_3_
     , branchsnap3_.is_not_active as is_not_18_37_3_
     , branchsnap3_.kgrko_number as kgrko_n19_37_3_
     , branchsnap3_.kpp as kpp20_37_3_
     , branchsnap3_.master_abs as master_21_37_3_
     , branchsnap3_.place_ext as place_e22_37_3_
     , branchsnap3_.registration_number as registr23_37_3_
     , branchsnap3_.res_acc_online as res_acc24_37_3_
     , branchsnap3_.short_name as short_n25_37_3_
     , branchsnap3_.short_name_int as short_n26_37_3_
     , branchsnap3_.delete_date_time as delete_27_37_3_
     , branchsnap3_.is_deleted as is_dele28_37_3_
     , branchsnap3_.swift_code as swift_c29_37_3_
     , branchsnap3_.time_zone as time_zo30_37_3_
     , accountbal4_.actual_balance as actual_b2_2_4_
     , accountbal4_.actual_date_time as actual_d3_2_4_
     , accountbal4_.available_balance as availabl4_2_4_
     , accountbal4_.blocked_sum as blocked_5_2_4_
     , accountbal4_.carded_sum as carded_s6_2_4_
     , accountbal4_.cart as cart7_2_4_
     , accountbal4_.date_actuality_cart as date_act8_2_4_
     , accountbal4_.gos_balance as gos_bala9_2_4_
     , accountbal4_.irreducible_balance as irreduc10_2_4_
     , accountbal4_.is_blocked as is_bloc11_2_4_
     , accountbal4_.month_limit_balance as month_l12_2_4_
     , accountbal4_.overdraft_sum as overdra13_2_4_
     , accountbal4_.planing_balance as planing14_2_4_
     , accountbal4_.delete_date_time as delete_15_2_4_
     , accountbal4_.is_deleted as is_dele16_2_4_
     , accountbal4_.optlock as optlock17_2_4_
     , accountext5_.account_id as account_7_6_5_
     , accountext5_.inn as inn2_6_5_
     , accountext5_.short_name as short_na3_6_5_
     , accountext5_.delete_date_time as delete_d4_6_5_
     , accountext5_.is_deleted as is_delet5_6_5_
     , accountext5_.optlock as optlock6_6_5_
  from account.acc_account account0_
  left outer join acc_account_type accounttyp1_
    on account0_.account_type_id=accounttyp1_.id
  left outer join acc_account_state accountsta2_
    on account0_.account_state_id=accountsta2_.id
  left outer join acc_brn_branch_snapshot branchsnap3_
    on account0_.branch_id=branchsnap3_.id
  left outer join acc_account_balance accountbal4_
    on account0_.account_balance_id=accountbal4_.id
  left outer join acc_account_extension accountext5_
    on account0_.id=accountext5_.account_id
 where (0=1 or 1=1 and 1=1)
   and account0_.is_deleted=$1
   and account0_.visible_for_dbo=$2
   and account0_.third_party_account=$3
   and 1=1
   and (account0_.account_state_id in ($4, $5))
 order by account0_.main_page_sorting asc
 limit $6;

SELECT distinct account0_.id as id1_0_0_
     , accounttyp1_.id as id1_9_1_
     , accountsta2_.id as id1_8_2_
     , branchsnap3_.id as id1_37_3_
     , accountbal4_.id as id1_2_4_
     , accountext5_.id as id1_6_5_
     , account0_.abs_notification as abs_noti2_0_0_
     , account0_.accept_by_cib as accept_b3_0_0_
     , account0_.accept_by_smb as accept_b4_0_0_
     , account0_.account_active_passive as account_5_0_0_
     , account0_.account_balance_id as account46_0_0_
     , account0_.account_name as account_6_0_0_
     , account0_.account_number as account_7_0_0_
     , account0_.account_state_id as account47_0_0_
     , account0_.account_type_id as account48_0_0_
     , account0_.agreement_date as agreemen8_0_0_
     , account0_.agreement_number as agreemen9_0_0_
     , account0_.basic_linked_to_pkb as basic_l10_0_0_
     , account0_.bic as bic11_0_0_
     , account0_.block_date as block_d12_0_0_
     , account0_.block_reason as block_r13_0_0_
     , account0_.block_type as block_t14_0_0_
     , account0_.branch_id as branch_49_0_0_
     , account0_.client_kpp_id as client_15_0_0_
     , account0_.close_date as close_d16_0_0_
     , account0_.comment as comment17_0_0_
     , account0_.corporate_card as corpora18_0_0
     , account0_.cur_alphabetic_code as cur_alp19_0_0_
     , account0_.cur_numeric_code as cur_num20_0_0_
     , account0_.currency_id as currenc21_0_0_
     , account0_.custom_card as custom_22_0_0_
     , account0_.develop as develop23_0_0_
     , account0_.fbank_id as fbank_i24_0_0_
     , account0_.gos as gos25_0_0_
     , account0_.irreducable_sum_available as irreduc26_0_0_
     , account0_.kib_available as kib_ava27_0_0_
     , account0_.last_modify_date as last_mo28_0_0_
     , account0_.last_synchronization as last_sy29_0_0_
     , account0_.main_page_sorting as main_pa30_0_0_
     , account0_.master_abs as master_31_0_0_
     , account0_.money_owner_deputed_acc as money_o32_0_0_
     , account0_.okv_name as okv_nam33_0_0_
     , account0_.open_date as open_da34_0_0_
     , account0_.overnight_account as overnig35_0_0_
     , account0_.payer_deputed_acc as payer_d36_0_0_
     , account0_.delete_date_time as delete_37_0_0_
     , account0_.is_deleted as is_dele38_0_0_
     , account0_.swift_code as swift_c39_0_0_
     , account0_.third_acc_bank_ru_bic as third_a40_0_0_
     , account0_.third_party_account as third_p41_0_0_
     , account0_.trust_management as trust_m42_0_0_
     , account0_.uuid as uuid43_0_0_
     , account0_.optlock as optlock44_0_0_
     , account0_.visible_for_dbo as visible45_0_0_
     , accounttyp1_.abs_code as abs_code2_9_1_
     , accounttyp1_.account_special_type as account_3_9_1_
     , accounttyp1_.account_type_code as account_4_9_1_
     , accounttyp1_.full_name as full_nam5_9_1_
     , accounttyp1_.open_by_client as open_by_6_9_1_
     , accounttyp1_.set_inf_account as set_inf_7_9_1_
     , accounttyp1_.short_name as short_na8_9_1_
     , accounttyp1_.delete_date_time as delete_d9_9_1_
     , accounttyp1_.is_deleted as is_dele10_9_1_
     , accounttyp1_.ui_full_name as ui_full11_9_1_
     , accounttyp1_.optlock as optlock12_9_1_
     , accountsta2_.account_special_type as account_2_8_2_
     , accountsta2_.external_id as external3_8_2_
     , accountsta2_.full_name as full_nam4_8_2_
     , accountsta2_.delete_date_time as delete_d5_8_2_
     , accountsta2_.is_deleted as is_delet6_8_2_
     , accountsta2_.system as system7_8_2_
     , accountsta2_.optlock as optlock8_8_2_
     , branchsnap3_.bank_int_id as bank_int2_37_3_
     , branchsnap3_.bic as bic3_37_3_
     , branchsnap3_.branch_code as branch_c4_37_3_
     , branchsnap3_.branch_type as branch_t5_37_3_
     , branchsnap3_.centralized_documentary as centrali6_37_3_
     , branchsnap3_.cib as cib7_37_3_
     , branchsnap3_.city_id as city_id8_37_3_
     , branchsnap3_.city_name as city_nam9_37_3_
     , branchsnap3_.code_tfu as code_tf10_37_3_
     , branchsnap3_.comment as comment11_37_3_
     , branchsnap3_.correspondent_accounts as corresp12_37_3_
     , branchsnap3_.currency_trifle as currenc13_37_3_
     , branchsnap3_.full_name as full_na14_37_3_
     , branchsnap3_.full_name_ext as full_na15_37_3_
     , branchsnap3_.head_branch_id as head_br16_37_3_
     , branchsnap3_.inf_res_acc_online as inf_res17_37_3_
     , branchsnap3_.is_not_active as is_not_18_37_3_
     , branchsnap3_.kgrko_number as kgrko_n19_37_3_
     , branchsnap3_.kpp as kpp20_37_3_
     , branchsnap3_.master_abs as master_21_37_3_
     , branchsnap3_.place_ext as place_e22_37_3_
     , branchsnap3_.registration_number as registr23_37_3_
     , branchsnap3_.res_acc_online as res_acc24_37_3_
     , branchsnap3_.short_name as short_n25_37_3_
     , branchsnap3_.short_name_int as short_n26_37_3_
     , branchsnap3_.delete_date_time as delete_27_37_3_
     , branchsnap3_.is_deleted as is_dele28_37_3_
     , branchsnap3_.swift_code as swift_c29_37_3_
     , branchsnap3_.time_zone as time_zo30_37_3_
     , accountbal4_.actual_balance as actual_b2_2_4_
     , accountbal4_.actual_date_time as actual_d3_2_4_
     , accountbal4_.available_balance as availabl4_2_4_
     , accountbal4_.blocked_sum as blocked_5_2_4_
     , accountbal4_.carded_sum as carded_s6_2_4_
     , accountbal4_.cart as cart7_2_4_
     , accountbal4_.date_actuality_cart as date_act8_2_4_
     , accountbal4_.gos_balance as gos_bala9_2_4_
     , accountbal4_.irreducible_balance as irreduc10_2_4_
     , accountbal4_.is_blocked as is_bloc11_2_4_
     , accountbal4_.month_limit_balance as month_l12_2_4_
     , accountbal4_.overdraft_sum as overdra13_2_4_
     , accountbal4_.planing_balance as planing14_2_4_
     , accountbal4_.delete_date_time as delete_15_2_4_
     , accountbal4_.is_deleted as is_dele16_2_4_
     , accountbal4_.optlock as optlock17_2_4_
     , accountext5_.account_id as account_7_6_5_
     , accountext5_.inn as inn2_6_5_
     , accountext5_.short_name as short_na3_6_5_
     , accountext5_.delete_date_time as delete_d4_6_5_
     , accountext5_.is_deleted as is_delet5_6_5_
     , accountext5_.optlock as optlock6_6_5_
  FROM account.acc_brn_branch_snapshot branchsnap3_
  JOIN account.acc_account account0_
    ON account0_.branch_id = branchsnap3_.id
   and account0_.is_deleted = $101
   and account0_.visible_for_dbo = $102
   and account0_.third_party_account=$103
   and account0_.account_state_id in ($104, $105)
  left outer join account.acc_account_type accounttyp1_
    on accounttyp1_.id = account0_.account_type_id
  left outer join account.acc_account_state accountsta2_
    on accountsta2_.id = account0_.account_state_id
  left outer join account.acc_account_balance accountbal4_
    on accountbal4_.id = account0_.account_balance_id
  left outer join account.acc_account_extension accountext5_
    on accountext5_.account_id = account0_.id
 WHERE branchsnap3_.id in ($1 , $2 , $3 , $4 , $5 , $6 , $7 , $8 , $9 , $10 , $11 , $12 , $13 , $14 , $15 , $16 , $17 , $18 , $19 , $20 , $21 , $22 , $23 , $24 ,
                           $25, $26 , $27, $28 , $29 , $30 , $31 , $32 , $33 , $34 , $35 , $36 , $37 , $38 , $39 , $40 , $41 , $42 , $43 , $44 , $45 , $46 , $47,
                           $48, $49 , $50, $51 , $52 , $53 , $54 , $55 , $56 , $57 , $58 , $59 , $60 , $61 , $62 , $63 , $64 , $65 , $66 , $67 , $68 , $69 , $70,
                           $71, $72 , $73, $74 , $75 , $76 , $77 , $78 , $79 , $80 , $81 , $82 , $83 , $84 , $85 , $86 , $87 , $88 , $89 , $90 , $91 , $92 , $93,
                           $94, $95 , $96, $97 , $98 , $99 , $100
                          )
 order by account0_.main_page_sorting asc
 limit $106;