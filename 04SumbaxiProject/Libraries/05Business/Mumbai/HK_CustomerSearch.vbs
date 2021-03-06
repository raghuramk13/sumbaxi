'[Search customer by Customer ID]
Public Function SearchCustomerByID(strIDType,strIDNumber,strErrorFlag,strExpectedSearchMsg)
	blnSearchCustomerByID = True
	selectItem_Combobox HK_CustomerSearch_Page.lstIDType(),strIDType
	SetValue HK_CustomerSearch_Page.txtIDNumber(),strIDNumber,"ID"
	ClickOnObject HK_CustomerSearch_Page.btnCustBySearch,"Search Button"
	WaitForICallLoading
	If strErrorFlag Then
		If Not IsNull(strExpectedSearchMsg) Then
			If Not verifyInnerText(HK_CustomerSearch_Page.eleBranchSearchRslt(), strExpectedSearchMsg, "Customer Search Result Message:") Then
				blnSearchCustomerByID = False
			End If
		End If
	End If

	SearchCustomerByID=blnSearchCustomerByID
End Function

'[Enter Customer English Name]
Public Function EnterCustomerEnglishName(strCustomerName)
	WaitForICallLoading
	strNow = Replace(Replace(Replace(Now," ", ""), "/",""), ":","")
	Environment.Value("ApplicantName") = strCustomerName&strNow
	SetValue HK_CustomerSearch_Page.txtCustNameInEnglish(),strCustomerName&strNow,"Customer Name in English"
End Function

'[Enter Customer Name and DOB]
Public Function EnterCustomerNameAndDOB(strCustomerName,strChineseName,strDOB)
	SetValue HK_CustomerSearch_Page.txtCustNameInEnglish(),strCustomerName,"Customer Name in English"
	SetValue HK_CustomerSearch_Page.txtCustNameInChinese(),strChineseName,"Customer Name in Chinese"
	SetValue HK_CustomerSearch_Page.txtDateOfBirth(),strDOB,"Date of Birth"
	
	ClickOnObject HK_CustomerSearch_Page.btnCustBySearch,"Search Button"
End Function


'[Search customer by Customer details]
Public Function SearchCustomerByCustomerDetails(strIDType,strIDNumber,strCustomerName,strChineseName,strDOB,strCustomerType,strExpectedMessage)

	blnSearchCustomerByCustomerDetails = true
	
	selectItem_Combobox HK_CustomerSearch_Page.lstIDType(),strIDType
	
	SetValue HK_CustomerSearch_Page.txtIDNumber(),strIDNumber,"ID"
	ClickOnObject HK_CustomerSearch_Page.btnCustBySearch,"Search Button"
	WaitForICallLoading
	
	
	If strCustomerType = "NTB" Then
	
		strActualMessage = Trim(HK_CustomerSearch_Page.eleBranchSearchRslt().getROProperty("innertext"))
		If strActualMessage = Trim(strExpectedMessage)Then
			LogMessage "RSLT","Verification","NTB Customer Results displayed as expected",True
			blnSearchCustomerByCustomerDetails = true
		Else
			LogMessage "RSLT","Verification","Failed to display NTB Customer Results",False
			blnSearchCustomerByCustomerDetails = false		
		End If
	ElseIf strCustomerType="ETB" Then
		strActualMessage = Trim(HK_CustomerSearch_Page.eleBranchSearchRslt().getROProperty("innertext"))
		If strActualMessage="" Then
			LogMessage "RSLT","Verification","ETB Customer Results displayed as expected",True
			blnSearchCustomerByCustomerDetails = true
		Else
			LogMessage "RSLT","Verification","Failed to display ETB Customer Results",False
			blnSearchCustomerByCustomerDetails = false		
		End If	
	Else
		LogMessage "RSLT","Verification","Clicked on search as expected",True
		blnSearchCustomerByCustomerDetails = true

	End If
	
	WaitForICallLoading

	SearchCustomerByCustomerDetails = blnSearchCustomerByCustomerDetails
	
