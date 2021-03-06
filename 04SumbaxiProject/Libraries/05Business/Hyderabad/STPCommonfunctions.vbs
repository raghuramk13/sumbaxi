'[Verify Field Description on STP Page displayed as]
Public Function verifyfieldDescription_STP(strDescription)
   bverifyDescriptionText=true
   If Not IsNull(strDescription) Then
       If Not VerifyInnerText (IServeSTPCommon.lblDescription(), strDescription, "Description") Then
       	   LogMessage "WARN","Verification","Description does not match with exepected" ,false
           bverifyDescriptionText=false
       End If
   End If
   WaitForICallLoading
   verifyfieldDescription_STP = bverifyDescriptionText
End Function

'[Verify Knowledge base link on STP Screen is enabled]
Public Function VerifyKnowledgebaselinkEnabled_STP()
   Dim bVerifyKnowledgebaselink:bVerifyKnowledgebaselink=true
     strKBLink=IServeSTPCommon.lnkKnowledgeBase.GetROProperty("Outerhtml")
	
    If inStr(strKBLink,"v-disabled") = 0 Then
		LogMessage "RSLT","Verification","Knowledge base Link  enabled successfully as expected",true
	else
		LogMessage "WARN","Verification","Knowledge base Link  does not enabledas expected",false
		bVerifyKnowledgebaselink=false
	End If
	VerifyKnowledgebaselinkEnabled_STP = bVerifyKnowledgebaselink
End Function

'[Click Button Cancel in STP Page]
Public Function clickButtonCancel_STP()
   IServeSTPCommon.btnCancel.click
   If Err.Number<>0 Then
       clickButtonCancel_PR=false
            LogMessage "WARN","Verification","Failed to Click Button : Cancel" ,false
       Exit Function
   End If
   WaitForIcallLoading
   clickButtonCancel_STP =true
End Function

'[Verify the Cancel Confirmation message in STP Page displayed as]
Public Function verifyConfirmationCancel_STP(strConfirmMsg)
   bverifyConfirmationCancel=true
   If Not IsNull(strConfirmMsg) Then
       If Not verifyInnerText(IServeSTPCommon.lblValidationMsg(),strConfirmMsg, "ConfirmationPopup")Then
			bverifyConfirmationCancel = False
		End If
   End If
   verifyConfirmationCancel_STP = bverifyConfirmationCancel
End Function

'[Click Button in cancel popup Validation Message displayed]
Public Function SelectButtonPopup_STP(strSelect)
 bSelectButton = True
	If Not IsNull(strSelect) Then
	   If strSelect = "YES" Then
	   	 IServeSTPCommon.btnYES.click
	   ElseIf strSelect = "NO" Then
	     IServeSTPCommon.btnNO.click
	   End If 	   
	If Err.Number<>0 Then
	   LogMessage "WARN","Verification","Failed to Click Button YES/NO : Confirmation Popup" ,false
	   bSelectButton=false
	End If
	End If 
   WaitForIcallLoading
SelectButtonPopup_STP = bSelectButton
End Function

'[Click Button Submit on STP Screen]
Public Function clickButtonSubmit_STP()
   bDevPending=false
   IServeSTPCommon.btnSubmit.click
   If Err.Number<>0 Then
       clickButtonSubmit=false
            LogMessage "WARN","Verification","Failed to Click Button : Submit" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickButtonSubmit_STP=true
End Function

'[Verify Submit Button display in STP page displayed as]
Public Function VerifySubmitBtn_STP(strAction)
   	bVerifySubmitBtn=true
    If strAction = "Enabled" Then
    	intBtnSubmit=Instr(IServeSTPCommon.btnSubmit.GetROproperty("outerhtml"),("v-disabled"))
		If  intBtnSubmit=0 Then
			LogMessage "RSLT","Verification","Submit button is enabled as expected.",True
			bVerifySubmitBtn=true
		Else
			LogMessage "WARN","Verifiation","Submit button is disabled.",false
			bVerifySubmitBtn=false
		End If
	ElseIf strAction = "Disabled" Then
	    	intBtnSubmit=Instr(IServeSTPCommon.btnSubmit.GetROproperty("outerhtml"),("v-enabled"))
		If  intBtnSubmit=0 Then
			LogMessage "RSLT","Verification","Submit button is disabled as expected.",True
			bVerifySubmitBtn=true
		Else
			LogMessage "WARN","Verifiation","Submit button is enabled.",false
			bVerifySubmitBtn=false
		End If
	End If 
	VerifySubmitBtn_STP = bVerifySubmitBtn
