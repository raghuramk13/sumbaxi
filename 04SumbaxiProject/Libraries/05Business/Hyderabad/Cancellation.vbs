'*****This is auto generated code using code generator please Re-validate ****************
Dim strRunTimeTimeStamp_Step:strRunTimeTimeStamp_Step="" ' This variable is used to Store Time Stamp on Click Submit button

'[Click SR Shortcut Button Cancellation]
Public Function clickButtonCancellation_CC()
   bDevPending=false
   bclickButtonCancellation=true
   CashlineCancellation.btnCancellation.click
   If Err.Number<>0 Then
       bclickButtonCancellation=false
            LogMessage "WARN","Verification","Failed to Click Button : Cancellation" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickButtonCancellation_CC=bclickButtonCancellation
End Function

'[Verify Tab Cancellation displayed]
Public Function verifyTabCancellationExist()
   bDevPending=false
   verifyTabCancellationExist=verifyTabExist("Cancellation")
End Function

'[Verify Cancellation screen displayed]
Public Function verifyCancellationScreen()
	bverifyCancellationScreen=true
	If (CashlineCancellation.tblSelectedCardHeader().exist) Then
		bverifyCancellationScreen=true
	Else 
		bverifyCancellationScreen=false
	End If
	verifyCancellationScreen=bverifyCancellationScreen
End Function

'[Select Combobox Reason of Cancellation as]
Public Function selectReasonofCancellationComboBox(strReasonofCancellation)
   bDevPending=false
   bSelectReasonofCancellationComboBox=true
   If Not IsNull(strReasonofCancellation) Then
       If Not (selectItem_Combobox (CashlineCancellation.lstReasonofCancellation(), strReasonofCancellation))Then
            LogMessage "WARN","Verification","Failed to select :"&strControlName&" From ReasonofCancellation drop down list" ,false
           bSelectReasonofCancellationComboBox=false
       End If
   End If
   Wait 1
   selectReasonofCancellationComboBox=bSelectReasonofCancellationComboBox
End Function

'[Get selected item from combo box Reason of Cancellation]
Public Function getReasonofCancellationSelectedItem()
   bDevPending=false
   getReasonofCancellationSelectedItem=getVadinCombo_SelectedItem(CashlineCancellation.lstReasonofCancellation)
End Function

'[Verify Combobox Reason of Cancellation displayed as]
Public Function verifyReasonofCancellationText(strReasonofCancellation)
   bDevPending=false
   bVerifyReasonofCancellationText=true
   If Not IsNull(strReasonofCancellation) Then
       If Not verifyComboSelectItem (CashlineCancellation.lstReasonofCancellation(), strReasonofCancellation, "ReasonofCancellation")Then
           bVerifyReasonofCancellationText=false
       End If
   End If
   verifyReasonofCancellationText=bVerifyReasonofCancellationText
End Function

'[Verify Table Selected Card Header displayed]
Public Function verifySelectedCardHeaderTabledisplayed()
   bDevPending=false
   verifySelectedCardHeaderdisplayed= CashlineCancellation.tblSelectedCardHeader.Exist(1)
End Function
'[Verify Table Selected Card Header has following Columns]
Public Function verifySelectedCardHeaderTableColumns(arrColumnNameList)
   bDevPending=false
   verifySelectedCardHeaderTableColumns=verifyTableColumns(CashlineCancellation.tblSelectedCardHeader,arrColumnNameList)
End Function
'[Verify row Data in Table Selected Card Header]
Public Function verifytblSelectedCardHeader_RowData(arrRowDataList)
   bDevPending=false
   verifytblSelectedCardHeader_RowData=verifyTableContentList(CashlineCancellation.tblSelectedCardHeaderHeader,CashlineCancellation.tblSelectedCardHeaderContent,arrRowDataList,"SelectedCardHeader" , bPagination,CashlineCancellation.lnkNext ,CashlineCancellation.lnkNext1,CashlineCancellation.lnkPrevious)
End Function

'[Verify Table Selected Card Content displayed]
Public Function verifySelectedCardContentTabledisplayed()
   bDevPending=false
   verifySelectedCardContentdisplayed= CashlineCancellation.tblSelectedCardContent.Exist(1)
End Function
'[Verify Table Selected Card Content has following Columns]
Public Function verifySelectedCardContentTableColumns(arrColumnNameList)
   bDevPending=false
   verifySelectedCardContentTableColumns=verifyTableColumns(CashlineCancellation.tblSelectedCardContent,arrColumnNameList)
