'Step Functions to be created
'[When I Click SR Shortcut Button "Block Card"]
Public Function clickSRShortcutButton(strButtonToClick)
	Set oDesc=Description.Create
		oDesc("micclass").Value = "WebElement"
		'oDesc("class").Value = "content-sheet-footer"
		oDesc("xpath").Value = "//*[contains(@class,'md-tab-content') and contains(@class,'md-active') and contains(@class,'has-is-footer')]"
		Set obj= Browser("Browser_iCall_Home").Page("iCall_ServiceRequest").ChildObjects(oDesc)
		
		Set oDescFooter=Description.Create
		oDescFooter("micclass").Value = "WebElement"
		oDescFooter("class").Value = "isFooter layout"
		Set objFooter= obj(0).ChildObjects(oDescFooter)
		
		Set oDescBtn=Description.Create
		oDescBtn("micclass").Value = "WebElement"
		'oDescBtn("class").Value = "v-button-caption"
		oDescBtn("class").Value = "ng-binding ng-scope"

		set objBtnSet=objFooter(0).ChildObjects(oDescBtn)
		intBtnCount=objBtnSet.Count
    	Set oDescBtnToClick=Description.Create
		oDescBtnToClick("micclass").Value = "WebElement"
		oDescBtnToClick("class").Value = "ng-binding ng-scope"
		oDescBtnToClick("innertext").Value =""&strButtonToClick
		set objBtnToClick=objFooter(0).ChildObjects(oDescBtnToClick)
		intBtnCount=objBtnToClick.Count
		If intBtnCount=0 Then
			LogMessage "RSLT","Verification","SR Shortcut Button "&strButtonToClick&" not found on "&strLeftMenuName&" page.",false
			verifyShortcutButtons=false
			Exit Function
		else
			objBtnToClick(0).Click
			WaitForIcallLoading
			verifyShortcutButtons=true
			LogMessage "RSLT","Verification","SR Shortcut Button "&strButtonToClick&" clicked from "&strLeftMenuName&" page.",true
		End If
	clickSRShortcutButton=verifyShortcutButtons
End Function

'[Customer Overview page is displayed]
Public Function CustomerOverviewpageisdisplayed()
CustomerOverviewpageisdisplayed=cCustomerOverview.pageExists
End Function

'***********************Below Step Function not implemented. Please Check for Step scentence for rearragements*****************************
'[Verify Page Displayed]
Public Function VerifyPageDisplayed(strPageName)
'TODO: This Step Function Needs to be implemented
End Function

'[User Clicks SR Shortcut Button ]
Public Function UserClicksSRShortcutButton(strButtonName)
UserClicksSRShortcutButton=clickSRShortcutButton(strButtonName)
End Function
'
'[New SR Tab should be Opened]
Public Function NewSRTabshouldbeOpened()
	NewSRTabshouldbeOpened=selectTab("New SR.*")
End Function
'
'[Related To Combobox value displayed as ]
Public Function RelatedToFieldvaluedisplayedas(strRelatedTo)
	If Not verifyComboSelectItem (ServiceRequest.lstRelatedTo(), strRelatedTo, "Related To")Then
		   RelatedToFieldvaluedisplayedas=false
	else
		RelatedToFieldvaluedisplayedas=true
	End If
	
End Function
'
'[Type Combobox value displayed as ]
Public Function TypeFieldvaluedisplayedas(strType)
	If Not verifyComboSelectItem (ServiceRequest.lstType(), strType, "Type")Then
		   TypeFieldvaluedisplayedas=false
	else
		TypeFieldvaluedisplayedas=true
	End If
End Function
'
'[SubType Combobox value displayed as ]
Public Function SubTypeFieldvaluedisplayedas(strSubType)
	If Not verifyComboSelectItem (ServiceRequest.lstSubType(), strSubType, "Sub Type")Then
		   SubTypeFieldvaluedisplayedas=false
	else
		SubTypeFieldvaluedisplayedas=true
	End If
End Function

'[Account Combobox value displayed as ]
Public Function AccountFieldvaluedisplayedas(strAccountNumber)
	 If Not verifyComboSelectItem (ServiceRequest.lstAccountNo(), strAccountNumber, "Account")Then
	   AccountFieldvaluedisplayedas=false
	 else
		AccountFieldvaluedisplayedas=true
	End If
End Function

'[New SR Tab should be Opened for selected card]
Public Function NewSRTabshouldbeOpenedForSelectedCard(strCardNumber)
   arrCardEnding=Split(strCardNumber,"-")
   strCardEnding=arrCardEnding(Ubound(arrCardEnding))
	NewSRTabshouldbeOpenedForSelectedCard=selectTab("New SR-"&strCardEnding)
End Function

''[User click Service Request tab]
'Public Function clickServiceRequesttab()
'	ServiceRequest.tabServiceRequest().click()
'	WaitForIcallLoading
'	clickServiceRequesttab=true
'End Function

'[Verify Service Request Table displayed]
Public Function VerifyServiceRequestTabledisplayed()
VerifyServiceRequestTabledisplayed=ServiceRequest.tblServiceRequestHeader.Exist(0)
End Function

'[verify SR Table has Columns]
Public Function verifyTablehasColumns(arrColumnList)
   verifyTablehasColumns=verifyTableColumns(ServiceRequest.tblServiceRequestHeader,arrColumnList)
