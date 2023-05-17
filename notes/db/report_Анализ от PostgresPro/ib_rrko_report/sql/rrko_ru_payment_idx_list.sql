CREATE INDEX rrko_ru_payment_check_document_number_for_unique_rule_idx
    ON rrko.rrko_ru_payment(document_number, client_ext_id)
 WHERE delete_date IS NULL
   AND status_base NOT IN ('ru.vtb.lifecycle.model.RejectedStatus#REJECTED',
						   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#NONE',
						   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#IMPORTING',
						   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#TEMPLATE',
						   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#DRAFT',
						   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#IMPORT_ERROR',
						   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#TEMPLATE'
						  );

CREATE INDEX rrko_ru_payment_client_contractor_check_date_payer_receiver_idx
    ON rrko.rrko_ru_payment(client_ext_id, contractor_restriction_list_id, contractor_restriction_check_date,
    						payer_account, receiver_account, payer_bank_bic, receiver_bank_bic, amount)
 WHERE contractor_restriction_check_date IS NOT NULL
   AND contractor_restriction_list_id IS NOT NULL;

CREATE INDEX rrko_ru_payment_client_contractor_check_date_receiver_idx
    ON rrko.rrko_ru_payment(client_ext_id, contractor_restriction_list_id, contractor_restriction_check_date,
    						receiver_account, receiver_bank_bic, amount)
 WHERE contractor_restriction_check_date IS NOT NULL
   AND contractor_restriction_list_id IS NOT NULL;

CREATE INDEX rrko_ru_payment_client_ext_id_document_date_id_statusfilter_idx
    ON rrko.rrko_ru_payment(client_ext_id, document_date DESC NULLS LAST, id DESC NULLS LAST)
 WHERE delete_date IS NULL
   AND status_base IN ('ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#DRAFT',
   					   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#IMPORT_ERROR',
   					   'ru.vtb.lifecycle.model.NewEdocStatus#NEW'
   					  );

CREATE INDEX rrko_ru_payment_client_ext_id_idx
    ON rrko.rrko_ru_payment(client_ext_id);

CREATE INDEX rrko_ru_payment_client_ext_id_is_allowed_statuses_idx
    ON rrko.rrko_ru_payment(client_ext_id, status_base, delete_date)
 WHERE delete_date IS NULL
   AND status_base NOT IN ('ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#NONE',
   						   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#IMPORTING',
   						   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#DELETED');

CREATE INDEX rrko_ru_payment_document_date_idx
    ON rrko.rrko_ru_payment(document_date);

CREATE INDEX rrko_ru_payment_document_number_document_date_partial_idx
    ON rrko.rrko_ru_payment(document_number, document_date DESC)
 WHERE delete_date IS NULL
   AND status_base NOT IN ('ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#DELETED',
   						   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#NONE',
   						   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#IMPORTING',
   						   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#TEMPLATE',
   						   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#DRAFT',
   						   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#IMPORT_ERROR'
   						  );

CREATE INDEX rrko_ru_payment_document_number_idx
    ON rrko.rrko_ru_payment(document_number);

CREATE INDEX rrko_ru_payment_fraud_doc_ref_ext_idx
    ON rrko.rrko_ru_payment(fraud_doc_ref_ext);

CREATE INDEX rrko_ru_payment_id_with_status_idx
    ON rrko.rrko_ru_payment(id, last_modify_date)
 WHERE status_base IN ('ru.vtb.lifecycle.model.RejectedStatus#REJECTED',
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
 					   'ru.vtb.dbo.rupayment.domain.rupayment.entity.type.RuPaymentStatus#PARTLY_ACCEPTED_BC');

CREATE INDEX rrko_ru_payment_last_modify_date_idx
    ON rrko.rrko_ru_payment(last_modify_date);

CREATE INDEX rrko_ru_payment_payer_account_idx
    ON rrko.rrko_ru_payment(payer_account);

CREATE INDEX rrko_ru_payment_payer_bank_bic_idx
    ON rrko.rrko_ru_payment(payer_bank_bic);

CREATE INDEX rrko_ru_payment_status_and_last_modify_date_idx
    ON rrko.rrko_ru_payment(status_base, last_modify_date);

CREATE INDEX rrko_ru_payment_status_base_idx
    ON rrko.rrko_ru_payment(status_base);

CREATE INDEX rrko_ru_payment_uuid_idx
    ON rrko.rrko_ru_payment(uuid);

CREATE INDEX ru_payment_client_ext_id_status_base_delete_date_idx
    ON rrko.rrko_ru_payment(client_ext_id, status_base, delete_date)
 WHERE delete_date IS NULL;

CREATE INDEX ru_payment_edoc_ref_id_idx
    ON rrko.rrko_ru_payment(edoc_ref_id);