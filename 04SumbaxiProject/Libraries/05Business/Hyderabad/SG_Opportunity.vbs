'[User Click on the Opportunity Icon in overview page in the right Panel]
Public Function ClickOpportunityIcon()
	Wait 1
	Opportunity.IconOpportunity.Click		
		If Err.Number<>0 Then
		ClickOpportunityIcon=false
		    LogMessage "WARN","Verification","Failed to Click Icon : Oppurtunity in Overview Page" ,false
		Exit Function
		End If
		WaitForICallLoading
   ClickOpportunityIcon= True
End Function

'[Verify default status value in Oppurtunity Page displayed as]
Public Function verifyDefaultStatus_Opp(strStatus)
   bDevPending=false
   bverifyDefaultStatus_Opp=true
   If Not IsNull(strStatus) Then
       If Not verifyComboSelectItem(Opportunity.StatusDropdown(),strStatus, "Status")Then
       	  LogMessage "WARN","Verification","Default Status value doesnt match with expected value" ,false
          bverifyDefaultStatus_Opp=false
       End If
   End If
   verifyDefaultStatus_Opp=bverifyDefaultStatus_Opp
End Function

'[Verify list of values displayed in Status dropdown]
Public Function verifyOpportunityStatus(lstStatus)
   bverifyOpportunityStatus=true
   If Not IsNull(lstStatus) Then
       If Not verifyComboboxItems(Opportunity.StatusDropdown(),lstStatus, "OppStatus")Then
           bverifyOpportunityStatus=false
       End If
   End If
   verifyOpportunityStatus=bverifyOpportunityStatus
End Function

'[Select value from Opportunity Status combobox as]
Public Function selectOpportunityStatus(strStatus)
   bselectOpportunityStatus=true
   If Not IsNull(strStatus) Then
       If Not (selectItem_Combobox(Opportunity.StatusDropdown(), strStatus))Then
            LogMessage "WARN","Verification","Failed to select :"&strControlName&" From status drop down list" ,false
           bselectOpportunityStatus=false
       End If
   End If
   WaitForICallLoading
   selectOpportunityStatus=bselectOpportunityStatus
End Function

'[Enter Opportunity Number in text box as]
 Public Function SetOpportunityNumber(strOppNo)
 bSetOpportunityNumber = True
 	If Not IsNull(strOppNo) Then
 	   SetOppNumber = Opportunity.txtOpportunityNo.Set(strOppNo)
 	   LogMessage "RSLT","Verification","Successfully entered Opportunity Number in the text field" ,True
 	   bSetOpportunityNumber = True
	End If 
	SetOpportunityNumber = bSetOpportunityNumber
 End Function
 
'[Enter CampaignCode in text box field as]
 Public Function EnterCampaignCode_Opp(strCampaignCode)
 bSetCampaignCode_Opp = False
 	If Not IsNull(strCampaignCode) Then
 	   SetCampaignCode = Opportunity.txtCampaignCode.Set(strCampaignCode)
 	   LogMessage "RSLT","Verification","Successfully entered Campaign Code in the text field" ,True
 	   bSetCampaignCode_Opp = True
	End If 
	EnterCampaignCode_Opp = bSetCampaignCode_Opp
 End Function
 
'[Verify From and To dates range in Opportunity Page]
Public Function verifyDefaultDateRange_Opp()
    bverifyDefaultDateRange_Opp=True
	strActFromDate=Opportunity.txtFrom.GetROProperty("value")
	strActToDate = Opportunity.txtTo.GetROProperty("value")
	DaysRange = DateDiff("d", strActFromDate, strActToDate)
	If DaysRange = 30  Then
	   LogMessage "RSLT","Verification","From and To Dates are displayed within 30 days range" ,True
	   bverifyDefaultDateRange_Opp = True 
	Else 
	   bverifyDefaultDateRange_Opp = False 
	End If
   verifyDefaultDateRange_Opp = bverifyDefaultDateRange_Opp
End Function

'[Set From and To Date using Calendar Icon in Opportunity page]
Public Function SetFromDateFromCalendar_Opp(strFromDate, strToDate)
    bverifyDefaultDateRange_Opp=True
	Set oDesc=Description.Create    
    oDesc("xpath").Value= "//*[@id='"&FieldValue&"']/div[1]/md-icon"
    'set objCalendar = Browser("Browser_iCall_Home").Page("iCall_Opportunity").ChildObjects(oDesc)
    set objCalendar = Browser("micclass:=Browser").Page("micclass:=Page").ChildObjects(oDesc1)
    objCalendar(0).click
   	'read the values after setting them
	arrRunTimeValues(intCounter) = strDate
	LogMessage "RSLT","Verification","Values set as "&arrRunTimeValues(intCounter) ,True			
	selectdate=selectDateFromCalendar(objCalendar(0),strFromDate)
End Function

'[Verify Filter Button enabled in Oppurtunity Page]
Public Function VerifybtnFilter_Opp()
   	bverifybtnFilter=true
   	intBtnFilter=Instr(Opportunity.btnFilter.GetROproperty("outerhtml"),("v-disabled"))
	If  intBtnFilter=0 Then
		LogMessage "RSLT","Verification","Filter button is enabled as expected.",True
		bverifybtnFilter=true
	Else
		LogMessage "WARN","Verifiation","Filter button is disabled.",false
		bverifybtnFilter=false
	End If
	VerifybtnFilter_Opp=bverifybtnFilter
End Function

'[Click Button Filter in Opportunity Page]
Public Function clickButtonFilter_Opp()
   Opportunity.btnFilter.click 10,10,0 
   If Err.Number<>0 Then
       clickButtonFilter_Opp=false
            LogMessage "WARN","Verification","Failed to Click Button : Filter" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickButtonFilter_Opp= True
End Function

