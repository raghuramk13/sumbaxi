'*****This is auto generated code using code generator please Re-validate ****************

'[Verify row Data in Table SelectedCards for Fee Reversal]
Public Function verifytblSelectedCardsContent_FR(arrRowDataList)
   WaitForICallLoading
   verifytblSelectedCardsContent_FR=verifyTableContentList(FeeReversal.tblSelectedCardsHeader,FeeReversal.tblSelectedCardsContent,arrRowDataList,"SelectedCardsContent",false,null ,null,null)
End Function

'[Verify row Data in Table SelectedTransactions for Fee Reversal]
Public Function verifytblSelectedTransactionContent_FR(arrRowDataList)
   verifytblSelectedTransactionContent_FR=verifyTableContentList(FeeReversal.tblSelectedTransactionHeader,FeeReversal.tblSelectedTransactionContent,arrRowDataList,"Selected Transaction",false,null ,null,null)
End Function

'[Click on Fee Reversal Button]
Public Function clickBtnFeeReversal()
	FeeReversal.btnFeeReversal.click
	If Err.Number<>0 Then
       clickBtnFeeReversal=false
       LogMessage "WARN","Verification","Failed to Click Button : Fee Reversal" ,false
       Exit Function
   End If
    clickBtnFeeReversal=true
	WaitForICallLoading
End Function

'[Verify Field Validation Message For Fee Reversal displayed as]
Public Function verifyValidationMessage_FR(strExpectedText)
   bDevPending=False
   bverifyValidationMessage_FR=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (FeeReversal.lblValidationMessage(), strExpectedText, "Validation Message")Then
           bverifyValidationMessage_FR=false
       End If
   End If
   wait(2)
   FeeReversal.btnOK_ValidationMsg.Click
   WaitForICallLoading
   verifyValidationMessage_FR=bverifyValidationMessage_FR
End Function

'[Verify Accrued Overdraft Interest Amount displayed in Fee Reversal screen]
Public Function verifyAccruedOverdraftAmount_FR(strAccruedOverdraftInterest)
	bverifyAccruedOverdraftAmount=true	
       If Not VerifyInnerText (FeeReversal.lblAccruedOverdraftInterest(), strAccruedOverdraftInterest, "Accrued Overdraft Interest")Then
           bverifyAccruedOverdraftAmount=false
       End If   
   verifyAccruedOverdraftAmount_FR=bverifyAccruedOverdraftAmount
End Function

'[Verify Transaction Table not available on screen]
Public Function validateTransactionTable_Exist()
	bvalidateTransactionTable_Exist=true
	If (FeeReversal.tblSelectedTransactionHeader().exist) Then
		LogMessage "WARN","Verifiation","Transaction Table exist on the screen. Expected to be unavailable.",false
		bvalidateTransactionTable_Exist
	End If
	validateTransactionTable_Exist=bvalidateTransactionTable_Exist
End Function

'[Verify Accrued Overdraft Interest Amount not available on screen]
Public Function validateAccruedOverdraft_Exist()
	bvalidateAccruedOverdraft_Exist=true
	If (FeeReversal.lblAccruedOverdraftInterest().exist) Then
		LogMessage "WARN","Verifiation","Accrued Overdraft Interest Amount exist on the screen. Expected to be unavailable.",false
		bvalidateAccruedOverdraft_Exist
	End If
	validateAccruedOverdraft_Exist=bvalidateAccruedOverdraft_Exist
End Function

'[Verify Fee Reversal Type Combobox has Items]
Public Function verifyFeeReversalTypeComboboxItems(lstItems)
   bverifyFeeReversalTypeComboboxItems=true
   If Not IsNull(lstItems) Then
       If Not verifyComboboxItems (FeeReversal.lstFeeReversalType(),lstItems, "Fee Reversal Type")Then
           bverifyFeeReversalTypeComboboxItems=false
       End If
   End If
   verifyFeeReversalTypeComboboxItems=bverifyFeeReversalTypeComboboxItems
End Function

'[Verify Combobox Fee Reversal Type displayed as]
Public Function verifyFeeReversalType_Default(strFeeReversalType)
   bverifyFeeReversalType_Default=true
   If Not IsNull(strFeeReversalType) Then
       If Not verifyComboSelectItem (FeeReversal.lstFeeReversalType(),strFeeReversalType, "Fee Reversal Type")Then
           bverifyFeeReversalType_Default=false
       End If
   End If
   verifyFeeReversalType_Default=bverifyFeeReversalType_Default
