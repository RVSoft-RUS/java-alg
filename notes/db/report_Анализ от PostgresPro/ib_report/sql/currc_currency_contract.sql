select *
  from ec_currctr.currc_currency_contract cc
  join ec_currctr.currc_client_snapshot cln
    on cln.id = cc.client_id
   and cln.client_id = $2
 where cc.full_unique_contract_number = $1
   AND cc.status != 'ru.vtb.dbo.ec.cc.model.dto.view.enums.ContractStatus#DELETED'
 order by cc.version_date desc
 limit 1;