'[Verify Contact Details for The Respective CIN]
Public Function verifyContactDetailsSection(strHomePhone, strHandPhone, strHandPhoneRegistered, strOfficePhone, strFaxNumber, strOfficialEmail, strMarketingEmail)
  verifyContactDetailsSection = VerifyContactDetails(strHomePhone, strHandPhone, strHandPhoneRegistered, strOfficePhone, strFaxNumber, strOfficialEmail, strMarketingEmail)
End Function

'[Click on Send SMS Buttonthe from contact details tab]
Public Function clickSendSMSBtnContactDetailsTab()
	For iCounter = 1 To 180 Step 1
		If Not bcCustomerOverview.btnSendSMS.Exist(0.5) Then
			Wait(0.5)
		else
			bcCustomerOverview.btnSendSMS.Click
			Exit for
		End if
	Next
	If Err.Number<>0 Then
       clickSendSMSBtnContactDetailsTab = false
       LogMessage "WARN","Verification","Failed to Click Send SMS Button" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickSendSMSBtnContactDetailsTab = True
End Function