End Function

'[Select Combobox Fee Reversal Type in Fee Reversal Screen]
Public Function selectFeeReversalType_FR(strFeeReversalType)
	bselectFeeReversalType_FR=true
	If Not IsNull(strFeeReversalType) Then
       If Not (selectItem_Combobox (FeeReversal.lstFeeReversalType(), strFeeReversalType))Then
            LogMessage "WARN","Verification","Failed to select :"&strFeeReversalType&" From Fee Reversal Type drop down list" ,false
           bselectFeeReversalType_FR=false
       End If
   End If
   WaitForICallLoading
   selectFeeReversalType_FR=bselectFeeReversalType_FR
End Function

'[Set TextBox Requested Amount on Fee Reversal]
Public Function setRequestedAmount_FR(strRequestedAmount)
   FeeReversal.txtRequestedAmount.Set(strRequestedAmount)
   If Err.Number<>0 Then
       setRequestedAmount_FR=false
       LogMessage "WARN","Verification","Failed to Set Text Box :Requested Amount" ,false
       Exit Function
   End If
   setRequestedAmount_FR=true
End Function

'[Verify defaulted Requested Amount on Fee Reversal]
Public Function verifyRequestedAmount_FR(strRequestedAmount)
   bverifyRequestedAmount_FR=true
   strRequestedAmount = FormatNumber(strRequestedAmount,2)
   If Not IsNull(strRequestedAmount) Then
       If Not verifyFieldValue (FeeReversal.txtRequestedAmount(), strRequestedAmount, "Default Requested Amount")Then
           bverifyRequestedAmount_FR=false
       End If
   End If
   verifyRequestedAmount_FR=bverifyRequestedAmount_FR
End Function

'[Verify Combobox Receiving Account Type displayed as]
Public Function verifyReceivingAccount_Default(strReceivingAccount)
   bDevPending=false
   bverifyReceivingAccount_Default=true
   If Not IsNull(strReceivingAccount) Then
       If Not verifyComboSelectItem (FeeReversal.lstReceivingAccount(),strReceivingAccount, "Receiving Account")Then
           bverifyReceivingAccount_Default=false
       End If
   End If
   verifyReceivingAccount_Default=bverifyReceivingAccount_Default
End Function

'[Select Combobox Receiving Account in Fee Reversal Screen]
Public Function selectReceivingAccount_FR(strReceivingAccount)
	bselectReceivingAccount_FR=true
	If Not IsNull(strReceivingAccount) Then
       If Not (selectItem_Combobox (FeeReversal.lstReceivingAccount(), strReceivingAccount))Then
            LogMessage "WARN","Verification","Failed to select :"&strReceivingAccount&" From Receiving Account drop down list" ,false
           bselectReceivingAccount_FR=false
       End If
   End If
   WaitForICallLoading
   selectReceivingAccount_FR=bselectReceivingAccount_FR
End Function

'[Select Checkbox SMS from Fee Reversal screen]
Public Function selectCheckBoxSMS()
'	FeeReversal.chkSMS.set("ON")
	FeeReversal.chkSMS.click
	If Err.Number<>0 Then
       selectCheckBoxSMS=false
       LogMessage "WARN","Verification","Failed to Click CheckBox: SMS" ,false
       Exit Function
   End If
    selectCheckBoxSMS=true
	WaitForICallLoading
End Function

'[Verify if SMS Checkbox is selected as default for selected Request type]
Public Function verifySMSCheckBox(StrRequestType)
	bverifySMSCheckBox=true
	If Trim(StrRequestType) = "Debit Card Fee Waiver" Then
		intSMS=Instr(FeeReversal.chkSMS.GetROproperty("outerhtml"),"checked")
		If not intSMS=0 Then
		LogMessage "RSLT","Verification","SMS Checkbox is selected as expected.",True
		bverifySMSCheckBox=true
		Else
		LogMessage "WARN","Verifiation","SMS Checkbox is unchecked. Expected to be selected.",false
		bverifySMSCheckBox=false
		End If
	End If
	verifySMSCheckBox=bverifySMSCheckBox
End Function

'[Verify Info Message for Unregister Mobile Number]
Public Function verifyUnregisterMobile_Info(strInfo)
	bverifyUnregisterMobile_Info=true
	If Not IsNull(strInfo) Then
       If Not VerifyInnerText (FeeReversal.lblUnregisterMobileNumber_Info(), strInfo, "Unregister Mobile Info")Then
           bverifyUnregisterMobile_Info=false
       End If
   End If
   verifyUnregisterMobile_Info=bverifyUnregisterMobile_Info
