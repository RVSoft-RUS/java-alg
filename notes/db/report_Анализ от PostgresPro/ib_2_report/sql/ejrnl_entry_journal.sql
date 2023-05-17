select coalesce(b.cnt,$1) as cnt
     , a.auth_type
  from (select unnest(array[$2, $3, $4, $5]) as auth_type) a
  left join (select count(nullif(id,$6)) as cnt

  				  , case
  				      when certificate_cn is not null and success=$7 then $8
  				      when certificate_cn is null and success=$9 then $10
  				      when certificate_cn is not null and success=$11 then $12
  				      when certificate_cn is null and success=$13 then $14
  				    end as auth_type

  			   from entry_journal.ejrnl_entry_journal
  			  where created_at >= now() - $15::interval group by auth_type
  			) b
    on b.auth_type = a.auth_type;

select ip_address
     , count(*)
  from entry_journal.ejrnl_entry_journal
 where created_at >= now() - $1 ::interval
   and success = $2
   and not(ip_address in ($3,$4,$5,$6,$7,$8,$9,$10,$11,$12))
 group by ip_address
having count(*) > $13;