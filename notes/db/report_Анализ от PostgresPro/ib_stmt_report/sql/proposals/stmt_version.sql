SELECT stm.id
     , stm.date_actuality
     , stm.credit_count
     , stm.debit_count
     , accstm.id IS NULL AS flag_archive
     , stm.account_id
     , stm.normalized_date
  FROM (SELECT ast.id
     		     , ast.date_actuality
     		     , ast.credit_count
     		     , ast.debit_count
     		     , ast.normalized_date
     		     , ast.account_id
  		    FROM stmt.st_astatement ast
 		     WHERE ast.account_id = $1
   		     AND ast.normalized_date = $2

 		     UNION ALL

		    SELECT cst.id
     		     , cst.date_actuality
     		     , cst.credit_count
     		     , сst.debit_count
     		     , cst.normalized_date
     		     , cst.account_id
  		    FROM stmt.st_cstatement cst
 		     WHERE cst.account_id = $1
   		     AND cst.normalized_date = $2
	     ) v
  LEFT JOIN stmt.st_account_statement accstm
    ON accstm.statement_id = stm.id
  LEFT JOIN stmt.st_contractor_statement contractor1_
    ON contractor1_.statement_id = stm.id
 WHERE contractor1_.contractor_account_id IN ($3, $4)
 ORDER BY basestatem0_.date_actuality DESC;