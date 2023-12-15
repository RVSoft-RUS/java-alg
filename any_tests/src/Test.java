package src;

public class Test {
    public static void main(String[] args) {
        Object[] objects =new Object[5];
        objects[0] = "the String";
        objects[3] = "the String";
        String s = (String) objects[0];
        String s1 = (String) objects[1];
        System.out.println(s + ", " + s1);
    }

    public Payment.TypeEnum calculate(PaymentOrderTypeEsb po) {
        String account = Optional.ofNullable(po.getPayee().getNumber())
                .map(AccountNumberTypeEsb::getAccountNumber20Digit).orElse("");
        if (OPERATION_ASSIGNMENT_RESERVE.equals(po.getOperationAssignment())) {
            if (po.getTypeCodeOrder().equals(OPERATION_TYPE_ACCOUNT_CASH_WARRANT)) {
                return Payment.TypeEnum.DI;
            } else if (po.getTypeCodeOrder().equals(OPERATION_TYPE_CASH_RECEIPT_ORDER)) {
                return Payment.TypeEnum.CB;
            }
        }
        if (OPERATION_ASSIGNMENT_PAYROLL.equals(po.getOperationAssignment())) {
            return Payment.TypeEnum.DP;
        }
        if (po.getAmount().getAmount().compareTo(BigDecimal.ZERO) < 0) {
            if (SBP_TYPE.equals(Optional.ofNullable(po).map(PaymentOrderTypeEsb::getDocumentIndicator)
                    .map(DocumentIndicatorTypeEsb::getInputSystem).orElse(""))) {
                return Payment.TypeEnum.DJ;
            }
            if (ownerInn.equals(po.getPayee().getINN())
                    && !matchPatternList(account, DEPOSIT_MASK)
                    && !OPERATION_ASSIGNMENT_PAYROLL.equals(po.getOperationAssignment())) {
                return Payment.TypeEnum.DG;
            } else if (po.getCardTransactionInfo() != null && po.getCardTransactionInfo().getCardPAN() != null) {
                return Payment.TypeEnum.DH;
            } else {
                String corAccount = Optional.ofNullable(po).map(PaymentOrderTypeEsb::getPayee)
                        .map(RequisiteTypeEsb::getPayerBank).map(BankTypeEsb::getCorrespondentAccount).orElse("");

                if (isBudgetBic(Optional.ofNullable(po).map(PaymentOrderTypeEsb::getPayee)
                    .map(RequisiteTypeEsb::getPayerBank).map(BankTypeEsb::getBIK).orElse(null), account,
                        Optional.ofNullable(po.getLocalAmount()).map(MoneyAmountTypeEsb::getCurrencyCode)
                                .orElse(null)) || isBudgetSecondCondition(account, corAccount)) {
                    return Payment.TypeEnum.DE;
                }
                if (matchPatternList(account, D_COUNTERPARTY_MASK)) {
                    return Payment.TypeEnum.DA;
                }
                if (matchPatternList(account, D_PERSONAL_MASK)) {
                    return Payment.TypeEnum.DB;
                }
                if (matchPatternList(account, DEPOSIT_MASK)) {
                    return Payment.TypeEnum.DC;
                }
                if (matchPatternList(account, D_BANKSERVICE_MASK)) {
                    return Payment.TypeEnum.DD;
                }
                return Payment.TypeEnum.DF;
            }
        } else {
            if (SBP_TYPE.equals(Optional.ofNullable(po).map(PaymentOrderTypeEsb::getDocumentIndicator)
                    .map(DocumentIndicatorTypeEsb::getInputSystem).orElse(""))) {
                return Payment.TypeEnum.CJ;
            }
            if (ownerInn.equals(po.getPayee().getINN())) {
                return Payment.TypeEnum.CG;
            } else if (po.getCardTransactionInfo() != null && po.getCardTransactionInfo().getCardPAN() != null) {
                return Payment.TypeEnum.CH;
            } else {
                if (matchPatternList(account, ACQUIRE_MASK)) {
                    return Payment.TypeEnum.CA;
                }
                if (matchPatternList(account, INCASATION_MASK)) {
                    return Payment.TypeEnum.CB;
                }
                if (matchPatternList(account, C_COUNTERPARTY_MASK)) {
                    return Payment.TypeEnum.CC;
                }
                if (matchPatternList(account, DEPOSIT_MASK)) {
                    return Payment.TypeEnum.CD;
                }
                if (matchPatternList(account, DEPOSIT_PERCENT_MASK)) {
                    return Payment.TypeEnum.CE;
                }

                return Payment.TypeEnum.CF;
            }

        }
    }

    private static boolean matchPatternList(String account, List<String> patternList) {
        for (String pattern : patternList) {
            if (account.startsWith(pattern)) {
                return true;
            }
        }
        return false;
    }

    public boolean isBudgetSecondCondition(String account, String correspondentAccount) {
        if (StringUtils.isBlank(correspondentAccount) || StringUtils.isBlank(account)) {
            return false;
        }
        return account.startsWith("0") && account.length() == 20
                && correspondentAccount.startsWith(PREFIX_COR_ACCOUNT_UTRA);
    }

}
