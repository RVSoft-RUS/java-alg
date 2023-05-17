select accountlin0_.id as id1_6_1_
     , accountlin0_.account_id as account_3_6_1_
     , accountlin0_.e_uid as e_uid2_6_1_
     , accountlin0_.link_edoc_id as link_edo4_6_1_
     , params1_.account_link_id as account_5_7_3_
     , params1_.id as id1_7_3_
     , params1_.id as id1_7_0_
     , params1_.account_link_id as account_5_7_0_
     , params1_.doc_param_id as doc_para6_7_0_
     , params1_.doc_param_code as doc_para2_7_0_
     , params1_.value as value3_7_0_
     , params1_.value_num as value_nu4_7_0_
  from rgacc.rgacc_account_link_edoc accountlin0_
  left outer join rgacc.rgacc_account_link_edoc_param params1_
    on params1_.account_link_id = accountlin0_.id
 where accountlin0_.id = $1;