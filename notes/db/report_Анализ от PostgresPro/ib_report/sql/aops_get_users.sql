SELECT client.kp_id AS org_id_in_client_portal
	 , client.short_name AS org_name
	 , client.user_short_name AS org_user_name
	 , client.id AS org_id
	 , branch.branch_ids
	 , ext_user.uid AS uuid
	 , ext_user.fio
	 , ext_user.login
	 , ext_user.birth_date
	 , ext_user.email
	 , ext_user.phone_country_code AS phone_code
	 , ext_user.phone_number
	 , ext_user.phone_code_iso
	 , ext_user.phone_full_number
	 , ext_user.is_blocked AS is_login_blocked
	 , ext_user.block_type
	 , employee.job_title
	 , employee.block_type AS emp_block_type
	 , document.series
	 , document.number
	 , document.issue_date
	 , document.issuer
	 , document.issuer_subdivision
	 , document.type_id

	 , CASE
         WHEN ext_user.block_type::text = 'BLOCK_NEWUSER'::text THEN 'NEW'::text
         WHEN ext_user.block_type::text = 'DELETE'::text THEN 'DELETED'::text
         WHEN employee.block_type::text = 'UNBLOCK'::text THEN 'CONNECTED'::text
         WHEN employee.block_type::text = ANY (ARRAY['BLOCK_DBO'::character varying::text, 'BLOCK_AUTO'::character varying::text]) THEN 'DISCONNECTED'::text
         ELSE 'UNDEFINED'::text
       END AS empl_status

     , CASE
         WHEN (ext_user.block_type::text = 'UNBLOCK'::text OR ext_user.block_type IS NULL) AND ext_user.is_blocked = false THEN 'ACTIVE'::text
         WHEN ((ext_user.block_type::text = ANY (ARRAY['BLOCK_DBO'::character varying::text, 'BLOCK_IS'::character varying::text, 'BLOCK_AUTO'::character varying::text, 'BLOCK_NEWUSER'::character varying::text, 'DELETE'::character varying::text])) OR ext_user.block_type IS NULL) AND ext_user.is_blocked = true THEN 'BLOCKED'::text
         ELSE 'UNDEFINED'::text
       END AS user_status

  FROM pa_aops.aops_user_info_snapshot ext_user
  JOIN pa_aops.aops_employee_snapshot employee
    ON employee.external_user = ext_user.uid
  LEFT JOIN pa_aops.aops_client_snapshot client
    ON client.id = employee.client_id
  LEFT JOIN pa_aops.aops_identity_document_snapshot document
    ON document.user_id = ext_user.uid
  LEFT JOIN pa_aops.aops_client_branch_snapshot branch
    ON branch.client_id = client.id
 WHERE (p_org = '{}' OR client.id = ANY(p_org::int[]))
   AND (p_fio = '' OR ext_user.fio ILIKE '%' || p_fio || '%')
   AND (p_job_title = '' OR employee.job_title ILIKE '%' || p_job_title || '%')
   AND (p_uuid = '{}' OR ext_user.uid = ANY(p_uuid::text[]))

 UNION

