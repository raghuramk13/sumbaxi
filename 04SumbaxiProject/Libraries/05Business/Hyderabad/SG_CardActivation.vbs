'*****This is auto generated code using code generator please Re-validate ****************
'[Verify Tab Activation is displayed]
Public Function verifyTabActivationExist()
   bDevPending=false
   verifyTabActivationExist=verifyTabExist("Activation")
End Function

'[Select Combobox ActivationType as]
Public Function selectActivationTypeComboBox(strActivationType)
   bDevPending=true
   bSelectActivationTypeComboBox=true
   If Not IsNull(strActivationType) Then
       If Not (selectItem_Combobox (CardActivation.lstActivationType(), strActivationType))Then
            LogMessage "WARN","Verification","Failed to select :"&strControlName&" From ActivationType drop down list" ,false
           bSelectActivationTypeComboBox=false
       End If
   End If
   waitForIcallLoading 
   selectActivationTypeComboBox=bSelectActivationTypeComboBox
End Function

'[Verify Combobox ActivationType displayed as]
Public Function verifyActivationTypeText(strExpectedText)
   bDevPending=true
   bVerifyActivationTypeText=true
   If Not IsNull(strExpectedText) Then
       If Not verifyComboSelectItem (CardActivation.lstActivationType(), strExpectedText, "ActivationType")Then
           bVerifyActivationTypeText=false
       End If
   End If
   verifyActivationTypeText=bVerifyActivationTypeText
End Function

'[Verify Combobox ActivationType has items]
Public Function verifyActivationTypeItemList(lstItems)
   bDevPending=true
   bVerifyActivationTypeItems=true
   If Not IsNull(lstItems) Then   
       If Not verifyComboboxItems (CardActivation.lstActivationType(), lstItems, "ActivationType")Then
           bVerifyActivationTypeItems=false
       End If
   End If
   verifyActivationTypeItemList=bVerifyActivationTypeItems
End Function

'[Verify Table SelectedCards on Card Activation SR Screen displayed]
Public Function verifySelectedCardsTabledisplayed_Activation()
   bDevPending=true
   verifySelectedCardsTabledisplayed_Activation= CardActivation.tblSelectedCards.Exist(1)
End Function

'[Verify Table SelectedCards on Card Activation SR Screen has following Columns]
Public Function verifySelectedCardsTableColumns_Act(arrColumnNameList)
   bDevPending=true
   verifySelectedCardsTableColumns_Act=verifyTableColumns(CardActivation.tblSelectedCards,arrColumnNameList)
End Function

'[Verify row Data in Table SelectedCards on Card Activation SR Screen]
Public Function verifytblSelectedCards_RowData_Activation(arrRowDataList)
   bDevPending=false
   verifytblSelectedCards_RowData_Activation=verifyTableContentList(CardActivation.tblSelectedCardsHeader,CardActivation.tblSelectedCardsContent,arrRowDataList,"SelectedCards" , False,Null ,Null,Null)
End Function

'[Verify Field Description on Card Activation SR Screen displayed as]
Public Function verifyDescription_Activation(strExpectedText)
   bVerifyDescriptionText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (CardActivation.lblDescription(), strExpectedText, "Description")Then
           bVerifyDescriptionText=false
       End If
   End If
   verifyDescription_Activation=bVerifyDescriptionText
End Function

'[Verify Field KnowledgeBase on Card Activation SR Screen displayed as]
Public Function verifyKnowledgeBase_Activation(strExpectedLink)
   bVerifyKnowledgeBaseText=true
   If Not IsNull(strExpectedLink) Then
		
		Set oDesc_KB = Description.Create()
			oDesc_KB("micclass").Value = "Link"
		
			strKBLink=CardActivation.lnkKnowledgeBase.ChildObjects(oDesc_KB)(0).GetROProperty("href")
       If not MatchStr(strKBLink, strExpectedLink)Then
		   LogMessage "RSLT","Verification","Knowledge base link does not matched with expected. Actual : "&strKBLink&" Expected "&strExpectedLink,false
           bVerifyKnowledgeBaseText=false
	   else
	 		LogMessage "RSLT","Verification","Knowledge base link matrched with expected",true
       End If
   End If
   verifyKnowledgeBase_Activation=bVerifyKnowledgeBaseText
End Function

