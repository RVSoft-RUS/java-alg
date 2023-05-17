insert into st_contractor_statement as ci (client_account_id, contractor_account_id, statement_id, operation_id, credit, deleted_at, statement_date, contractor_bank_id)
select st.account_id
     , ca.id
     , op.statement_id
     , op.id
     , op.credit
     , op.deleted_at
     , op.statement_date
     , cb.id
  from st_aoperation op
  join st_astatement st
    on st.id = op.statement_id
  join st_contractor_account ca
    on ca."number" = op.payer_account
   and ca.bic = op.payer_bic
  left join st_contractor_bank cb
    on cb.bic = op.payer_bic
   and cb.name = op.payer_bank_name
 where op.credit
   and op.statement_id = $1

 union all

select st.account_id
     , ca.id
     , op.statement_id
     , op.id
     , op.credit
     , op.deleted_at
     , op.statement_date
     , cb.id
  from st_aoperation op
  join st_astatement st
    on st.id = op.statement_id
  join st_contractor_account ca
    on ca."number" = op.receiver_account
   and ca.bic = op.receiver_bic
  left join st_contractor_bank cb
    on cb.bic = op.receiver_bic
   and cb.name = op.receiver_bank_name
 where not op.credit
   and op.statement_id = $2;