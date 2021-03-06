'[Click on Pending SR Tab in Overview page]
Public Function clickPendingSRTab()
	blnclickPendingSRTab=true
	HK_PB_CreateProfile_Page.lnkPendingSR().Click
	WaitForICallLoading
	If Err.Number<>0 Then
		blnclickPendingSRTab=false
		LogMessage "WARN","Verification","Failed to Click Tab :Pending SR" ,false
	Else
		LogMessage "RSLT","Verification","Clicked on Pending SR Tab as expected.",True
		blnclickPendingSRTab=true
	End If
	clickPendingSRTab=blnclickPendingSRTab
End Function
'[Click on SR Tab in Overview page]
Public Function clickSRTab()
	blnclickSRTab=true
	HK_PB_CreateProfile_Page.lnkSR().Click
	WaitForICallLoading
	If Err.Number<>0 Then
		blnclickSRTab=false
		LogMessage "WARN","Verification","Failed to Click Tab :Service Requests in Overview page" ,false
	Else
		LogMessage "RSLT","Verification","Clicked on Service Requests Tab as expected.",True
		blnclickSRTab=true
	End If
	clickSRTab=blnclickSRTab
End Function
'[Verify Phone banking link is enabled]
Public Function verifyPhoneBankingLink_Enable()
	VerifyObjectEnabledDisabled HK_PB_CreateProfile_Page.lnkPhoneBanking(),"Enable","Phone banking link"
End Function
'[Verify Phone banking link is disabled]
Public Function verifyPhoneBankingLink_Disable()
	VerifyObjectEnabledDisabled HK_PB_CreateProfile_Page.lnkPhoneBanking(),"Disable","Phone banking link"
End Function
'[Click on Phone Banking link]
Public Function clickLinkPhoneBanking()
	ClickOnObject HK_PB_CreateProfile_Page.lnkPhoneBanking(),"Phone Banking Link"
	WaitForICallLoading
End Function
'[Verify Knowledge Base link is available]
Public Function verifyKnowledgeBase_Enable()
	blnverifyKnowledgeBase_Enable=true	
	If HK_PB_CreateProfile_Page.lnkKnowledgeBase().Exist(gWaitTime) Then
		LogMessage "RSLT","Verification","Phone banking link is available as expected.",True
		blnverifyKnowledgeBase_Enable=true
	Else
		LogMessage "WARN","Verifiation","Phone banking link is disabled. Expected enabled.",false
		blnverifyKnowledgeBase_Enable=false
	End If
	verifyKnowledgeBase_Enable=blnverifyKnowledgeBase_Enable
End Function
'[Verify error message displayed No Phone Banking Profile Found]
Public Function verifyErrorMessage_PhoneBanking(strErrorMessage)
	blnverifyErrorMessage_PhoneBanking = true
	If Not IsNull(strErrorMessage) Then
		If Not VerifyInnerText (HK_PB_CreateProfile_Page.weleNoProfileMsg(), strErrorMessage, "Phone banking information message") Then
			blnverifyErrorMessage_PhoneBanking = false
		End If
	End If
	verifyErrorMessage_PhoneBanking = blnverifyErrorMessage_PhoneBanking
End Function
'[Verify Create Profile button is enabled]
Public Function verifyCreateProfile_Enable()
	VerifyObjectEnabledDisabled HK_PB_CreateProfile_Page.btnCreateProfile(),"Enable","Create Profile button"
End Function
'[Verify Create Profile button is disabled]
Public Function verifyCreateProfileButton_Disable()
	VerifyObjectEnabledDisabled HK_PB_CreateProfile_Page.btnCreateProfile(),"Disable","Create Profile button"
End Function
'[Verify delete Profile button is enabled]
Public Function verifyDeleteProfile_Enable()
	VerifyObjectEnabledDisabled HK_PB_CreateProfile_Page.btnDeleteProfile(),"Enable","Delete Profile button"
End Function
'[Verify delete Profile button is disabled]
Public Function verifyDeleteProfile_Disable()
	VerifyObjectEnabledDisabled HK_PB_CreateProfile_Page.btnDeleteProfile(),"Disable","Delete Profile button"