'[Verify Pagination for the Opportunity table displayed]
Public Function ValidatePagination_OppDetailstable()
 bValidatePagination_OppDetailstable=true
 bNextPageExist = True
	While bNextPageExist = True
	 intRecordCount = getRecordsCountForColumn(Opportunity.tblOppHeader,Opportunity.tblOppContent,"Opportunity No.")	
	 iCheck = 5 
		If intRecordCount <=iCheck  Then
	     LogMessage "RSLT","Verification","Number of records displayed per page matched with expected. Expected Count is less than or equal to "&iCheck, true   
	     bValidatePagination_OppDetailstable=true
		 If intRecordCount < iCheck Then
		   	bNextPageExist =matchStr(Opportunity.lnkNext.GetROProperty("class"),"enabled")
			If bNextPageExist Then
			LogMessage "WARN","Verification","Next link expected to be disabled if record is less than "&iCheck&". Currently it is enabled.",false
			bValidatePagination_OppDetailstable=false
			Else
			LogMessage "RSLT","Verification","Next link is disabled as per expectation.",true
			End If
		ElseIf intRecordCount = iCheck Then
			bNextPageExist = matchStr(Opportunity.lnkNext.GetROProperty("class"),"enabled")
			If bNextPageExist Then
			   Opportunity.lnkNext.Click
			End If
		End If
		Else 
			LogMessage "RSLT","Verification","Number of records displayed per page not matched with expected. Expected Count is less than or equal to 5", false   
			bNextPageExist = False
		End If
   Wend
   ValidatePagination_OppDetailstable = bValidatePagination_OppDetailstable
End Function

'[Verify display of tooltip message for the Search fields in Opportunity Page]
Function VerifydisplayToolTip(strExpectedMsg)
   bVerifydisplayToolTip = True 
   Setting.WebPackage("ReplayType")=2 
   Opportunity.txtCampaignCode.FireEvent("onmouseover")
   Opportunity.txtCampaignCode.mouseover
	'Create object for the tooltip by finding the object in the page 
	Set oDesc = Description.Create
	oDesc("html tag").value = "MD-TOOLTIP"
	Set toolTip = Browser("Browser_iCall_Home").Page("micclass:=Page").childobjects(oDesc)
	    strActualMsg = toolTip(0).GetRoProperty("innertext")  
    	strExpectedMsg = Replace(strExpectedMsg,"@","=")
    If Trim(strExpectedMsg) = Trim(strActualMsg) Then    	
       LogMessage "RSLT","Verification","Tooltip message on mouse hover field is displayed as expected",True
       bVerifydisplayToolTip = True 
    Else
      LogMessage "WARN","Verification","Tooltip message on mouse hover field is not displayed as expected",False
      bVerifydisplayToolTip = False 
    End If
	Setting.WebPackage("ReplayType")=1
	VerifydisplayToolTip = bVerifydisplayToolTip
End Function

'[Verify inline error message displayed for Invalid date fields entered]
Public Function VerifyInlineErrorMsg_Opp(strErrorMsg)
	bverifyInlineErrorMsg_Opp=true
	If not VerifyInnerText(opportunity.lblInlineMessage(), strErrorMsg, "Inline Date Error") Then
       bverifyInlineErrorMsg_Opp=false
	End If
	VerifyInlineErrorMsg_Opp=bverifyInlineErrorMsg_Opp
End Function

'[Verify inline error message displayed for invalid search]
Public Function verifyInvalidMsg_Opp(strErrorMsg)
	bverifyInvalidMsg_Opp=true
	If not VerifyInnerText(opportunity.lblInvalidMsg(), strErrorMsg, "Invalid Error") Then
       bverifyInvalidMsg_Opp=false
	End If
	verifyInvalidMsg_Opp=bverifyInvalidMsg_Opp
End Function

'[Verify Validation Message displayed for Invalid OppNumber]
Public Function verifypopupMesasge_Opp(strMessage)
	bverifypopupMesasge_Opp=true
	If not VerifyInnerText(opportunity.lblPopUpmessage(), strMessage, "Selected Opportunity does not belongs to this customer.") Then
       bverifypopupMesasge_Opp=false
	End If
	Opportunity.btnOK.Click
	verifypopupMesasge_Opp=bverifypopupMesasge_Opp
End Function

'[Verify table records displayed on Search using opportunity Number]
Public Function VerifySearchResults_Opp(strOpp)
   bVerifySearchResults_Opp = True
   intRecordCount = getRecordsCountForColumn(Opportunity.tblOppHeader,Opportunity.tblOppContent,"Opportunity No.")	
   For i = 0 To intRecordCount - 1
		Set objAllRows=getAllRows(Opportunity.tblOppContent)
		strTableOppNo=getCellTextFor(Opportunity.tblOppHeader,objAllRows(i),i,"Opportunity No.")
		If Ucase(Trim(strTableOppNo)) =  Ucase(Trim(strOpp))Then
		LogMessage "RSLT","Verification","Opportunity Number in table displayed based on the searched Opp Number",True
		bVerifySearchResults_Opp = True
		Else
		LogMessage "WARN","Verification","Opportunity Number in table not displayed based on the searched Opp Number",False	
		bVerifySearchResults_Opp = False
		End IF 			
	Next 
End Function 

