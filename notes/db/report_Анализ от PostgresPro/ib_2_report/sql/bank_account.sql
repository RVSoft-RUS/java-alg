mean - 1.046
min - 0.807
max - 5.442
calls - 8909

select distinct bankaccoun0_.id as id1_28_0_
	 , bankaccoun1_.id as id1_29_1_
	 , bankaccoun0_.account as account2_28_0_
	 , bankaccoun0_.account_status as account_3_28_0_
	 , bankaccoun0_.account_type as account_4_28_0_
	 , bankaccoun0_.bank_id as bank_id12_28_0_
	 , bankaccoun0_.control_key as control_5_28_0_
	 , bankaccoun0_.date_in as date_in6_28_0_
	 , bankaccoun0_.date_out as date_out7_28_0_
	 , bankaccoun0_.pbr_bic as pbr_bic8_28_0_
	 , bankaccoun0_.delete_date_time as delete_d9_28_0_
	 , bankaccoun0_.is_deleted as is_dele10_28_0_
	 , bankaccoun0_.optlock as optlock11_28_0_
	 , bankaccoun1_.acc_rstr_code as acc_rstr2_29_1_
	 , bankaccoun1_.acc_rstr_date as acc_rstr3_29_1_
	 , bankaccoun1_.bank_account_id as bank_acc8_29_1_
	 , bankaccoun1_.delete_date_time as delete_d4_29_1_
	 , bankaccoun1_.is_deleted as is_delet5_29_1_
	 , bankaccoun1_.successor_bic as successo6_29_1_
	 , bankaccoun1_.optlock as optlock7_29_1_
	 , bankaccoun1_.bank_account_id as bank_acc8_29_0__
	 , bankaccoun1_.id as id1_29_0__
  from nsi.nsi_bnk_bank_account bankaccoun0_
  left join nsi.nsi_bnk_bank_account_rstr bankaccoun1_
    on bankaccoun1_.bank_account_id = bankaccoun0_.id
 where bankaccoun0_.is_deleted = $1
   and bankaccoun0_.bank_id = $2
 order by bankaccoun0_.id asc;

distinct, скорее всего, является избыточнм, поскольку в запросе есть поле id таблицы nsi.nsi_bnk_bank_account_rstr

Из-за этого дубликатов не будет

CREATE INDEX nbba_bank_id_ix ON nsi.nsi_bnk_bank_account(bank_id, is_deleted);

CREATE INDEX nbbar_bank_account_id_ix ON nsi.nsi_bnk_bank_account_rstr(bank_account_id);