End Function
'[Verify Freeze/Unfreeze pin button is enabled]
Public Function verifyFreezeUnFreezePinButton_Enable()
	VerifyObjectEnabledDisabled HK_PB_CreateProfile_Page.btnFreezeUnfreezePin(),"Enable","Freeze/UnFreeze pin button"
End Function
'[Verify Freeze/Unfreeze pin button is disabled]
Public Function verifyFreezeUnFreezePinButton_Disable()
	VerifyObjectEnabledDisabled HK_PB_CreateProfile_Page.btnFreezeUnfreezePin(),"Disable","Freeze/UnFreeze pin button"
End Function
'[Verify Maintain Third Party Accounts button is enabled]
Public Function verifyMaintainThirdPartyAccountsButton_Enable()
	VerifyObjectEnabledDisabled HK_PB_CreateProfile_Page.btnMaintainThirdPartyAccounts(),"Enable","Maintain Third Party Accounts button"
End Function
'[Verify Maintain Third Party Accounts button is disabled]
Public Function verifyMaintainThirdPartyAccountsButton_Disable()
	VerifyObjectEnabledDisabled HK_PB_CreateProfile_Page.btnMaintainThirdPartyAccounts(),"Disable","Maintain Third Party Accounts button"
End Function
'[Verify Maintain Sub Accounts button is enabled]
Public Function verifyMaintainSubAccounts_Enable()
	VerifyObjectEnabledDisabled HK_PB_CreateProfile_Page.btnMaintainSubAccounts(),"Enable","Maintain Sub Accounts button"
End Function
'[Verify Maintain Sub Accounts button is disabled]
Public Function verifyMaintainSubAccounts_Disable()
	VerifyObjectEnabledDisabled HK_PB_CreateProfile_Page.btnMaintainSubAccounts(),"Disable","Maintain Sub Accounts button"
End Function
'[Verify Pin Reset button is enabled]
Public Function verifyPinReset_Enable()
	VerifyObjectEnabledDisabled HK_PB_CreateProfile_Page.btnPinReset(),"Enable","Pin Reset button"
End Function
'[Verify Pin Reset button is disabled]
Public Function verifyPinReset_Disable()
	VerifyObjectEnabledDisabled HK_PB_CreateProfile_Page.btnPinReset(),"Disable","Pin Reset button"
End Function
'[Verify Quick Menu Reset button is enabled]
Public Function verifyQuickMenuReset_Enable()
	verifyObjectEnabledDisabled HK_PB_CreateProfile_Page.btnQuickMenuReset(),"Enable","Quick Menu Reset button"
End Function
'[Verify Quick Menu Reset button is disabled]
Public Function verifyQuickMenuReset_Disable()
	VerifyObjectEnabledDisabled HK_PB_CreateProfile_Page.btnQuickMenuReset(),"Disable","Quick Menu Reset button"
End Function
'[Verify Submit button is enabled]
Public Function verifySubmit_Enable()
	VerifyObjectEnabledDisabled HK_PB_CreateProfile_Page.btnPBCreateSubmit(),"Enable","Submit button"
End Function
'[Verify Submit button is disabled]
Public Function verifySubmit_Disable()
	VerifyObjectEnabledDisabled HK_PB_CreateProfile_Page.btnPBCreateSubmit(),"Disable","Submit button"
End Function
'[Verify Cancel button is enabled]
Public Function verifyCancel_Enable()
	verifyObjectEnabledDisabled HK_PB_CreateProfile_Page.btnCancel(),"Enable","Cancel button"
End Function
'[Verify Cancel button is disabled]
Public Function verifyCancel_Disable()
	verifyObjectEnabledDisabled HK_PB_CreateProfile_Page.btnCancel(),"Disable","Cancel button"
End Function
'[Click on Create Profile Button]
Public Function clickCreateProfileButton()
	ClickOnObject HK_PB_CreateProfile_Page.btnCreateProfile(),"Create Profile Button"
End Function
'[Click on Maintain Third Party Accounts Button]
Public Function clickMaintainThirdPartyAccountsButton()
	ClickOnObject HK_PB_CreateProfile_Page.btnMaintainThirdPartyAccounts(),"Maintain Third Party Accounts Button"
