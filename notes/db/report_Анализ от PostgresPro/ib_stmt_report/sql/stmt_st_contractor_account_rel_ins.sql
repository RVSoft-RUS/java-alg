insert into st_contractor_account_relation (contractor_id, contractor_account_id)
select co.id
	   , ca.id
  from st_aoperation op
  join st_contractor co
    on co.inn = op.payer_inn
  join st_contractor_account ca
    on ca."number" = op.payer_account
   and ca.bic = op.payer_bic
 where op.statement_id = $1
   and op.credit

 union all

select co.id
     , ca.id
  from st_aoperation op
  join st_contractor co
    on co.inn = op.receiver_inn
  join st_contractor_account ca
    on ca."number" = op.receiver_account
   and ca.bic = op.receiver_bic
 where op.statement_id = $2
   and not op.credit
    on conflict (contractor_id, contractor_account_id) do nothing;