End Function

'[Verify Service Request No. Column displayed SR Number as hyperlink]
Public Function VerifySRNoIsLink()
  If Not  verifyTableCellHasLink(ServiceRequest.tblServiceRequestHeader, ServiceRequest.tblServiceRequestContent,"Service Request","Service Request No",1) Then
	  LogMessage "WARN","Verification","Service request Table does not displayed HyperLink for Column Service request no. column",false
	VerifySRNoIsLink=False
   End If
	VerifySRNoIsLink=True
End Function

'[Verify Created Date/Time in SR Table is displayed in DD MMM YYYY HH:MM Format]
Public Function VerifyCreatedDateTimeFormatinSRTable()
    strActualCreated=getCellTextFor(ServiceRequest.tblServiceRequestHeader, ServiceRequest.tblServiceRequestContent,1, "Created Date/Time")
	strCreatedDatePattern="[0-3][0-9] [A-Z][A-Z][A-Z] [0-2][0-9][0-9][0-9] [0-2][0-9]:[0-9][0-9]"
	If Matchstr(strActualCreated,strCreatedDatePattern) Then
		LogMessage "RSLT","Verification","Created date/time pattern matched with expected pattern DD MMM YYYY HH:MM in SR table",true
		VerifyCreatedDateTimeFormatinSRTable=true
	else
		LogMessage "WARN","Verification","Created date pattern does not matched with Expected pattern DD MMM YYYY, HH:MM Expected: "&strCreatedDatePattern&" , Actual Date displayed in row 1 is "&strActualCreated,false
		VerifyCreatedDateTimeFormatinSRTable=false
	End If
End Function

''[User click Service Request Link]
'Public Function UserclickServiceRequestLink(strSRNumber)
'	UserclickServiceRequestLink=selectTableLink(ServiceRequest.tblServiceRequestHeader, ServiceRequest.tblServiceRequestContent,_
'Array("Service Request No:"&strSRNumber),"Service Requests","Service Request No",true,ServiceRequest.lnkNext,ServiceRequest.lnkNext1,ServiceRequest.lnkPrevious)
'
'End Function

'[Verify SR Details Page is displayed for SR]
Public Function VerifySRDetailsPageisdisplayed(strSRNumber)	
	VerifySRDetailsPageisdisplayed=verifyTabExist("View SR - "&strSRNumber)
End Function

'[Verify in single table page SR table display max 5 records]
Public Function VerifySRTablePageDisplayMax5records()
	VerifySRTablePageDisplayMax5records=verifyTablePaginationRowCount(ServiceRequest.tblServiceRequestHeader, ServiceRequest.tblServiceRequestContent,"Service Request No",5)
End Function

'[Verify Next Link is enabled if more than 5 records exists or it should be disabled]
Public Function VerifyNextLinkEnabledIfMoreThan5RecordsExists(intTotalRecords)
	bDisabled=matchStr(ServiceRequest.lnkNext1.GetROProperty("outerhtml"),"v-disabled")
	If intTotalRecords>5  Then
		If Not bDisabled Then
			LogMessage "RSLT","Verification","Next Link in SR Table  is Enabled as number of records are more than 5",true
			VerifyNextLinkEnabledIfMoreThan5RecordsExists=true
		else
			LogMessage "RSLT","Verification","Next Link in SR Table  is not Enabled as expected even  number of records are more than 5",False
			VerifyNextLinkEnabledIfMoreThan5RecordsExists=false
		End If
	End If
	If intTotalRecords<5  Then
		If  bDisabled Then
			LogMessage "RSLT","Verification","Next Link in SR Table  is Disabled as number of records are less than 5",true
			VerifyNextLinkEnabledIfMoreThan5RecordsExists=true
		else
			LogMessage "RSLT","Verification","Next Link in SR Table  is  not Disabled as ecpected even number of records are less than 5",false
			VerifyNextLinkEnabledIfMoreThan5RecordsExists=false
		End If
	 End If
End Function

'[Verify max 50 records displayed]
Public Function Verifymax50recordsdisplayed()
	Verifymax50recordsdisplayed=verifyTableMaxRowCount(ServiceRequest.tblServiceRequestHeader, ServiceRequest.tblServiceRequestContent,_
"Service Request No",50,"Service Request",true,ServiceRequest.lnkNext,ServiceRequest.lnkNext1,ServiceRequest.lnkPrevious)
End Function

'[User click Info Warn icon if more than 50 records exists]
Public Function ClickInfoWarnIconifMoreThan50RecordsExists(intTotalRecords)
	If intTotalRecords>50 Then
		bcInfoWarning.btn_InfoWarn_Page.click
		waitforICallLoading
		If not bcInfoWarning.txt_InfoMsg_Page.exist(2) Then
			LogMessage "WARN","Verification","Info Warning message does not displayed",false
			ClickInfoWarnIconifMoreThan50RecordsExists=false
		End If
     End If
	ClickInfoWarnIconifMoreThan50RecordsExists=True
End Function