'[Verify table records displayed based on Search Criteria]
Public Function Verifytablerecords_Opp(strCampaignCode, Strstatus, strFromDate, strToDate)
   bVerifytablerecords_Opp = True
   intRecordCount = getRecordsCountForColumn(Opportunity.tblOppHeader,Opportunity.tblOppContent,"Opportunity No.")	
   For i = 0 To intRecordCount - 1
		Set objAllRows=getAllRows(Opportunity.tblOppContent)
		strTableOppNo=getCellTextFor(Opportunity.tblOppHeader,objAllRows(i),i,"Opportunity No.")
		strTableCampaignCode=getCellTextFor(Opportunity.tblOppHeader,objAllRows(i),i,"Campaign Code")
		strTableStatus=getCellTextFor(Opportunity.tblOppHeader,objAllRows(i),i,"Status")
		strTableCreatedOn=getCellTextFor(Opportunity.tblOppHeader,objAllRows(i),i,"Created On")		
		
		If Not IsNull (strCampaignCode) Then		
			If Ucase(Trim(strTableCampaignCode)) =  Ucase(Trim(strCampaignCode)) Then
			LogMessage "RSLT","Verification","Campaign Code in table displayed based on the searched Campaign Code",True
			Else
			LogMessage "WARN","Verification","Campaign Code in table not displayed based on the searched Campaign Code",False	
			End IF 	
		End If
		
		If Not IsNull (Strstatus) Then	
			If Strstatus = "ALL" Then
				If Trim(strTableStatus) =  "Lost" OR Trim(strTableStatus)= "Won" OR Trim(strTableStatus) = "Open" Then
				LogMessage "RSLT","Verification","Status in table displayed based on the searched Status value",True
				Else
				LogMessage "WARN","Verification","Status in table not displayed based on the searched Status value",False	
				End IF 			
			Else If Ucase(Trim(Strstatus))  = Ucase(Trim(strTableStatus)) Then
				LogMessage "RSLT","Verification","Status in table displayed based on the searched Status value",True
				Else
				LogMessage "WARN","Verification","Status in table not displayed based on the searched Status value",False					
				End IF 		
			End IF
		End If
			
		If Not IsNull(strToDate) Then
			strFromDate = setFromDate_Opp(strFromDate)
			strToDate = setToDate_Opp(strToDate)
			ActualCreatedOn = FormatDateTime(strTableCreatedOn,vbShortDate)
			DaysRange = DateDiff("d", strFromDate, ActualCreatedOn)
			DaysRange1 = DateDiff("d", ActualCreatedOn, strToDate)
			If DaysRange < 0 Or DaysRange1 < 0  Then
			   LogMessage "RSLT","Verification","Records displayed is not between the From and To Date" ,False
			Else 
			   LogMessage "WARN","Verification","Records displayed between the From and To Date" ,True
			End If
		End If
   Next 
 End Function
 
'[Verify Opportunity and Campaign details displayed based on Opp Number selected from table]
Public Function VerifyOppdetails_ClickOppNo()
 bNextPageExist = True
 While bNextPageExist = True
 intRecordCount = getRecordsCountForColumn(Opportunity.tblOppHeader,Opportunity.tblOppContent,"Opportunity No.")	
	For i = 0 To intRecordCount - 1
		Set objAllRows=getAllRows(Opportunity.tblOppContent)
		strTableOppNo=getCellTextFor(Opportunity.tblOppHeader,objAllRows(i),i,"Opportunity No.")
		strTableCampaignCode=getCellTextFor(Opportunity.tblOppHeader,objAllRows(i),i,"Campaign Code")
		strTableStatus=getCellTextFor(Opportunity.tblOppHeader,objAllRows(i),i,"Status")
		strTableCreatedOn=getCellTextFor(Opportunity.tblOppHeader,objAllRows(i),i,"Created On")

		Call clickVaddinLink_tblCell (Opportunity.tblOppHeader,Opportunity.tblOppContent,i, "Opportunity No.")		
		lblOppNo = Opportunity.lblOppNo.GetROProperty("innertext")	
		lblCampaignCode = Opportunity.lblCampaignCode.GetROProperty("innertext")
		lblStatus = Opportunity.lblOppStatus.GetROProperty("innertext")
		lblCreatedOn = Opportunity.lblCreatedOn.GetROProperty("innertext")
			
		If Ucase(Trim(strTableOppNo)) =  Ucase(Trim(lblOppNo))Then
		LogMessage "RSLT","Verification","Opportunity Number displayed based on tthe Opportunity Number selected in table",True
		Else
		LogMessage "WARN","Verification","Opportunity Number not displayed based on tthe Opportunity Number selected in table",False	
		End IF 
		
		If  Ucase(Trim(strTableCampaignCode)) =  Ucase(Trim(lblCampaignCode)) Then
		LogMessage "RSLT","Verification","Campaign Code displayed below the Campaign Details section as per the Opportunity Number selected in table",True
		Else
		LogMessage "WARN","Verification","Campaign Code not displayed below the Campaign Details section as per the Opportunity Number selected in table",False	
		End IF 
		
		IF Ucase(Trim(strTableStatus)) =  Ucase(Trim(lblStatus)) Then
		LogMessage "RSLT","Verification","Opportunity Status displayed below the Customer Response section  as per the Opportunity Number selected in table",True
		Else
		LogMessage "WARN","Verification","Opportunity Status not displayed below the Customer Response section  as per the Opportunity Number selected in table",False	
		End IF
		
		IF Ucase(Trim(strTableCreatedOn)) =  Ucase(Trim(lblCreatedOn)) Then
		LogMessage "RSLT","Verification","Created On displayed below the Opportunity details section in the right panel as per the Opportunity Number selected in table",True
		Else
		LogMessage "WARN","Verification","Created On not displayed below the Opportunity details section in the right panel as per the Opportunity Number selected in table",False	
		End IF
	Next
		bNextPageExist = matchStr(Opportunity.lnkNext.GetROProperty("class"),"enabled")
		If bNextPageExist Then
		   Opportunity.lnkNext.Click
		Else 
		   bNextPageExist = False
		End If
	Wend
End Function

'[Click on Refresh Icon in Pink Panel and verify page refreshed]
Public Function VerifyRefreshIcon_Opp()
bVerifyRefreshIcon_Opp = True  
 intRecordCount = getRecordsCountForColumn(Opportunity.tblOppHeader,Opportunity.tblOppContent,"Opportunity No.")	
 If intRecordCount <> 0 Then
 	Call clickVaddinLink_tblCell (Opportunity.tblOppHeader,Opportunity.tblOppContent,0, "Opportunity No.")
 	lblOppNo = Opportunity.lblOppNo.GetROProperty("innertext")	
 	If lblOppNo <> "" Then
 	   Opportunity.RefreshIcon().Click	
 	   Wait 1
 	   lblCurrentOppNo = Opportunity.lblOppNo.GetROProperty("innertext")	
 	   If lblCurrentOppNo <> "" Then
 	   	  LogMessage "WARN","Verification","Page not refreshed as expected on Click of Refresh Icon in Pink Panel",False	
 	   	  bVerifyRefreshIcon_Opp = False
 	   End If
 	End If
 End If	 
 VerifyRefreshIcon_Opp = bVerifyRefreshIcon_Opp
