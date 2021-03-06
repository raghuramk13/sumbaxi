'[Verify the row data for the past verification table displayed as]
Public Function verifyrowdata_PastVerification(arrRowDataList)
	bverifyrowdata_PastVerification = true
	verifyrowdata_PastVerification = verifyTableContentList(PastVerification.tblPastVerificationHeader,PastVerification.tblPastVerificationContent,arrRowDataList,"Past Verification",true,PastVerification.lnkNext,PastVerification.lnkNext1,PastVerification.lnkPrevious)
	verifyrowdata_PastVerification = bverifyrowdata_PastVerification	
End Function

'[Verify the click for verification id from past verification table]
Public Function clickVerId_PastVerification(lstRowData)
	bclickVerId_PastVerification = true
	clickVerId_PastVerification = selectTableLink(PastVerification.tblPastVerificationHeader,PastVerification.tblPastVerificationContent,lstRowData,"Past Verification","Verification ID",true,PastVerification.lnkNext,PastVerification.lnkNext1,PastVerification.lnkPrevious)
	WaitForICallLoading
	clickVerId_PastVerification = bclickVerId_PastVerification
End Function

'[Verify the fields of the past verification summary displayed as]
Public Function verifysummary_PastVerification(lstSummary)
	bverifysummary_PastVerification = true
	intSize = Ubound(lstSummary)
	For Iterator = 0 To intSize Step 1
		arrLabel = trim(Split(lstSummary(Iterator),":")(0))
		arrValue = trim(Split(lstSummary(Iterator),":")(1))
		
	Select Case (arrLabel)
		Case "CTI Reference"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (PastVerification.lblCTIReferance(), arrValue, "CTI Reference")Then
				LogMessage "RSLT","Verification","Summary - CTI Reference:"&arrValue&" is not displayed as expected",false
				bverifysummary_PastVerification=false
			End If
		End If
		
		Case "Created By"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (PastVerification.lblCreatedby(), arrValue, "Created By")Then
				LogMessage "RSLT","Verification","Summary - Created By:"&arrValue&" is not displayed as expected",false
				bverifysummary_PastVerification=false
			End If
		End If
		
		Case "Verification Status"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (PastVerification.lblVerificationStatus(), arrValue, "Verification Status")Then
				LogMessage "RSLT","Verification","Summary - Verification Status:"&arrValue&" is not displayed as expected",false
				bverifysummary_PastVerification=false
			End If
		End If
		
		Case "Verification Start Date/Time"
		If Not IsNull(arrValue) Then
		arrvalue_new = Replace(arrValue,"@",":")
			If Not VerifyInnerText (PastVerification.lblVerifStartDateTime(), arrvalue_new, "Verification Start Date/Time")Then
				LogMessage "RSLT","Verification","Summary - Verification Start Date/Time:"&arrValue&" is not displayed as expected",false
				bverifysummary_PastVerification=false
			End If
		End If
		
		Case "Modified Start Date/Time"
		If Not IsNull(arrValue) Then
		arrvalue_new = Replace(arrValue,"@",":")
			If Not VerifyInnerText (PastVerification.lblModifieddateTime(), arrvalue_new, "Modified Start Date/Time")Then
				LogMessage "RSLT","Verification","Summary - Modified Start Date/Time:"&arrValue&" is not displayed as expected",false
				bverifysummary_PastVerification=false
			End If
		End If
		
		Case "Completion Start Date/Time"
		If Not IsNull(arrValue) Then
		 arrvalue_new = Replace(arrValue,"@",":")
			If Not VerifyInnerText (PastVerification.lblCompletionDate(), arrvalue_new, "Completion Start Date/Time")Then
				LogMessage "RSLT","Verification","Summary - Completion Start Date/Time:"&arrValue&" is not displayed as expected",false
				bverifysummary_PastVerification=false
			End If
		End If
		Case "Owner"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (PastVerification.lblOwner(), arrValue, "Owner")Then
				LogMessage "RSLT","Verification","Summary - Owner:"&arrValue&" is not displayed as expected",false
				bverifysummary_PastVerification=false
			End If
		End If
		Case "Last Modified By"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (PastVerification.lblLastModifiedBy(), arrValue, "Last Modified By")Then
				LogMessage "RSLT","Verification","Summary - Last Modified By:"&arrValue&" is not displayed as expected",false
				bverifysummary_PastVerification=false
			End If
		End If	
	End Select
	Next
	verifysummary_PastVerification = bverifysummary_PastVerification
End Function

'[Verify the identification question category is disabled]
Public Function verifyIdentification_disabled()
	bverifyIdentification_disabled = true
	obj_enabled = PastVerification.tblIdentificationQuiz.GetROProperty("disabled")
	
	If obj_enabled= 0 Then
		LogMessage "RSLT","Verification","The identification questions are disabled as expected",True
		else
		LogMessage "RSLT","Verification","The identification questions are  not disabled as expected",False
	End If
	verifyIdentification_disabled =bverifyIdentification_disabled
End function

'[Verify the portfolio questions category is disabled]
Public Function verifyPorfolioQues_disabled()
	bverifyPorfolioQues_disabled = true
	obj_enabled = PastVerification.tblPortfolioQuiz.GetROProperty("disabled")
	
	If obj_enabled= 0 Then
		LogMessage "RSLT","Verification","The portfolio questions are disabled as expected",True
		else
		LogMessage "RSLT","Verification","The portfolio questions are  not disabled as expected",False
	End If
	verifyPorfolioQues_disabled =bverifyPorfolioQues_disabled	
End Function

'[Verify the authentication questions category is disabled]
Public Function verifyAuthenticationQues_disabled()
	bverifyAuthenticationQues_disabled = true
	obj_enabled = PastVerification.tblAuthenticationQuiz.GetROProperty("disabled")
	
	If obj_enabled= 0 Then
		LogMessage "RSLT","Verification","The authentication questions are disabled as expected",True
		else
		LogMessage "RSLT","Verification","The authentication questions are  not disabled as expected",False
	End If
End Function

'[Verify the custom questions category is disabled]
Public Function verifyAuthenticationQues_disabled()
	bverifyAuthenticationQues_disabled = true
	obj_enabled = PastVerification.tblCustomQuiz.GetROProperty("disabled")
	
	If obj_enabled= 0 Then
		LogMessage "RSLT","Verification","The custom questions are disabled as expected",True
		else
		LogMessage "RSLT","Verification","The custom questions are  not disabled as expected",False
	End If
End Function

'[Verify the row data for account questions displayed as]
Public Function verifyrowdata_AccQues(arrRowDataList)
	bverifyrowdata_PastVerification = true
	verifyrowdata_PastVerification = verifyTableContentList(PastVerification.tblAccountHeader,PastVerification.tblAccountContent,arrRowDataList,"Acc Questions",false,Null,Null,Null)
	verifyrowdata_PastVerification = bverifyrowdata_PastVerification	
End Function
	
