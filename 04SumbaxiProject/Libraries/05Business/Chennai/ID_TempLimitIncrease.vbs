'[Click link displayed below Action section in Credit Cards]
Public Function ClickLink_CR(strLinkName)
bverifyLinks = ClickActionLinks(strLinkName,"Credit Card",coOverview_Page.lblActionLinks)
ClickLink_CR = bverifyLinks
End Function

'[Verify list of values in Reason for Increase dropdown displayed in Temp Limit Increase]
Public Function VerifyReasonforIncreaseDropdown(lstdrdownVals)
bVerifyValues = False
If Not IsNull(lstdrdownVals) Then
bVerifyValues = verifyComboboxItems(coTempLimit_Page.lstReasonForIncrease,lstdrdownVals,"Temp Limit Increase")		
End If
VerifyReasonforIncreaseDropdown = bVerifyValues
End Function

'[Select value from Temp Limit Increase Dropdown as]
Public Function SelectReasonforIncreaseDropdown(strItem)
bVerifyValues = False
If Not IsNull(strItem) Then
bVerifyValues = SelectComboBoxItem(coTempLimit_Page.lstReasonForIncrease,strItem,"Temp Limit Increase")		
End If
SelectReasonforIncreaseDropdown = bVerifyValues
End Function

'[Verify the Selected Card Details in the Temp Limit Increase Page]
Public Function VerifyTblSelectCardDetailsTLI(lstCardDetails)
bVerify = False
If Not IsNull(lstCardDetails) Then
bVerify = VerifyTableSingleRowData(coTempLimit_Page.tblSelectedCardHeader,coTempLimit_Page.tblSelectedCardBody,lstCardDetails,"Temp Limit Increase")		
End If
VerifyTblSelectCardDetailsTLI = bVerify
End Function

'[Verify Inline Message in Temp Limit Increase page]
Public Function VerifyInlineMsginTempLimit(strAmount,inLineMsg)
bVerify = True
bVerify1 = False
bVerify2 = True
bVerify3 = True
	If coTempLimit_Page.btnChkEligibility.Exist(0) Then
		If coTempLimit_Page.btnChkEligibility.GetROProperty("disabled") = 1 Then
			bVerify1 = True
		End If
	End If
	If Not IsNull(strAmount) Then
			If Not SetTempLimitAmtValue(coTempLimit_Page.txtNewTempCreditLimit(),strAmount,"New Temporary Credit Card Limit") Then
					bVerify = False
			End If
	Else
	bVerify = False
	End If
	
	If coTempLimit_Page.btnChkEligibility.Exist(0) Then
		coTempLimit_Page.btnChkEligibility.Click
			If Err.Number <> 0 Then
				bVerify2 = False
			End If
	Else
	bVerify2 = False
	End If
	WaitForIServeLoading
	
	If Not IsNull(inLineMsg) Then
		If Not verifyInnerText(coTempLimit_Page.lblChkEligibility(),inLineMsg,"Temp Limit Increase") Then
			bVerify3=False
		End If
	Else
	bVerify3=False
	End If
	
	If bVerify and bVerify1 and bVerify2 and bVerify3 Then
		VerifyInlineMsginTempLimit = True
	Else
		VerifyInlineMsginTempLimit = False
	End If

End Function

'[Click on Submit button in TLI]
Public Function ClickSubmitTLI()
bVerify = True
	If coTempLimit_Page.btnSubmit.Exist(0) Then
		coTempLimit_Page.btnSubmit.Click
			If Err.Number <> 0 Then
				bVerify = False
			End If
	Else
	bVerify = False
	End If
		ClickSubmitTLI = bVerify
End Function

'[Enter Comments field displayed in Temp Limit Increase]
Public Function SetcommentsTLI(strComment)
bVerify = True
	If Not IsNull(strComment) Then
			If Not SetValue(coTempLimit_Page.txtComments(),strComment,"Temp Limit Increase Comment Text box") Then
					bVerify = False
			End If
	Else
		bVerify = False
	End If
	SetcommentsTLI = bVerify
End Function

'[Verify the defualt values for Effective Date and ExpiryDate in Temp Limit Increase Page]
Public Function VerifyDateValues()
bVerify = False
ActEffectiveDate = coTempLimit_Page.txtEffectiveDate.GetRoProperty("value")
ActExpiryDate = coTempLimit_Page.txtExpiryDate.GetRoProperty("value")

If ((Cdate(Date) = Cdate(ActEffectiveDate)) And DateDiff("d",Date,ActExpiryDate)>=90) Then
	bVerify = True
End If
VerifyDateValues = bVerify
End Function

'[Verify field description displayed in TLI]
Public Function VerifyDescriptionTLI(strDesc)
bVerify = True
	If Not IsNull(strDesc) Then
		If Not verifyInnerText(coTempLimit_Page.lblDescription(),strDesc,"Temp Limit Increase") Then
			bVerify=False
		End If
	Else
	bVerify=False
	End If
