'[Click Tab in Dashboard]
Public Function ClickTabInDashBoard(strTabName)
  ClickTabInDashBoard = ClickTab(strTabName)
  
End Function

'[Verify Recent Applications Tab Exists below to the Dashboard]
Public Function IsTabExistDashboard()
  IsTabExist = False
		
	Set oDescTab = Description.Create
	oDescTab("class").Value = "mat-tab-list"
	oDescTab("micClass").Value = "WebTabStrip"
	Set objtablist = gObjIServePage.ChildObjects(oDescTab)
	
	Set oTabCaption = Description.Create
	oTabCaption("class").Value = "mat-tab-label.*"
	oTabCaption("micClass").value = "WebElement"
	Set oTabCaption = objtablist(0).ChildObjects(oTabCaption)
	iCount = oTabCaption.Count
	
		
		For i = 1 To iCount-1
		  Dim strTabCaption
		  strTabCaption = oTabCaption(i).GetROProperty("innertext")
		  If Trim(UCase(strTabCaption)) = Trim(UCase("RECENT APPLICATIONS")) Then
			IsTabExist=True
			Exit For
	      End IF
	    Next	
			 
	 
	Set oDescTab = Nothing
	Set objtablist = Nothing
	Set oTabCaption = Nothing
  	IsTabExistDashboard=IsTabExist
End Function

'[Enter Document Number and Click Submit Button]
Public Function InputDocNumber_RA(strDocumentNmber)
	bVerify=True
	bVerify1=True
	If Not IsNull(strDocumentNmber) Then
		If Not SetValue(coRecentApps_Page.txtDocumentNumber(),strDocumentNmber,"Document Number")Then
				bVerify = False
		End If
	End If
	Wait 1
	coRecentApps_Page.btnSubmit.Click
	if Err.Number <> 0 Then
		bVerify1=False
	End If
	Wait 1
	If bVerify And bVerify1 Then
        InputDocNumber_RA = True
    Else
        InputDocNumber_RA = False
    End If
	
End Function

'[Verify Table Single Row Data in Recent Application]
Public Function VerifyTableRowData_RA(lstlstRARowData)
	VerifyTableRowData_RA = VerifyTableSingleRowData(coRecentApps_Page.tblDashboardRAHeader(),coRecentApps_Page.tblDashboardRABody,lstlstRARowData,"Recent Applications")	
End Function

'[Verify No Data available msg when enter non available Application Type value in Recent Application]
Public Function VerifyNoDatainTable_RA(strAppType,strMsg)
	bVerify=True
	bVerify1=True
	If Not IsNull(strAppType) Then
		If Not SetValue(coRecentApps_Page.txtApplicationType(),strAppType,"Application Type")Then
				bVerify = False
		End If
	End If
	WaitForIServeLoading
	If Not IsNull(strMsg) Then
		If Not verifyInnerText(coRecentApps_Page.lblNodataDisplay(),strMsg,"Recent Application Table") Then
			bVerify1=False
		End If
	End If
	
	If bVerify And bVerify1 Then
        VerifyNoDatainTable_RA = True
    Else
        VerifyNoDatainTable_RA = False
    End If
	
End Function

'[Verify Application Type has been entered]
Public Function VerifyTableRowDataAppType_RA(strAppType)
	bVerify=True
	bVerify1=True
	If Not IsNull(strAppType) Then
		If Not SetValue(coRecentApps_Page.txtApplicationType(),strAppType,"Application Type")Then
				bVerify = False
		End If
	End If
	
	If bVerify Then
        VerifyTableRowDataAppType_RA = True
    Else
        VerifyTableRowDataAppType_RA = False
    End If
		
End Function

'[Click Data Row from Results table in Recent Applications Page]
Public Function SelectColumnNumberInRA(lstRowData)
	bClickColNumber = False	
	If Not IsNull (lstRowData) Then			
	bClickColNumber = SelectTableRow(coRecentApps_Page.tblDashboardRAHeader(),coRecentApps_Page.tblDashboardRABody,lstRowData,"Recent Application Table","Application Type",False,False)	
	End If	
	WaitForIServeLoading
	SelectColumnNumberInRA = bClickColNumber
	Set ObjtableHeader = Nothing
	Set ObjtableContent = Nothing
End Function

'[Verify fields and Values displayed in Recent Applications Page]
Public Function VerifyIDLabelVals_RA(arrLblValPairs,strAccordianName)
	bVerify=True
	If Not IsNull(arrLblValPairs) Then
	If Not IsNull(strAccordianName) Then
		Select Case strAccordianName
			Case "Application Product Details"
			Set objField = coRecentApps_Page.lblApplicationDetails()
			Case "Application Emp Details"
			Set objField = coRecentApps_Page.lblApplicationDetails()
			Case "Application Address Detail"
			Set objField = coRecentApps_Page.lblApplicationDetails()
			Case "Application Summary"
			Set objField = coRecentApps_Page.lblApplicationSummary()
			Case "Cross Checks"
			Set objField = coRecentApps_Page.lblCrossChecks()
			Case "PreVal Policy Results"
			Set objField = coRecentApps_Page.lblPreValPolicyResult()
			Case "Scoring"
			Set objField = coRecentApps_Page.lblScoring()
			Case "Verification"
			Set objField = coRecentApps_Page.lblVerification()
			Case "Bureau Scoring"
			Set objField = coRecentApps_Page.lblBureauScoring()
			Case "Combined Scoring"
			Set objField = coRecentApps_Page.lblCombinedScoring()
			Case "Final Judgement"
			Set objField = coRecentApps_Page.lblFinalJudgement()
		End Select
	End If
	bVerify = VerifyIDLabelValuePairsRandom(objField,arrLblValPairs,"Recent Applications",strAccordianName)		
