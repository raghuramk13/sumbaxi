'[Click on Payment/Refund button displayed]
Public Function clickBtnPaymentRefund_PR()
   WaitForICallLoading
	PaymentRefund.btnPaymentRefund.click
	If Err.Number<>0 Then
       clickBtnPaymentRefund_PR=false
       LogMessage "WARN","Verification","Failed to Click Button : Payment Refund" ,false
       Exit Function
   End If
    clickBtnPaymentRefund_PR=true
	WaitForICallLoading
End Function

'[Verify Validation Message displayed on navigating to Payment Refund page]
Public Function verifyMessage_PR(strExpectedText)
   bverifyMessage=true
   WaitForICallLoading
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (PaymentRefund.lblValidationMsg(), strExpectedText, "Validation Message")Then
           bverifyMessage=false
       End If
   End If
   Wait(5)
   PaymentRefund.btnOK.Click
   verifyMessage_PR = bverifyMessage
End Function

'[Select Combox Request type displayed]
Public Function selectComboRequestType_PR(strRequestType)
	bselectComboRequestType=true
	If Not IsNull(strRequestType) Then
       If Not (selectItem_Combobox (PaymentRefund.CmbRequestType(), strRequestType))Then
            LogMessage "WARN","Verification","Failed to select :"&strRequestType&" from Request type drop down list" ,false
           bselectComboRequestType=false
       End If
   End If
   selectComboRequestType_PR=bselectComboRequestType
   WaitForICallLoading
End Function

'[Verify Selected Cards table displayed in Payment Refund Page]
Public Function verifytblSelectedCards_PR(arrRowDataList)
	WaitForICallLoading
	Wait(2)
  	verifytblSelectedCards_PR=verifyTableContentList(PaymentRefund.tblSelectedAccountHeader,PaymentRefund.tblSelectedAccountContent,arrRowDataList,"Selected Account/Card" , false,null ,null,null)
End Function

'[Verify Account Balance details table displayed in Payment Refund Page]
Public Function verifytblAccountBaldetails_PR(arrRowDataList)
   WaitForICallLoading
   Wait(2)
   verifytblAccountBaldetails_PR=verifyTableContentList(PaymentRefund.tblAccountBalanceHeader,PaymentRefund.tblAccountBalanceContent,arrRowDataList,"Account Balance Details" , false,null ,null,null)
End Function

'[Verify Excess Payment Refund Amount displayed in the Payment Refund Page]
Public Function verifyExcessPaymentRefund_PR(strExcessRefund)
	bverifyExcessPaymentRefund=true
	If Not IsNull(strExcessRefund) Then
       If Not VerifyInnerText (PaymentRefund.lblExcessPaymentRefund(), strExcessRefund, "Excess Payment Refund")Then
           bverifyExcessPaymentRefund = false
       End If
   End If
   verifyExcessPaymentRefund_PR = bverifyExcessPaymentRefund
End Function

'[Verify Info Messages displayed in the Payment Refund Page]
Public Function verifyPaymentInfoMessage_PR(strInfoMsg1,strInfoMsg2)
	bverifyPaymentInfoMessage=true
	If Not IsNull(strInfoMsg1) Then
       If Not VerifyInnerText (PaymentRefund.lblPaymentInfomsg1(), strInfoMsg1, "Info message line1 displayed below Excess Payment Amount") Then
           bverifyPaymentInfoMessage = false
           Exit Function 
       End If
   End If
   
  If Not IsNull(strInfoMsg2) Then
       If Not VerifyInnerText (PaymentRefund.lblPaymentInfomsg2(), strInfoMsg2, "Info message line2 displayed below Excess Payment Amount") Then
           bverifyPaymentInfoMessage = false
       End If
   End If
   verifyPaymentInfoMessage_PR = bverifyPaymentInfoMessage
End Function

'[Set TextBox Amount on Payment Refund Page]
Public Function SetAmount_PR(strAmount)
   PaymentRefund.txtAmount.Set(strAmount)
   If Err.Number<>0 Then
       SetAmount_PR=false
       LogMessage "WARN","Verification","Failed to Set Text Box :Requested Amount" ,false
       Exit Function
   End If
   SetAmount_PR=true
End Function

'[Verify Inline error Message on Payment Refund Page]
Public Function verifyInlineErrorMessage_PR(strInLineMessage)
	bverifyInlineErrorMessage=true
	WaitForICallLoading
	If Not IsNull(strInLineMessage) Then
	   WaitForICallLoading
       If Not VerifyInnerText (PaymentRefund.lblInlineMsg(), strInLineMessage, "Inline Error Message")Then
           bverifyInlineErrorMessage=false
       End If
   End If
   verifyInlineErrorMessage_PR=bverifyInlineErrorMessage