End function
'[Search customer by CIF]
Public Function SearchCustomerByCif(strCIF,strCustomerFlag)

	blnSearchCustomerByCif=true
	ClickOnObject HK_CustomerSearch_Page.eleByCIF,"By CIF Section"
	
	SetValue HK_CustomerSearch_Page.txtCustCIF,strCIF,"CIF"
	
	ClickOnObject HK_CustomerSearch_Page.btnCIFSearch,"Search Button"

	WaitForICallLoading
	
	If strCustomerFlag="NTB" Then
		strActualmessage = HK_CustomerSearch_Page.elebranchSearchRslt().getROProperty("innertext")
		If strActualmessage="Your search came up with zero results. Please change your search terms to refine the search." Then
			LogMessage "RSLT","Verification","NTB Customer Results displayed as expected",True
			blnSearchCustomerByCif=true
		Else
			LogMessage "RSLT","Verification","Failed to display NTB Customer Results",False
			blnSearchCustomerByCif=false		
		End If

	ElseIf strCustomerType="ETB" Then
		strActualmessage = elebranchSearchRslt().getROProperty("innertext")
		If strActualmessage="" Then
			LogMessage "RSLT","Verification","ETB Customer Results displayed as expected",True
			blnSearchCustomerByCif=true
		Else
			LogMessage "RSLT","Verification","Failed to display ETB Customer Results",False
			blnSearchCustomerByCif=false		
		End If
	Else
			LogMessage "RSLT","Verification","Clicked on search as expected",True
			blnSearchCustomerByCif=true
	End If
	
	SearchCustomerByCif=blnSearchCustomerByCif
	
End Function

'[Search customer by Telephone]
Public Function SearchCustomerByTelephone(strTelephoneNumber,strCustomerFlag)
	
	blnSearchCustomerByTelephone=True
	
	SetValue HK_CustomerSearch_Page.txtCustTelField,strTelephoneNumber,"Telephone"
	ClickOnObject HK_CustomerSearch_Page.btnByTelephoneSearch,"Search Button"
	
	WaitForICallLoading
	If strCustomerFlag="NTB" Then
		strActualmessage = HK_CustomerSearch_Page.elebranchSearchRslt().getROProperty("innertext")
		If strActualmessage="Your search came up with zero results. Please change your search terms to refine the search." Then
			LogMessage "RSLT","Verification","NTB Customer Results displayed as expected",True
			blnSearchCustomerByTelephone=true
		Else
			LogMessage "RSLT","Verification","Failed to display NTB Customer Results",False
			blnSearchCustomerByTelephone=false		
		End If
	ElseIf strCustomerType="ETB" Then
		strActualmessage = elebranchSearchRslt().getROProperty("innertext")
		If strActualmessage="" Then
			LogMessage "RSLT","Verification","ETB Customer Results displayed as expected",True
			blnSearchCustomerByTelephone=true
		Else
			LogMessage "RSLT","Verification","Failed to display ETB Customer Results",False
			blnSearchCustomerByTelephone=false		
		End If
		
	Else
		LogMessage "RSLT","Verification","Clicked on search as expected",True
		blnSearchCustomerByTelephone=true

	End If
	SearchCustomerByTelephone=blnSearchCustomerByTelephone
	
End Function

'[Set text in Application Date Field on Customer Search Page]
Public Function SetApplicationDate(strApplicationDate)
	blnSetApplicationDate=True
	blnFlag = SetValue(HK_CustomerSearch_Page.txtApplicationDate,strApplicationDate,"Application Date")
	
	If blnFlag Then
		blnSetApplicationDate=True
	Else
		blnSetApplicationDate=False
	End If
	SetApplicationDate=blnSetApplicationDate
	
End Function