End Function

'[Verify Field CardNumber on Request Submitted Popup in STP page displayed as]
Public Function verifyAccountCardNo_STP(strCardNumber)
	bverifyAccountCardNo = true
	WaitForICallLoading
	If Not IsNull(strCardNumber) Then
       If Not VerifyInnerText (IServeSTPCommon.lbAccountNumber(), strCardNumber, "Account/Card No in SR Submission PopUp")Then
           bverifyAccountCardNo=false
       End If
   End If
   verifyAccountCardNo_STP = bverifyAccountCardNo
End Function

'[Verify Field ProductDescription on Request Submitted Popup in STP page displayed as]
Public Function verifyProductDesc_STP(strProductDesc)
	bverifyProductDesc = true
	If Not IsNull(strProductDesc) Then
       If Not VerifyInnerText (IServeSTPCommon.lblProductDescription(), strProductDesc, "Product Description in SR Submission PopUp")Then
           bverifyProductDesc=false
       End If
   End If
   verifyProductDesc_STP = bverifyProductDesc
End Function

'[Verify Field SR Status on Request Submitted Popup in STP page displayed as]
Public Function verifySRStatus_STP(strStatus)
	bverifySRStatus = true
	If Not IsNull(strStatus) Then
       If Not VerifyInnerText (IServeSTPCommon.lblStatus(), strStatus, "Serice request status in SR Submission PopUp")Then
           bverifySRStatus = false
       End If
   End If
   verifySRStatus_STP = bverifySRStatus
End Function

'[Click button Close on Request Submitted Popup on STP Page]
Public Function clickBtnClose_STP()
	bDevPending=false
	WaitForICallLoading
   IServeSTPCommon.btnClose.click
   If Err.Number<>0 Then
       clickBtnClose_RequestSubmitted_IB=false
            LogMessage "WARN","Verification","Failed to Click Button : Close_RequestSubmitted" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickBtnClose_STP=true
End Function

'[Perform Add Notes by clicking Add Notes Button on STP Page]
Public Function addNote_STP(strNote)
   bDevPending=false
   baddNote_FR=true	
	If not isNull(strNote) Then
		IServeSTPCommon.btnAddNotes.click
		WaitForICallLoading
           If Not IServeSTPCommon.popupValidationMessage.exist(5)Then
			  LogMessage "WARN","Verification","Add New Comment action failed"
			  baddNote_FR=false
		   else
			  LogMessage "RSLT","Verification","Add New Comment performed successfully" ,true
			  baddNote_FR=True
	  	   End If
		IServeSTPCommon.txtComment_Notes.set strNote
		IServeSTPCommon.btnOK.Click
		WaitForIcallLoading
	End If		
	addNote_STP=baddNote_FR
End Function

'[Verify Button Add Notes is disable on STP Page]
Public Function verifydisplayAddNotes_STP()
	bverifybtnAddNotes_Disable=true
	intrBtnAdd=Instr(IServeSTPCommon.btnAddNotes.Object.GetAttribute("disabled"),("disabled"))
	If not intrBtnAdd=0 Then
		LogMessage "RSLT","Verification","Add Notes button is disable as expected.",True
		bverifybtnAddNotes_Disable=true
	Else
		LogMessage "WARN","Verifiation","Add Notes button is enable. Expected to be disable.",false
		bverifybtnAddNotes_Disable=false
	End If
	verifydisplayAddNotes_STP=bverifybtnAddNotes_Disable
End Function

'[Verify Field Validation Message on STP Page]
Public Function verifyValidationMessage_STP(strExpectedText)
   bverifyValidationMessage=true
   WaitForIcallLoading
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (IServeSTPCommon.lblValidationMessage(), strExpectedText, "Validation Message") Then
           bverifyValidationMessage=false
       End If
   End If
   wait(2)
   IServeSTPCommon.btnOK.Click
   WaitForICallLoading
   verifyValidationMessage_STP=bverifyValidationMessage
End Function

'[Set TextBox Comments on STP Page]
Public Function setCommentsTextbox_STP(strComment)
   IServeSTPCommon.txtComment.Set strComment
   WaitForIcallLoading
   If Err.Number<>0 Then
       setCommentsTextbox_STP=false
       LogMessage "WARN","Verification","Failed to Set Text Box :Comments" ,false
       Exit Function
   End If
   setCommentsTextbox_STP=true
End Function
