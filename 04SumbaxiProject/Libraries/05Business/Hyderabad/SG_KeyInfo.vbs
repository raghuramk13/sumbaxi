'[Verify the Account details section 1 displayed as in KeyInfo page]
Public Function verifyAccDetails_KeyInfo(lstAccDetails)
	bverifyAccDetails_KeyInfo = true
	intSize = Ubound(lstAccDetails)
	For Iterator = 0 To intSize Step 1
		arrLabel = trim(Split(lstAccDetails(Iterator),":")(0))
		arrValue = trim(Split(lstAccDetails(Iterator),":")(1))
		
	Select Case (arrLabel)
		Case "Block Code 1"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblAccount_BlockCode1(), arrValue, "Block Code 1")Then
				LogMessage "RSLT","Verification","Card Details - Block Code 1:"&arrValue&" is not displayed as expected",false
				bverifyAccDetails_KeyInfo=false
			End If
		End If
		
		Case "Block Date"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblAccount_BlockCode1_Date(), arrValue, "Block Date")Then
				LogMessage "RSLT","Verification","Card Details - Block Date:"&arrValue&" is not displayed as expected",false
				bverifyAccDetails_KeyInfo=false
			End If
		End If
		
		Case "Block Code 2"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblAccount_BlockCode2(), arrValue, "Block Code 2")Then
				LogMessage "RSLT","Verification","Card Details - Block Code 2:"&arrValue&" is not displayed as expected",false
				bverifyAccDetails_KeyInfo=false
			End If
		End If
		
		Case "Block Date_New"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblAccount_BlockCode2_Date(), arrValue, "Block Code 2")Then
				LogMessage "RSLT","Verification","Card Details - Block Code 2:"&arrValue&" is not displayed as expected",false
				bverifyAccDetails_KeyInfo=false
			End If
		End If
		
		Case "Suspension"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblAccount_Suspension(), arrValue, "Suspension")Then
				LogMessage "RSLT","Verification","Card Details - Suspension:"&arrValue&" is not displayed as expected",false
				bverifyAccDetails_KeyInfo=false
			End If
		End If
		
		Case "60 Days Past Due"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblAccount_PastDue(), arrValue, "60 Days Past Due")Then
				LogMessage "RSLT","Verification","Card Details - 60 Days Past Due:"&arrValue&" is not displayed as expected",false
				bverifyAccDetails_KeyInfo=false
			End If
		End If
		Case "Balance To Income"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblAccount_BalToIncome(), arrValue, "Balance To Income")Then
				LogMessage "RSLT","Verification","Card Details - Balance To Income:"&arrValue&" is not displayed as expected",false
				bverifyAccDetails_KeyInfo=false
			End If
		End If
		End Select
		Next
		verifyAccDetails_KeyInfo = bverifyAccDetails_KeyInfo
End Function

'[Verify the account detail section 2 displayed as in key info page]
Public Function verifyAccDetails2_keyInfo(lstAccDetails2)
	bverifyAccDetails2_keyInfo = true
	intSize = Ubound(lstAccDetails2)
	For Iterator = 0 To intSize Step 1
		arrLabel = trim(Split(lstAccDetails2(Iterator),":")(0))
		arrValue = trim(Split(lstAccDetails2(Iterator),":")(1))
		
	Select Case (arrLabel)
		Case "Multitude Card No"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblAccount_MultitudeCardNo(), arrValue, "Multitude Card No")Then
				LogMessage "RSLT","Verification","Card Details - Multitude Card No:"&arrValue&" is not displayed as expected",false
				bverifyAccDetails2_keyInfo=false
			End If
		End If
		
		Case "Status"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblAccount_Status(), arrValue, "Status")Then
				LogMessage "RSLT","Verification","Card Details - Status:"&arrValue&" is not displayed as expected",false
				bverifyAccDetails2_keyInfo=false
			End If
		End If
		
		Case "Pricing Flag"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblAccount_PricingFlag(), arrValue, "Pricing Flag")Then
				LogMessage "RSLT","Verification","Card Details - Pricing Flag:"&arrValue&" is not displayed as expected",false
				bverifyAccDetails2_keyInfo=false
			End If
		End If
		
		Case "Primary Account No"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblAccount_PrimaryAccountNo(), arrValue, "Primary Account No")Then
				LogMessage "RSLT","Verification","Card Details - Primary Account No:"&arrValue&" is not displayed as expected",false
				bverifyAccDetails2_keyInfo=false
			End If
		End If
		
		Case "Billing Cycle"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblAccount_BillingCycle(), arrValue, "Billing Cycle")Then
				LogMessage "RSLT","Verification","Card Details - Billing Cycle:"&arrValue&" is not displayed as expected",false
				bverifyAccDetails2_keyInfo=false
			End If
		End If
		
		Case "Billing Level"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblAccount_BillingLevel(), arrValue, "Billing Level")Then
				LogMessage "RSLT","Verification","Card Details - Billing Level:"&arrValue&" is not displayed as expected",false
				bverifyAccDetails2_keyInfo=false
			End If
		End If
		End Select
		Next
		verifyAccDetails2_keyInfo = bverifyAccDetails2_keyInfo