End Function

'[Select Checkbox Suppressed Interest from Fee Reversal screen]
Public Function selectCheckBoxSuppressedInterest(strCheck)
If Not IsNull(strCheck) Then
	If Ucase(Trim(strCheck)) = "YES" Then
	   FeeReversal.chkSuppressedInterest.click
	   If Err.Number<>0 Then
       selectCheckBoxSuppressedInterest=false
       LogMessage "WARN","Verification","Failed to Click CheckBox: Suppressed Interest" ,false
       Exit Function
  	   End If
	End If
 End IF 
 selectCheckBoxSuppressedInterest=true
 WaitForICallLoading
End Function

'[Verify Field Mobile Number on Fee Reversal Screen displayed as]
Public Function verifyMobileNumber_FR(strMobileNumber)
   bDevPending=false
   bverifyMobileNumber_FR=true
   If Not IsNull(strMobileNumber) Then
       If Not VerifyInnerText (FeeReversal.lblMobileNumber(), strMobileNumber, "Mobile Number")Then
           bverifyMobileNumber_FR=false
       End If
   End If
   verifyMobileNumber_FR=bverifyMobileNumber_FR
End Function

'[Verify Field Mobile Number not availale on Fee Reversal Screen]
Public Function verifyMobileNumber_Exist()
	bverifyMobileNumber_Exist=true
	If (FeeReversal.lblMobileNumber().Exist) Then
		LogMessage "WARN","Verifiation","Mobile Number Field exist on the screen. Expected to be unavailable.",false
		bverifyMobileNumber_Exist=false
	End If
	verifyMobileNumber_Exist=bverifyMobileNumber_Exist
End Function

'[Verify Field Description displayed on Fee Reversal Screen as]
Public Function verifyDescriptionText_FR(strExpectedText)
   bDevPending=true
   bverifyDescriptionText_FR=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (FeeReversal.lblDescription(), strExpectedText, "Description")Then
           bverifyDescriptionText_FR=false
       End If
   End If
   verifyDescriptionText_FR=bverifyDescriptionText_FR
End Function

'[Verify Field KnowledgeBase on Fee Reversal SR Screen displayed as]
Public Function verifyKnowledgeBase_FR(strExpectedLink)
   bDevPending=false
   bverifyKnowledgeBase_FR=true
   If Not IsNull(strExpectedLink) Then		
		Set oDesc_KB = Description.Create()
			oDesc_KB("micclass").Value = "Link"		
			'strKBLink=FeeReversal.lnkKnowledgeBase.ChildObjects(oDesc_KB)(0).GetROProperty("href")
			strKBLink=FeeReversal.lnkKnowledgeBase.GetROProperty("href")
			strExpectedLink=Replace(strExpectedLink,"@","=")
       If not MatchStr(strKBLink, strExpectedLink)Then
		   LogMessage "RSLT","Verification","Knowledge base link does not matched with expected. Actual : "&strKBLink&" Expected "&strExpectedLink,false
           bverifyKnowledgeBase_FR=false
	   else
	 		LogMessage "RSLT","Verification","Knowledge base link matrched with expected",true
       End If
   End If
   verifyKnowledgeBase_FR=bverifyKnowledgeBase_FR
End Function

'[Verify Inline Info Message on Fee reversal Screen]
Public Function verifyInlineInfoMessage(strInLineMessage)
	bverifyInlineInfoMessage=true
	If Not IsNull(strInLineMessage) Then
       If Not VerifyInnerText (FeeReversal.lblInlineMessage_Info(), strInLineMessage, "Inline Info Message")Then
           bverifyInlineInfoMessage=false
       End If
   End If
   verifyInlineInfoMessage=bverifyInlineInfoMessage
End Function

'[Perform Add Notes by clicking Add Notes Button on Fee Reversal SR Screen]
Public Function addNote_FR(strNote)
   bDevPending=false
   baddNote_FR=true	
	If not isNull(strNote) Then
		FeeReversal.btnAddNotes.click
		WaitForICallLoading
           If Not FeeReversal.popupValidationMessage.exist(5)Then
			  LogMessage "WARN","Verification","Add New Comment action failed"
			  baddNote_FR=false
		   else
			  LogMessage "RSLT","Verification","Add New Comment performed successfully" ,true
			  baddNote_FR=True
	  	   End If
		FeeReversal.txtComment_Notes.set strNote
		FeeReversal.btnOK_ConfirmationMsg.Click
		WaitForIcallLoading
	End If		
	addNote_FR=baddNote_FR