End Function

'[Verify default Account Number in Payment Refund Page displayed as]
Public Function VerifyAccountNumber_PR(strAccNo)
   bVerifyAccountNumber=true
   If Not IsNull(strAccNo) Then
       If Not verifyComboSelectItem (PaymentRefund.lstAccounts(),strAccNo, "Debiting Account")Then
    	  LogMessage "WARN","Verification","Expected Default Account Number:"&strAccNo&" not displayed in the Debiting Account field" ,false
          bVerifyDebitAccountNumber=false
       End If
   End If
   VerifyAccountNumber_PR = bVerifyAccountNumber
End Function

'[Verify list of Account numbers displayed in Account dropdown]
Public Function VerifylistDebitingAccounts_PR(lstAccNo) 
	bVerifylistDebitingAccounts = True 
	If Not IsNull(lstAccNo) Then
       If Not verifyComboboxItems(PaymentRefund.lstAccounts(),lstAccNo, "Account/Card No.")Then
       	   LogMessage "WARN","Verification","List of Debiting Account Numbers displayed in the combox box is not as expected" ,false
           bVerifylistDebitingAccounts = False
       End If
   End If
   VerifylistDebitingAccounts_PR = bVerifylistDebitingAccounts
End Function

'[Select Account Number combox box as]
Public Function SelectDebitingAccountNo_PR(strAccNo)
	bSelectDebitAccountNo=true
	If Not IsNull(strAccNo) Then
       If Not (selectItem_Combobox (PaymentRefund.lstAccounts(), strAccNo))Then
           LogMessage "WARN","Verification","Failed to select :"&strAccNo&" From Debiting Account dropdown list" ,false
           bSelectDebitAccountNo=false
       End If
   End If
   WaitForICallLoading
   SelectDebitingAccountNo_PR = bSelectDebitAccountNo
End Function

'[Verify list of values displayed in Mode of Refund dropdown]
Public Function VerifylstRefundMode_PR(lstRefundMode) 
	bVerifylstRefundMode = True 
	If Not IsNull(lstRefundMode) Then
       If Not verifyComboboxItems(PaymentRefund.CmbRefundMode(),lstRefundMode, "Mode of Refund.")Then
       	   LogMessage "WARN","Verification","List of Mode of Refund displayed in the combox box is not as expected" ,false
           bVerifylstRefundMode = False
       End If
   End If
   VerifylstRefundMode_PR = bVerifylstRefundMode
End Function

'[Select mode of refund combox box as]
Public Function SelectRefundMode_PR(strRefundMode)
   bSelectRefundMode=true
   If Not IsNull(strRefundMode) Then
       If Not(selectItem_Combobox(PaymentRefund.CmbRefundMode(), strRefundMode))Then
           LogMessage "WARN","Verification","Failed to select :"&strRefundMode&" From Mode of Refund dropdown list" ,false
           bSelectRefundMode=false
       End If
   End If
   WaitForICallLoading
   SelectRefundMode_PR = bSelectRefundMode
End Function

'[Verify default Mode of Refund in Payment Refund Page displayed as]
Public Function VerifydefaultModeRefund_PR(strDefaultRefundMode)
   bVerifydefaultModeRefund=true
   If Not IsNull(strDefaultRefundMode) Then
       If Not verifyComboSelectItem (PaymentRefund.CmbRefundMode(),strDefaultRefundMode, "Mode of Refund")Then
    	  LogMessage "WARN","Verification","Expected Default Mode of Refund:"&strDefaultRefundMode&" not displayed in the Mode of Refund field" ,false
          bVerifydefaultModeRefund=false
       End If
   End If
   VerifydefaultModeRefund_PR = bVerifydefaultModeRefund
End Function

'[Verify Inline Info Message displayed based on the Selected Account]
Public Function verifyInlineInfoMessage_PR(strInLineMessage)
	bverifyInlineInfoMessage=true
	If Not IsNull(strInLineMessage) Then
       If Not VerifyInnerText (PaymentRefund.lblAvailableBalInfo(), strInLineMessage, "Inline Info Message")Then
           bverifyInlineInfoMessage = false
       End If
   End If
   verifyInlineInfoMessage_PR = bverifyInlineInfoMessage
End Function

