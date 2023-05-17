select distinct contractor0_.client_account_id as col_0_0_
  from stmt.st_contractor_statement contractor0_
  join stmt.st_contractor_account contractor1_
    on contractor1_.id = contractor0_.contractor_account_id
   and ($11 = $20 or contractor1_.bic in ($12))
  join stmt.st_contractor_account_relation contractor2_
    on contractor2_.contractor_account_id = contractor1_.id
   and ($9 = $19 or contractor2_.contractor_id in ($10))
  join stmt.st_account_statement_previous_version_chain accountsta3_
    on accountsta3_.version_id = contractor0_.statement_id
 where contractor0_.client_account_id in ($1)
   and contractor0_.statement_date = $2
   and ($3 = $13 and contractor0_.credit = $14 or $4 = $15 and contractor0_.credit = $16)
   and ($5 = $17 or contractor0_.contractor_account_id in ($6))
   and ($7 = $18 or contractor0_.contractor_bank_id in ($8));