'[Verify Field Comment on Card Activation SR Screen displayed as]
Public Function verifyComment_Activation(strExpectedText)
   bDevPending=true
   bVerifyCommentText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyField( CardActivation.txtComment(), strExpectedText, "Comment")Then
           bVerifyCommentText=false
       End If
   End If
   verifyComment_Activation=bVerifyCommentText
End Function

'[Set TextBox Comment on Card Activation SR Screen to]
Public Function setCommentTextbox_Act(strComment)
   bDevPending=False
   strTimeStamp = ""&now
	strComment =strComment &" "&strTimeStamp
	gstrRuntimeCommentStep="Set TextBox Comment on Card Activation SR Screen to"
	insertDataStore "SRComment", strComment
	
   CardActivation.txtComment.Set(strComment )
   If Err.Number<>0 Then
       setCommentTextbox_Act=false
            LogMessage "WARN","Verification","Failed to Set Text Box :Comment" ,false
       Exit Function
   End If
   setCommentTextbox_Act=true
End Function

'[Click Button Cancel on Card Activation SR Screen]
Public Function clickCancel_Activation()
   bDevPending=true
   CardActivation.btnCancel.click
   If Err.Number<>0 Then
       clickCancel_Activation=false
            LogMessage "WARN","Verification","Failed to Click Button : Cancel" ,false
       Exit Function
   End If
   clickCancel_Activation=true
End Function

'[Perform Add Notes by clicking Add Notes Button on Card Activation Screen]
Public Function addNote_CA(strNote)
   bDevPending=false
   bVerifypopupNotes=true
	Dim bVerifypopupNotes:VerifypopupNotes=true	
	If not isNull(strNote) Then
		CardActivation.btnAddNotes.click
		WaitForICallLoading
            If not   ServiceRequest.popupVerification.exist(5)Then
				LogMessage "WARN","Verification","New Note dialog did not displayed",false
				bVerifypopupNotes=false
			 else
			 strMessage=ServiceRequest.lblMaxAllowed.GetROProperty("innerText")
				If not strMessage="Max allowed - 3000" Then
					LogMessage "WARN","Verification","Add New Comment popup dialog incorrectly displayed max allowed character count for comment. Expected : Max allowed - 3000 and Actual: "&strMessage,false
					bVerifypopupNotes=false
				End If
			   ServiceRequest.txtNewComment.set strNote
			  
				ServiceRequest.clickSave_Popup
			  WaitForIcallLoading
		   End If 
		End If 
	addNote_CA=bVerifypopupNotes
End Function

'[Click Button Submit on Card Activation SR Screen]
Public Function clickSubmit_Activation()
   bDevPending=true
   CardActivation.btnSubmit.click
   If Err.Number<>0 Then
       clickSubmit_Activation=false
            LogMessage "WARN","Verification","Failed to Click Button : Submit" ,false
       Exit Function
   End If
   clickSubmit_Activation=true
End Function

'[Click Button AssignToTM on Card Activation SR Screen]
Public Function clickButtonAssignToTM()
   bDevPending=true
   CardActivation.btnAssignToTM.click
   If Err.Number<>0 Then
       clickButtonAssignToTM=false
            LogMessage "WARN","Verification","Failed to Click Button : AssignToTM" ,false
       Exit Function
   End If
   clickButtonAssignToTM=true
End Function

'[Click Button Reject on Card Activation SR Screen]
Public Function clickReject_Activation()
   bDevPending=true
   CardActivation.btnReject.click
   If Err.Number<>0 Then
       clickReject_Activation=false
            LogMessage "WARN","Verification","Failed to Click Button : Reject" ,false
       Exit Function
   End If
   clickReject_Activation=true
End Function

'[Click Button Approve on Card Activation SR Screen]
Public Function clickButtonApprove()
   bDevPending=true
   CardActivation.btnApprove.click
   If Err.Number<>0 Then
       clickButtonApprove=false
            LogMessage "WARN","Verification","Failed to Click Button : Approve" ,false
       Exit Function
   End If
   clickButtonApprove=true
End Function

'[Verify Field CreatedBy on Card Activation SR Screen displayed as]
Public Function verifyCreatedByText(strExpectedText)
   bDevPending=true
   bVerifyCreatedByText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (CardActivation.lblCreatedBy(), strExpectedText, "CreatedBy")Then
           bVerifyCreatedByText=false
       End If
   End If
   verifyCreatedByText=bVerifyCreatedByText
End Function

