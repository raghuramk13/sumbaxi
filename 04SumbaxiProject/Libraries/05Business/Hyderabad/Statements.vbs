'[Select the statement date from the statementDate List]
Public Function SelectStatementDate_Statement(strDate)
   bSelectStatementDate_Statement=true
   If Not IsNull(strDate) Then
      bcStatements.txtStatementDate.Set strDate
       If Err.Number<>0 Then
        LogMessage "WARN","Verification","Failed to Set Statement Date" ,false
        bSelectStatementDate_Statement = False
       Exit Function
       Else 
        LogMessage "RSLT","Verification","The Statement Date set successfully",true
 	  End If
   End If
   WaitForIcallLoading
   SelectStatementDate_Statement = bSelectStatementDate_Statement
End Function

'[Click Button Go displayed in Statement Enquiry Page]
Public Function clickbtnGo_Statements()
   bDevPending=true
   bcStatements.btnGO.click
   If Err.Number<>0 Then
       clickbtnGo_Statements=false
            LogMessage "WARN","Verification","Failed to Click button Go" ,false
       Exit Function
       Else 
       LogMessage "RSLT","Verification","The button Go is clicked successfully",true
   End If
   WaitForIcallLoading
   clickbtnGo_Statements=true
End Function

'[Verify the row data for the statement summary table]
Public Function verifyrowdata_StatementSummary(arrRowDataList)
	bverifyrowdata_StatementSummary = true
	verifyrowdata_StatementSummary = verifyTableContentList(bcStatements.tblStatementSummaryHeader,bcStatements.tblStatementSummaryContent,arrRowDataList,"Statement Summary",false,null,null,null)
	verifyrowdata_StatementSummary = bverifyrowdata_StatementSummary
End Function

'[Verify the click on link view relationship statement summary]
Public Function clickRelationshipLink_Statements()
	bclickRelationshipLink_Statements = true
	  bcStatements.lnkRelationshipSummary.click
	WaitForIcallLoading
	If bcStatements.popupRelationshipSummary.exist Then
		LogMessage "RSLT","Verification","The link is clicked successfully",true
		bclickRelationshipLink_Statements = true
		else
		LogMessage "WARN","Verification","Failed to click the link" ,false
		bclickRelationshipLink_Statements = false
	End If
	clickRelationshipLink_Statements = bclickRelationshipLink_Statements
End Function

