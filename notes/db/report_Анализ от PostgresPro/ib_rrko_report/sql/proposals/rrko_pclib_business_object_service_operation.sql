SELECT businessop2_.sysname as sysname1_114_
	 , businessop2_.business_service_sysname as business2_114_
	 , businessop2_.full_auth_only as full_aut3_114_
	 , businessop2_.is_bank as is_bank4_114_
	 , businessop2_.is_client as is_clien5_114_
	 , businessop2_.is_public as is_publi6_114_
	 , businessop2_.label as label7_114_
	 , businessop2_.name as name8_114_
	 , businessop2_.parameters as paramete9_114_
  FROM rrko.rrko_pclib_business_operation businessop2_
 WHERE EXISTS (SELECT 1
  				 FROM rrko.rrko_pclib_business_service businessse1_
 				WHERE businessse1_.business_object_sysname = $1
   				  AND businessse1_.sysname = businessop2_.business_service_sysname
   			  );