End Function
'[Verify row Data in Table Selected Card Content]
Public Function verifytblSelectedCardContent_RowData(arrRowDataList)
   bDevPending=false
   verifytblSelectedCardContent_RowData=verifyTableContentList(CashlineCancellation.tblSelectedCardContentHeader,CashlineCancellation.tblSelectedCardContentContent,arrRowDataList,"SelectedCardContent" , bPagination,CashlineCancellation.lnkNext ,CashlineCancellation.lnkNext1,CashlineCancellation.lnkPrevious)
End Function

'[Select Combobox Action for Credit Balance as]
Public Function selectActionforCreditBalanceComboBox(strActionforCreditBalance)
   bDevPending=false
   bSelectActionforCreditBalanceComboBox=true
   If Not IsNull(strActionforCreditBalance) Then
       If Not (selectItem_Combobox (CashlineCancellation.lstActionforCreditBalance(), strActionforCreditBalance))Then
            LogMessage "WARN","Verification","Failed to select :"&strControlName&" From ActionforCreditBalance drop down list" ,false
           bSelectActionforCreditBalanceComboBox=false
       End If
   End If
   Wait 1
   selectActionforCreditBalanceComboBox=bSelectActionforCreditBalanceComboBox
End Function

'[Get selected item from combo box Action for Credit Balance]
Public Function getActionforCreditBalanceSelectedItem()
   bDevPending=false
   getActionforCreditBalanceSelectedItem=getVadinCombo_SelectedItem(CashlineCancellation.lstActionforCreditBalance)
End Function

'[Verify Combobox Action for Credit Balance displayed as]
Public Function verifyActionforCreditBalanceText(strActionforCreditBalance)
   bDevPending=false
   bVerifyActionforCreditBalanceText=true
   If Not IsNull(strActionforCreditBalance) Then
       If Not verifyComboSelectItem (CashlineCancellation.lstActionforCreditBalance(), strActionforCreditBalance, "ActionforCreditBalance")Then
           bVerifyActionforCreditBalanceText=false
       End If
   End If
   verifyActionforCreditBalanceText=bVerifyActionforCreditBalanceText
End Function

'[Get Description Label Text]
Public Function getDescriptionText()
   bDevPending=false
   getDescriptionText=CashlineCancellation.lblDescription.GetRoProperty("innertext")
End Function

'[Verify Field Description on Cashline Cancellation displayed as]
Public Function verifyDescriptionText_CC(strDescription)
   bDevPending=false
   bVerifyDescriptionText=true
   If Not IsNull(strDescription) Then
       If Not VerifyInnerText (CashlineCancellation.lblDescription(), strDescription, "Description")Then
           bVerifyDescriptionText=false
       End If
   End If
   verifyDescriptionText_CC=bVerifyDescriptionText
End Function

'[Select Combobox Mode of Disbursement as]
Public Function selectModeofDisbursementComboBox(strModeofDisbursement)
   bDevPending=false
   bSelectModeofDisbursementComboBox=true
   If Not IsNull(strModeofDisbursement) Then
       If Not (selectItem_Combobox (CashlineCancellation.lstModeofDisbursement(), strModeofDisbursement))Then
            LogMessage "WARN","Verification","Failed to select :"&strControlName&" From ModeofDisbursement drop down list" ,false
           bSelectModeofDisbursementComboBox=false
       End If
   End If
   Wait 1
   selectModeofDisbursementComboBox=bSelectModeofDisbursementComboBox
End Function

'[Get selected item from combo box Mode of Disbursement]
Public Function getModeofDisbursementSelectedItem()
   bDevPending=false
   getModeofDisbursementSelectedItem=getVadinCombo_SelectedItem(CashlineCancellation.lstModeofDisbursement)
End Function

'[Verify Combobox Mode of Disbursement displayed as]
Public Function verifyModeofDisbursementText(strModeofDisbursement)
   bDevPending=false
   bVerifyModeofDisbursementText=true
   If Not IsNull(strModeofDisbursement) Then
       If Not verifyComboSelectItem (CashlineCancellation.lstModeofDisbursement(), strModeofDisbursement, "Mode of Disbursement")Then
           bVerifyModeofDisbursementText=false
       End If
   End If
   verifyModeofDisbursementText=bVerifyModeofDisbursementText
End Function

'[Select Combobox Account No as]
Public Function selectAccountNoComboBox(strAccountNo)
   bDevPending=false
   bSelectAccountNoComboBox=true
   If Not IsNull(strAccountNo) Then
       If Not (selectItem_Combobox (CashlineCancellation.lstAccountNo(), strAccountNo))Then
            LogMessage "WARN","Verification","Failed to select :"&strControlName&" From AccountNo drop down list" ,false
           bSelectAccountNoComboBox=false
       End If
   End If
   Wait 1
   selectAccountNoComboBox=bSelectAccountNoComboBox
