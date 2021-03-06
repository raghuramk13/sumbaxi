'[Verify tab exists]
Public Function VerifyTab(strTabName)
  VerifyTab = VerifyTabExist(Trim(strTabName))
End Function

'[Verify list of tabs exist under Dashboard]
Public Function VerifyTablist(lstTabNames)
  VerifyTablist = VerifyListOfTabs(lstTabNames)
End Function

'[Click on Back to Dashboard Page]
Public Function clickBacktoHomePage()
	If coDashboard_Page.eleIServeLogo.Exist(1) Then
		coDashboard_Page.eleIServeLogo.click
		If Err.Number <> 0 Then
			clickBacktoHomePage = False
			LogMessage "WARN","Verification","Failed to Click IServe Logo for going back to Dashboard Page." ,False
			Exit Function
		End If
		WaitForIServeLoading
		clickBacktoHomePage = True
	End If
End Function

'[Verify Tab Close]
Public Function VerifyTabClose_IA(StrTabName)
  VerifyTabClose_IA = TabClose(StrTabName)
End Function

'[Verify all tab Close except Dashboard or Overview]
Public Function VerifyCloseAllTab_IA()
  VerifyCloseAllTab_IA = CloseAlltabs()
End Function

'[Verify fields displayed in grey panel section]
Public Function VerifyGreyPanelDetails(arrLblValPairs,strProductType)
VerifyGreyPanelDetails = VerifyIDLabelValuePairsRandom(coOverview_Page.lblAccOverviewHeader,arrLblValPairs,strProductType,"Account overview - Grey Panel")
End Function 

'[Verify fields displayed in Additional Card Info section]
Public Function VerifyAdditionalCardInfo(arrLblValPairs,strProductType)
If Not IsNull (arrLblValPairs) Then	
   bverifyfieldvalues = VerifyIDLabelValuePairs(coOverview_Page.lblAccordionAddInfo,arrLblValPairs,strProductType,"Additional Card Info")
   VerifyAdditionalCardInfo = bverifyfieldvalues
Else
  VerifyAdditionalCardInfo = True
End If
End Function 

'[Verify links displayed below Action section]
Public Function VerifyLinks_PO(arrLblValPairs,strProductType)
bverifyLinks = VerifyActionLinks(arrLblValPairs,strProductType,coOverview_Page.lblActionLinks)
VerifyLinks_PO = bverifyLinks
End Function 

'[Click link displayed below Action section]
Public Function ClickLink_PO(strLinkName,strProductType)
bverifyLinks = ClickActionLinks(strLinkName,strProductType,coOverview_Page.lblActionLinks)
ClickLink_PO = bverifyLinks
End Function 

'[Click On link Open or Closed displayed in Product list table]
Public Function ClicklinkOpenClose_CO(strProduct,strAccountType)
	bClickOpenClose = True
	If Not IsNull (strAccountType) Then	
	   If Not IsNull (strProduct) Then
		    Select Case strProduct
				Case "Deposits"	
					Set OpenLink = coOverview_Page.lnkOpenDP
					Set CloseLink = coOverview_Page.lnkClosedDP
				Case "Credit Cards"	
					Set OpenLink = coOverview_Page.lnkOpenCC
					Set CloseLink = coOverview_Page.lnkClosedCC
				Case "Cashline"
					Set OpenLink = coOverview_Page.lnkOpenCL
					Set CloseLink = coOverview_Page.lnkClosedCL
				Case "Loans"
					Set OpenLink = coOverview_Page.lnkOpenLoan
					Set CloseLink = coOverview_Page.lnkClosedLoan
				Case "Debit/ATM Cards"
					Set OpenLink = coOverview_Page.lnkOpenDebit
					Set CloseLink = coOverview_Page.lnkClosedDebit
			End Select
		End If	
		
		If Ucase(Trim(strAccountType)) = "OPEN" Then
			OpenLink.Click
			If Err.Number <> 0 Then
				bClickOpenClose = False
				LogMessage "WARN","Verification","Failed to Click Open Link displayed for the selected product." ,False
				Exit Function
			End If
		ElseIf Ucase(Trim(strAccountType)) = "CLOSED" Then
			CloseLink.Click
			If Err.Number <> 0 Then
				bClickOpenClose = False
				LogMessage "WARN","Verification","Failed to Click Open Link displayed for the selected product." ,False
				Exit Function
			End If
		End If
	End IF
	WaitForIServeLoading
	ClicklinkOpenClose_CO = bClickOpenClose
	Set OpenLink = Nothing
	Set CloseLink = Nothing
