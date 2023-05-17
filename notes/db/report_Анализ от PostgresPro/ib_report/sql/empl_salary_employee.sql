SELECT employee0_.id as id1_21_
	 , employee0_.account_number as account_2_21_
	 , employee0_.account_statement as account_3_21_
	 , employee0_.additional_phone_number as addition4_21_
	 , employee0_.bic as bic5_21_, employee0_.birthday as birthday6_21_
	 , employee0_.birth_place as birth_pl7_21_
	 , employee0_.card_number as card_num8_21_
	 , employee0_.card_number_masked as card_num9_21_
	 , employee0_.card_type_code as card_ty10_21_
	 , employee0_.card_type_name as card_ty11_21_
	 , employee0_.citizenship_country_char3_code as citizen12_21_
	 , employee0_.citizenship_country_id as citizen13_21_
	 , employee0_.citizenship_country_iso_code as citizen14_21_
	 , employee0_.citizenship_country_name as citizen15_21_
	 , employee0_.client_id as client_16_21_
	 , employee0_.currency_code as currenc17_21_
	 , employee0_.email as email18_21_
	 , employee0_.embossing_company_name as embossi19_21_
	 , employee0_.embossing_name as embossi20_21_
	 , employee0_.embossing_surname as embossi21_21_
	 , employee0_.employee_number as employe22_21_
	 , employee0_.fact_address as fact_ad50_21_
	 , employee0_.fax_country_code_iso as fax_cou23_21_
	 , employee0_.fax_code as fax_cod24_21_
	 , employee0_.fax_number as fax_num25_21_
	 , employee0_.first_name as first_n26_21_
	 , employee0_.gender as gender27_21_
	 , employee0_.has_error as has_err28_21_
	 , employee0_.phone_home_country_code_iso as phone_h29_21_
	 , employee0_.phone_home_code as phone_h30_21_
	 , employee0_.phone_home as phone_h31_21_, employee0_.inn as inn32_21_
	 , employee0_.phone_mobile_country_code_iso as phone_m33_21_
	 , employee0_.phone_mobile_code as phone_m34_21_
	 , employee0_.phone_mobile as phone_m35_21_
	 , employee0_.monthly_income as monthly36_21_
	 , employee0_.organization as organiz37_21_
	 , employee0_.patronymic as patrony38_21_
	 , employee0_.person_type as person_39_21_
	 , employee0_.position as positio40_21_
	 , employee0_.position_category_code as positio41_21_
	 , employee0_.position_category_description as positio42_21_
	 , employee0_.receive_card_official as receive43_21_
	 , employee0_.recruitment_date as recruit44_21_
	 , employee0_.reg_address as reg_add51_21_
	 , employee0_.snils as snils45_21_
	 , employee0_.surname as surname46_21_
	 , employee0_.phone_work_country_code_iso as phone_w47_21_
	 , employee0_.phone_work_code as phone_w48_21_
	 , employee0_.phone_work as phone_w49_21_
	 , (SELECT LTRIM(RTRIM( CONCAT(employee0_.fax_code, $4, employee0_.fax_number)))) as formula1_
	 , (SELECT LTRIM(RTRIM( CONCAT(employee0_.phone_home_code, $5, employee0_.phone_home)))) as formula2_
	 , (SELECT card.id FROM salary_empl.empl_identity_card card WHERE card.employee_id = employee0_.id AND card.main_document = $6 LIMIT $7) as formula8_
	 , (SELECT LTRIM(RTRIM( CONCAT(employee0_.phone_mobile_code, $8, employee0_.phone_mobile)))) as formula4_
	 , employee0_.organization ->> $9 as formula5_
	 , (SELECT LTRIM(RTRIM( CONCAT(employee0_.phone_work_code, $10, employee0_.phone_work)))) as formula6_
 from salary_empl.empl_salary_employee employee0_
where ($11=$12 or $13=$14 and (employee0_.client_id in ($15)))
  and employee0_.client_id=$16
  and employee0_.patronymic=$1
  and employee0_.first_name=$2
  and employee0_.surname=$3;

