'[Verify Fund Transfer Button not exist]
Public Function VerifyFundTransferButtonNotExist(strAccountType)
	bFundTransferBtn = False
	If Not VerifyFieldExistenceInPage(HK_CCTR_FundFXTransfer_Page.btnFundTransfer(),"Balance & Limits Page","Fund Transfer Button") Then
		LogMessage "RSLT","Verification","As expected Fund Transfer Button not exist for : "&strAccountType,True
		bFundTransferBtn = True
	Else
		LogMessage "WARN","Verification","Failed, Fund Transfer Button is exist for : "&strAccountType,False 
	End If
	VerifyFundTransferButtonNotExist = bFundTransferBtn
End Function

'[Navigate to Fund Transfer page]
Public Function NavigateToFundTransferPage()
	bNavigateToFundTransferPage = False
	VerifyFieldExistenceInPage HK_CCTR_FundFXTransfer_Page.btnFundTransfer(),"Balance & Limits Page","Fund Transfer Button"
	ClickOnObject HK_CCTR_FundFXTransfer_Page.btnFundTransfer(),"Fund Transfer button in Balance & Limits Page"
	WaitForICallLoading
	If VerifyFieldExistenceInPage(HK_CCTR_FundFXTransfer_Page.eleFundTransferType(),"Fund Transfer Page","Fund Transfer Type Combo") Then
		LogMessage "RSLT","Verification","As expected On clicking Fund Transfer Button ,Fund Transfer page displayed.",True
		bNavigateToFundTransferPage = True
	Else
		LogMessage "WARN","Verification","Failed to display Fund Transfer page on clicking Fund Transfer Button",False 
	End If
	bNavigateToFundTransferPage = VerifyFieldExistenceInPage(HK_CCTR_FundFXTransfer_Page.eleFundTransferTypelbl(),"Fund Transfer Page","Fund Transfer Type Label")
	NavigateToFundTransferPage = bNavigateToFundTransferPage
End Function

'[Verify Fund Transfer Type combo Dropdown values]
Public Function VerifyFundTransferTypeComboValues(strDefaultValue,strlstFundTransTypes)
	bVerifyFundTransferTypeComboValues = False
	strActDefaultVal = Trim(HK_CCTR_FundFXTransfer_Page.txtFundTransferType().GetROProperty("placeholder"))
	If  strActDefaultVal = strDefaultValue Then
		LogMessage "RSLT","Verification","As expected Default value in Fund Transfer Type Dropdown is :"& strDefaultValue,True
		bVerifyFundTransferTypeComboValues = True
	Else
		LogMessage "WARN","Verification","Failed to display Correct Default value in Fund Transfer Type Dropdown, Expected :" & strDefaultValue & ", Actual: "&strActDefaultVal,False
	End If
	bVerifyFundTransferTypeComboValues = verifyComboboxItems(HK_CCTR_FundFXTransfer_Page.eleFundTransferType(),strlstFundTransTypes,"Fund Transfer Type Dropdown values")
	VerifyFundTransferTypeComboValues = bVerifyFundTransferTypeComboValues
End Function

'[Select Fund Transfer Type]
Public Function SelectFundTransferType(strFundTransType)
	bSelectFundTransferType = False
	bSelectFundTransferType = selectItem_Combobox(HK_CCTR_FundFXTransfer_Page.eleFundTransferType(),strFundTransType)
	WaitForICallLoading
	intMaxWait = 50
	For i = 1 To intMaxWait Step 1
		If Not HK_CCTR_FundFXTransfer_Page.eleSelectedDebitAccountlbl().WaitProperty("Visible",True) Then
			Wait(1)
		End If
		
		If HK_CCTR_FundFXTransfer_Page.eleSelectedDebitAccountlbl().WaitProperty("Visible",True) OR i > intMaxWait Then
			Exit For
		End If
		
	Next
	SelectFundTransferType = bSelectFundTransferType
End Function

'[Verify Left Panel on Fund Transfer Tab]
Public Function VerifyLeftPanelInFundTransTab(strDebitAccntDetls,strAvalBalDetls,strDebitAccntCurrencies)

	Environment.Value("DebitAccntCurrentBalance") = Trim(Replace(HK_CCTR_FundFXTransfer_Page.eleAvailableBalance().GetROProperty("innertext"),",",""))
	
	'strAvalBalDetls(0)(1) = Split(strAvalBalDetls(1),":")(0)&Environment.Value("DebitAccntCurrentBalance")
	
	bVerifyLeftPanelInFundTransTab = False
	
	bVerifyLeftPanelInFundTransTab = VerifyFieldExistenceInPage(HK_CCTR_FundFXTransfer_Page.eleSelectedDebitAccountlbl(),"Fund Transfer Page","Selected Debit Account Label")
	bVerifyLeftPanelInFundTransTab = VerifyFieldExistenceInPage(HK_CCTR_FundFXTransfer_Page.eleAccountAvailableBalancelbl(),"Fund Transfer Page","Account Available Balance Label")
	
	bVerifyLeftPanelInFundTransTab = verifyTableContentList(HK_CCTR_FundFXTransfer_Page.tblDebitAccntHeader(),HK_CCTR_FundFXTransfer_Page.tblDebitAccntContent(),strDebitAccntDetls,"Selected Debit Account",False,Null,Null,Null)
	'bVerifyLeftPanelInFundTransTab = verifyTableContentList(HK_CCTR_FundFXTransfer_Page.tblAvailableBalanceHeader(),HK_CCTR_FundFXTransfer_Page.tblAvailableBalanceContent(),strAvalBalDetls,"Account Available Balance" ,False,NULL,NULL,NULL)
	bVerifyLeftPanelInFundTransTab = verifyDropdownListValues(HK_CCTR_FundFXTransfer_Page.txtDebitAccntCurrency(),strDebitAccntCurrencies,"Debit Account Currency")
	
	VerifyLeftPanelInFundTransTab = bVerifyLeftPanelInFundTransTab