'[Verify if SMS Checkbox is selected as default in Payment Refund Page]
Public Function verifySMSCheckBox_PR(SMSIndicator)
	bverifySMSCheckBox = True
	If Not IsNull(SMSIndicator) Then
		intSMS=Instr(PaymentRefund.SMSCheckbox.GetROproperty("outerhtml"),"checked")
		If not intSMS=0 Then
			LogMessage "RSLT","Verification","SMS Checkbox is selected as expected.",True
			bverifySMSCheckBox = True
		Else
			LogMessage "WARN","Verifiation","SMS Checkbox is unchecked. Expected to be selected.",false
			bverifySMSCheckBox = False
		End If
	End If
	verifySMSCheckBox_PR = bverifySMSCheckBox
End Function

'[Verify Registered Mobile Number displayed for SMS Indicator]
Public Function verifyMobileNumber_PR(strMobile)
	bverifyUnregisterMobileInfo=true
	If Not IsNull(strMobile) Then
       If Not VerifyInnerText (PaymentRefund.lblMobileNumber(), strMobile, "Unregister Mobile Info")Then
           bverifyUnregisterMobileInfo=false
       End If
   End If
   verifyUnregisterMobileInfo_PR = bverifyUnregisterMobileInfo
End Function

'[Verify Info Message for Unregister Mobile Number]
Public Function verifyUnregisterMobileInfo_PR(strUnregMObileInfo)
	bverifyUnregisterMobileInfo=true
	If Not IsNull(strUnregMObileInfo) Then
       If Not VerifyInnerText (PaymentRefund.lblMobileNumber(), strUnregMObileInfo, "Unregister Mobile Info")Then
           bverifyUnregisterMobileInfo=false
       End If
   End If
   verifyUnregisterMobileInfo_PR = bverifyUnregisterMobileInfo
End Function

'[Verify Payee Name displayed on Payment Refund Page]
Public Function verifyPayeeName_PR(strPayeeName)
	bverifyPayeeName=true
	If Not IsNull(strPayeeName) Then
       If Not VerifyInnerText (PaymentRefund.lblPayeeName(), strPayeeName, "Payee Name") Then
           bverifyPayeeName = false
       End If
   End If
   verifyPayeeName_PR = bverifyPayeeName
End Function

'[Verify Submit Button display on Payment Refund Page]
Public Function VerifySubmitBtn_PR(strAction)
	bDevPending=false
   	bVerifySubmitBtn=true
    If strAction = "Enabled" Then
    	intBtnSubmit=Instr(PaymentRefund.btnSubmit.GetROproperty("outerhtml"),("v-disabled"))
		If  intBtnSubmit=0 Then
			LogMessage "RSLT","Verification","Submit button is enabled as expected.",True
			bVerifySubmitBtn=true
		Else
			LogMessage "WARN","Verifiation","Submit button is disabled.",false
			bVerifySubmitBtn=false
		End If
	ElseIf strAction = "Disabled" Then
	    	intBtnSubmit=Instr(PaymentRefund.btnSubmit.GetROproperty("outerhtml"),("v-enabled"))
		If  intBtnSubmit=0 Then
			LogMessage "RSLT","Verification","Submit button is disabled as expected.",True
			bVerifySubmitBtn=true
		Else
			LogMessage "WARN","Verifiation","Submit button is enabled.",false
			bVerifySubmitBtn=false
		End If
	End If 
	VerifySubmitBtn_PR=bVerifySubmitBtn
End Function

'[Verify Field Description displayed on Payment Refund Screen as]
Public Function verifytextDescription_PR(strExpectedText)
   bverifyDescriptionText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (PaymentRefund.lblDescription(), strExpectedText, "Description")Then
           bverifyDescriptionText=false
       End If
   End If
   verifytextDescription_PR = bverifyDescriptionText
End Function

'[Verify Field KnowledgeBase on Payment Refund SR Screen displayed as]
Public Function verifyKnowledgeBase_PR(strExpectedLink)
   bDevPending=false
   bverifyKnowledgeBase = True
   If Not IsNull(strExpectedLink) Then		
		Set oDesc_KB = Description.Create()
			oDesc_KB("micclass").Value = "Link"		
			strKBLink=PaymentRefund.lnkKnowledgeBase.GetROProperty("href")
			strExpectedLink=Replace(strExpectedLink,"@","=")
       If not MatchStr(strKBLink, strExpectedLink)Then
		   LogMessage "RSLT","Verification","Knowledge base link does not matched with expected. Actual : "&strKBLink&" Expected "&strExpectedLink,false
           bverifyKnowledgeBase=false
	   else
	 		LogMessage "RSLT","Verification","Knowledge base link matrched with expected",true
       End If
   End If
   verifyKnowledgeBase_PR = bverifyKnowledgeBase
