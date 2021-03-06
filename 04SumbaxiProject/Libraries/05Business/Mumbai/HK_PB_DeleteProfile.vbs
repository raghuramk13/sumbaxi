'[Click on Delete Profile Button]
Public Function clickDeleteProfileButton()
	ClickOnObject HK_PB_CreateProfile_Page.btnDeleteProfile(),"Delete Profile Button"
End Function
'[Verify txt CIFNo for Delete Profile]
Public Function verifyCIFNoText(strCustCIF)
	bverifyCIFNoText=true
	If Not verifyInnerText_Pattern(HK_PB_DeleteProfile_Page.wele_deleteprofile_cifNo_value(), strCustCIF, "Delete Profile CIFNo Text") Then
		bverifyNRICText=false
	End If
	verifyCIFNoText=bverifyCIFNoText
End Function
'[Verify txt Description for Delete Profile]
Public Function verifyDeleteDescriptionText(strDescriptionText)
	bverifyDeleteDescriptionText=true
	If Not verifyInnerText_Pattern(HK_PB_DeleteProfile_Page.wele_deleteprofile_srDescription(), strDescriptionText, "Delete Profile Description Text") Then
		bverifyDeleteDescriptionText=false
	End If
	verifyDeleteDescriptionText=bverifyDeleteDescriptionText
End Function
'[Verify txt PhonebankingNumber for Delete Profile]
Public Function verifyPhonebankingNumberText(strPhonebankingNumberText)
	bverifyPhonebankingNumberText=true
	If Not verifyInnerText_Pattern(HK_PB_DeleteProfile_Page.wele_deleteprofile_phoneBankingNumb(), strPhonebankingNumberText, "Delete Profile PhonebankingNumber Text") Then
		bverifyPhonebankingNumberText=false
	End If
	verifyPhonebankingNumberText=bverifyPhonebankingNumberText
End Function
'[Verify txt PINStatus for Delete Profile]
Public Function verifyPINStatusText(strPINStatusText)
	bverifyPINStatusText=true
	If Not verifyInnerText_Pattern(HK_PB_DeleteProfile_Page.wele_deleteprofile_pinStatus_value(), strPINStatusText, "Delete Profile PIN Status Text") Then
		bverifyPINStatusText=false
	End If
	verifyPINStatusText=bverifyPINStatusText
End Function
'[Verify Confirmation message is displayed Upon PBS Request Deletion]
Public Function verifyConfirmationMessage_DeletePBS()
	blnverifyConfirmationMessage_DeletePBS = true
	If Not IsNull(strErrorMessage) Then
		If Not VerifyInnerText (HK_PB_CreateProfile_Page.welestpTMApproveCntspan(),"This SR will be routed to Team Manager for following reason(s): Request for PBS deletion.", "Confirmation  message Delete PBS") Then
			blnverifyConfirmationMessage_DeletePBS = false
		End If
	End If
	verifyConfirmationMessage_DeletePBS = blnverifyConfirmationMessage_DeletePBS
End Function
'[Click Delete Phone Banking Profile hyperlink on Pending SR page]
Public Function viewPendingSRDetailsDeletePB(strlstPendingSRDetails)
	Dim blnviewPendingSRDetailsDeletePB:blnviewPendingSRDetailsDeletePB = True
	blnviewPendingSRDetailsDeletePB=selectTableLink(HK_PB_CreateProfile_Page.tblPendingSRHeader(),HK_PB_CreateProfile_Page.tblPendingSRContent(),strlstPendingSRDetails,"Pending SR Search" ,"Type",true,HK_PB_CreateProfile_Page.lnkPendingSRNext(),HK_PB_CreateProfile_Page.lnkPendingSRNext1(),HK_PB_CreateProfile_Page.lnkPendingSRPrevious())
	WaitForICallLoading
	viewPendingSRDetailsDeletePB=blnviewPendingSRDetailsDeletePB
End Function
'[Verify Delete Phone banking Pending Approval SR details section]
Public Function verifyPBDeletePendingApprovalSRDetailsSection(strSRType,strSRSubType,strIDNumber,strCreatedby,strAdditonalSRInfo)
	blnverifyPBDeletePendingApprovalSRDetailsSection=True
	If strSRType <>"" Then
			If Not verifyInnerText_Pattern(HK_PB_DeleteProfile_Page.weleSRType(), strSRType, "SR Type") Then
				blnverifyPBDeletePendingApprovalSRDetailsSection=False
			End If
	End If
	If strSRSubType <>"" Then
			If Not verifyInnerText_Pattern(HK_PB_CreateProfile_Page.weleSRSubType(), strSRSubType, "SR Sub Type") Then
				blnverifyPBDeletePendingApprovalSRDetailsSection=False
			End If
	End If	
	If strIDNumber <>"" Then
			If Not verifyInnerText_Pattern(HK_PB_CreateProfile_Page.weleIDNumber(), strIDNumber, "ID Number") Then
				blnverifyPBDeletePendingApprovalSRDetailsSection=False
			End If
	End If	
	If strCreatedby <>"" Then
			If Not verifyInnerText_Pattern(HK_PB_CreateProfile_Page.weleCreatedBy(), UCASE(strCreatedby), "Created By") Then
				blnverifyPBDeletePendingApprovalSRDetailsSection=False
			End If
	End If	
	If strAdditonalSRInfo <>"" Then
			If Not verifyInnerText_Pattern(HK_PB_CreateProfile_Page.weleAdditionalSRInfo(),strAdditonalSRInfo, "Additional SR Info") Then
				blnverifyPBDeletePendingApprovalSRDetailsSection=False
			End If
	End If	
	verifyPBDeletePendingApprovalSRDetailsSection=blnverifyPBDeletePendingApprovalSRDetailsSection
End Function
'[Set comments in Delete Profile Comments box]
Public Function Approver_setComments_DeletePB(strComments)
	blnApprover_setComments_DeletePB=true
	HK_PB_CreateProfile_Page.txtDeleteProfileComments().Set strComments
	If Err.Number<>0 Then
		blnApprover_setComments_DeletePB=false
		LogMessage "WARN","Verification","Failed to set comments" ,false
	Else
		LogMessage "RSLT","Verification","set the comments as expected",True
		blnApprover_setComments_DeletePB=true
	End If
	Approver_setComments_DeletePB= blnApprover_setComments_DeletePB
End function
