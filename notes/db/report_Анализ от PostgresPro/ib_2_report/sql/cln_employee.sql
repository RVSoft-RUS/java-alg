select count(employee0_.id) as col_0_0_
  from cln.cln_employee employee0_
 where employee0_.id in (select employee1_.id
 						               from cln.cln_employee employee1_
 						               join cln.cln_client_branch_relation branchrela3_
 						                 on branchrela3_.client_id = employee1_.client_id
 						              where branchrela3_.branch_id in ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16,
                                                           $17, $18, $19, $20, $21, $22, $23, $24, $25, $26, $27, $28, $29, $30, $31,
                                                           $32, $33, $34, $35, $36, $37, $38, $39, $40, $41, $42, $43, $44, $45, $46,
                                                           $47, $48, $49, $50, $51, $52, $53, $54, $55, $56, $57, $58, $59, $60, $61,
                                                           $62, $63, $64, $65, $66, $67, $68, $69, $70, $71, $72, $73, $74, $75, $76,
                                                           $77, $78, $79, $80, $81, $82, $83, $84, $85, $86, $87, $88, $89, $90, $91,
                                                           $92, $93, $94, $95, $96, $97, $98, $99, $100
 						  								                            )
 						           )
    and employee0_.is_deleted = $101
    and lower(employee0_.full_name) like $102;