End Function

'[Verify Button Add Notes is disable on Fee Reversal Screen]
Public Function verifydisplayAddNotes_FR()
	bverifybtnAddNotes_Disable=true
	intrBtnWaiveFee=Instr(FeeReversal.btnAddNotes.Object.GetAttribute("disabled"),("disabled"))
	If not intrBtnWaiveFee=0 Then
		LogMessage "RSLT","Verification","Add Notes button is disable as expected.",True
		bverifybtnAddNotes_Disable=true
	Else
		LogMessage "WARN","Verifiation","Add Notes button is enable. Expected to be disable.",false
		bverifybtnAddNotes_Disable=false
	End If
	verifydisplayAddNotes_FR=bverifybtnAddNotes_Disable
End Function

'[Set TextBox Comments to Fee Reversal]
Public Function setCommentsTextbox_FR(strComment)
	strTimeStamp = ""&now
	strComment =strComment &" "&strTimeStamp
	gstrRuntimeCommentStep="Set TextBox Comments to Fee Reversal"
	gstrParameterNameStep = "TimeStamp" &replace((replace((replace(now,"/","-"))," ","-")),":","-")
	insertDataStore gstrParameterNameStep, strComment
	'insertDataStore "SRComment", strComment
   FeeReversal.txtComment.Set strComment
   If Err.Number<>0 Then
       setCommentsTextbox_FR=false
            LogMessage "WARN","Verification","Failed to Set Text Box :Comments" ,false
       Exit Function
   End If
   setCommentsTextbox_FR=true
End Function

'[Verify Button Submit is enabled on Fee Reversal Screen]
Public Function VerifybtnSubmit_FR()
	bDevPending=false
    bVerifybtnSubmit_FR=true
	intBtnSubmit=Instr(FeeReversal.btnSubmit.GetROproperty("outerhtml"),("v-disabled"))
	If  intBtnSubmit=0 Then
		LogMessage "RSLT","Verification","Submit button is enabled as expected.",True
		bVerifybtnSubmit_FR=true
	Else
		LogMessage "WARN","Verifiation","Submit button is disabled.",false
		bVerifybtnSubmit_FR=false
	End If
	VerifybtnSubmit_FR=bVerifybtnSubmit_FR
End Function

'[Click Button Submit on Fee Reversal Screen]
Public Function clickButtonSubmit_FR()
   bDevPending=false
   FeeReversal.btnSubmit.click
   If Err.Number<>0 Then
       clickButtonSubmit_FR=false
            LogMessage "WARN","Verification","Failed to Click Button : Submit" ,false
       Exit Function
   End If
   WaitForIcallLoading
   clickButtonSubmit_FR=true
End Function

'[Verify Field CardNumber on Request Submitted Popup for Fee Reversal displayed as]
Public Function verifyCardNumber_RequestSubmitted_FR(strCardNumber)
   bDevPending=false
   bVerifyCardNumber_RequestSubmittedText=true
   insertDataStore "NewCardNumber", ""&strCardNumber
   If Not IsNull(strCardNumber) Then
       If Not VerifyInnerText (FeeReversal.lblCardNumber_RequestSubmitted(), strCardNumber, "CardNumber_RequestSubmitted")Then
           bVerifyCardNumber_RequestSubmittedText=false
       End If
   End If
   verifyCardNumber_RequestSubmitted_FR=bVerifyCardNumber_RequestSubmittedText
End Function

'[Verify Field ProductDescription on Request Submitted Popup for Fee Reversal displayed as]
Public Function verifyProductDescription_RequestSubmitted_FR(strProductDescription)
   bDevPending=false
   bVerifyProductDescription_RequestSubmittedText=true
   If Not IsNull(strProductDescription) Then
       If Not VerifyInnerText (FeeReversal.lblProductDescription_RequestSubmitted(), strProductDescription, "ProductDescription_RequestSubmitted")Then
           bVerifyProductDescription_RequestSubmittedText=false
       End If
   End If
   verifyProductDescription_RequestSubmitted_FR=bVerifyProductDescription_RequestSubmittedText
End Function

'[Verify Field SR Status_RequestSubmitted For Fee Reversal displayed as]
Public Function verifySRStatus_RequestSubmitted(strExpectedText)
   bDevPending=false
   bVerifyStatus_RequestSubmittedText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (FeeReversal.lblSRStatus_RequestSubmitted(), strExpectedText, "Status_RequestSubmitted")Then
           bVerifyStatus_RequestSubmittedText=false
       End If
   End If
   verifySRStatus_RequestSubmitted=bVerifyStatus_RequestSubmittedText
