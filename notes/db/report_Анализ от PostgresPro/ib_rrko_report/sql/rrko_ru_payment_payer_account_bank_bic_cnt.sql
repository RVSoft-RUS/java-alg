select count(rupayment0_.id) as col_0_0_
  from rrko.rrko_ru_payment rupayment0_
 where ($359 = $360 or
 	    $361 = $362 and ((rupayment0_.role_template_signature is null) and
 	    				 (rupayment0_.client_ext_id in ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12,
 	    												$13, $14, $15, $16, $17, $18, $19, $20, $21, $22, $23, $24,
 	    												$25, $26, $27, $28, $29, $30, $31, $32, $33, $34, $35, $36, $37)
 	    				 ) and (rupayment0_.payer_account = $38 and rupayment0_.payer_bank_bic = $39 or
 	    						rupayment0_.payer_account = $40 and rupayment0_.payer_bank_bic = $41 or
 	    						rupayment0_.payer_account = $42 and rupayment0_.payer_bank_bic = $43 or
 	    						rupayment0_.payer_account = $44 and rupayment0_.payer_bank_bic = $45 or
 	    						rupayment0_.payer_account = $46 and rupayment0_.payer_bank_bic = $47 or
 	    						rupayment0_.payer_account = $48 and rupayment0_.payer_bank_bic = $49 or
 	    						rupayment0_.payer_account = $50 and rupayment0_.payer_bank_bic = $51 or
 	    						rupayment0_.payer_account = $52 and rupayment0_.payer_bank_bic = $53 or
 	    						rupayment0_.payer_account = $54 and rupayment0_.payer_bank_bic = $55 or
 	    						rupayment0_.payer_account = $56 and rupayment0_.payer_bank_bic = $57 or
 	    						rupayment0_.payer_account = $58 and rupayment0_.payer_bank_bic = $59 or
 	    						rupayment0_.payer_account = $60 and rupayment0_.payer_bank_bic = $61 or
 	    						rupayment0_.payer_account = $62 and rupayment0_.payer_bank_bic = $63 or
 	    						rupayment0_.payer_account = $64 and rupayment0_.payer_bank_bic = $65 or
 	    						rupayment0_.payer_account = $66 and rupayment0_.payer_bank_bic = $67 or
 	    						rupayment0_.payer_account = $68 and rupayment0_.payer_bank_bic = $69 or
 	    						rupayment0_.payer_account = $70 and rupayment0_.payer_bank_bic = $71 or
 	    						rupayment0_.payer_account = $72 and rupayment0_.payer_bank_bic = $73 or
 	    						rupayment0_.payer_account = $74 and rupayment0_.payer_bank_bic = $75 or
 	    						rupayment0_.payer_account = $76 and rupayment0_.payer_bank_bic = $77 or
 	    						rupayment0_.payer_account = $78 and rupayment0_.payer_bank_bic = $79 or
 	    						rupayment0_.payer_account = $80 and rupayment0_.payer_bank_bic = $81 or
 	    						rupayment0_.payer_account = $82 and rupayment0_.payer_bank_bic = $83 or
 	    						rupayment0_.payer_account = $84 and rupayment0_.payer_bank_bic = $85 or
 	    						rupayment0_.payer_account = $86 and rupayment0_.payer_bank_bic = $87 or
 	    						rupayment0_.payer_account = $88 and rupayment0_.payer_bank_bic = $89 or
 	    						rupayment0_.payer_account = $90 and rupayment0_.payer_bank_bic = $91 or
 	    						rupayment0_.payer_account = $92 and rupayment0_.payer_bank_bic = $93 or
 	    						rupayment0_.payer_account = $94 and rupayment0_.payer_bank_bic = $95 or
 	    						rupayment0_.payer_account = $96 and rupayment0_.payer_bank_bic = $97 or
 	    						rupayment0_.payer_account = $98 and rupayment0_.payer_bank_bic = $99 or
 	    						rupayment0_.payer_account = $100 and rupayment0_.payer_bank_bic = $101 or
 	    						rupayment0_.payer_account = $102 and rupayment0_.payer_bank_bic = $103 or
 	    						rupayment0_.payer_account = $104 and rupayment0_.payer_bank_bic = $105 or
 	    						rupayment0_.payer_account = $106 and rupayment0_.payer_bank_bic = $107 or
 	    						rupayment0_.payer_account = $108 and rupayment0_.payer_bank_bic = $109 or
 	    						rupayment0_.payer_account = $110 and rupayment0_.payer_bank_bic = $111 or
 	    						rupayment0_.payer_account = $112 and rupayment0_.payer_bank_bic = $113 or
 	    						rupayment0_.payer_account = $114 and rupayment0_.payer_bank_bic = $115
 	    				) or
 	    				(rupayment0_.role_template_signature is null) and rupayment0_.visible_for_acceptor = $116 and
 	    				(rupayment0_.client_ext_id in ($117, $118, $119, $120, $121, $122, $123, $124, $125, $126, $127, $128, $129,
 	    											   $130, $131, $132, $133, $134, $135, $136, $137, $138, $139, $140, $141, $142,
 	    											   $143, $144, $145, $146, $147, $148 , $149 , $150 , $151 , $152 , $153)
 	    				) and (rupayment0_.payer_account = $154 and rupayment0_.payer_bank_bic = $155 or
 	    				       rupayment0_.payer_account = $156 and rupayment0_.payer_bank_bic = $157 or
 	    				       rupayment0_.payer_account = $158 and rupayment0_.payer_bank_bic = $159 or
 	    				       rupayment0_.payer_account = $160 and rupayment0_.payer_bank_bic = $161 or
 	    				       rupayment0_.payer_account = $162 and rupayment0_.payer_bank_bic = $163 or
 	    				       rupayment0_.payer_account = $164 and rupayment0_.payer_bank_bic = $165 or
 	    				       rupayment0_.payer_account = $166 and rupayment0_.payer_bank_bic = $167 or
 	    				       rupayment0_.payer_account = $168 and rupayment0_.payer_bank_bic = $169 or
 	    				       rupayment0_.payer_account = $170 and rupayment0_.payer_bank_bic = $171 or
 	    				       rupayment0_.payer_account = $172 and rupayment0_.payer_bank_bic = $173 or
 	    				       rupayment0_.payer_account = $174 and rupayment0_.payer_bank_bic = $175 or
 	    				       rupayment0_.payer_account = $176 and rupayment0_.payer_bank_bic = $177 or
 	    				       rupayment0_.payer_account = $178 and rupayment0_.payer_bank_bic = $179 or
 	    				       rupayment0_.payer_account = $180 and rupayment0_.payer_bank_bic = $181 or
 	    				       rupayment0_.payer_account = $182 and rupayment0_.payer_bank_bic = $183 or
 	    				       rupayment0_.payer_account = $184 and rupayment0_.payer_bank_bic = $185 or
 	    				       rupayment0_.payer_account = $186 and rupayment0_.payer_bank_bic = $187 or
 	    				       rupayment0_.payer_account = $188 and rupayment0_.payer_bank_bic = $189 or
 	    				       rupayment0_.payer_account = $190 and rupayment0_.payer_bank_bic = $191 or
 	    				       rupayment0_.payer_account = $192 and rupayment0_.payer_bank_bic = $193 or
 	    				       rupayment0_.payer_account = $194 and rupayment0_.payer_bank_bic = $195 or
 	    				       rupayment0_.payer_account = $196 and rupayment0_.payer_bank_bic = $197 or
 	    				       rupayment0_.payer_account = $198 and rupayment0_.payer_bank_bic = $199 or
 	    				       rupayment0_.payer_account = $200 and rupayment0_.payer_bank_bic = $201 or
 	    				       rupayment0_.payer_account = $202 and rupayment0_.payer_bank_bic = $203 or
 	    				       rupayment0_.payer_account = $204 and rupayment0_.payer_bank_bic = $205 or
 	    				       rupayment0_.payer_account = $206 and rupayment0_.payer_bank_bic = $207 or
 	    				       rupayment0_.payer_account = $208 and rupayment0_.payer_bank_bic = $209 or
 	    				       rupayment0_.payer_account = $210 and rupayment0_.payer_bank_bic = $211 or
 	    				       rupayment0_.payer_account = $212 and rupayment0_.payer_bank_bic = $213 or
 	    				       rupayment0_.payer_account = $214 and rupayment0_.payer_bank_bic = $215 or
 	    				       rupayment0_.payer_account = $216 and rupayment0_.payer_bank_bic = $217 or
 	    				       rupayment0_.payer_account = $218 and rupayment0_.payer_bank_bic = $219 or
 	    				       rupayment0_.payer_account = $220 and rupayment0_.payer_bank_bic = $221 or
 	    				       rupayment0_.payer_account = $222 and rupayment0_.payer_bank_bic = $223 or
 	    				       rupayment0_.payer_account = $224 and rupayment0_.payer_bank_bic = $225 or
 	    				       rupayment0_.payer_account = $226 and rupayment0_.payer_bank_bic = $227 or
 	    				       rupayment0_.payer_account = $228 and rupayment0_.payer_bank_bic = $229 or
 	    				       rupayment0_.payer_account =$230 and rupayment0_.payer_bank_bic = $231) or
 	    				(rupayment0_.role_template_signature is null) and
 	    				(rupayment0_.client_ext_id in ($232, $233, $234, $235, $236, $237, $238, $239, $240, $241, $242, $243, $244,
 	    											   $245, $246, $247, $248, $249, $250, $251, $252, $253, $254, $255, $256, $257,
 	    											   $258, $259, $260, $261, $262, $263, $264, $265, $266, $267, $268, $269, $270,
 	    											   $271)
 	    				))
		) and $363=$364 and $365=$366 and $367=$368 and $369=$370 and $371=$372
and (rupayment0_.status_base in ($272, $273, $274, $275, $276, $277, $278, $279, $280, $281, $282, $283, $284, $285, $286, $287, $288,
								 $289, $290, $291, $292, $293, $294, $295, $296, $297, $298, $299, $300, $301, $302, $303, $304, $305,
								 $306, $307, $308, $309, $310, $311, $312, $313, $314, $315, $316, $317, $318, $319, $320, $321, $322,
								 $323, $324, $325, $326, $327, $328, $329, $330, $331, $332, $333, $334, $335, $336, $337, $338, $339,
								 $340, $341, $342, $343, $344, $345, $346, $347, $348, $349, $350, $351, $352, $353, $354, $355, $356,
								 $357)
    ) and $373=$374 and $375=$376 and $377=$378 and $379=$380 and $381=$382 and $383=$384
and (rupayment0_.delete_date is null) and rupayment0_.status_base <> $358;