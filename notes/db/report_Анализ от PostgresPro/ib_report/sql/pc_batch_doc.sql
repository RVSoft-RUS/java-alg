SELECT count(batchdoc0_.id) as col_0_0_
  from pc.pc_batch_doc batchdoc0_
  join pc.pc_batch_doc_sign batchdocsi1_
    on batchdocsi1_.id = batchdoc0_.id
   and batchdocsi1_.sign_object is not null
 where batchdoc0_.batch_id = $1
   and batchdoc0_.doc_pushed_status = $2