End Function

'[Verify Right Panel on Fund Transfer Tab]
Public Function VerifyRightPanelInFundTransTab(strCreditAccnts,strDescText)
	bVerifyRightPanelInFundTransTab = False
	
	bVerifyRightPanelInFundTransTab = VerifyFieldExistenceInPage(HK_CCTR_FundFXTransfer_Page.eleCreditAccountCardNolbl(),"Fund Transfer Page","Credit Account Card No Label")
	bVerifyRightPanelInFundTransTab = VerifyFieldExistenceInPage(HK_CCTR_FundFXTransfer_Page.eleCreditAccountCurrencylbl(),"Fund Transfer Page","Credit Account Currency Label")
	bVerifyRightPanelInFundTransTab = VerifyFieldExistenceInPage(HK_CCTR_FundFXTransfer_Page.eleTransferAmountlbl(),"Fund Transfer Page","Transfer Amount Label")
	bVerifyRightPanelInFundTransTab = VerifyFieldExistenceInPage(HK_CCTR_FundFXTransfer_Page.eleDescriptionlbl(),"Fund Transfer Page","Description Label")
	bVerifyRightPanelInFundTransTab = VerifyFieldExistenceInPage(HK_CCTR_FundFXTransfer_Page.eleCommentslbl(),"Fund Transfer Page","Comments Label")
	
	bVerifyRightPanelInFundTransTab = VerifyFieldExistenceInPage(HK_CCTR_FundFXTransfer_Page.eleCreditAccountCardNoDropDown(),"Fund Transfer Page","Credit Account Card No Drop Down")
	bVerifyRightPanelInFundTransTab = verifyDropdownListValues(HK_CCTR_FundFXTransfer_Page.txtCreditAccountCardNoDropDown(),strCreditAccnts,"Credit Account/Card No")
	
	bVerifyRightPanelInFundTransTab = VerifyFieldExistenceInPage(HK_CCTR_FundFXTransfer_Page.eleCreditAccountCurrencyDropDown(),"Fund Transfer Page","Credit Account Currency Drop Down")
	bVerifyRightPanelInFundTransTab = VerifyFieldExistenceInPage(HK_CCTR_FundFXTransfer_Page.txtTransferAmount(),"Fund Transfer Page","Transfer Amount Edit Box")
	
	bVerifyRightPanelInFundTransTab = VerifyFieldExistenceInPage(HK_CCTR_FundFXTransfer_Page.eleDescriptionText(),"Fund Transfer Page","Description Text")
	bVerifyRightPanelInFundTransTab = Trim(verifyInnerText_Pattern(HK_CCTR_FundFXTransfer_Page.eleDescriptionText(),strDescText , "Description Text"))
	
	bVerifyRightPanelInFundTransTab = VerifyFieldExistenceInPage(HK_CCTR_FundFXTransfer_Page.txtAreaComments(),"Fund Transfer Page","Comments Text Box")
	bVerifyRightPanelInFundTransTab = VerifyFieldExistenceInPage(HK_CCTR_FundFXTransfer_Page.lnkKnowledgeBase(),"Fund Transfer Page","Knowledge Base Hyperlink")
	
	VerifyRightPanelInFundTransTab = bVerifyRightPanelInFundTransTab
End Function

'[Select Credit Currency details for Fund Transfer]
Public Function SelectCreditCurrencyDetails(strCreditAccntNo,strCreditCurrency,strTransAmnt,strComnt)
	bSelectCreditCurrencyDetails = False
	bSelectCreditCurrencyDetails = selectItem_Combobox(HK_CCTR_FundFXTransfer_Page.eleCreditAccountCardNoDropDown(),strCreditAccntNo)
	bSelectCreditCurrencyDetails = selectItem_Combobox(HK_CCTR_FundFXTransfer_Page.eleCreditAccountCurrencyDropDown(),strCreditCurrency)
	bSelectCreditCurrencyDetails = SetValue(HK_CCTR_FundFXTransfer_Page.txtTransferAmount(),strTransAmnt,"Transfer Amount")
	bSelectCreditCurrencyDetails = SetValue(HK_CCTR_FundFXTransfer_Page.txtAreaComments(),strComnt,"Transfer Comment")
	bSelectCreditCurrencyDetails = ClickOnObject(HK_CCTR_FundFXTransfer_Page.btnNextFundTransfer(),"Next Button")
	WaitForICallLoading
	SelectCreditCurrencyDetails = bSelectCreditCurrencyDetails
