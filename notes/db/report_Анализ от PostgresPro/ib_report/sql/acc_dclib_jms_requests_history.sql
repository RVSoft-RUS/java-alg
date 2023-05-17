select jmsrequest0_.correl_id as col_0_0_
  from acc_dclib_jms_requests_history jmsrequest0_
 where jmsrequest0_.creation_date < $1
 limit $2