End Function

'[Get selected item from combo box AccountNo]
Public Function getAccountNoSelectedItem()
   bDevPending=false
   getAccountNoSelectedItem=getVadinCombo_SelectedItem(CashlineCancellation.lstAccountNo)
End Function

'[Verify Combobox AccountNo displayed as]
Public Function verifyAccountNoText(strAccountNo)
   bDevPending=false
   bVerifyAccountNoText=true
   If Not IsNull(strAccountNo) Then
       If Not verifyComboSelectItem (CashlineCancellation.lstAccountNo(), strAccountNo, "Account No")Then
           bVerifyAccountNoText=false
       End If
   End If
   verifyAccountNoText=bVerifyAccountNoText
End Function

'[Verify Validation Message displayed as]
Public Function verifyValidationMessage_CC(strValidationMessage)
   bDevPending=False
   bVerifyValidationMessageText=true
   If Not IsNull(strValidationMessage) Then
       If Not VerifyInnerText (CashlineCancellation.lblValidationMessage(), strValidationMessage, "Validation Message")Then
           bVerifyValidationMessageText=false
       End If
   End If
   CashlineCancellation.btnOK_ValidationPopup.Click
   WaitForIcallLoading
   verifyValidationMessage_CC=bVerifyValidationMessageText
End Function

'[Verify Button Submit is enabled on Cashline Cancellation Screen]
Public Function VerifybtnSubmit_CC()
	bDevPending=False
   Dim bVerifybtnSubmit_CC:bVerifybtnSubmit_CC=true
	'CashlineCancellation.tblSelectedCardsHeader.Click
	intBtnSubmit=Instr(CashlineCancellation.btnSubmit.GetROproperty("outerhtml"),("v-disabled"))
	If  intBtnSubmit=0 Then
		LogMessage "RSLT","Verification","Submit button is enable as per expectation.",True
		bVerifybtnSubmit_CC=true
	Else
		LogMessage "WARN","Verifiation","Submit button is disable. Expected to be enable.",false
		bVerifybtnSubmit_CC=false
	End If
	VerifybtnSubmit_CC=bVerifybtnSubmit_CC
End Function

'[Verify Button Submit is disabled on Cashline Cancellation Screen]
Public Function VerifybtnSubmitDisabled_CC()
	bDevPending=False
   Dim bVerifybtnSubmit:bVerifybtnSubmit=true
	intBtnSubmit=Instr(CashlineCancellation.btnSubmit.GetROproperty("outerhtml"),("v-disabled"))
	If  not intBtnSubmit=0 Then
		LogMessage "RSLT","Verification","Submit button is disable as expected.",True
		bVerifybtnSubmit=true
	Else
		LogMessage "WARN","Verifiation","Submit button is enable. Expected to be disable.",false
		bVerifybtnSubmit=false
	End If
	VerifybtnSubmitDisabled_CC=bVerifybtnSubmit
End Function

'[Click Button AddNotes on Cashline Cancellation Screen]
Public Function clickButtonAddNotes_CC()
   bDevPending=false
   CashlineCancellation.btnAddNotes.click
   If Err.Number<>0 Then
       clickButtonAddNotes_CC=false
            LogMessage "WARN","Verification","Failed to Click Button : AddNotes" ,false
       Exit Function
   End If
   clickButtonAddNotes_CC=true
End Function

'[Perform Add Notes by clicking Add Notes Button on Cashline Cancellation Screen]
Public Function addNote_CC(strNote)
   bDevPending=false
   bVerifypopupNotes=true
	Dim bVerifypopupNotes:VerifypopupNotes=true
	
	If not isNull(strNote) Then
		CashlineCancellation.btnAddNotes.click
		WaitForICallLoading
            If not   ServiceRequest.popupVerification.exist(5)Then
				LogMessage "WARN","Verification","New Note dialog did not displayed",false
				bVerifypopupNotes=false
			 else
			 strMessage=ServiceRequest.lblMaxAllowed.GetROProperty("innerText")
				If not strMessage="Max allowed - 3000" Then
					LogMessage "WARN","Verification","Add New Comment popup dislog incorrectly displayed max allowed character count for comment. Expected : Max allowed - 3000 and Actual: "&strMessage,false
					bVerifypopupNotes=false
				End If
			   ServiceRequest.txtNewComment.set strNote
			  
				   ServiceRequest.clickSave_Popup
			  WaitForIcallLoading
		   End If 
		End If 
	addNote_CC=bVerifypopupNotes
