insert into st_contractor_account_relation (contractor_id, contractor_account_id)
SELECT v.*
  FROM (select co.id AS co_id
	 		 , ca.id AS ca_id
	 	  from stmt.st_aoperation op
	 	  join stmt.st_contractor co
	 	    on co.inn = op.payer_inn
	 	  join stmt.st_contractor_account ca
	 	    on ca."number" = op.payer_account
	 	   and ca.bic = op.payer_bic
	 	 where op.statement_id = $1
	 	   and op.credit

	 	 union all

	 	select co.id AS co_id
	 		 , ca.id AS ca_id
	 	  from stmt.st_aoperation op
	 	  join stmt.st_contractor co
	 	    on co.inn = op.receiver_inn
	 	  join stmt.st_contractor_account ca
	 	    on ca."number" = op.receiver_account
	 	   and ca.bic = op.receiver_bic
	 	 where op.statement_id = $2
	 	   and not op.credit
       ) v
 WHERE NOT EXISTS (SELECT 1
 					 FROM stmt.st_contractor_account_relation sc
 					WHERE sc.contractor_id = v.co_id
 					  AND sc.contractor_account_id = v.ca_id
 				  );