SELECT COUNT(*) AS rp_cnt

     , COUNT(*) FILTER (WHERE r.delete_date IS NULL AND r.status_base NOT IN ('ru.vtb.lifecycle.model.RejectedStatus#REJECTED',
						   													  'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#NONE',
						   													  'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#IMPORTING',
						   													  'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#TEMPLATE',
						   													  'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#DRAFT',
						   													  'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#IMPORT_ERROR',
						   													  'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#TEMPLATE'
						   													 )
     				   ) AS filter_cnt1

     , COUNT(*) FILTER (WHERE r.contractor_restriction_check_date IS NOT NULL AND r.contractor_restriction_list_id IS NOT NULL) AS filter_cnt2

     , COUNT(*) FILTER (WHERE r.delete_date IS NULL AND r.status_base IN ('ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#DRAFT',
     																	  'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#IMPORT_ERROR',
     																	  'ru.vtb.lifecycle.model.NewEdocStatus#NEW'
     																	 )
     				   ) AS filter_cnt3

     , COUNT(*) FILTER (WHERE r.delete_date IS NULL) AS del_dt_empty_cnt

     , COUNT(*) FILTER (WHERE r.role_template_signature IS NULL) AS rol_templ_sign_is_empty_cnt

     , COUNT(*) FILTER (WHERE r.delete_date IS NULL AND
     					 	  r.status_base NOT IN ('ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#NONE',
     						  					    'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#IMPORTING',
     						 					    'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#DELETED')
     				   ) AS filter_cnt4

     , COUNT(*) FILTER (WHERE r.delete_date IS NULL AND
     						  r.status_base NOT IN ('ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#DELETED',
     						 					    'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#NONE',
     						 					    'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#IMPORTING',
     						 					    'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#TEMPLATE',
     						 					    'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#DRAFT',
     						 					    'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#IMPORT_ERROR'
     						 					   )
     				   ) AS filter_cnt5

     , COUNT(*) FILTER (WHERE r.status_base IN ('ru.vtb.lifecycle.model.RejectedStatus#REJECTED',
 					   						    'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#EXPORT_ABS_ERROR',
 					   						    'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#EXPORT_RSA_ERROR',
 					   						    'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#CUT_OFF_TIME_FAILED',
 					   						    'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#WAITING_FOR_VALUE_DATE',
 					   						    'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#SUSPECT_FRAUD',
 					   						    'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#IN_PROCESS_FRAUD',
 					   						    'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#WAITING_FOR_CONFIRMATION_FRAUD',
 					   						    'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#REVIEW_AML',
 					   						    'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#BUDGET_CONTROL_SENDING_ERROR',
 					   						    'ru.vtb.lifecycle.model.NewEdocStatus#NEW',
 					   						    'ru.vtb.lifecycle.model.PartlySignedStatus#PARTLY_SIGNED',
 					   						    'ru.vtb.lifecycle.model.GenericStatus#SIGNED',
 					   						    'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#WAITING_FOR_ACCEPT',
 					   						    'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#WRONG_E_SIGNATURE',
 					   						    'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#DETAILS_ERROR',
 					   						    'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#CONFIRMED_FRAUD_BY_BANK',
 					   						    'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#CONFIRMED_FRAUD_BY_CLIENT',
 					   						    'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#DENY_AF',
 					   						    'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#DENY_AML',
 					   						    'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#BC_DENIED_ACCEPTED',
 					   						    'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#FOR_ACCEPT',
 					   						    'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#PARTLY_ACCEPTED',
 					   						    'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#FOR_ACCEPT_BC',
 					   						    'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#PARTLY_ACCEPTED_BC')
     				   ) AS filter_cnt6
  FROM rrko.rrko_ru_payment r;