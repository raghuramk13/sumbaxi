'[Verify IServe Dashboard page is Displayed]
Public Function  VerifyDashboardPageDisplayed()
	If coDashboard_Page.lblUserName.Exist(2) Then
		LogMessage "RSLT","Verification","IServe Dashboard Page is displayed as expected..",True
		VerifyDashboardPageDisplayed = True
	Else
		LogMessage "WARN","Verification","Failed : IServe Dashboard Page is not displayed..",False
		VerifyDashboardPageDisplayed = False 
	End If
End Function

'[Verify Search Type combo box default value]
Public Function VerifySearchTypeDefaultValue(strDefaultValue)
	strActualVal = coDashboard_Page.txtSearchType.GetRoProperty("placeholder")
	If Trim(strDefaultValue) = Trim(strActualVal) Then
		LogMessage "RSLT", "Verification","As expected, Default value for (Customer Search) Combobox is : "&strDefaultValue,True
		VerifySearchTypeDefaultValue = True
	else
		LogMessage "WARN", "Verification","Failed,Default value for (Customer Search) Combobox is incorrect, Expected : "&strDefaultValue&", Actual : "&strActualVal,False
		VerifySearchTypeDefaultValue = False
	End If
End Function

'[Verify Search button Enable Disable State]
Public Function VerifySearchButtonState(strSearchType)
	coDashboard_Page.txtSearchType.Set strSearchType
	If coDashboard_Page.btnSearch.GetROProperty("disabled") = 1 Then
		LogMessage "RSLT","Verification","As Expected : By default Search Button is Disabled.",True
		VerifySearchButtonState = True
	Else
		LogMessage "WARN","Verification","Failed : By default Search button is Enabled, Expected : Disabled.",False
		VerifySearchButtonState = False
	End If
End Function

'[Verify Search Type list values in Dashboard page]
Public Function VerifySearchTypeList(arrSearchTypes)
	VerifySearchTypeList = verifyComboboxItems(coDashboard_Page.txtSearchType,arrSearchTypes,"Customer Search")
End Function

'[Search Customer from Dashboard page]
Public Function SearchCustomerFromDashboard(strSearchType,strSearchVal)	
	SearchCustomerFromDashboard = CustomerSearch(strSearchType,strSearchVal)
End Function

'[Verify Customer Search Result in Dashboard]
Public Function VerifyDashboardCustomerSearchResult(arrResult)	
	VerifyDashboardCustomerSearchResult = VerifyTableSingleRowData(coDashboard_Page.tblSearchResultHeader,coDashboard_Page.tblSearchResultBody,arrResult,"Customer Search Result")
End Function

'[Verify error message for invalid input]
Public Function VerifyErrorMessage(strExpectedMsg)
	If InStr(strExpectedMsg,"Your search came up with zero result") = 0 Then
		If coDashboard_Page.eleInlineSearchErrMsg.exist(1) Then
			VerifyErrorMessage = verifyInnerText(coDashboard_Page.eleInlineSearchErrMsg, strExpectedMsg, "Invalid Search Message")
		End If
	ElseIf coDashboard_Page.eleNoResultSearchErrMsg.exist(1) Then
		VerifyErrorMessage = verifyInnerText(coDashboard_Page.eleNoResultSearchErrMsg, strExpectedMsg, "No Result Search Message")
	Else
		LogMessage "WARN","Verification","Failed : No Error Message displayed for invalid search input",False
		VerifyErrorMessage = False
	End If
End Function

'[Verify input field Max Length]
Public Function VerifyInputFieldMaxLength(intMaxLength,strInputFldName)
	VerifyInputFieldMaxLength = VerifyMaxLength(coDashboard_Page.txtSearchVal,intMaxLength,strInputFldName & " Input box ") 
End Function

'[Navigate to Customer Overview page]
Public Function NavigateToCustOverviewPage(lstSearchResult,strSearchType)
	NavigateToCustOverviewPage = SelectTableRow(coDashboard_Page.tblSearchResultHeader,coDashboard_Page.tblSearchResultBody,lstSearchResult,"Customer Search","CUSTOMER TYPE",False,False)
	'Wait(2)
	If VerifyTabExist("OVERVIEW") Then
		NavigateToCustOverviewPage = True
		LogMessage "RSLT","Verification","As expected On Clicking Customer Search Result Row, Customer Overview page displayed for Search Type: "&strSearchType,True
	Else
		NavigateToCustOverviewPage = False
		LogMessage "WARN","Verification","Failed: On Clicking Customer Search Result Row, Customer Overview page is not displayed for Search Type: "&strSearchType,False
	End If
End Function

'[Navigate to Customer Verification page]
Public Function NavigateToCustVerificationPage(lstSearchResult,strSearchType)
	NavigateToCustVerificationPage = SelectTableRow(coDashboard_Page.tblSearchResultHeader,coDashboard_Page.tblSearchResultBody,lstSearchResult,"Customer Search","VERIFY",False,False)
	
	If VerifyTabExist("VERIFICATION") Then
		NavigateToCustVerificationPage = True
		LogMessage "RSLT","Verification","As expected On Clicking Verify link from Customer Search Result Row, Verification tab displayed as expected",True
	Else
		NavigateToCustVerificationPage = False
		LogMessage "WARN","Verification","Failed: On Clicking Verify link from Customer Search Result Row, Verification tab not displayed",False
	End If
End Function

'[Verify Customer Segment in Customer Overview Page]
Public Function VerifyCustomerSegment(lstSearchResult,strSegmentType)
	VerifyCustomerSegment = SelectTableRow(coDashboard_Page.tblSearchResultHeader,coDashboard_Page.tblSearchResultBody,lstSearchResult,"Customer Search","CUSTOMER TYPE",False,False)
	Wait(2)
	strActualVal = Trim(Ucase(coDashboard_Page.eleCustomerSegment.GetROProperty("innertext"))) 
	If strActualVal = Trim(Ucase(strSegmentType)) Then
		VerifyCustomerSegment = True
		LogMessage "RSLT","Verification","As expected Customer Segement " & Ucase(strSegmentType) & " displayed in top of Customer overview page.",True
	Else
		VerifyCustomerSegment = False 
		LogMessage "WARN","Verification","Failed: Customer Segement not displaying as expected." & ", Expected: " &strSegmentType& " Actual: " &strActualVal,False
	End If
End Function

'[Verify homepage display based on search criteria]
Public Function VerifydisplayCustomerSearch(strItem)
bVerifytext = False
Set odesc_Cell = Description.Create
odesc_Cell("xpath").value = ".//*[@id='errorTitle_h6']"

Set objErrortext = coDashboard_Page.lblHomepage.ChildObjects(odesc_Cell)	  
	
If objErrortext.Count = 0  Then
   LogMessage "RSLT","Verification","No Error Found for Search:"&strItem ,True
   bVerifytext = True 
Else 
	 If Instr(Ucase(objErrortext(0).GetROProperty("innertext")),"ERROR") > 0 Then 
		LogMessage "WARN","Verification","Error Found for Search:"&strItem , False
		bVerifytext = False 
	 Else
		LogMessage "WARN","Verification","Error Found for Search:"&strItem& "not displayed with proper text", False
		bVerifytext = False
	 End IF	
End If	

VerifydisplayCustomerSearch = bVerifytext
End Function