'[verify information message displayed]
Public Function verifyInfoMessagedisplayed(strInfoMessage)
   bDevPending=true
	 bcInfoWarning.txt_InfoMsg_Page.RefreshObject
     strCurrentInfoWarnMessage = bcInfoWarning.txt_InfoMsg_Page.GetROProperty("innertext") 'Get the info message
	 bInfoMsgMatch = matchStr(Ucase(Trim(strCurrentInfoWarnMessage)), Ucase(Trim(strInfoMessage))) 'check the expected message exist in the info warn message text
	If bInfoMsgMatch Then
		LogMessage "RSLT","Verification","Infowarn Message displayed as expected",true
		verifyInfoMessagedisplayed=true
	 else
		LogMessage "WARN","Verification","Infowarn Message does not matched with expected. Actual : "&strCurrentInfoWarnMessage&" and Expected "&strInfoMessage,false
		verifyInfoMessagedisplayed=false
	End If
	bcInfoWarning.btn_InfoWarn_Page_OK.click
	WaitForIcallLoading
End Function

'[Verify Previous Link is disabled]
Public Function VerifyPreviousLinkDisabled()
	VerifyPreviousLinkDisabled=matchStr(ServiceRequest.lnkPrevious1.GetROProperty("outerhtml"),"v-disabled")
End Function

'[Verify Field Name displayed]
Public Function VerifyFieldNamedisplayed(strName)
   bVerifyFieldNamedisplayed=True
	If Not IsNull(strName) Then
		  If Not VerifyInnerText (ServiceRequest.lblName(), strName, "Name")Then
			   bVerifyFieldNamedisplayed=false
			End If
		End If
		VerifyFieldNamedisplayed=bVerifyFieldNamedisplayed
End Function

'[Verify Field CIN & CIN Sufix displayed]
Public Function VerifyFieldCIN_Sufixdisplayed(strCIN)
	If Not IsNull(strCIN) Then
	  If Not VerifyInnerText (ServiceRequest.lblCIN(), strCIN, "CIN")Then
		   VerifyFieldCIN_Sufixdisplayed=false
		   Exit Function
		End If
	End If
		VerifyFieldCIN_Sufixdisplayed=true
End Function

'[Verify Field Segment displayed]
Public Function VerifyFieldSegment(strSegment)
	If Not IsNull(strSegment) Then
	  If Not VerifyInnerText (ServiceRequest.lblSegment(), strSegment, "Segment")Then
		   VerifyFieldSegment=false
		   Exit Function
		End If
	End If
	VerifyFieldSegment=true
End Function

'[Verify Field Related To displayed]
Public Function VerifyFieldRelatedTo(strRelatedTo)
	 bVerifyServiceRequest=true
	If Not IsNull(strRelatedTo) Then
		 If Not verifyComboSelectItem (ServiceRequest.lstRelatedTo(), strRelatedTo, "Related To")Then
		   bVerifyServiceRequest=false
		End If
	 End If
	 VerifyFieldRelatedTo=bVerifyServiceRequest
End Function

'[Verify Field Account Number displayed]
Public Function VerifyFieldAccountNumber(strAccount)
    bVerifyServiceRequest=True
	If Not IsNull(strAccountNumber) Then
	  If Not verifyComboSelectItem (ServiceRequest.lstAccountNo(), strAccountNumber, "Account")Then
		   bVerifyServiceRequest=false
		End If
	End If
	VerifyFieldAccountNumber=bVerifyServiceRequest
End Function

'[Verify Field Type displayed]
Public Function VerifyFieldType(strType)
   bVerifyServiceRequest=true
   If not isNull(strType) Then
		If Not verifyComboSelectItem (ServiceRequest.lstType(), strType, "Type")Then
		   bVerifyServiceRequest=false
		End If
   End If
	VerifyFieldType=bVerifyServiceRequest
End Function

'[Verify Field SubType displayed]
Public Function VerifyFieldSubType(strSubType)
   bVerifyServiceRequest=true
   If not isNull(strSubType) Then
		If Not verifyComboSelectItem (ServiceRequest.lstSubType(), strSubType, "SubType")Then
		   bVerifyServiceRequest=false
		End If
   End If
	VerifyFieldSubType=bVerifyServiceRequest
End Function

'[Verify Field Product displayed]
Public Function VerifyFieldProduct(strProduct)
	bVerifyServiceRequest=true
	If not isnull(strProduct) Then
		If Not IsNull(strProduct) Then
			  If Not verifyComboSelectItem (ServiceRequest.lstProduct(), strProduct, "Product")Then
				   bVerifyServiceRequest=false
				End If
		End If
	End If
	VerifyFieldProduct=bVerifyServiceRequest
End Function



'[Verify Field Description displayed]
Public Function VerifyFieldDescription(strDescription)
	bVerifyServiceRequest=true
	strDesc_Actual=ServiceRequest.lblDescription.GetROProperty("innertext")
	If not isNull(strDescription) Then
'		strQuery_Desc="Select Distinct d.SR_DESC from cca_prm_sr_relto a, cca_prm_sr_type b,cca_prm_sr_subtype c,cca_prm_sr_other d, cca_prm_sr_icall_c3_intg e where e.Type='"&strRelatedTo&"'  and a.rlt_id= e.rlt_id AND e.area='"&strType&"' and b.rt_id=e.rt_id and e.sub_area='"&strSubType&"' and c.rst_id=e.rst_id and d.OT_id= c.otherparameo_ot_id"
'		strDescription=getDBValForColumn(strQuery_Desc)(0)		
		If trim(strDesc_Actual)=trim(strDescription) Then
			LogMessage "RSLT","Verification","Description "& strDesc_Actual &" displayed successfully as expected",true
		else
			LogMessage "WARN","Verification","Verification Description does not displayed correctly. Expected : "& strDescription &" Actual : " &strDesc_Actual,false
			bVerifyServiceRequest=false
		End If
	End If
	VerifyFieldDescription=bVerifyServiceRequest