'[Verify the fields of relationship statement summary popup]
 Public Function verifyfields_RelationshipSummary(lstRelationshipSummary)
 	bverifyRelationshipTranSummary_Statements=true
 	intSize = Ubound(lstRelationshipSummary)
	For Iterator = 0 To intSize Step 1
		arrLabel =trim(Split(lstRelationshipSummary(Iterator),":")(0))
		arrValue =trim(Split(lstRelationshipSummary(Iterator),":")(1))
		
	Select Case (arrLabel)
	Case "BeginningBalance"
	If Not IsNull(arrValue) Then
 		If Not verifyInnerText(bcStatements.lblRelationshipSummary_BeginningBalance , arrValue, "Relationship Transaction Summary - Beginning Balance")Then
			bverifyRelationshipTranSummary_Statements = False
		 End If
	End if
	
	Case "TotalDebits"
	If Not IsNull(arrValue) Then
 		If Not verifyInnerText(bcStatements.lblRelationshipSummary_TotalDebit(), arrValue, "Relationship Transaction Summary - Total Debit")Then
			bverifyRelationshipTranSummary_Statements = False
		 End If
	End if
	
	Case "TotalCredits"
	If Not IsNull(arrValue) Then
 		If Not verifyInnerText(bcStatements.lblRelationshipSummary_TotalCredit, arrValue, "Relationship Transaction Summary - Total Credit")Then
			bverifyRelationshipTranSummary_Statements = False
		 End If
	End if
	
	Case "Statement"
	If Not IsNull(arrValue) Then
 		If Not verifyInnerText(bcStatements.lblRelationshipSummary_CurrentBalance, arrValue, "Relationship Transaction Summary - Current Balance")Then
			bverifyRelationshipTranSummary_Statements = False
		 End If	 
	End if
	
	Case "Outstanding"
	If Not IsNull(arrValue) Then
 		If Not verifyInnerText(bcStatements.lblRelationshipSummary_OutstandingBalance, arrValue, "Relationship Transaction Summary - Outstanding Balance")Then
			bverifyRelationshipTranSummary_Statements = False
		 End If	 
	End if
	
	Case "CurrentDue"
	If Not IsNull(arrValue) Then
 		If Not verifyInnerText(bcStatements.lblRelationshipSummary_CurrentDue, arrValue, "Relationship Transaction Summary -Current Due")Then
			bverifyRelationshipTranSummary_Statements = False
		 End If	 
	End if
	
	Case "PastDue"
	If Not IsNull(arrValue) Then
 		If Not verifyInnerText(bcStatements.lblRelationshipSummary_PastDue, arrValue, "Relationship Transaction Summary -Past Due")Then
			bverifyRelationshipTranSummary_Statements = False
		 End If	 
	End if
	
	Case "Statementtotal"
	If Not IsNull(arrValue) Then
 		If Not verifyInnerText(bcStatements.lblRelationshipSummary_TotalDue, arrValue, "Relationship Transaction Summary -Statement Total")Then
			bverifyRelationshipTranSummary_Statements = False
		 End If 
	End if
	
	Case "StatementOutstanding"
	If Not IsNull(arrValue) Then
 		If Not verifyInnerText(bcStatements.lblRelationshipSummary_TotalDueOutstanding, arrValue, "Relationship Transaction Summary -Statement Outstanding")Then
			bverifyRelationshipTranSummary_Statements = False
		 End If 
	End if
	
	Case "CurrentDueDate"
	If Not IsNull(arrValue) Then
 		If Not verifyInnerText(bcStatements.lblRelationshipSummary_CurrentDueDate, arrValue, "Relationship Transaction Summary -Current Due Date")Then
			bverifyRelationshipTranSummary_Statements = False
		 End If 
	End if
	
	Case "RepaymentDuration"
	If Not IsNull(arrValue) Then
 		If Not verifyInnerText(bcStatements.lblRelationshipSummary_RepaymentDuration, arrValue, "Relationship Transaction Summary -Repayment Duration")Then
			bverifyRelationshipTranSummary_Statements = False
		 End If	 
	End if
	
	Case "AmountPayable"
	If Not IsNull(arrValue) Then
 		If Not verifyInnerText(bcStatements.lblRelationshipSummary_AmountPayable, arrValue, "Relationship Transaction Summary -Amount Payable")Then
			bverifyRelationshipTranSummary_Statements = False
		 End If	 
	End if
	
	Case "OutstandingBalance"
	If Not IsNull(arrValue) Then
 		If Not verifyInnerText(bcStatements.lblRelationSummary_OutBalance6MOnths, arrValue, "Relationship Transaction Summary -Outstanding Balance")Then
			bverifyRelationshipTranSummary_Statements = False
			 End If	 
		End if
	End select 	
 	Next 
 		bcStatements.btnRelationshipSummary_OK.Click
 		WaitForIcallLoading	
	verifyRelationshipTransactionSummary_Statements = bverifyRelationshipTranSummary_Statements
 End Function					
     
'[Verify the row data for statement transactions table]
Public Function verifyrowdata_StatementTransactions(arrRowDataList)
	bverifyrowdata_StatementTransactions= true	
	'bcStatements.weTabStatementTransaction.click
	verifyrowdata_StatementTransactions = verifyTableContentList(bcStatements.tblStatementTransactionHeader,bcStatements.tblStatementTransactionContent,arrRowDataList,"Statement Transaction",false,null,null,null)
	verifyrowdata_StatementTransactions = bverifyrowdata_StatementTransactions
End Function

'[Verify the click for transaction description in statement transactions table]
Public Function clickTranDesc_StatementTransaction(lstRowData)
	bclickTranDesc_StatementTransaction = true
	clickTranDesc_StatementTransaction = selectTableLink(bcStatements.tblStatementTransactionHeader,bcStatements.tblStatementTransactionContent,lstRowData,"Statement Transaction","Transaction Description",false,null,null,null)
	clickTranDesc_StatementTransaction = bclickTranDesc_StatementTransaction
End Function

'[Verify the click for MerchantId in statement transactions table]
Public Function clickMerId_StatementTransaction(lstRowData)
	bclickMerId_StatementTransaction = true
	clickMerId_StatementTransaction = selectTableLink(bcStatements.tblStatementTransactionHeader,bcStatements.tblStatementTransactionContent,lstRowData,"Statement Transaction","Merchant ID",false,null,null,null)
	clickMerId_StatementTransaction = bclickMerId_StatementTransaction