End Function

'[Verify the account details section 3 displayed as in Key Info page]
Public Function verifyAccDetails3_KeyInfo(lstAccDetails3)
	bverifyAccDetails3_KeyInfo = true
	intSize = Ubound(lstAccDetails3)
	For Iterator = 0 To intSize Step 1
		arrLabel = trim(Split(lstAccDetails3(Iterator),":")(0))
		arrValue = trim(Split(lstAccDetails3(Iterator),":")(1))
		
	Select Case (arrLabel)
		Case "Open Date"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblAccount_OpenDate(), arrValue, "Open Date")Then
				LogMessage "RSLT","Verification","Card Details - Open Date:"&arrValue&" is not displayed as expected",false
				bverifyAccDetails3_KeyInfo=false
			End If
		End If
		
		Case "Annual Fee Date"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblAccount_AnnualFeeDate(), arrValue, "Annual Fee Date")Then
				LogMessage "RSLT","Verification","Card Details - Annual Fee Date:"&arrValue&" is not displayed as expected",false
				bverifyAccDetails3_KeyInfo=false
			End If
		End If
		
		Case "Fee Waiver Start Date"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblAccount_FeeWaiverStartDate(), arrValue, "Fee Waiver Start Date")Then
				LogMessage "RSLT","Verification","Card Details - Fee Waiver Start Date:"&arrValue&" is not displayed as expected",false
				bverifyAccDetails3_KeyInfo=false
			End If
		End If
		
		Case "Fee Waiver End Date"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblAccount_FeeWaiverEndDate(), arrValue, "Fee Waiver End Date")Then
				LogMessage "RSLT","Verification","Card Details - Fee Waiver End Date:"&arrValue&" is not displayed as expected",false
				bverifyAccDetails3_KeyInfo=false
			End If
		End If
		End Select
		Next
		verifyAccDetails3_KeyInfo = bverifyAccDetails3_KeyInfo
End Function

'[Verify the card details section 1 displayed as in Key info page]
Public Function verifyCardDetails1_KeyInfo(lstCardDetails1)
	bverifyCardDetails1_KeyInfo = true
	intSize = Ubound(lstCardDetails1)
	For Iterator = 0 To intSize Step 1
		arrLabel = trim(Split(lstCardDetails1(Iterator),":")(0))
		arrValue = trim(Split(lstCardDetails1(Iterator),":")(1))
		
	Select Case (arrLabel)
		Case "Organization"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblOrganization(), arrValue, "Organization")Then
				LogMessage "RSLT","Verification","Card Details - Organization:"&arrValue&" is not displayed as expected",false
				bverifyCardDetails1_KeyInfo=false
			End If
		End If
		
		Case "Logo"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblCard_Logo(), arrValue, "Logo")Then
				LogMessage "RSLT","Verification","Card Details - Logo:"&arrValue&" is not displayed as expected",false
				bverifyCardDetails1_KeyInfo=false
			End If
		End If
		Case "Card Face"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblCard_Face(), arrValue, "Card Face")Then
				LogMessage "RSLT","Verification","Card Details - Card Face:"&arrValue&" is not displayed as expected",false
				bverifyCardDetails1_KeyInfo=false
			End If
		End If
		
		Case "Emboss Name 1"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblCard_EmbossName1(), arrValue, "Emboss Name 1")Then
				LogMessage "RSLT","Verification","Card Details - Emboss Name 1:"&arrValue&" is not displayed as expected",false
				bverifyCardDetails1_KeyInfo=false
			End If
		End If
		
		Case "Emboss Name 2"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblCard_EmbossName2(), arrValue, "Emboss Name 2")Then
				LogMessage "RSLT","Verification","Card Details - Emboss Name 2:"&arrValue&" is not displayed as expected",false
				bverifyCardDetails1_KeyInfo=false
			End If
		End If
		
		Case "Full Name"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblCard_FullName(), arrValue, "Full Name")Then
				LogMessage "RSLT","Verification","Card Details - Full Name:"&arrValue&" is not displayed as expected",false
				bverifyCardDetails1_KeyInfo=false
			End If
		End If
		
		Case "Block Code 1"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblCard_BlockCode(), arrValue, "Block Code 1")Then
				LogMessage "RSLT","Verification","Card Details - Block Code 1:"&arrValue&" is not displayed as expected",false
				bverifyCardDetails1_KeyInfo=false
			End If
		End If
		
		Case "Block Code Date"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblCard_BlockDate(), arrValue, "Block Code Date")Then
				LogMessage "RSLT","Verification","Card Details - Block Code Date:"&arrValue&" is not displayed as expected",false
				bverifyCardDetails1_KeyInfo=false
			End If
		End If
		
		Case "Need To Activate"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblCard_NeedToActivate(), arrValue, "Need To Activate")Then
				LogMessage "RSLT","Verification","Card Details - Need To Activate:"&arrValue&" is not displayed as expected",false
				bverifyCardDetails1_KeyInfo=false
			End If
		End If
		End Select
	Next
	verifyCardDetails1_KeyInfo = bverifyCardDetails1_KeyInfo