End Function

'[Verify Transaction confirmation page debit values]
Public Function VerifyTransactionConfirmationDebitPageValues(strTransferTypeLbl,strDebitAccntDetls,strAvalBalDetls,strTransferType)
	bVerifyTransactionConfirmationPageValues = False
	
	bVerifyTransactionConfirmationPageValues = VerifyFieldExistenceInPage(HK_CCTR_FundFXTransfer_Page.eleConfPageFundTransTypelbl(),"Fund Transfer Page","Transfer Confirmation - Fund Transfer Type Label")
	bVerifyTransactionConfirmationPageValues = Trim(verifyInnerText_Pattern(HK_CCTR_FundFXTransfer_Page.eleConfPageFundTransTypelbl(),strTransferTypeLbl , "Transfer Confirmation - Fund Transfer Type Label"))
	
	bVerifyTransactionConfirmationPageValues = VerifyFieldExistenceInPage(HK_CCTR_FundFXTransfer_Page.eleConfPageFundTransTypeVal(),"Fund Transfer Page","Transfer Confirmation - Fund Transfer Type Value")
	bVerifyTransactionConfirmationPageValues = Trim(verifyInnerText_Pattern(HK_CCTR_FundFXTransfer_Page.eleConfPageFundTransTypeVal(),strTransferType , "Transfer Confirmation - Fund Transfer Type Value"))
	
	bVerifyTransactionConfirmationPageValues = verifyTableContentList(HK_CCTR_FundFXTransfer_Page.tblDebitAccntHeader(),HK_CCTR_FundFXTransfer_Page.tblDebitAccntContent(),strDebitAccntDetls,"Transfer Confirmation - Selected Debit Account",False,Null,Null,Null)
	bVerifyTransactionConfirmationPageValues = verifyTableContentList(HK_CCTR_FundFXTransfer_Page.tblAvailableBalanceHeader(),HK_CCTR_FundFXTransfer_Page.tblAvailableBalanceContent(),strAvalBalDetls,"Transfer Confirmation - Account Available Balance" ,False,NULL,NULL,NULL)
	
	VerifyTransactionConfirmationDebitPageValues = bVerifyTransactionConfirmationPageValues
End Function

'[Verify Transaction confirmation page credit values]
Public Function VerifyTransactionConfirmationCreditPageValues(strCreditLbl,strCreditVal,strCurrlbl,strCurrVal,strTransAmntLbl,strTransAmntVal)
	bVerifyTransactionConfirmationCreditPageValues = False
	
	bVerifyTransactionConfirmationCreditPageValues = Trim(verifyInnerText_Pattern(HK_CCTR_FundFXTransfer_Page.eleConfPageCreditAccntlbl(),strCreditLbl , "Transfer Confirmation - Credit Account / Card No Label"))
	bVerifyTransactionConfirmationCreditPageValues = Trim(verifyInnerText_Pattern(HK_CCTR_FundFXTransfer_Page.eleConfPageCreditAccntVal(),strCreditVal , "Transfer Confirmation - Credit Account / Card No Value"))
	
	bVerifyTransactionConfirmationCreditPageValues = Trim(verifyInnerText_Pattern(HK_CCTR_FundFXTransfer_Page.eleConfPageCreditAccntCurrencylbl(),strCurrlbl , "Transfer Confirmation - Credit Account Currency Label"))
	bVerifyTransactionConfirmationCreditPageValues = Trim(verifyInnerText_Pattern(HK_CCTR_FundFXTransfer_Page.eleConfPageCreditAccntCurrencyVal(),strCurrVal , "Transfer Confirmation - Credit Account Currency Value"))
	
	bVerifyTransactionConfirmationCreditPageValues = Trim(verifyInnerText_Pattern(HK_CCTR_FundFXTransfer_Page.eleConfPageTransferAmntlbl(),strTransAmntLbl , "Transfer Confirmation - Transfer Amount Label"))
	bVerifyTransactionConfirmationCreditPageValues = Trim(verifyInnerText_Pattern(HK_CCTR_FundFXTransfer_Page.eleConfPageTransferAmntVal(),strTransAmntVal , "Transfer Confirmation - Transfer Amount Value"))
	
	bVerifyTransactionConfirmationCreditPageValues = VerifyFieldExistenceInPage(HK_CCTR_FundFXTransfer_Page.btnConfPageProceed(),"Fund Transfer Confirmation Pop up","Transfer Confirmation - Proceed Button")
	bVerifyTransactionConfirmationCreditPageValues = VerifyFieldExistenceInPage(HK_CCTR_FundFXTransfer_Page.btnConfPageCancel(),"Fund Transfer Confirmation Pop up","Transfer Confirmation - Cancel Button")
	
	ClickOnObject HK_CCTR_FundFXTransfer_Page.btnConfPageProceed(),"Fund Transfer Confirmation Proceed Button"
	
	VerifyTransactionConfirmationCreditPageValues = bVerifyTransactionConfirmationCreditPageValues