End Function
'[Click on Maintain Sub Accounts Button]
Public Function clickMaintainSubAccountsButton()
	ClickOnObject HK_PB_CreateProfile_Page.btnMaintainSubAccounts(),"Maintain Sub Accounts Button"
End Function
'[Click on Pin Reset Button]
Public Function clickPinResetButton()
	ClickOnObject HK_PB_CreateProfile_Page.btnPinReset(),"Pin Reset Button"
	WaitForICallLoading
End Function
'[Click on Quick Menu Reset Button]
Public Function clickQuickMenuResetButton()
	ClickOnObject HK_PB_CreateProfile_Page.btnQuickMenuReset(),"Quick Menu Reset Button"
End Function
'[Click CIF Id Name in English hyperlink on Search Customer page]
Public Function viewCIFDetails(strlstCIFdetails)
	Dim blnviewCIFDetails:blnviewCIFDetails = True
	Set objBranchNavigation=gObjIServePage.WebElement("xpath:=//*[@id='navBarBranch_span']")
		
	If Not(objBranchNavigation.Exist(10)) Then
		blnviewCIFDetails=selectTableLink(HK_PB_CreateProfile_Page.tblHearder(),HK_PB_CreateProfile_Page.tblcontent(),strlstCIFdetails,"CIFSearch" ,"Name in English",false,NULL,NULL,NULL)
	Else
		Set tblHearderBrnch=gObjIServePage.WebElement("html id:=branchSearchRsltName_table_header")
		Set tblcontentBrnch=gObjIServePage.WebElement("xpath:=//*[@id='branchSearchRsltName_table_content']")
		blnviewCIFDetails=selectTableLink(tblHearderBrnch,tblcontentBrnch,strlstCIFdetails,"CIF Search","Name in English",false,NULL,NULL,NULL)
	End If
	WaitForICallLoading
	WaitForICallLoading
	viewCIFDetails=blnviewCIFDetails
End Function
'[Click Create Phone Banking Profile hyperlink on Pending SR page]
Public Function viewPendingSRDetails(strlstPendingSRDetails)
	Dim blnviewPendingSRDetails:blnviewPendingSRDetails = True
	blnviewPendingSRDetails=selectTableLink(HK_PB_CreateProfile_Page.tblPendingSRHeader(),HK_PB_CreateProfile_Page.tblPendingSRContent(),strlstPendingSRDetails,"Pending SR Search" ,"Type",true,HK_PB_CreateProfile_Page.lnkPendingSRNext(),HK_PB_CreateProfile_Page.lnkPendingSRNext1(),HK_PB_CreateProfile_Page.lnkPendingSRPrevious())
	WaitForICallLoading
	viewPendingSRDetails=blnviewPendingSRDetails
End Function
'[Click SR No hyperlink on SR page]
Public Function viewSRDetails(strlstSRDetails)
	Dim blnviewSRDetails:blnviewSRDetails = True
	blnviewSRDetails=selectTableLink(HK_PB_CreateProfile_Page.tblSRHeader(),HK_PB_CreateProfile_Page.tblSRContent(),strlstSRDetails,"Service Requests" ,"SR No.",true,HK_PB_CreateProfile_Page.lnkSRNext(),HK_PB_CreateProfile_Page.lnkSRNext1(),HK_PB_CreateProfile_Page.lnkSRPrevious())
	WaitForICallLoading
	viewSRDetails=blnviewSRDetails
End Function
'[Verify error message displayed for Telephonenumber field]
Public Function verifyErrorMessage_Telephone(strErrorMessage)
	bverifyErrorMessage_Telephone = true
	If Not IsNull(strErrorMessage) Then
		If Not VerifyInnerText (oIservePage.WebElement("lblsearchTelErr_span"), strErrorMessage, "Telephone Number")Then
			bverifyErrorMessage_Telephone = false
		End If
	End If
	verifyErrorMessage_Telephone = bverifyErrorMessage_Telephone
End Function