'[Verify Field CreatedDate on Card Activation SR Screen displayed as]
Public Function verifyCreatedDateText(strExpectedText)
   bDevPending=true
   bVerifyCreatedDateText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (CardActivation.lblCreatedDate(), strExpectedText, "CreatedDate")Then
           bVerifyCreatedDateText=false
       End If
   End If
   verifyCreatedDateText=bVerifyCreatedDateText
End Function

'[Verify Popup ValidationMessage exist for Card Activation]
Public Function verifyPopupValidationMessage_Activation(bExist)
   bDevPending=False
   bActualExist=CardActivation.popupValidationMessage.Exist(1)
   If bExist And  bActualExist  Then
       LogMessage "RSLT","Verification","Popup :ValidationMessage Exists As Expected" ,true
       verifyPopupValidationMessage_Activation=True
   ElseIf not bExist And  not bActualExist  Then
       LogMessage "RSLT","Verification","Popup :ValidationMessage does not Exists As Expected" ,true
       verifyPopupValidationMessage_Activation=True
   ElseIf bExist And  not bActualExist  Then
       LogMessage "WARN","Verification","Popup :ValidationMessage does not Exists As Expected" ,False
       verifyPopupValidationMessage_Activation=False
   ElseIf not bExist And   bActualExist  Then
       LogMessage "WARN","Verification","Popup :ValidationMessage Still Exists" ,False
       verifyPopupValidationMessage_Activation=False
   End If
End Function

'[Click Button OK_ValidationPopup For Card Activation]
Public Function clickButtonOK_ValidationPopup_Activation()
   bDevPending=False
   CardActivation.btnOK_ValidationPopup.click
   If Err.Number<>0 Then
       clickButtonOK_ValidationPopup=false
            LogMessage "WARN","Verification","Failed to Click Button : OK_ValidationPopup" ,false
       Exit Function
   End If
   clickButtonOK_ValidationPopup_Activation=true
End Function

'[Verify Field ValidationMessage For Card Activation displayed as]
Public Function verifyValidationMessageActivation(strExpectedText)
   bDevPending=False
   bVerifyValidationMessageText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (CardActivation.lblValidationMessage(), strExpectedText, "ValidationMessage")Then
           bVerifyValidationMessageText=false
       End If
   End If
   verifyValidationMessageActivation=bVerifyValidationMessageText
End Function

'[Verify Field CardNumber_RequestSubmitted on Card Activation SR Screen displayed as]
Public Function verifyCardNumber_RequestSubmittedText(strExpectedText)
   bDevPending=true
   bVerifyCardNumber_RequestSubmittedText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (CardActivation.lblCardNumber_RequestSubmitted(), strExpectedText, "CardNumber_RequestSubmitted")Then
           bVerifyCardNumber_RequestSubmittedText=false
       End If
   End If
   verifyCardNumber_RequestSubmittedText=bVerifyCardNumber_RequestSubmittedText
End Function

'[Verify Field ProductDescription_RequestSubmitted on Card Activation SR Screen displayed as]
Public Function verifyProductDescription_RequestSubmittedText(strExpectedText)
   bDevPending=true
   bVerifyProductDescription_RequestSubmittedText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (CardActivation.lblProductDescription_RequestSubmitted(), strExpectedText, "ProductDescription_RequestSubmitted")Then
           bVerifyProductDescription_RequestSubmittedText=false
       End If
   End If
   verifyProductDescription_RequestSubmittedText=bVerifyProductDescription_RequestSubmittedText
End Function

'[Click Link SRNumber_RequestSubmitted on Card Activation SR Screen]
Public Function clickLinkSRNumber_RequestSubmitted()
   bDevPending=true
   CardActivation.lnkSRNumber_RequestSubmitted.click
   If Err.Number<>0 Then
       clickLinkSRNumber_RequestSubmitted=false
            LogMessage "WARN","Verification","Failed to Click Link : SRNumber_RequestSubmitted" ,false
       Exit Function
   End If
   clickLinkSRNumber_RequestSubmitted=true
End Function


'[Verify Field Status_RequestSubmitted on Card Activation SR Screen displayed as]
Public Function verifyStatus_RequestSubmittedText(strExpectedText)
   bDevPending=true
   bVerifyStatus_RequestSubmittedText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (CardActivation.lblStatus_RequestSubmitted(), strExpectedText, "Status_RequestSubmitted")Then
           bVerifyStatus_RequestSubmittedText=false
       End If
   End If
   verifyStatus_RequestSubmittedText=bVerifyStatus_RequestSubmittedText
