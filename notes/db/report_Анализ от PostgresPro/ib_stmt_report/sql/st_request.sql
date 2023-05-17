select count(*) as cnt
     , request_origin
     , status
  from stmt.st_request
 where received_date >= now() - $1 ::interval
 group by request_origin, status;

select round(max(extract($1 from (received_date::timestamp - requested_date::timestamp))))
  from stmt.st_request
 where received_date >= now() - $2 ::interval
   and received_date is not null
   and status = $3;

select count(*)
  from stmt.st_request
 where status in ($1, $2)
   and requested_date >= current_timestamp - $3 ::interval
   and requested_date <= current_timestamp - $4 ::interval;

select status, count(*)
  from stmt.st_request
 where requested_date >= now() - $1 ::interval
 group by status
 order by status;

select count(*)
  from stmt.st_request
 where requested_date BETWEEN now() - $1::interval AND now()
   and status = $2;

select case
         when tt is null then $1
         else tt
       end
  from (select round(max(extract($2 from (now()::timestamp - requested_date::timestamp)))) as tt
  	      from stmt.st_request
  	     where received_date >= now() - $3::interval
  	       and bic in ($4, $5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19)
  	   ) a;