'[Verify txt CIFNo for Create Profile]
Public Function verifyCreateProfileCIFNoText(strCIFNoText)
	blnverifyCreateProfileCIFNoText=true
	If Not verifyInnerText_Pattern(HK_PB_CreateProfile_Page.weleCreateProfileCifValue(), strCIFNoText, "Create Profile CIFNo Text") Then
		blnverifyCreateProfileCIFNoText=false
	End If
	verifyCreateProfileCIFNoText=blnverifyCreateProfileCIFNoText
End Function
'[Verify txt Description for Create Profile]
Public Function verifyCreateDescriptionText(strDescriptionText)
	blnverifyCreateDescriptionText=true
	If Not verifyInnerText_Pattern(HK_PB_CreateProfile_Page.weleCPDescription(),strDescriptionText,"Create Profile Description Text") Then
		blnverifyCreateDescriptionText=false
	End If
	verifyCreateDescriptionText=blnverifyCreateDescriptionText
End Function

'[Set comments in delete profile comments box]
Public Function deleteprofile_setComments(strComments)
	bdeleteprofile_setComments=true
	oIservePage.WebEdit("txt_deleteprofile_comments").Set strComments
	If Err.Number<>0 Then
		bdeleteprofile_setComments=false
		LogMessage "WARN","Verification","Failed to set comments" ,false
	Else
		LogMessage "RSLT","Verification","set the comments as expected",True
		bdeleteprofile_setComments=true
	End If
	deleteprofile_setComments= bdeleteprofile_setComments
End function
'[Set comments in create profile comments box]
Public Function createprofile_setComments(strComments)
	blncreateprofile_setComments=true
	HK_PB_CreateProfile_Page.txtDeleteProfileComments().Set strComments
	If Err.Number<>0 Then
		blncreateprofile_setComments=false
		LogMessage "WARN","Verification","Failed to set comments" ,false
	Else
		LogMessage "RSLT","Verification","set the comments as expected",True
		blncreateprofile_setComments=true
	End If
	createprofile_setComments= blncreateprofile_setComments
End function
'[Click on Submit Button]
Public Function clickSubmitButton()
	blnclickSubmitButton=true
	HK_PB_CreateProfile_Page.btnPBCreateSubmit().Click
	'WaitForICallLoading
	If Err.Number<>0 Then
		blnclickSubmitButton=false
		LogMessage "WARN","Verification","Failed to Click Button :Submit" ,false
	Else
		LogMessage "RSLT","Verification","Clicked on Submit Button as expected.",True
		blnclickSubmitButton=true
	End If
	clickSubmitButton=blnclickSubmitButton
End Function
'[Click on Cancel Button]
Public Function clickCancelButton()
	blnclickCancelButton=true
	HK_PB_CreateProfile_Page.btnCancel().Click
	WaitForICallLoading
	If Err.Number<>0 Then
		blnclickCancelButton=false
		LogMessage "WARN","Verification","Failed to Click Button :Cancel" ,false
	Else
		LogMessage "RSLT","Verification","Clicked on Cancel Button as expected.",True
		blnclickCancelButton=true
	End If
	clickCancelButton=blnclickCancelButton
End Function
'[Click on Confirmation Yes Button]
Public Function clickConfirmationYesButton()
	blnclickConfirmationYesButton=true
	
	HK_PB_CreateProfile_Page.btnYes().Click
	WaitForICallLoading
	If Err.Number<>0 Then
		blnclickConfirmationYesButton=false
		LogMessage "WARN","Verification","Failed to Click Button :Confirmation - Yes" ,false
	Else
		LogMessage "RSLT","Verification","Clicked on Confirmation - Yes Button as expected.",True
		blnclickConfirmationYesButton=true
	End If
	clickConfirmationYesButton=blnclickConfirmationYesButton
End Function
'[Click on Confirmation No Button]
Public Function clickConfirmationNoButton()
	blnclickConfirmationNoButton=true
	
	HK_PB_CreateProfile_Page.btnNo().Click
	WaitForICallLoading
	If Err.Number<>0 Then
		blnclickConfirmationNoButton=false
		LogMessage "WARN","Verification","Failed to Click Button :Confirmation - No" ,false
	Else
		LogMessage "RSLT","Verification","Clicked on Confirmation - No Button as expected.",True
		blnclickConfirmationNoButton=true
	End If
	clickConfirmationNoButton=blnclickConfirmationNoButton