End Function


'[Verify the card details section 2 displayed in key info page]
Public Function verifyCardDetils2_KeyInfo(lstCardDetails2)
	bverifyCardDetils2_KeyInfo = true
	intSize = Ubound(lstCardDetails2)
	For Iterator = 0 To intSize Step 1
		arrLabel = trim(Split(lstCardDetails2(Iterator),":")(0))
		arrValue = trim(Split(lstCardDetails2(Iterator),":")(1))
		
	Select Case (arrLabel)
		Case "Last Card Issued Date"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblCard_IssueDate(), arrValue, "Last Card Issued Date")Then
				LogMessage "RSLT","Verification","Card Details - Last Card Issued Date:"&arrValue&" is not displayed as expected",false
				bverifyCardDetils2_KeyInfo=false
			End If
		End If
		
		Case "Card Expiry Date"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblCard_ExpiryDate(), arrValue, "Card Expiry Date")Then
				LogMessage "RSLT","Verification","Card Details - Card Expiry Date:"&arrValue&" is not displayed as expected",false
				bverifyCardDetils2_KeyInfo=false
			End If
		End If
		
		Case "Prev Card Expiry Date"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblCard_PrevCardExpiryDate(), arrValue, "Prev Card Expiry Date")Then
				LogMessage "RSLT","Verification","Card Details - Prev Card Expiry Date:"&arrValue&" is not displayed as expected",false
				bverifyCardDetils2_KeyInfo=false
			End If
		End If
		
		Case "Annual Fee Amount"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblCard_AnnualFeeAmount(), arrValue, "Annual Fee Amount")Then
				LogMessage "RSLT","Verification","Card Details - Annual Fee Amount:"&arrValue&" is not displayed as expected",false
				bverifyCardDetils2_KeyInfo=false
			End If
		End If
		
		Case "Current Fee Date"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblCard_CurrentFeeDate(), arrValue, "Current Fee Date")Then
				LogMessage "RSLT","Verification","Card Details - Current Fee Date:"&arrValue&" is not displayed as expected",false
				bverifyCardDetils2_KeyInfo=false
			End If
		End If
		
		Case "Annual Fee Reversal Flag"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblCard_AnnualFeeReversalFlag(), arrValue, "Annual Fee Reversal Flag")Then
				LogMessage "RSLT","Verification","Card Details - Annual Fee Reversal Flag"&arrValue&" is not displayed as expected",false
				bverifyCardDetils2_KeyInfo=false
			End If
		End If
		
		Case "Next Fee Date"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblCard_NextFeeDate(), arrValue, "Next Fee Date")Then
				LogMessage "RSLT","Verification","Card Details - Next Fee Date"&arrValue&" is not displayed as expected",false
				bverifyCardDetils2_KeyInfo=false
			End If
		End If
		End Select
		Next
		verifyCardDetils2_KeyInfo = bverifyCardDetils2_KeyInfo
End Function