End Function

'[Click Button Submit on Cashline Cancellation Screen]
Public Function clickButtonSubmit_CC()
   bDevPending=false
   CashlineCancellation.btnSubmit.click
   If Err.Number<>0 Then
       clickButtonSubmit_CC=false
            LogMessage "WARN","Verification","Failed to Click Button : Submit" ,false
       Exit Function
   End If
      '*************** Capturing time stamp to open Memo for this SR by Manish
'   strTimeStamp = ""&now
'   strTempTime=right(strTimeStamp,11)
'	strTempTime=left(strTempTime,8)
	strRunTimeTimeStamp_Step="Click Button Submit on Cashline Cancellation Screen"
	strDate="9 Apr 2014"
	strTempTime=FormatDateTime(now,4)	
 	strTimeStamp=strDate&" "&strTempTime
	insertDataStore "TimeStamp", strTimeStamp

   WaitForIcallLoading
   clickButtonSubmit_CC=true
End Function

'[Click Button Cancel on Cashline Cancellation Screen]
Public Function clickButtonCancel_CC()
   bDevPending=true
   CashlineCancellation.btnCancel.click
   If Err.Number<>0 Then
       clickButtonCancel_CC=false
            LogMessage "WARN","Verification","Failed to Click Button : Cancel" ,false
       Exit Function
   End If
   WaitForIcallLoading
   clickButtonCancel_CC=true
End Function

'[Verify Popup Request Submitted exist for Cashline Cancellation]
Public Function verifyPopupRequestSubmitted_CC(bExist)
   bDevPending=false
   bActualExist=CashlineCancellation.popupRequestSubmitted.Exist(4)
   If bExist And  bActualExist  Then
       LogMessage "RSLT","Verification","Popup :RequestSubmitted Exists As Expected" ,true
       verifyPopupRequestSubmitted_CC=True
   ElseIf not bExist And  not bActualExist  Then
       LogMessage "RSLT","Verification","Popup :RequestSubmitted does not Exists As Expected" ,true
       verifyPopupRequestSubmitted_CC=True
   ElseIf bExist And  not bActualExist  Then
       LogMessage "WARN","Verification","Popup :RequestSubmitted does not Exists As Expected" ,False
       verifyPopupRequestSubmitted_CC=False
   ElseIf not bExist And   bActualExist  Then
       LogMessage "WARN","Verification","Popup :RequestSubmitted Still Exists" ,False
       verifyPopupRequestSubmitted_CC=False
   End If
End Function

'[Verify Field CardNumber on Request Submitted Popup for Cashline Cancellation displayed as]
Public Function verifyCardNumber_RequestSubmitted_CC(strCardNumber)
   bDevPending=false
   bVerifyCardNumber_RequestSubmittedText=true
   insertDataStore "NewPINUsedCard", ""&strCardNumber
   If Not IsNull(strCardNumber) Then
       If Not VerifyInnerText (CashlineCancellation.lblCardNumber_RequestSubmitted(), strCardNumber, "CardNumber_RequestSubmitted")Then
           bVerifyCardNumber_RequestSubmittedText=false
       End If
   End If
   verifyCardNumber_RequestSubmitted_CC=bVerifyCardNumber_RequestSubmittedText
End Function

'[Verify Field ProductDescription on Request Submitted Popup for Cashline Cancellation displayed as]
Public Function verifyProductDescription_RequestSubmitted_CC(strProductDescription)
   bDevPending=false
   bVerifyProductDescription_RequestSubmittedText=true
   If Not IsNull(strProductDescription) Then
       If Not VerifyInnerText (CashlineCancellation.lblProductDescription_RequestSubmitted(), strProductDescription, "ProductDescription_RequestSubmitted")Then
           bVerifyProductDescription_RequestSubmittedText=false
       End If
   End If
   verifyProductDescription_RequestSubmitted_CC=bVerifyProductDescription_RequestSubmittedText
End Function