End Function


'[Verify Field Comments displayed]
Public Function VerifyFieldComments(strCreatedDate,strAccountNumber,strCreatedBy,strComment)
		bVerifyServiceRequest=true
	  strActualComment= ServiceRequest.txtComment.GetROProperty("innertext")
	  LogMessage "RSLT","Verification","Comment displayed is  "&strActualComment,true
	  If Not IsNull(strCreatedDate) Then
		If Ucase(strCreatedDate)="TODAY" Then
			If len(Day(CDate(Now)))=1 Then
				strDay="0"&Day(CDate(Now))
			else
				strDay=""&Day(CDate(Now))
			End If
			strCreatedDatePattern=""&strDay & " "&monthName(Month(CDate(Now)),true) &" " &Year(CDate(Now))&" ([0-2][0-9]:[0-9][0-9])"
		else
			strCreatedDatePattern=strCreatedDate &" ([0-2][0-9]:[0-9][0-9])"
		End If
		'strDueDate=Split(getVadinCombo_SelectedItem(lblDueDate),":")(0)
		If isnull (strAccountNumber) Then
			strExpectedComment="Created by:"&strCreatedBy&";Date and Time:"&strCreatedDatePattern &";"&strComment
		Else
				strExpectedComment="Created by:"&strCreatedBy&";Date and Time:"&strCreatedDatePattern &";Account No:"&strAccountNumber&";"&strComment
		End If
		If Matchstr(Ucase(strActualComment),strExpectedComment) Then
			LogMessage "RSLT","Verification","Comment pattern matched with expected pattern "&strExpectedComment,true
		else
			LogMessage "WARN","Verification","Comment pattern does not matched with Expected pattern "&strExpectedComment&" , Actual Comment displayed is "&strActualComment,false
			bVerifyServiceRequest=false
		End If
	End If
		VerifyFieldComments=bVerifyServiceRequest
End Function

'[Verify Field AssignedTo displayed]
Public Function VerifyFieldAssignedTo(strAssignedTo)
   bVerifyServiceRequest=true
	If Not IsNull(strAssignedTo) Then
	  If Not verifyComboSelectItem (ServiceRequest.lstAssignTo(), strAssignedTo, "Assigned To")Then
		   bVerifyServiceRequest=false
		End If
	End If
	VerifyFieldAssignedTo=bVerifyServiceRequest
End Function

'[Verify Field Status displayed]
Public Function VerifyFieldStatus(strStatus)
   bVerifyServiceRequest=true
	If Not IsNull(strStatus) Then
	  If Not verifyComboSelectItem (ServiceRequest.lstStatus(), strStatus, "Status")Then
		   bVerifyServiceRequest=false
		End If
	End If
	VerifyFieldStatus=bVerifyServiceRequest
End Function

'[Verify Field Sub Status displayed]
Public Function VerifyFieldSubStatus(strSubStatus)
	 bVerifyServiceRequest=true
	If Not IsNull(strSubStatus) Then
	  If Not verifyComboSelectItem (ServiceRequest.lstSubStatus(), strSubStatus, "Sub-Status")Then
		   bVerifyServiceRequest=false
		End If
	End If
	VerifyFieldSubStatus=bVerifyServiceRequest
End Function

'[Verify Field DueDate displayed in DD MMM YYYY HH:MM format]
Public Function VerifyFieldDueDatePattern()
   bVerifyServiceRequest=true
   strDueDate=getVadinCombo_SelectedItem(ServiceRequest.lblDueDate)
   strDatePattern = "[0-3][0-9] [A-Z][A-Z][A-Z] [0-2][0-9][0-9][0-9] [0-2][0-9]:[0-9][0-9]"' Changed as per defect fixes""
 	If isNull (strDueDate) Then
		LogMessage "WARN","Verification","Due Date does not displayed.",false
		bVerifyServiceRequest=false
	 else
		If Matchstr(Ucase(strDueDate),strDatePattern) Then
			LogMessage "RSLT","Verification","Due date pattern matched with expected pattern DD MMM YYYY HH:MM",true
		else
			LogMessage "WARN","Verification","Due date pattern does not matched with Expected pattern DD MMM YYYY HH:MM , Actual Date displayed is "&strDueDate,false
			bVerifyServiceRequest=false
		End If
	End If
	VerifyFieldDueDatePattern=bVerifyServiceRequest
End Function

'[Verify Field Request Executed displayed]
Public Function VerifyFieldRequestExecuted(strRequestExecuted)
	bVerifyServiceRequest=true
	If Not isNull(strRequestExecuted) Then
		strRequestExecuted_Default=getVadinCombo_SelectedItem(ServiceRequest.lstRequestExecuted)
		If not Matchstr(Ucase(strRequestExecuted),Ucase(strRequestExecuted_Default)) Then
			LogMessage "WARN","Verification","Request Executed drop down is not populated with Expected value.  Expected is :"&strRequestExecuted&" and Actual is :"&strRequestExecuted_Default,false
			bVerifyServiceRequest=false
		else
			 LogMessage "RSLT","Verification","Request Executed drop down is populated with Expected value :"&strRequestExecuted_Default,true
		End If	
	End If
	VerifyFieldRequestExecuted=bVerifyServiceRequest