SELECT client.kp_id AS org_id_in_client_portal
	 , client.short_name AS org_name
	 , client.user_short_name AS org_user_name
	 , client.id AS org_id
	 , COALESCE(branch.branch_ids, jsonb_build_array(jsonb_build_object('id', ps.branch_ext_id))) AS branch_ids
	 , ext_user.uid AS uuid
	 , ext_user.fio
	 , ext_user.login
	 , ext_user.birth_date
	 , ext_user.email
	 , ext_user.phone_country_code AS phone_code
	 , ext_user.phone_number
	 , ext_user.phone_code_iso
	 , ext_user.phone_full_number
	 , ext_user.is_blocked AS is_login_blocked
	 , ext_user.block_type
	 , ps_user.user_position AS job_title
	 , NULL::character varying AS emp_block_type
	 , ps_document.identity_document_series AS series
	 , ps_document.identity_document_number AS number
	 , ps_document.date_of_issue AS issue_date
	 , ps_document.issued_by AS issuer
	 , ps_document.unit_code AS issuer_subdivision
	 , ps_document.id_type_ext_id AS type_id

	 , CASE
         WHEN ext_user.block_type::text = 'BLOCK_NEWUSER'::text THEN 'NEW'::text
         WHEN ext_user.block_type::text = 'DELETE'::text THEN 'DELETED'::text
         WHEN ps.origin::text = 'CLIENT'::text THEN 'REGISTERED_BY_CLIENT'::text
         WHEN ps.origin::text = 'BANK'::text THEN 'REGISTERED_BY_BANK'::text
         ELSE 'UNDEFINED'::text
       END AS empl_status

     , CASE
         WHEN (ext_user.block_type::text = 'UNBLOCK'::text OR ext_user.block_type IS NULL) AND ext_user.is_blocked = false THEN 'ACTIVE'::text
         WHEN ((ext_user.block_type::text = ANY (ARRAY['BLOCK_DBO'::character varying::text, 'BLOCK_IS'::character varying::text, 'BLOCK_AUTO'::character varying::text, 'BLOCK_NEWUSER'::character varying::text, 'DELETE'::character varying::text])) OR ext_user.block_type IS NULL) AND ext_user.is_blocked = true THEN 'BLOCKED'::text
         ELSE 'UNDEFINED'::text
       END AS user_status

  FROM pa_aops.aops_user_info_snapshot ext_user
  LEFT JOIN pa_aops.aops_user ps_user
    ON ps_user.user_ext_id = ext_user.uid
   AND ps_user.change_code = 'ADD'
  JOIN pa_aops.aops_pa_app_of_param_setting ps
    ON ps.id = ps_user.document_id
   AND ps.delete_date IS NULL
   AND (ps.status_base NOT IN ('ru.vtb.lifecycle.model.GenericStatus#EXECUTED', 'ru.vtb.lifecycle.model.RejectedStatus.DETAILS_ERROR',
   							   'ru.vtb.lifecycle.model.RejectedStatus.WRONG_E_SIGNATURE',
   							   'ru.vtb.dbo.app.param.setting.common.enums.ParamSettingStatus#DENIED_BY_BANK'
   							  )
   	   )
  LEFT JOIN pa_aops.aops_client_snapshot client
    ON client.id = ps.client_id
  LEFT JOIN pa_aops.aops_user_identity_document_type ps_document
    ON ps_document.user_id = ps_user.id
  LEFT JOIN pa_aops.aops_client_branch_snapshot branch
    ON branch.client_id = ps.client_ext_id
 WHERE NOT EXISTS (SELECT 1
 					 FROM pa_aops.aops_employee_snapshot employee_x
          			WHERE employee_x.external_user = ext_user.uid
          			  AND employee_x.client_id = client.id
          		  )
   AND (p_org = '{}' OR t.org_id = ANY(p_org::int[]))

 UNION

SELECT client.kp_id AS org_id_in_client_portal
	 , client.short_name AS org_name
	 , client.user_short_name AS org_user_name
	 , client.id AS org_id
	 , branch.branch_ids
	 , request.user_external_id AS uuid
	 , ext_user.fio
	 , ext_user.login

	 , CASE
         WHEN ext_user.birth_date IS NULL THEN request.user_identity_document_birth_date
         ELSE ext_user.birth_date
       END AS birth_date

     , ext_user.email
     , ext_user.phone_country_code AS phone_code
     , ext_user.phone_number
     , ext_user.phone_code_iso
     , ext_user.phone_full_number
     , ext_user.is_blocked AS is_login_blocked
     , ext_user.block_type
     , request.job_position AS job_title
     , NULL::character varying AS emp_block_type
     , request.user_identity_document_series AS series
     , request.user_identity_document_number AS number
     , request.user_identity_document_date_of_issue AS issue_date
     , request.user_identity_document_issued_by AS issuer
     , request.user_identity_document_unit_code AS issuer_subdivision
     , request.user_identity_document_type_external_id AS type_id

     , CASE
         WHEN ext_user.block_type::text = 'BLOCK_NEWUSER'::text THEN 'NEW'::text
         WHEN ext_user.block_type::text = 'DELETE'::text THEN 'DELETED'::text
         WHEN request.type::text = 'OWN'::text THEN 'OWN_REGISTERED'::text
         WHEN request.type::text = 'INVITATION'::text THEN 'REGISTERED_BY_INVITATION'::text
         ELSE 'UNDEFINED'::text
       END AS empl_status

     , CASE
         WHEN (ext_user.block_type::text = 'UNBLOCK'::text OR ext_user.block_type IS NULL) AND ext_user.is_blocked = false THEN 'ACTIVE'::text
         WHEN ((ext_user.block_type::text = ANY (ARRAY['BLOCK_DBO'::character varying::text, 'BLOCK_IS'::character varying::text, 'BLOCK_AUTO'::character varying::text, 'BLOCK_NEWUSER'::character varying::text, 'DELETE'::character varying::text])) OR ext_user.block_type IS NULL) AND ext_user.is_blocked = true THEN 'BLOCKED'::text
         ELSE 'UNDEFINED'::text
       END AS user_status

   FROM pa_aops.aops_user_info_snapshot ext_user
   JOIN pa_aops.aops_join_to_organization_request request
     ON request.user_external_id = ext_user.uid
    AND request.status = 'JTOR_SENT'
   LEFT JOIN pa_aops.aops_client_snapshot client
     ON client.id = request.organization_external_id
   LEFT JOIN pa_aops.aops_client_branch_snapshot branch
     ON branch.client_id = client.id
  WHERE NOT EXISTS (SELECT 1
  					  FROM pa_aops.aops_employee_snapshot employee_x
  					 WHERE employee_x.external_user = ext_user.uid
  					   AND employee_x.client_id = client.id
  				   )
 UNION