End Function
'[Click on Ok Button]
Public Function clickOkButton()
	blnclickOkButton=true
	HK_PB_CreateProfile_Page.btnOk().Click
	WaitForICallLoading
	If Err.Number<>0 Then
		blnclickOkButton=false
		LogMessage "WARN","Verification","Failed to Click Button :Ok" ,false
	Else
		LogMessage "RSLT","Verification","Clicked on Confirmation - Ok Button as expected.",True
		blnclickOkButton=true
	End If
	clickOkButton=blnclickOkButton
End Function
'[Click on Approve Button]
Public Function clickApproveButton()
	blnclickApproveButton=true
	HK_PB_CreateProfile_Page.btnApprove().Click
	WaitForICallLoading
	If Err.Number<>0 Then
		blnclickApproveButton=false
		LogMessage "WARN","Verification","Failed to Click Button :Approve" ,false
	Else
		LogMessage "RSLT","Verification","Clicked on Confirmation - Approve Button as expected.",True
		blnclickApproveButton=true
	End If
	clickApproveButton=blnclickApproveButton
End Function
'[Click on Reject Button]
Public Function clickRejectButton()
	blnclickRejectButton=true
	
	HK_PB_CreateProfile_Page.btnReject().Click
	WaitForICallLoading
	If Err.Number<>0 Then
		blnclickRejectButton=false
		LogMessage "WARN","Verification","Failed to Click Button :Reject" ,false
	Else
		LogMessage "RSLT","Verification","Clicked on Confirmation - Reject Button as expected.",True
		blnclickRejectButton=true
	End If
	clickRejectButton=blnclickRejectButton
End Function
'[Click on Close Button]
Public Function clickCloseButton()
	blnclickCloseButton=true
	HK_PB_CreateProfile_Page.btnClose().Click
	WaitForICallLoading
	If Err.Number<>0 Then
		blnclickCloseButton=false
		LogMessage "WARN","Verification","Failed to Click Button :Close" ,false
	Else
		LogMessage "RSLT","Verification","Clicked on Confirmation - Close Button as expected.",True
		blnclickCloseButton=true
	End If
	clickCloseButton=blnclickCloseButton
End Function
'[Click on Rejected Close Button]
Public Function clickRejectedCloseButton()
	blnclickRejectedCloseButton=true
	HK_PB_CreateProfile_Page.btnRejectClose().Click
	WaitForICallLoading
	If Err.Number<>0 Then
		blnclickRejectedCloseButton=false
		LogMessage "WARN","Verification","Failed to Click Button :Close" ,false
	Else
		LogMessage "RSLT","Verification","Clicked on Confirmation - Close Button as expected.",True
		blnclickCloseButton=true
	End If
	clickRejectedCloseButton=blnclickRejectedCloseButton
End Function
'[Click on Approved Close Button]
Public Function clickApprovedCloseButton()
	blnclickApprovedCloseButton=true
	HK_PB_CreateProfile_Page.btnApprovedClose().Click
	WaitForICallLoading
	If Err.Number<>0 Then
		blnclickApprovedCloseButton=false
		LogMessage "WARN","Verification","Failed to Click Button :Close" ,false
	Else
		LogMessage "RSLT","Verification","Clicked on Confirmation - Close Button as expected.",True
		blnclickApprovedCloseButton=true
	End If
	clickApprovedCloseButton=blnclickApprovedCloseButton
End Function
'[Verify Confirmation message is displayed Upon PBS Request Creation]
Public Function verifyConfirmationMessage_CreatePBS()
	blnverifyConfirmationMessage_CreatePBS = true
	If Not IsNull(strErrorMessage) Then
		If Not VerifyInnerText (HK_PB_CreateProfile_Page.welestpTMApproveCntspan(),"This SR will be routed to Team Manager for following reason(s): Request for Create PBS.", "Confirmation  message Create PBS") Then
			blnverifyConfirmationMessage_CreatePBS = false
		End If
	End If
	verifyConfirmationMessage_CreatePBS = blnverifyConfirmationMessage_CreatePBS
