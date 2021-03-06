'*****This is auto generated code using code generator please Re-validate ****************
'Dim strRunTimeSRNumber_RC:strRunTimeSRNumber_RC=""  'This Variable is used to Store SR numbers at runtime

'[Verify Tab IB Maintenance displayed]
Public Function verifyTabIBMaintenance()
   bDevPending=false
   verifyTabIBMaintenance=verifyTabExist("IB Maintenance")
End Function

'[Click Button IB Maintenance]
Public Function clickButtonIBMaintenance()
   bDevPending=false
   bclickButtonIBMaintenance=true
   IbMaintainence.btnIBMaintainence.click
   If Err.Number<>0 Then
       clickButtonIBMaintenance=false
            LogMessage "WARN","Verification","Failed to Click Button : IBMaintenance" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickButtonIBMaintenance=bclickButtonIBMaintenance
End Function

'[Verify Button IB Maintenance Exist]
Public Function verifyButtonIBMaintenance_IB()
   bDevPending=false
   bverifyButtonIBMaintenance=true
	If not (IbMaintainence.btnIBMaintainence.exist(0)) Then
		bverifyButtonIBMaintenance=false
	End If
	WaitForICallLoading
    verifyButtonIBMaintenance_IB=bverifyButtonIBMaintenance
End Function

'[Select Combobox Access Request Type on IB Maintenance Screen as]
Public Function selectAccessRequestTypeComboBox(strAccessRequestType)
   bDevPending=false
   bselectAccessRequestTypeComboBox=true
   If Not IsNull(strAccessRequestType) Then
       If Not (selectItem_Combobox (IbMaintainence.lstAccessRequestType(), strAccessRequestType))Then
            LogMessage "WARN","Verification","Failed to select :"&strAccessRequestType&" From Access Request Type drop down list" ,false
           bselectAccessRequestTypeComboBox=false
       End If
   End If
   WaitForICallLoading
   selectAccessRequestTypeComboBox=bselectAccessRequestTypeComboBox
End Function

'[Verify Access Request Type Combobox has Items]
Public Function verifyAccessRequestTypeComboboxItems(strAccessRequestTypeItems)
   bverifyAccessRequestTypeComboboxItems=true
   WaitForICallLoading
   If Not IsNull(strAccessRequestTypeItems) Then
       If Not verifyComboboxItems (IbMaintainence.lstAccessRequestType(), strAccessRequestTypeItems, "Access Request Types")Then
       		LogMessage "WARN","Verification","Failed to select :"&strAccessRequestTypeItems&" From Access Request Type drop down list" ,false
           bverifyAccessRequestTypeComboboxItems=false
       End If
   End If
   verifyAccessRequestTypeComboboxItems=bverifyAccessRequestTypeComboboxItems
End Function

'[Verify Field Description on IB Maintainence Screen displayed as]
Public Function verifyDescriptionText_IB(strDescription)
   bDevPending=false
   bverifyDescriptionText_IB=true
   If Not IsNull(strDescription) Then
       If Not VerifyInnerText (IbMaintainence.lblDescription(), strDescription, "Description")Then
       LogMessage "WARN","Verification","Description does not match with exepected" ,false
           bVerifyDescriptionText=false
       End If
   End If
   WaitForICallLoading
   verifyDescriptionText_IB=bverifyDescriptionText_IB
End Function

'[Verify Knowledge base link is enabled on IB Maintainence Screen]
Public Function VerifyKnowledgebaselinkEnabled_IB()
      bDevPending=false
   Dim bVerifyKnowledgebaselink:bVerifyKnowledgebaselink=true
     strKBLink=IbMaintainence.lnkKnowledgeBase.GetROProperty("Outerhtml")
	
    If inStr(strKBLink,"v-disabled") = 0Then
		LogMessage "RSLT","Verification","Knowledge base Link  enabled successfully as expected",true
	else
		LogMessage "WARN","Verification","Knowledge base Link  does not enabledas expected",false
		bVerifyKnowledgebaselink=false
	End If
	WaitForICallLoading
	VerifyKnowledgebaselinkEnabled_IB=bVerifyKnowledgebaselink
End Function