'[Verify the card details section 3 displayed in key info page]
Public Function verifyCardDetils3_KeyInfo(lstCardDetails3)
	bverifyCardDetils3_KeyInfo = true
	intSize = Ubound(lstCardDetails3)
	For Iterator = 0 To intSize Step 1
		arrLabel = trim(Split(lstCardDetails3(Iterator),":")(0))
		arrValue = trim(Split(lstCardDetails3(Iterator),":")(1))
		
	Select Case (arrLabel)
		Case "Main/Supplementary Indicator"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblCard_MainSupplementaryIndicator(), arrValue, "Main/Supplementary Indicator")Then
				LogMessage "RSLT","Verification","Card Details - Main/Supplementary Indicator:"&arrValue&" is not displayed as expected",false
				bverifyCardDetils3_KeyInfo=false
			End If
		End If
		
		Case "CVV Code"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblCard_CVVCode(), arrValue, "CVV Code")Then
				LogMessage "RSLT","Verification","Card Details - CVV Code:"&arrValue&" is not displayed as expected",false
				bverifyCardDetils3_KeyInfo=false
			End If
		End If
		
		Case "Previous/New Card Number"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblCard_Previous_NewCardNumber(), arrValue, "Previous/New Card Number")Then
				LogMessage "RSLT","Verification","Card Details - Previous/New Card Number:"&arrValue&" is not displayed as expected",false
				bverifyCardDetils3_KeyInfo=false
			End If
		End If
		
		Case "NFC Mobile No"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblCard_NFCMobileNo(), arrValue, "NFC Mobile No")Then
				LogMessage "RSLT","Verification","Card Details - NFC Mobile No:"&arrValue&" is not displayed as expected",false
				bverifyCardDetils3_KeyInfo=false
			End If
		End If
		
		Case "NFC Mobile Operator ID"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblCard_NFCMobileOperatorID(), arrValue, "NFC Mobile Operator ID")Then
				LogMessage "RSLT","Verification","Card Details - NFC Mobile Operator ID:"&arrValue&" is not displayed as expected",false
				bverifyCardDetils3_KeyInfo=false
			End If
		End If
		
		Case "Com Gateway Enrollment"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblCard_ComGatewayEnrollment(), arrValue, "Com Gateway Enrollment")Then
				LogMessage "RSLT","Verification","Card Details - Com Gateway Enrollment:"&arrValue&" is not displayed as expected",false
				bverifyCardDetils3_KeyInfo=false
			End If
		End If
		
		Case "Card Type"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblCard_CardType(), arrValue, "Card Type")Then
				LogMessage "RSLT","Verification","Card Details - Card Type:"&arrValue&" is not displayed as expected",false
				bverifyCardDetils3_KeyInfo=false
			End If
		End If
		
		Case "Mailer"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblCard_Mailer(), arrValue, "Mailer")Then
				LogMessage "RSLT","Verification","Card Details - Mailer:"&arrValue&" is not displayed as expected",false
				bverifyCardDetils3_KeyInfo=false
			End If
		End If
		End Select
		Next
		verifyCardDetils3_KeyInfo = bverifyCardDetils3_KeyInfo
End Function

'[Verify loan section displayed as in key info page]
Public Function verifyCardLoanDetils_KeyInfo(lstCardLoanDetails)
	bverifyCardLoanDetils_KeyInfo = true
	intSize = Ubound(lstCardLoanDetails)
	For Iterator = 0 To intSize Step 1
		arrLabel = trim(Split(lstCardLoanDetails(Iterator),":")(0))
		arrValue = trim(Split(lstCardLoanDetails(Iterator),":")(1))
		
	Select Case (arrLabel)
		Case "Loan Code"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblLoanCode(), arrValue, "Loan Code")Then
				LogMessage "RSLT","Verification","Card Details - Loan Code:"&arrValue&" is not displayed as expected",false
				bverifyCardLoanDetils_KeyInfo=false
			End If
		End If
		
		Case "Loan Status"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblLoanStatus(), arrValue, "Loan Status")Then
				LogMessage "RSLT","Verification","Card Details - Loan Status:"&arrValue&" is not displayed as expected",false
				bverifyCardLoanDetils_KeyInfo=false
			End If
		End If
		
		Case "Last Advice Date"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblLastAdviceDate(), arrValue, "Last Advice Date")Then
				LogMessage "RSLT","Verification","Card Details - Last Advice Date:"&arrValue&" is not displayed as expected",false
				bverifyCardLoanDetils_KeyInfo=false
			End If
		End If
		
		Case "Matric Number"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblMetricNo(), arrValue, "Matric Number")Then
				LogMessage "RSLT","Verification","Card Details - Matric Number:"&arrValue&" is not displayed as expected",false
				bverifyCardLoanDetils_KeyInfo=false
			End If
		End If
		
		Case "Student NS Code"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblStudentNSCode(), arrValue, "Student NS Code")Then
				LogMessage "RSLT","Verification","Card Details - Student NS Code:"&arrValue&" is not displayed as expected",false
				bverifyCardLoanDetils_KeyInfo=false
			End If
		End If
		
		Case "Institution Name"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblInstitutionName(), arrValue, "Institution Name")Then
				LogMessage "RSLT","Verification","Card Details - Institution Name:"&arrValue&" is not displayed as expected",false
				bverifyCardLoanDetils_KeyInfo=false
			End If
		End If
		End Select
		Next
		verifyCardLoanDetils_KeyInfo =bverifyCardLoanDetils_KeyInfo