End Function

'[Click on Cancel Button in page displayed]
Public Function clickCancelButton_Common()
scrollPageDown 2
coCommon_Page.btnCancel.click 
If Err.Number <> 0 Then
  clickCancelButton_Common = False
  LogMessage "WARN","Verification","Failed to Click Button: Cancel", False
  Exit Function
End If
WaitForIServeLoading
clickCancelButton_Common = True
End Function

'[Verify Cancel Confirmation message displayed]
Public Function VerifyCancelMessage_Common(strCancelMsg)
bVerifyCancelMessage = False
If Not IsNull(strCancelMsg) Then
   If verifyInnerText(coCommon_Page.lblCancelMsg(),strCancelMsg,"Cancel Message") Then
	  bVerifyCancelMessage = True
   End If
End If
VerifyCancelMessage_Common = bVerifyCancelMessage
End Function

'[Click Yes Or No Button in cancel Message displayed]
Public Function SelectButtonCancel_Common(strSelect)
bClickButton = True

If Not IsNull(strSelect) Then
	If strSelect = "YES" Then
	 coCommon_Page.btnYes.click
	ElseIf strSelect = "NO" Then
	 coCommon_Page.btnNO.click
	End If 	
	
	If Err.Number<>0 Then
	   LogMessage "WARN","Verification","Failed to Click Button" &strSelect, False
	   bClickButton = False
	End If	
End If 
SelectButtonCancel_Common = bClickButton
End Function

'[Click on Submit Button in page displayed]
Public Function clickSubmitButton_Common()

coCommon_Page.btnSubmit.click 
If Err.Number <> 0 Then
  clickSubmitButton_Common = False
  LogMessage "WARN","Verification","Failed to Click Button: Submit", False
  Exit Function
End If
WaitForIServeLoading
clickSubmitButton_Common = True
End Function

'[Verify list of Accordions displayed for Accounts selected from customer overview]
Public Function VerifyPanellist(lstAccordion)
	VerifyPanellist = VerifyAccordionHeader(coOverview_Page.ObjAccordionGroup,lstAccordion)
End Function

'[Expand Accordion using Refresh Icon]
Public Function ClickRefreshIcon(strAccordion)
	If Not IsNULL(strAccordion) Then
		ClickRefreshIcon = VerifyAccordionRefresh(coOverview_Page.ObjAccordionGroup,strAccordion)
	Else 
		ClickRefreshIcon = True 
	End If
End Function

'[Click Expand or Collapse icon for Accordion displayed]
Public Function ClickExpandCollapseIcon(strAccordion)
	If Not IsNULL(strAccordion) Then
		ClickExpandCollapseIcon = ClickExpandIcon(coOverview_Page.ObjAccordionGroup,strAccordion)
	Else 
		ClickExpandCollapseIcon = True 
	End If
End Function

'[Click Multiple Accordion to Expand or Collapse in page displayed]
Public Function ClickMultipleExpandCollapseIcon(lstAccordion)
	If Not IsNull(lstAccordion) Then	
		 ClickMultipleExpandCollapseIcon = ClickMultipleAccordions(coOverview_Page.ObjAccordionGroup,lstAccordion)	
	Else 
		ClickMultipleExpandCollapseIcon = True 
	End If
End Function