'[Click Link SRNumber on Request Submitted Popup for Cashline Cancellation]
Public Function clickLinkSRNumber_RequestSubmitted_CC()
   bDevPending=false
   strSelectedSR=CashlineCancellation.lnkSRNumber_RequestSubmitted.GetRoProperty("innerText")
	If strSelectedSR<>"" Then
		 insertDataStore "SelectedSRLink", strSelectedSR
	
	   CashlineCancellation.lnkSRNumber_RequestSubmitted.click
	 else
   		LogMessage "RSLT","Verification","SR Number did not displayed on Request Submitted pop up",false
	End If
   WaitForIcallLoading
   If Err.Number<>0 Then
       clickLinkSRNumber_RequestSubmitted_CC=false
            LogMessage "WARN","Verification","Failed to Click Link : SRNumber_RequestSubmitted" ,false
       Exit Function
   End If
   clickLinkSRNumber_RequestSubmitted_CC=true
End Function

'[Verify Field Status_RequestSubmitted For Cashline Cancellation displayed as]
Public Function verifyStatus_RequestSubmittedICancellation(strExpectedText)
   bDevPending=false
   bVerifyStatus_RequestSubmittedText=true
   wait(3)
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (CashlineCancellation.lblStatus_RequestSubmitted(), strExpectedText, "Status_RequestSubmitted")Then
           bVerifyStatus_RequestSubmittedText=false
       End If
   End If
   verifyStatus_RequestSubmittedICancellation=bVerifyStatus_RequestSubmittedText
End Function

'[Click Button RefreshStatus For Cashline Cancellation]
Public Function clickButtonRefreshStatus_CC()
   bDevPending=false
   CashlineCancellation.btnRefreshStatus.click
	WaitForICallLoading
    		'Get Status
		If CashlineCancellation.lblStatus_RequestSubmitted.getROProperty("innertext")="In Progress" then 
			bStatus=true
		 else
			bStatus=false
		End If		
	
	While  bStatus AND (iCount<60)
		CashlineCancellation.btnRefreshStatus.click
		wait 1
        	'Get Status
			strStatus=CashlineCancellation.lblStatus_RequestSubmitted.getROProperty("innertext")
			If Trim(strStatus)="In Progress" then 
				bStatus=true
			 else
				LogMessage "WARN","Verification","Status displayed as  :"&strStatus ,true
				bStatus=false
			End If
		wait 5
		intBtnRefreshStatus=Instr(CashlineCancellation.btnRefreshStatus.GetROproperty("outerhtml"),"v-disabled")
		If intBtnRefreshStatus<>0 Then
			LogMessage "WARN","Verification","Button : RefreshStatus is disabled" ,true
			bStatust=true
		End If
		iCount=iCount+1
	  Wend	

   If Err.Number<>0 Then
       
            LogMessage "WARN","Verification","Failed to Click Button : RefreshStatus" ,false
			clickButtonRefreshStatus_CC=false
       Exit Function
   End If
   WaitForICallLoading
  
   clickButtonRefreshStatus_CC=true
End Function

'[Click Button Cancel_Request Submitted for Cashline Cancellation]
Public Function clickButtonCancel_RequestSubmittedCC()
   bDevPending=false
   CashlineCancellation.btnCancel_RequestSubmitted.click
   waitForIcallLoading
   If Err.Number<>0 Then
       clickButtonCancel_RequestSubmittedCC=false
            LogMessage "WARN","Verification","Failed to Click Button : Cancel_RequestSubmitted" ,false
       Exit Function
   End If
   clickButtonCancel_RequestSubmittedCC=true
End Function

'[Verify Field SRNumber displayed on View SR for Cashline Cancellation as]
Public Function verifySRNumber_CC(strSRNumber)
   bDevPending=false
   bVerifySRNumberText=true
    ' If SR link clicked from popup lable link
   If Ucase(strSRNumber)="SELECTED SR LINK" Then
		strSRNumber=fetchFromDataStore("Click Link SRNumber on Request Submitted Popup for New Pin","BLANK","SelectedSRLink")(0)
   End If

   If Not IsNull(strSRNumber) Then
       If Not VerifyInnerText (ViewSR.lblSRNumber(), strSRNumber, "SRNumber")Then
           bVerifySRNumberText=false
       End If
   End If
   verifySRNumber_CC=bVerifySRNumberText
End Function

'[Verify Knowledge base link on Cashline Cancellation Screen is enabled]
Public Function VerifyKnowledgebaselinkEnabled_CC()
      bDevPending=false
   Dim bVerifyKnowledgebaselink:bVerifyKnowledgebaselink=true
     strKBLink=CashlineCancellation.lnkKnowledgeBase.GetROProperty("Outerhtml")
	
    If inStr(strKBLink,"v-disabled") = 0 Then
		LogMessage "RSLT","Verification","Knowledge base Link  enabled successfully as expected",true
	else
		LogMessage "WARN","Verification","Knowledge base Link  does not enabledas expected",false
		bVerifyKnowledgebaselink=false
	End If
	VerifyKnowledgebaselinkEnabled_CC=bVerifyKnowledgebaselink