'[Select Application Status dropdown from Customer Search Page]
Public Function SelectApplicationStatus(strAppStatus)
	
	blnSelectApplicationStatus=True
	blnFlag= selectItem_Combobox (HK_CustomerSearch_Page.lstAppStatus(),strAppStatus)
	If blnFlag Then
		blnSelectApplicationStatus=True
	Else
		blnSelectApplicationStatus=False
	End If
	
	SelectApplicationStatus=blnSelectApplicationStatus
End Function

'[Serach Customer by Application Date and Status]
Public Function SearchCustomerByAppdateAndStatus(strApplicationDate,strAppStatus)
	WaitForICallLoading
	bSearchCustomerByAppdateAndStatus = False
	strApplicationDate = ConvertTodaysDateFormat
	bSearchCustomerByAppdateAndStatus = SetApplicationDate(strApplicationDate)
	bSearchCustomerByAppdateAndStatus = SelectApplicationStatus(strAppStatus)
	bSearchCustomerByAppdateAndStatus = SearchCustomerByAppdateAndStatus
End Function

'[Verify the availability of Filter button on Customer Search Page]
Public Function VerifyFilterButtonExists()
	bVerifyFilterButtonExists=True
	If HK_CustomerSearch_Page.btnFilter.Exist(20) Then
		LogMessage "RSLT","Verification","Filter button is available",True
		bVerifyFilterButtonExists=true
	Else
		LogMessage "RSLT","Verification","Filter button is not available",False
		bVerifyFilterButtonExists=false
		
	End If
	VerifyFilterButtonExists=bVerifyFilterButtonExists
	
End Function

'[Verify the availability of Clear button on Customer Search Page]
Public Function VerifyClearButtonExists()
	bVerifyClearButtonExists=True

	If HK_CustomerSearch_Page.btnClear.Exist(20) Then
		LogMessage "RSLT","Verification","Clear button is available",True
		bVerifyClearButtonExists=true
	Else
		LogMessage "RSLT","Verification","Clear button is not available",False
		bVerifyClearButtonExists=false
		
	End If
	VerifyClearButtonExists=bVerifyClearButtonExists
	
End Function

'[Click on Filter Button in Customer Search Page]
Public Function ClickOnFilterButton()
	bClickOnFilterButton=True
	blnFlag = ClickOnObject (HK_CustomerSearch_Page.btnFilter,"Filter Button")
	If blnFlag Then
		bClickOnFilterButton=True
	Else
		bClickOnFilterButton=False
	End If
	ClickOnFilterButton=bClickOnFilterButton
	
End Function 

'[Click on Clear Button in Customer Search Page]
Public Function ClickOnClearButton()
	bClickOnClearButton=True
	blnFlag = ClickOnObject (HK_CustomerSearch_Page.btnClear,"Filter Button")
	If blnFlag Then
		bClickOnClearButton=True
	Else
		bClickOnClearButton=False
	End If
	ClickOnClearButton=bClickOnClearButton
	
End Function

'[Verify Application Status Combobox has Items]
Public Function VerifyApplicationComboboxItems(lstAppStatusItems)
   bVerifyApplicationComboboxItems=true
   If Not IsNull(lstItems) Then
       If Not verifyComboboxItems (HK_CustomerSearch_Page.lstAppStatus(), lstAppStatusItems, "Customer Search-Application Status")Then
           bVerifyApplicationComboboxItems=false
           
       Else
       		LogMessage "RSLT","Verification","Application Status Combobox :List items are displayed as expected",True
			bVerifyApplicationComboboxItems=true
       End If
   End If
   VerifyApplicationComboboxItems=bVerifyApplicationComboboxItems
End Function

'[Verify the search results data in Customer Search Page]
Public Function VerifySearchResultsTable(strlstlstCustomerSearchDetails)
	
	bVerifySearchResultsTable = verifyTableContentList(HK_CustomerSearch_Page.tblCustomerSearchHeader,HK_CustomerSearch_Page.tblCustomerSarchContent,strlstlstCustomerSearchDetails,"Customer Search Details",false,NULL,NULL,NULL)
	VerifySearchResultsTable=bVerifySearchResultsTable
End Function

