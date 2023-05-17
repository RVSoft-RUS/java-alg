select distinct businessop2_.sysname as sysname1_114_
	, businessop2_.business_service_sysname as business2_114_
	, businessop2_.full_auth_only as full_aut3_114_
	, businessop2_.is_bank as is_bank4_114_
	, businessop2_.is_client as is_clien5_114_
	, businessop2_.is_public as is_publi6_114_
	, businessop2_.label as label7_114_
	, businessop2_.name as name8_114_
	, businessop2_.parameters as paramete9_114_
 from rrko.rrko_pclib_business_object businessob0_
cross join rrko.rrko_pclib_business_service businessse1_
cross join rrko.rrko_pclib_business_operation businessop2_
where businessob0_.sysname = businessse1_.business_object_sysname
  and businessse1_.sysname = businessop2_.business_service_sysname
  and businessob0_.sysname = $1;