End Function

'[Verify Confirmation Popup on Cashline Cancellation]
Public Function verifyConfirmationPopup()
	bverifyConfirmationPopup=true
	If Not verifyInnerText(CashlineCancellation.lblConfirmationMessage(), "Are you sure you want to discard the changes (if any) and leave this page?", "Verify Pop up confirmation") Then
		bverifyConfirmationPopup=false
	End If
	CashlineCancellation.btnYes_Confirmation.click
	  If Err.Number<>0 Then
       bverifyConfirmationPopup=false
            LogMessage "WARN","Verification","Failed to Click Button : Yes on Confirmation popup" ,false
       Exit Function
   End If
	verifyConfirmationPopup=bverifyConfirmationPopup
End Function

'[Set TextBox Comment on Cashline Cancellation Screen to]
Public Function setCommentTextbox_CC(strComment)
   bDevPending=false
   If not isNull(strComment) Then
	   CashlineCancellation.txtComment.Set(strComment)
   End If
   If Err.Number<>0 Then
       setCommentTextbox_CC=false
            LogMessage "WARN","Verification","Failed to Set Text Box :Comment" ,false
       Exit Function
   End If
   setCommentTextbox_CC=true
End Function

'[Verify Mailing Address on Cashline Cancellation Screen]
Public Function verifyMailingAddress(lstMailingAddress)
   bverifyMailingAddress=true

   If Not IsNull (lstMailingAddress) Then
	   strPostalCode=lstMailingAddress(0)
	   strAddressLine1=lstMailingAddress(1)
	   strAddressLine2=lstMailingAddress(2)
	   strAddressLine3=lstMailingAddress(3)
	   strAddressLine4=lstMailingAddress(4)
	   strAddressLine5=lstMailingAddress(5)
	
		If not IsNull(strPostalCode) Then
		   If Not verifyField(CashlineCancellation.txtPostalCode,strPostalCode,"Postal Code") Then
			   bverifyMailingAddress=false
		   End If
	   End If
		
	   If not IsNull(strAddressLine1) Then
		   If Not verifyField(CashlineCancellation.txtAddressLine1,strAddressLine1,"Address 1") Then
			   bverifyMailingAddress=false
		   End If
	   End If
	
	   If not IsNull(strAddressLine2) Then
		   If Not verifyField(CashlineCancellation.txtAddressLine2,strAddressLine2,"Address 2") Then
			   bverifyMailingAddress=false
		   End If
	   End If
	
	   If not IsNull(strAddressLine3) Then
		   If Not verifyField(CashlineCancellation.txtAddressLine3,strAddressLine3,"Address 3") Then
			   bverifyMailingAddress=false
		   End If
	   End If	

	   If not IsNull(strAddressLine4) Then
		   If Not verifyField(CashlineCancellation.txtAddressLine4,strAddressLine4,"Address 4") Then
			   bverifyMailingAddress=false
		   End If
	   End If
	
	   If not IsNull(strAddressLine5) Then
		   If Not verifyField(CashlineCancellation.txtAddressLine5,strAddressLine5,"Address 5") Then
			   bverifyMailingAddress=false
		   End If
	   End If
   End If

	verifyMailingAddress=bverifyMailingAddress	
End Function

'[Verify button Refresh Status is disabled on Cashline Cancellation]
Public Function VerifybuttonRefreshstatusDisabled_CC()
   bDevPending=false
   Dim bVerifybuttonRefreshstatus:bVerifybuttonRefreshstatus=true
	intBtnRefreshStatus=Instr(CashlineCancellation.btnRefreshStatus.GetROproperty("outerhtml"),"v-disabled")
	If  not intBtnRefreshStatus=0 Then
		LogMessage "RSLT","Verification","Refresh Status button is disabled as per expectation.",True
		bVerifybuttonRefreshstatus=true
	Else
		LogMessage "WARN","Verifiation","Refresh Status button is enable. Expected to be disable.",false
		bVerifybuttonRefreshstatus=false
	End If
	VerifybuttonRefreshstatusDisabled_CC=bVerifybuttonRefreshstatus
End Function

'[Set TextBox Postal Code to Cashline Cancellation]
Public Function setPostalCode_CC(strPostalCode)
   If Not IsNull (strPostalCode) Then
	   CashlineCancellation.txtPostalCode.click
	   CashlineCancellation.txtPostalCode.set(strPostalCode)
	  CashlineCancellation.tblSelectedCardHeader.Click
   End If
   If Err.Number<>0 Then
	   setPostalCode_CC=false
	   LogMessage "WARN","Verification","Failed to Set Text Box :Postal Code" ,false
	   Exit Function
   End If
   setPostalCode_CC=true
