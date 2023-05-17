select count(*)
     , date_trunc($1,dt) as time
  from ( select create_date as dt
           from rrko.rrko_ru_payment
          where create_date >= now() - $2 ::interval

          union

         select import_date
           from rrko.rrko_ru_payment
          where import_date >= now() - $3 ::interval
       ) R
 group by date_trunc('hour',dt)
 order by date_trunc('hour',dt);