'[Verify Customer High Risk Verified]
Public Function CustomerVerificationHighRisk(iNoOfIdentQues,strExpStatus)
	bverifyCustomer = False
	
 	bverifytab = VerifyTabExist("VERIFICATION")
 	
 	If NOT bverifytab Then
  	   coVerifyCustomer_Page.btnNOTVerified.Click		 	
  	   WaitForIServeLoading
 	End If
 	
 	selectIdentificationQuestions coVerifyCustomer_Page.PageVerification,iNoOfIdentQues 	
 	selectAuthenticationQuestions()
 	setCustomQuestion()
 	
 	coVerifyCustomer_Page.btnVerifyCustomer.Click	
 	WaitForIServeLoading
 	
 	strStatus = coVerifyCustomer_Page.btnNOTVerified.GetROProperty("innertext")
 	
	If Ucase(Trim(strStatus)) = Ucase(Trim(strExpStatus))Then 
		LogMessage "RSLT","Verification","Verification Status is matching with expected value. Actual: "&strStatus&", Expected: "&strExpStatus, True
		bverifyCustomer = True
	Else
		LogMessage "WARN","Verification","Verification Status is not matching with expected value. Actual: "&strStatus&", Expected: "&strExpStatus, False
		bverifyCustomer = False    
	End IF
	
	CustomerVerificationHighRisk = bverifyCustomer
 End Function
 
'[Verify Customer Low Risk Verified]
Public Function CustomerVerificationLowRisk(iNoOfIdentQues,strExpStatus)
 	bverifyCustomer = False
 	
 	bverifytab = VerifyTabExist("VERIFICATION") 
 	
 	If NOT bverifytab Then
  	   coVerifyCustomer_Page.btnNOTVerified.Click		 	
  	   WaitForIServeLoading
 	End If
 	
 	selectIdentificationQuestions coVerifyCustomer_Page.PageVerification,iNoOfIdentQues 	
 	setCustomQuestion()
 	
 	coVerifyCustomer_Page.btnVerifyCustomer.Click
 	WaitForIServeLoading
 	
 	strStatus = coVerifyCustomer_Page.btnNOTVerified.GetROProperty("innertext")
 	
	If Ucase(Trim(strStatus)) = Ucase(Trim(strExpStatus))Then 
		LogMessage "RSLT","Verification","Verification Status is matching with expected value. Actual: "& strStatus&", Expected: "&strExpStatus, True
		bverifyCustomer = True
	Else
		LogMessage "WARN","Verification","Verification Status is not matching with expected value. Actual: "& strStatus&", Expected: "&strExpStatus, False
		bverifyCustomer = False    
	End IF
	
	CustomerVerificationLowRisk = bverifyCustomer
 End Function
 
'[Verify Validation message displayed]
Public Function VerifyPreValidationMsg(strValidationMessage)
bVerifyValidationMessage = True

If Not IsNull(strValidationMessage) Then	
   strLbl = coCommon_Page.lblValidationLabel.getROProperty("innertext")
   strMsg = coCommon_Page.lblValidationMsg.getROProperty("innertext")
	
   IF Trim(strLbl) = "Validation Message" AND Trim(strMsg) = Trim(strValidationMessage) Then
   	  bVerifyValidationMessage = True
   	  LogMessage "RSLT","Verification","Validation Message displayed as expected. Actual:"&strMsg&", Expected:"&strValidationMessage, True
   Else
   	  bVerifyValidationMessage = False
   	  LogMessage "WARN","Verification","Validation Message displayed as expected. Actual:"&strMsg&", Expected:"&strValidationMessage, False
   End IF 
   coCommon_Page.btnOK.Click
End If

VerifyPreValidationMsg = bVerifyValidationMessage
End Function

'[Verify verification required message displayed]
Public Function VerifyVerificatoinMsg(strValidationMessage)
bVerifyVerificationMessage = True

If Not IsNull(strValidationMessage) Then	
   strLbl = coCommon_Page.lblVerificationLabel.getROProperty("innertext")
   strMsg = coCommon_Page.lblVerificationMsg.getROProperty("innertext")
	
   IF Trim(strLbl) = "Verification Required" AND Trim(strMsg) = Trim(strValidationMessage) Then
   	  bVerifyVerificationMessage = True
   	  LogMessage "RSLT","Verification","Verification Message displayed as expected. Actual:"&strMsg&", Expected:"&strValidationMessage, True
   Else
   	  bVerifyVerificationMessage = False
   	  LogMessage "WARN","Verification","Verification Message displayed as expected. Actual:"&strMsg&", Expected:"&strValidationMessage, False
   End IF 
   coCommon_Page.btnOK_VerificationPanel.Click
End If