End Function

'[Verify the click for Actions in statement transaction table]
Public Function clickActions_StatementTransaction(lstTransactionsData)
	bclickActions_StatementTransaction = true
	clickActions_StatementTransaction =selectTableSubMenu(bcStatements.tblStatementTransactionHeader,bcStatements.tblStatementTransactionContent,lstTransactionsData,"Statement Transaction","Actions",True,bcStatements.lnkNext,bcStatements.lnkNext1,bcStatements.lnkPrevious,"Waive Fee",bDisabled)
	clickActions_StatementTransaction = bclickActions_StatementTransaction
End Function

'[Verify the fields of transaction description in popup]
Public Function verifyfields_AdditionalInfoStatements(lstAdditionalInfo)
	bverifyfields_AdditionalInfoStatements = true
	intSize = Ubound(lstAdditionalInfo)
	For Iterator = 0 To intSize Step 1
		arrLabel = trim(Split(lstAdditionalInfo(Iterator),":")(0))
		arrValue = trim(Split(lstAdditionalInfo(Iterator),":")(1))
		
	Select Case (arrLabel)
		Case "Merchant Category"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcStatements.lblTransDesc_MerchantCategory(), arrValue, "Merchant Category")Then
				LogMessage "WARN","Verification","Additional Info - Merchant Category:"&arrValue&" is not displayed as expected",false
				bverifyfields_AdditionalInfoStatements=false
			End If
		End If
		
		Case "Authorization Code"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcStatements.lblTransDesc_AuthorizationCode(), arrValue, "Authorization Code")Then
				LogMessage "WARN","Verification","Additional Info - Authorization Code:"&arrValue&" is not displayed as expected",false
				bverifyfields_AdditionalInfoStatements=false
			End If
		End If
		
		Case "Sequence No."
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcStatements.lblTransDesc_SequenceNo(), arrValue, "Sequence No.")Then
				LogMessage "WARN","Verification","Additional Info - Sequence No.:"&arrValue&" is not displayed as expected",false
				bverifyfields_AdditionalInfoStatements=false
			End If
		End If
		
		Case "Points Earned"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcStatements.lblTransDesc_PointsEarned(), arrValue, "Points Earned")Then
				LogMessage "WARN","Verification","Additional Info - Points Earned:"&arrValue&" is not displayed as expected",false
				bverifyfields_AdditionalInfoStatements=false
			End If
		End If
		
		Case "Cheque No."
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcStatements.lblTransDesc_strCheckNo(), arrValue, "Cheque No.")Then
				LogMessage "WARN","Verification","Transaction Info - Cheque No.:"&arrValue&" is not displayed as expected",false
				bverifyfields_AdditionalInfoStatements=false
			End If
		End If
		End Select
	Next 
		bcStatements.btnTransDesc_OK.click
		verifyfields_AdditionalInfoStatements =bverifyfields_AdditionalInfoStatements
End Function

