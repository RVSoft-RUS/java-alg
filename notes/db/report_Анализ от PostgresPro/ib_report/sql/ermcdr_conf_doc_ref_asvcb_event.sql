select asvcbevent0_.conf_doc_ref_id as conf_doc2_61_0_
     , asvcbevent0_.id as id1_61_0_
     , asvcbevent0_.id as id1_61_1_
     , asvcbevent0_.conf_doc_ref_id as conf_doc2_61_1_
     , asvcbevent0_.date as date3_61_1_
     , asvcbevent0_.error_message as error_me4_61_1_
     , asvcbevent0_.message as message5_61_1_
     , asvcbevent0_.type as type6_61_1_
  from erm_docs_ref.ermcdr_conf_doc_ref_asvcb_event asvcbevent0_
 where asvcbevent0_.conf_doc_ref_id=$1;