'[Verify Error Message on Customer Search Page upon clicking Onboarding]
Public Function VerifyErrorMessageCustSearchOnboarding(strOnboardingErrorMessage)
	blnVerifyErrorMessageCustSearchOnboarding=true
	If Not verifyFieldValue(HK_CustomerSearch_Page.eleOnboardingErrorMessage(), strOnboardingErrorMessage, "Onboarding Error Message") Then
		blnVerifyErrorMessageCustSearchOnboarding=false
	End If
	VerifyErrorMessageCustSearchOnboarding=blnVerifyErrorMessageCustSearchOnboarding
End Function

'[Click on Onboarding Button in Customer Search Page]
Public Function ClickOnOnboardingButton()
	blnClickOnOnboardingButton=True
	blnFlag = ClickOnObject (HK_CustomerSearch_Page.btnStartOnBoarding,"OnBoarding Button")
	If blnFlag Then
		blnClickOnOnboardingButton=True
	Else
		blnClickOnOnboardingButton=False
	End If
	ClickOnOnboardingButton=blnClickOnOnboardingButton
	
End Function
'[Verify ID Type Combobox has List Items in Customer Search Page]
Public Function VerifyIDTypeComboboxItems(lstIDTypeItems)
   blnVerifyIDTypeComboboxItems=true
   If Not IsNull(lstIDTypeItems) Then
       If Not verifyComboboxItems (HK_CustomerSearch_Page.lstIdtypeSearch(), lstIDTypeItems, "ID Type Combobox")Then
           blnVerifyIDTypeComboboxItems=false
           
       Else
       		LogMessage "RSLT","Verification","ID Type Combobox :List items are displayed as expected",True
			blnVerifyIDTypeComboboxItems=true
       End If
   End If
   VerifyIDTypeComboboxItems=blnVerifyIDTypeComboboxItems
End Function
'[Verify row Data in Table for Search Results in Customer Search Page]
Public Function verifytblSearchResults(arrSearchResultsRowDataList)

    If HK_CustomerSearch_Page.weleNavBranch().Exist(10) Then
    	verifytblSearchResults=verifyTableContentList(HK_CustomerSearch_Page.tblbrnchSearchTblHeader(),HK_CustomerSearch_Page.tblbrnchSearchTblContent(),arrSearchResultsRowDataList,"Search Results",false,NULL,NULL,NULL)	
		
	Else
		verifytblSearchResults=verifyTableContentList(HK_CustomerSearch_Page.tblSearchTblHeader(),HK_CustomerSearch_Page.tblSearchTblContent(),arrSearchResultsRowDataList,"Search Results",false,NULL,NULL,NULL)
    End If
   
End Function
'[Verify error message is displayed upon clicking Search button under By Customer search section in Customer Search Page]
Public Function verifyErrorMessageByCustomerSearch(strErrorMessage)
	blnverifyErrorMessageByCustomerSearch = true
	If Not IsNull(strErrorMessage) Then
		If Not VerifyInnerText (HK_CustomerSearch_Page.eleByCustomerErrorlable(),strErrorMessage, "By Customer Search Error Message") Then
			blnverifyErrorMessageByCustomerSearch = false
		End If
	End If
	verifyErrorMessageByCustomerSearch = blnverifyErrorMessageByCustomerSearch
End Function
'[Verify error message is displayed upon clicking Search button under Chinese Name section in Customer Search Page]
Public Function verifyErrorMessageChineseNameSearch(strErrorMessage)
	blnverifyErrorMessageChineseNameSearch = true
	If Not IsNull(strErrorMessage) Then
		If Not VerifyInnerText (HK_CustomerSearch_Page.eleChineseNameError(),strErrorMessage, "Chinese Name Search Error Message") Then
			blnverifyErrorMessageChineseNameSearch = false
		End If
	End If
	verifyErrorMessageChineseNameSearch = blnverifyErrorMessageChineseNameSearch