'[Verify Field KnowledgeBase on IB Maintainence Screen displayed as]
Public Function verifyKnowledgeBase_Replace(strExpectedLink)
   bDevPending=false
   bVerifyKnowledgeBaseText=true
   If Not IsNull(strExpectedLink) Then
		
		'Set oDesc_KB = Description.Create()
		'	oDesc_KB("micclass").Value = "Link"		
		'	strKBLink=CardReplacement.lnkKnowledgeBase.ChildObjects(oDesc_KB)(0).GetROProperty("href")
			strKBLink=CardReplacement.lnkKnowledgeBase.GetROProperty("href")
			strExpectedLink=Replace(strExpectedLink,"@","=")
			intKnowledgeLink=InStr(strKBLink, strExpectedLink)
       If intKnowledgeLink=0 Then
		   LogMessage "RSLT","Verification","Knowledge base link does not matched with expected. Actual : "&strKBLink&" Expected "&strExpectedLink,false
           bVerifyKnowledgeBaseText=false
	   else
	 		LogMessage "RSLT","Verification","Knowledge base link matched with expected",true
       End If
   End If
   WaitForICallLoading
   verifyKnowledgeBase_Replace=bVerifyKnowledgeBaseText
End Function

'[Click Button AddNotes on IB Maintainence Screen]
Public Function clickButtonAddNotes_IB()
   bDevPending=false
   IbMaintainence.btnAddNotes.click
   If Err.Number<>0 Then
       clickButtonAddNotes=false
            LogMessage "WARN","Verification","Failed to Click Button : AddNotes" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickButtonAddNotes=true
End Function

'[Perform Add Notes by clicking Add Notes Button on IB Maintainence Screen]
Public Function addNote_IB(strNote)
   bDevPending=false
   bVerifypopupNotes=true
	Dim bVerifypopupNotes:VerifypopupNotes=true
	
	If not isNull(strNote) Then
		IbMaintainence.btnAddNotes.click
		WaitForICallLoading
            If not   IbMaintainence.popupValidationMessage.exist(5)Then
				LogMessage "WARN","Verification","New Note dialog did not displayed",false
				bVerifypopupNotes=false
			 else
			 strMessage=IbMaintainence.lblMaxAllowed.GetROProperty("innerText")
				If not strMessage="Max allowed - 3000" Then
					LogMessage "WARN","Verification","Add New Comment popup dialog incorrectly displayed max allowed character count for comment. Expected : Max allowed - 3000 and Actual: "&strMessage,false
					bVerifypopupNotes=false
				End If
			   IbMaintainence.txtComment_Notes.set strNote
			  
				IbMaintainence.btnOK_ValidationMsg.Click
			  WaitForIcallLoading
		   End If 
		End If 
		WaitForICallLoading
	addNote_IB=bVerifypopupNotes
End Function

'[Verify Button Add Notes is enabled on IB Maintainence Screen]
Public Function VerifybtnAddNoteEnabled_IB()
	bDevPending=False
   Dim bVerifyAddNote:bVerifyAddNote=true
	intBtnNote=Instr(IbMaintainence.btnAddNotes.GetROproperty("outerhtml"),"v-disabled")
	If  intBtnNote=0 Then
		LogMessage "RSLT","Verification","Note button is enable as per expectation.",True
		bVerifyAddNote=true
	Else
		LogMessage "WARN","Verifiation","Note button is disable. Expected to be enable.",false
		bVerifyAddNote=false
	End If
	VerifybtnAddNoteEnabled_IB=bVerifyAddNote
End Function

'[Verify Button Add Notes is disabled on IB Maintainence Screen]
Public Function VerifybtnAddNoteDisabled_IB()
	bDevPending=False
   Dim bVerifyAddNote:bVerifyAddNote=true
	'intBtnNote=Instr(IbMaintainence.btnAddNotes.GetROproperty("outerhtml"),"v-disabled")
	intBtnNote=Instr(IbMaintainence.btnAddNotes.Object.GetAttribute("disabled"), "disabled")
	If not intBtnNote=0 Then
		LogMessage "RSLT","Verification","Note button is disabled as per expectation.",True
		bVerifyAddNote=true
	Else
		LogMessage "WARN","Verifiation","Note button is enable. Expected to be disabale.",false
		bVerifyAddNote=false
	End If
	VerifybtnAddNoteDisabled_IB=bVerifyAddNote
End Function

'[Verify Field Comment on IB Maintainence Screen displayed as]
Public Function verifyCommentText_IB(strComment)
   bDevPending=false
   bVerifyCommentText=true
   If Not IsNull(strComment) Then
       If Not VerifyField( IbMaintainence.txtComment(), strComment, "Comment")Then
           bVerifyCommentText=false
       End If
   End If
   verifyCommentText_IB=bVerifyCommentText
End Function

