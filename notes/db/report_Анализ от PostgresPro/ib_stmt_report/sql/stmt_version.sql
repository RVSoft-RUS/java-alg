SELECT basestatem0_.id as id1_122_
     , basestatem0_.account_id as account_2_122_
     , basestatem0_.date_actuality as date_act3_122_
     , basestatem0_.credit_count as credit_c4_122_
     , basestatem0_.debit_count as debit_co5_122_
     , basestatem0_.flag_archive as flag_arc6_122_
     , basestatem0_.normalized_date as normaliz7_122_
  FROM stmt.st_statement_version basestatem0_
  LEFT JOIN stmt.st_contractor_statement contractor1_
    ON contractor1_.statement_id = basestatem0_.id
 WHERE basestatem0_.account_id = $1
   AND basestatem0_.normalized_date = $2
   AND contractor1_.contractor_account_id IN ($3, $4)
 ORDER BY basestatem0_.date_actuality DESC;