End Function

Public Function VerifyOpportunityDetails(strOppNo,lstOppDetails,strDetailsHeader,strProspect,strChannel,strPdtType,StrPdtName,strPdtLevel1,strRefBU,strRefSource,strRefStaffID ,strCreatedBy,strCreatedOn,strModifiedBy,strModifiedOn,strLastAssignDate,strClosedBU,strClosedBy,strClosedDate)
 bVerifyOpportunityDetails= True 
   VerifyOppDetailstable=verifyTableContentList(Opportunity.tblOppHeader,Opportunity.tblOppContent,lstOppDetails,"Opportunity Details table",false,null,null,null)
   If VerifyOppDetailstable = True Then
      clickOpportunityNumber=selectTableLink(Opportunity.tblOppHeader,Opportunity.tblOppContent,Array("Opportunity No.:"&strOppNo),"Opportunity Details table","Opportunity No.",true,null,null,null)	    
   End IF 
End Function

'[Verify the Prospect Opportunity table details displayed]
Public Function VerifyProspectOpptable(lstlstProspecttable)
	WaitForICallLoading
	VerifyProspectOpptable=verifyTableContentList(Prospects.tblProspectsHeader,Prospects.tblProspectsContent,lstlstProspecttable,"Prospect Opportunity Details",false,null,null,null)
End Function

'[Verify Campaign details displayed in Opportunity page]
Public Function VerifyCampaignDetails(strOppNo,strCampaignHeader,strCampaignCode,strCampaignDes,strCampaignStartDate,strCampaignEndDate)
	  bVerifyCampaigndetails = True
	  strActOppNo = Opportunity.lblOppNo.GetROProperty("innertext")			
	  strActLabelName = Opportunity.lblheadercampaign.GetROProperty("innertext")
	  strActCampaignCode = Opportunity.lblCampaignCode.GetROProperty("innertext")			
	  strActCampaignDesc = Opportunity.lblCampaignDescription.GetROProperty("innertext")
	  strActCampaignStartDate = Opportunity.lblCampaignStartDate.GetROProperty("innertext")			
	  strActCampaignEndDate = Opportunity.lblCampaignEndDate.GetROProperty("innertext")	
  	  		
  	 'Compare the values from Iserve below Campaign Details section with the values provided in the data sheet
	  If Ucase(Trim(strOppNo)) = Ucase(Trim(strActOppNo)) Then  	  	 
	      If Ucase(Trim(strCampaignHeader)) = Ucase(Trim(strActLabelName)) Then
		  LogMessage "RSLT","Verification","Campaign details header displayed with expected labelname Expected: "&strCampaignHeader&" Actual: "&strActLabelName&"",True
		  Else
		  LogMessage "WARN","Verification","Campaign details header not displayed with expected labelname Expected: "&strCampaignHeader&" Actual: "&strActLabelName&"",False	
		  End IF   	 
		  
		  ' If campaign code is populated in CRM , the Campaign Description , Campaign Start date and End Date will be displayed 
		  If Not IsNull(strCampaignCode) Then 
			  If Ucase(Trim(strCampaignCode)) = Ucase(Trim(strActCampaignCode)) Then
			  LogMessage "RSLT","Verification","Campaign Code value displayed as Expected. Expected: "&strCampaignCode&" Actual: "&strActCampaignCode&"",True
			  Else
			  LogMessage "WARN","Verification","Campaign Code value not displayed as Expected. Expected: "&strCampaignCode&" Actual: "&strActCampaignCode&"",False	
			  bVerifyCampaigndetails = False
		  	  Exit Function 
			  End IF 
	
			  If Ucase(Trim(strCampaignDes)) = Ucase(Trim(strActCampaignDesc)) Then
			  LogMessage "RSLT","Verification","Campaign Description displayed as expected. Expected: "&strCampaignDes&" Actual: "&strActCampaignDesc&"",True
			  Else
			  LogMessage "WARN","Verification","Campaign Description not displayed as expected.Expected: "&strCampaignDes&" Actual: "&strActCampaignDesc&"",False	
			  bVerifyCampaigndetails = False
		  	  Exit Function
			  End IF
			  
			  If Ucase(Trim(strCampaignStartDate)) = Ucase(Trim(strActCampaignStartDate)) Then
			  LogMessage "RSLT","Verification","Campaign Start Date and time displayed as expected. Expected: "&strCampaignStartDate&" Actual: "&strActCampaignStartDate&"",True
			  Else
			  LogMessage "WARN","Verification","Campaign Start Date and time not displayed as expected. Expected: "&strCampaignStartDate&" Actual: "&strActCampaignStartDate&"",False	
			  bVerifyCampaigndetails = False
		  	  Exit Function
			  End IF 
			  
		      If Ucase(Trim(strCampaignEndDate)) = Ucase(Trim(strActCampaignEndDate)) Then
			  LogMessage "RSLT","Verification","Campaign End Date and time displayed as expected. Expected: "&strCampaignEndDate&" Actual: "&strActCampaignEndDate&"",True
			  Else
			  LogMessage "WARN","Verification","Campaign End Date and time not displayed as expected. Expected: "&strCampaignEndDate&" Actual: "&strActCampaignEndDate&"",False	
			  bVerifyCampaigndetails = False
		  	  Exit Function
			  End IF  
			  ' If Campaign code is blank then the other campaign fields should be displayed Blank 
		 Else    
			  IF Ucase(Trim(strActCampaignDesc)) = "" AND Ucase(Trim(strActCampaignStartDate)) = "" AND Ucase(Trim(strActCampaignEndDate)) = "" Then 
			  LogMessage "RSLT","Verification","Campaign details are displayed Blank when the campaign code is Blank as expected",True
			  Else
			  LogMessage "WARN","Verification","Campaign details are not Blank when the campaign code is Blank",False	
			  bVerifyCampaigndetails = False
		  	  Exit Function
			  End IF 
		 End IF
	 End IF 
	VerifyCampaignDetails =  bVerifyCampaigndetails
End Function

