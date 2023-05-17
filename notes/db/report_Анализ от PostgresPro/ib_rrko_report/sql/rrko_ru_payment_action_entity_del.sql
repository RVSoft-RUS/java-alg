delete
  from rrko.rrko_ru_payment_action_entity r
 where r.ru_payment_id = $1
   and r.point_of_view in ($2, $3)
   and r.actual < $4;