End Function

'[Set TextBox Comment on Payment Refund Page]
Public Function setCommentsTextbox_PR(strComment)
   strTimeStamp = ""&now
   strComment =strComment &" "&strTimeStamp
   gstrRuntimeCommentStep="Set TextBox Comment on Address Change to"
   insertDataStore "SRComment", strComment	
   PaymentRefund.txtComment.Set strComment
   WaitForIcallLoading
   If Err.Number<>0 Then
       setCommentsTextbox_PR=false
            LogMessage "WARN","Verification","Failed to Set Text Box :Comments" ,false
       Exit Function
   End If
   setCommentsTextbox_PR=true
End Function

'[Click Button Submit on Payment Refund Page]
Public Function clickButtonbtnSubmit_PR()
   PaymentRefund.btnSubmit.click
   WaitForIcallLoading
   If Err.Number<>0 Then
       clickButtonbtnSubmit_PR=false
            LogMessage "WARN","Verification","Failed to Click Button : Submit" ,false
       Exit Function
   End If
   WaitForIcallLoading
   clickButtonbtnSubmit_PR=true
End Function

'[Click Button Cancel on Payment Refund Page]
Public Function clickButtonCancel_PR()
   PaymentRefund.btnCancel.click
   If Err.Number<>0 Then
       clickButtonCancel_PR=false
            LogMessage "WARN","Verification","Failed to Click Button : Cancel" ,false
       Exit Function
   End If
   WaitForIcallLoading
   clickButtonCancel_PR=true
End Function

'[Verify the Cancel Confirmation message in Payment Refund Page displayed as]
Public Function verifyConfirmationCancel_PR(strConfirmMsg)
   bverifyConfirmationCancel=true
   If Not IsNull(strConfirmMsg) Then
       If Not verifyInnerText(PaymentRefund.lblValidationMsg(),strConfirmMsg, "ConfirmationPopup")Then
			bverifyConfirmationCancel = False
		End If
   End If
   verifyConfirmationCancel_PR = bverifyConfirmationCancel
End Function

'[Verify Field CardNumber on Request Submitted Popup for Payment Refund displayed as]
Public Function verifyRequestedCardNumber_PR(strCardNumber)
   bVerifyCardNumber=true
   If Not IsNull(strCardNumber) Then
       If Not VerifyInnerText (PaymentRefund.lblCardNumberSR(), strCardNumber, "CardNumber_SR")Then
           bVerifyCardNumber=false
       End If
   End If
   verifyRequestedCardNumber_PR = bVerifyCardNumber
End Function

'[Verify Field ProductDescription on Request Submitted Popup for Payment Refund displayed as]
Public Function verifyProductDescription_PR(strProductDescription)
   bVerifyProductDescription=true
   If Not IsNull(strProductDescription) Then
       If Not VerifyInnerText (PaymentRefund.lblProductDescriptionSR(), strProductDescription, "ProductDescription_RequestSubmitted")Then
           bVerifyProductDescription=false
       End If
   End If
   verifyProductDescription_PR = bVerifyProductDescription
End Function

'[Verify Field Status on Request Submitted Popup for Payment Refund displayed as]
Public Function verifySRStatus_RequestSubmitted(strExpectedText)
   bVerifyStatus=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (PaymentRefund.lblStatusSR(), strExpectedText, "Status_RequestSubmitted")Then
           bVerifyStatus = false
       End If
   End If
   verifySRStatus_RequestSubmitted = bVerifyStatus
End Function

'[Click Close button on Request Submitted Popup for Payment Refund]
Public Function clickBtnClose_RequestSubmittedFR()
   PaymentRefund.btnClose.click
   If Err.Number<>0 Then
       clickBtnClose_RequestSubmittedFR=false
       LogMessage "WARN","Verification","Failed to Click Button : Close_RequestSubmitted" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickBtnClose_RequestSubmittedFR = True
End Function

'[Verify tab close]
Public Function verifytabclose(strTabName)
	bverifyTab = verifyTabExist(strTabName)
	If verifyTab = True Then
	   LogMessage "WARN","Verification","Failed to Close tab : "&strTabName&" ",False
	End If
	verifytabclose = bverifyTab
End Function