End Function

'[Verify button Get Address is disabled on Cashline Cancellation]
Public Function VerifybuttonGetAddressDisabled_CC()
   bDevPending=false
   Dim bVerifybuttonGetAddressDisabled_CC:bVerifybuttonGetAddressDisabled_CC=true
	intBtnRefreshStatus=Instr(CashlineCancellation.btnGetAddress.GetROproperty("outerhtml"),"v-disabled")
	If  not intBtnRefreshStatus=0 Then
		LogMessage "RSLT","Verification","Get Address button is disabled as per expectation.",True
		bVerifybuttonGetAddressDisabled_CC=true
	Else
		LogMessage "WARN","Verifiation","Get Address button is enable. Expected to be disable.",false
		bVerifybuttonGetAddressDisabled_CC=false
	End If
	VerifybuttonGetAddressDisabled_CC=bVerifybuttonGetAddressDisabled_CC
End Function

'[Click button Get Address on Cashline Cancellation]
Public Function clickGetAddress_CC()
   If Not IsNull (strPostalCode) Then
		CashlineCancellation.btnGetAddress.click
   End If
	 If Err.Number<>0 Then
       clickGetAddress_CC=false
            LogMessage "WARN","Verification","Failed to Click Button : Get Address" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickGetAddress_CC=true
End Function

'[Validate Address Line 1 is mandatory field in Cashline Cancellation]
Public Function setAddressLine1_CC(strAddressLine1)
		Dim bsetAddressLine1_CC:bsetAddressLine1_CC=true
	   CashlineCancellation.txtAddressLine1.click
	   CashlineCancellation.txtAddressLine1.set(strAddressLine1)
	   CashlineCancellation.txtAddressLine2.click
	   Dim objUI
	   Set objUI = CashlineCancellation.btnSubmit
	   intBtnSubmit=Instr(objUI.Object.GetAttribute("aria-disabled"),("true")) 'intBtnSubmit=Instr(CashlineCancellation.btnSubmit.GetROproperty("outerhtml"),("v-disabled"))
		If  not intBtnSubmit=0 Then
			LogMessage "RSLT","Verification","Submit button is disable as expected.",True
			bsetAddressLine1_CC=true
		Else
			LogMessage "WARN","Verifiation","Submit button is enable. Expected to be disable.",false
			bsetAddressLine1_CC=false
		End If	  
   setAddressLine1_CC=bsetAddressLine1_CC
End Function


'[Validate Address Line 2 is mandatory field in Cashline Cancellation]
Public Function setAddressLine2_CC(strAddressLine2)
		Dim bsetAddressLine2_CC:bsetAddressLine2_CC=true
	   CashlineCancellation.txtAddressLine2.click
	   CashlineCancellation.txtAddressLine2.set(strAddressLine2)
      	If Err.Number<>0 Then
			bsetAddressLine2_CC=false
            LogMessage "WARN","Verification","Failed to Click Button : OK" ,false
			Exit Function
		End If   
   setAddressLine2_CC=bsetAddressLine2_CC
End Function

'[Verify Button Add Notes is disabled on Cashline Cancellation Screen]
Public Function VerifybtnAddNoteDisabled_CC()
	bDevPending=False
   Dim bVerifyAddNote:bVerifyAddNote=true
	'intBtnNote=Instr(CashlineCancellation.btnAddNotes.GetROproperty("outerhtml"),"v-disabled")
	intBtnNote = CashlineCancellation.btnAddNotes.GetRoproperty("disabled")
	If not intBtnNote=0 Then
		LogMessage "RSLT","Verification","Note button is disabled as per expectation.",True
		bVerifyAddNote=true
	Else
		LogMessage "WARN","Verifiation","Note button is enable. Expected to be disabale.",false
		bVerifyAddNote=false
	End If
	VerifybtnAddNoteDisabled_CC=bVerifyAddNote
End Function

'[Verify Field Failed Status]
Public Function verifyFailedStatus(strExpectedText)
   bDevPending=false
   bVerifyStatus_RequestSubmittedText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (CashlineCancellation.lblFailedStatus_RequestSubmitted(), strExpectedText, "Status_RequestSubmitted")Then
           bVerifyStatus_RequestSubmittedText=false
       End If
   End If
   verifyFailedStatus=bVerifyStatus_RequestSubmittedText