End Function

'[Submit Fund Transfer with validating confirmation message]
Public Function SubmitFundTransferCCTR(strConfMessage)
	bSubmitFundTransferCCTR = False
	If VerifyFieldExistenceInPage(HK_CCTR_FundFXTransfer_Page.eleTransConfPopup(),"Fund Transfer Confirmation Pop up","Transfer Confirmation - Pop Up") Then
		LogMessage "RSLT","Verification","As expected Confirmation Popup message displayed during Fund Transfer",True
		bSubmitFundTransferCCTR = Trim(verifyInnerText_Pattern(HK_CCTR_FundFXTransfer_Page.eleTransConfPopupMsg(),strConfMessage , "Transfer Confirmation - Message"))
		ClickOnObject HK_CCTR_FundFXTransfer_Page.btnTransConfPopupYes(),"Fund Transfer Confirmation Yes Button"
		bSubmitFundTransferCCTR = True
	Else
		LogMessage "WARN","Verification","Failed to display Confirmation Popup during Fund Transfer",False
	End If
	SubmitFundTransferCCTR = bSubmitFundTransferCCTR
	WaitForICallLoading
End Function

'[Verify values in Request Submitted window]
Public Function VerifyValuesRequestSubmitted(lstLabels,strValues)
	bVerifyValuesRequestSubmitted = False
	
	bVerifyValuesRequestSubmitted = verifyInnerText_Pattern(HK_CCTR_FundFXTransfer_Page.eleDebitAccntLbl(),lstLabels(0) , lstLabels(0) & " lable in Request Submitted Window")
	bVerifyValuesRequestSubmitted = verifyInnerText_Pattern(HK_CCTR_FundFXTransfer_Page.eleDebitProductDescriptionLbl(),lstLabels(1) , lstLabels(1) & " lable in Request Submitted Window")
	bVerifyValuesRequestSubmitted = verifyInnerText_Pattern(HK_CCTR_FundFXTransfer_Page.eleCreditAccntLbl(),lstLabels(2) , lstLabels(2) & " lable in Request Submitted Window")
	bVerifyValuesRequestSubmitted = verifyInnerText_Pattern(HK_CCTR_FundFXTransfer_Page.eleCreditProductDescriptionLbl(),lstLabels(3) , lstLabels(3) & " lable in Request Submitted Window")
	bVerifyValuesRequestSubmitted = verifyInnerText_Pattern(HK_CCTR_FundFXTransfer_Page.eleSRNumberLbl(),lstLabels(4) , lstLabels(4) & " lable in Request Submitted Window")
	bVerifyValuesRequestSubmitted = verifyInnerText_Pattern(HK_CCTR_FundFXTransfer_Page.eleStatusLbl(),lstLabels(5) , lstLabels(5) & " lable in Request Submitted Window")
	bVerifyValuesRequestSubmitted = verifyInnerText_Pattern(HK_CCTR_FundFXTransfer_Page.eleTexRefNoLbl(),lstLabels(6) , lstLabels(6) & " lable in Request Submitted Window")
	bVerifyValuesRequestSubmitted = verifyInnerText_Pattern(HK_CCTR_FundFXTransfer_Page.eleDebitAccountBalanceLbl(),lstLabels(7) , lstLabels(7) & " lable in Request Submitted Window")
	bVerifyValuesRequestSubmitted = verifyInnerText_Pattern(HK_CCTR_FundFXTransfer_Page.eleCreditAccountBalanceLbl(),lstLabels(8) , lstLabels(8) & " lable in Request Submitted Window")
	
	bVerifyValuesRequestSubmitted = verifyInnerText_Pattern(HK_CCTR_FundFXTransfer_Page.eleDebitAccntVal(),strValues(0), "Value: " &strValues(0) & " for lable "&lstLabels(0)&" in Request Submitted Window")
	bVerifyValuesRequestSubmitted = verifyInnerText_Pattern(HK_CCTR_FundFXTransfer_Page.eleDebitProductDescriptionVal(),strValues(1), "Value: " &strValues(1) & " for lable "&lstLabels(1)&" in Request Submitted Window")
	bVerifyValuesRequestSubmitted = verifyInnerText_Pattern(HK_CCTR_FundFXTransfer_Page.eleCreditAccntVal(),strValues(2), "Value: " &strValues(2) & " for lable "&lstLabels(2)&" in Request Submitted Window")
	bVerifyValuesRequestSubmitted = verifyInnerText_Pattern(HK_CCTR_FundFXTransfer_Page.eleCreditProductDescriptionVal(),strValues(3), "Value: " &strValues(3) & " for lable "&lstLabels(3)&" in Request Submitted Window")
	
	If HK_CCTR_FundFXTransfer_Page.lnkSRNumber().Exist(3) Then
		Environment.Value("SRNumber") = Trim(HK_CCTR_FundFXTransfer_Page.lnkSRNumber().GetROProperty("innertext"))
	Else
		Environment.Value("SRNumber") = ""
	End If
	
	ClickOnObject HK_CCTR_FundFXTransfer_Page.btnOKRqstSubmitted(),"Ok Button in Request Submitted Winodw"
	WaitForICallLoading
	
	VerifyValuesRequestSubmitted = bVerifyValuesRequestSubmitted