VerifyDescriptionTLI = bVerify
End Function

'[Verify link Knowledge Base displayed in TLI]
Public Function VerifyKnowledgebaseTLI(strstatus)
bVerify = True
	If Not IsNull(strstatus) Then
		If coTempLimit_Page.lnkKnowledgeBase.Exist(0) Then
			stractStatus = coTempLimit_Page.lnkKnowledgeBase.GetRoProperty("disabled")
			If strstatus="Enable" Then
				If stractStatus=0 Then
					LogMessage "RSLT","Verification","Knowledge Base Button is in Enabled Mode", True
				Else
					LogMessage "RSLT","Verification","Knowledge Base Button is in Disabled Mode", False
					bVerify=False
				End If
			ElseIf strstatus="Disable" Then
				If stractStatus=1 Then
					LogMessage "RSLT","Verification","Knowledge Base Button is in Disabled Mode", True
				Else
					LogMessage "RSLT","Verification","Knowledge Base Button is in Enabled Mode", False
					bVerify=False
				End If
			Else
			bVerify=False
			End If
		Else
		   bVerify=False
		End If
	Else
	bVerify=False
	End If
	VerifyKnowledgebaseTLI = bVerify
End Function

'[Verify Submit Button Displayed in TLI]
Public Function VerifySubmit_TL(strstatus)
bVerify = True
	If Not IsNull(strstatus) Then
		If coTempLimit_Page.btnSubmit.Exist(0) Then
			stractStatus = coTempLimit_Page.btnSubmit.GetRoProperty("disabled")
			If strstatus="Enable" Then
				If stractStatus=0 Then
					LogMessage "RSLT","Verification","Submit Button is in Enabled Mode", True
				Else
					LogMessage "RSLT","Verification","Submit Button is in Disabled Mode", False
					bVerify=False
				End If
			ElseIf strstatus="Disable" Then
				If stractStatus=1 Then
					LogMessage "RSLT","Verification","Submit Button is in Disabled Mode", True
				Else
					LogMessage "RSLT","Verification","Submit Button is in Enabled Mode", False
					bVerify=False
				End If
			Else
				bVerify=False
			End If
		Else
		   bVerify=False
		End If
	Else
		   bVerify=False
	End If
	VerifySubmit_TL = bVerify
End Function

'[Enter New Temp Limit Amount and Click on Check Elegibility Link]
Public Function SetTempLimitandClickChkEligibility(strAmount)
bVerify = True
bVerify1 = False
bVerify2 = True

	If coTempLimit_Page.btnChkEligibility.Exist(0) Then
		If coTempLimit_Page.btnChkEligibility.GetROProperty("disabled") = 1 Then
			bVerify1 = True
		End If
	End If
	
	If Not IsNull(strAmount) Then
			If Not SetTempLimitAmtValue(coTempLimit_Page.txtNewTempCreditLimit(),strAmount,"New Temporary Credit Card Limit") Then
					bVerify = False
			End If
	Else
		bVerify = False
	End If
	
	If coTempLimit_Page.btnChkEligibility.Exist(0) Then
		coTempLimit_Page.btnChkEligibility.Click
			If Err.Number <> 0 Then
				bVerify2 = False
			End If
	Else
	bVerify2 = False
	End If
		
	If bVerify and bVerify1 and bVerify2 Then
		SetTempLimitandClickChkEligibility = True
	Else
		SetTempLimitandClickChkEligibility = False
	End If

End Function

'[Select Expirty Date in Temp Limit Increase page]
Public Function SelectExpiryDate_TempLimit(strExpiryDate)
bverifyDate = True
gObjIServePage.RunScript("document.getElementsByTagName('isrv-routing-proxy')[0].scrollTop = 400")
If Not IsNull(strExpiryDate) Then

	If Trim(strExpiryDate) = "TODAY" Then
	   strExpiryDate = Date()
	End If
	
	SelectExpiryDate_TempLimit =  SelectDateFromIDCalendar(coTempLimit_Page.txtExpiryDate,strExpiryDate)
	strExpExpiryDate = Right("0" & Datepart("d",strExpiryDate),2) &" "& MonthName(Right("0" & Datepart("m",strExpiryDate),2))&" " & Year(strExpiryDate)
	
	If SelectExpiryDate_TempLimit Then
	
		strActExpiryDate = coTempLimit_Page.txtExpiryDate.GetROProperty("value")
		strActExpiryDate = Right("0" & Datepart("d",strActExpiryDate),2) &" "& MonthName(Right("0" & Datepart("m",strActExpiryDate),2))&" " & Year(strActExpiryDate)
		
		If Trim(strExpExpiryDate) = Trim(strActExpiryDate) Then
		   LogMessage "RSLT","Verification","Selected date "&strExpiryDate&" in From date text box is displayed as expected", True
		   bverifyDate = True 
		Else
		   bverifyDate = False 
		End If	
		
	End If