End Function

'[Verify Field Service Request No displayed]
Public Function VerifyFieldServiceRequestNo(strServiceRequestNo)
   bVerifyServiceRequest=true
 	If Not IsNull(strServiceRequestNo) Then
	  If Not VerifyInnerText (ServiceRequest.lblServiceRequestNo(), strServiceRequestNo, "Service Request No")Then
		   bVerifyServiceRequest=false
		End If
	End If
	VerifyFieldServiceRequestNo=bVerifyServiceRequest
End Function

'[Verify Field Channel displayed]
Public Function VerifyFieldChannel(strChannel)
   bVerifyServiceRequest=true
	If Not IsNull(strChannel) Then
	  If Not VerifyInnerText (ServiceRequest.lblChannel(), strChannel, "Channel")Then
		   bVerifyServiceRequest=false
		End If
	End If
	VerifyFieldChannel=bVerifyServiceRequest
End Function


'
''[Verify Field CreatedDate displayed as]
'Public Function VerifyFieldCreatedDate(strCreatedDate)
'   bVerifyServiceRequest=true
'	strActualCreated=ServiceRequest.lblCreatedDate.GetRoProperty("innertext")
'	If Not IsNull(strCreatedDate) Then
'		If Ucase(strCreatedDate)="TODAY" Then
'			If len(Day(CDate(Now)))=1 Then
'				strDay="0"&Day(CDate(Now))
'			else
'				strDay=""&Day(CDate(Now))
'			End If
'			strCreatedDatePattern=""&strDay & " "&monthName(Month(CDate(Now)),true) &" " &Year(CDate(Now))&" ([0-2][0-9]:[0-9][0-9])"
'		else
'			strCreatedDatePattern=strCreatedDate &" ([0-2][0-9]:[0-9][0-9])"
'		End If
'		If Matchstr(strActualCreated,strCreatedDatePattern) Then
'			LogMessage "RSLT","Verification","Created date pattern matched with expected pattern DD MMM YYYY HH:MM",true
'		else
'			LogMessage "WARN","Verification","Created date pattern does not matched with Expected pattern DD MMM YYYY, HH:MM Expected: "&strCreatedDatePattern&" , Actual Date displayed is "&strActualCreated,false
'			bVerifyServiceRequest=false
'		End If
'	End If
'	VerifyFieldCreatedDate=bVerifyServiceRequest
'End Function
'
'
''[Verify Field Created By displayed as]
'Public Function VerifyFieldCreatedBy(strCreatedBy)
'   bVerifyServiceRequest=true
'	 If Not IsNull(strCreatedBy) Then
'		strCreatedBy_LAN_Id=readFromINIFile(gstrCurrentProjectDir + "\"+gstrProjectName+ "\Config\SR_Screen_Map.ini",  "LAN ID" , strCreatedBy)
'	  If Not VerifyInnerText (ServiceRequest.lblCreatedBy(), strCreatedBy_LAN_Id, "Created By")Then
'		   bVerifyServiceRequest=false
'		End If
'	 End If
'	 VerifyFieldCreatedBy=bVerifyServiceRequest
'End Function
'
''[Verify Field OverDue displayed as]
'Public Function VerifyFieldOverDue(strOverDue)
'   bVerifyServiceRequest=true
'	If Not IsNull(strOverDue) Then
'	  If Not VerifyInnerText (ServiceRequest.lblOverDue(), strOverDue, "Overdue")Then
'		   bVerifyServiceRequest=false
'		End If
'	End If
'	 VerifyFieldOverDue=bVerifyServiceRequest
'End Function
'
''[Verify Field Duration displayed as]
'Public Function VerifyFieldDuration(strDuration)
'   bVerifyServiceRequest=true
'	If Not IsNull(strDuration) Then
'	  If Not VerifyInnerText (ServiceRequest.lblDuration(), strDuration, "Duration")Then
'		   bVerifyServiceRequest=false
'		End If
'	End If
'	VerifyFieldDuration=bVerifyServiceRequest
'End Function
'
''[Verify Field Closed Date displayed as]
'Public Function VerifyFieldClosedDate(strClosedDate)
'   bVerifyServiceRequest=true
'	strActualClosed=ServiceRequest.lblClosedDate.GetRoProperty("innertext")
'	If Not IsNull(strClosedDate) Then
'		If Ucase(strClosedDate)="TODAY" Then
'			If len(Day(CDate(Now)))=1 Then
'				strDay="0"&Day(CDate(Now))
'			else
'				strDay=""&Day(CDate(Now))
'			End If
'			
'			strClosedDate=""&strDay & " "&monthName(Month(CDate(Now)),true) &" " &Year(CDate(Now))&" ([0-2][0-9]:[0-9][0-9])"
'		End If
'
'		If Matchstr(strActualClosed,strClosedDate) Then
'			LogMessage "RSLT","Verification","Closed date pattern matched with expected pattern DD MMM YYYY HH:MM",true
'		else
'			LogMessage "WARN","Verification","Closed date pattern does not matched with Expected pattern DD MMM YYYY, HH:MM Expected: "&strClosedDate&" , Actual Date displayed is "&strActualClosed,false
'			bVerifyServiceRequest=false
'		End If
'	End If
'	VerifyFieldClosedDate=bVerifyServiceRequest
'End Function
'
''[Verify Field Last Updated Date displayed as]
'Public Function VerifyFieldLastUpdatedDate(strLastUpdatedDate)
'   bVerifyServiceRequest=true
'	strActualLastUpdate=ServiceRequest.lblLastUpdateDate.GetRoProperty("innertext")
'	If Not IsNull(strLastUpdatedDate) Then
'		If Ucase(strLastUpdatedDate)="TODAY" Then
'			If len(Day(CDate(Now)))=1 Then
'				strDay="0"&Day(CDate(Now))
'			else
'				strDay=""&Day(CDate(Now))
'			End If
'			strLastUpdatedDate=""&strDay & " "&monthName(Month(CDate(Now)),true) &" " &Year(CDate(Now))&" ([0-2][0-9]:[0-9][0-9])"
'		End If
'	
'		If Matchstr(strActualLastUpdate,strLastUpdatedDate) Then
'			LogMessage "RSLT","Verification","Last Update date pattern matched with expected pattern DD MMM YYYY HH:MM",true
'		else
'			LogMessage "WARN","Verification","Last Update date pattern does not matched with Expected pattern DD MMM YYYY, HH:MM Expected: "&strLastUpdatedDate&" , Actual Date displayed is "&strActualLastUpdate,false
'			bVerifyServiceRequest=false
'		End If
'
'	End If
'		VerifyFieldClosedDate=bVerifyServiceRequest
'End Function
'
''[Verify Field Last Update By displayed as]
'Public Function VerifyFieldLastUpdateBy(strLastUpdatedBy)
'	bVerifyServiceRequest=true
'	If Not IsNull(strLastUpdatedBy) Then
'		strLastUpdatedBy_LAN_Id=""
'		If not strLastUpdatedBy="" Then
'			strLastUpdatedBy_LAN_Id=readFromINIFile(gstrCurrentProjectDir + "\"+gstrProjectName+ "\Config\SR_Screen_Map.ini",  "LAN ID" , strLastUpdatedBy)
'		End If
'	  If Not VerifyInnerText (ServiceRequest.lstLastUpdatedBy(), strLastUpdatedBy_LAN_Id, "Last Updated By")Then
'		   bVerifyServiceRequest=false
'		End If
'	End If
'		VerifyFieldLastUpdateBy=bVerifyServiceRequest
'End Function
'