'[Verify the field of merchant information pop up]
Public Function verifyfields_MerchantInfoStatements(lstAdditionalInfo)
	bverifyfields_MerchantInfoStatements = true
	intSize = Ubound(lstAdditionalInfo)
	For Iterator = 0 To intSize Step 1
		arrLabel = trim(Split(lstAdditionalInfo(Iterator),":")(0))
		arrValue = trim(Split(lstAdditionalInfo(Iterator),":")(1))
		
	Select Case (arrLabel)
		Case "Merchant Name"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcStatements.lblMerchantName(), arrValue, "Merchant Name")Then
				LogMessage "WARN","Verification","Merchant Information - Merchant Name:"&arrValue&" is not displayed as expected",false
				bverifyfields_MerchantInfoStatements=false
			End If
		End If
		
		Case "Merchant ID"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcStatements.lblMerchantId(), arrValue, "Merchant ID")Then
				LogMessage "WARN","Verification","Merchant Information - Merchant ID:"&arrValue&" is not displayed as expected",false
				bverifyfields_MerchantInfoStatements=false
			End If
		End If
		
		Case "City"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcStatements.lblMerchantCity(), arrValue, "City")Then
				LogMessage "WARN","Verification","Merchant Information - City:"&arrValue&" is not displayed as expected",false
				bverifyfields_MerchantInfoStatements=false
			End If
		End If
		
		Case "Address1"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcStatements.lblAddress1(), arrValue, "Address1")Then
				LogMessage "WARN","Verification","Merchant Information - Address1:"&arrValue&" is not displayed as expected",false
				bverifyfields_MerchantInfoStatements=false
			End If
		End If
		
		Case "Address2"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcStatements.lblAddress2(), arrValue, "Address2")Then
				LogMessage "WARN","Verification","Merchant Information - Address2:"&arrValue&" is not displayed as expected",false
				bverifyfields_MerchantInfoStatements=false
			End If
		End If
		
		Case "Address3"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcStatements.lblAddress3(), arrValue, "Address3")Then
				LogMessage "WARN","Verification","Merchant Information - Address3:"&arrValue&" is not displayed as expected",false
				bverifyfields_MerchantInfoStatements=false
			End If
		End If
		
		Case "Address4"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcStatements.lblAddress4(), arrValue, "Address4")Then
				LogMessage "WARN","Verification","Merchant Information - Address4:"&arrValue&" is not displayed as expected",false
				bverifyfields_MerchantInfoStatements=false
			End If
		End If
		
		Case "Postal Code"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcStatements.lblPostalCode(), arrValue, "Postal Code")Then
				LogMessage "WARN","Verification","Merchant Information - Postal Code:"&arrValue&" is not displayed as expected",false
				bverifyfields_MerchantInfoStatements=false
			End If
		End If
		
		Case "Phone Number"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcStatements.lblPhoneNumber(), arrValue, "Phone Number")Then
				LogMessage "WARN","Verification","Merchant Information - Phone Number:"&arrValue&" is not displayed as expected",false
				bverifyfields_MerchantInfoStatements=false
			End If
		End If	
		End Select
	Next 
		bcStatements.btnOk_MerchantInfo.click
	verifyfields_MerchantInfoStatements = bverifyfields_MerchantInfoStatements
	End Function
	
'[Verify the row data for Plans table]
Public Function verifyrowdata_Plans(arrRowDataList)
	bverifyrowdata_Plans= true
	bcStatements.weTabPlans.click
	WaitForIcallLoading
	bverifyrowdata_Plans = verifyTableContentList(bcStatements.tblStatementPlanHeader,bcStatements.tblStatementPlanContent,arrRowDataList,"Plans",false,null,null,null)
	verifyrowdata_Plans = bverifyrowdata_Plans
End Function

'[Verify the row data for Rewards Details table]
Public Function verifyrowdata_RewardsDetails(arrRowDataList)
	bverifyrowdata_RewardsDetails= true
	bcStatements.weTabRewards.click
	WaitForIcallLoading
	bverifyrowdata_RewardsDetails = verifyTableContentList(bcStatements.tblStatementRewardDetailsHeader,bcStatements.tblStatementRewardDetailsContent,arrRowDataList,"Rewards Details",false,null,null,null)
	verifyrowdata_RewardsDetails = bverifyrowdata_RewardsDetails
End Function

''[Verify the tab enabled for given product]
'Public Function verifytabs_Statements(strProduct)
'	bverifytabs_Statements= true
'	
'	Select Case (strProduct)
'		Case "Credit Card"
'		int_StatementTransactions_CreditCard=Instr(bcStatements.weTabStatementTransaction.GetROproperty("class"),"disabled-area")
'		If int_StatementTransactions_CreditCard = 0 Then
'			LogMessage "RSLT","Verification","The tab statement transactions is enabled",true
'			else
'			LogMessage "WARN","Verification","The tab statement transactions is disabled" ,false
'			bverifytabs_Statements = false
'		End If
'		
'		int_Plans_CreditCard=Instr(bcStatements.weTabPlans.GetROproperty("class"),"disabled-area")
'		If int_Plans_CreditCard= 0 Then
'			LogMessage "RSLT","Verification","The tab Plans is enabled",true
'			else
'			LogMessage "WARN","Verification","The tab Plans is disabled" ,false
'		End If
'		
'		Case "Cashline"
'		int_RewardsDetail_Cashline=Instr(bcStatements.weTabRewards.GetROproperty("class"),"disabled-area")
'		If int_RewardsDetail_Cashline=0 Then
'			LogMessage "RSLT","Verification","The tab rewards details is enabled",true
'			else
'			LogMessage "WARN","Verification","The tab rewards details is disabled" ,false
'		End If
'	End select
'End Function