'[Verify Customer Response details displayed in Opportunity page]
Public Function VerifyCustomerResponseDetails(strOppNo,strCRHeader,strCallOutcome,strResponseType,strStatus,strStatusReason)
	  bVerifyCustomerResponse = True
	  strActOppNo = Opportunity.lblOppNo.GetROProperty("innertext")			
	  strActLabelName = Opportunity.lblheaderCR.GetROProperty("innertext")
	  strActCallOutcome = Opportunity.lblCallOutcome.GetROProperty("innertext")			
	  strActResponseType = Opportunity.lblResponseType.GetROProperty("innertext")	
	  strActOpportunityStatus = Opportunity.lblOppStatus.GetROProperty("innertext")	  
	  strActStatusReason = Opportunity.lblStatusReason.GetROProperty("innertext")	
  	  		
  	 'Compare the values from Iserve below Customer Response section with the values provided in the data sheet
	  If Ucase(Trim(strOppNo)) = Ucase(Trim(strActOppNo)) Then
	 		  If Ucase(Trim(strCRHeader)) = Ucase(Trim(strActLabelName)) Then
			  LogMessage "RSLT","Verification","Customer Response header displayed with expected labelname Expected: "&strCRHeader&" Actual: "&strActLabelName&"",True
			  Else
			  LogMessage "WARN","Verification","Customer Response header not displayed with expected labelname Expected: "&strCRHeader&" Actual: "&strActLabelName&"",False	
			  bVerifyCustomerResponse = False
			  Exit Function
			  End IF   	 
			  
			  If Not IsNull(strActCallOutcome) Then
				  If Ucase(Trim(strCallOutcome)) = Ucase(Trim(strActCallOutcome)) Then
				  LogMessage "RSLT","Verification","Call Outcome value displayed as Expected. Expected: "&strCallOutcome&" Actual: "&strActCallOutcome&"",True
				  Else
				  LogMessage "WARN","Verification","Call Outcome value not displayed as Expected. Expected: "&strCallOutcome&" Actual: "&strActCallOutcome&"",False	
				  bVerifyCustomerResponse = False
			      Exit Function
				  End IF 
			  End If
			  	 
		  	  If Not IsNull(strResponseType) Then
			      If Ucase(Trim(strResponseType)) = Ucase(Trim(strActResponseType)) Then
				  LogMessage "RSLT","Verification","Reponse Type value displayed as expected. Expected: "&strResponseType&" Actual: "&strActResponseType&"",True
				  Else
				  LogMessage "WARN","Verification","Reponse Type value not displayed as expected.Expected: "&strResponseType&" Actual: "&strActResponseType&"",False	
				  bVerifyCustomerResponse = False
			      Exit Function
				  End IF  
			  End IF 
			  
			  If Not IsNull(strStatus) Then
				  If Ucase(Trim(strStatus)) = Ucase(Trim(strActOpportunityStatus)) Then
				  LogMessage "RSLT","Verification","Opportunity status value displayed as expected. Expected: "&strStatus&" Actual: "&strActOpportunityStatus&"",True
				  Else
				  LogMessage "WARN","Verification","Opportunity status value not displayed as expected. Expected: "&strStatus&" Actual: "&strActOpportunityStatus&"",False	
				  bVerifyCustomerResponse = False
			      Exit Function				  
				  End IF 
			  End IF  
		  	 
			  If Not IsNull(strStatusReason) Then
			      If Ucase(Trim(strStatusReason)) = Ucase(Trim(strActStatusReason)) Then
				  LogMessage "RSLT","Verification","Stauts reason value displayed as expected. Expected: "&strStatusReason&" Actual: "&strActStatusReason&"",True
				  Else
				  LogMessage "WARN","Verification","Stauts reason value not displayed as expected. Expected: "&strStatusReason&" Actual: "&strActStatusReason&"",False	
				  bVerifyCustomerResponse = False
			      Exit Function
			  End IF  
			  End IF
       End IF 	  	 
VerifyCustomerResponseDetails = bVerifyCustomerResponse       
End Function

