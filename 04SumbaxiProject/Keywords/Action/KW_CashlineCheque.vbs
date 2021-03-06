'Keyword Generation
Class KW_CashlineCheque
    Public Function runKey (strKeyArgument)
        Dim lstlstChequeInfo, lstCheque, strIssuedDate, strPaidCheque,strTotalNoofCheques, lstlstChequeList, lstChequeSelect, lstChequeDetails

        lstlstChequeInfo  = checkNull(strKeyArgument(0))
        lstCheque  = checkNull(strKeyArgument(1))
        strIssuedDate  = checkNull(strKeyArgument(2))
		strPaidCheque  = checkNull(strKeyArgument(3))
		strTotalNoofCheques  = checkNull(strKeyArgument(4))
		lstlstChequeList  = checkNull(strKeyArgument(5))
        lstChequeSelect  = checkNull(strKeyArgument(6))
		lstChequeDetails  = checkNull(strKeyArgument(7))
          
        Dim bCashlineCheque
        bCashlineCheque  = CashlineCheque(lstlstChequeInfo, lstCheque, strIssuedDate, strPaidCheque,strTotalNoofCheques, lstlstChequeList, lstChequeSelect, lstChequeDetails)

        If  bCashlineCheque Then
            LogMessage "RSLT", "Keyword-Verification", "Keyword CashlineCheque executed successfully", True
            runKey =True
        else
			 LogMessage "WARN", "Keyword-Verification", "Keyword Cashline Cheque failed during execution", False
            runKey =False
        End If

    End Function

End Class

'str					ChequeNo	TransactionDate	PostingDate	Amount	PostingStatus	ProcessingSignal	ReturnDate	Reason