End Function

'[Verify Available Balance after Fund Transfer]
Public Function VerifyAvailableBalanceFundTransfer(strTransAmnt)
	bVerifyAvailableBalanceFundTransfer = False
	ClickOnObject HK_CCTR_FundFXTransfer_Page.btnFundTransfer(),"Fund Transfer button in Balance & Limits Page"
	WaitForICallLoading
	strAvlBalance = Trim(HK_CCTR_FundFXTransfer_Page.eleAvailableBalance().GetROProperty("innertext"))
	strExpBal = Environment.Value("DebitAccntCurrentBalance") - strTransAmnt
	If strAvlBalance = strExpBal Then
		LogMessage "RSLT","Verification","As expected Available Balance in Debit Account is: "& strExpBal,True
		bVerifyAvailableBalanceFundTransfer = True
	Else
		LogMessage "WARN","Verification","Failed to display updated balance for debit account in Fund Transfer page. Expected: "&strExpBal&", Actaul: "&strAvlBalance,False
	End If
	
	VerifyAvailableBalanceFundTransfer = bVerifyAvailableBalanceFundTransfer
End Function

'[Open SR From Overview Page]
Public Function OpenSRFromOverviewPage(strComment)
	bSR = False
	strSRNumber = Environment.Value("SRNumber")
	strSRDetails = Split("SR No.:"&strSRNumber&"|Comments:"&strComment,"|")
	selectTab "Overview"
	ClickOnObject HK_CCTR_FundFXTransfer_Page.eleServiceRequestTab(),"Service Request Tab in Overview Page"
	WaitForICallLoading
	selectTableLink HK_CCTR_FundFXTransfer_Page.tblSRTabHeader(),HK_CCTR_FundFXTransfer_Page.tblSRTabContent(),strSRDetails,"SR Number: "&strSRNumber&" Row","SR No.",False,NULL,NULL,NULL
	WaitForICallLoading
	OpenSRFromOverviewPage = bSR
End Function

