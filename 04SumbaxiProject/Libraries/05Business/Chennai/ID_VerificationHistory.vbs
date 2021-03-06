'[Select From Date using Date Picker in Verification History]
Public Function SelectFromDate_VH(strFromDate)
bverifyDate = True

If Not IsNull(strFromDate) Then

	If Trim(strFromDate) = "TODAY" Then
	   strFromDate = Date()
	End If
	
	SelectFromDate_VH =  SelectDateFromIDCalendar(coOverview_VH_Page.txtFromDate,strFromDate)
	strExpFromDate = Right("0" & Datepart("d",strFromDate),2) &" "& MonthName(Right("0" & Datepart("m",strFromDate),2))&" " & Year(strFromDate)
	
	If SelectFromDate_VH Then
	
		strActFromDate = coOverview_VH_Page.txtFromDate.GetROProperty("value")
		strActFromDate = Right("0" & Datepart("d",strActFromDate),2) &" "& MonthName(Right("0" & Datepart("m",strActFromDate),2))&" " & Year(strActFromDate)
		
		If Trim(strActFromDate) = Trim(strExpFromDate) Then
		   LogMessage "RSLT","Verification","Selected date "&strFromDate&" in From date text box is displayed as expected", True
		   bverifyDate = True 
		Else
		   bverifyDate = False 
		End If	
		
	End If

End If

SelectFromDate_VH = bverifyDate
End Function

'[Select TO Date using Date Picker in Verification History]
Public Function SelectTODate_VH(strTODate)
bverifyDate = True 

If Not IsNull(strTODate) Then

	If Trim(strTODate) = "TODAY" Then
	   strTODate = Date()
	End If
	
	SelectTODate_VH =  SelectDateFromIDCalendar(coOverview_VH_Page.txtToDate,strTODate)
	StrExpToDate = Right("0" & Datepart("d",strTODate),2) &" "& MonthName(Right("0" & Datepart("m",strTODate),2))&" " & Year(strTODate)
	
	If SelectTODate_VH Then
	
		strActTODate = coOverview_VH_Page.txtToDate.GetROProperty("value")
		strActTODate = Right("0" & Datepart("d",strActTODate),2) &" "& MonthName(Right("0" & Datepart("m",strActTODate),2))&" " & Year(strActTODate)
		
		If Trim(strActTODate) = Trim(StrExpToDate) Then
		   LogMessage "RSLT","Verification","Selected date "&strTODate&" in TO date text box is displayed as expected", True
		   bverifyDate = True 
		Else
		  bverifyDate = False 
		End If	
		
	End If

End IF

SelectTODate_VH = bverifyDate
End Function

'[Verify display of Submit button in Verification History]
Public Function VerifyButtonSubmit_VH(strCheckFlag)
bVerifyButtonSubmit = False
bVerifyButtonSubmit = VerifyObjectEnabledDisabled(coOverview_VH_Page.btnSubmit,strCheckFlag,"Submit Button")
VerifyButtonSubmit_VH = bVerifyButtonSubmit	
End Function

'[Click on Submit Button in Verification History]
Public Function clickButtonSubmitVH()
 coOverview_VH_Page.btnSubmit.click 
  If Err.Number <> 0 Then
      clickButtonSubmitVH = False
      LogMessage "WARN","Verification","Failed to Click Button : Submit", False
      Exit Function
  End If
  WaitForIServeLoading
  clickButtonSubmitVH = True
End Function

'[Verify Inline error message displayed in Verification History]
Public Function VerifyInlineErrorMsg_VH(strErrorMsg)
bverifyInlineErrorMsg = True
If not VerifyInnerText(coOverview_VH_Page.lblInlineMsg(), strErrorMsg, "Inline Date Error") Then
   bverifyInlineErrorMsg = False
End If
VerifyInlineErrorMsg_VH = bverifyInlineErrorMsg
End Function

'[Enter Verified By OR Completion Date and Time in textbox]
Public Function SetVerByOrCompleteDate_VH(StrNameOrDate)
	SetVerByOrCompleteDate_VH = SetEditBoxInsideTable(coOverview_VH_Page.txtVerByOrCompDate(),StrNameOrDate)