VerifyVerificatoinMsg = bVerifyVerificationMessage
End Function

'[Verify fields displayed in STP Page]
Public Function Verifyfieldsdisplay_Common(arrLblValPairs,strProductType)
Verifyfieldsdisplay_Common = VerifyIDLabelValuePairsRandom(coCommon_Page.lblfields,arrLblValPairs,strActionMenu,"Field verification")
End Function 

'[Verify Knowledge Base link displayed]
Public Function VerifyKBlinkDisplay_Common()
Dim bVerifyKnowledgebaselink:bVerifyKnowledgebaselink = True 
bDisabled = matchStr(coCommon_Page.lnkKnowledgeBase.GetROProperty("class"),"disabled")

If NOT bDisabled AND Trim(coCommon_Page.lnkKnowledgeBase.getROProperty("innertext")) = "Knowledge Base" Then
	LogMessage "RSLT","Verification","Knowledge base Link present and displayed in Enabled state", True
Else
	LogMessage "WARN","Verification","Knowledge base Link not present or not displayed in Enabled state", False
	bVerifyKnowledgebaselink=false
End If
VerifyKBlinkDisplay_Common = bVerifyKnowledgebaselink
End Function

'[Enter Comments in textbox field displayed]
Public Function SetCommentEditbox_Common(strComment)
   coCommon_Page.txtComment.Set strComment
   WaitForIServeLoading
   
   If Err.Number<>0 Then
       SetCommentEditbox_Common = False
       LogMessage "WARN","Verification","Failed to Set Edit Box : Comments" , False
       Exit Function
   End If
   
   SetCommentEditbox_Common = True
End Function

'[Verify Submission popup Message displayed]
Public Function VerifytblSubmissionPopup(lstStatusBlock)
VerifytblSubmissionPopup = VerifyTableSingleRowData(coCancelCard_Page.tblStatusBlockCardHeader,coCancelCard_Page.tblStatusBlockCardContent,lstStatusBlock,"Status Block (Cards)")
If coCommon_Page.btnOK.Exist Then 
   coCommon_Page.btnOK.Click
	If Err.Number <> 0 Then
		LogMessage "WARN","Verification","Unable to Click On OK Button in submission popup", False
		VerifytblSubmissionPopup = False
	End If
End IF
End Function

'[Verify TM Submission popup Message displayed]
Public Function VerifyTMSubmissionPopup(strExpMessage)
strActMessage = Trim(coCommon_Page.lblTMMsg.getROProperty("outertext"))

If Trim (strExpMessage) = Trim(strActMessage) Then
   LogMessage "RSLT","Verification","TM Submission text message displayed as expected"&strActMessage,True
   VerifyTMSubmissionPopup = True
Else
   LogMessage "WARN","Verification","TM Submission text message not displayed as expected, Expected:" &strExpMessage& "Actual:" &strActMessage,False
End IF

If coCommon_Page.btnOK.Exist Then 
   coCommon_Page.btnOK.Click
	If Err.Number <> 0 Then
		LogMessage "WARN","Verification","Unable to Click On OK Button in submission popup", False
		VerifyTMSubmissionPopup = False
	End If
End IF

End Function

'[Verify Request Submission popup Message displayed]
Public Function VerifySubmissionMsg(StrMessage)
bVerifyMsg = False	
If Not IsNull(StrMessage) Then
	If verifyInnerText(coCommon_Page.lblSubmissionMsg(),StrMessage,"Submission Text Message") Then
		bVerifyMsg = True
	End If
End If

If coCommon_Page.btnOK.Exist(0) Then
   coCommon_Page.btnOK.Click
   If Err.Number <> 0 Then
   		LogMessage "WARN","Verification","Unable to Click On OK Button in submission popup", False
		bVerifyMsg = False	
	End If
End If
VerifySubmissionMsg = bVerifyMsg
End Function

'[Click on scroll down button in page displayed]
Public Function clickScrollDown_Common(intNoofTimes)
scrollPageDown intNoofTimes
If Err.Number <> 0 Then
  clickScrollDown_Common = False
  LogMessage "WARN","Verification","Failed to Click Scroll Down Arrow", False
  Exit Function
End If
clickScrollDown_Common = True
End Function