'[Set TextBox Comment to on IB Maintainence Screen]
Public Function setCommentTextbox_IB(strComment)
   bDevPending=False
   strTimeStamp = ""&now
	strComment =strComment &" "&strTimeStamp
	gstrRuntimeCommentStep="Set TextBox Comment to on IB Maintainence Screen"
	insertDataStore "SRComment", strComment
	
   IbMaintainence.txtComment.Set(strComment)
   If Err.Number<>0 Then
       setCommentTextbox_IB=false
            LogMessage "WARN","Verification","Failed to Set Text Box :Comment" ,false
       Exit Function
   End If
   setCommentTextbox_IB=true
End Function

'[Click Button Submit on IB Maintainence Screen]
Public Function clickButtonSubmit_IB()
   bDevPending=false
   IbMaintainence.btnSubmit.click
   If Err.Number<>0 Then
       clickButtonSubmit=false
            LogMessage "WARN","Verification","Failed to Click Button : Submit" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickButtonSubmit_IB=true
End Function

'[Verify Button Submit is enabled on IB Maintainence Screen]
Public Function VerifybtnSubmit_IB()
	bDevPending=False
   Dim bVerifybtnSubmit:bVerifybtnSubmit=true
	'IbMaintainence.tblSelectedProfileHeader.Click
	intBtnSubmit=Instr(IbMaintainence.btnSubmit.Object.GetAttribute("disabled"),("disabled"))
	
	If  intBtnSubmit=0 Then
		LogMessage "RSLT","Verification","Submit button is enable as per expectation.",True
		bVerifybtnSubmit=true
	Else
		LogMessage "WARN","Verifiation","Submit button is disable. Expected to be enable.",false
		bVerifybtnSubmit=false
	End If
	VerifybtnSubmit_IB=bVerifybtnSubmit
End Function

'[Verify Button Submit is disabled on IB Maintainence Screen]
Public Function VerifybtnSubmitDisabled_IB()
	bDevPending=False
   Dim bVerifybtnSubmit:bVerifybtnSubmit=true
	intBtnSubmit=Instr(IBMaintenance.btnSubmit.Object.GetAttribute("disabled"),("disabled"))
	If  not intBtnSubmit=0 Then
		LogMessage "RSLT","Verification","Submit button is disable as expected.",True
		bVerifybtnSubmit=true
	Else
		LogMessage "WARN","Verifiation","Submit button is enable. Expected to be disable.",false
		bVerifybtnSubmit=false
	End If
	VerifybtnSubmitDisabled_RC=bVerifybtnSubmit
End Function

'[Verify Button Submit if is enabled on IB Maintainence Screen]
Public Function VerifybtnSubmit_IBMaintenance(bEnabled)
	bDevPending=false
   Dim bVerifyButtonSubmit:bVerifyButtonSubmit=true
	intBtnSubmit=Instr(IBMaintenance.btnSubmit.Object.GetAttribute("disabled"),("disabled"))
	If bEnabled Then
		If  intBtnSubmit=0 Then
			LogMessage "RSLT","Verification","Submit button is enable as per expectation.",True
			bVerifyButtonSubmit=true
		Else
			LogMessage "WARN","Verifiation","Submit button is disable. Expected to be enable.",false
			bVerifyButtonSubmit=false
		End If
	else
		If  intBtnSubmit<>0 Then
			LogMessage "RSLT","Verification","Submit button is disabled as per expectation.",True
			bVerifyButtonSubmit=true
		Else
			LogMessage "WARN","Verifiation","Submit button is Enabled. Expected to be disabled.",false
			bVerifyButtonSubmit=false
		End If
	End If
    VerifybtnSubmit_IBMaintenance=bVerifyButtonSubmit
End Function

'[Verify Button Cancel is enabled on IB Maintainence Screen]
Public Function VerifybtnCancel_IB()
	bDevPending=False
   Dim bVerifybtnCancel_IB:bVerifybtnCancel_IB=true
	intBtnCancel=Instr(IbMaintainence.btnCancel.Object.GetAttribute("disabled"),("disabled"))
	If  intBtnCancel=0 Then
		LogMessage "RSLT","Verification","Cancel button is enable as per expectation.",True
		bVerifybtnCancel_IB=true
	Else
		LogMessage "WARN","Verifiation","Cancel button is disable. Expected to be enable.",false
		bVerifybtnCancel_IB=false
	End If
	VerifybtnCancel_IB=bVerifybtnCancel_IB
End Function