End Function
'[Verify error message is displayed upon clicking Search button under DOB section in Customer Search Page]
Public Function verifyErrorMessageDOBNameSearch(strErrorMessage)
	blnverifyErrorMessageDOBNameSearch = true
	If Not IsNull(strErrorMessage) Then
		If Not VerifyInnerText (HK_CustomerSearch_Page.eleDOBError(),strErrorMessage, "DOB Search Error Message") Then
			blnverifyErrorMessageDOBNameSearch = false
		End If
	End If
	verifyErrorMessageDOBNameSearch = blnverifyErrorMessageDOBNameSearch
End Function
'[Verify error message is displayed upon clicking Search button under By CIF section in Customer Search Page]
Public Function verifyErrorMessageByCifSearch(strErrorMessage)
	blnverifyErrorMessageByCifSearch = true
	If Not IsNull(strErrorMessage) Then
		If Not VerifyInnerText (HK_CustomerSearch_Page.eleByCifError(),strErrorMessage, "By CIF Search Error Message") Then
			blnverifyErrorMessageByCifSearch = false
		End If
	End If
	verifyErrorMessageByCifSearch = blnverifyErrorMessageByCifSearch
End Function
'[Verify error message is displayed upon clicking Search button under By Telephone section in Customer Search Page]
Public Function verifyErrorMessageByTelephoneSearch(strErrorMessage)
	blnverifyErrorMessageByTelephoneSearch = true
	If Not IsNull(strErrorMessage) Then
		If Not VerifyInnerText (HK_CustomerSearch_Page.eleByTelephoneError(),strErrorMessage, "By Telephone Error Message") Then
			blnverifyErrorMessageByTelephoneSearch = false
		End If
	End If
	verifyErrorMessageByTelephoneSearch = blnverifyErrorMessageByTelephoneSearch
End Function

'[Verify Application Status Reason]
Public Function VerifyApplicationStatusReason(arrSearchTableDetls,strStatus,strReason)
	bVerifyAppStatus = False
	Set objHeader = HK_CustomerSearch_Page.tblCustomerSearchHeader()
	Set objContent = HK_CustomerSearch_Page.tblCustomerSarchContent()
	bVerifyAppStatus = selectTableLink(objHeader,objContent,arrSearchTableDetls,"Customer Search" ,"Application Status",False,NULL,NULL,NULL)
	If HK_CustomerSearch_Page.eleReasonDialogPopup().exist(3) Then
		LogMessage "RSLT","Verification","Reason dialog popup is displayed as expected on clicking : " & strStatus & " link from customer search page.",True
		strInnerMsg = Trim(HK_CustomerSearch_Page.eleReasonDialogPopup().GetROProperty("innertext"))
		If strInnerMsg = strReason Then
			LogMessage "RSLT","Verification","Reason dialog popup messages text is displayed as expected on clicking : " & strStatus & " link from customer search page.",True
			ClickOnObject HK_CustomerSearch_Page.btnOKReasonDialogPopup,"OK Button - Reason Dialog"
			bVerifyAppStatus = True
		Else
			LogMessage "WARN","Verification","Reason dialog popup message text is not displayed as expected on clicking : " & strStatus & " link from customer search page.",False
			bVerifyAppStatus = False
		End If
	Else
		LogMessage "WARN","Verification","Reason dialog popup is not displayed as expected on clicking : " & strStatus & " link from customer search page.",False
		bVerifyAppStatus = False
	End If
	VerifyApplicationStatusReason = bVerifyAppStatus
End Function

'[Click on Additional details Icon and Verify Customer Flags in Additional details Window]
Public Function VerifyCustomerFlag(arrCustFlagVals)
	bCustFlag = False
	
	ClickOnObject HK_OnBoardCustomer_Page.eleAdditionalDetails,"Additional Details Icon"
	
	Set objHeader = HK_CustomerSearch_Page.tblCustomerAddDetailsHeader()
	Set objContent = HK_CustomerSearch_Page.tblCustomerAddDetailsContent()
	
	bCustFlag = verifyTableContentList(objHeader,objContent,arrCustFlagVals,"Customer Additional details",False,Null,Null,Null)
	
	ClickOnObject HK_OnBoardCustomer_Page.btnOKAdditionalDetails,"Ok Button In Additional Details Window"
	
	VerifyCustomerFlag = bCustFlag
