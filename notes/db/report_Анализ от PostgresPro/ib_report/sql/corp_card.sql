EXPLAIN
SELECT c.*
  FROM corp_card.cc_cln_client_informational_id_snapshot c
 WHERE c.system = 4
   AND c.is_deleted = false
   AND NOT EXISTS (SELECT 1
                     FROM corp_card.cc_subscription s
                    WHERE s.client_id = c.client_id
                  )
   AND EXISTS (SELECT 1
                 FROM corp_card.cc_account a
                WHERE a.client_id = c.client_id
                  AND a.type_id = 13
                  AND a.state_id = 2
              );