'[Verify Dates and Assigned to fieldvalues in Opportunity details Page displayed]
Public Function VerifyProspectOpp_Dates(strOppNo,strCreatedBy,strCreatedOn, strModifiedBy,strModifiedOn,strLastAssignDate,strClosedBU,strClosedBy,strClosedDate)
	  strActOppNo = Opportunity.lblOppNo.GetROProperty("innertext")		
	  strActCreatedBy = Opportunity.lblCreatedBy.GetROProperty("innertext")			
	  strActCreatedOn= Opportunity.lblCreatedOn.GetROProperty("innertext")
	  strActModifiedBy= Opportunity.lblModifiedBy.GetROProperty("innertext")			
	  strActModifiedOn = Opportunity.lblModifiedOn.GetROProperty("innertext")	
	  strActLastAssignedDate = Opportunity.lblLastAssignedDate.GetROProperty("innertext")			
	  strActClosedByBU= Opportunity.lblCLosedByBU.GetROProperty("innertext")
	  strActClosedBy= Opportunity.lblCLosedBy.GetROProperty("innertext")			
	  strActClosedDate = Opportunity.lblCLosedDate.GetROProperty("innertext")
	  
	  If Ucase(Trim(strOppNo)) = Ucase(Trim(strActOppNo)) Then
	  	If Not IsNull(strCreatedBy) Then
			If Ucase(Trim(strCreatedBy)) = Ucase(Trim(strActCreatedBy)) Then
			LogMessage "RSLT","Verification","Created By value matched with the expected Value Expected: "&strCreatedBy&" Actual: "&strActCreatedBy&"",True
			Else
			LogMessage "WARN","Verification","Created By value doesnt match with the expected Value Expected: "&strCreatedBy&" Actual: "&strActCreatedBy&"",False	
			End IF 			
		End IF 
		If Not IsNull(strCreatedOn) Then
			If Ucase(Trim(strCreatedOn)) = Ucase(Trim(strActCreatedOn)) Then
			LogMessage "RSLT","Verification","Created On value matched with the expected Value Expected: "&strCreatedOn&" Actual: "&strActCreatedOn&"",True
			Else
			LogMessage "WARN","Verification","Created On value doesnt match with the expected Value Expected: "&strCreatedOn&" Actual: "&strActCreatedOn&"",False	
			End IF 			
		End IF 
		If Not IsNull(strModifiedBy) Then
			If Ucase(Trim(strModifiedBy)) = Ucase(Trim(strActModifiedBy)) Then
			LogMessage "RSLT","Verification","Modified By value matched with the expected Value Expected: "&strModifiedBy&" Actual: "&strActModifiedBy&"",True
			Else
			LogMessage "WARN","Verification","Modified By value doesnt match with the expected Value Expected: "&strModifiedBy&" Actual: "&strActModifiedBy&"",False	
			End IF 			
		End IF 
		If Not IsNull(strModifiedOn) Then
			If Ucase(Trim(strModifiedOn)) = Ucase(Trim(strActModifiedOn)) Then
			LogMessage "RSLT","Verification","Modified On value matched with the expected Value Expected: "&strModifiedOn&" Actual: "&strActModifiedOn&"",True
			Else
			LogMessage "WARN","Verification","Modified On value doesnt match with the expected Value Expected: "&strModifiedOn&" Actual: "&strActModifiedOn&"",False	
			End IF 
		End IF 	
		If Not IsNull(strLastAssignDate) Then
			If Ucase(Trim(strLastAssignDate)) = Ucase(Trim(strActLastAssignedDate)) Then
			LogMessage "RSLT","Verification","Last Assigned Date value matched with the expected Value Expected: "&strLastAssignDate&" Actual: "&strActLastAssignedDate&"",True
			Else
			LogMessage "WARN","Verification","Last Assigned Date value doesnt match with the expected Value Expected: "&strLastAssignDate&" Actual: "&strActLastAssignedDate&"",False	
			End IF 			
		End IF 
		If Not IsNull(strClosedBU) Then
			If Ucase(Trim(strClosedBU)) = Ucase(Trim(strActClosedByBU)) Then
			LogMessage "RSLT","Verification","Closed by BU value matched with the expected Value Expected: "&strClosedBU&" Actual: "&strActClosedByBU&"",True
			Else
			LogMessage "WARN","Verification","Closed by BU value doesnt match with the expected Value Expected: "&strClosedBU&" Actual: "&strActClosedByBU&"",False	
			End IF 		
		End IF 
		If Not IsNull(strClosedBy) Then
			If Ucase(Trim(strClosedBy)) = Ucase(Trim(strActClosedBy)) Then
			LogMessage "RSLT","Verification","Closed by value matched with the expected Value Expected: "&strClosedBy&" Actual: "&strActClosedBy&"",True
			Else
			LogMessage "WARN","Verification","Closed by value doesnt match with the expected Value Expected: "&strClosedBy&" Actual: "&strActClosedBy&"",False	
			End IF 			
		End IF 
		If Not IsNull(strClosedDate) Then
			If Ucase(Trim(strClosedDate)) = Ucase(Trim(strActClosedDate)) Then
			LogMessage "RSLT","Verification","Closed Date value matched with the expected Value Expected: "&strClosedDate&" Actual: "&strActClosedDate&"",True
			Else
			LogMessage "WARN","Verification","Closed Date value doesnt match with the expected Value Expected: "&strClosedDate&" Actual: "&strActClosedDate&"",False	
			End IF 	
		End IF 
	End IF	
End Function