End Function

'[Verify Pagination for table displayed in Verification History Page]
Public Function Verifypagination_VH()
	bVerify = False
	Set tblObj = coOverview_VH_Page.tblVerifyHistory()
	strcolumnname = "VERIFICATION ID"
	strRows = 10
	'gObjIServePage.RunScript("document.getElementsByTagName('isrv-routing-proxy')[0].scrollTop = 1000000")
	Wait(1)
	bVerify = VerifytblPagination(tblObj,strcolumnname,strRows,"Verification History")		
    Verifypagination_VH = bVerify
End Function

'[Verify records displayed in Verification History Summary table based on VerifiedBy Or Completion Date]
Public Function VerifyResultsdisplayed_VH(StrExpValue)
 VerifyResultsdisplayed_VH = VerifySearchRecordsdisplayed(coOverview_VH_Page.tblVerifyHistoryHeader,coOverview_VH_Page.tblVerifyHistoryBody,"VERIFIED BY / COMPLETION DATE AND TIME",StrExpValue)
End Function

'[Select on row displayed in the results table in VH]
Public Function ClickTableRow_VH(lstRowData)
ClickTableRow_VH = SelectTableRow(coOverview_VH_Page.tblVerifyHistoryHeader,coOverview_VH_Page.tblVerifyHistoryBody,lstRowData,"Verification History","VERIFICATION ID",False,False)
End Function

'[Verify fields and Values displayed in Verification History Page]
Public Function VerifyIDLabelVals_VH(arrLblValPairs,strAccordianName)
	bVerify=True
	If Not IsNull(arrLblValPairs) Then
	If Not IsNull(strAccordianName) Then
		Select Case strAccordianName
			Case "Summary"
			Set objField = coOverview_VH_Page.lblSummaryAccordian()
			Case "ID Questions"
			Set objField = coOverview_VH_Page.lblIDQuestions()
			Case "AU Questions"
			Set objField = coOverview_VH_Page.lblAuQuestions()
			Case "Custom Questions"
			Set objField = coOverview_VH_Page.lblCustomQuestions()
		End Select
	End If
	bVerify = VerifyIDLabelValuePairsRandom(objField,arrLblValPairs,"Verification History",strAccordianName)		
End If
	VerifyIDLabelVals_VH = bVerify
End Function

'[Verify Record count displayed in Verification History Table]
Public Function VerifyIARecordCount_VH(strCount)
bVerifyRecordCount = False

strDisplayedMsgtext = coOverview_VH_Page.lblRecordCount.GetRoProperty("innertext")
strMsgText = strCount&" Results Found"

	If Instr(1,strDisplayedMsgtext,strMsgText,1) > 0 Then 
	   LogMessage "WARN","Verification","Record Count text message is displayed as expected", True
	   bVerifyRecordCount = True
	Else 
	   LogMessage "WARN","Verification","Record Count text message is not displayed as expected", False
	   bVerifyRecordCount = False	
	End IF 
	
VerifyIARecordCount_VH = bVerifyRecordCount
End Function

'[Verify Table Single Row Data in Verification History]
Public Function VerifyTableRowData_VH(lstlstRARowData)
	VerifyTableRowData_VH = VerifyTableSingleRowData(coOverview_VH_Page.tblVerifyHistoryHeader(),coOverview_VH_Page.tblVerifyHistoryBody,lstlstRARowData,"Verification History")	
End Function

'[Verify Message displayed]
Public Function VerifyMsg_VH(strErrorMsg)
bverifyMsg = True
If not VerifyInnerText(coOverview_VH_Page.lblNorecords(), strErrorMsg, "No Records - VH") Then
   bverifyMsg = False
End If
VerifyMsg_VH = bverifyMsg
End Function