End Function

'[Click Button RefreshStatus_RequestSubmitted on Card Activation SR Screen]
Public Function clickButtonRefreshStatus()
   bDevPending=true
   CardActivation.btnRefreshStatus.click
   If Err.Number<>0 Then
       clickButtonRefreshStatus=false
            LogMessage "WARN","Verification","Failed to Click Button : RefreshStatus" ,false
       Exit Function
   End If
   clickButtonRefreshStatus=true
End Function

'[Click Button Cancel_RequestSubmitted on Card Activation SR Screen]
Public Function clickButtonCancel_RequestSubmitted()
   bDevPending=true
   CardActivation.btnCancel_RequestSubmitted.click
   If Err.Number<>0 Then
       clickButtonCancel_RequestSubmitted=false
            LogMessage "WARN","Verification","Failed to Click Button : Cancel_RequestSubmitted" ,false
       Exit Function
   End If
   clickButtonCancel_RequestSubmitted=true
End Function

'[Verify Popup Confirmation Message exist for Card Activation]
Public Function verifyPopupConfirmationMessage_Activation(bExist)
   bDevPending=False
   bActualExist=CardActivation.popupConfirmationMessage.Exist(1)
   If bExist And  bActualExist  Then
       LogMessage "RSLT","Verification","Popup :Confirmation Message Exists As Expected" ,true
       verifyPopupConfirmationMessage_Activation=True
   ElseIf not bExist And  not bActualExist  Then
       LogMessage "RSLT","Verification","Popup ::Confirmation Message does not Exists As Expected" ,true
       verifyPopupConfirmationMessage_Activation=True
   ElseIf bExist And  not bActualExist  Then
       LogMessage "WARN","Verification","Popup ::Confirmation Message does not Exists As Expected" ,False
       verifyPopupConfirmationMessage_Activation=False
   ElseIf not bExist And   bActualExist  Then
       LogMessage "WARN","Verification","Popup ::Confirmation Message Still Exists" ,False
       verifyPopupConfirmationMessage_Activation=False
   End If
End Function

'[Click Button btnOK_Confirmation For Card Activation]
Public Function clickOK_ConfirmationPopup_Activation()
   bDevPending=False
   CardActivation.btnOK_ConfirmationPopup.click
   If Err.Number<>0 Then
       clickOK_ConfirmationPopup_Activation=false
            LogMessage "WARN","Verification","Failed to Click Button : OK_ConfirmationPopup" ,false
       Exit Function
   End If
   clickOK_ConfirmationPopup_Activation=true
End Function

'[Verify Field Confirmation Message For Card Activation displayed as]
Public Function verifyConfirmationMessageActivation(strExpectedText)
   bDevPending=False
   bVerifyValidationMessageText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (CardActivation.lblConfirmationMessage(), strExpectedText, "ConfirmationMessage")Then
           bVerifyValidationMessageText=false
       End If
   End If
   verifyConfirmationMessageActivation=bVerifyValidationMessageText
End Function

'[Perform Additional Verification for TPIN call from Card Activation]
Public Function performTPINPlusOneVerification(bExpectedVerification, strValidationMessage)
   Dim bPerformTPINPlusOneVerification:bPerformTPINPlusOneVerification=true
   bActualExist=CardActivation.popupValidationMessage.Exist(1)
		
   If  bExpectedVerification Then
		If not bActualExist Then
			bPerformTPINPlusOneVerification=false
		 else
			strActualValidationMessage=CardActivation.lblValidationMessage.GetRoProperty("innertext")
			If Not IsNull(strActualValidationMessage) Then
				If Not VerifyInnerText (CardActivation.lblValidationMessage(), strValidationMessage, "ValidationMessage")Then
					bPerformTPINPlusOneVerification=false
				End If
			End If
			clickButtonOK_ValidationPopup_Activation()
			VerifyCustomer.btnVerify.Click
			waitForIcallLoading
			
			'Check Required Verification met Check box
			Set oDesc= Description.Create()
			oDesc("micclass").Value="WebCheckBox"
			'CardActivation.cbTPINVerification.ChildObjects(oDesc)(0).Set "ON" '******** Check box removed
			CardActivation.rbAdditionalAnswer.click
			'Wait 1
			VerifyCustomer.btnVerifyCustomer().click
			waitForIcallLoading
			If err.number<>0 Then
				bPerformTPINPlusOneVerification=false
			End If
		End If
	 
   End If

   performTPINPlusOneVerification=bPerformTPINPlusOneVerification