'[Verify Field Validation Message in Payment Refund Page displayed as]
Public Function verifyValidationMessage_PR(strExpectedText)
   bverifyValidationMessage=true
   WaitForIcallLoading
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (PaymentRefund.lblValidationMessage(), strExpectedText, "ValidationMessage")Then
           bverifyValidationMessage=false
       End If
   End If
   verifyValidationMessage_PR = bverifyValidationMessage
End Function

'[Click OK Button displayed in Payment Refund Page]
Public Function clickButtonOK_ValidationPopup_PR()
WaitForIcallLoading
   PaymentRefund.btnOK_ValidationMsg.click
   If Err.Number<>0 Then
       clickButtonOK_ValidationPopup_PR=false
            LogMessage "WARN","Verification","Failed to Click Button : OK_ValidationPopup" ,false
       Exit Function
   End If
   clickButtonOK_ValidationPopup_PR=true
End Function

'[Set TextBox on Payment Refund Page Comment to]
Public Function setCommentsTextbox_PR(strComment)
   PaymentRefund.txtComment.Set strComment
   If Err.Number<>0 Then
       setCommentsTextbox_PR=false
            LogMessage "WARN","Verification","Failed to Set Text Box :Comments" ,false
       Exit Function
   End If
   setCommentsTextbox_PR=true
End Function

'[Verify Mailing Address1 displayed on Payment Refund Page]
Public Function VerifyAddress1_PR(StrAddress1)
	bVerifyAddress = True
   If Not IsNull(StrAddress1) Then
       If Not VerifyInnerText (PaymentRefund.lblAddress1(), StrAddress1, "Address1") Then
           bVerifyAddress=false
       End If
   End If
   VerifyAddress1_PR= bVerifyAddress
End Function

'[Verify Mailing Address2 displayed on Payment Refund Page]
Public Function VerifyAddress2_PR(StrAddress2)
	bVerifyAddress = True
   If Not IsNull(StrAddress2) Then
       If Not VerifyInnerText (PaymentRefund.lblAddress2(), StrAddress2, "Address2") Then
           bVerifyAddress=false
       End If
   End If
   VerifyAddress2_PR= bVerifyAddress
End Function

'[Verify Mailing Address3 displayed on Payment Refund Page]
Public Function VerifyAddress3_PR(StrAddress3)
	bVerifyAddress = True
   If Not IsNull(StrAddress3) Then
       If Not VerifyInnerText (PaymentRefund.lblAddress3(), StrAddress3, "Address3") Then
           bVerifyAddress=false
       End If
   End If
   VerifyAddress3_PR= bVerifyAddress
End Function

'[Verify Mailing Address4 displayed on Payment Refund Page]
Public Function VerifyAddress4_PR(StrAddress4)
	bVerifyAddress = True
   If Not IsNull(StrAddress4) Then
       If Not VerifyInnerText (PaymentRefund.lblAddress4(), StrAddress4, "Address4") Then
           bVerifyAddress=false
       End If
   End If
   VerifyAddress4_PR= bVerifyAddress
End Function

'[Verify Mailing Address5 displayed on Payment Refund Page]
Public Function VerifyAddress5_PR(StrAddress5)
	bVerifyAddress = True
   If Not IsNull(StrAddress5) Then
       If Not VerifyInnerText (PaymentRefund.lblAddress5(), StrAddress5, "Address5") Then
           bVerifyAddress=false
       End If
   End If
   VerifyAddress5_PR= bVerifyAddress
End Function

'[Verify Mailing postal Code displayed on Payment Refund Page]
Public Function VerifyPOstalCode_PR(StrPostalcode)
	bVerifypostalcode= True
   If Not IsNull(StrPostalcode) Then
       If Not VerifyInnerText (PaymentRefund.lblPostalCode(), StrPostalcode, "Postal Code") Then
           bVerifypostalcode=false
       End If
   End If
   VerifyPOstalCode_PR= bVerifypostalcode
End Function

'[Verify Knowledge base link on Credit Balance Refund Screen is enabled]
Public Function VerifyKnowledgebaselinkEnabled_PR()
   Dim bVerifyKnowledgebaselink:bVerifyKnowledgebaselink=true
     strKBLink=PaymentRefund.lnkKnowledgeBase.GetROProperty("Outerhtml")
	
    If inStr(strKBLink,"v-disabled") = 0 Then
		LogMessage "RSLT","Verification","Knowledge base Link  enabled successfully as expected",true
	else
		LogMessage "WARN","Verification","Knowledge base Link  does not enabledas expected",false
		bVerifyKnowledgebaselink=false
	End If
	VerifyKnowledgebaselinkEnabled_PR=bVerifyKnowledgebaselink
End Function