''***********************Below Step Function not implemented. Please Check for Step scentence for rearragements*****************************
''[Verify Link notes displayed as number of notes]
'Public Function VerifyLinknotesdisplayedasnumberofnotes($NumberofNotes)
''TODO: This Step Function Needs to be implemented
'End Function
'
'
''***********************Below Step Function not implemented. Please Check for Step scentence for rearragements*****************************
''[User Click Notes Link]
'Public Function UserClickNotesLink()
''TODO: This Step Function Needs to be implemented
'End Function
'
'
''***********************Below Step Function not implemented. Please Check for Step scentence for rearragements*****************************
''[Verify Notes Popup Displayed]
'Public Function VerifyNotesPopupDisplayed()
''TODO: This Step Function Needs to be implemented
'End Function
'
'
''***********************Below Step Function not implemented. Please Check for Step scentence for rearragements*****************************
''[Verify Notes Table on Popup has Columns]
'Public Function VerifyNotesTableonPopuphasColumns(Created By|Created Date/Time|Description)
''TODO: This Step Function Needs to be implemented
'End Function
'
'
''***********************Below Step Function not implemented. Please Check for Step scentence for rearragements*****************************
''[Verify Notes list in Notes table on Popup]
'Public Function VerifyNoteslistinNotestableonPopup($NotesList)
''TODO: This Step Function Needs to be implemented
'End Function
'
'
''***********************Below Step Function not implemented. Please Check for Step scentence for rearragements*****************************
''[User Click Link in Description Column]
'Public Function UserClickLinkinDescriptionColumn($Note)
''TODO: This Step Function Needs to be implemented
'End Function
'
'
''***********************Below Step Function not implemented. Please Check for Step scentence for rearragements*****************************
''[Verify Full note details displayed in Expanded Section as]
'Public Function VerifyFullnotedetailsdisplayedinExpandedSectionas($NoteDetails)
''TODO: This Step Function Needs to be implemented
'End Function
'
'
''***********************Below Step Function not implemented. Please Check for Step scentence for rearragements*****************************
''[User Click OK button on popup]
'Public Function UserClickOKbuttononpopup()
''TODO: This Step Function Needs to be implemented
'End Function
'
'
''***********************Below Step Function not implemented. Please Check for Step scentence for rearragements*****************************
''[Verify Notes Popup get closed]
'Public Function VerifyNotesPopupgetclosed()
''TODO: This Step Function Needs to be implemented
'End Function


