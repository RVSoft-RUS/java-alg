delete
  from stmt.st_contractor_interaction ci
 using stmt.st_account_statement ast
 where ci.client_account_id = ast.account_id
   and ci.statement_date = ast.statement_date
   and ast.statement_id = $1;