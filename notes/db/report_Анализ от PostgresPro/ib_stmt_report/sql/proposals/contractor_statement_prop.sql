SELECT contractor0_.client_account_id as col_0_0_
  FROM stmt.st_contractor_statement contractor0_
 WHERE contractor0_.client_account_id in ($1)
   AND contractor0_.statement_date = $2
   AND ($3 = $13 AND contractor0_.credit = $14 OR $4 = $15 AND contractor0_.credit = $16)
   AND ($5 = $17 OR contractor0_.contractor_account_id in ($6))
   AND ($7 = $18 OR contractor0_.contractor_bank_id in ($8))
   AND EXISTS (SELECT 1
   				       FROM stmt.st_contractor_account contractor1_
   				      WHERE contractor1_.id = contractor0_.contractor_account_id
   				        AND ($11 = $20 OR contractor1_.bic IN ($12))
   			      )
   AND EXISTS (SELECT 1
   				       FROM stmt.st_contractor_account_relation contractor2_
   				      WHERE contractor2_.contractor_account_id = contractor0_.contractor_account_id
   				        AND ($9 = $19 OR contractor2_.contractor_id IN ($10))
              )
   AND EXISTS (SELECT 1
   				       FROM stmt.st_account_statement_previous_version_chain accountsta3_
   				      WHERE accountsta3_.version_id = contractor0_.statement_id
   			      );