'***********************Below Step Function not implemented. Please Check for Step scentence for rearragements*****************************
'[User click New Service Request button]
Public Function clickNewSRbutton()
	ServiceRequest.clickNewServiceRequest()
	clickNewSRbutton=true
End Function


'***********************Below Step Function not implemented. Please Check for Step scentence for rearragements*****************************
'[User selects Related To Combo Box]
Public Function SelectsRelatedToComboBox(strRelatedTo)
   bCreateServiceRequest=true
	If not isNull(strRelatedTo) Then
		If not (selectItem_Combobox(ServiceRequest.lstRelatedTo,strRelatedTo))Then
		   LogMessage "WARN","Verification","Failed to select :"&strRelatedTo&" From Related To drop down list",false
			bCreateServiceRequest=false
		End If
	End If
	SelectsRelatedToComboBox=bCreateServiceRequest
End Function


'***********************Below Step Function not implemented. Please Check for Step scentence for rearragements*****************************
'[User Selects from Account No Combo Box]
Public Function SelectsAccountNoComboBox(strAccount)
	 bCreateServiceRequest=true
	If not isNull(strAccount) Then
		If not (selectItem_Combobox(ServiceRequest.lstAccountNo,strAccount))Then
		   LogMessage "WARN","Verification","Failed to select :"&strAccount&" From Account drop down list",false
			bCreateServiceRequest=false
		End If
	End If
	SelectsAccountNoComboBox=bCreateServiceRequest
End Function


'***********************Below Step Function not implemented. Please Check for Step scentence for rearragements*****************************
'[User Selects from Type Combo Box]
Public Function SelectsTypeComboBox(strType)
 bCreateServiceRequest=true
	If not isNull(strType) Then
		If not (selectItem_Combobox(ServiceRequest.lstType,strType))Then
			   LogMessage "WARN","Verification","Failed to select :"&strType&" From Type drop down list",false
				bCreateServiceRequest=false
			End If
	End If
	SelectsTypeComboBox=bCreateServiceRequest
End Function


'***********************Below Step Function not implemented. Please Check for Step scentence for rearragements*****************************
'[User Selects from Sub Type Combo Box] 
Public Function SelectsSubTypeComboBox(strSubType)
	bCreateServiceRequest=true
	If not isNull(strSubType) Then
		If not (selectItem_Combobox(ServiceRequest.lstSubType,strSubType))Then
			   LogMessage "WARN","Verification","Failed to select :"&strSubType&" From Sub Type drop down list",false
				bCreateServiceRequest=false
		End If
	End If
	SelectsTypeComboBox=bCreateServiceRequest
End Function


'***********************Below Step Function not implemented. Please Check for Step scentence for rearragements*****************************
'[User Clicks Go button]
Public Function UserClicksGobutton()
	ServiceRequest.clickGo()
	If err.number<>0 Then
		UserClicksGobutton=false
		Exit Function
	End If
	UserClicksGobutton=true
End Function


'***********************Below Step Function not implemented. Please Check for Step scentence for rearragements*****************************
'[Verify Field Knowledge Base is displayed as link]
Public Function verifyKnowledgeBaselink(strKnowledgeBase)
	bCreateServiceRequest=true
	Set oDesc_KB = Description.Create()
	oDesc_KB("micclass").Value = "Link"
	
	strKBLink=ServiceRequest.lnkKnowledgeBase.ChildObjects(oDesc_KB)(0).GetROProperty("href")
	strRelatedTo=getVadinCombo_SelectedItem(ServiceRequest.lstRelatedTo)
	strType=getVadinCombo_SelectedItem(ServiceRequest.lstType)
	strSubType=getVadinCombo_SelectedItem(ServiceRequest.lstSubType)
	If isNull(strKnoledgeBase) Then
		strQuery_KB="Select Distinct d.Knowledge_Base from cca_prm_sr_relto a, cca_prm_sr_type b,cca_prm_sr_subtype c,cca_prm_sr_other d where a.related_to='"&strRelatedTo&"' and a.rlt_id= b.rlt_id AND b.req_type='"&strType&"'and b.rt_id=c.rt_id and c.req_sub_type='"&strSubType&"'and d.OT_id= c.otherparameo_ot_id"
		strKnoledgeBase=getDBValForColumn(strQuery_KB)(0)
	End If
	If Trim(strKBLink)=Trim(strKnoledgeBase) Then
		LogMessage "RSLT","Verification","Knowledge base Link  "& strKBLink &" displayed successfully as expected",true
	else
		LogMessage "WARN","Verification","Knowledge base Link  does not displayed correctly. Expected : "& strKnoledgeBase &" Actual : " &strKBLink,false
		bCreateServiceRequest=false
	End If
	verifyKnowledgeBaselink=bCreateServiceRequest
End Function


'***********************Below Step Function not implemented. Please Check for Step scentence for rearragements*****************************
'[User Selects from Product Combo Box]
Public Function SelectProductComboBox(strProduct)
	bCreateServiceRequest=true
	If not isNull(strProduct) Then
		If not (selectItem_Combobox(ServiceRequest.lstProduct,strProduct))Then
		   LogMessage "WARN","Verification","Failed to select :"&strProduct&" From Product drop down list",false
			bCreateServiceRequest=false
		  End If
	End If
	SelectProductComboBox=bCreateServiceRequest
End Function