'[Verify Opportunity details displayed in Opportunity page]
Public Function Verifyfieldsdisplayed_Oppdetails(strOppNo,strDetailsHeader,strProspect,strChannel,strPdtType,StrPdtName,strPdtLevel1,strRefBU,strRefSource,strRefStaffID ,strCreatedBy,strCreatedOn,strModifiedBy,strModifiedOn,strLastAssignDate,strClosedBU,strClosedBy,strClosedDate)	
	  bVerifyOpportunitydetails = True
      'Click on Opp Number in the table displayed 
      If IsNull(strProspect) Then
      'Ucase(Trim(strProspect)) = "BLANK" OR Ucase(Trim(strProspect)) = "NULL"  OR Ucase(Trim(strProspect)) = "" Then
      	clickOpportunityNumber=selectTableLink(Opportunity.tblOppHeader,Opportunity.tblOppContent,Array("Opportunity No.:"&strOppNo),"Opportunity Details table","Opportunity No.",true,null,null,null)	    
      Else 
      	clickOpportunityNumber=selectTableLink(Prospects.tblProspectsHeader,Prospects.tblProspectsContent,Array("Prospect ID:"&strProspect),"Opportunity Details table","Prospect ID",true,null,null,null)	    
      End If
      
      ' get the field values from the Opportunity page 
	  strActOppNo = Opportunity.lblOppNo.GetROProperty("innertext")			
	  strActHeadername = Opportunity.lblheaderOppDetails.GetROProperty("innertext")
	  strActProspect = Opportunity.lblProspect.GetROProperty("innertext")			
	  strActChannel= Opportunity.lblChannel.GetROProperty("innertext")
	  strActProductType= Opportunity.lblProductType.GetROProperty("innertext")			
	  strActProductName = Opportunity.lblProductName.GetROProperty("innertext")	
	  strActProductLevel1 = Opportunity.lblProdLevel1.GetROProperty("innertext")			
	  strActReferralBU= Opportunity.lblReferralBU.GetROProperty("innertext")
	  strActReferralSource= Opportunity.lblReferralSource.GetROProperty("innertext")			
	  strActReferralStaffID = Opportunity.lblReferralStaffID.GetROProperty("innertext")		
	  strActCreatedBy = Opportunity.lblCreatedBy.GetROProperty("innertext")			
	  strActCreatedOn= Opportunity.lblCreatedOn.GetROProperty("innertext")
	  strActModifiedBy= Opportunity.lblModifiedBy.GetROProperty("innertext")			
	  strActModifiedOn = Opportunity.lblModifiedOn.GetROProperty("innertext")	
	  strActLastAssignedDate = Opportunity.lblLastAssignedDate.GetROProperty("innertext")			
	  strActClosedByBU= Opportunity.lblCLosedByBU.GetROProperty("innertext")
	  strActClosedBy= Opportunity.lblCLosedBy.GetROProperty("innertext")			
	  strActClosedDate = Opportunity.lblCLosedDate.GetROProperty("innertext")	
		
  	 'Compare the values from Iserve below Opportunity Details section with the values provided in the data sheet
		If Ucase(Trim(strOppNo)) = Ucase(Trim(strActOppNo)) Then
		LogMessage "RSLT","Verification","Opportunity Number displayed as Selected in the table Expected: "&strOppNo&" Actual: "&strActOppNo&"",True
		Else
		LogMessage "WARN","Verification","Opportunity Number not displayed as Selected in the table Expected: "&strOppNo&" Actual: "&strActOppNo&"",False	
		bVerifyOpportunitydetails = False
		Exit Function
		End IF 	
		
		If Ucase(Trim(strDetailsHeader)) = Ucase(Trim(strActHeadername)) Then
		LogMessage "RSLT","Verification","Opportunity details header is displayed with expected labelname Expected: "&strDetailsHeader&" Actual: "&strActHeadername&"",True
		Else
		LogMessage "WARN","Verification","Opportunity details header is not displayed with expected labelname Expected: "&strDetailsHeader&" Actual: "&strActHeadername&"",False	
		bVerifyOpportunitydetails = False
		Exit Function
		End IF 	
		
		If Not IsNull(strProspect) Then
			If Ucase(Trim(strProspect)) = Ucase(Trim(strActProspect)) Then
			LogMessage "RSLT","Verification","Prospect ID is displayed as expected Value Expected: "&strProspect&" Actual: "&strActProspect&"",True
			Else
			LogMessage "WARN","Verification","Prospect ID is not displayed as expected Value  Expected: "&strProspect&" Actual: "&strActProspect&"",False	
			bVerifyOpportunitydetails = False
			Exit Function
			End IF 	
		End IF
		
		If Ucase(Trim(strChannel)) = Ucase(Trim(strActChannel)) Then
		LogMessage "RSLT","Verification","Channel value is displayed as expected. Expected: "&strChannel&" Actual: "&strActChannel&"",True
		Else
		LogMessage "WARN","Verification","Channel value is not displayed as expected.Expected: "&strChannel&" Actual: "&strActChannel&"",False	
		End IF 	
		
		If Ucase(Trim(strPdtType)) = Ucase(Trim(strActProductType)) Then
		LogMessage "RSLT","Verification","Product Type value matched with the expected Value Expected: "&strPdtType&" Actual: "&strActProductType&"",True
		Else
		LogMessage "WARN","Verification","Product Type value doesnt match with the expected Value Expected: "&strPdtType&" Actual: "&strActProductType&"",False	
		bVerifyOpportunitydetails = False
		Exit Function
		End IF 			
		
		If Ucase(Trim(StrPdtName)) = Ucase(Trim(strActProductName)) Then
		LogMessage "RSLT","Verification","Product Name value matched with the expected Value Expected: "&StrPdtName&" Actual: "&strActProductName&"",True
		Else
		LogMessage "WARN","Verification","Product Name value doesnt match with the expected Value Expected: "&StrPdtName&" Actual: "&strActProductName&"",False	
		bVerifyOpportunitydetails = False
		Exit Function
		End IF 			
				
		If Ucase(Trim(strPdtLevel1)) = Ucase(Trim(strActProductLevel1)) Then
		LogMessage "RSLT","Verification","Product Level1 value matched with the expected Value Expected: "&strPdtLevel1&" Actual: "&strActProductLevel1&"",True
		Else
		LogMessage "WARN","Verification","Product Level1 value doesnt match with the expected Value Expected: "&strPdtLevel1&" Actual: "&strActProductLevel1&"",False	
		bVerifyOpportunitydetails = False
		Exit Function
		End IF 			
		
		If Ucase(Trim(strRefBU)) = Ucase(Trim(strActReferralBU)) Then
		LogMessage "RSLT","Verification","Referral BU field value matched with the expected Value Expected: "&strRefBU&" Actual: "&strActReferralBU&"",True
		Else
		LogMessage "WARN","Verification","Referral BU field value doesnt match with the expected Value Expected: "&strRefBU&" Actual: "&strActReferralBU&"",False	
		bVerifyOpportunitydetails = False
		Exit Function
		End IF 			
		
		If Ucase(Trim(strRefSource)) = Ucase(Trim(strActReferralSource)) Then
		LogMessage "RSLT","Verification","Referral Source field value matched with the expected Value Expected: "&strRefSource&" Actual: "&strActReferralSource&"",True
		Else
		LogMessage "WARN","Verification","Referral Source field value doesnt match with the expected Value Expected: "&strRefSource&" Actual: "&strActReferralSource&"",False	
		bVerifyOpportunitydetails = False
		Exit Function
		End IF 			
		
		If Ucase(Trim(strRefStaffID)) = Ucase(Trim(strActReferralStaffID)) Then
		LogMessage "RSLT","Verification","Referral Staff ID value matched with the expected Value Expected: "&strRefStaffID&" Actual: "&strActReferralStaffID&"",True
		Else
		LogMessage "WARN","Verification","Referral Staff ID value doesnt match with the expected Value Expected: "&strRefStaffID&" Actual: "&strActReferralStaffID&"",False	
		bVerifyOpportunitydetails = False
		Exit Function
		End IF 			

		If Ucase(Trim(strCreatedBy)) = Ucase(Trim(strActCreatedBy)) Then
		LogMessage "RSLT","Verification","Created By value matched with the expected Value Expected: "&strCreatedBy&" Actual: "&strActCreatedBy&"",True
		Else
		LogMessage "WARN","Verification","Created By value doesnt match with the expected Value Expected: "&strCreatedBy&" Actual: "&strActCreatedBy&"",False	
		bVerifyOpportunitydetails = False
		Exit Function
		End IF 			
		
		If Ucase(Trim(strCreatedOn)) = Ucase(Trim(strActCreatedOn)) Then
		LogMessage "RSLT","Verification","Created On value matched with the expected Value Expected: "&strCreatedOn&" Actual: "&strActCreatedOn&"",True
		Else
		LogMessage "WARN","Verification","Created On value doesnt match with the expected Value Expected: "&strCreatedOn&" Actual: "&strActCreatedOn&"",False	
		bVerifyOpportunitydetails = False
		Exit Function
		End IF 			
		
		If Ucase(Trim(strModifiedBy)) = Ucase(Trim(strActModifiedBy)) Then
		LogMessage "RSLT","Verification","Modified By value matched with the expected Value Expected: "&strModifiedBy&" Actual: "&strActModifiedBy&"",True
		Else
		LogMessage "WARN","Verification","Modified By value doesnt match with the expected Value Expected: "&strModifiedBy&" Actual: "&strActModifiedBy&"",False	
		bVerifyOpportunitydetails = False
		Exit Function
		End IF 			
		
		If Ucase(Trim(strModifiedOn)) = Ucase(Trim(strActModifiedOn)) Then
		LogMessage "RSLT","Verification","Modified On value matched with the expected Value Expected: "&strModifiedOn&" Actual: "&strActModifiedOn&"",True
		Else
		LogMessage "WARN","Verification","Modified On value doesnt match with the expected Value Expected: "&strModifiedOn&" Actual: "&strActModifiedOn&"",False	
		bVerifyOpportunitydetails = False
		Exit Function
		End IF 				
		
		If Ucase(Trim(strLastAssignDate)) = Ucase(Trim(strActLastAssignedDate)) Then
		LogMessage "RSLT","Verification","Last Assigned Date value matched with the expected Value Expected: "&strLastAssignDate&" Actual: "&strActLastAssignedDate&"",True
		Else
		LogMessage "WARN","Verification","Last Assigned Date value doesnt match with the expected Value Expected: "&strLastAssignDate&" Actual: "&strActLastAssignedDate&"",False	
		bVerifyOpportunitydetails = False
		Exit Function
		End IF 			

		If Ucase(Trim(strClosedBU)) = Ucase(Trim(strActClosedByBU)) Then
		LogMessage "RSLT","Verification","Closed by BU value matched with the expected Value Expected: "&strClosedBU&" Actual: "&strActClosedByBU&"",True
		Else
		LogMessage "WARN","Verification","Closed by BU value doesnt match with the expected Value Expected: "&strClosedBU&" Actual: "&strActClosedByBU&"",False	
		bVerifyOpportunitydetails = False
		Exit Function
		End IF 		
		
		If Ucase(Trim(strClosedBy)) = Ucase(Trim(strActClosedBy)) Then
		LogMessage "RSLT","Verification","Closed by value matched with the expected Value Expected: "&strClosedBy&" Actual: "&strActClosedBy&"",True
		Else
		LogMessage "WARN","Verification","Closed by value doesnt match with the expected Value Expected: "&strClosedBy&" Actual: "&strActClosedBy&"",False	
		bVerifyOpportunitydetails = False
		Exit Function
		End IF 			
		
		If Ucase(Trim(strClosedDate)) = Ucase(Trim(strActClosedDate)) Then
		LogMessage "RSLT","Verification","Closed Date value matched with the expected Value Expected: "&strClosedDate&" Actual: "&strActClosedDate&"",True
		Else
		LogMessage "WARN","Verification","Closed Date value doesnt match with the expected Value Expected: "&strClosedDate&" Actual: "&strActClosedDate&"",False	
		bVerifyOpportunitydetails = False
		Exit Function
		End IF 	
	Verifyfieldsdisplayed_Oppdetails = 	bVerifyOpportunitydetails