End Function
'[Set comments in Approver or Rejected comments box]
Public Function Approver_setComments(strComments)
	blnApprover_setComments=true
	HK_PB_CreateProfile_Page.txtApprovalComments().Set strComments
	If Err.Number<>0 Then
		blnApprover_setComments=false
		LogMessage "WARN","Verification","Failed to set comments" ,false
	Else
		LogMessage "RSLT","Verification","set the comments as expected",True
		blnApprover_setComments=true
	End If
	Approver_setComments= blnApprover_setComments
End function
'[Verify Phone banking Pending Approval SR details section]
Public Function verifyPBPendingApprovalSRDetailsSection(strSRType,strSRSubType,strIDNumber,strCreatedby,strAdditonalSRInfo)
	blnverifyPBPendingApprovalSRDetailsSection=True
	If strSRType <>"" Then
			If Not verifyInnerText_Pattern(HK_PB_CreateProfile_Page.weleSRType(), strSRType, "SR Type") Then
				blnverifyPBPendingApprovalSRDetailsSection=False
			End If
	End If
	If strSRSubType <>"" Then
			If Not verifyInnerText_Pattern(HK_PB_CreateProfile_Page.weleSRSubType(), strSRSubType, "SR Sub Type") Then
				blnverifyPBPendingApprovalSRDetailsSection=False
			End If
	End If	
	If strIDNumber <>"" Then
			If Not verifyInnerText_Pattern(HK_PB_CreateProfile_Page.weleIDNumber(), strIDNumber, "ID Number") Then
				blnverifyPBPendingApprovalSRDetailsSection=False
			End If
	End If	
	If strCreatedby <>"" Then
			If Not verifyInnerText_Pattern(HK_PB_CreateProfile_Page.weleCreatedBy(), UCASE(strCreatedby), "Created By") Then
				blnverifyPBPendingApprovalSRDetailsSection=False
			End If
	End If	
	If strAdditonalSRInfo <>"" Then
			If Not verifyInnerText_Pattern(HK_PB_CreateProfile_Page.weleAdditionalSRInfo(),strAdditonalSRInfo, "Additional SR Info") Then
				blnverifyPBPendingApprovalSRDetailsSection=False
			End If
	End If	
	verifyPBPendingApprovalSRDetailsSection=blnverifyPBPendingApprovalSRDetailsSection
End Function
'[Verify Phone banking View SR details section]
Public Function verifyPBViewSRDetailsSection(strRelatedTo,strSRType,strSRSubType,strStatus,strSubStatus,strRequestExecuted,strFollowUpReq)
	blnverifyPBViewSRDetailsSection=True

	
	If strRelatedTo <>"" Then
			If Not verifyInnerText_Pattern(HK_PB_CreateProfile_Page.weleViewSRRelatedTo(), strRelatedTo, "Related To") Then
				blnverifyPBViewSRDetailsSection=False
			End If
	End If
	
	If strSRType <>"" Then
			If Not verifyInnerText_Pattern(HK_PB_CreateProfile_Page.weleViewsRSRType(), strSRType, "SR Type") Then
				blnverifyPBViewSRDetailsSection=False
			End If
	End If
	If strSRSubType <>"" Then
			If Not verifyInnerText_Pattern(HK_PB_CreateProfile_Page.weleViewsRSRSubType(), strSRSubType, "SR Sub Type") Then
				blnverifyPBViewSRDetailsSection=False
			End If
	End If	
	If strStatus <>"" Then
			If Not verifyInnerText_Pattern(HK_PB_CreateProfile_Page.weleViewsRSRStatus(), strStatus, "Status") Then
				blnverifyPBViewSRDetailsSection=False
			End If
	End If
	
	If strSubStatus <>"" Then
			If Not verifyInnerText_Pattern(HK_PB_CreateProfile_Page.weleViewsRSRSubStatus(), strSubStatus, "Sub Status") Then
				blnverifyPBViewSRDetailsSection=False
			End If
	End If

	If strRequestExecuted <>"" Then
			If Not verifyInnerText_Pattern(HK_PB_CreateProfile_Page.weleViewSrReqExecuted(), strRequestExecuted, "Request Executed") Then
				blnverifyPBViewSRDetailsSection=False
			End If
	End If

	If strFollowUpReq <>"" Then
			If Not verifyInnerText_Pattern(HK_PB_CreateProfile_Page.weleViewsRSRFollowRequired(), strFollowUpReq, "Follow Up Requred") Then
				blnverifyPBViewSRDetailsSection=False
			End If
	End If	
	
	
	verifyPBViewSRDetailsSection=blnverifyPBViewSRDetailsSection