select employee0_.id as id1_21_
     , employee0_.account_number as account_2_21_
     , employee0_.account_statement as account_3_21_
     , employee0_.additional_phone_number as addition4_21_
     , employee0_.bic as bic5_21_
     , employee0_.birthday as birthday6_21_
     , employee0_.birth_place as birth_pl7_21_
     , employee0_.card_number as card_num8_21_
     , employee0_.card_number_masked as card_num9_21_
     , employee0_.card_type_code as card_ty10_21_
     , employee0_.card_type_name as card_ty11_21_
     , employee0_.citizenship_country_char3_code as citizen12_21_
     , employee0_.citizenship_country_id as citizen13_21_
     , employee0_.citizenship_country_iso_code as citizen14_21_
     , employee0_.citizenship_country_name as citizen15_21_
     , employee0_.client_id as client_16_21_
     , employee0_.currency_code as currenc17_21_
     , employee0_.email as email18_21_
     , employee0_.embossing_company_name as embossi19_21_
     , employee0_.embossing_name as embossi20_21_
     , employee0_.embossing_surname as embossi21_21_
     , employee0_.employee_number as employe22_21_
     , employee0_.fact_address as fact_ad50_21_
     , employee0_.fax_country_code_iso as fax_cou23_21_
     , employee0_.fax_code as fax_cod24_21_
     , employee0_.fax_number as fax_num25_21_
     , employee0_.first_name as first_n26_21_
     , employee0_.gender as gender27_21_
     , employee0_.has_error as has_err28_21_
     , employee0_.phone_home_country_code_iso as phone_h29_21_
     , employee0_.phone_home_code as phone_h30_21_
     , employee0_.phone_home as phone_h31_21_
     , employee0_.inn as inn32_21_
     , employee0_.phone_mobile_country_code_iso as phone_m33_21_
     , employee0_.phone_mobile_code as phone_m34_21_
     , employee0_.phone_mobile as phone_m35_21_
     , employee0_.monthly_income as monthly36_21_
     , employee0_.organization as organiz37_21_
     , employee0_.patronymic as patrony38_21_
     , employee0_.person_type as person_39_21_
     , employee0_.position as positio40_21_
     , employee0_.position_category_code as positio41_21_
     , employee0_.position_category_description as positio42_21_
     , employee0_.receive_card_official as receive43_21_
     , employee0_.recruitment_date as recruit44_21_
     , employee0_.reg_address as reg_add51_21_
     , employee0_.snils as snils45_21_
     , employee0_.surname as surname46_21_
     , employee0_.phone_work_country_code_iso as phone_w47_21_
     , employee0_.phone_work_code as phone_w48_21_
     , employee0_.phone_work as phone_w49_21_
     , (SELECT LTRIM(RTRIM( CONCAT(employee0_.fax_code, ' ', employee0_.fax_number)))) as formula1_
     , (SELECT LTRIM(RTRIM( CONCAT(employee0_.phone_home_code, ' ', employee0_.phone_home)))) as formula2_
     , (SELECT card.id FROM salary_empl.empl_identity_card card WHERE card.employee_id = employee0_.id AND card.main_document = 'TRUE' LIMIT 1) as formula8_
     , (SELECT LTRIM(RTRIM( CONCAT(employee0_.phone_mobile_code, ' ', employee0_.phone_mobile)))) as formula4_
     , employee0_.organization ->> 'name' as formula5_
     , (SELECT LTRIM(RTRIM( CONCAT(employee0_.phone_work_code, ' ', employee0_.phone_work)))) as formula6_
  from salary_empl.empl_salary_employee employee0_
 where (0=1 or 1=1 and
         (employee0_.client_id in (200040318 , 200040317 , 200040316 , 200040323 , 200040322 , 200040321 , 200039935 , 200039934 , 200039933 , 200039932 , 200040320 , 200040327 , 200040331 , 200040330 , 200040329 , 200040328 , 200040326 , 200040325 , 200040324 , 200039922 , 200039921 , 200039920 , 200039919 , 200039918 , 200039917 , 200039916 , 200039915 , 200039914 , 200039913 , 200039912 , 200039911 , 200039910 , 200039909 , 200039908 , 200039907 , 200039906 , 200039905 , 200039904 , 200039903 , 200039902 , 200039901 , 200039900 , 200039497 , 200039496 , 200020601 , 200020600 , 200020599 , 200020598 , 200039489 , 200020593 , 200040293 , 200040292 , 200040291 , 200020592 , 200040289 , 200040288 , 200040287 , 200040286 , 200040285 , 200040284 , 200040283 , 200040282 , 200040281 , 200040280 , 200040279 , 200040278 , 200040277 , 200037833 , 200043016 , 200040588 , 200032920 , 200032913 , 200024064 , 200032506 , 200032503 , 200032504 , 200034111 , 200019616 , 200040519 , 200040518 , 200040517 , 200040516 , 200040514 , 200040511 , 200040512 , 200040510 , 200022420 , 200040508 , 200040507 , 200021184 , 200020769 , 200020764 , 200032415 , 200039939 , 200039938 , 200039937 , 200039936 , 200039940 , 200030771 , 200039487 , 200039486 , 200039485 , 200039484 , 200039507 , 200039506 , 200039505 , 200019534 , 200039504 , 200040034 , 200040033 , 200040032 , 200040031 , 200040030 , 200039511 , 200032390 , 200039510 , 200039509 , 200039508 , 200039515 , 200039514 , 200039513 , 200032383 , 200039512 , 200042833 , 200039516 , 200032379 , 200039491 , 200039490 , 200039495 , 200039494 , 200039493 , 200039492 , 200039498 , 200039503 , 200033947 , 200020611 , 200020618 , 200020707 , 200020708 , 200020706 , 200020705 , 200020704 , 200023920 , 200020703 , 200020702 , 200020701 , 200020700 , 200020699 , 200039592 , 200020671 , 200039587 , 200039586 , 200039585 , 200020675 , 200041194 , 200020678 , 200020677 , 200020680 , 200040307 , 200040305 , 200040304 , 200040311 , 200040382 , 200040381 , 200040380 , 200040379 , 200040378 , 200040377 , 200040376 , 200040375 , 200040374 , 200040373 , 200040372 , 200040371 , 200040370 , 200040369 , 200040310 , 200040367 , 200040366 , 200040365 , 200040364 , 200040363 , 200040362 , 200040361 , 200040360 , 200040359 , 200040358 , 200040357 , 200040356 , 200040355 , 200040354 , 200040353 , 200040309 , 200040308 , 200040350 , 200040349 , 200040315 , 200040314 , 200040313 , 200040312 , 200040319)))
   and employee0_.client_id=200020592
   and employee0_.patronymic=$1
   and employee0_.first_name=$2
   and employee0_.surname=$3;