'[Verify the fields of transaction description for cashline and loans]
Public Function verifyfields_TransDescCL(strMerchntCategory,strSeqNo,strAuth,strPoints,strCheqNo)
	bverifyfields_TransDescCL = true
	If bcStatements.popup_AdditionalInfo_CLLoans.exist Then
	
		If Not IsNull (strMerchntCategory) Then
			If Not verifyInnerText(bcStatements.lblMerchantCategory_CL, strMerchntCategory, "Additional Info - Merchant Category")Then
			bverifyfields_TransDescCL = False
				End If
			End If
			
		If Not IsNull (strSeqNo) Then
			If Not verifyInnerText(bcStatements.lblSequenceNo_CL, strSeqNo, "Additional Info - Sequence No")Then
			bverifyfields_TransDescCL = False
				End If
			End If
			
		If Not IsNull (strAuth) Then
			If Not verifyInnerText(bcStatements.lblAuthorisationCode_CL, strAuth, "Additional Info - Authorization Code")Then
			bverifyfields_TransDescCL = False
				End If
			End If		
		
		If Not IsNull (strPoints) Then
			If Not verifyInnerText(bcStatements.lblPointsEarned_CL, strPoints, "Additional Info - Points")Then
			bverifyfields_TransDescCL = False
				End If
			End If
	
		If Not IsNull (strCheqNo) Then
			If Not verifyInnerText(bcStatements.lblChequeNo_CL, strCheqNo, "Additional Info - Chequ No")Then
			bverifyfields_TransDescCL = False
				End If
			End If	
		else
		LogMessage "WARN","Verification","The popup for additional info does not exist" ,false
	End If
	bcStatements.btnOk_CL.click
	verifyfields_TransDescCL = bverifyfields_TransDescCL
End Function

'[Verify the link relationship statement summary is disabled for debit card cashline and loans]
Public Function verifylinkdisabled_relationshipStatSumm()
	bverifylinkdisabled_relationshipStatSumm = true
	int_relationshipSummarylink=Instr(bcStatements.lnkRelationshipSummary.GetROproperty("class"),"disabled-area")
	If int_relationshipSummarylink <>0 Then
		LogMessage "RSLT","Verification","The link relationship summaray is disabled",true
		else
		LogMessage "WARN","Verification","The link relationship summaray is enabled" ,false
	End If
	verifylinkdisabled_relationshipStatSumm = bverifylinkdisabled_relationshipStatSumm
End Function

'[Verify the content of Repayment Projection for statement]
Public Function verifyfields_RepaymentProjection(strRepaymentDur,strAmntPayable,strOutStndAmount)
	bverifyfields_RepaymentProjection = true
	bcStatements.weTabRepaymentProjection.click
	wait 2
		If Not IsNull (strRepaymentDur) Then
			If Not verifyInnerText(bcStatements.lblRepaymentDuration_RepayProjection, strRepaymentDur, "Repayment Projection")Then
			bverifyfields_RepaymentProjection = False
			End If
		End If
		
		If Not IsNull (strAmntPayable) Then
			If Not verifyInnerText(bcStatements.lblAmountPayable_RepayProjection, strAmntPayable, "Amount Payable")Then
			bverifyfields_RepaymentProjection = False
			End If
		End If
		
		If Not IsNull (strOutStndAmount) Then
			If Not verifyInnerText(bcStatements.lblOutStandingAmount_RepayProjection, strOutStndAmount, "Outstanding Amount")Then
			bverifyfields_RepaymentProjection = False
			End If
		End If		
		verifyfields_RepaymentProjection = bverifyfields_RepaymentProjection
End Function

'[Verify the content of Other tabs for statement]
Public Function verifyfields_OthersStatements(strBkCode1,strBkCode2,strCreditLimit)
	bverifyfields_OthersStatements = true
	bcStatements.weTabOthers.click
	wait 2
		If Not IsNull (strBkCode1) Then
			If Not verifyInnerText(bcStatements.lblBlockCode1, strBkCode1, "Block Code 1")Then
			bverifyfields_OthersStatements = False
			End If
		End If
		
		If Not IsNull (strBkCode2) Then
			If Not verifyInnerText(bcStatements.lblBlockCode2, strBkCode2, "Block Code 2")Then
			bverifyfields_OthersStatements = False
			End If
		End If
		
		If Not IsNull (strCreditLimit) Then
			If Not verifyInnerText(bcStatements.lblCreditLimit, strCreditLimit, "Credit Limit")Then
			bverifyfields_OthersStatements = False
			End If
		End If		
		verifyfields_OthersStatements = bverifyfields_OthersStatements
End Function