End Function 

'**********************************************************************************************************************************************'
				'++++++++++++++++++++++++++++++++++++ TO be deleted++++++++++++++++++++++++++++++++++++++++
''[to be deleted- Verify table records displayed on Search using CampaignCode]
'Public Function VerifySearchResults_CampaignCode(strCampaignCode)
'	bVerifySearchResults_CampaignCode = True
'   	intRecordCount = getRecordsCountForColumn(Opportunity.tblOppHeader,Opportunity.tblOppContent,"Opportunity No.")	
'   For i = 0 To intRecordCount - 1
'		Set objAllRows=getAllRows(Opportunity.tblOppContent)
'		strTableCampaignCode=getCellTextFor(Opportunity.tblOppHeader,objAllRows(i),i,"Campaign Code")
'		If Ucase(Trim(strTableCampaignCode)) =  Ucase(Trim(strCampaignCode)) Then
'		LogMessage "RSLT","Verification","Campaign Code in table displayed based on the searched Campaign Code",True
'		bVerifySearchResults_CampaignCode = True
'		Else
'		LogMessage "WARN","Verification","Campaign Code in table not displayed based on the searched Campaign Code",False	
'		bVerifySearchResults_CampaignCode = False
'		End IF 
'	Next
'End Function
'
''[Verify tool tip displayed on clicking field name Opportunity]
'Public Function Verifytooltip()
'' Mouseover the object.
'	Opportunity.txtOpportunityNo.Click	
'' Wait a second to allow the tooltip to be displayed. 
'	wait 1
'' Capture the text of the tooltip object
' txt= Window("class:=ng-isolate-scope md-show").GetROProperty( "text")
'End Function
'
'
'''[Set To Date using Calendar Icon in Opportunity page]
''Public Function SetTODateFromCalendar_Opp()
''    bverifyDefaultDateRange_Opp=True
''	strActFromDate=Opportunity.txtFrom.GetROProperty("value")
''	strActToDate = Opportunity.txtTo.GetROProperty("value")
''	DaysRange = DateDiff("d", strActFromDate, strActToDate)
''	If DaysRange = 30  Then
''	   LogMessage "RSLT","Verification","Successfully entered Campaign Code in the text field" ,True
''	   bverifyDefaultDateRange_Opp = True 
''	Else 
''	   bverifyDefaultDateRange_Opp = False 
''	End If
''   verifyDefaultDateRange_Opp=bverifyDefaultDateRange_Opp
''End Function