'[Click Button Cancel on IB Maintainence Screen]
Public Function clickButtonCancel_IB()
   bDevPending=false
   IBMaintenance.btnCancel.click
   If Err.Number<>0 Then
       clickButtonCancel=false
            LogMessage "WARN","Verification","Failed to Click Button : Cancel" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickButtonCancel_IB=true
End Function

'[Verify Popup Validation Message for IB Maintainence]
Public Function verifyPopupValidationMessage_Maintainence(strPrevalidationMsg)
   bDevPending=False
   bverifyPopupValidationMessage_Maintainence=true
   If Not IsNull(strPrevalidationMsg) Then
       If Not VerifyInnerText (IbMaintainence.lblValidationMessage(), strPrevalidationMsg, "Validation Message")Then
       		LogMessage "WARN","Verification","Popup :PreValidationMessage does not displayed As Expected" ,False
           bVerifyValidationMessageText=false
       End If
   End If
   IbMaintainence.btnOK_ValidationMsg.click
   WaitForIcallLoading
   verifyPopupValidationMessage_Maintainence=bverifyPopupValidationMessage_Maintainence
End Function

'[Click Button OK_ValidationPopup For IB Maintainence]
Public Function clickButtonOK_ValidationPopup_Maintainence()
   bDevPending=False
   IbMaintainence.btnOK_ValidationMsg.click
   If Err.Number<>0 Then
       clickButtonOK_ValidationPopup_Maintainence=false
            LogMessage "WARN","Verification","Failed to Click Button : OK_ValidationPopup" ,false
       Exit Function
   End If
   clickButtonOK_ValidationPopup_Maintainence=true
End Function

'[Verify row Data in Table Selected Profile on IB Maintainence Screen]
Public Function verifytblSelectedProfile_IB(lstlstSelectedProfile)
   bDevPending=false   
   verifytblSelectedProfile_IB=verifyTableContentList(IbMaintainence.tblSelectedProfileHeader,IbMaintainence.tblSelectedProfileContent,lstlstSelectedProfile,"Selected Profiles" , false,null ,null,null)
End Function

'[Verify Combobox Access Request Type displayed default value on IB Maintainence Screen as]
Public Function verifyAccessRequestTypeText(strAccessRequestType)
    bDevPending=false
   bAccessRequestType=true
   If Not IsNull(strAccessRequestType) Then
       If Not verifyComboSelectItem (IbMaintainence.lblAccessRequestType(), strAccessRequestType, "Access Request Type")Then
           bAccessRequestType=false
       End If
   End If
   verifyAccessRequestTypeText=bAccessRequestType
End Function

'[Verify Field TM Approval Message on IB Maintainence Screen displayed as]
Public Function verifyTMApprovalMessage_IB(strValidationMessage)
   bDevPending=False
   bVerifyValidationMessageText=true
   If Not IsNull(strValidationMessage) Then
       If Not VerifyInnerText (IbMaintainence.lblValidationMessage(), strValidationMessage, "Validation Message")Then
           bVerifyValidationMessageText=false
       End If
   End If
   IbMaintainence.btnOK_ValidationPopup.Click
   WaitForIcallLoading
   verifyTMApprovalMessage_IB=bVerifyValidationMessageText
End Function

'[Click button Close on Request Submitted Popup on IB Maintainence Screen]
Public Function clickBtnClose_RequestSubmitted_IB()
	bDevPending=false
   IBMaintenance.btnClose.click
   If Err.Number<>0 Then
       clickBtnClose_RequestSubmitted_IB=false
            LogMessage "WARN","Verification","Failed to Click Button : Close_RequestSubmitted" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickBtnClose_RequestSubmitted_IB=true
End Function

'[Click Button Refresh on IB Screen]
Public Function clickButtonRefresh_IB()
   bDevPending=false
   IbMaintainence.btnRefresh.click
   If Err.Number<>0 Then
       clickButtonRefresh_IB=false
            LogMessage "WARN","Verification","Failed to Click Button : Refresh" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickButtonRefresh_IB=true
End Function

'[Verify Field Profile Status on IB Screen displayed as]
Public Function verifyProfileStatus_IntBanking(strProfileStatus)
   bDevPending=false
   bverifyProfileStatus_IB=true
   If Not IsNull(strProfileStatus) Then
       If Not VerifyInnerText (IbMaintainence.lblIBProfileStatus(), strProfileStatus, "ProfileStatus")Then
       LogMessage "WARN","Verification","Profile Status does not match with exepected" ,false
           bverifyProfileStatus_IB=false
       End If
   End If
   WaitForICallLoading
   verifyProfileStatus_IntBanking=bverifyProfileStatus_IB
End Function