End Function


'[Onboard Suspended Customer]
Public Function OnboardSuspendedCustomer(strErrorMsg)
	bSuspend = False
	
	ClickOnObject HK_OnBoardCustomer_Page.eleAddAsApplicant,"Add As Applicant Icon"
	
	If HK_CustomerSearch_Page.eleOnboardErrorMsg().exist(3) Then
	
		LogMessage "RSLT","Verification","As Expected,Customer having Suspended Flag ON cannot be onboarded",True
		
		strInnerMsg = Trim(HK_CustomerSearch_Page.eleOnboardErrorMsg().GetROProperty("innertext"))
		If strInnerMsg = strErrorMsg Then
			LogMessage "RSLT","Verification","Suspended Customer onboard error message displayed as expected.",True
			bSuspend = True
		Else
			LogMessage "WARN","Verification","Suspended Customer onboard error message not displayed as expected, Expected: " & strErrorMsg & ", Actual: "&strErrorMsg,False
			bSuspend = False
		End If	
	Else
		LogMessage "WARN","Verification","Failed,Customer having Suspended Flag ON can be onboarded.",False
		bSuspend = False
	End If
	
	OnboardSuspendedCustomer = bSuspend
End Function

'[Onboard Negated Customer]
Public Function OnboardSuspendedCustomer(strErrorMsg)
	bSuspend = False
	
	ClickOnObject HK_OnBoardCustomer_Page.eleAddAsApplicant,"Add As Applicant Icon"
	
	If HK_CustomerSearch_Page.eleOnboardErrorMsg().exist(3) Then
	
		LogMessage "RSLT","Verification","As Expected,Customer having Negated Flag ON cannot be onboarded",True
		
		strInnerMsg = Trim(HK_CustomerSearch_Page.eleOnboardErrorMsg().GetROProperty("innertext"))
		If strInnerMsg = strErrorMsg Then
			LogMessage "RSLT","Verification","Negated Customer onboard error message displayed as expected.",True
			bSuspend = True
		Else
			LogMessage "WARN","Verification","Negated Customer onboard error message not displayed as expected, Expected: " & strErrorMsg & ", Actual: "&strErrorMsg,False
			bSuspend = False
		End If	
	Else
		LogMessage "WARN","Verification","Failed,Customer having Negated Flag ON can be onboarded.",False
		bSuspend = False
	End If
	
	OnboardSuspendedCustomer = bSuspend
End Function

'[Verify Application Date Format]
Public Function VerifyApplicationDateFromat(strInValidDateFormat)
	bFormat = False
	SetApplicationDate strInValidDateFormat
	ClickOnFilterButton
	Wait(2)
	If HK_CustomerSearch_Page.eleInvalidDateErrorMsg().Exist(4) Then
		LogMessage "RSLT","Verification","Application Date Field allowing only DD/MM/YYYY format as expected.",True
		bFormat = True
	Else
		LogMessage "WARN","Failed,Application Date Field is allowing format other then DD/MM/YYYY",False
	End If
	VerifyApplicationDateFromat = bFormat
End Function

'[Verify Clear button functionality]
Public Function VerifyClearButtonFunction(strDate)
	bFormat = False
	SetApplicationDate strDate
	ClickOnFilterButton
	ClickOnClearButton
	Wait(2)
	If HK_CustomerSearch_Page.txtApplicationDate().GetROProperty("value") = "" Then
		LogMessage "RSLT","Verification","On clicking Clear Button , Filter criteria cleared off as expected.",True
		bFormat = True
	Else
		LogMessage "WARN","Failed,On clicking Clear Button , Filter criteria does not cleared off",False
	End If
	VerifyClearButtonFunction = bFormat
End Function