End Function

'[Verify CaseNumber on Request Submitted Popup for Fee Reversal]
Public Function VerifyCaseNumber_RequestSubmitted_FR()
   bDevPending=false
   strCaseNumber=FeeReversal.lblCaseNumber_RequestSubmitted.GetRoProperty("innerText")
	If strCaseNumber<>"" Then
		 insertDataStore "CaseNumber", strCaseNumber
	   Environment.Value("CaseNumber") = strCaseNumber
	 else
   		LogMessage "RSLT","Verification","Case Number did not display on Request Submitted pop up",false
	End If
   WaitForIcallLoading
   VerifyCaseNumber_RequestSubmitted_FR=true
End Function

'[Verify SRNumber on Request Submitted Popup for Fee Reversal displayed]
Public Function VerifySRNumber_RequestSubmitted_FR()
   bDevPending=false
   strSRNumber=FeeReversal.lblCardNumber_RequestSubmitted.GetRoProperty("innerText")
	If strSRNumber<>"" Then
		 insertDataStore "SRNumber", strSRNumber
	   Environment.Value("SRNumber") = strSRNumber
	 else
   		LogMessage "RSLT","Verification","ServiceRequest Number did not display on Request Submitted pop up",false
	End If
   WaitForIcallLoading
   VerifySRNumber_RequestSubmitted_FR=true
End Function

'[Click button Close on Request Submitted Popup for Fee Reversal]
Public Function clickBtnClose_RequestSubmittedFR()
	bDevPending=false
   FeeReversal.btnCancel_RequestSubmitted.click
   If Err.Number<>0 Then
       clickBtnClose_RequestSubmittedFR=false
            LogMessage "WARN","Verification","Failed to Click Button : Close_RequestSubmitted" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickBtnClose_RequestSubmittedFR=true
End Function

'[Verify Field ValidationMessage For Fee Reversal displayed as]
Public Function verifyValidationMessage_FR(strExpectedText)
   WaitForICallLoading
   bVerifyValidationMessageText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (FeeReversal.lblValidationMessage(), strExpectedText, "ValidationMessage")Then
           bVerifyValidationMessageText=false
       End If
   End If
   verifyValidationMessage_FR=bVerifyValidationMessageText
End Function

'[Click Button OK_ValidationPopup For Fee Reversal]
Public Function clickButtonOK_ValidationPopup_FR()
   bDevPending=False
   FeeReversal.btnOK_ValidationMsg.click
   If Err.Number<>0 Then
       clickButtonOK_ValidationPopup_FR=false
            LogMessage "WARN","Verification","Failed to Click Button : OK_ValidationPopup" ,false
       Exit Function
   End If
   clickButtonOK_ValidationPopup_FR=true
End Function

'[Click Button OK_SRStatusPopup For Fee Reversal]
Public Function clickButtonOK_SRStatusPopup_FR()
   FeeReversal.btnOK_SRstatus.click
   If Err.Number<>0 Then
       clickButtonOK_SRStatusPopup_FR=false
            LogMessage "WARN","Verification","Failed to Click Button : OK_SRStatusPopup" ,false
       Exit Function
   End If
   clickButtonOK_SRStatusPopup_FR=true
End Function

'[Select Action Menu FeeReveral from Transaction table on Transaction History Screen]
Public Function selectTransactionAction_FR(lstTransactionHisDetails)
   bselectTransactionAction_FR=true
	bselectTransactionAction_FR= selectTableSubMenu(TransactionHistory.tblTransactionsHeader,TransactionHistory.tblTransactionsContent,lstTransactionHisDetails,"FR Details","Actions",False,NULL,NULL,NULL,"Fee Reversal",bDisabled)
	If bDisabled Then
		LogMessage "RSLT", "Verification","FeeReversal action menu is not enabled",false
		bselectTransactionAction_FR=false
	End If
	WaitForICallLoading
	Wait 1
    selectTransactionAction_FR=bselectTransactionAction_FR
End Function

'[User click Service Request tab to verify SR number displayed]
Public Function SelectServiceRequesttab()
	wait(120)	
	ServiceRequest.tabPendingSR().click()
	wait(180)
	ServiceRequest.tabServiceRequest().click()
	WaitForIcallLoading
	SelectServiceRequesttab=true
End Function
