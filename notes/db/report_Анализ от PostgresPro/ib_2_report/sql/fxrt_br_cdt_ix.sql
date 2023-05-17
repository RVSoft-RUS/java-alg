select case when count(*) > $1 then $2 else $3 end as "Курсы AXIOMA"
  from fxrate.fxrt_bank_rate
 where change_dt >= current_date;

CREATE INDEX fxrt_br_cdt_ix ON fxrate.fxrt_bank_rate(change_dt);