End Function

'[Click on Failed Status to Validate Reason]
Public Function clickFailedStatus()
   bDevPending=false
   bVerifyStatus_RequestSubmittedText=true
    CashlineCancellation.lblFailedStatus_RequestSubmitted.click
      	If Err.Number<>0 Then
			bVerifyStatus_RequestSubmittedText=false
            LogMessage "WARN","Verification","Failed to Click Button : Failed Status" ,false
			Exit Function
		End If
		WaitForICallLoading		
   clickFailedStatus=bVerifyStatus_RequestSubmittedText
End Function

'[Verify Popup Validation Message exist on Cashline Cancellation]
Public Function verifyPopupValidationMessageexist_CC(bExist)
   bDevPending=false
   bActualExist=CashlineCancellation.popupValidationMessage.Exist(1)
   If bExist And  bActualExist  Then
       LogMessage "RSLT","Verification","Popup :ValidationMessage Exists As Expected" ,true
       verifyPopupValidationMessageexist_CC=True
   ElseIf not bExist And  not bActualExist  Then
       LogMessage "RSLT","Verification","Popup :ValidationMessage does not Exists As Expected" ,true
       verifyPopupValidationMessageexist_CC=True
   ElseIf bExist And  not bActualExist  Then
       LogMessage "WARN","Verification","Popup :ValidationMessage does not Exists As Expected" ,False
       verifyPopupValidationMessageexist_CC=False
   ElseIf not bExist And   bActualExist  Then
       LogMessage "WARN","Verification","Popup :ValidationMessage Still Exists" ,False
       verifyPopupValidationMessageexist_CC=False
   End If
End Function

'[Verify ValidationMessage on Cashline Cancellation displayed as]
Public Function verifyValidationMessageText_CC(strExpectedText)
   bDevPending=False
   bVerifyValidationMessageText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (CashlineCancellation.lblValidationMessage(), strExpectedText, "ValidationMessage")Then
           bVerifyValidationMessageText=false
       End If
   End If
  CashlineCancellation.btnOK_ValidationPopup.click
   verifyValidationMessageText_CC=bVerifyValidationMessageText
End Function

'[Click Close On Request Submit Button FOR Cancellation]
Public Function clickCloseCancellation()
   bDevPending=false
   CashlineCancellation.btnCancel_RequestSubmitted.click
   If Err.Number<>0 Then
       clickCloseCancellation=false
            LogMessage "WARN","Verification","Failed to Click Button : CashLine Cancellation" ,false
       Exit Function
   End If
   waitForIcallLoading
   clickCloseCancellation=true
End Function

'[Verify Warning Confirmation Popup on Cashline Cancellation]
Public Function verifyWarningConfirmationPopup()
	bverifyConfirmationPopup=true
	If Not verifyInnerText(CashlineCancellation.lblConfirmationMessage(), "Verification is not complete. Do you want to proceed?", "Verify Pop up Warning confirmation") or  Not verifyInnerText(CashlineCancellation.lblConfirmationMessage(), "Customer Verification has failed!", "Verify Pop up Warning confirmation") Then
		bverifyConfirmationPopup=false
	End If
	CashlineCancellation.btnYes_Confirmation.click
	  If Err.Number<>0 Then
       bverifyConfirmationPopup=false
            LogMessage "WARN","Verification","Failed to Click Button : Yes on Confirmation popup" ,false
       Exit Function
   End If
	verifyWarningConfirmationPopup=bverifyConfirmationPopup
End Function

'[Verify Cancellation of Cashline prevalidation Message displayed as]
Public Function verifyCancellationCashlinePreValidationMessage(strValidationMessage)
   bDevPending = False
   bVerifyValidationMessageText = true
    For iCountOne = 1 To 120 Step 1
		If Not ServiceActivation.lblValidationMessage.Exist(0.5) Then
			Wait(0.5)
		else
			Exit for
		End if
	Next   
   
   If Not IsNull(strValidationMessage) Then
       If Not VerifyInnerText (ServiceActivation.lblValidationMessage(), strValidationMessage, "Validation Message")Then
           bVerifyValidationMessageText=false
       End If
   End If
   For iCount = 1 To 180 Step 1
		If Not ServiceActivation.btnOK_ValidationPopup.Exist(0.5) Then
			Wait(0.5)
		else
			ServiceActivation.btnOK_ValidationPopup.Click
			Exit for
		End if
	Next   
   WaitForIcallLoading
   verifyCancellationCashlinePreValidationMessage = bVerifyValidationMessageText
End Function
