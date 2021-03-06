'[Click the Enrollment STP shortcut button from the enquiry screen]
Public Function clickShortcutButton_Enrolment()
	bclickShortcutButton_Enrolment = true
	BankAndEarnEnrollment.btnEnrolment.click
	If Err.Number<>0 Then
       clickShortcutButton_Enrolment=false
            LogMessage "RSLT","Verification","Failed to Click shortcut button : Enrolment" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickShortcutButton_Enrolment=true	
End Function

'[Select the value from combobox crediting Account for OLS Enrolment]
Public Function selectCreditingAccCombobox_Enrolment(strCreditingAcc)
   bDevPending=false
   bselectCreditingAccCombobox_Enrolment=true
   If Not IsNull(strCreditingAcc) Then
       If Not (selectItem_Combobox (OLS_Enrolment.lstCreditingAccount_Enrolment(),strCreditingAcc))Then
            LogMessage "RSLT","Verification","Failed to select :"&strCreditingAcc&" From ApprovalLevel drop down list" ,false
           bselectCreditingAccCombobox=false
       End If
   End If
   WaitForIcallLoading
   selectCreditingAccCombobox_Enrolment=bselectCreditingAccCombobox_Enrolment
End Function

'[Verify the Description for Enrolment displayed as]
Public Function verifyDesc_OLSEnrolment(strDesc)
	bDevPending=false
   bverifyDesc_OLSEnrolment=true
   If Not IsNull(strDesc) Then
       If Not VerifyInnerText (OLS_Enrolment.lblDescription_Enrolment(), strDesc, "Description")Then
           bverifyDesc_OLSEnrolment=false
       End If
   End If
   verifyDesc_OLSEnrolment=bverifyDesc_OLSEnrolment	
End Function

'[Verify the prevalidation popup for Enrolment exist is true]
Public Function verifypopupPreVal_OLSEnrolment(bExist)
	bDevPending=False
   bActualExist=OLS_Enrolment.popupPreVal_OLSEnrolment.Exist(1)
   If bExist And  bActualExist  Then
       LogMessage "RSLT","Verification","Popup :ValidationMessage Exists As Expected" ,true
       verifypopupPreVal_OLSEnrolment=True
   ElseIf not bExist And  not bActualExist  Then
       LogMessage "RSLT","Verification","Popup :ValidationMessage does not Exists As Expected" ,true
       verifypopupPreVal_OLSEnrolment=True
   ElseIf bExist And  not bActualExist  Then
       LogMessage "WARN","Verification","Popup :ValidationMessage does not Exists As Expected" ,False
       verifypopupPreVal_OLSEnrolment=False
   ElseIf not bExist And   bActualExist  Then
       LogMessage "WARN","Verification","Popup :ValidationMessage Still Exists" ,False
       verifypopupPreVal_OLSEnrolment=False
   End If
End Function

'[Verify the pre validation message for OLS Enrolment displayed as]
Public Function verifyPreVal_OLSEnrolment(strExpectedText)
	bDevPending=False
   bverifyPreVal_OLSEnrolment=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (OLS_Enrolment.lblValMesg_Enrolment(), strExpectedText, "ValidationMessage")Then
           bverifyPreVal_OLSEnrolment=false
       End If
       OLS_Enrolment.btnOk_Preval_Enrolment.click
       else
       LogMessage "RSLT","Verification","Popup :ValidationMessage not expected" ,true
       verifypopupPreVal_OLSEnrolment=False
   End If
   verifyPreVal_OLSEnrolment=bverifyPreVal_OLSEnrolment
End Function

'[Set TextBox Comments to OLS Enrolment]
Public Function setCommentsTextbox_OLSEnrolment(strComment)
   bDevPending=false
   If not isNull(strComment) Then
	   OLS_Enrolment.txtComment_OLSEnrolment.Set(strComment)
   End If
   If Err.Number<>0 Then
       setCommentsTextbox_OLSEnrolment=false
            LogMessage "WARN","Verification","Failed to Set Text Box :Comment" ,false
       Exit Function
   End If
   setCommentsTextbox_OLSEnrolment=true
End Function

'[Verify the submit button is enabled for Enrolment STP]
Public Function verifySubmitEnabled_Enrolment()
	bverifySubmitEnabled_Enrolment = true
	enabled_Obj = OLS_Enrolment.btnSubmit_Enrolment.GetROProperty("disabled")
	If enabled_Obj <> 0 Then
 	LogMessage "RSLT","Verification","The button Submit is enabled as expected",True
 	else
 	LogMessage "RSLT","Verification","The button Submit is disabled",False
	 End If
	verifySubmitEnabled_Enrolment = bverifySubmitEnabled_Enrolment
End Function

