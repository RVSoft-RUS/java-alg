select id
  from migrc.migrc_process_continue_signal
 where continue_at <= $1
   and instance = $2
   and process_id in ($3)
 order by priority, random()
 limit $4;