End If
SelectExpiryDate_TempLimit = bverifyDate
End Function

'[Verify Inline message on Expiry Date in Temp Limit Increase Page]
Public Function VerifyMsgInTempLimit(inLineMsg)
bVerify = False
	
	If Not IsNull(inLineMsg) Then
		If verifyInnerText(coTempLimit_Page.lblDateMsg(),inLineMsg,"Temp Limit Increase on Expiry Date") Then
			bVerify=True
		End If
	End If
	VerifyMsgInTempLimit = bVerify
End Function

'[Verify the Cancellation message in Temp Limit Increase]
Public Function VerifyCancelationMsg_TL(YesOrNo,strMsg)
bVerify = False
bVerify1 = True
bVerify2 = True

	If coTempLimit_Page.lnkCancel.Exist(0) Then
		coTempLimit_Page.lnkCancel.Click
			If Err.Number <> 0 Then
				bVerify1 = False
			End If
	Else
	bVerify1 = False
	End If
	
	If Not IsNull(strMsg) Then
			If coTempLimit_Page.lblConfirm.Exist(0) Then
				strActMsg = coTempLimit_Page.lblConfirm.GetRoProperty("innertext")
				If Ucase(Trim(strMsg)) = Ucase(Trim(strActMsg)) Then
					bVerify = True
				End If
			End If
	End If
	
	If Not IsNull(YesOrNo) Then
		If Ucase(YesOrNo) = Ucase("Yes") Then
			If coTempLimit_Page.btnConfirmYes.Exist(0) Then
				coTempLimit_Page.btnConfirmYes.Click
				If Err.Number <> 0 Then
				bVerify2 = False
				End If
			End If
		ElseIf Ucase(YesOrNo) = Ucase("No") Then
			If coTempLimit_Page.btnConfirmNo.Exist(0) Then
				coTempLimit_Page.btnConfirmNo.Click
				If Err.Number <> 0 Then
				bVerify2 = False
				End If
			Else
			bVerify2 = False
			End If
		Else
			bVerify2 = False
		End If
	Else
			bVerify2 = False
	End If
	
	If bVerify and bVerify1 and bVerify2 Then
		VerifyCancelationMsg_TL = True
	Else
		VerifyCancelationMsg_TL = False
	End If

End Function

'[Verify Submission popup Message displayed in TLI]
Public Function VerifySubmissionInTLI(SubMsg)
bVerify = False
bVerify1 = True	
	If Not IsNull(SubMsg) Then
		If verifyInnerText(coTempLimit_Page.lblSubmissionMsg(),SubMsg,"Submission Message in Temp Limit Increase") Then
			bVerify=True
		End If
	End If
	If coTempLimit_Page.btnOK.Exist(0) Then
		coTempLimit_Page.btnOK.Click
		If Err.Number <> 0 Then
			bVerify1=False
		End If
	End If
	If bVerify and bVerify1 Then
	VerifySubmissionInTLI = True
	Else
	VerifySubmissionInTLI = False
	End If
	
End Function


Public Function SetTempLimitAmtValue(oCurrentObj,strTextToSet,strObjectName)

	blnsetTextEditField = True
	
	If Not IsNull(strTextToSet)  Then		
		If oCurrentObj.Exist(gWaitTime) Then
	        oCurrentObj.Init
	        Setting.WebPackage("ReplayType") = 2
	        oCurrentObj.Set Trim(Cstr(strTextToSet))
	        strTextSet = oCurrentObj.getROProperty("value")
	        
	        strTextToSet = Replace(strTextToSet,",","")
	        strTextToSet = Replace(strTextToSet,".","")
	        strTextSet = Replace(strTextSet,",","")
	        strTextSet = Replace(strTextSet,".","")
	        
	        If Trim(strTextToSet) = Trim(strTextSet) Then
	            LogMessage "RSLT","Verification",strObjectName & " Field : Set the text as expected: " & strTextSet ,True 
	        Else      
	        	LogMessage "WARN","Verification",strObjectName & " Field : Failed to set the text , " & "Actual is: " & strTextSet & ",Expected is: " & strTextToSet ,False
	        	blnsetTextEditField = False
	        End If
	        Setting.WebPackage("ReplayType") = 1
	    Else
	        LogMessage "WARN","Step Failure","Expected object " & strObjectName & ", Field: does not exist in current Webpage.",False
			blnsetTextEditField = False  
	    End If
	Else
		LogMessage "WARN","Verification","Input Value is Null",False
	End If
	
	SetTempLimitAmtValue = blnsetTextEditField
	
	Set oCurrentObj = Nothing
End Function