SELECT NULL::character varying AS org_id_in_client_portal
	 , NULL::character varying AS org_name
	 , NULL::character varying AS org_user_name
	 , NULL::bigint AS org_id
	 , NULL::jsonb AS branch_ids
	 , ext_user.uid AS uuid
	 , ext_user.fio
	 , ext_user.login
	 , ext_user.birth_date
	 , ext_user.email
	 , ext_user.phone_country_code AS phone_code
	 , ext_user.phone_number
	 , ext_user.phone_code_iso
	 , ext_user.phone_full_number
	 , ext_user.is_blocked AS is_login_blocked
	 , ext_user.block_type
	 , NULL::character varying AS job_title
	 , NULL::character varying AS emp_block_type
	 , document.series
	 , document.number
	 , document.issue_date
	 , document.issuer
	 , document.issuer_subdivision
	 , document.type_id

	 , CASE
         WHEN (ext_user.block_type::text = ANY (ARRAY['BLOCK_NEWUSER'::character varying::text, 'UNBLOCK'::character varying::text, 'BLOCK_DBO'::character varying::text, 'BLOCK_IS'::character varying::text, 'BLOCK_AUTO'::character varying::text])) OR ext_user.block_type IS NULL THEN 'NEW'::text
         WHEN ext_user.block_type::text = 'DELETE'::text THEN 'DELETED'::text
         ELSE 'UNDEFINED'::text
       END AS empl_status

     , CASE
         WHEN (ext_user.block_type::text = 'UNBLOCK'::text OR ext_user.block_type IS NULL) AND ext_user.is_blocked = false THEN 'ACTIVE'::text
         WHEN ((ext_user.block_type::text = ANY (ARRAY['BLOCK_DBO'::character varying::text, 'BLOCK_IS'::character varying::text, 'BLOCK_AUTO'::character varying::text, 'BLOCK_NEWUSER'::character varying::text, 'DELETE'::character varying::text])) OR ext_user.block_type IS NULL) AND ext_user.is_blocked = true THEN 'BLOCKED'::text
         ELSE 'UNDEFINED'::text
       END AS user_status

  FROM pa_aops.aops_user_info_snapshot ext_user
  LEFT JOIN pa_aops.aops_identity_document_snapshot document
    ON document.user_id = ext_user.uid
 WHERE NOT EXISTS (SELECT 1
 					 FROM pa_aops.aops_employee_snapshot employee_x
  					WHERE employee_x.external_user = ext_user.uid:
  				  )
   AND NOT EXISTS (SELECT 1
          			 FROM pa_aops.aops_user ps_user_x
           			 JOIN pa_aops.aops_pa_app_of_param_setting ps_x
           			   ON ps_x.id = ps_user_x.document_id
           			  AND ps_x.delete_date IS NULL
           			  AND ps_x.status_base NOT IN ('ru.vtb.lifecycle.model.GenericStatus#EXECUTED',
           			  							   'ru.vtb.lifecycle.model.RejectedStatus.DETAILS_ERROR',
           			  							   'ru.vtb.lifecycle.model.RejectedStatus.WRONG_E_SIGNATURE',
           			   							   'ru.vtb.dbo.app.param.setting.common.enums.ParamSettingStatus#DENIED_BY_BANK'
           			   							  )
           			WHERE ps_user_x.user_ext_id = ext_user.uid
           			  AND ps_user_x.change_code = 'ADD'
           		  )
   AND NOT EXISTS (SELECT 1
   			  	     FROM pa_aops.aops_join_to_organization_request request_x
    				WHERE request_x.user_external_id = ext_user.uid
    				  AND request_x.status = 'JTOR_SENT'
    			  );

/*Дубликаты*/
"aops_pa_app_of_param_setting_uuid_key" UNIQUE CONSTRAINT, btree (uuid)
"aops_pa_app_of_param_setting_uuid_idx" btree (uuid)

Надо оставить

"edoc_entity_id_idx" btree (uuid, type_id, client_ext_id)

CREATE INDEX au_user_ext_id_change_code_ix ON pa_aops.aops_user(user_ext_id, change_code);

CREATE INDEX auidt_user_id_ix ON pa_aops.aops_user_identity_document_type(user_id);

CREATE INDEX aids_user_id_ix ON pa_aops.aops_identity_document_snapshot(user_id);

CREATE INDEX acbs_client_id_ix ON pa_aops.aops_client_branch_snapshot(client_id);

CREATE INDEX apes_external_user_cleint_id_ix ON pa_aops.aops_employee_snapshot(external_user, client_id);

CREATE INDEX ajtor_user_external_id_statux_ix ON pa_aops.aops_user_info_snapshot(user_external_id, status);