End Function
'[Verify Phone banking details section]
Public Function verifyPhoneBankingDetailsSection(strCIFNo,strACType,strPhoneBankingNumber,strBranchCode,strPINStatus,strOpenDate,strLastMainDate,strPINError,strPINGenrated,strPINGendate,strLastTranDate,strFax)
	
	blnverifyPhoneBankingDetailsSection=True
	

	If strCIFNo <>"" Then
			If Not verifyInnerText_Pattern(HK_PB_CreateProfile_Page.weleCIFNo(), strCIFNo, "CIF No") Then
				blnverifyPhoneBankingDetailsSection=False
			End If
	End If	
	

	If strACType <>"" Then
			If Not verifyInnerText_Pattern(HK_PB_CreateProfile_Page.weleAccountType(), strACType, "Account Type") Then
				blnverifyPhoneBankingDetailsSection=False
			End If
	End If
	

	If strPhoneBankingNumber <>"" Then
			If Not verifyInnerText_Pattern(HK_PB_CreateProfile_Page.welePhoneBankingNumber(), strPhoneBankingNumber, "Phone Banking Number") Then
				blnverifyPhoneBankingDetailsSection=False
			End If
	End If
	

	If strBranchCode <>"" Then
			If Not verifyInnerText_Pattern(HK_PB_CreateProfile_Page.weleBranchCode(), strBranchCode, "Branch Code") Then
				blnverifyPhoneBankingDetailsSection=False
			End If
	End If
	

	If strPINStatus <>"" Then
			If Not verifyInnerText_Pattern(HK_PB_CreateProfile_Page.welePINStatus(), strPINStatus, "PIN Status") Then
				blnverifyPhoneBankingDetailsSection=False
			End If
	End If
	

	If strOpenDate <>"" Then
			If Not verifyInnerText_Pattern(HK_PB_CreateProfile_Page.weleOpenDate(), strOpenDate, "Open Date") Then
				blnverifyPhoneBankingDetailsSection=False
			End If
	End If
	

	If strLastMainDate <> "" Then
			If Not verifyInnerText_Pattern(HK_PB_CreateProfile_Page.weleLastMaintanaceDate(), strLastMainDate,"Last Maintenance Date") Then
				blnverifyPhoneBankingDetailsSection=False
			End If
	End If
	

	If strPINError <> "" Then
			If Not verifyInnerText_Pattern(HK_PB_CreateProfile_Page.welePINError(), strPINError,"PIN Error") Then
				blnverifyPhoneBankingDetailsSection=False
			End If
	End If
	

	If strPINGenrated <> "" Then
			If Not verifyInnerText_Pattern(HK_PB_CreateProfile_Page.welePINGenerated(), strPINGenrated,"PIN Generated") Then
				blnverifyPhoneBankingDetailsSection=False
			End If
	End If
	

	If strPINGendate <> "" Then
			If Not verifyInnerText_Pattern(HK_PB_CreateProfile_Page.welePINGeneratedDate(),strPINGendate,"PIN Generation Date") Then
				blnverifyPhoneBankingDetailsSection=False
			End If
	End If


	If strLastTranDate <> "" Then
			If Not verifyInnerText_Pattern(HK_PB_CreateProfile_Page.weleLastTranDate(), strLastTranDate,"Last Transaction Date and Time") Then
				blnverifyPhoneBankingDetailsSection=False
			End If
	End If
	
	
	If strFax <> "" Then
			If Not verifyInnerText_Pattern(HK_PB_CreateProfile_Page.weleFax(), strFax,"Fax#") Then
				blnverifyPhoneBankingDetailsSection=False
			End If
	End If

	verifyPhoneBankingDetailsSection=blnverifyPhoneBankingDetailsSection

