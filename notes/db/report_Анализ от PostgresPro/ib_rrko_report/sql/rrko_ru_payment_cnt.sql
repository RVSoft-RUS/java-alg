select count(rupayment0_.id) as col_0_0_
  from rrko.rrko_ru_payment rupayment0_
 where ($89=$90 or $91=$92 and (rupayment0_.role_template_signature is null) and (rupayment0_.client_ext_id in ($1)))
   and $93=$94 and $95=$96 and $97=$98 and $99=$100 and $101=$102
   and (rupayment0_.status_base in ($2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15,
   									$16, $17, $18, $19, $20, $21, $22, $23, $24, $25, $26, $27, $28, $29, $30,
   									$31, $32, $33, $34, $35, $36, $37, $38, $39, $40, $41, $42, $43, $44, $45,
   									$46, $47, $48, $49, $50, $51, $52, $53, $54, $55, $56, $57, $58, $59, $60,
   									$61, $62, $63, $64, $65, $66, $67, $68, $69, $70, $71, $72, $73, $74, $75,
   									$76, $77, $78, $79, $80, $81, $82, $83, $84, $85, $86, $87)
       )
   and $103=$104 and $105=$106 and $107=$108
   and $109=$110 and $111=$112 and $113=$114
   and (rupayment0_.delete_date is null)
   and rupayment0_.status_base <> $88;