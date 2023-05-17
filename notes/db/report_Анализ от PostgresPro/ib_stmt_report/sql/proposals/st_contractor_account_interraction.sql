SELECT contractor0_.id as id1_62_
	 , contractor0_.bic as bic2_62_
	 , contractor0_.number as number3_62_
  FROM stmt.st_contractor_account contractor0_
 WHERE EXISTS (SELECT 1
 				 FROM stmt.st_contractor_interaction contractor1_
 				WHERE contractor1_.contractor_account_id = contractor0_.id
 				  AND contractor1_.statement_date BETWEEN $6 AND $7
 				  AND contractor1_.client_account_id IN ($1, $2, $3, $4, $5)
 			  );