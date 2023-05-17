delete
  from rrko.rrko_doc_signer
 where user_id = $1
   and exists (select 1
 				 from rrko.rrko_doc_sign docsign1_
 				where docsign1_.doc_id = rrko_doc_signer.doc_id
 				  and docsign1_.doc_type_id = rrko_doc_signer.doc_type_id
 				  and docsign1_.sign_party = $2
 			   )
   and exists (select 1
    			 from rrko.rrko_doc_sign_org docsignorg2_
    			where docsignorg2_.doc_id = rrko_doc_signer.doc_id
    			  and docsignorg2_.doc_type_id = rrko_doc_signer.doc_type_id
    			  and docsignorg2_.org_id = $3
    		  );