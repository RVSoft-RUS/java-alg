SELECT req.id
	  , req.account_id
	  , req.account
	  , req.bic
	  , req.normalized_date
	  , req.status
	  , req.received_date
	  , req.requested_date
	  , req.is_final
	  , req.third_party_account
  FROM stmt.st_request req
 WHERE req.normalized_date >= $4
   AND req.normalized_date <= $5
   AND req.account_id in ($3)
   AND NOT EXISTS (SELECT 1
     			         FROM stmt.st_account_statement fa
   				     WHERE fa.account_id = req.account_id
   				       AND fa.statement_date = to_date(cast(req.normalized_date as text), $8)
   				       AND fa.statement_date >= to_date(cast($1 as text), $6)
   				       AND fa.statement_date <= to_date(cast($2 as text), $7)
   			      )
 ORDER BY req.account_bic, req.normalized_date, req.requested_date desc;