'[Verify Main SR info in View SR Tab]
Public Function VerifyMainSRDetailsInViewSRTab(arrSRLbls)
	bVerifyMainSR = False
	strTemplbl = Split(arrSRLbls(0),":")(0)
	strTempVal = Split(arrSRLbls(0),":")(1)
	bVerifyMainSR = verifyInnerText_Pattern(HK_CCTR_FundFXTransfer_Page.eleSrRelatedToLbl(),strTemplbl,strTemplbl & " lable in Main SR Info")
	bVerifyMainSR = verifyInnerText(HK_CCTR_FundFXTransfer_Page.eleSrRelatedToVal(),strTempVal,strTempVal & " Value in Main SR Info")
	
	strTemplbl = Split(arrSRLbls(1),":")(0)
	strTempVal = Split(arrSRLbls(1),":")(1)
	bVerifyMainSR = verifyInnerText_Pattern(HK_CCTR_FundFXTransfer_Page.eleSrAccntNoLbl(),strTemplbl , strTemplbl & " lable in Main SR Info")
	bVerifyMainSR = verifyInnerText(HK_CCTR_FundFXTransfer_Page.eleSrAccntNoVal(),strTempVal,strTempVal & " Value in Main SR Info")
	
	strTemplbl = Split(arrSRLbls(2),":")(0)
	strTempVal = Split(arrSRLbls(2),":")(1)
	bVerifyMainSR = verifyInnerText_Pattern(HK_CCTR_FundFXTransfer_Page.eleSrTypeLbl(),strTemplbl , strTemplbl & " lable in Main SR Info")
	bVerifyMainSR = verifyInnerText(HK_CCTR_FundFXTransfer_Page.eleSrTypeVal(),strTempVal,strTempVal & " Value in Main SR Info")
	
	strTemplbl = Split(arrSRLbls(3),":")(0)
	strTempVal = Split(arrSRLbls(3),":")(1)
	bVerifyMainSR = verifyInnerText_Pattern(HK_CCTR_FundFXTransfer_Page.eleSrSubTypeLbl(),strTemplbl , strTemplbl & " lable in Main SR Info")
	bVerifyMainSR = verifyInnerText(HK_CCTR_FundFXTransfer_Page.eleSrSubTypeVal(),strTempVal,strTempVal & " Value in Main SR Info")
	
	strTemplbl = Split(arrSRLbls(4),":")(0)
	strTempVal = Split(arrSRLbls(4),":")(1)
	bVerifyMainSR = verifyInnerText_Pattern(HK_CCTR_FundFXTransfer_Page.eleSrDescriptionLbl(),strTemplbl , strTemplbl & " lable in Main SR Info")
	bVerifyMainSR = verifyInnerText(HK_CCTR_FundFXTransfer_Page.eleSrDescriptionVal(),strTempVal,strTempVal & " Value in Main SR Info")
	
	strTemplbl = Split(arrSRLbls(5),":")(0)
	strTempVal = Split(arrSRLbls(5),":")(1)
	bVerifyMainSR = verifyInnerText_Pattern(HK_CCTR_FundFXTransfer_Page.eleSrAssignedToLbl(),strTemplbl , strTemplbl & " lable in Main SR Info")
	bVerifyMainSR = verifyInnerText(HK_CCTR_FundFXTransfer_Page.eleSrAssignedToVal(),UCase(strTempVal)&"-"&LCase(strTempVal),strTempVal & " Value in Main SR Info")
	
	strTemplbl = Split(arrSRLbls(6),":")(0)
	strTempVal = Split(arrSRLbls(6),":")(1)
	bVerifyMainSR = verifyInnerText_Pattern(HK_CCTR_FundFXTransfer_Page.eleSrStatusLbl(),strTemplbl , strTemplbl & " lable in Main SR Info")
	bVerifyMainSR = verifyInnerText(HK_CCTR_FundFXTransfer_Page.eleSrStatusVal(),strTempVal,strTempVal & " Value in Main SR Info")
	
	strTemplbl = Split(arrSRLbls(7),":")(0)
	strTempVal = Split(arrSRLbls(7),":")(1)
	bVerifyMainSR = verifyInnerText_Pattern(HK_CCTR_FundFXTransfer_Page.eleSrSubStatusLbl(),strTemplbl, strTemplbl & " lable in Main SR Info")
	bVerifyMainSR = verifyInnerText(HK_CCTR_FundFXTransfer_Page.eleSrSubStatusVal(),strTempVal,strTempVal & " Value in Main SR Info")
	
	strTemplbl = Split(arrSRLbls(8),":")(0)
	strTempVal = Split(arrSRLbls(8),":")(1)
	bVerifyMainSR = verifyInnerText_Pattern(HK_CCTR_FundFXTransfer_Page.eleSrRequestExecutedLbl(),strTemplbl ,strTemplbl & " lable in Main SR Info")
	bVerifyMainSR = verifyInnerText(HK_CCTR_FundFXTransfer_Page.eleSrRequestExecutedVal(),strTempVal,strTempVal & " Value in Main SR Info")
	
	strTemplbl = Split(arrSRLbls(9),":")(0)
	strTempVal = Split(arrSRLbls(9),":")(1)
	bVerifyMainSR = verifyInnerText_Pattern(HK_CCTR_FundFXTransfer_Page.eleSrCommentsLbl(),strTemplbl , strTemplbl & " lable in Main SR Info")
	bVerifyMainSR = verifyInnerText(HK_CCTR_FundFXTransfer_Page.eleSrCommentsVal(),strTempVal,strTempVal & " Value in Main SR Info")
	
	If HK_CCTR_FundFXTransfer_Page.chkOnceAndDone().GetROProperty("checked") = 1 Then
		LogMessage "RSLT","Verification","As expected Once and Done? Checkbox is selected.",True
		bVerifyMainSR = True
	Else
		LogMessage "WARN","Verification","Failed , Once and Done? Checkbox is not selected.",False
	End If
	
	VerifyMainSRDetailsInViewSRTab = bVerifyMainSR
End Function

'[Verify Additional SR info in View SR Tab]
Public Function VerifyFundTransAdditionalSR(arrAddSRLbls,sTransAmnt)
	bVerifyAddSR = False
	
	Set oVPaneLbl = Description.Create
	oVPaneLbl("html id").Value = "iwfsrdetailSRInfo.*"
	oVPaneLbl("html tag").Value = "LABEL"
	Set oAddLbls = HK_CCTR_TDSetupPlacement_Page.eleAdditionalInfoPanel.ChildObjects(oVPaneLbl)
	intLblCount =  oAddLbls.Count
	For i = 0 To intLblCount-1 Step 1
		strATemplbl = Split(arrAddSRLbls(i),":")(0)
		bVerifyAddSR = verifyInnerText_Pattern(oAddLbls(i),strATemplbl , strATemplbl & " lable in Additional SR Info")
	Next
	
	Set oVPaneVal = Description.Create
	oVPaneVal("class").Value = "md-body-2 text-wrap-word is-text-right.*"
	oVPaneVal("html tag").Value = "SPAN"
	Set oAddLbls = HK_CCTR_TDSetupPlacement_Page.eleAdditionalInfoPanel.ChildObjects(oVPaneVal)
	intLblCount =  oAddLbls.Count
	
	For i = 0 To intLblCount-1 Step 1
		strATempVal = Split(arrAddSRLbls(i),":")(1)
		
		strHtmlID = oAddLbls(i).GetROProperty("html id")
		If Instr(1,strHtmlID,"Available Balance") > 0 Then
			strATempVal = Environment.Value("DebitAccntCurrentBalance") - sTransAmnt
		End If
		bVerifyAddSR = verifyInnerText(oAddLbls(i),strATempVal,strATempVal & " Value in Additional SR Info")
	Next
	
