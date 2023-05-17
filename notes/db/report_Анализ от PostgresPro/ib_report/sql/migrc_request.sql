select count(request0_.id) as col_0_0_
  from migrc_request request0_
 where (request0_.status in ($2 , $3))
   and request0_.create_date >= $1;