End If
	VerifyIDLabelVals_RA = bVerify
End Function

'[Verify Table Row Data displayed in Recent Applications Page]
Public Function VerifyTblResults_RA(lstlstRARowData,strAccordianName)
	bVerify=True
	If Not IsNull(lstlstRARowData) Then
		If Not IsNull(strAccordianName) Then
			Select Case strAccordianName
				Case "Event Details"
					Set objFieldHdr = coRecentApps_Page.tblEventDetailsHeader()
					Set objFielddata = coRecentApps_Page.tblEventDetailsBody()
				Case "Cross Checks"
					Set objFieldHdr = coRecentApps_Page.tblCrossChecksHeader()
					Set objFielddata = coRecentApps_Page.tblCrossChecksBody()
				Case "PreVal Policy Results"
					Set objFieldHdr = coRecentApps_Page.tblPolicyResultHeader()
					Set objFielddata = coRecentApps_Page.tblPolicyResultBody()
				Case "Scoring"
					Set objFieldHdr = coRecentApps_Page.tblScoringHeader()
					Set objFielddata = coRecentApps_Page.tblScoringBody()
				Case "Verification"
					Set objFieldHdr = coRecentApps_Page.tblVerificationHeader()
					Set objFielddata = coRecentApps_Page.tblVerificationBody()
				Case "Bureau Scoring"
					Set objFieldHdr = coRecentApps_Page.tblBureauScoringHeader()
					Set objFielddata = coRecentApps_Page.tblBureauScoringBody()
				Case "Final Judgement"
					Set objFieldHdr = coRecentApps_Page.tblFinalJudgeHeader()
					Set objFielddata = coRecentApps_Page.tblFinalJudgeBody()
			End Select
		End If
	bVerify = VerifyTableSingleRowData(objFieldHdr,objFielddata,lstlstRARowData,"Recent Applications - "+strAccordianName)		
 End If
	VerifyTblResults_RA = bVerify
End Function

'[Verify list of Accordions displayed in Recent Applications Page]
Public Function VerifyPanellist_RA(lstAccordion)
	VerifyPanellist_CP = VerifyAccordionHeader(coRecentApps_Page.ObjRAAccordianGrp,lstAccordion)
End Function

'[Click Expand icon for Accordion displayed in Recent Applications Page]
Public Function ClickExpandIcon_RA(strAccordion)
	ClickExpandIcon_RA = ExpandSingleAccordion(coRecentApps_Page.ObjRAAccordianGrp,strAccordion)
End Function

'[Click Collapse icon for Accordion displayed in Recent Applications Page]
Public Function ClickCollapseIcon_RA(strAccordion)
	ClickCollapseIcon_RA = CollapseSingleAccordion(coRecentApps_Page.ObjRAAccordianGrp,strAccordion)
End Function

'[Click Multiple Accordion to Expand or Collapse in Recent Applications Page displayed]
Public Function ClickMultipleExpandCollapseIcon_RA(lstAccordion)
bverifyExpandAccordion = True
If Not IsNull(lstAccordion) Then	
   bverifyExpandAccordion = ClickMultipleAccordions(coRecentApps_Page.ObjRAAccordianGrp,lstAccordion)	
End If
ClickMultipleExpandCollapseIcon_CP = bverifyExpandAccordion
End Function

'[Verify Infowarn Message displayed in Recent Applications Page]
Public Function VerifyInfowan_RA(strInfoMsgtext)
	VerifyInfowan_RA = VerifyInfowarntext(coRecentApps_Page.lblInfowarn,strInfoMsgtext)
End Function

'[Verify Pagination in Recent Applications Page]
Public Function Verifypagination_RA(strAccordianName)
bVerify = False
If Not IsNull(strAccordianName) Then
			Select Case strAccordianName
				Case "Event Details"
					Set tblObj = coRecentApps_Page.tblEventDetails()
					strcolumnname = "EVENT DESCRIPTION"
				Case "Cross Checks"
					Set tblObj = coRecentApps_Page.tblCrossChecks()
					strcolumnname = "TABLE DESCRIPTION"
				Case "PreVal Policy Results"
					Set tblObj = coRecentApps_Page.tblPolicyResult()
					strcolumnname = "TABLE DESCRIPTION"
				Case "Scoring"
					Set tblObj = coRecentApps_Page.tblScoring()
					strcolumnname = "TABLE DESCRIPTION"
				Case "Verification"
					Set tblObj = coRecentApps_Page.tblVerification()
					strcolumnname = "FIELD CODES"
				Case "Bureau Scoring"
					Set tblObj = coRecentApps_Page.tblBureauScoring()
					strcolumnname = "TABLE DESCRIPTION"
				Case "Final Judgement"
					Set tblObj = coRecentApps_Page.tblFinalJudge()
					strcolumnname = "TABLE DESCRIPTION"
			End Select
		End If
	bVerify = VerifytblPagination(tblObj,strcolumnname,5,"Recent Applications - "+strAccordianName)		
	Verifypagination_RA = bVerify
End Function