'***********************Below Step Function not implemented. Please Check for Step scentence for rearragements*****************************
'[User Selects from Status Combo Box]
Public Function SelectStatusComboBox(strStatus)
   bCreateServiceRequest=true
	If not isNull(strStatus) Then
		If not (selectItem_Combobox(ServiceRequest.lstStatus,strStatus))Then
		   LogMessage "WARN","Verification","Failed to select :"&strStatus&" From Status drop down list",false
			bCreateServiceRequest=false
		  End If
	End If
	SelectStatusComboBox=bCreateServiceRequest
End Function


'***********************Below Step Function not implemented. Please Check for Step scentence for rearragements*****************************
'[User Selects from Sub Status Combo Box]
Public Function SelectSubStatusComboBox(strSubStatus)
 bCreateServiceRequest=true
	If not isNull(strSubStatus) Then
		If not (selectItem_Combobox(lstSubStatus,strSubStatus))Then
		   LogMessage "WARN","Verification","Failed to select :"&strSubStatus&" From Sub Status drop down list",false
			bCreateServiceRequest=false
		  End If
	End If
	SelectStatusComboBox=bCreateServiceRequest
End Function

'
''***********************Below Step Function not implemented. Please Check for Step scentence for rearragements*****************************
''[User Selects from Request Executed Combo Box]
'Public Function SelectRequestExecutedComboBox($Request Executed)
''TODO: This Step Function Needs to be implemented
'End Function
'
'
''***********************Below Step Function not implemented. Please Check for Step scentence for rearragements*****************************
''[User Set Check Box Once & Done as]
'Public Function UserSetCheckBoxOnce&Doneas($Unchecked)
''TODO: This Step Function Needs to be implemented
'End Function
'
'
''***********************Below Step Function not implemented. Please Check for Step scentence for rearragements*****************************
''[User Set Comments as]
'Public Function UserSetCommentsas($Comments)
''TODO: This Step Function Needs to be implemented
'End Function
'
'
''***********************Below Step Function not implemented. Please Check for Step scentence for rearragements*****************************
''[User Clicks Add Notes button]
'Public Function UserClicksAddNotesbutton()
''TODO: This Step Function Needs to be implemented
'End Function
'
'
''***********************Below Step Function not implemented. Please Check for Step scentence for rearragements*****************************
''[Verify Notes Pop up is displayed]
'Public Function VerifyNotesPopupisdisplayed()
''TODO: This Step Function Needs to be implemented
'End Function
'
'
''***********************Below Step Function not implemented. Please Check for Step scentence for rearragements*****************************
''[User Set notes text box to]
'Public Function UserSetnotestextboxto($Notes)
''TODO: This Step Function Needs to be implemented
'End Function
'
'
''***********************Below Step Function not implemented. Please Check for Step scentence for rearragements*****************************
''[Uset Clicks Save button]
'Public Function UsetClicksSavebutton()
''TODO: This Step Function Needs to be implemented
'End Function
'
'
''***********************Below Step Function not implemented. Please Check for Step scentence for rearragements*****************************
''[Verify Notes Popup get closed]
'Public Function VerifyNotesPopupgetclosed()
''TODO: This Step Function Needs to be implemented
'End Function
'
'
''***********************Below Step Function not implemented. Please Check for Step scentence for rearragements*****************************
''[User clicks Submit button]
'Public Function UserclicksSubmitbutton()
''TODO: This Step Function Needs to be implemented
'End Function
'
'
''***********************Below Step Function not implemented. Please Check for Step scentence for rearragements*****************************
''[Verify a Pop up is displayed as]
'Public Function VerifyaPopupisdisplayedas(Request Submitted Successfully)
''TODO: This Step Function Needs to be implemented
'End Function
'
'
''***********************Below Step Function not implemented. Please Check for Step scentence for rearragements*****************************
''[Verify Reference ID displayed]
'Public Function VerifyReferenceIDdisplayed($ReferenceID)
''TODO: This Step Function Needs to be implemented
'End Function
'
'
''***********************Below Step Function not implemented. Please Check for Step scentence for rearragements*****************************
''[Verify Progress Status displayed]
'Public Function VerifyProgressStatusdisplayed($ProgressStatus)
''TODO: This Step Function Needs to be implemented
'End Function
'
'
''***********************Below Step Function not implemented. Please Check for Step scentence for rearragements*****************************
''[Verify Service Request ID displayed]
'Public Function VerifyServiceRequestIDdisplayed($ServiceRequestID)
''TODO: This Step Function Needs to be implemented
'End Function
'
'
''***********************Below Step Function not implemented. Please Check for Step scentence for rearragements*****************************
''[User Clicks 'Close' button on pop up]
'Public Function UserClicks'Close'buttononpopup()
''TODO: This Step Function Needs to be implemented
'End Function
'
'
''***********************Below Step Function not implemented. Please Check for Step scentence for rearragements*****************************
''[Verify Popup is closed]
'Public Function VerifyPopupisclosed()
''TODO: This Step Function Needs to be implemented
'End Function
'
'
''***********************Below Step Function not implemented. Please Check for Step scentence for rearragements*****************************
''[Verify Customer Overview Page displayed]
'Public Function VerifyCustomerOverviewPagedisplayed()
''TODO: This Step Function Needs to be implemented
'End Function
'

'