End Function

'********************OFSA feature**************************************************************************
'[Verify and click on the View Details link in key info page]
Public Function verifyViewDetails_KeyInfo()
bverifyViewDetails_KeyInfo = true
If bcKeyInfo.lnkViewDetails.exist Then
bcKeyInfo.lnkViewDetails.Click
WaitForICallLoading
	If Err.Number <> 0 Then
	   LogMessage "RSLT","Verification","The Link View Details is clicked successfully",False
	   bverifyViewDetails_KeyInfo = False 
	Else 
	   LogMessage "RSLT","Verification","The Link View Details is clicked successfully",true
	End IF
	'If bcKeyInfo.popupBlockDetails.Exist Then
	'	LogMessage "RSLT","Verification","The Link View Details is clicked successfully",true
	'else
	'	LogMessage "RSLT","Verification","The Link View Details is clicked successfully",False
	'	End If		
End If
verifyViewDetails_KeyInfo = bverifyViewDetails_KeyInfo
End Function

'[Verify the row data for Ofsa details table displayed as]
Public Function verifyrowdata_OFsaDetails(arrRowDataList)
	bverifyrowdata_OFsaDetails = true
	verifyrowdata_OFsaDetails = verifyTableContentList(bcKeyInfo.tblOfsaDetailsHeader,bcKeyInfo.tblOfsaDetailsContent,arrRowDataList,"OFSA Details",false,null,null,null)
	verifyrowdata_OFsaDetails = bverifyrowdata_OFsaDetails
End Function

'[Verify the fields of OFSA details displayed as]
Public Function verifyOFSAFields_KeyInfo(lstOfsaDetails)
    bverifyOFSAFields_KeyInfo = true
	intSize = Ubound(lstOfsaDetails)
	For Iterator = 0 To intSize Step 1
		arrLabel = trim(Split(lstOfsaDetails(Iterator),":")(0))
		arrValue = trim(Split(lstOfsaDetails(Iterator),":")(1))
		
	Select Case (arrLabel)
		Case "Block Code 1"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblBlockCode1_OFSA(), arrValue, "Block Code 1")Then
				LogMessage "RSLT","Verification","OFSA Details - Block Code 1:"&arrValue&" is not displayed as expected",false
				bverifyOFSAFields_KeyInfo=false
			End If
		End If
		
		Case "Block Code 2"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblBlockCode2_OFSA(), arrValue, "Block Code 2")Then
				LogMessage "RSLT","Verification","OFSA Details - Block Code 2:"&arrValue&" is not displayed as expected",false
				bverifyOFSAFields_KeyInfo=false
			End If
		End If
		
		Case "Warning Code"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblWarnCode_OFSA(), arrValue, "Warning Code")Then
				LogMessage "RSLT","Verification","OFSA Details - Warning Code:"&arrValue&" is not displayed as expected",false
				bverifyOFSAFields_KeyInfo=false
			End If
		End If
		
		Case "Purge Date"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblPurgeDate_OFSA(), arrValue, "Purge Date")Then
				LogMessage "RSLT","Verification","OFSA Details - Purge Date:"&arrValue&" is not displayed as expected",false
				bverifyOFSAFields_KeyInfo=false
			End If
		End If
		
		Case "Account Purge Date"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblAccountPurgeDate_OFSA(), arrValue, "Account Purge Date")Then
				LogMessage "RSLT","Verification","OFSA Details - Account Purge Date:"&arrValue&" is not displayed as expected",false
				bverifyOFSAFields_KeyInfo=false
			End If
		End If
		
		Case "VIP Amount"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcKeyInfo.lblvipAmount_OFSA(), arrValue, "VIP Amount")Then
				LogMessage "RSLT","Verification","OFSA Details - VIP Amount:"&arrValue&" is not displayed as expected",false
				bverifyOFSAFields_KeyInfo=false
			End If
		End If	
		End Select
		Next
		WaitForICallLoading
		bcKeyInfo.btnOk_OFSAPopup.Click
		verifyOFSAFields_KeyInfo = bverifyOFSAFields_KeyInfo
End Function

		