End Function
'[Verify cancel confirmation message]
Public Function verifyCancelConfirmationMessage()

blnverifyCancelConfirmationMessage=true
	
	If HK_PB_CreateProfile_Page.welestpCancelCntspan().Exist(20) Then
	
		LogMessage "RSLT","Verification","Cancel Cinfirmation is displayed as expected",True
		blnverifyCancelConfirmationMessage=true

	Else

		blnverifyCancelConfirmationMessage=false
		LogMessage "WARN","Verification","Failed to display cancel confirmation" ,false
		
	End If
	verifyCancelConfirmationMessage = blnverifyCancelConfirmationMessage	
End Function
'[Verify and Close Phonebanking Tab]
Public Function verifyAndClosePBTab()
	
	verifyCrossMarkAndCloseTab "Phone Banking",true
	
End Function
'[Verify Max Length of Create Profile Comments box]
Public Function verifyCreateProfileCommentsMaxLength()
	blnverifyCreateProfileCommentsMaxLength=true
	blnverifyCreateProfileCommentsMaxLength= VerifyMaxLength (HK_PB_CreateProfile_Page.txtDeleteProfileComments(),"1351","Create Profile comments box")
	verifyCreateProfileCommentsMaxLength=blnverifyCreateProfileCommentsMaxLength
End Function
'[Verify Max Length of Approve or Reject Profile Comments box]
Public Function verifyCreateProfileApprRejeCommentsMaxLength()

	VerifyMaxLength HK_PB_CreateProfile_Page.txtApprovalComments(),"1441","Approver/Rejected comments box"
	
End Function
'[Verify Max Length of Approve Comments box]
Public Function verifyCreateProfileApprCommentsMaxLength(intMaxLength)

	VerifyMaxLength HK_PB_CreateProfile_Page.txtApprovalComments(),intMaxLength,"Approver comments box"
	
End Function
'[Verify Max Length of Reject Comments box]
Public Function verifyCreateProfileRejCommentsMaxLength(intMaxLength)

	VerifyMaxLength HK_PB_CreateProfile_Page.txtApprovalComments(),intMaxLength,"Rejected comments box"
	
End Function
'[Verify row Data in Table for Sub Accounts Tagged for Phone Banking without pagination]
Public Function verifytblSelectedContent_SubAccotsPB(arrSubAccountsRowDataList)

   verifytblSelectedContent_SubAccotsPB=verifyTableContentList(HK_PB_CreateProfile_Page.tblSubAcctListHearder(),HK_PB_CreateProfile_Page.tblSubAcctListContent(),arrSubAccountsRowDataList,"Sub Accounts Tagged for Phone Banking",false,NULL,NULL,NULL)
End Function
'[Close Phone banking Tab]
Public Function closePhoneBankingTab()
	
	bclosePhoneBankingTab= verifyCrossMarkAndCloseTab("Phone Banking",True)
End Function
'[Click on Step Details in View SR page]
Public Function clickStepDetails()
	blnclickStepDetails=true
	HK_PB_CreateProfile_Page.lnkStepDetails().Click
	WaitForICallLoading
	If Err.Number<>0 Then
		blnclickStepDetails=false
		LogMessage "WARN","Verification","Failed to Click Tab :Step Details" ,false
	Else
		LogMessage "RSLT","Verification","Clicked on Step Details Tab as expected.",True
		blnclickStepDetails=true
	End If
	clickStepDetails=blnclickStepDetails
End Function
'[Verify row Data in Table for Step Details in View SR Page]
Public Function verifytblSelectedContent_SubAccotsPB(arrStepDetailsRowDataList)

   verifytblSelectedContent_SubAccotsPB=verifyTableContentList(HK_PB_CreateProfile_Page.tblStepDetailsHearder(),HK_PB_CreateProfile_Page.tblStepDetailsContent(),arrStepDetailsRowDataList,"Step Details",false,NULL,NULL,NULL)
End Function
