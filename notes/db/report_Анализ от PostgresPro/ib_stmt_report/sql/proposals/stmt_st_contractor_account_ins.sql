insert into stmt.st_contractor_account ("number", bic)
SELECT v.*
  FROM (select op.payer_account
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
       ) v
 WHERE NOT EXISTS (SELECT 1
                     FROM stmt.st_contractor_account s
                    WHERE s."number" = v.receiver_account
                      AND s.bic = v.receiver_bic
                  );