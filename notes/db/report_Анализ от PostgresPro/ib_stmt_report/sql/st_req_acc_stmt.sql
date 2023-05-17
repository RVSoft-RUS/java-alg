SELECT distinct on (req.account_bic, req.normalized_date) req.id
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
  LEFT JOIN stmt.st_account_statement fa
    ON fa.account_id = req.account_id
   AND fa.statement_date = to_date(cast(req.normalized_date as text), $8)
   AND fa.statement_date >= to_date(cast($1 as text), $6)
   AND fa.statement_date <= to_date(cast($2 as text), $7)
 WHERE req.account_id in ($3)
   AND req.normalized_date >= $4
   AND req.normalized_date <= $5
   AND fa.statement_id is null
 ORDER BY req.account_bic, req.normalized_date, req.requested_date desc;