CREATE INDEX rrko_ru_payment_check_document_number_for_unique_rule_idx
    ON rrko.rrko_ru_payment(document_number, client_ext_id)
 WHERE delete_date IS NULL
   AND status_base NOT IN ('ru.vtb.lifecycle.model.RejectedStatus#REJECTED',
                           'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#DELETED',
                           'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#NONE',
                           'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#IMPORTING',
                           'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#TEMPLATE',
                           'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#DRAFT',
                           'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#IMPORT_ERROR'
                          );

CREATE INDEX rrko_ru_payment_client_contractor_check_date_payer_receiver_idx
    ON rrko.rrko_ru_payment(client_ext_id, contractor_restriction_list_id, contractor_restriction_check_date, payer_account,
    						            receiver_account, payer_bank_bic, receiver_bank_bic, amount
                           )
 WHERE contractor_restriction_check_date IS NOT NULL
   AND contractor_restriction_list_id IS NOT NULL;

CREATE INDEX rrko_ru_payment_client_ext_id_document_date_id_statusfilter_idx
    ON rrko.rrko_ru_payment(client_ext_id, document_date DESC NULLS LAST, id DESC NULLS LAST)
 WHERE delete_date IS NULL
   AND (status_base IN ('ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#DRAFT',
   	                    'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#IMPORT_ERROR',
   	                    'ru.vtb.lifecycle.model.NewEdocStatus#NEW')
       );

CREATE INDEX rrko_ru_payment_client_ext_id_is_allowed_statuses_idx
    ON rrko.rrko_ru_payment(client_ext_id, status_base, delete_date)
 WHERE delete_date IS NULL
   AND status_base NOT IN ('ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#NONE',
                           'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#IMPORTING',
                           'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#DELETED');

CREATE INDEX rrko_ru_payment_document_number_document_date_partial_idx
    ON rrko.rrko_ru_payment(document_number, document_date DESC)
 WHERE delete_date IS NULL
   AND status_base NOT IN ('ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#DELETED',
                           'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#NONE',
                           'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#IMPORTING',
                           'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#TEMPLATE',
                           'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#DRAFT',
                           'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#IMPORT_ERROR');

CREATE INDEX rrko_ru_payment_id_cold_data_modify_date_idx
    ON rrko.rrko_ru_payment(id, cold_data, last_modify_date)
 WHERE status_base IN ('ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#ACCEPTED',
                       'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#ACCEPTED_WITH_SIGNATURE_CORRECT',
                       'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#BC_ACCEPTED',
                       'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#BC_DENIED_ACCEPTED',
 					   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#BUDGET_CONTROL_SENDING_ERROR',
 					   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#CONFIRMED_FRAUD_BY_BANK',
 					   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#CONFIRMED_FRAUD_BY_CLIENT',
 					   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#CORRECT_SIGNATURE',
 					   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#CORRECT_SIGNATURE_KMO',
 					   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#CORRECT_SIGNATURE_VALUE_DATE',
 					   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#CUT_OFF_TIME_FAILED',
 					   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#DELETED',
 					   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#DELIVERED_SIGNATURE_CORRECT_AFTER_VALUE_DATE',
 					   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#DENIED_ACCEPT',
 					   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#DRAFT',
 					   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#EXECUTED',
 					   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#EXPORT_ABS_ERROR',
 					   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#EXPORT_RSA_ERROR',
 					   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#EXPORTED_TO_ABS',
 					   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#EXPORTED_TO_RSA',
 					   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#EXPORTING_TO_ABS',
 					   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#EXPORTING_TO_RSA',
 					   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#FOR_CHECK_SIGNATURE_DETAILS'
 					   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#FOR_CHECK_SIGNATURE_DETAILS_KMO',
 					   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#FOR_EXPORT_TO_ABS',
 					   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#IMPORT_ERROR',
 					   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#IMPORTING',
 					   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#IN_PROCESS_FRAUD',
 					   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#INCORRECT_DETAILS',
 					   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#INCORRECT_SIGNATURE',
 					   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#NEGATIVE_FRAUD_BY_BANK',
 					   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#NEGATIVE_FRAUD_BY_CLIENT',
 					   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#NONE',
 					   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#ON_BUDGET_CONTROL',
 					   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#OVERDUE_PAYMENTS',
 					   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#PARTIALLY_EXECUTED',
 					   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#PARTLY_ACCEPTED',
 					   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#RECEIVED',
 					   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#REQUEST_DOC',
 					   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#REVIEWED_BY_CLIENT',
 					   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#SUSPECT_FRAUD',
 					   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#SUSPEND_275FZ',
 					   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#TEMPLATE',
 					   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#WAITING_ACCEPT_KMO',
 					   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#WAITING_FOR_ACCEPT',
 					   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#WAITING_FOR_CONFIRMATION_FRAUD',
 					   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#WAITING_FOR_VALUE_DATE');

CREATE INDEX rrko_ru_payment_id_cold_data_modify_date_idx
    ON rrko.rrko_ru_payment(id, last_modify_date)
 WHERE NOT cold_data
   AND status_base IN ('ru.vtb.lifecycle.model.RejectedStatus#REJECTED',
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
                       'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#PARTLY_ACCEPTED_BC'
                      );