'[Verify Maximum no of Rows displayed on Verification History from Overview Page]
Public Function VerifyPanelRowsInVH_Overview(strNoOfRows)
bVerifyPanelRow = False
Set TotalRowsPanel = SetObjPanelRowVH(coOverview_VH_Page.lblOverviewVH)	
	ActualNoOfRows = TotalRowsPanel.Count
	If ActualNoOfRows <> 0 Then
		If Trim(ActualNoOfRows) <= Trim(strNoOfRows) Then
		   LogMessage "RSLT","Verification","Maximum No of Rows displayed in the panel is less than or equal to "&strNoOfRows&"",True
		   bVerifyPanelRow = True 
		Else
		   LogMessage "WARN","Verification","Maximum No of Rows displayed in the panel is greater than or not equal to "&strNoOfRows&"",False
		   bVerifyPanelRow = False 
		End If
	Else
	LogMessage "WARN","Verification","No Records found for Interaction Activities panel to verify" ,False
 	End If
VerifyPanelRowsInVH_Overview = bVerifyPanelRow
Set TotalRowsPanel = Nothing
End Function

'[Verify VerificationHistory Information in Customer Overview page]
Public Function VerifyVHAdditionalInfo_Overview(strPassFailCnt, strStatus, strDateTime)
bVerifyVHAdditionalInfo = False
Set ObjPanelHeader = coOverview_VH_Page.lblOverviewVH
Set ObjPanel = SetObjPanelRowVH(ObjPanelHeader)
	ActualNoOfRows = ObjPanel.Count
	strExpRowVal = Ucase(Trim(strPassFailCnt+" "+strStatus+" "+strDateTime))
 If IsNull(strExpRowVal) Then
 	VerifyVHAdditionalInfo_Overview = False
 	LogMessage "RSLT","Warn","Verification History Data "&strExpRowVal&" not found in the table panel displayed",False
 	Exit Function
 End If
 If ActualNoOfRows <> 0 Then	 
	 For i  = 0 To ActualNoOfRows-1 Step 1			 
		 StrActRowVal = Ucase(Trim(ObjPanel(i).GetRoProperty("innertext")))
		 If Instr(1,StrActRowVal,strExpRowVal)>0 Then
		 	LogMessage "RSLT","Verification","Verification History Data "&strExpRowVal&" found in the table panel displayed",True
			bVerifyVHAdditionalInfo = True	
		 	Exit For
		 End If 	
	 Next
  End IF	
VerifyVHAdditionalInfo_Overview = bVerifyVHAdditionalInfo
Set ObjPanelHeader = Nothing
Set ObjPanel = Nothing	
End Function

'[Click on VerificationHistory Pass Count displayed in grid panel overview page]
Public Function ClickRowVH_Overview(strPassFailCnt, strStatus, strDateTime)
 bVerifyVH = False
Set ObjPanelHeader = coOverview_VH_Page.lblOverviewVH
Set ObjPanel = SetObjPanelRowVH(ObjPanelHeader)
	ActualNoOfRows = ObjPanel.Count
	strExpRowVal = Ucase(Trim(strPassFailCnt+" "+strStatus+" "+strDateTime))
 If IsNull(strExpRowVal) Then
 	ClickRowVH_Overview = False
 	LogMessage "RSLT","Warn","Verification History Data "&strExpRowVal&" not found in the table panel displayed",False
 	Exit Function
 End If
 If ActualNoOfRows <> 0 Then	 
	 For i  = 0 To ActualNoOfRows-1 Step 1			 
		 StrActRowVal = Ucase(Trim(ObjPanel(i).GetRoProperty("innertext")))
		 If Instr(1,StrActRowVal,strExpRowVal)>0 Then
		 	ObjPanel(i).Click
		 	If Err.Number <> 0 Then
		 		LogMessage "RSLT","Warn","Unable to click on Row and error "&Err.Number&" displayed",False
		 	Else
		 		LogMessage "RSLT","Verification","Clicked on Verification History '"+strExpRowVal+"' Row",True
				bVerifyVH = True
		 	End If
		 	Exit For
		 End If 	
	 Next
  End IF	
ClickRowVH_Overview = bVerifyVH
Set ObjPanelHeader = Nothing
Set ObjPanel = Nothing
End Function

Public Function SetObjPanelRowVH(ObjPanelHeader)	
Set oDesc1 = Description.Create
	oDesc1("micclass").Value = "WebElement"
	oDesc1("class").value= ".*verifyhist-class"
Set SetObjPanelRowVH = ObjPanelHeader.ChildObjects(oDesc1)	 
End Function



