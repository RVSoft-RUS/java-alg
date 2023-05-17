select distinct contractor0_.id as id1_62_
	 , contractor0_.bic as bic2_62_
	 , contractor0_.number as number3_62_
  from stmt.st_contractor_account contractor0_
  join stmt.st_contractor_interaction contractor1_
    on contractor0_.id = contractor1_.contractor_account_id
 where contractor1_.statement_date between $6 and $7
   and contractor1_.client_account_id in ($1 , $2 , $3 , $4 , $5);