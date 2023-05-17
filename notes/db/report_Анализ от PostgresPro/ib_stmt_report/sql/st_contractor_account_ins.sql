insert into st_contractor_account ("number", bic)
select op.payer_account
     , op.payer_bic
  from stmt.st_aoperation op
 where op.statement_id = $1
   and op.credit
   and coalesce(trim(op.payer_account), $3) <> $4
   and coalesce(trim(op.payer_bic), $5) <> $6

 union all

select op.receiver_account
     , op.receiver_bic
  from stmt.st_aoperation op
 where op.statement_id = $2
   and not op.credit
   and coalesce(trim(op.receiver_account), $7) <> $8
   and coalesce(trim(op.receiver_bic), $9) <> $10
    on conflict ("number", bic) do nothing;