'	strATemplbl = Split(arrAddSRLbls(0),":")(0)
'	strATempVal = Split(arrAddSRLbls(0),":")(1)
'	bVerifyAddSR = verifyInnerText_Pattern(HK_CCTR_FundFXTransfer_Page.eleASrFundTransferTypeLbl(),strATemplbl , strATemplbl & " lable in Additional SR Info")
'	bVerifyAddSR = verifyInnerText(HK_CCTR_FundFXTransfer_Page.eleASrFundTransferTypeVal(),strATempVal,strATempVal & " Value in Additional SR Info")
'	
'	strATemplbl = Split(arrAddSRLbls(1),":")(0)
'	strATempVal = Split(arrAddSRLbls(1),":")(1)
'	bVerifyAddSR = verifyInnerText_Pattern(HK_CCTR_FundFXTransfer_Page.eleASrAccountNoLbl(),strATemplbl,strATemplbl & " lable in Additional SR Info")
'	bVerifyAddSR = verifyInnerText(HK_CCTR_FundFXTransfer_Page.eleASrAccountNoVal(),strATempVal,strATempVal & " Value in Additional SR Info")
'	
'	strATemplbl = Split(arrAddSRLbls(2),":")(0)
'	strATempVal = Split(arrAddSRLbls(2),":")(1)
'	bVerifyAddSR = verifyInnerText_Pattern(HK_CCTR_FundFXTransfer_Page.eleASrAccountAvailableBalanceLbl(),strATemplbl,strATemplbl & " lable in Additional SR Info")
'	bVerifyAddSR = verifyInnerText(HK_CCTR_FundFXTransfer_Page.eleASrAccountAvailableBalanceVal(),strATempVal,strATempVal & " Value in Additional SR Info")
'	
'	strATemplbl = Split(arrAddSRLbls(3),":")(0)
'	strATempVal = Split(arrAddSRLbls(3),":")(1)
'	bVerifyAddSR = verifyInnerText_Pattern(HK_CCTR_FundFXTransfer_Page.eleASrDebitAccountCurrencyLbl(),strATemplbl,strATemplbl & " lable in Additional SR Info")
'	bVerifyAddSR = verifyInnerText(HK_CCTR_FundFXTransfer_Page.eleASrDebitAccountCurrencyVal(),strATempVal,strATempVal & " Value in Additional SR Info")
'	
'	strATemplbl = Split(arrAddSRLbls(4),":")(0)
'	strATempVal = Split(arrAddSRLbls(4),":")(1)
'	bVerifyAddSR = verifyInnerText_Pattern(HK_CCTR_FundFXTransfer_Page.eleASrCreditAccountNoLbl(),strATemplbl, strATemplbl & " lable in Additional SR Info")
'	bVerifyAddSR = verifyInnerText(HK_CCTR_FundFXTransfer_Page.eleASrCreditAccountNoVal(),strATempVal,strATempVal & " Value in Additional SR Info")
'	
'	strATemplbl = Split(arrAddSRLbls(5),":")(0)
'	strATempVal = Split(arrAddSRLbls(5),":")(1)
'	bVerifyAddSR = verifyInnerText_Pattern(HK_CCTR_FundFXTransfer_Page.eleASrCreditAccountCurrencyLbl(),strATemplbl, strATemplbl & " lable in Additional SR Info")
'	bVerifyAddSR = verifyInnerText(HK_CCTR_FundFXTransfer_Page.eleASrCreditAccountCurrencyVal(),strATempVal,strATempVal & " Value in Additional SR Info")
'	
'	strATemplbl = Split(arrAddSRLbls(6),":")(0)
'	strATempVal = Split(arrAddSRLbls(6),":")(1)
'	bVerifyAddSR = verifyInnerText_Pattern(HK_CCTR_FundFXTransfer_Page.eleASrTransferAmountLbl(),strATemplbl , strATemplbl & " lable in Additional SR Info")
'	bVerifyAddSR = verifyInnerText(HK_CCTR_FundFXTransfer_Page.eleASrTransferAmountVal(),strATempVal,strATempVal & " Value in Additional SR Info")
	
	VerifyFundTransAdditionalSR = bVerifyAddSR
End Function

'[Validate comment section max allowable characters]
Public Function ValidateMaxCommentChars(strCommentMaxLength)
	bValidateMaxCommentChars = False
	strActualString = Trim(HK_CCTR_FundFXTransfer_Page.txtAreaComments().GetROProperty("innertext"))
	If Len(strActualString) = strCommentMaxLength Then
		LogMessage "RSLT","Verification","As expected Fund Transfer Comments section not allowing more then "& strCommentMaxLength & " characters.",True
		bValidateMaxCommentChars = True
	ElseIf Len(strActualString) > strCommentMaxLength Then
		LogMessage "WARN","Verification","Failed , Fund Transfer Comments section is allowing more then "& strCommentMaxLength & "characters. Expected: " &strCommentMaxLength& ", Actual: "&Len(strActualString) ,False
	ElseIf Len(strActualString) < strCommentMaxLength Then
		LogMessage "WARN","Verification","Failed , Fund Transfer Comments section is allowing less then "& strCommentMaxLength & " characters. Expected: " &strCommentMaxLength& ", Actual: "&Len(strActualString) ,False
	End If
