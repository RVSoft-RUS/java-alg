SELECT contractor0_.id as id1_64_
	   , contractor0_.bic as bic2_64_
	   , contractor0_.name as name3_64_
  FROM stmt.st_contractor_bank contractor0_
 WHERE EXISTS (SELECT 1
 				         FROM stmt.st_contractor_statement contractor1_
 				        WHERE contractor1_.contractor_bank_id = contractor0_.id
 				          AND contractor1_.statement_date between $1 and $2
   				        AND contractor1_.client_account_id in ($3)
   				        AND contractor1_.contractor_account_id in ($4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15,
   											  				                           $16, $17, $18, $19, $20, $21, $22, $23, $24, $25, $26, $27,
                                                             $28, $29, $30, $31, $32, $33, $34, $35, $36, $37, $38, $39,
                                                             $40, $41, $42, $43, $44, $45, $46, $47, $48, $49, $50, $51,
                                                             $52, $53, $54, $55, $56, $57, $58, $59, $60, $61, $62, $63,
                                                             $64, $65, $66, $67, $68, $69, $70, $71, $72, $73, $74, $75,
                                                             $76, $77, $78, $79, $80, $81, $82, $83, $84, $85, $86, $87,
                                                             $88, $89, $90, $91, $92, $93, $94, $95, $96, $97, $98, $99,
                                                             $100, $101, $102, $103, $104)
   			      );