End Function

'[Verify Verification failed Error Message on Card Activation Screen]
Public Function verifyVerificationErrorMessage_CA(strValidationMessage)
	bverifyVerificationErrorMessage_CA=true
	If not VerifyInnerText(CardActivation.lblValidationMessage(),strValidationMessage,"Verification Required") Then
		bverifyVerificationErrorMessage_RC=false
	End If
	 CardActivation.btnOK_ValidationPopup.click
   If Err.Number<>0 Then
       bverifyVerificationErrorMessage_CA=false
            LogMessage "WARN","Verification","Failed to Click OK : Verification Required" ,false
       Exit Function
   End If
   WaitForICallLoading
	verifyVerificationErrorMessage_CA=bverifyVerificationErrorMessage_CA
End Function

'[Verify Field TM Approval Message on Card Activation Screen displayed as]
Public Function verifyTMApprovalMessage_CA(strValidationMessage)
   bDevPending=False
   bVerifyValidationMessageText=true
   If Not IsNull(strValidationMessage) Then
       If Not VerifyInnerText (CardActivation.lblTMValidationMessage(), strValidationMessage, "Validation Message")Then
           bVerifyValidationMessageText=false
       End If
   End If
   CardActivation.btnOK.Click
   WaitForIcallLoading
   verifyTMApprovalMessage_CA=bVerifyValidationMessageText
End Function

'[Click button Close on Request Submitted Popup]
Public Function clickBtnClose_RequestSubmitted_CA()
	bDevPending=false
   CardActivation.btnOK_RequestSubmitted.click
   If Err.Number<>0 Then
       clickBtnClose_RequestSubmitted=false
            LogMessage "WARN","Verification","Failed to Click Button : Close_RequestSubmitted" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickBtnClose_RequestSubmitted=true
End Function

'Created by Poornima For PBL 21
'[Verify Submit button is Enabled]
Public Function VerifybtnSubmit_CA()
	bDevPending=False
   Dim bVerifybtnSubmit_CA:bVerifybtnSubmit_CA=true
	intBtnSubmit=Instr(CardActivation.btnSubmit.GetROproperty("outerhtml"),("v-disabled"))
	If  intBtnSubmit=0 Then
		LogMessage "RSLT","Verification","Submit button is enable as per expectation.",True
		bVerifybtnSubmit_CA=true
	Else
		LogMessage "WARN","Verifiation","Submit button is disable. Expected to be enable.",false
		bVerifybtnSubmit_CA=false
	End If
	VerifybtnSubmit_CA=bVerifybtnSubmit_CA
End Function
'
''[Verify Key Info Page Field Card Block Code Date displayed as]
'Public Function verifyCardBlkCodeDate(strBlkCodeDate)
'	verifyCardBlkCodeDate = true
'	strActBlkCodeDate = CardActivation.lblCardBlkCodeDate.GetRoProperty("innertext")
'	If strBlkCodeDate = strActBlkCodeDate Then
'		LogMessage "RSLT","Verification","Card Block Code Date is as per the expectation.Actual: " &strActBlkCodeDate &" Expected: " &strBlkCodeDate,True
'		verifyCardBlkCodeDate = true
'	else
'		LogMessage "RSLT","Verification","Card Block Code Date is not as per the expectation.Actual: " &strActBlkCodeDate &" Expected: " &strBlkCodeDate ,False
'		verifyCardBlkCodeDate = false
'	End If
'End Function

'[Verify Key Info Page Field Main/Supplementary Indicator displayed as]
Public Function verifyMainSuppIndicator(strIndicator)
	strActualIndicator = CardActivation.lblMainSuppIndicator.GetRoProperty("innertext")
	If strIndicator = strActualIndicator Then
		LogMessage "RSLT","Verification","Main/Supplementary Indicator is as per the expectation.Actual: " &strActualIndicator &" Expected: " &strIndicator,True
		verifyMainSuppIndicator = true
	else
		LogMessage "RSLT","Verification","Main/Supplementary Indicator is not as per the expectation.Actual: " &strActualIndicator &" Expected: " &strIndicator ,False
		verifyMainSuppIndicator = false
	End If
End Function