End Function

'[Validate invalid entries in Transaction Amount field]
Public Function ValidateTransactionAmountField(lstInvalidValues,strExpectedMsg)
	bValidateTransactionAmountField = False
	For i = 0 To UBound(lstInvalidValues) Step 1
		SetValue HK_CCTR_FundFXTransfer_Page.txtTransferAmount(),lstInvalidValues(i),"Transfer Amount"
		HK_CCTR_FundFXTransfer_Page.txtAreaComments().Click
		If HK_CCTR_FundFXTransfer_Page.eleTransferAmountInvalidMsg().Exist(3) Then
			strActlMesg = Trim(HK_CCTR_FundFXTransfer_Page.eleTransferAmountInvalidMsg().GetROProperty("innertext"))
			If strActlMesg = strExpectedMsg Then
				LogMessage "RSLT","Verification","As expected validation message:  "& strActlMesg & " is appearing on entering "&lstInvalidValues(i) & " in Transaction Amount text field.",True
				bValidateTransactionAmountField = True
			Else
				LogMessage "WARN","Verification","Failed ,Validation message is not appearing as expected on entering invalid char "&lstInvalidValues(i) &" in Transaction Amount text field, Expected: " &strExpectedMsg& ", Actual: "&strActlMesg ,False
			End If
		Else
			LogMessage "WARN","Verification","Failed, NO VALIDATION message is appering on entering invalid char "&lstInvalidValues(i) &" in Transaction Amount text field, Expected: " &strExpectedMsg,False
		End If
	Next
	ValidateTransactionAmountField = bValidateTransactionAmountField
End Function

'[Verify Next button disabled or not without mandatory data entry]
Public Function VerifyNextButtonDisable(strCreditAccnt,strCreditCurr,strTransAmnt)
	bVerifyNextButtonDisable = False
	
	strDisabled = Trim(HK_CCTR_FundFXTransfer_Page.btnNextFundTransfer().GetROProperty("disabled"))
	If strDisabled = 1 Then
		LogMessage "RSLT","Verification","As expected , Next Button is disabled , while there is not mandatory field selection",True
		bVerifyNextButtonDisable = True
	Else
		LogMessage "WARN","Verification","Failed ,Next Button is enabled , while there is not mandatory field selection. Expected disabled" ,False
		bVerifyNextButtonDisable = False
	End If
	
	selectItem_Combobox HK_CCTR_FundFXTransfer_Page.eleCreditAccountCurrencyDropDown(),strCreditCurrency
	SetValue HK_CCTR_FundFXTransfer_Page.txtTransferAmount(),strTransAmnt,"Transfer Amount"
	
	strDisabled = Trim(HK_CCTR_FundFXTransfer_Page.btnNextFundTransfer().GetROProperty("disabled"))
	If strDisabled = 1 Then
		LogMessage "RSLT","Verification","As expected , Next Button is disabled , while Credit currency and Trans Amount selected and Credit account not selected",True
		bVerifyNextButtonDisable = True
	Else
		LogMessage "WARN","Verification","Failed ,Next Button is enabled , while Credit currency and Trans Amount selected and Credit account not selected. Expected disabled" ,False
		bVerifyNextButtonDisable = False
	End If
	
	
	selectItem_Combobox HK_CCTR_FundFXTransfer_Page.eleCreditAccountCardNoDropDown(),strCreditAccntNo
	selectItem_Combobox HK_CCTR_FundFXTransfer_Page.eleCreditAccountCurrencyDropDown(),strCreditCurrency
	
	strDisabled = Trim(HK_CCTR_FundFXTransfer_Page.btnNextFundTransfer().GetROProperty("disabled"))
	If strDisabled = 1 Then
		LogMessage "RSLT","Verification","As expected , Next Button is disabled , while Credit Account and Credit Currency selected and Trans Amount not selected",True
		bVerifyNextButtonDisable = True
	Else
		LogMessage "WARN","Verification","Failed ,Next Button is enabled , while Credit Account and Credit Currency selected and Trans Amount not selected. Expected disabled" ,False
		bVerifyNextButtonDisable = False
	End If
	
	selectItem_Combobox HK_CCTR_FundFXTransfer_Page.eleCreditAccountCardNoDropDown(),strCreditAccntNo
	SetValue HK_CCTR_FundFXTransfer_Page.txtTransferAmount(),strTransAmnt,"Transfer Amount"
	
	strDisabled = Trim(HK_CCTR_FundFXTransfer_Page.btnNextFundTransfer().GetROProperty("disabled"))
	If strDisabled = 1 Then
		LogMessage "RSLT","Verification","As expected , Next Button is disabled , while Credit Account and  Trans Amount selected and Credit Currency not selected",True
		bVerifyNextButtonDisable = True
	Else
		LogMessage "WARN","Verification","Failed ,Next Button is enabled ,while Credit Account and  Trans Amount selected and Credit Currency not selected. Expected disabled" ,False
		bVerifyNextButtonDisable = False
	End If
	
	VerifyNextButtonDisable = bVerifyNextButtonDisable
End Function
