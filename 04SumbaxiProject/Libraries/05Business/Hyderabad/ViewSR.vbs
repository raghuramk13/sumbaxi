Dim gstrRuntimeSRNumStep,gstrRuntimeTMCommentStep,gstrRuntimeCommentStep
'[Verify Tab ViewSR displayed]
Public Function verifyTabViewSRexist(strTabName)
   bDevPending=false
   WaitForICallLoading
   verifyTabViewSRexist=verifyTabExist(strTabName)
   WaitForICallLoading
End Function

'[Select Tab ViewSR]
Public Function setectTabViewSR(strTabName)
   bDevPending=false
   setectTabViewSR=selectTab(strTabName)
End Function

'[Close Tab ViewSR]
Public Function closeTabViewSR(strTabName)
   bDevPending=false
   closeTabViewSR=closeTab(strTabName)
End Function

'[Verify Pink Panel displayed in ViewSR Page]
Public Function verifyPinkPanel_ViewSR(strName,StrCIN,StrSegment)
bverifyPinkPanel_ViewSR=true
If Not IsNull(strName) Then
If Not VerifyInnerText(ViewSR.lnkPinkPanelName(),strName,"Name") Then
bverifyPinkPanel_ViewSR = False
End If
End If
If Not IsNull(StrCIN) Then
If Not VerifyInnerText(ViewSR.lblPinkPanelCIN(),StrCIN,"CIN") Then
bverifyPinkPanel_ViewSR = False
End If
End If
If Not IsNull(StrSegment) Then
If Not VerifyInnerText(ViewSR.lblPinkPanelSegment(),StrSegment,"Segment") Then
bverifyPinkPanel_ViewSR = False
End If
End If
verifyPinkPanel_ViewSR=bverifyPinkPanel_ViewSR
End Function

'[Verify Field RelatedTo displayed as]
Public Function verifyRelatedToText(strRelatedTo)
	verifyRelatedToText = true
	WaitForICallLoading
	For iCountOne = 1 To 180 Step 1
		If Not ViewSR.lblRelatedTo.Exist(0.5) Then
			Wait(0.5)
		else
			If Not IsNull(strRelatedTo) Then
				If Not VerifyInnerText (ViewSR.lblRelatedTo(), strRelatedTo, "Related To")Then
					verifyRelatedToText = false
				End If
			End If
			Exit for
		End if
	Next
	
	If Err.Number<>0 Then
		verifyRelatedToText = false
		LogMessage "WARN","Verification","Failed to Check Related To: text" ,false
		Exit Function
	End If
End Function

'[Verify Field CardNumber displayed as]
Public Function verifyCardNumberText(strAccountNumber)
   bVerifyCardNumberText=true
   'strAccountNumber=Replace(strAccountNumber,"-","")
   If Not IsNull(strAccountNumber) Then
       If Not VerifyInnerText (ViewSR.lblCardNumber(), strAccountNumber, "Account Number")Then
           bVerifyCardNumberText=false
       End If
   End If
   verifyCardNumberText=bVerifyCardNumberText
End Function

'[Verify Field Type displayed as]
Public Function verifyTypeText(strType)
   bVerifyTypeText=true
   If Not IsNull(strType) Then
       If Not VerifyInnerText (ViewSR.lblType(), strType, "Type")Then
           bVerifyTypeText=false
       End If
   End If
   verifyTypeText=bVerifyTypeText
End Function

'[Verify Field SubType displayed as]
Public Function verifySubTypeText(strSubType)
   bVerifySubTypeText=true
   If Not IsNull(strSubType) Then
       If Not VerifyInnerText (ViewSR.lblSubType(), strSubType, "SubType")Then
           bVerifySubTypeText=false
       End If
   End If
   verifySubTypeText=bVerifySubTypeText
End Function

'[Verify Field Product displayed as]
Public Function verifyProductText(strProduct)
   bVerifySubTypeText=true
   If Not IsNull(strProduct) Then
       If Not VerifyInnerText (ViewSR.lblProduct(), strProduct, "Product")Then
           bVerifySubTypeText=false
       End If
   End If
   verifyProductText=bVerifySubTypeText
End Function

'[Verify Field Description on ViewSR screen displayed as]
Public Function verifyDescription_ViewSRText(strDescription)
   bVerifyDescription_ViewSRText=true
   If Not IsNull(strDescription) Then
       If Not VerifyInnerText (ViewSR.lblDescription_ViewSR(), strDescription, "Description_ViewSR")Then
           bVerifyDescription_ViewSRText=false
       End If
   End If
   verifyDescription_ViewSRText=bVerifyDescription_ViewSRText
End Function

'[Verify Field Reason For Blocking on View SR Page displayed as]
Public Function verifyReasonForBlocking_ViewSR(strReasonforBlocking)
   bVerifyReasonForBlockingText=true
   If Not IsNull(strReasonforBlocking) Then
       If Not VerifyInnerText (ViewSR.lblReasonForBlocking(), strReasonforBlocking, "Reason For Blocking")Then
           bVerifyReasonForBlockingText=false
       End If
   End If
   verifyReasonForBlocking_ViewSR=bVerifyReasonForBlockingText
End Function

'[Verify Field AssignedTo displayed as]
Public Function verifyAssignedToText(strAssignedTo)
   bVerifyAssignedToText=true
   If Not IsNull(strAssignedTo) Then
       If Not VerifyInnerText (ViewSR.lblAssignedTo(), strAssignedTo, "AssignedTo")Then
           bVerifyAssignedToText=false
       End If
   End If
   verifyAssignedToText=bVerifyAssignedToText
End Function

'[Verify Field Status on ViewSR Screen displayed as]
Public Function verifyStatus_ViewSRText(strStatus)
   bVerifyStatus_ViewSRText=true
   If Not IsNull(strStatus) Then
       If Not VerifyInnerText (ViewSR.lblStatus_ViewSR(), strStatus, "Status_ViewSR")Then
           bVerifyStatus_ViewSRText=false
       End If
   End If
   verifyStatus_ViewSRText=bVerifyStatus_ViewSRText
End Function

'[Verify Field SubStatus displayed as]
Public Function verifySubStatusText(strSubStatus)
   bDevPending=false
   bVerifySubStatusText=true
   If Not IsNull(strSubStatus) Then
       If Not VerifyInnerText (ViewSR.lblSubStatus(), strSubStatus, "SubStatus")Then
           bVerifySubStatusText=false
       End If
   End If
   verifySubStatusText=bVerifySubStatusText
End Function

'[Verify Field Due Date displayed as]
Public Function verifyDueDateText(strDueDate)
   bDevPending=false
   bVerifyDueDateText=true
   If Not IsNull(strDueDate) Then
		If UCase(strDueDate)="DATASTORE DUEDATE" Then
			strDueDate=fetchFromDataStore("Select Open Activity SR from CSO home Page","BLANK","Due Date")(0)
		End If
   
       If Not VerifyInnerText (ViewSR.lblDueDate(), strDueDate, "DueDate")Then
           bVerifyDueDateText=false
       End If
   End If
   verifyDueDateText=bVerifyDueDateText
End Function

'[Verify Field Request Executed displayed as]
Public Function verifyRequestExecutedText(strRequestExecuted)
   bDevPending=false
   bVerifyRequestExecutedText=true
   If Not IsNull(strRequestExecuted) Then
       If Not VerifyInnerText (ViewSR.lblRequestExecuted(), strRequestExecuted, "RequestExecuted")Then
           bVerifyRequestExecutedText=false
       End If
   End If
   verifyRequestExecutedText = bVerifyRequestExecutedText
End Function

'[Verify Field Priority displayed as]
Public Function verifyPrioritytext(strPriority)
   bDevPending=false
   bVerifyRequestExecutedText=true
   If Not IsNull(strRequestExecuted) Then
       If Not VerifyInnerText (ViewSR.lblRequestExecuted(), strRequestExecuted, "RequestExecuted")Then
           bVerifyRequestExecutedText=false
       End If
   End If
   verifyRequestExecutedText=bVerifyRequestExecutedText
End Function

'[Verify Field FollowUp Required displayed as]
Public Function verifyRequestExecutedText(strRequestExecuted)
   bDevPending=false
   bVerifyRequestExecutedText=true
   If Not IsNull(strRequestExecuted) Then
       If Not VerifyInnerText (ViewSR.lblRequestExecuted(), strRequestExecuted, "RequestExecuted")Then
           bVerifyRequestExecutedText=false
       End If
   End If
   verifyRequestExecutedText=bVerifyRequestExecutedText
End Function

'[Verify Field Comments on View SR Tab displayed as]
Public Function verifyComments_ViewSR(strExpectedComment,strAccountNumber,strCreatedDate,strCreatedBy)
   'bDevPending=false
   bVerifyServiceRequest=true
 '  strAccountNumber=Replace(strAccountNumber,"-","")
   If Not IsNull(strExpectedComment) Then
	   If Ucase(strExpectedComment)="RUNTIME SR COMMENT" Then
		   strExpectedComment=fetchFromDataStore(gstrRuntimeCommentStep,"BLANK",gstrParameterNameStep)(0)
	   End If
	    If Ucase(strExpectedComment)="RUNTIME TM COMMENT" Then
		   strExpectedComment=fetchFromDataStore(gstrRuntimeTMCommentStep,"BLANK","TMComment")(0)
	   End If

      strActualComment= ViewSR.lblComments.GetROProperty("innertext")
	  LogMessage "RSLT","Verification","Comment displayed is  "&strActualComment,true
		  If Not IsNull(strCreatedDate) Then
			If Ucase(strCreatedDate)="TODAY" Then
				If len(Day(CDate(Now)))=1 Then
					strDay="0"&Day(CDate(Now))
				else
					strDay=""&Day(CDate(Now))
				End If
				strCreatedDatePattern=""&strDay & " "&monthName(Month(CDate(Now)),true) &" " &Year(CDate(Now))&", ([0-2][0-9]:[0-9][0-9])"
			else
				strCreatedDatePattern=strCreatedDate &", ([0-2][0-9]:[0-9][0-9])"
			End If
			'strDueDate=Split(getVadinCombo_SelectedItem(lblDueDate),":")(0)
			If isnull (strAccountNumber) Then
				strExpectedComment="Created by: "&strCreatedBy&"; Date and Time: "&strCreatedDatePattern &"; "&strExpectedComment
                
			Else
					strExpectedComment="Created by: "&strCreatedBy&"; Date and Time: "&strCreatedDatePattern &"; Account No: "&strAccountNumber&"; "&strExpectedComment
			End If
			If Matchstr(Ucase(strActualComment),Ucase(strExpectedComment)) Then
				LogMessage "RSLT","Verification","Comment pattern matched with expected pattern "&strExpectedComment,true
			else
				LogMessage "WARN","Verification","Comment pattern does not matched with Expected pattern "&strExpectedComment&" , Actual Comment displayed is "&strActualComment,false
				bVerifyServiceRequest=false
			End If
		 End If
   End If		

   verifyComments_ViewSR=bVerifyServiceRequest
End Function

'[Verify OnceAndDone Checkbox Checked on View SR Screen]
Public Function verifyOnceAndDone(bChecked)
   Dim bverifyOnceAndDone:bverifyOnceAndDone=true
	intCheckox = Instr(ViewSR.chkOnceDone.GetROProperty ("class"),"md-checked")
	If bChecked Then
		If intCheckox = 0 Then
			LogMessage "RSLT","Verification","Once and Done check box is not checked as expected.",false
			bverifyOnceAndDone = False
        Else
			LogMessage "RSLT","Verification","Once and Done check box is by default checked as expected.",true
			bverifyOnceAndDone = True
		End If
	Else
		If intCheckox = 0 Then
			LogMessage "RSLT","Verification","Once and Done check box is by default unchecked as expected.",true
			bverifyOnceAndDone = True
		Else
			LogMessage "RSLT","Verification","Once and Done check box is not unchecked as expected.",false
			bverifyOnceAndDone = False	
		End If
	End If
	verifyOnceAndDone=bverifyOnceAndDone
End Function

'[Verify Field SRNumber displayed as]
Public Function verifySRNumber_ViewSR(strSRNumber)
   bDevPending=false
   bVerifySRNumberText=true
   'If SR link clicked from table
   If Ucase(strSRNumber)="SELECTED SR IN TABLE" Then
		strSRNumber=fetchFromDataStore("Click SR Number link in Table Request Submitted","BLANK","SelectedSR")(0)
   End If
   
   If Ucase(strSRNumber)="SELECTED SR IN TABLE FROM TAB" Then
		strSRNumber=fetchFromDataStore("Click SR Number link in Table Request Submitted Tab","BLANK","SelectedSR")(0)
   End If
   
      'If SR is opened from Service Request table from overview screen
   If Ucase(strSRNumber)="SELECTED SR IN SR TABLE" Then
      strSRNumber=fetchFromDataStore("User click Unknown SR Number form Service Request Tab","BLANK","SelectedSRLink")(0)
   End If
   
  ' If SR link clicked from popup lable link
   If Ucase(strSRNumber)="SELECTED SR LINK" Then
   	strSRNumber=fetchFromDataStore("User click Unknown SR Number form Service Request Tab","BLANK","SelectedSRLink")(0)
	  ' If not isNull(gstrRuntimeSRNumStep) Then
		'   strSRNumber=fetchFromDataStore(gstrRuntimeSRNumStep,"BLANK","SelectedSRLink")(0)
	   'End If
	   If isNull(strSRNumber) or isEmpty(strSRNumber) Then
			strSRNumber=fetchFromDataStore("Click Link SRNumber on Request Submitted popup","BLANK","SelectedSRLink")(0)
	   End If
   End If

   If Not IsNull(strSRNumber) Then
       If Not VerifyInnerText (ViewSR.lblSRNumber(), strSRNumber, "SRNumber")Then
           bVerifySRNumberText=false
       End If
   End If
   verifySRNumber_ViewSR=bVerifySRNumberText
End Function

'[Verify Field Channel displayed as]
Public Function verifyChannelText(strChannel)
   bDevPending=false
   bVerifyChannelText=true
   If Not IsNull(strChannel) Then
       If Not VerifyInnerText (ViewSR.lblChannel(), strChannel, "Channel")Then
           bVerifyChannelText=false
       End If
   End If
   verifyChannelText=bVerifyChannelText
End Function

'[Verify Field Created Date displayed as]
Public Function VerifyFieldCreatedDate(strCreatedDate)
bDevPending=false
   bVerifyFieldCreatedDate=true
	strActualCreated=ViewSR.lblCreatedDate.GetRoProperty("innertext")
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
		If Matchstr(strActualCreated,strCreatedDatePattern) Then
			LogMessage "RSLT","Verification","Created date pattern matched with expected pattern DD MMM YYYY HH:MM",true
		else
			LogMessage "WARN","Verification","Created date pattern does not matched with Expected pattern DD MMM YYYY, HH:MM Expected: "&strCreatedDatePattern&" , Actual Date displayed is "&strActualCreated,false
			bVerifyFieldCreatedDate=false
		End If
	End If
	VerifyFieldCreatedDate=bVerifyFieldCreatedDate
End Function

'[Verify Field Created By displayed as]
Public Function VerifyFieldCreatedBy_ViewSR(strCreatedBy)
   bVerifyFieldCreatedBy=true
	 If Not IsNull(strCreatedBy) Then  'Updated as per code refractoring for View SR
		'strCreatedBy_LAN_Id=readFromINIFile(gstrCurrentProjectDir + "\"+gstrProjectName+ "\Config\SR_Screen_Map.ini",  "LAN ID" , strCreatedBy)
	  If Not VerifyInnerText (ViewSR.lblCreatedBy(), strCreatedBy, "Created By")Then
		   bVerifyFieldCreatedBy=false
		End If
	 End If
	 VerifyFieldCreatedBy_ViewSR=bVerifyFieldCreatedBy
End Function

'[Verify Field Overdue displayed as]
Public Function verifyOverdueText(strOverdue)
   bVerifyOverdueText=true
   If Not IsNull(strOverdue) Then
       If Not VerifyInnerText (ViewSR.lblOverdue(), strOverdue, "Overdue")Then
           bVerifyOverdueText=false
       End If
   End If
   verifyOverdueText=bVerifyOverdueText
End Function

'[Verify Field Duration displayed as]
Public Function verifyDurationText(strDuration)
   bVerifyDurationText=true
   If Not IsNull(strDuration) Then
       If Not VerifyInnerText (ViewSR.lblDuration(), strDuration, "Duration")Then
           bVerifyDurationText=false
       End If
   End If
   verifyDurationText=bVerifyDurationText
End Function

'[Verify Field Closed Date displayed as]
Public Function VerifyFieldClosedDate(strClosedDate)
   bVerifyFieldClosedDate=true
	strActualClosed=ViewSR.lblClosedDate.GetRoProperty("innertext")
	If Not IsNull(strClosedDate) Then
		If Ucase(strClosedDate)="TODAY" Then
			If len(Day(CDate(Now)))=1 Then
				strDay="0"&Day(CDate(Now))
			else
				strDay=""&Day(CDate(Now))
			End If			
			strClosedDate=""&strDay & " "&monthName(Month(CDate(Now)),true) &" " &Year(CDate(Now))&" ([0-2][0-9]:[0-9][0-9])"
		End If

		If Matchstr(strActualClosed,strClosedDate) Then
			LogMessage "RSLT","Verification","Closed date pattern matched with expected pattern DD MMM YYYY HH:MM",true
		else
			LogMessage "WARN","Verification","Closed date pattern does not matched with Expected pattern DD MMM YYYY, HH:MM Expected: "&strClosedDate&" , Actual Date displayed is "&strActualClosed,false
			bVerifyFieldClosedDate=false
		End If
	End If
	VerifyFieldClosedDate=bVerifyFieldClosedDate
End Function

'[Verify Field Last Updated Date displayed as]
Public Function VerifyFieldLastUpdatedDate(strLastUpdatedDate)
   bVerifyFieldLastUpdatedDate=true
	strActualLastUpdate=ViewSR.lblLastUpdatedDate.GetRoProperty("innertext")
	If Not IsNull(strLastUpdatedDate) Then
		If Ucase(strLastUpdatedDate)="TODAY" Then
			If len(Day(CDate(Now)))=1 Then
				strDay="0"&Day(CDate(Now))
			else
				strDay=""&Day(CDate(Now))
			End If
			strLastUpdatedDate=""&strDay & " "&monthName(Month(CDate(Now)),true) &" " &Year(CDate(Now))&" ([0-2][0-9]:[0-9][0-9])"
		End If	
		If Matchstr(strActualLastUpdate,strLastUpdatedDate) Then
			LogMessage "RSLT","Verification","Last Update date pattern matched with expected pattern DD MMM YYYY HH:MM",true
		else
			LogMessage "WARN","Verification","Last Update date pattern does not matched with Expected pattern DD MMM YYYY, HH:MM Expected: "&strLastUpdatedDate&" , Actual Date displayed is "&strActualLastUpdate,false
			bVerifyFieldLastUpdatedDate=false
		End If
	End If
		VerifyFieldLastUpdatedDate=bVerifyFieldLastUpdatedDate
End Function

'[Verify Field Last Updated By displayed as]
Public Function VerifyFieldLastUpdateBy_ViewSR(strLastUpdatedBy)
	bVerifyFieldLastUpdateBy=true
	If Not IsNull(strLastUpdatedBy) Then 'Updated as per code refractoring for View SR
'		strLastUpdatedBy_LAN_Id=""
'		If not strLastUpdatedBy="" Then
'			strLastUpdatedBy_LAN_Id=readFromINIFile(gstrCurrentProjectDir + "\"+gstrProjectName+ "\Config\SR_Screen_Map.ini",  "LAN ID" , strLastUpdatedBy)
'		End If
	  If Not VerifyInnerText (ViewSR.lblLastUpdatedBy, strLastUpdatedBy, "Last Updated By")Then
		   bVerifyFieldLastUpdateBy=false
		End If
	End If
		VerifyFieldLastUpdateBy_ViewSR=bVerifyFieldLastUpdateBy
End Function

'[Click Link Notes on ViewSR screen]
Public Function clickLinkNotes_ViewSR()
   bDevPending=False
   ViewSR.lnkNotes_ViewSR.click
   If Err.Number<>0 Then
       clickLinkNotes_ViewSR=false
            LogMessage "WARN","Verification","Failed to Click Link : Notes_ViewSR" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickLinkNotes_ViewSR=true
End Function

'[Verify Notes displayed as]
Public Function VerifyNotes_ViewSR(lstNotes,strNotesDescription)
   bDevPending=False
   bVerifyServiceRequest=true
   If Not isNull(lstNotes) Then
		ViewSR.lnkNotes_ViewSR.Click
		WaitForICallLoading
		If not verifyTableContentList(ViewSR.tblNotesHeader,ViewSR.tblNotesContent,lstNotes,"Notes",False,NULL,NULL,NULL) Then
			bVerifyServiceRequest=false
		End If
		
		'********** link class removed from property. Due to that script changed.
		'If not selectTableLink(ViewSR.tblNotesHeader,ViewSR.tblNotesContent,lstNotes,"Notes","Description",False,NULL,NULL,NULL) Then
		'	bVerifyServiceRequest=false
		'End If
		
		'ViewSR.tblNotesContent.ChildItem(1,3,"WebElement",0).Click		
		
		Dim intCol,objCountInCell
		Set objAllRows=getAllRows(ViewSR.tblNotesContent)
		intRowCount=objAllRows.Count	
		intCol=getColIndex (ViewSR.tblNotesHeader,strColName)
		
		Set odesc_Cell=Description.Create
		odesc_Cell("xpath").value=".//div[@class='dt-cell-content']"
		'set objCountInCell=getCellObject(ViewSR.tblNotesHeader,ViewSR.tblNotesContent,"0","Description","dt-cell-content")
		set objCountInCell=ViewSR.tblNotesContent.childObjects(odesc_Cell)
		
		iObjCount=objCountInCell.count
		strCellValue=getCellTextFor(ViewSR.tblNotesHeader,ViewSR.tblNotesContent,"0", "Description")
		
		For j = 0 to iObjCount - 1
			strCellValue=objCountInCell(j).getROProperty("innertext")		
			If strCellValue=strNotesDescription Then
				objCountInCell(j).click
				Exit For
			End If
		Next		
		If Not VerifyInnerText (ViewSR.lblNotesDescription(), strNotesDescription, "Notes")Then
           bVerifyServiceRequest=false
       End If
	End If	
	ViewSR.btnOK_Notes.Click
	VerifyNotes_ViewSR=bVerifyServiceRequest
End Function

'**************Block Cancel Card ****************************
'[Verify Field Reason For Blocking on View SR Screen displayed as]
Public Function verifyReasonForBlocking_ViewSR(strReasonForBlocking)
   bDevPending=false
   bverifyReasonForBlocking_ViewSR=true
   If Not IsNull(strDuration) Then
       If Not VerifyInnerText (ViewSR.lblReasonForBlocking(), strReasonForBlocking, "Reason For Blocking ")Then
           bverifyReasonForBlocking_ViewSR=false
       End If
   End If
   verifyReasonForBlocking_ViewSR=bverifyReasonForBlocking_ViewSR
End Function

'[Verify Field Replacement Required on View SR Screen displayed as]
Public Function verifyReplacementRequired_ViewSR(strReplacementRequired)
   bDevPending=false
   bverifyReplacementRequired_ViewSR=true
   If Not IsNull(strDuration) Then
       If Not VerifyInnerText (ViewSR.lblReplacementRequired(), strReplacementRequired, "Replacement Required")Then
           bverifyReplacementRequired_ViewSR=false
       End If
   End If
   verifyReplacementRequired_ViewSR=bverifyReplacementRequired_ViewSR
End Function

'**********New Pin ***************

'[Verify Field Delivery Mode on View SR Screen displayed as]
Public Function verifyDeliveryMode_ViewSR(strDeliveryMode)
   bDevPending=false
   bVerifyDeliveryMode=true
   If Not IsNull(strDeliveryMode) Then
       If Not VerifyInnerText (ViewSR.lblDeliveryMode(), strDeliveryMode, "Delivery Mode")Then
           bVerifyDeliveryMode=false
       End If
   End If
   verifyDeliveryMode_ViewSR=bVerifyDeliveryMode
End Function
'[Verify Field Delivery Instruction on View SR Screen displayed as]
Public Function verifyDeliveryInstruction_ViewSR(strDelInst)
   bDevPending=false
   bverifyDeliveryInstructionText=true
   If Not IsNull(strDelInst) Then
       If Not VerifyInnerText (ViewSR.lblDeliveryInstruction(), strDelInst, "Delivery Instruction")Then
           bverifyDeliveryInstructionText=false
       End If
   End If
   verifyDeliveryInstruction_ViewSR=bverifyDeliveryInstructionText
End Function
'[Verify Field Contact Number on View SR Screen displayed as]
Public Function verifyContactNumber_ViewSR(strContactNum)
   bDevPending=false
   bverifyContactNumber=true
   If Not IsNull(strContactNum) Then
       If Not VerifyInnerText (ViewSR.lblContactNo(), strContactNum, "Contact Number")Then
           bverifyContactNumber=false
       End If
   End If
   verifyContactNumber_ViewSR=bverifyContactNumber
End Function

'********************Fee Adjustments*******************
'[Verify Field ApprovalLevel on View SR Screen displayed as]
Public Function verifyApprovalLevel_ViewSR(strExpectedText)
   bDevPending=False
   bVerifyApprovalLevelText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (ViewSR.lblApprovalLevel(), strExpectedText, "ApprovalLevel")Then
           bVerifyApprovalLevelText=false
       End If
   End If
   verifyApprovalLevel_ViewSR=bVerifyApprovalLevelText
End Function

'[Verify Field TransactionDescription on View SR Screen displayed as]
Public Function verifyTransactionDescription_ViewSR(strExpectedText)
   bDevPending=False
   bVerifyTransactionDescriptionText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (ViewSR.lblTransactionDescription(), strExpectedText, "TransactionDescription")Then
           bVerifyTransactionDescriptionText=false
       End If
   End If
   verifyTransactionDescription_ViewSR=bVerifyTransactionDescriptionText
End Function

'[Verify Field Amount on View SR Screen displayed as]
Public Function verifyAmount_ViewSR(strAmount)
   bVerifyAmountText=true
   If Not IsNull(strAmount) Then
       If Not VerifyInnerText (ViewSR.lblAmount(), strAmount, "Amount")Then
           bVerifyAmountText=false
       End If
   End If
   verifyAmount_ViewSR=bVerifyAmountText
End Function

'[Verify Field PlanNo on View SR Screen displayed as]
Public Function verifyPlanNo_ViewSR(strExpectedText)
   bDevPending=False
   bVerifyPlanNoText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (ViewSR.lblPlanNo(), strExpectedText, "PlanNo")Then
           bVerifyPlanNoText=false
       End If
   End If
   verifyPlanNo_ViewSR=bVerifyPlanNoText
End Function

'[Verify Field FeeType on View SR Screen displayed as]
Public Function verifyFeeType_ViewSR(strExpectedText)
   bDevPending=False
   bVerifyFeeTypeText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (ViewSR.lblFeeType(), strExpectedText, "FeeType")Then
           bVerifyFeeTypeText=false
       End If
   End If
   verifyFeeType_ViewSR=bVerifyFeeTypeText
End Function

'[Verify Field EffectiveDate on View SR Screen displayed as]
Public Function verifyEffectiveDate_ViewSR(strExpectedText)
   bDevPending=False
   bVerifyEffectiveDateText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (ViewSR.lblEffectiveDate(), strExpectedText, "EffectiveDate")Then
           bVerifyEffectiveDateText=false
       End If
   End If
   verifyEffectiveDate_ViewSR=bVerifyEffectiveDateText
End Function

'[Verify Field RequestedAmount on View SR Screen displayed as]
Public Function verifyRequestedAmount_ViewSR(strExpectedText)
   bDevPending=False
   bVerifyRequestedAmountText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (ViewSR.lblRequestedAmount(), strExpectedText, "RequestedAmount")Then
           bVerifyRequestedAmountText=false
       End If
   End If
   verifyRequestedAmount_ViewSR=bVerifyRequestedAmountText
End Function

'[Verify Field TransactionDate on View SR Screen displayed as]
Public Function verifyTransactionDate_ViewSR(strExpectedText)
   bDevPending=False
   bVerifyTransactionDateText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (ViewSR.lblTransactionDate(), strExpectedText, "TransactionDate")Then
           bVerifyTransactionDateText=false
       End If
   End If
   verifyTransactionDate_ViewSR=bVerifyTransactionDateText
End Function

'[Verify TM Approval Status information on View SR Screen]
Public Function verifyTMApprovalStatusInfo_ViewSR(strApproval_TM,strCreatedBy1Bank,strApprovedBy1Bank)
   bVerifyTMApprovalStatusInfo=true
   strCreatedLAN=readFromINIFile(gstrCurrentProjectDir + "\"+gstrProjectName+ "\Config\SR_Screen_Map.ini",  "LAN ID" , strCreatedBy1Bank)
   strApprovedLAN=readFromINIFile(gstrCurrentProjectDir + "\"+gstrProjectName+ "\Config\SR_Screen_Map.ini",  "LAN ID" , strApprovedBy1Bank)
   ViewSR.lnkTMApprovalStatus.Click
   If Not IsNull(strApproval_TM) Then
       If Not VerifyInnerText (ViewSR.lblApproval_TM(), strApproval_TM, "Approval Status")Then
           bVerifyTMApprovalStatusInfo=false
       End If
   End If
   If Not IsNull(strCreatedLAN) Then
       If Not VerifyInnerText (ViewSR.lblCreatedByLAN_TM(), strCreatedLAN, "Created By LANID")Then
           bVerifyTMApprovalStatusInfo=false
       End If
   End If
   If Not IsNull(strApprovedLAN) Then
       If Not VerifyInnerText (ViewSR.lblApprovedByLAN_TM(), strApprovedLAN, "Approved By LANID")Then
           bVerifyTMApprovalStatusInfo=false
       End If
   End If
   If Not IsNull(strCreatedBy1Bank) Then
       If Not VerifyInnerText (ViewSR.lblCreatedBy1Bank_TM(), strCreatedBy1Bank, "Created By 1BankID")Then
           bVerifyTMApprovalStatusInfo=false
       End If
   End If
   If Not IsNull(strApprovedBy1Bank) Then
       If Not VerifyInnerText (ViewSR.lblApprovedBy1Bank_TM(), strApprovedBy1Bank, "Approved By 1BankID")Then
           bVerifyTMApprovalStatusInfo=false
       End If
   End If
   verifyTMApprovalStatusInfo_ViewSR=bVerifyTMApprovalStatusInfo
End Function

'[Verify SR Failure reason on Failed SR Page]
Public Function verifyFailedSR(strExpectedFailureReason)
   bverifyFailedSR=true
	strActualFailureReason=ViewSR.txtFailureReason.GetRoProperty("innertext")
	If not Matchstr(strActualFailureReason,strExpectedFailureReason) Then
		LogMessage "RSLT","Verification","Failure Reason "&strActualFailureReason& "not matched with Expected value" &strExpectedFailureReason,false
		bverifyFailedSR=false
	End If
	verifyFailedSR=bverifyFailedSR
End Function


'********************Service Activation*******************
'[Verify Service Activation Type on View SR Screen displayed as]
Public Function verifyServiceActivationType_ViewSR(strExpectedText)
   bDevPending=False
   bVerifyTransactionDateText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (ViewSR.lblActivationType(), strExpectedText, "Service Activation Type")Then
           bVerifyTransactionDateText=false
       End If
   End If
   verifyServiceActivationType_ViewSR=bVerifyTransactionDateText
End Function

'[Verify Current Status on View SR Screen displayed as]
Public Function verifyCurrentStatus_ViewSR(strExpectedText)
   bDevPending=False
   bVerifyTransactionDateText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (ViewSR.lblCurrentStatus(), strExpectedText, "Current Status")Then
           bVerifyTransactionDateText=false
       End If
   End If
   verifyCurrentStatus_ViewSR=bVerifyTransactionDateText
End Function

'[Verify Validity on View SR Screen displayed as]
Public Function verifyValidity_ViewSR(strExpectedText)
   bDevPending=False
   bVerifyTransactionDateText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (ViewSR.lblValidity(), strExpectedText, "Service Activation Type")Then
           bVerifyTransactionDateText=false
       End If
   End If
   verifyValidity_ViewSR=bVerifyTransactionDateText
End Function

'[Verify Field StartDate on View SR displayed as]
Public Function verifyStartDateText_ViewSR(strStartDate)
   bDevPending=false
   bVerifyStartDateText=true
   strActualStartDate=ViewSR.lblStartDate.GetRoProperty("innertext")
   If Not IsNull(strStartDate) Then
	   If Ucase(strStartDate)="TODAY" Then
				If len(Day(CDate(Now)))=1 Then
					strDay="0"&Day(CDate(Now))
				else
					strDay=""&Day(CDate(Now))
				End If
				strStartDatePattern=""&strDay & " "&monthName(Month(CDate(Now)),true) &" " &Year(CDate(Now))&""
			else
				strStartDatePattern=strStartDate &""
			End If
		 If Matchstr(strActualStartDate,strStartDatePattern) Then
			LogMessage "RSLT","Verification","Created date pattern matched with expected pattern DD MMM YYYY",true
		else
			LogMessage "WARN","Verification","Created date pattern does not matched with Expected pattern DD MMM YYYY Expected: "&strStartDatePattern&" , Actual Date displayed is "&strActualStartDate,false
			bVerifyStartDateText=false
		End If
   End If
   verifyStartDateText_ViewSR=bVerifyStartDateText
End Function

'[Verify Field EndDate on View SR displayed as]
Public Function verifyEndDateText_ViewSR(strExpectedText)
   bDevPending=false
   bVerifyEndDateText=true
   If Not VerifyInnerText (ViewSR.lblEndDate(), strExpectedText, "End Date")Then
          bVerifyTransactionDateText=false
   End If
   verifyEndDateText_ViewSR=bVerifyEndDateText
End Function

'********************Spending Limit*******************
'[Verify Spending Limit Type on View SR Screen displayed as]
Public Function verifySpendingLimitType_ViewSR(strExpectedText)
   bDevPending=False
   bVerifyTransactionDateText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (ViewSR.lblSpendingLimitType(), strExpectedText, "Spending Limit Type")Then
           bVerifyTransactionDateText=false
       End If
   End If
   verifySpendingLimitType_ViewSR=bVerifyTransactionDateText
End Function

'[Verify Reason for Change on View SR Screen displayed as]
Public Function verifyReasonForChange_ViewSR(strExpectedText)
   bDevPending=False
   bVerifyTransactionDateText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (ViewSR.lblReasonForChange(), strExpectedText, "Reason For Change")Then
           bVerifyTransactionDateText=false
       End If
   End If
   verifyReasonForChange_ViewSR=bVerifyTransactionDateText
End Function

'[Verify New Spending Limit on View SR Screen displayed as]
Public Function verifyNewSpendingLimit_ViewSR(strExpectedText)
   bDevPending=False
   bVerifyTransactionDateText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (ViewSR.lblNewSpendingLimit(), strExpectedText, "New Spending Limit")Then
           bVerifyTransactionDateText=false
       End If
   End If
   verifyNewSpendingLimit_ViewSR=bVerifyTransactionDateText
End Function

'[Verify Field EffectiveDate for Spending Limit on View SR Screen displayed as]
Public Function verifyEffectiveDate_ViewSR_SL(strExpectedText)
   bDevPending=False
   bVerifyEffectiveDateText=true
   '************* For LISA execution added below step when screenwill take today's date
	If Ucase(strExpectedText)="TODAY" Then
		If len(Day(CDate(Now)))=1 Then
			strDay="0"&Day(CDate(Now))
		else
			strDay=""&Day(CDate(Now))
		End If
		strExpectedText=""&strDay & " "&monthName(Month(CDate(Now)),true) &" " &Year(CDate(Now))
		If Not VerifyInnerText (ViewSR.lblEffectiveDate(), strExpectedText, "EffectiveDate")Then
           bVerifyEffectiveDateText=false
       End If
		verifyEffectiveDate_ViewSR_SL=bVerifyEffectiveDateText       
       Exit Function
	End If 
	
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (ViewSR.lblEffectiveDate(), strExpectedText, "EffectiveDate")Then
           bVerifyEffectiveDateText=false
       End If
   Else
	   strEffectiveDate=fetchFromDataStore("Set TextBox EffectiveDate on Spending Limit to","BLANK","SREffectiveDate")(0)
		If Not VerifyInnerText (ViewSR.lblEffectiveDate(), strEffectiveDate, "EffectiveDate")Then
           bVerifyEffectiveDateText=false
       End If	   
   End If
   verifyEffectiveDate_ViewSR_SL=bVerifyEffectiveDateText
End Function

'[Verify Field ExpiryDate for Spending Limit on View SR Screen displayed as]
Public Function verifyExpiryDate_ViewSR_SL(strExpectedText)
   bDevPending=False
   bVerifyEffectiveDateText=true
'************* For LISA execution added below step when screenwill take today's date
	If Ucase(strExpectedText)="TODAY" Then
		If len(Day(CDate(Now)))=1 Then
			strDay="0"&Day(CDate(Now))
		else
			strDay=""&Day(CDate(Now))
		End If
		strExpectedText=""&strDay & " "&monthName(Month(CDate(Now)),true) &" " &Year(CDate(Now))
		If Not VerifyInnerText (ViewSR.lblEffectiveDate(), strExpectedText, "EffectiveDate")Then
           bVerifyEffectiveDateText=false
       End If
		verifyExpiryDate_ViewSR_SL=bVerifyEffectiveDateText       
       Exit Function
	End If
	
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (ViewSR.lblExpiryDate(), strExpectedText, "ExpiryDate")Then
           bVerifyEffectiveDateText=false
       End If
   Else
	   strExpiryDate=fetchFromDataStore("Set TextBox EffectiveDate on Spending Limit to","BLANK","SREffectiveDate")(0)
		If Not VerifyInnerText (ViewSR.lblExpiryDate(), strExpiryDate, "ExpiryDate")Then
           bVerifyEffectiveDateText=false
       End If	   
   End If
   verifyExpiryDate_ViewSR_SL=bVerifyEffectiveDateText
End Function

'********************Card Replacement*******************
'[Verify Field Replacement Option on View SR Page displayed as]
Public Function verifyReplacementOption_ViewSR(strReplacementOption)
   bDevPending=false
   bVerifyReplacementOption=true
   If Not IsNull(strReplacementOption) Then
       If Not VerifyInnerText (ViewSR.lblReplacementOption(), strReplacementOption, "Replacement Option")Then
           bVerifyReplacementOption=false
       End If
   End If
   verifyReplacementOption_ViewSR=bVerifyReplacementOption
End Function

'[Verify Field Replacement Reason on View SR Page displayed as]
Public Function verifyReplacementReason_ViewSR(strReplacementReason)
   bDevPending=false
   bVerifyReplacementReason=true
   If Not IsNull(strReplacementReason) Then
       If Not VerifyInnerText (ViewSR.lblReplacementReason(), strReplacementReason, "Replacement Reason")Then
           bVerifyReplacementReason=false
       End If
   End If
   verifyReplacementReason_ViewSR=bVerifyReplacementReason
End Function

'[Verify Field New Embossing Name on View SR Page displayed as]
Public Function verifyNewEmbossingName_ViewSR(strNewEmbossingName)
   bDevPending=false
   bVerifyNewEmbossingName=true
   If Not IsNull(strNewEmbossingName) Then
       If Not VerifyInnerText (ViewSR.lblNewEmbossingName(), strNewEmbossingName, "New Embossing Name")Then
           bVerifyNewEmbossingName=false
       End If
   End If
   verifyNewEmbossingName_ViewSR=bVerifyNewEmbossingName
End Function

'[Verify Field New Card Type on View SR Page displayed as]
Public Function verifyNewCardType_ViewSR(strNewCardType)
   bDevPending=false
   bVerifyNewCardType=true
   If Not IsNull(strNewCardType) Then
       If Not VerifyInnerText (ViewSR.lblNewCardType(), strNewCardType, "New Card Type")Then
           bVerifyNewCardType=false
       End If
   End If
   verifyNewCardType_ViewSR=bVerifyNewCardType
End Function

'[Verify Field Waive Replacement Fee on View SR Page displayed as]
Public Function verifyWaiveReplacementFee_ViewSR(strWaiveReplFee)
   bDevPending=false
   bVerifyWaiveReplacementFee=true
   If Not IsNull(strWaiveReplFee) Then
       If Not VerifyInnerText (ViewSR.lblWaiveReplFee(), strWaiveReplFee, "New Card Type")Then
           bVerifyWaiveReplacementFee=false
       End If
   End If
   verifyWaiveReplacementFee_ViewSR=bVerifyWaiveReplacementFee
End Function

'[Verify Field Urgency on View SR Page displayed as]
Public Function verifyUrgency_ViewSR(strUrgency)
   bDevPending=false
   bVerifyUrgency=true
   If Not IsNull(strUrgency) Then
       If Not VerifyInnerText (ViewSR.lblUrgency(), strUrgency, "Urgency")Then
           bVerifyUrgency=false
       End If
   End If
   verifyUrgency_ViewSR=bVerifyUrgency
End Function

'[Verify Field Charge for Urgent Mailing on View SR Page displayed as]
Public Function verifyChargeforUrgentMailing_ViewSR(strChargeforUrgentMailing)
   bDevPending=false
   bVerifyChargeforUrgentMailing=true
   If Not IsNull(strChargeforUrgentMailing) Then
       If Not VerifyInnerText (ViewSR.lblChargeforUrgentMailing(), strChargeforUrgentMailing, "Charge For Urgent Mailing")Then
           bVerifyChargeforUrgentMailing=false
       End If
   End If
   verifyChargeforUrgentMailing_ViewSR=bVerifyChargeforUrgentMailing
End Function

'[Verify Field Reason for Special Mailing on View SR Page displayed as]
Public Function verifyReasonforSpecialMailing_ViewSR(strReasonforSpecialMailing)
   bDevPending=false
   bVerifyReasonforSpecialMailing=true
   If Not IsNull(strReasonforSpecialMailing) Then
       If Not VerifyInnerText (ViewSR.lblReasonforSpecialMailing(), strReasonforSpecialMailing, "Reason for Special Mailing")Then
           bVerifyReasonforSpecialMailing=false
       End If
   End If
   verifyReasonforSpecialMailing_ViewSR=bVerifyReasonforSpecialMailing
End Function

'[Verify Field Contact Number on View SR Page displayed as]
Public Function verifyContactNumber_ViewSR(strContactNumber)
   bDevPending=false
   bVerifyContactNumber=true
   If Not IsNull(strContactNumber) Then
       If Not VerifyInnerText (ViewSR.lblContactNumber(), strContactNumber, "Contact Number")Then
           bVerifyContactNumber=false
       End If
   End If
   verifyContactNumber_ViewSR=bVerifyContactNumber
End Function

'********************Card Activation*******************
'[Verify Field Activation Type on View SR Page displayed as]
Public Function verifyActivationType_ViewSR(strActivationType)
   bDevPending=false
   bverifyActivationType=true
   If Not IsNull(strActivationType) Then
       If Not VerifyInnerText (ViewSR.lblActivationType(), strActivationType, "Activation Type")Then
           bverifyActivationType=false
       End If
   End If
   verifyActivationType_ViewSR=bverifyActivationType
End Function

'********************Fee Waiver*******************
'[Verify Field Fee Reversal Type on View SR Page displayed as]
Public Function verifyFeeReversalType_ViewSR(strFeeReversalType)
   bDevPending=false
   bverifyFeeReversalType=true
   If Not IsNull(strFeeReversalType) Then
       If Not VerifyInnerText (ViewSR.lblFeeReversalType(), strFeeReversalType, "Fee Reversal Type")Then
           bverifyFeeReversalType=false
       End If
   End If
   verifyFeeReversalType_ViewSR=bverifyFeeReversalType
End Function

'[Verify Field Transaction Date for Fee Waiver on View SR Page displayed as]
Public Function verifyTransactionDateFW_ViewSR(strTransactionDateFW)
   bDevPending=false
   bverifyTransactionDateFW=true
   If Not IsNull(strTransactionDateFW) Then
       If Not VerifyInnerText (ViewSR.lblTransactionDate_FW(), strTransactionDateFW, "Transaction Date")Then
           bverifyTransactionDateFW=false
       End If
   End If
   verifyTransactionDateFW_ViewSR=bverifyTransactionDateFW
End Function

'[Verify Field Transaction Description for Fee Waiver on View SR Page displayed as]
Public Function verifyTransactionDescriptionFW_ViewSR(strTransactionDescription)
   bDevPending=false
   bverifyTransactionDescriptionFW=true
   If Not IsNull(strTransactionDescription) Then
       If Not VerifyInnerText (ViewSR.lblTransactionDescription_FW(), strTransactionDescription, "Transaction Description")Then
           bverifyTransactionDescriptionFW=false
       End If
   End If
   verifyTransactionDescriptionFW_ViewSR=bverifyTransactionDescriptionFW
End Function

'[Verify Field Amount for Fee Waiver on View SR Page displayed as]
Public Function verifyAmountFW_ViewSR(strAmount)
   bDevPending=false
   bverifyAmountFW=true
   If Not IsNull(strAmount) Then
       If Not VerifyInnerText (ViewSR.lblAmount_FW(), strAmount, "Amount")Then
           bverifyAmountFW=false
       End If
   End If
   verifyAmountFW_ViewSR=bverifyAmountFW
End Function

'[Verify Field Plan No for Fee Waiver on View SR Page displayed as]
Public Function verifyPlanNoFW_ViewSR(strPlanNo)
   bDevPending=false
   bverifyPlanNoFW=true
   If Not IsNull(strPlanNo) Then
       If Not VerifyInnerText (ViewSR.lblPlanNo_FW(), strPlanNo, "Plan No")Then
           bverifyPlanNoFW=false
       End If
   End If
   verifyPlanNoFW_ViewSR=bverifyPlanNoFW
End Function

'[Verify Field Requested Amount for Fee Waiver on View SR Page displayed as]
Public Function verifyRequestedAmountFW_ViewSR(strRequestedAmount)
   bDevPending=false
   bverifyRequestedAmount=true
   If Not IsNull(strRequestedAmount) Then
       If Not VerifyInnerText (ViewSR.lblRequestedAmount_FW(), strRequestedAmount, "Requested Amount")Then
           bverifyRequestedAmount=false
       End If
   End If
   verifyRequestedAmountFW_ViewSR=bverifyRequestedAmount
End Function

'********************Address Change*******************
'[Verify Field Address Line1 on View SR Page displayed as]
Public Function verifyAddressLine1_ViewSR(strAddressLine1)
   bDevPending=false
   bverifyAddressLine1_ViewSR=true
   If Not IsNull(strAddressLine1) Then
       If Not VerifyInnerText (ViewSR.lblAddressLine1(), strAddressLine1, "Address Line1")Then
           bverifyAddressLine1_ViewSR=false
       End If
   End If
   verifyAddressLine1_ViewSR=bverifyAddressLine1_ViewSR
End Function

'[Verify Field Address Line2 on View SR Page displayed as]
Public Function verifyAddressLine2_ViewSR(strAddressLine2)
   bDevPending=false
   bverifyAddressLine2_ViewSR=true
   If Not IsNull(strAddressLine2) Then
       If Not VerifyInnerText (ViewSR.lblAddressLine2(), strAddressLine2, "Address Line2")Then
           bverifyAddressLine2_ViewSR=false
       End If
   End If
   verifyAddressLine2_ViewSR=bverifyAddressLine2_ViewSR
End Function

'[Verify Field Address Line3 on View SR Page displayed as]
Public Function verifyAddressLine3_ViewSR(strAddressLine3)
   bDevPending=false
   bverifyAddressLine3_ViewSR=true
   If Not IsNull(strAddressLine3) Then
       If Not VerifyInnerText (ViewSR.lblAddressLine3(), strAddressLine3, "Address Line3")Then
           bverifyAddressLine3_ViewSR=false
       End If
   End If
   verifyAddressLine3_ViewSR=bverifyAddressLine3_ViewSR
End Function

'[Verify Field Address Line4 on View SR Page displayed as]
Public Function verifyAddressLine4_ViewSR(strAddressLine4)
   bDevPending=false
   bverifyAddressLine4_ViewSR=true
   If Not IsNull(strAddressLine4) Then
       If Not VerifyInnerText (ViewSR.lblAddressLine4(), strAddressLine4, "Address Line4")Then
           bverifyAddressLine4_ViewSR=false
       End If
   End If
   verifyAddressLine4_ViewSR=bverifyAddressLine4_ViewSR
End Function

'[Verify Field Address Line5 on View SR Page displayed as]
Public Function verifyAddressLine5_ViewSR(strAddressLine5)
   bDevPending=false
   bverifyAddressLine5_ViewSR=true
   If Not IsNull(strAddressLine5) Then
       If Not VerifyInnerText (ViewSR.lblAddressLine5(), strAddressLine5, "Address Line5")Then
           bverifyAddressLine5_ViewSR=false
       End If
   End If
   verifyAddressLine5_ViewSR=bverifyAddressLine5_ViewSR
End Function

'[Verify Field Country on View SR Page displayed as]
Public Function verifyCountry_ViewSR(strCountry)
   bDevPending=false
   bverifyCountry_ViewSR=true
   If Not IsNull(strCountry) Then
       If Not VerifyInnerText (ViewSR.lblCountry(), strCountry, "Country")Then
           bverifyCountry_ViewSR=false
       End If
   End If
   verifyCountry_ViewSR=bverifyCountry_ViewSR
End Function

'[Verify Field Postal Code on View SR Page displayed as]
Public Function verifyPostalCode_ViewSR(strPostalCode)
   bDevPending=false
   bverifyPostalCode_ViewSR=true
   If Not IsNull(strCountry) Then
       If Not VerifyInnerText (ViewSR.lblPostalCode(), strPostalCode, "Postal Code")Then
           bverifyPostalCode_ViewSR=false
       End If
   End If
   verifyPostalCode_ViewSR=bverifyPostalCode_ViewSR
End Function

'[Verify Field Current Address Line1 on View SR Page displayed as]
Public Function verifyCurrentAddressLine1_ViewSR(strCurrentAddressLine1)
   bDevPending=false
   bverifyCurrentAddressLine1_ViewSR=true
   If Not IsNull(strCurrentAddressLine1) Then
       If Not VerifyInnerText (ViewSR.lblCurrentAddressLine1(), strCurrentAddressLine1, "Current Address Line1")Then
           bverifyCurrentAddressLine1_ViewSR=false
       End If
   End If
   verifyCurrentAddressLine1_ViewSR=bverifyCurrentAddressLine1_ViewSR
End Function

'[Verify Field Current Address Line2 on View SR Page displayed as]
Public Function verifyCurrentAddressLine2_ViewSR(strCurrentAddressLine2)
   bDevPending=false
   bverifyCurrentAddressLine2_ViewSR=true
   If Not IsNull(strCurrentAddressLine2) Then
       If Not VerifyInnerText (ViewSR.lblCurrentAddressLine2(), strCurrentAddressLine2, "Current Address Line2")Then
           bverifyCurrentAddressLine2_ViewSR=false
       End If
   End If
   verifyCurrentAddressLine2_ViewSR=bverifyCurrentAddressLine2_ViewSR
End Function

'[Verify Field Current Address Line3 on View SR Page displayed as]
Public Function verifyCurrentAddressLine3_ViewSR(strCurrentAddressLine3)
   bDevPending=false
   bverifyCurrentAddressLine3_ViewSR=true
   If Not IsNull(strCurrentAddressLine3) Then
       If Not VerifyInnerText (ViewSR.lblCurrentAddressLine3(), strCurrentAddressLine3, "Current Address Line3")Then
           bverifyCurrentAddressLine3_ViewSR=false
       End If
   End If
   verifyCurrentAddressLine3_ViewSR=bverifyCurrentAddressLine3_ViewSR
End Function

'[Verify Field Current Address Line4 on View SR Page displayed as]
Public Function verifyCurrentAddressLine4_ViewSR(strCurrentAddressLine4)
   bDevPending=false
   bverifyCurrentAddressLine4_ViewSR=true
   If Not IsNull(strCurrentAddressLine4) Then
       If Not VerifyInnerText (ViewSR.lblCurrentAddressLine4(), strCurrentAddressLine4, "Current Address Line4")Then
           bverifyCurrentAddressLine4_ViewSR=false
       End If
   End If
   verifyCurrentAddressLine4_ViewSR=bverifyCurrentAddressLine4_ViewSR
End Function

'[Verify Field Current Address Line5 on View SR Page displayed as]
Public Function verifyCurrentAddressLine5_ViewSR(strCurrentAddressLine5)
   bDevPending=false
   bverifyCurrentAddressLine5_ViewSR=true
   If Not IsNull(strCurrentAddressLine5) Then
       If Not VerifyInnerText (ViewSR.lblCurrentAddressLine5(), strCurrentAddressLine5, "Current Address Line5")Then
           bCurrentverifyAddressLine5_ViewSR=false
       End If
   End If
   verifyCurrentAddressLine5_ViewSR=bCurrentverifyAddressLine5_ViewSR
End Function

'[Verify Field Current Country on View SR Page displayed as]
Public Function verifyCurrentCountry_ViewSR(strCurrentCountry)
   bDevPending=false
   bverifyCurrentCountry_ViewSR=true
   If Not IsNull(strCurrentCountry) Then
       If Not VerifyInnerText (ViewSR.lblCurrentCountry(), strCurrentCountry, "Current Country")Then
           bverifyCurrentCountry_ViewSR=false
       End If
   End If
   verifyCurrentCountry_ViewSR=bverifyCurrentCountry_ViewSR
End Function

'[Verify Field Current Postal Code on View SR Page displayed as]
Public Function verifyCurrentPostalCode_ViewSR(strCurrentPostalCode)
   bDevPending=false
   bverifyCurrentPostalCode_ViewSR=true
   If Not IsNull(strCurrentCountry) Then
       If Not VerifyInnerText (ViewSR.lblCurrentPostalCode(), strCurrentPostalCode, "Current Postal Code")Then
           bverifyCurrentPostalCode_ViewSR=false
       End If
   End If
   verifyCurrentPostalCode_ViewSR=bverifyCurrentPostalCode_ViewSR
End Function

'[Select Activity from View SR screen]
Public Function selectActivity_ViewSR(lstSRActivityData)
	 wait (2)
	'Browser("Browser_iCall_BlockCancelCard").Page("iCall_ViewSR_Common").WebElement("lblViewActivityDetails").click

	 'ViewSR.lblViewActivityDetails.fireevent "onmouseclick
	 ViewSR.lblViewActivityDetails.Click
	 wait (2)
	selectActivity_ViewSR=selectTableLink(CSO_TM_Home.tblSRActivityHeader,CSO_TM_Home.tblSRActivityContent,lstSRActivityData,"SRActivityRecords" ,"Created Date",False,null,null,null)
End Function


'********************Temp Limit*******************

'[Verify Field Admission date on View SR Page displayed as]
Public Function verifyAdmissionDate_ViewSR(strAdmissiondate)
   bDevPending=false
   bVerifyAdmissionDate=true
   If Not IsNull(strAdmissiondate) Then
       If Not VerifyInnerText (ViewSR.lblAdmissionDate(), strAdmissiondate, "Admission Date")Then
           bVerifyAdmissionDate=false
       End If
   End If
   verifyAdmissionDate_ViewSR=bVerifyAdmissionDate
End Function


'[Verify Field CostPerTable on View SR Page displayed as]
Public Function verifycostPerTable_ViewSR(strCostPerTable)
   bDevPending=false
   bVerifyCostPerTable=true
   If Not IsNull(strCostPerTable) Then
       If Not VerifyInnerText (ViewSR.lblCostPerTable(), strCostPerTable, "Cost Per Table")Then
           bVerifyCostPerTable=false
       End If
   End If
   verifycostPerTable_ViewSR=bVerifyCostPerTable
End Function

'[Verify Field Date Of Wedding on View SR Page displayed as]
Public Function verifyDateOfWedding_ViewSR(strDateOfWedding)
   bDevPending=false
   bVerifyDateOfWedding=true
   If Not IsNull(strDateOfWedding) Then
       If Not VerifyInnerText (ViewSR.lblDateOfWedding(), strDateOfWedding, "Date Of Wedding")Then
           bVerifyDateOfWedding=false
       End If
   End If
   verifyDateOfWedding_ViewSR=bVerifyDateOfWedding
End Function

'[Verify Field Hospital Name on View SR Page displayed as]
Public Function verifyHospitalName_ViewSR(strHospitalName)
   bDevPending=false
   bVerifyHospitalName=true
   If Not IsNull(strHospitalName) Then
       If Not VerifyInnerText (ViewSR.lblHospitalName(), strHospitalName, "Hospital Name")Then
           bVerifyHospitalName=false
       End If
   End If
   verifyHospitalName_ViewSR=bVerifyHospitalName
End Function

'[Verify Field Hotel Name on View SR Page displayed as]
Public Function verifyHotelName_ViewSR(strHotellName)
   bDevPending=false
   bVerifyHotelName=true
   If Not IsNull(strHotellName) Then
       If Not VerifyInnerText (ViewSR.lblHotelName(), strHotellName, "Hotel Name")Then
           bVerifyHotelName=false
       End If
   End If
   verifyHotelName_ViewSR=bVerifyHotelName
End Function

'[Verify Field NoOFTable on View SR Page displayed as]
Public Function verifyNoOfTable_ViewSR(strNoOfTable)
   bDevPending=false
   bVerifyNoOfTable=true
   If Not IsNull(strNoOfTable) Then
       If Not VerifyInnerText (ViewSR.lblNoOfTable(), strNoOfTable, "No Of Table")Then
           bVerifyNoOfTable=false
       End If
   End If
   verifyNoOfTable_ViewSR=bVerifyNoOfTable
End Function

'[Verify Field Special Instruction on View SR Page displayed as]
Public Function verifyNoOfTable_ViewSR(strSpecialInstruction)
   bDevPending=false
   bVerifySpecialInstruction=true
   If Not IsNull(strSpecialInstruction) Then
       If Not VerifyInnerText (ViewSR.lblSpecialInstruction(), strSpecialInstruction, "Special Instruction")Then
           bVerifySpecialInstruction=false
       End If
   End If
   verifyNoOfTable_ViewSR=bVerifySpecialInstruction
End Function

'[Verify Field Staff Indicator on View SR Page displayed as]
Public Function verifyStaffIndicator_ViewSR(strStaffIndicator)
   bDevPending=false
   bVerifyStaffIndicator=true
   If Not IsNull(strStaffIndicator) Then
       If Not VerifyInnerText (ViewSR.lblStaffIndicator(), strStaffIndicator, "Special Instruction")Then
           bVerifyStaffIndicator=false
       End If
   End If
   verifyStaffIndicator_ViewSR=bVerifyStaffIndicator
End Function

'[Verify Field Temp Eff date on View SR Page displayed as]
Public Function verifyTempEffDate_ViewSR(strTempEffDate)
   bDevPending=false
   bVerifyTempEffDate=true
   If Not IsNull(strTempEffDate) Then
       If Not VerifyInnerText (ViewSR.lblTempEffdate(), strTempEffDate, "Temp Eff Date")Then
           bVerifyTempEffDate=false
       End If
   End If
   verifyTempEffDate_ViewSR=bVerifyTempEffDate
End Function

'[Verify Field Temp Exp date on View SR Page displayed as]
Public Function verifyTempExpDate_ViewSR(strTempExpDate)
   bDevPending=false
   bVerifyTempExpDate=true
   If Not IsNull(strTempExpDate) Then
       If Not VerifyInnerText (ViewSR.lblTempExpdate(), strTempExpDate, "Temp Exp Date")Then
           bVerifyTempExpDate=false
       End If
   End If
   verifyTempExpDate_ViewSR=bVerifyTempExpDate
End Function

'[Verify Field Travel Period From on View SR Page displayed as]
Public Function verifyTravelPeriod_ViewSR(strTravelFrom)
   bDevPending=false
   bVerifyTravelPeriodFrom=true
   If Not IsNull(strTravelFrom) Then
       If Not VerifyInnerText (ViewSR.lblTravelPeriod(), strTravelFrom, "Temp Exp Date")Then
           bVerifyTravelPeriodFrom=false
       End If
   End If
   verifyTravelPeriod_ViewSR=bVerifyTravelPeriodFrom
End Function


'[Verify Field Travel Period To on View SR Page displayed as]
Public Function verifyTravelPeriodTo_ViewSR(strTravelTo)
   bDevPending=false
   bVerifyTravelPeriodTo=true
   If Not IsNull(strTravelTo) Then
       If Not VerifyInnerText (ViewSR.lblTO(), strTravelTo, "Travel To Date")Then
           bVerifyTravelPeriodTo=false
       End If
   End If
   verifyTravelPeriodTo_ViewSR=bVerifyTravelPeriodTo
End Function

'[Verify Field Request Reason on View SR Page displayed as]
Public Function verifyRequestReason_ViewSR(strRequestReason)
   bDevPending=false
   bVerifyRequestReason=true
   If Not IsNull(strRequestReason) Then
       If Not VerifyInnerText (ViewSR.lblRequestReason(), strRequestReason, "Requset Reason")Then
           bVerifyRequestReason=false
       End If
   End If
   verifyRequestReason_ViewSR=bVerifyRequestReason
End Function

'[Verify Field Treament date on View SR Page displayed as]
Public Function verifyTreamentDate_ViewSR(strTreatmentdate)
   bDevPending=false
   bVerifyTreamentDate=true
   If Not IsNull(strTreatmentdate) Then
       If Not VerifyInnerText (ViewSR.lblTreatmentDate(), strTreatmentdate, "Treatment Date")Then
           bVerifyTreamentDate=false
       End If
   End If
   verifyTreamentDate_ViewSR=bVerifyTreamentDate
End Function


'[Verify Field Duration days on View SR Page displayed as]
Public Function verifyDurationDays_ViewSR(strDurationDays)
   bDevPending=false
   bVerifyDurationdays=true
   If Not IsNull(strDurationDays) Then
       If Not VerifyInnerText (ViewSR.lblDurationDays(), strDurationDays, "Duration days")Then
           bVerifyDurationdays=false
       End If
   End If
   verifyDurationDays_ViewSR=bVerifyDurationdays
End Function

			'***************************** Billing Cycle Cange on 5th May15 by Manish
'[Verify Field Billing Cycle on View SR Page displayed as]
Public Function verifyBillingCycle_ViewSR(strBillingCycle)
   bDevPending=false
   bverifyBillingCycle_ViewSR=true
   If Not IsNull(strBillingCycle) Then
       If Not VerifyInnerText (ViewSR.lblBillingCycle(), strBillingCycle, "Billing Cycle")Then
           bverifyBillingCycle_ViewSR=false
       End If
   End If
   verifyBillingCycle_ViewSR=bverifyBillingCycle_ViewSR
End Function

'[Verify Field Statement Date on View SR Page displayed as]
Public Function verifyStatementDate_ViewSR(strStatementDate)
   bDevPending=false
   bverifyStatementDate_ViewSR=true
   If Not IsNull(strStatementDate) Then
       If Not VerifyInnerText (ViewSR.lblStatementDate(), strStatementDate, "Statement Date")Then
           bverifyStatementDate_ViewSR=false
       End If
   End If
   verifyStatementDate_ViewSR=bverifyStatementDate_ViewSR
End Function

'[Verify Field Payment Due Date on View SR Page displayed as]
Public Function verifyPaymentDueDate_ViewSR(strPaymentDueDate)
   bDevPending=false
   bverifyPaymentDueDate_ViewSR=true
   If Not IsNull(strPaymentDueDate) Then
       If Not VerifyInnerText (ViewSR.lblPaymentDueDate(), strPaymentDueDate, "Payment Due Date")Then
           bverifyPaymentDueDate_ViewSR=false
       End If
   End If
   verifyPaymentDueDate_ViewSR=bverifyPaymentDueDate_ViewSR
End Function

'[Verify Field New Billing Cycle on View SR Page displayed as]
Public Function verifyNewBillingCycle_ViewSR(strNewBillingCycle)
   bDevPending=false
   bverifyNewBillingCycle_ViewSR=true
   If Not IsNull(strNewBillingCycle) Then
       If Not VerifyInnerText (ViewSR.lblNewBillingCycle(), strNewBillingCycle, "New Billing Cycle")Then
           bverifyNewBillingCycle_ViewSR=false
       End If
   End If
   verifyNewBillingCycle_ViewSR=bverifyNewBillingCycle_ViewSR
End Function

'[Verify Field Next Statement Date on View SR Page displayed as]
Public Function verifyNextStatementDate_ViewSR(strNextStatementDate)
   bDevPending=false
   bverifyNextStatementDate_ViewSR=true
   If Not IsNull(strNextStatementDate) Then
       If Not VerifyInnerText (ViewSR.lblNextStatementDate(), strNextStatementDate, "Next Statement Date")Then
           bverifyNextStatementDate_ViewSR=false
       End If
   End If
   verifyNextStatementDate_ViewSR=bverifyNextStatementDate_ViewSR
End Function

'[Verify Field Next Payment Due Date on View SR Page displayed as]
Public Function verifyNextPaymentDueDate_ViewSR(strNextPaymentDueDate)
   bDevPending=false
   bverifyNextPaymentDueDate_ViewSR=true
   If Not IsNull(strNextPaymentDueDate) Then
       If Not VerifyInnerText (ViewSR.lblNextPaymentDueDate(), strNextPaymentDueDate, "Next Payment Due Date")Then
           bverifyNextPaymentDueDate_ViewSR=false
       End If
   End If
   verifyNextPaymentDueDate_ViewSR=bverifyNextPaymentDueDate_ViewSR
End Function

'[Verify Field Projected Due Date on View SR Page displayed as]
Public Function verifyProjectedDueDate_ViewSR(strProjectedDueDate)
   bDevPending=false
   bverifyProjectedDueDate_ViewSR=true
   If Not IsNull(strProjectedDueDate) Then
       If Not VerifyInnerText (ViewSR.lblProjectedDueDate(), strProjectedDueDate, "Projected Due Date")Then
           bverifyProjectedDueDate_ViewSR=false
       End If
   End If
   verifyProjectedDueDate_ViewSR=bverifyProjectedDueDate_ViewSR
End Function

'''''''''''''''''''''''''''''''''''''''' Capping Limit''''''''''''''''''''''''''''''''''''''''''

'[Verify CappedAt on View SR Page displayed as]
Public Function verifyCappingAt_ViewSR(strCappingType)
   bDevPending=false
   bverifyCappingAt=true
   If Not IsNull(strCappingType) Then
       If Not VerifyInnerText (ViewSR.lblCappedAt(), strCappingType, "Capping At")Then
         bverifyCappingAt=false
       End If
   End If
   verifyCappingAt_ViewSR=bverifyCappingAt
End Function

'[Verify Capped Limit on View SR Page displayed as]
Public Function verifyCappedLimit_ViewSR(strCappedAmount)
   bDevPending=false
   bverifyCappedLimit=true
   If Not IsNull(strCappedAmount) Then
       If Not VerifyInnerText (ViewSR.lblCappedLimit(), strCappedAmount, "Capped Limit")Then
         bverifyCappedLimit=false
       End If
   End If
   verifyCappedLimit_ViewSR=bverifyCappedLimit
End Function

'[Verify Capped Option on View SR Page displayed as]
Public Function verifyCappedOption_ViewSR(strReasonForCapping)
   bDevPending=false
   bverifyCappedOption=true
   If Not IsNull(strReasonForCapping) Then
       If Not VerifyInnerText (ViewSR.lblCappedOption(), strReasonForCapping, "Capped Option")Then
        bverifyCappedOption=false
       End If
   End If
   verifyCappedOption_ViewSR=bverifyCappedOption
End Function

'[Verify OutstandingBalanceAccount on View SR Page]
Public Function verifyOutstandingBalanceAccount_ViewSR()
   bDevPending=false
   bverifyOutstandingBalanceAccount=true
   If Not IsNull(strRunTimeAcctOutStandingBal) Then
       If Not VerifyInnerText (ViewSR.lblOutstandingBalance_Account(), strRunTimeAcctOutStandingBal, "OutstandingBalanceAccount")Then
        bverifyOutstandingBalanceAccount=false
       End If
   End If
   verifyOutstandingBalanceAccount_ViewSR=bverifyOutstandingBalanceAccount
End Function

'[Verify OutstandingBalanceCard on View SR Page]
Public Function verifyOutstandingBalanceCard_ViewSR()
   bDevPending=false
   bverifyOutstandingBalanceCard=true
   strRunTimeEmbosserOutStandingBal = strRunTimeEmbosserOutStandingBal&".00"
   If Not IsNull(strRunTimeEmbosserOutStandingBal) Then
       If Not VerifyInnerText (ViewSR.lblOutstandingBalance_Card(), strRunTimeEmbosserOutStandingBal, "OutstandingBalanceCard")Then
          bverifyOutstandingBalanceCard=false
       End If
   End If
   verifyOutstandingBalanceCard_ViewSR=bverifyOutstandingBalanceCard
End Function

'[Verify OutstandingBalanceRelationship on View SR Page]
Public Function verifyOutstandingBalanceRelationship_ViewSR()
   bDevPending=false
   bverifyOutstandingBalanceRelationship=true
   If Not IsNull(strRunTimeRtlOutStandingBal) Then
       If Not VerifyInnerText (ViewSR.lblOutstandingBalance_Relationship(), strRunTimeRtlOutStandingBal, "OutstandingBalanceRelationship")Then
        bverifyOutstandingBalanceRelationship=false
       End If
   End If
   verifyOutstandingBalanceRelationship_ViewSR=bverifyOutstandingBalanceRelationship
End Function

'''''

'[Verify CurrentCreditLimitAccount on View SR Page]
Public Function verifyCurrentCreditLimitAccount_ViewSR()
   bDevPending=false
   bverifyCurrentCreditLimitAccount=true
   If Not IsNull(strRunTimeAcctTotalCrLimit) Then
       If Not VerifyInnerText (ViewSR.lblCurrentCreditLimit_Account(), strRunTimeAcctTotalCrLimit, "CurrentCreditLimitAccount")Then
          bverifyCurrentCreditLimitAccount=false
       End If
   End If
   verifyCurrentCreditLimitAccount_ViewSR=bverifyCurrentCreditLimitAccount
End Function

'[Verify CurrentCreditLimitCard on View SR Page]
Public Function verifyCurrentCreditLimitCard_ViewSR()
   bDevPending=false
   bverifyCurrentCreditLimitCard=true
   If Not IsNull(strRunTimeEmbosserCrLimit) Then
       If Not VerifyInnerText (ViewSR.lblCurrentCreditLimit_Card(), strRunTimeEmbosserCrLimit, "CurrentCreditLimitCard")Then
         bverifyCurrentCreditLimitCard=false
       End If
   End If
   verifyCurrentCreditLimitCard_ViewSR=bverifyCurrentCreditLimitCard
End Function

'[Verify CurrentCreditLimitRelationship on View SR Page]
Public Function verifyCurrentCreditLimitRelationship_ViewSR()
   bDevPending=false
   bverifyCurrentCreditLimitRelationship=true
   If Not IsNull(strRunTimeRtlCrLimit) Then
       If Not VerifyInnerText (ViewSR.lblCurrentCreditLimit_Relationship(), strRunTimeRtlCrLimit, "CurrentCreditLimitRelationship")Then
         bverifyCurrentCreditLimitRelationship=false
       End If
   End If
   verifyCurrentCreditLimitRelationship_ViewSR=bverifyCurrentCreditLimitRelationship
End Function

''''''''''''''''''''''''''''''''''''Rewards Redemption

'[Verify Field Rewards Option Qty on View SR Page displayed as]
Public Function verifyQty_ViewSR(strQty)
   bDevPending=false
   bverifyQty_ViewSR=true
   If Not IsNull(strQty) Then
       If Not VerifyInnerText (ViewSR.lblRewardsQty(), strQty, "Quantity")Then
       LogMessage "WARN","Verification","Rewards Quantity - Expected "&strQty&" , Rewards Quantity - Actual "&strActualComment,false
           bverifyQty_ViewSR=false
       End If
   End If
   verifyQty_ViewSR=bverifyQty_ViewSR
End Function

'[Verify Field Rewards Option Category on View SR Page displayed as]
Public Function verifyCategory_ViewSR(strCategory)
   bDevPending=false
   bverifyCategory_ViewSR=true
   If Not IsNull(strCategory) Then
       If Not VerifyInnerText (ViewSR.lblRewardsQty(), strCategory, "Rewards Category")Then
           bverifyQty_ViewSR=false
       End If
   End If
   verifyCategory_ViewSR=bverifyCategory_ViewSR
End Function

'[Verify Field Rewards Option Product on View SR Page displayed as]
Public Function verifyProduct_ViewSR(strProduct)
   bDevPending=false
   bverifyProduct_ViewSR=true
   If Not IsNull(strProduct) Then
	       If Not VerifyInnerText (ViewSR.lblRewardsProduct(), strProduct, "Rewards Product")Then
	       LogMessage "WARN","Verification","Rewards Product - Expected "&strProduct&" , Rewards Product - Actual "&strActualComment,false
           bverifyProduct_ViewSR=false
       End If
   End If
   verifyProduct_ViewSR=bverifyProduct_ViewSR
End Function

'[Verify Subtotal on View SR Page displayed]
Public Function verifySubtotal_ViewSR()
   bDevPending=false
   bverifySubtotal_ViewSR=true
   If Not IsNull(strSubtotal) Then
       If Not VerifyInnerText (ViewSR.lblRewardsSubTotal(), strSubtotal, "Subtotal")Then
       LogMessage "WARN","Verification","Rewards Subtotal "&strSubtotal&" , Rewards Subtotal - Actual "&strActualComment,false
           bverifySubtotal_ViewSR=false
       End If
   End If
   verifySubtotal_ViewSR=bverifySubtotal_ViewSR
End Function

'[Verify Points Expired on View SR Page displayed]
Public Function verifyPointsExpired_ViewSR()
   bDevPending=false
   bverifyPointsExpired_ViewSR=true
   If Not IsNull(strPointsExpired) Then
   strExpected=clng(strPointsExpired)
       If Not VerifyInnerText (ViewSR.lblRewardsPointsExpire(), cstr(strExpected), "Expired Points")Then
       LogMessage "WARN","Verification","Rewards Points Expired "&strPointsExpired&" , Rewards Points Expired - Actual "&strActualComment,false
           bverifyPointsExpired_ViewSR=false
       End If
   End If
   verifyPointsExpired_ViewSR=bverifyPointsExpired_ViewSR
End Function

'[Verify AddressLine1 on View SR Page displayed as]
Public Function verifyAddressLine1RR_ViewSR()
   bDevPending=false
   bverifyAddressLine1_ViewSR=true
   If Not IsNull(strProduct) Then
       If Not VerifyInnerText (ViewSR.lblQty(), strProduct, "AddressLine1")Then
           bverifyTotalRedeemPoints_ViewSR=false
       End If
   End If
   verifyAddressLine1RR_ViewSR=bverifyAddressLine1_ViewSR
End Function

'[Verify Country on View SR Page displayed as]
Public Function verifyCountryRR_ViewSR()
   bDevPending=false
   bverifyCountry_ViewSR=true
   If Not IsNull(strProduct) Then
       If Not VerifyInnerText (ViewSR.lblQty(), strProduct, "Country")Then
           bverifyCountry_ViewSR=false
       End If
   End If
   verifyCountry_ViewSR=bverifyCountry_ViewSR
End Function

'[Click Button View Activity Details]
Public Function clickViewActivity()
   bDevPending=false
   ViewSR_Page.lblViewActivityDetails.click
   If Err.Number<>0 Then
       clickViewActivity=false
            LogMessage "WARN","Verification","Failed to Click Button : View Activity Details" ,false
       Exit Function
   End If
   waitForIcallLoading
   clickViewActivity=true
End Function

'[Verify Field Temp limit Request Reason on View SR Page displayed as]
Public Function verifyTempRequestReason_ViewSR(strRequestReason)
   bDevPending=false
   bVerifyRequestReason=true
   If Not IsNull(strRequestReason) Then
       If Not VerifyInnerText (ViewSR.lblTempReasonForChange(), strRequestReason, "Request Reason")Then
           bVerifyRequestReason=false
       End If
   End If
   verifyTempRequestReason_ViewSR=bVerifyRequestReason
End Function

''''''''''''''''''''''''''''''''''Cheque Book Request By Manish on 23 Nov 2015'''''''''''''''''''''''''''''''''''''''''''''''''''''''

'[Verify Field Created Date on View SR Page displayed as]
Public Function verifyCreatedDate_ViewSR(strCreatedDate)
   bverifyCreatedDate=true
   If Not IsNull(strCreatedDate) Then
       If Not VerifyInnerText (ViewSR.lblCreatedDate(), strCreatedDate, "Created Date")Then
           bverifyCreatedDate=false
       End If
   End If
   verifyCreatedDate_ViewSR=bverifyCreatedDate
End Function

'[Verify Field Closed Date on View SR Page displayed as]
Public Function verifyClosedDate_ViewSR(strClosedDate)
   bverifyClosedDate=true
   If Not IsNull(strClosedDate) Then
       If Not VerifyInnerText (ViewSR.lblClosedDate(), strClosedDate, "Closed Date")Then
           bverifyClosedDate=false
       End If
   End If
   verifyClosedDate_ViewSR=bverifyClosedDate
End Function

'[Verify Field Last Updated Date on View SR Page displayed as]
Public Function verifyLastUpdatedDate_ViewSR(strLastUpdatedDate)
   bverifyLastUpdatedDate=true
   If Not IsNull(strLastUpdatedDate) Then
       If Not VerifyInnerText (ViewSR.lblLastUpdatedDate(), strLastUpdatedDate, "Last Updated Date")Then
           bverifyLastUpdatedDate=false
       End If
   End If
   verifyLastUpdatedDate_ViewSR=bverifyLastUpdatedDate
End Function

'[Verify Field Available Balance on View SR Page displayed as]
Public Function verifyAvailableBalance_ViewSR(strAvailableBalance)
   bDevPending=false
   bverifyAvailableBalance_ViewSR=true
   If Not IsNull(strAvailableBalance) Then
       If Not VerifyInnerText (ViewSR.lblAvailableBalance(), strAvailableBalance, "Available Balance")Then
           bverifyAvailableBalance_ViewSR=false
       End If
   End If
   verifyAvailableBalance_ViewSR=bverifyAvailableBalance_ViewSR
End Function

'[Verify Field Block on View SR Page displayed as]
Public Function verifyBlock_ViewSR(strBlock)
   bDevPending=false
   bverifyBlock_ViewSR=true
   If Not IsNull(strBlock) Then
       If Not VerifyInnerText (ViewSR.lblBlock(), strBlock, "Block")Then
           bverifyBlock_ViewSR=false
       End If
   End If
   verifyBlock_ViewSR=bverifyBlock_ViewSR
End Function

'[Verify Field Level on View SR Page displayed as]
Public Function verifyLevel_ViewSR(strLevel)
   bDevPending=false
   bverifyLevel_ViewSR=true
   If Not IsNull(strLevel) Then
       If Not VerifyInnerText (ViewSR.lblLevel(), strLevel, "Level")Then
           bverifyLevel_ViewSR=false
       End If
   End If
   verifyLevel_ViewSR=bverifyLevel_ViewSR
End Function

'[Verify Field Unit on View SR Page displayed as]
Public Function verifyUnit_ViewSR(strUnit)
   bDevPending=false
   bverifyUnit_ViewSR=true
   If Not IsNull(strUnit) Then
       If Not VerifyInnerText (ViewSR.lblUnit(), strUnit, "Unit")Then
           bverifyUnit_ViewSR=false
       End If
   End If
   verifyUnit_ViewSR=bverifyUnit_ViewSR
End Function

'[Verify Field Number of Cheque Book on View SR Page displayed as]
Public Function verifyNoOfCB_ViewSR(strNoOfCB)
   bDevPending=false
   bverifyNoOfCB_ViewSR=true
   If Not IsNull(strNoOfCB) Then
       If Not VerifyInnerText (ViewSR.lblNumberofChequeBook(), strNoOfCB, "Number of Cheque Book")Then
           bverifyNoOfCB_ViewSR=false
       End If
   End If
   verifyNoOfCB_ViewSR=bverifyNoOfCB_ViewSR
End Function

'[Verify Field Dispatched Mode on View SR Page displayed as]
Public Function verifyDispatchedMode_ViewSR(strDispatchedMode)
   bverifyDispatchedMode_ViewSR=true
   If Not IsNull(strDispatchedMode) Then
       If Not VerifyInnerText (ViewSR.lblDispatchedMode(), strDispatchedMode, "Dispatched Mode")Then
           bverifyDispatchedMode_ViewSR=false
       End If
   End If
   verifyDispatchedMode_ViewSR=bverifyDispatchedMode_ViewSR
End Function

'[Verify Field Delivery Mode on View SR Page displayed as]
Public Function verifyDeliveryMode_ViewSR(strDeliveryMode)
   bverifyDeliveryMode_ViewSR=true
   If Not IsNull(strDeliveryMode) Then
       If Not VerifyInnerText (ViewSR.lblDeliveryMode(), strDeliveryMode, "Delivery Mode")Then
           bverifyDeliveryMode_ViewSR=false
       End If
   End If
   verifyDeliveryMode_ViewSR=bverifyDeliveryMode_ViewSR
End Function

'[Verify Field Waive Cheque Book Fee on View SR Page displayed as]
Public Function verifyWaiveCBFee_ViewSR(strWaiveCBFee)
   bDevPending=false
   bverifyWaiveCBFee_ViewSR=true
   If Not IsNull(strWaiveCBFee) Then
       If Not VerifyInnerText (ViewSR.lblWaiveCBFee(), strWaiveCBFee, "Waive Cheque Book Fee")Then
           bverifyWaiveCBFee_ViewSR=false
       End If
   End If
   verifyWaiveCBFee_ViewSR=bverifyWaiveCBFee_ViewSR
End Function

'[Verify Field Fee Waiver Reason on View SR Page displayed as]
Public Function verifyFeeWaiverReason_ViewSR(strFeeWaiverReason)
   bDevPending=false
   bverifyFeeWaiverReason_ViewSR=true
   If Not IsNull(strFeeWaiverReason) Then
       If Not VerifyInnerText (ViewSR.lblFeeWaiverReason(), strFeeWaiverReason, "Fee Waiver Reason")Then
           bverifyFeeWaiverReason_ViewSR=false
       End If
   End If
   verifyFeeWaiverReason_ViewSR=bverifyFeeWaiverReason_ViewSR
End Function

'[Verify Field Total Fee Charge on View SR Page displayed as]
Public Function verifyTotalFeeCharge_ViewSR(strTotalFeeCharge)
   bDevPending=false
   bverifyTotalFeeCharge_ViewSR=true
   If Not IsNull(strTotalFeeCharge) or strTotalFeeCharge = "NA" Then
       If Not VerifyInnerText (ViewSR.lblTotalFeeCharge(), strTotalFeeCharge, "Total Fee Charge")Then
           bverifyTotalFeeCharge_ViewSR=false
       End If
   End If
   verifyTotalFeeCharge_ViewSR=bverifyTotalFeeCharge_ViewSR
End Function

''''''''''''''''''''''''''''''''' For Cashline Cancellation (verifying the additional SR info) ''''''''''''''
'[Verify Reason for Cancellation on View SR Page displayed as]
Public Function verifyReasonForCancellation_ViewSR(strReasonForCancellation)
	bDevPending=false
	bverifyReasonForCancellation_ViewSR = true
	If Not IsNull(strReasonForCancellation) Then
       If Not VerifyInnerText (ViewSR.lblReasonForCancellation(), strReasonForCancellation, "Reason for Cancellation")Then
           bverifyReasonForCancellation_ViewSR=false
       End If
   End If
   verifyReasonForCancellation_ViewSR=bverifyReasonForCancellation_ViewSR
End Function

'[Verify Action for Credit Balance on View SR Page displayed as]
Public Function verifyActionForCreditBalance_ViewSR(strVerifyForCreditBalance)
	bDevPending=false
	bverifyActionForCreditBalance_ViewSR = true
	If Not IsNull(strVerifyForCreditBalance) Then
       If Not VerifyInnerText (ViewSR.lblActionForCreditBalance(), strVerifyForCreditBalance, "Action for Credit Balance")Then
           bverifyActionForCreditBalance_ViewSR=false
       End If
   End If
   verifyActionForCreditBalance_ViewSR=bverifyActionForCreditBalance_ViewSR
End Function

'[Verify Mode Of Disbursement on View SR Page displayed as]
Public Function verifyModeOfDisbursement_ViewSR(strModeofDisbursement)
	bDevPending=false
	bverifyModeOfDisbursement_ViewSR = true
	If Not IsNull(strModeofDisbursement) Then
       If Not VerifyInnerText (ViewSR.lblModeOfDisbursement(), strModeofDisbursement, "Action for Mode of Disbursement")Then
           bverifyModeOfDisbursement_ViewSR=false
       End If
   End If
   verifyModeOfDisbursement_ViewSR=bverifyModeOfDisbursement_ViewSR
End Function

'[Verify Postal Code on View SR Page displayed as]
Public Function verifyPostalCode_ViewSR(strPostalCode)
	bDevPending=false
	bverifyPostalCode_ViewSR = true
	If Not IsNull(strPostalCode) Then
       If Not VerifyInnerText (ViewSR.lblPostalCode(), strPostalCode, "Action for Postal Code")Then
           bverifyPostalCode_ViewSR=false
       End If
   End If
   verifyPostalCode_ViewSR=bverifyPostalCode_ViewSR
End Function

'[Verify Address Line 1 on View SR Page displayed as]
Public Function verifyAddressLine1_ViewSR(strAddressLine1)
	bDevPending=false
	bverifyAddressLine1_ViewSR = true
	If Not IsNull(strAddressLine1) Then
       If Not VerifyInnerText (ViewSR.lblAddressLine1(), strAddressLine1, "Action for Address Line 1")Then
           bverifyAddressLine1_ViewSR=false
       End If
   End If
   verifyAddressLine1_ViewSR=bverifyAddressLine1_ViewSR
End Function

'[Verify Address Line 2 on View SR Page displayed as]
Public Function verifyAddressLine2_ViewSR(strAddressLine2)
	bDevPending=false
	bverifyAddressLine2_ViewSR = true
	If Not IsNull(strAddressLine2) Then
       If Not VerifyInnerText (ViewSR.lblAddressLine2(), strAddressLine2, "Action for Address Line 2")Then
           bverifyAddressLine2_ViewSR=false
       End If
   End If
   verifyAddressLine2_ViewSR=bverifyAddressLine2_ViewSR
End Function


'************* Failed SR
'[Click Button Update Request for failed SR]
Public Function clickUpdateRequest()
   bclickUpdateRequest=true
   Wait 1
   ViewSR.btnUpdateRequest.click
   If Err.Number<>0 Then
       clickUpdateRequest=false
            LogMessage "WARN","Verification","Failed to Click Button : Update Request" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickUpdateRequest=true
End Function

'[Verify Combobox Status on Confirmation Popup displayed as]
Public Function verifyStatus_ConfirmationPopup(strStatus)
   bDevPending=false
   bverifyStatus_ConfirmationPopup=true
   If Not IsNull(strStatus) Then
       If Not verifyComboSelectItem (ViewSR.lstStatus_ConfirmationPopup(), strStatus, "Status")Then
           bverifyStatus_ConfirmationPopup=false
       End If
   End If
   verifyStatus_ConfirmationPopup=bverifyStatus_ConfirmationPopup
End Function

'[Select Combobox Status on Confirmation Popup]
Public Function selectStatus_ConfirmationPopup(strStatus)
	bselectStatus_ConfirmationPopup=true
	If Not IsNull(strStatus) Then
       If Not (selectItem_Combobox (ViewSR.lstStatus_ConfirmationPopup(), strStatus))Then
            LogMessage "WARN","Verification","Failed to select :"&strStatus&" From status drop down list" ,false
           bselectStatus_ConfirmationPopup=false
       End If
   End If
   WaitForICallLoading
   selectStatus_ConfirmationPopup=bselectStatus_ConfirmationPopup
End Function

'[Verify Combobox SubStatus on Confirmation Popup displayed as]
Public Function verifySubStatus_ConfirmationPopup(strSubStatus)
   bDevPending=false
   bverifySubStatus_ConfirmationPopup=true
   If Not IsNull(strSubStatus) Then
       If Not verifyComboSelectItem (ViewSR.lstSubStatus_ConfirmationPopup(), strSubStatus, "SubStatus")Then
           bverifySubStatus_ConfirmationPopup=false
       End If
   End If
   verifySubStatus_ConfirmationPopup=bverifySubStatus_ConfirmationPopup
End Function

'[Select Combobox SubStatus on Confirmation Popup]
Public Function selectSubStatus_ConfirmationPopup(strSubStatus)
	bselectSubStatus_ConfirmationPopup=true
	If Not IsNull(strSubStatus) Then
       If Not (selectItem_Combobox (ViewSR.lstSubStatus_ConfirmationPopup(), strSubStatus))Then
            LogMessage "WARN","Verification","Failed to select :"&strSubStatus&" From Substatus drop down list" ,false
           bselectSubStatus_ConfirmationPopup=false
       End If
   End If
   WaitForICallLoading
   selectSubStatus_ConfirmationPopup=bselectSubStatus_ConfirmationPopup
End Function

'[Verify Combobox Request Executed on Confirmation Popup displayed as]
Public Function verifyRequestExecuted_ConfirmationPopup(strRequestExecuted)
   bDevPending=false
   bverifyRequestExecuted_ConfirmationPopup=true
   If Not IsNull(strRequestExecuted) Then
       If Not verifyComboSelectItem (ViewSR.lstRequestExecuted_ConfirmationPopup(), strRequestExecuted, "RequestExecuted")Then
           bverifyRequestExecuted_ConfirmationPopup=false
       End If
   End If
   verifyRequestExecuted_ConfirmationPopup=bverifyRequestExecuted_ConfirmationPopup
End Function

'[Select Combobox Request Executed on Confirmation Popup]
Public Function selectRequestExecuted_ConfirmationPopup(strRequestExecuted)
	bselectRequestExecuted_ConfirmationPopup=true
	If Not IsNull(strRequestExecuted) Then
       If Not (selectItem_Combobox (ViewSR.lstRequestExecuted_ConfirmationPopup(), strRequestExecuted))Then
            LogMessage "WARN","Verification","Failed to select :"&strRequestExecuted&" From Request Executed drop down list" ,false
           bselectRequestExecuted_ConfirmationPopup=false
       End If
   End If
   WaitForICallLoading
   selectRequestExecuted_ConfirmationPopup=bselectRequestExecuted_ConfirmationPopup
End Function

'[Click Button Cancel on Confirmation Popup for failed SR]
Public Function clickbtnCancel_ConfirmationPopup()
   bclickUpdateRequest=true
   Wait 1
   ViewSR.btnCancel_ConfirmationPopup.click
   If Err.Number<>0 Then
       clickbtnCancel_ConfirmationPopup=false
       LogMessage "WARN","Verification","Failed to Click Button : Cancel" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickbtnCancel_ConfirmationPopup=true
End Function

'[Verify Button Submit on Confirmation Popup is enabled]
Public Function VerifybtnSubmit_ConfirmationPopup(bEnabled)
	bDevPending=false
   Dim bVerifyButtonSubmit:bVerifyButtonSubmit=true
	intBtnSubmit=Instr(ViewSR.btnSubmit_ConfirmationPopup.Object.GetAttribute("disabled"),("disabled"))
	If bEnabled Then
		If  intBtnSubmit=0 Then
			LogMessage "RSLT","Verification","Submit button is enable as per expectation.",True
			bVerifyButtonSubmit=true
		Else
			LogMessage "WARN","Verifiation","Submit button is disable. Expected to be enable.",false
			bVerifyButtonSubmit=false
		End If
	else
		If  intBtnSubmit<>0 Then
			LogMessage "RSLT","Verification","Submit button is disabled as per expectation.",True
			bVerifyButtonSubmit=true
		Else
			LogMessage "WARN","Verifiation","Submit button is Enabled. Expected to be disabled.",false
			bVerifyButtonSubmit=false
		End If
	End If
    VerifybtnSubmit_ConfirmationPopup=bVerifyButtonSubmit
End Function

'[Click Button Submit on Confirmation Popup for failed SR]
Public Function clickbtnSubmit_ConfirmationPopup()
   bclickUpdateRequest=true
   Wait 1
   ViewSR.btnSubmit_ConfirmationPopup.click
   If Err.Number<>0 Then
       clickbtnSubmit_ConfirmationPopup=false
       LogMessage "WARN","Verification","Failed to Click Button : Submit" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickbtnSubmit_ConfirmationPopup=true
End Function

'[Click Button Retry on failed SR]
Public Function clickbtnRetry_ConfirmationPopup()
   bclickUpdateRequest=true
   Wait 1
   ViewSR.btnRetry.click
   If Err.Number<>0 Then
       clickbtnRetry_ConfirmationPopup=false
       LogMessage "WARN","Verification","Failed to Click Button : Retry" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickbtnRetry_ConfirmationPopup=true
End Function

''''''''''''''''''''''''''''''''' For Fee Reveresal (verifying the additional info) added by  16 March 2016 ''''''''''''''''''''''''''''''''

'[Click Additional Info section from View SR screen]
Public Function selectAdditionalInfo_ViewSR()
	 wait (2)
	 ViewSR.lblAdditionalSRInfo.Click
	 selectAdditionalInfo_ViewSR = true
End Function

'[Verify Additional SR Info Fee Reversal Type]
Public Function verifyFeeReversalType_ViewSR(strFeeReversalType)
	bDevPending=false
	bverifyFeeReversalType = true
	If Not IsNull(strFeeReversalType) Then
       If Not VerifyInnerText (ViewSR.lblFeeReversalType(), strFeeReversalType, "FeeReversal type in Additional Info section")Then
           bverifyFeeReversalType=false
       End If
   End If
   verifyFeeReversalType_ViewSR=bverifyFeeReversalType
End Function

'[Verify Additional SR Info Requested Amount]
Public Function verifyFeeRequestedAmount_ViewSR(strRequestedAmount)
	bverifyFeeRequestedAmount = true
	'strRequestedAmount = FormatNumber(strRequestedAmount,2)
	If Not IsNull(strRequestedAmount) Then
       If Not VerifyInnerText (ViewSR.lblRequestedAmount_FR(), strRequestedAmount, "Requested Amount in Additional Info section")Then
           bverifyFeeRequestedAmount=false
       End If
   End If
   verifyFeeRequestedAmount_ViewSR=bverifyFeeRequestedAmount
End Function

'[Verify Additional SR Info Receiving Account]
Public Function verifyFeeReceivingAccount_ViewSR(strReceivingAccount)
	bverifyFeeRequestedAmount = true
	If Not IsNull(strReceivingAccount) Then
       If Not VerifyInnerText (ViewSR.lblReceivingAccount(), strReceivingAccount, "Receiving Account in Additional Info section")Then
           bverifyFeeRequestedAmount=false
       End If
   End If
   verifyFeeReceivingAccount_ViewSR=bverifyFeeRequestedAmount
End Function

'[Verify Additional SR Info Suppressed Interest]
Public Function verifyFeeSuppressedInterest_ViewSR(strSuppInterest)
	bDevPending=false
	bverifySuppressedInterest = true
	If Not IsNull(strSuppInterest) Then
       If Not VerifyInnerText (ViewSR.lblSuppressedInterest(), strSuppInterest, "Suppressed Interest in Additional Info section")Then
           bverifySuppressedInterest=false
       End If
   End If
   verifyFeeSuppressedInterest_ViewSR=bverifySuppressedInterest
End Function

'[Verify Additional SR Info SMS and Mobile Number displayed as]
Public Function verifyFeeSMSnMobileNumber_ViewSR(strSMSFlag, strMobileNumber)
	bDevPending=false
	bverifyFeeSMSnMobileNumber_ViewSR = true
	If Not IsNull(strSMSFlag) Then
       If Not VerifyInnerText (ViewSR.lblMSFlag(), strSMSFlag, "SMS Flag in Additional Info section")Then
           bverifyFeeSMSnMobileNumber_ViewSR=false
       End If
       If Not VerifyInnerText (ViewSR.lblMobileNumber(), strMobileNumber, "MobileNumber in Additional Info section")Then
           bverifyFeeSMSnMobileNumber_ViewSR=false
       End If
   End If
   bverifyFeeSMSnMobileNumber_ViewSR=bverifyFeeSMSnMobileNumber_ViewSR
End Function

'[Verify Additional SR Info Debiting Account]
Public Function verifyDebitingAccount_ViewSR(strDebitingAccount)
	bDevPending=false
	bverifyDebitingAccount_ViewSR = true
	If Not IsNull(strDebitingAccount) Then
       If Not VerifyInnerText (ViewSR.lblDebitingAccount(), strDebitingAccount, "Debiting Account")Then
           bverifyDebitingAccount_ViewSR=false
       End If
   End If
   verifyDebitingAccount_ViewSR=bverifyDebitingAccount_ViewSR
End Function

'[Verify Additional SR Info Request Type]
Public Function verifyRequestType_ViewSR(strRequestType)
	bDevPending=false
	bverifyRequestType_ViewSR = true
	If Not IsNull(strRequestType) Then
       If Not VerifyInnerText (ViewSR.lblRequestType(), strRequestType, "Request Type")Then
           bverifyRequestType_ViewSR=false
       End If
   End If
   verifyRequestType_ViewSR=bverifyRequestType_ViewSR
End Function

'[Verify Additional SR Info Bank Account No]
Public Function verifyBankAccountNo_ViewSR(strBankAccountNo)
	bverifyBankAccountNo_ViewSR = true
	If Not IsNull(strBankAccountNo) Then
       If Not VerifyInnerText (ViewSR.lblBankAccountNo(), strBankAccountNo, "Bank Account No")Then
           bverifyBankAccountNo_ViewSR=false
       End If
   End If
   verifyBankAccountNo_ViewSR=bverifyBankAccountNo_ViewSR
End Function

'[Verify Additional SR Info Payment]
Public Function verifyPayment_ViewSR(strPayment)
	bDevPending=false
	bverifyPayment_ViewSR = true
	If Not IsNull(strPayment) Then
       If Not VerifyInnerText (ViewSR.lblPayment(), strPayment, "Payment")Then
           bverifyPayment_ViewSR=false
       End If
   End If
   verifyPayment_ViewSR=bverifyPayment_ViewSR
End Function

'[Verify Field Status for Additional SR Info on ViewSR Screen displayed as]
Public Function verifyStatus_ViewAdditionalSR(strStatus)
   bDevPending=False
   bVerifyStatus_ViewSRText=true
   If Not IsNull(strStatus) Then
       If Not VerifyInnerText (ViewSR.lblStatus_AdditionalSR(), strStatus, "Status_AdditionalSR")Then
           bVerifyStatus_ViewSRText=false
       End If
   End If
   verifyStatus_ViewAdditionalSR=bVerifyStatus_ViewSRText
End Function

''''''''''''''''''''''''''''''''' For Icomm (verifying the additional info) added by  16 March 2016 ''''''''''''''''''''''''''''''''

'[Verify Additional SR Info Mobile No]
Public Function verifyAddInfoMobileNo_ViewSR(strMobileNo)
	bDevPending=false
	bverifyAddInfoMobileNo = true
	If Not IsNull(strMobileNo) Then
       If Not VerifyInnerText (ViewSR.lblMobileNumber(), strMobileNo, "Mobile No in Additional Info section")Then
           bverifyAddInfoMobileNo=false
       End If
   End If
   verifyAddInfoMobileNo_ViewSR=bverifyAddInfoMobileNo
End Function

'[Verify Additional SR Info SMS Template]
Public Function verifyAddInfoSMSTemplate_ViewSR(strSMSTemplate)
	bDevPending=false
	bverifyAddInfoSMSTemplate = true
	If Not IsNull(strSMSTemplate) Then
       If Not VerifyInnerText (ViewSR.lblAdditionalInfoSMSTemplate(), strSMSTemplate, "SMS Template in Additional Info section")Then
           bverifyAddInfoSMSTemplate=false
       End If
   End If
   verifyAddInfoSMSTemplate_ViewSR=bverifyAddInfoSMSTemplate
End Function

'[Verify Additional SR Info Hours]
Public Function verifyAddInfoHours_ViewSR(strHours)
	bDevPending=false
	bverifyAddInfoHours = true
	If Not IsNull(strHours) Then
       If Not VerifyInnerText (ViewSR.lblReceivingAccount(), strHours, "No Of Hours in Additional Info section")Then
           bverifyAddInfoHours=false
       End If
   End If
   verifyAddInfoHours_ViewSR=bverifyAddInfoHours
End Function

'[Verify Additional SR Info SMS Text]
Public Function verifyAddInfoSMSText_ViewSR(strSMSText)
	bDevPending=false
	bverifyAddInfoSMSText = true
	If Not IsNull(strSMSText) Then
       If Not VerifyInnerText (ViewSR.lblAdditionalInfoSMSText(), strSMSText, "SMS Text in Additional Info section")Then
           bverifyAddInfoSMSText=false
       End If
   End If
   verifyAddInfoSMSText_ViewSR=bverifyAddInfoSMSText
End Function

'[Verify Additional SR Info Registered Mobile Number]
Public Function verifyAddInfoRegisterMobileNO_ViewSR(strRegisMobileNumber)
	bDevPending=false
	bverifyAddInfoRegisterMobileNO = true
	If Not IsNull(strRegisMobileNumber) Then
       If Not VerifyInnerText (ViewSR.lblAdditionalInfoRegisterMobileNo(), strRegisMobileNumber, "Registered Mobile No in Additional Info section")Then
           bverifyAddInfoRegisterMobileNO=false
       End If
   End If
   verifyAddInfoRegisterMobileNO_ViewSR=bverifyAddInfoRegisterMobileNO
End Function

'***************************** FOR SI STP
'[Verify Bank Account No in Additional SR]
Public Function verifyBankAcctNo_AdditionalSR(strBankAcctNo)
	verifyBankAcctNo_AdditionalSR = true
	If Not IsNull(strBankAcctNo) Then
       If Not VerifyInnerText (ViewSR.lblBankAcctNo_AdditionalSR(), strBankAcctNo, "Bank Account No in Additional SR")Then
           verifyBankAcctNo_AdditionalSR=false
       End If
   End If
   verifyBankAcctNo_AdditionalSR = true
End Function

'[Verify Product Description in Additional SR]
Public Function verifyProdDesc_AdditionalSR(strProdDesc)
	verifyProdDesc_AdditionalSR = true
	If Not IsNull(strProdDesc) Then
       If Not VerifyInnerText (ViewSR.lblProdDesc_AdditionalSR(), strProdDesc, "Product Description in Additional SR")Then
           verifyProdDesc_AdditionalSR=false
       End If
   End If
   verifyProdDesc_AdditionalSR = true
End Function

'[Verify Module displayed in Additional SR]
Public Function VerifyModule_AdditionalSR(strModule)
	VerifyModule_AdditionalSR = true
	If Not IsNull(strModule) Then
       If Not VerifyInnerText (ViewSR.lblModule(), strModule, "Module") Then
           VerifyModule_AdditionalSR=false
       End If
   End If
   verifyModule_AdditionalSR = true
End Function

'[Verify Beneficiary Full Name in Additional SR]
Public Function verifyBenFullName_AdditionalSR(strBenFullName)
	verifyBenFullName_AdditionalSR = true
	If Not IsNull(strBenFullName) Then
       If Not VerifyInnerText (ViewSR.lblBenFullName_AdditionalSR(), strBenFullName, "Beneficiary Full Name in Additional SR")Then
           verifyBenFullName_AdditionalSR=false
       End If
   End If
   verifyBenFullName_AdditionalSR = true
End Function

'[Verify Beneficiary Bank Code in Additional SR]
Public Function verifyBenBankCode_AdditionalSR(strBenBankCode)
	verifyBenBankCode_AdditionalSR = true
	If Not IsNull(strBenBankCode) Then
       If Not VerifyInnerText (ViewSR.lblBenBankCode_AdditionalSR(), strBenBankCode, "Beneficiary Bank Code in Additional SR")Then
           verifyBenBankCode_AdditionalSR=false
       End If
   End If
   verifyBenBankCode_AdditionalSR = true
End Function

'[Verify Beneficiary Account No in Additional SR]
Public Function verifyBenAcctNo_AdditionalSR(strBenAcctNo)
	verifyBenAcctNo_AdditionalSR = true
	If Not IsNull(strBenAcctNo) Then
       If Not VerifyInnerText (ViewSR.lblBenAcctNo_AdditionalSR(), strBenAcctNo, "Beneficiary Account No in Additional SR")Then
           verifyBenAcctNo_AdditionalSR=false
       End If
   End If
   verifyBenAcctNo_AdditionalSR = true
End Function

'[Verify Reference No in Additional SR]
Public Function verifyRefNo_AdditionalSR(strRefNo)
	verifyRefNo_AdditionalSR = true
	If Not IsNull(strRefNo) Then
       If Not VerifyInnerText (ViewSR.lblRefNo_AdditionalSR(), strRefNo, "Reference No in Additional SR")Then
           verifyRefNo_AdditionalSR=false
       End If
   End If
   verifyRefNo_AdditionalSR = true
End Function

'[Verify Frequency or Day in Additional SR]
Public Function verifyFreqDay_ViewSR(strDayFreq)
	bverifyPaymentFreq= true
	If Not IsNull(strDayFreq) Then
       If Not VerifyInnerText (ViewSR.lblFrequencyDay(), strDayFreq, "Frequency/Day") Then
           bverifyPaymentFreq=false
       End If
   End If
   verifyFreqDay_ViewSR = bverifyPaymentFreq
End Function

'[Verify Frequency of Payment in Additional SR]
Public Function verifyPaymentFreq_ViewSR(strPaymentFreq)
	bverifyPaymentFreq= true
	If Not IsNull(strPaymentFreq) Then
       If Not VerifyInnerText (ViewSR.lblPaymentFrequency(), strPaymentFreq, "Payment Frequency") Then
           bverifyPaymentFreq=false
       End If
   End If
   verifyPaymentFreq_ViewSR = bverifyPaymentFreq
End Function

'[Verify Day of Payment in Additional SR]
Public Function verifyPaymentDay_ViewSR(strPaymentDay)
	bverifyPaymentDay= true
	If Not IsNull(strPaymentDay) Then
       If Not VerifyInnerText (ViewSR.lblPaymentDay(), strPaymentDay, "Payment Day") Then
           bverifyPaymentDay=false
       End If
   End If
   verifyPaymentDay_ViewSR = bverifyPaymentDay
End Function

'[Verify Date of First Payment in Additional SR]
Public Function verifyFirstPaymentDate_ViewSR(strFirstPaymentDate)
	bverifyFirstPaymentDate = true
	If Not IsNull(strFirstPaymentDate) Then
       If Not VerifyInnerText (ViewSR.lblFirstPaymentDate(), strFirstPaymentDate, "First Payment Date ")Then
           bverifyFirstPaymentDate=false
       End If
   End If
   verifyFirstPaymentDate_ViewSR = bverifyFirstPaymentDate
End Function

'[Verify Date of last Payment in Additional SR]
Public Function verifyLastPaymentDate_ViewSR(strlastPaymentDate)
	bverifyLastPaymentDate = true
	If Not IsNull(strlastPaymentDate) Then
       If Not VerifyInnerText (ViewSR.lblLastPaymentDate(), strlastPaymentDate, "Last Payment Date")Then
           bverifyLastPaymentDate=false
       End If
   End If
   verifyLastPaymentDate_ViewSR = bverifyLastPaymentDate
End Function

'[Verify Payment Amount in Additional SR]
Public Function verifyPaymentAmount_ViewSR(strPaymentAmount)
	bverifyPaymentAmount = true
	If Not IsNull(strPaymentAmount) Then
       If Not VerifyInnerText (ViewSR.lblPaymentAmount(), strPaymentAmount, "Payment Amount")Then
           bverifyPaymentAmount=false
       End If
   End If
   verifyPaymentAmount_ViewSR = bverifyPaymentAmount
End Function

'[Verify Amount of Last Payment in Additional SR]
Public Function verifyLastPaymentAmount_ViewSR(strLastPaymentAmount)
	bverifyLastPaymentAmount = true
	If Not IsNull(strLastPaymentAmount) Then
       If Not VerifyInnerText (ViewSR.lblLastPaymentAmount(), strLastPaymentAmount, "Amount of Last Payment")Then
           bverifyLastPaymentAmount=false
       End If
   End If
   verifyLastPaymentAmount_ViewSR = bverifyLastPaymentAmount
End Function

'[Verify Account to be charged in Additional SR]
Public Function verifyAccountCharged_ViewSR(strAccCharged)
	bverifyAccountCharged = true
	If Not IsNull(strAccCharged) Then
       If Not VerifyInnerText (ViewSR.lblAccounttobecharged(), strAccCharged, "Account to be charged") Then
           bverifyAccountCharged=false
       End If
   End If
   verifyAccountCharged_ViewSR = bverifyAccountCharged
End Function

'=====================================================================================================================
'[Click on Edit SR button]
Public Function editSR()
	editSR = true
	ViewSR.btnEdit().Click
	If err.number <> 0 Then
		LogMessage "WARN","Verification","Failed to Click Edit Button" ,false
		editSR = false
	else
		LogMessage "RSLT","Verification","Edit button clicked successfully." ,True
	End If
End Function

'[Verify IWF Comments History in View SR Page]
Public Function verifyIWFCommentsHistory(arrRowDataList)
	'Click on IWF Comments History tab
	ViewSR.lblIWFCommentsHistory().Click
	verifyIWFCommentsHistory=verifyTableContentList(ViewSR.tblIWFCommentsHistoryHeader,ViewSR.tblIWFCommentsHistoryContents,arrRowDataList,"IWF Comments History" , False,Null ,Null,Null)
End Function

'[Navigate to New IA via SR Page]
Public Function navigateToNewIA()
	navigateToNewIA = true
	'Click on view Activity details
	ViewSR.lblViewActivityDetails().Click
	If err.number = 0 Then
		'No error occurred on clicking
		LogMessage "RSLT", "Verification", "View Activity Details tab clicked.", True 
	End If
	ViewSR.lblAddActivity().Click
	If err.number = 0 Then
		'No error occurred on clicking
		LogMessage "RSLT", "Verification", "Add activity link clicked.", True 
	End If
End Function

'Added by Kalyan Prospects 1603 Dated 28/07/2016

'[Verify Field RefNo for Prospects displayed as]
Public Function verifyRefNoProspects(strRefNo)
   bDevPending=false
   bverifyRefNoProspects=true
	
   If Not IsNull(strRefNo) Then
     If Not VerifyInnerText (ViewSR.lblProspectsRef(), strRefNo, "Ref No")Then
	   bverifyRefNoProspects=false
	End If
   End If
   verifyRefNoProspects=bverifyRefNoProspects
End Function

'[Verify Field NRIC for Prospects displayed as]
Public Function verifyNRICProspects(strNRIC)
   bDevPending=false
   bverifyNRICProspects=true
	
   If Not IsNull(strNRIC) Then
     If Not VerifyInnerText (ViewSR.lblProspectsNRIC(), strNRIC, "NRIC")Then
	   bverifyNRICProspects=false
	End If
   End If
   verifyNRICProspects=bverifyNRICProspects
End Function

'[Verify Field Mobile for Prospects displayed as]
Public Function verifyMobileProspects(strMobile)
   bDevPending=false
   bverifyMobileProspects=true
	
   If Not IsNull(strMobile) Then
     If Not VerifyInnerText (ViewSR.lblProspectsMobile(), strMobile, "Mobile")Then
	   bverifyMobileProspects=false
	End If
   End If
   verifyMobileProspects=bverifyMobileProspects
End Function

'[Verify Field FirstName for Prospects displayed as]
Public Function verifyFstNameProspects(strFstName)
   bDevPending=false
   bverifyFstNameProspects=true
	
   If Not IsNull(strFstName) Then
     If Not VerifyInnerText (ViewSR.lblProspectsFirstName(), strFstName, "FirstName")Then
	   bverifyFstNameProspects=false
	End If
   End If
   verifyFstNameProspects=bverifyFstNameProspects
End Function

'[Verify Field DOB for Prospects displayed as]
Public Function verifyDOBProspects(strDOB)
   bDevPending=false
   bverifyDOBProspects=true
	
   If Not IsNull(strDOB) Then
     If Not VerifyInnerText (ViewSR.lblProspectsDateofBirth(), strDOB, "DOB")Then
	   bverifyDOBProspects=false
	End If
   End If
   verifyDOBProspects=bverifyDOBProspects
End Function

'[Verify Field EmailId for Prospects displayed as]
Public Function verifyEmailIdProspects(strEmailId)
   bDevPending=false
   bverifyEmailIdProspects=true
	
   If Not IsNull(strEmailId) Then
     If Not VerifyInnerText (ViewSR.lblProspectsEmailID(), strEmailId, "EmailId")Then
	   bverifyEmailIdProspects=false
	End If
   End If
   verifyEmailIdProspects=bverifyEmailIdProspects
End Function

'[Verify Field LastName for Prospects displayed as]
Public Function verifyLstNameProspects(strLstName)
   bDevPending=false
   bverifyLstNameProspects=true
	
   If Not IsNull(strLstName) Then
     If Not VerifyInnerText (ViewSR.lblProspectsLastName(), strLstName, "LastName")Then
	   bverifyLstNameProspects=false
	End If
   End If
   verifyLstNameProspects=bverifyLstNameProspects
End Function

'[Verify the additonal SR info for different card replacement]
Public Function verifyAdditionalInfo_ReplaceCard(lstAdditonalDetails)
	
	bverifyAdditionalInfo_ReplaceCard = true
	intSize = Ubound(lstAdditonalDetails)
	For Iterator = 0 To intSize Step 1
		arrLabel = trim(Split(lstAdditonalDetails(Iterator),":")(0))
		arrValue = trim(Split(lstAdditonalDetails(Iterator),":")(1))
		
	Select Case (arrLabel)
		Case "Replacement Reason"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (ViewSR.lblReplacementReason(), arrValue, "Replacement Reason")Then
				LogMessage "RSLT","Verification","Additonal details - Replacement Reason:"&arrValue&" is not displayed as expected",false
				bverifyAdditionalInfo_ReplaceCard=false
			End If
		End If
		
		Case "New Embossing Name"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (ViewSR.lblNewEmbossingName(), arrValue, "New Embossing Name")Then
				LogMessage "RSLT","Verification","Additonal details - New Embossing Name:"&arrValue&" is not displayed as expected",false
				bverifyAdditionalInfo_ReplaceCard=false
			End If
		End If
	
		Case "New Card Type"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (ViewSR.lblNewCardType(), arrValue, "New Card Type")Then
				LogMessage "RSLT","Verification","Additonal details - New Card Type:"&arrValue&" is not displayed as expected",false
				bverifyAdditionalInfo_ReplaceCard=false
			End If
		End If
		
		Case "Waive Fee"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (ViewSR.lblWaiveReplFee(), arrValue, "Waive Fee")Then
				LogMessage "RSLT","Verification","Additonal details - Waive Fee:"&arrValue&" is not displayed as expected",false
				bverifyAdditionalInfo_ReplaceCard=false
			End If
		End If
		
		Case "Urgency"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (ViewSR.lblUrgency(), arrValue, "Urgency")Then
				LogMessage "RSLT","Verification","Additonal details - Urgency:"&arrValue&" is not displayed as expected",false
				bverifyAdditionalInfo_ReplaceCard=false
			End If
		End If
		
		Case "Charge for Urgent Mailing"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (ViewSR.lblChargeforUrgentMailing(), arrValue, "Charge for Urgent Mailing")Then
				LogMessage "RSLT","Verification","Additonal details - Charge for Urgent Mailing:"&arrValue&" is not displayed as expected",false
				bverifyAdditionalInfo_ReplaceCard=false
			End If
		End If
		
		Case "Contact Number"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (ViewSR.lblContactNumber(), arrValue, "Contact Number")Then
				LogMessage "RSLT","Verification","Additonal details - Contact Number:"&arrValue&" is not displayed as expected",false
				bverifyAdditionalInfo_ReplaceCard=false
			End If
		End If	
	End select 
	Next 
	verifyAdditionalInfo_ReplaceCard = bverifyAdditionalInfo_ReplaceCard
End Function


''''''''''''''''''''''''''''''''' For Bill Payment (verifying the additional SR info) ''''''''''''''
'[Verify Field SMS Indicator on View SR Page displayed as]
Public Function verifySMSIndicator_ViewSR(strSMSIndicator)
	bverifySMSINdicator = true
	If Not IsNull(strSMSIndicator) Then
       If Not VerifyInnerText (ViewSR.lblSMSIndicator(), strSMSIndicator, "SMS Indicator")Then
           bverifySMSINdicator=false
       End If
   End If
   verifySMSIndicator_ViewSR=bverifySMSINdicator
End Function
''''''''''''''''''''''''''''''''' For Credit Balance Refund (verifying the additional SR info) ''''''''''''''

'[Verify Field Mode of Refund on View SR Page displayed as]
Public Function verifyRefundMode_ViewSR(strRefundMode)
bverifyRefundMode = true
	If Not IsNull(strRefundMode) Then
	   If Not VerifyInnerText (ViewSR.lblRefundMode(), strRefundMode, "Refund Mode")Then
	       bverifyRefundMode=false
	   End If
	End If
verifyRefundMode_ViewSR=bverifyRefundMode
End Function

'[Verify Field Amount on View SR Page displayed as]
Public Function verifyAmount_ViewSR(strAmount)
	bverifyAmount_ViewSR = true
	If Not IsNull(strAmount) Then
       If Not VerifyInnerText (ViewSR.lblAmount(), strAmount, "Amount")Then
           bverifyAmount_ViewSR=false
       End If
   End If
   verifyAmount_ViewSR=bverifyAmount_ViewSR
End Function

'[Verify Field Mobile Number on View SR Page displayed as]
Public Function verifyMobileNumber_ViewSR(strMobileNumber)
bverifyMobileNumber= true
	If Not IsNull(strMobileNumber) Then
	   If Not VerifyInnerText (ViewSR.lblMobileNumber(), strMobileNumber, "Mobile Number")Then
	       bverifyMobileNumber=false
	   End If
	End If
verifyMobileNumber_ViewSR=bverifyMobileNumber
End Function

'[Verify Field Payee Name on View SR Page displayed as]
Public Function verifyPayeeName_ViewSR(strPayeeName)
bverifyPayeeName= true
	If Not IsNull(strPayeeName) Then
	   If Not VerifyInnerText (ViewSR.lblPayeeName(), strPayeeName, "Payee Name") Then
	       bverifyPayeeName=false 
	   End If
	End If
verifyPayeeName_ViewSR = bverifyPayeeName
End Function

'[Verify Field Account on View SR Page displayed as]
Public Function verifyAccount_ViewSR(strAccount)
bverifyAccount = true
If Not IsNull(strAccount) Then
   If Not VerifyInnerText (ViewSR.lblAccount(), strAccount, "Account")Then
       bverifyAccount=false
   End If
End If
verifyAccount_ViewSR=bverifyAccount
End Function

'[Verify Field Current Balance on View SR Page displayed as]
Public Function verifyCurrentBalance_ViewSR(strCurrentBalance)
bverifyCurrentBalance= true
If Not IsNull(strCurrentBalance) Then
   If Not VerifyInnerText (ViewSR.lblCurrentBalance(), strCurrentBalance, "Current Balance") Then
       bverifyCurrentBalance=false
   End If
End If
verifyCurrentBalance_ViewSR = bverifyCurrentBalance
End Function

'[Verify Field Minimum Due on View SR Page displayed as]
Public Function verifyMinimumDue_ViewSR(strMinimumDue)
bverifyMinimumDue= true
If Not IsNull(strMinimumDue) Then
   If Not VerifyInnerText (ViewSR.lblMinimumDue(), strMinimumDue, "Minimum Due") Then
       bverifyMinimumDue=false
   End If
End If
verifyMinimumDue_ViewSR = bverifyMinimumDue
End Function

''''''''''''''''''''''''''''''''' For IB Maintanence (verifying the additional SR info) ''''''''''''''

'[Verify field Access Request Type in Additional SR Info section]
Public Function verifyAccessRequestType_ViewSR(strAccessRequestType)
	bverifyAccessRequestType = true
	If Not IsNull(strAccessRequestType) Then
       If Not VerifyInnerText (ViewSR.lblAccessRequestType(), strAccessRequestType, "Access Request Type")Then
           bverifyAccessRequestType=false
       End If
   End If
   verifyAccessRequestType_ViewSR = bverifyAccessRequestType
End Function

'[Verify field Customer UID in Additional SR Info section]
Public Function verifyCustomerUID_ViewSR(strCustomerID)
	bverifyCustomerUID = true
	If Not IsNull(strCustomerID) Then
       If Not VerifyInnerText (ViewSR.lblCustomerID(), strCustomerID, "Customer UID")Then
           bverifyCustomerUID=false
       End If
   End If
   verifyCustomerUID_ViewSR = bverifyCustomerUID
End Function

'[Verify field Current Access Status in Additional SR Info section]
Public Function verifyAccessStatus_ViewSR(strAccessStatus)
	bverifyAcessStatus = true
	If Not IsNull(strAccessStatus) Then
       If Not VerifyInnerText (ViewSR.lblAccessStatus(), strAccessStatus, "Access Status")Then
           bverifyAcessStatus = false
       End If
   End If
   verifyAccessStatus_ViewSR = bverifyAcessStatus
End Function

'-----------------------------Statement Copy------------------------------
'[Verify Field Selected Available Statements on View SR Page displayed as]
Public Function verifySelAvailSmt_ViewSR(strSelAvailSmt)
	bverifyAcessStatus = true
	If Not IsNull(strSelAvailSmt) Then
       If Not VerifyInnerText (ViewSR.lblSelectedAvailableStatements(), strSelAvailSmt, "Available Statements")Then
           bverifyAcessStatus = false
       End If
   End If
   verifySelAvailSmt_ViewSR = bverifyAcessStatus
End Function

'[Verify Field From Date for Statements on View SR Page displayed as]
Public Function verifyFromDateStateCopy_ViewSR(strFromDateSmt)
	bverifyFromDateStateCopy = true
	If Not IsNull(strFromDateSmt) Then
       If Not VerifyInnerText (ViewSR.lblFromDateforStatementCopy(), strFromDateSmt, "From Date for Statement")Then
           bverifyFromDateStateCopy = false
       End If
   End If
   verifyFromDateStateCopy_ViewSR = bverifyFromDateStateCopy
End Function

'[Verify Field To Date for Statements on View SR Page displayed as]
Public Function verifyToDateStateCopy_ViewSR(strToDateSmt)
	bverifyToDateStateCopy = true
	If Not IsNull(strToDateSmt) Then
       If Not VerifyInnerText (ViewSR.lblToDateforStatementCopy(), strToDateSmt, "To Date for Statement")Then
           bverifyToDateStateCopy = false
       End If
   End If
   verifyToDateStateCopy_ViewSR = bverifyToDateStateCopy
End Function

'[Verify Field Fee for Statements on View SR Page displayed as]
Public Function verifyFeeStateCopy_ViewSR(strFeeDateSmt)
	bverifyFeeteStateCopy = true
	If Not IsNull(strFeeDateSmt) Then
       If Not VerifyInnerText (ViewSR.lblFeeforStatementCopy(), strFeeDateSmt, "Fee for Statements on View SR ")Then
           bverifyFeeteStateCopy = false
       End If
   End If
   verifyFeeStateCopy_ViewSR = bverifyFeeteStateCopy
End Function

'[Verify Field Waive Fee for Statements on View SR Page displayed as]
Public Function verifyWaiveFeeStateCopy_ViewSR(strWaiveFeeDateSmt)
	bverifyWaiveFeeteStateCopy = true
	If Not IsNull(strWaiveFeeDateSmt) Then
       If Not VerifyInnerText (ViewSR.lblWaiveFeeStatementCopy(), strWaiveFeeDateSmt, "Waive Fee for Statements on View SR ")Then
           bverifyWaiveFeeteStateCopy = false
       End If
   End If
   verifyWaiveFeeStateCopy_ViewSR = bverifyWaiveFeeteStateCopy
End Function

'[Verify Field Card/Account to be Charged for Statements on View SR Page displayed as]
Public Function verifyCardAccountStateCopy_ViewSR(strAccountCardDateSmt)
	bverifyAccountCardteStateCopy = true
	If Not IsNull(strAccountCardDateSmt) Then
       If Not VerifyInnerText (ViewSR.lblCardAccountToBeCharged(), strAccountCardDateSmt, "Card/Account to be Charged for Statements on View SR ")Then
           bverifyAccountCardteStateCopy = false
       End If
   End If
   verifyCardAccountStateCopy_ViewSR = bverifyAccountCardteStateCopy
End Function

'[Verify Field eStatement Enrollment Status for Statements on View SR Page displayed as]
Public Function verifyeStatementEnrollmentStateCopy_ViewSR(streStatementEnrollmentDateSmt)
	bverifyeStatementEnrollmentteStateCopy = true
	If Not IsNull(streStatementEnrollmentDateSmt) Then
       If Not VerifyInnerText (ViewSR.lbleStatementEnrollmentStatusforSmt(), streStatementEnrollmentDateSmt, "eStatement Enrollment Status for Statements on View SR")Then
           bverifyeStatementEnrollmentteStateCopy = false
       End If
   End If
   verifyeStatementEnrollmentStateCopy_ViewSR = bverifyeStatementEnrollmentteStateCopy
End Function


''''''''''''''''''''''''''''''''' For SMS Alert (verifying the additional SR info) ''''''''''''''

'[Verify Amended Threshold Limits of Local and Foreign values]
Public Function VerifyThresholdLimits_AddInfo(lstThresholdLimits)
bVerifyThresholdLimits_AddInfo=true
waitForIcallLoading

	If not IsNull (lstThresholdLimits) Then
		'Expected Amended Threshold values 
		strLocalLimitType=lstThresholdLimits(0)
        strLocalRetail=lstThresholdLimits(1)
   		strLocalCash=lstThresholdLimits(2)
        strLocalECommerce=lstThresholdLimits(3)
		strLocalRecurring=lstThresholdLimits(4)
        strLocalMailOrder=lstThresholdLimits(5)
        
		strForeignLimitType=lstThresholdLimits(6)
        strForeignRetail=lstThresholdLimits(7)
   		strForeignCash=lstThresholdLimits(8)
        strForeignECommerce=lstThresholdLimits(9)
		strForeignRecurring=lstThresholdLimits(10)
        strForeignMailOrder=lstThresholdLimits(11)
        	
	    If Not VerifyInnerText(ViewSR.lblThresholdLimitType1Local(),strLocalLimitType,"Amended Threshold Local Limit Type") Then
			bVerifyThresholdLimits_AddInfo = False	
		End If
		
		If Not VerifyInnerText(ViewSR.lblLocalThresholdRetailLimit(),strLocalRetail,"Local Threshold Retail Limit") Then
			bVerifyThresholdLimits_AddInfo = False	
		End If
		
	    If Not VerifyInnerText(ViewSR.lblLocalThresholdCashLimit(),strLocalCash,"Local Threshold Cash Limit") Then
			bVerifyThresholdLimits_AddInfo = False	
		End If
		
		If Not VerifyInnerText(ViewSR.lblLocalThresholdECommerceLimit(),strLocalECommerce,"Local Threshold ECommerce Limit") Then
			bVerifyThresholdLimits_AddInfo = False	
		End If	

		If Not VerifyInnerText(ViewSR.lblLocalThresholdRecurringLimit(),strLocalRecurring,"Local Threshold Recurring Limit") Then
			bVerifyThresholdLimits_AddInfo = False	
		End If
		
		If Not VerifyInnerText(ViewSR.lblLocalThresholdMailOrderLimit(),strLocalMailOrder,"Local Threshold MailOrder Limit") Then
			bVerifyThresholdLimits_AddInfo = False	
		End If
		
	    If Not VerifyInnerText(ViewSR.lblThresholdLimitType1Overseas(),strForeignLimitType,"Amended Threshold Foreign Limit Type") Then
			bVerifyThresholdLimits_AddInfo = False	
		End If
		
		If Not VerifyInnerText(ViewSR.lblOverseasThresholdRetailLimit(),strForeignRetail,"Foreign Threshold Retail Limit") Then
			bVerifyThresholdLimits_AddInfo = False	
		End If
		
	    If Not VerifyInnerText(ViewSR.lblOverseasThresholdCashLimit(),strForeignCash,"Foreign Threshold Cash Limit") Then
			bVerifyThresholdLimits_AddInfo = False	
		End If
		
		If Not VerifyInnerText(ViewSR.lblOverseasThresholdECommerceLimit(),strForeignECommerce,"Foreign Threshold ECommerce Limit") Then
			bVerifyThresholdLimits_AddInfo = False	
		End If	

		If Not VerifyInnerText(ViewSR.lblOverseasThresholdRecurringLimit(),strForeignRecurring,"Foreign Threshold Recurring Limit") Then
			bVerifyThresholdLimits_AddInfo = False	
		End If
		
		If Not VerifyInnerText(ViewSR.lblOverseasThresholdMailOrderLimit(),strForeignMailOrder,"Foreign Threshold MailOrder Limit") Then
			bVerifyThresholdLimits_AddInfo = False	
		End If			
	End If
VerifyThresholdLimits_AddInfo = bVerifyThresholdLimits_AddInfo                
End Function

'[Verify Current Threshold Limits of Local and Foreign values for First CardNumber]
Public Function VerifyCurrentLimitsCard1_AddInfo(lstThresholdLimits)
	bVerifyCurrentLimitsCard1=true
	waitForIcallLoading
	If not IsNull (lstThresholdLimits) Then
		'Expected Amended Threshold values 
		strCardNumber=lstThresholdLimits(0)
		strLocalLimitType=lstThresholdLimits(1)
        strLocalRetail=lstThresholdLimits(2)
   		strLocalCash=lstThresholdLimits(3)
        strLocalECommerce=lstThresholdLimits(4)
		strLocalRecurring=lstThresholdLimits(5)
        strLocalMailOrder=lstThresholdLimits(6)
        
		strForeignLimitType=lstThresholdLimits(7)
        strForeignRetail=lstThresholdLimits(8)
   		strForeignCash=lstThresholdLimits(9)
        strForeignECommerce=lstThresholdLimits(10)
		strForeignRecurring=lstThresholdLimits(11)
        strForeignMailOrder=lstThresholdLimits(12)
        
        If Not VerifyInnerText(ViewSR.lblSMSAlertCardNumber1(),strCardNumber,"Card Number1") Then
			bVerifyCurrentLimitsCard1 = False	
		End If
        	
	    If Not VerifyInnerText(ViewSR.lblCurrentRetailLimitTypeLocal_Card1(),strLocalLimitType,"Amended Threshold Local Limit Type") Then
			bVerifyCurrentLimitsCard1 = False	
		End If
		
		If Not VerifyInnerText(ViewSR.lblLocalCurrentRetailLimit_Card1(),strLocalRetail,"Local Threshold Retail Limit") Then
			bVerifyCurrentLimitsCard1 = False	
		End If
		
	    If Not VerifyInnerText(ViewSR.lblLocalCurrentCashLimit_Card1(),strLocalCash,"Local Threshold Cash Limit") Then
			bVerifyCurrentLimitsCard1 = False	
		End If
		
		If Not VerifyInnerText(ViewSR.lblLocalCurrentECommerceLimit_Card1(),strLocalECommerce,"Local Threshold ECommerce Limit") Then
			bVerifyCurrentLimitsCard1 = False	
		End If	

		If Not VerifyInnerText(ViewSR.lblLocalCurrentRecurringLimit_Card1(),strLocalRecurring,"Local Threshold Recurring Limit") Then
			bVerifyCurrentLimitsCard1 = False	
		End If
		
		If Not VerifyInnerText(ViewSR.lblLocalCurrentMailOrderLimit_Card1(),strLocalMailOrder,"Local Threshold MailOrder Limit") Then
			bVerifyCurrentLimitsCard1 = False	
		End If
		
	    If Not VerifyInnerText(ViewSR.lblCurrentRetailLimitTypeOverseas_Card1(),strForeignLimitType,"Amended Threshold Foreign Limit Type") Then
			bVerifyCurrentLimitsCard1 = False	
		End If
		
		If Not VerifyInnerText(ViewSR.lblOverseasCurrentRetailLimit_Card1(),strForeignRetail,"Foreign Threshold Retail Limit") Then
			bVerifyCurrentLimitsCard1 = False	
		End If
		
	    If Not VerifyInnerText(ViewSR.lblOverseasCurrentCashLimit_Card1(),strForeignCash,"Foreign Threshold Cash Limit") Then
			bVerifyCurrentLimitsCard1 = False	
		End If
		
		If Not VerifyInnerText(ViewSR.lblOverseasCurrentECommerceLimit_Card1(),strForeignECommerce,"Foreign Threshold ECommerce Limit") Then
			bVerifyCurrentLimitsCard1 = False	
		End If	

		If Not VerifyInnerText(ViewSR.lblOverseasCurrentRecurringLimit_Card1(),strForeignRecurring,"Foreign Threshold Recurring Limit") Then
			bVerifyCurrentLimitsCard1 = False	
		End If
		
		If Not VerifyInnerText(ViewSR.lblOverseasCurrentMailOrderLimit_Card1(),strForeignMailOrder,"Foreign Threshold MailOrder Limit") Then
			bVerifyCurrentLimitsCard1 = False	
		End If			
	End If
VerifyCurrentLimitsCard1_AddInfo = bVerifyCurrentLimitsCard1                
End Function

'[Verify Current Threshold Limits of Local and Foreign values for Second CardNumber]
Public Function VerifyCurrentLimitsCard2_AddInfo(lstThresholdLimits)
	bVerifyCurrentLimitsCard2=true
	waitForIcallLoading
	If not IsNull (lstThresholdLimits) Then
		'Expected Amended Threshold values 
		strCardNumber=lstThresholdLimits(0)
		strLocalLimitType=lstThresholdLimits(1)
        strLocalRetail=lstThresholdLimits(2)
   		strLocalCash=lstThresholdLimits(3)
        strLocalECommerce=lstThresholdLimits(4)
		strLocalRecurring=lstThresholdLimits(5)
        strLocalMailOrder=lstThresholdLimits(6)
        
		strForeignLimitType=lstThresholdLimits(7)
        strForeignRetail=lstThresholdLimits(8)
   		strForeignCash=lstThresholdLimits(9)
        strForeignECommerce=lstThresholdLimits(10)
		strForeignRecurring=lstThresholdLimits(11)
        strForeignMailOrder=lstThresholdLimits(12)
        
        If Not VerifyInnerText(ViewSR.lblSMSAlertCardNumber2(),strCardNumber,"Card Number1") Then
			bVerifyCurrentLimitsCard2 = False	
		End If
        	
	    If Not VerifyInnerText(ViewSR.lblCurrentRetailLimitTypeLocal_Card2(),strLocalLimitType,"Amended Threshold Local Limit Type") Then
			bVerifyCurrentLimitsCard2 = False	
		End If
		
		If Not VerifyInnerText(ViewSR.lblLocalCurrentRetailLimit_Card2(),strLocalRetail,"Local Threshold Retail Limit") Then
			bVerifyCurrentLimitsCard2 = False	
		End If
		
	    If Not VerifyInnerText(ViewSR.lblLocalCurrentCashLimit_Card2(),strLocalCash,"Local Threshold Cash Limit") Then
			bVerifyCurrentLimitsCard2 = False	
		End If
		
		If Not VerifyInnerText(ViewSR.lblLocalCurrentECommerceLimit_Card2(),strLocalECommerce,"Local Threshold ECommerce Limit") Then
			bVerifyCurrentLimitsCard2 = False	
		End If	

		If Not VerifyInnerText(ViewSR.lblLocalCurrentRecurringLimit_Card2(),strLocalRecurring,"Local Threshold Recurring Limit") Then
			bVerifyCurrentLimitsCard2 = False	
		End If
		
		If Not VerifyInnerText(ViewSR.lblLocalCurrentMailOrderLimit_Card2(),strLocalMailOrder,"Local Threshold MailOrder Limit") Then
			bVerifyCurrentLimitsCard2 = False	
		End If
		
	    If Not VerifyInnerText(ViewSR.lblCurrentRetailLimitTypeOverseas_Card2(),strForeignLimitType,"Amended Threshold Foreign Limit Type") Then
			bVerifyCurrentLimitsCard2 = False	
		End If
		
		If Not VerifyInnerText(ViewSR.lblOverseasCurrentRetailLimit_Card2(),strForeignRetail,"Foreign Threshold Retail Limit") Then
			bVerifyCurrentLimitsCard2 = False	
		End If
		
	    If Not VerifyInnerText(ViewSR.lblOverseasCurrentCashLimit_Card2(),strForeignCash,"Foreign Threshold Cash Limit") Then
			bVerifyCurrentLimitsCard2 = False	
		End If
		
		If Not VerifyInnerText(ViewSR.lblOverseasCurrentECommerceLimit_Card2(),strForeignECommerce,"Foreign Threshold ECommerce Limit") Then
			bVerifyCurrentLimitsCard2 = False	
		End If	

		If Not VerifyInnerText(ViewSR.lblOverseasCurrentRecurringLimit_Card2(),strForeignRecurring,"Foreign Threshold Recurring Limit") Then
			bVerifyCurrentLimitsCard2 = False	
		End If
		
		If Not VerifyInnerText(ViewSR.lblOverseasCurrentMailOrderLimit_Card2(),strForeignMailOrder,"Foreign Threshold MailOrder Limit") Then
			bVerifyCurrentLimitsCard2 = False	
		End If			
	End If
VerifyCurrentLimitsCard2_AddInfo = bVerifyCurrentLimitsCard2                
End Function

'[Verify Current Threshold Limits of Local and Foreign values for Third CardNumber]
Public Function VerifyCurrentLimitsCard3_AddInfo(lstThresholdLimits)
	bVerifyCurrentLimitsCard3=true
	waitForIcallLoading
	If not IsNull (lstThresholdLimits) Then
		'Expected Amended Threshold values 
		strCardNumber=lstThresholdLimits(0)
		strLocalLimitType=lstThresholdLimits(1)
        strLocalRetail=lstThresholdLimits(2)
   		strLocalCash=lstThresholdLimits(3)
        strLocalECommerce=lstThresholdLimits(4)
		strLocalRecurring=lstThresholdLimits(5)
        strLocalMailOrder=lstThresholdLimits(6)
        
		strForeignLimitType=lstThresholdLimits(7)
        strForeignRetail=lstThresholdLimits(8)
   		strForeignCash=lstThresholdLimits(9)
        strForeignECommerce=lstThresholdLimits(10)
		strForeignRecurring=lstThresholdLimits(11)
        strForeignMailOrder=lstThresholdLimits(12)
        
        If Not VerifyInnerText(ViewSR.lblSMSAlertCardNumber3(),strCardNumber,"Card Number1") Then
			bVerifyCurrentLimitsCard3 = False	
		End If
        	
	    If Not VerifyInnerText(ViewSR.lblCurrentRetailLimitTypeLocal_Card3(),strLocalLimitType,"Amended Threshold Local Limit Type") Then
			bVerifyCurrentLimitsCard3 = False	
		End If
		
		If Not VerifyInnerText(ViewSR.lblLocalCurrentRetailLimit_Card3(),strLocalRetail,"Local Threshold Retail Limit") Then
			bVerifyCurrentLimitsCard3 = False	
		End If
		
	    If Not VerifyInnerText(ViewSR.lblLocalCurrentCashLimit_Card3(),strLocalCash,"Local Threshold Cash Limit") Then
			bVerifyCurrentLimitsCard3 = False	
		End If
		
		If Not VerifyInnerText(ViewSR.lblLocalCurrentECommerceLimit_Card3(),strLocalECommerce,"Local Threshold ECommerce Limit") Then
			bVerifyCurrentLimitsCard3 = False	
		End If	

		If Not VerifyInnerText(ViewSR.lblLocalCurrentRecurringLimit_Card3(),strLocalRecurring,"Local Threshold Recurring Limit") Then
			bVerifyCurrentLimitsCard3 = False	
		End If
		
		If Not VerifyInnerText(ViewSR.lblLocalCurrentMailOrderLimit_Card3(),strLocalMailOrder,"Local Threshold MailOrder Limit") Then
			bVerifyCurrentLimitsCard3 = False	
		End If
		
	    If Not VerifyInnerText(ViewSR.lblCurrentRetailLimitTypeOverseas_Card3(),strForeignLimitType,"Amended Threshold Foreign Limit Type") Then
			bVerifyCurrentLimitsCard3 = False	
		End If
		
		If Not VerifyInnerText(ViewSR.lblOverseasCurrentRetailLimit_Card3(),strForeignRetail,"Foreign Threshold Retail Limit") Then
			bVerifyCurrentLimitsCard3 = False	
		End If
		
	    If Not VerifyInnerText(ViewSR.lblOverseasCurrentCashLimit_Card3(),strForeignCash,"Foreign Threshold Cash Limit") Then
			bVerifyCurrentLimitsCard3 = False	
		End If
		
		If Not VerifyInnerText(ViewSR.lblOverseasCurrentECommerceLimit_Card3(),strForeignECommerce,"Foreign Threshold ECommerce Limit") Then
			bVerifyCurrentLimitsCard3 = False	
		End If	

		If Not VerifyInnerText(ViewSR.lblOverseasCurrentRecurringLimit_Card3(),strForeignRecurring,"Foreign Threshold Recurring Limit") Then
			bVerifyCurrentLimitsCard3 = False	
		End If
		
		If Not VerifyInnerText(ViewSR.lblOverseasCurrentMailOrderLimit_Card3(),strForeignMailOrder,"Foreign Threshold MailOrder Limit") Then
			bVerifyCurrentLimitsCard3 = False	
		End If			
	End If
VerifyCurrentLimitsCard3_AddInfo = bVerifyCurrentLimitsCard3                
End Function

'// Additional Info For TMS STP's /

'[Verify Field Reason in Additional Info section on View SR Page displayed as]
Public Function verifyReason_AddInfo(strReason)
   bverifyReason=true
   If Not IsNull(strReason) Then
       If Not VerifyInnerText (ViewSR.lblReasonAddInfo(),strReason,"Reason") Then
           bverifyReason=false
       End If
   End If
   verifyReason_AddInfo = bverifyReason
End Function

'[Verify Field Lock Unlock Reason in Additional Info section on View SR Page displayed as]
Public Function verifyLockReason_AddInfo(strReason)
   bverifyReason=true
   If Not IsNull(strReason) Then
       If Not VerifyInnerText (ViewSR.lblLockReasonAddInfo(),strReason,"Reason") Then
           bverifyReason=false
       End If
   End If
   verifyLockReason_AddInfo = bverifyReason
End Function

'[Verify Field Token Serial Number in Additional Info section on View SR Page displayed as]
Public Function verifyTokenSerialNo_AddInfo(strTokenSerialNumber)
   bverifyTokenSerialNo=true
   If Not IsNull(strTokenSerialNumber) Then
       If Not VerifyInnerText (ViewSR.lblTokenSerialNumber(), strTokenSerialNumber, "Reason For Blocking")Then
           bverifyTokenSerialNo=false
       End If
   End If
   verifyTokenSerialNo_AddInfo = bverifyTokenSerialNo
End Function

'[Verify Field Token Status in Additional Info section on View SR Page displayed as]
Public Function verifyTokenStatus_AddInfo(strTokenStatus)
   bverifyTokenStatus=true
   If Not IsNull(strTokenStatus) Then
       If Not VerifyInnerText (ViewSR.lblTokenStatus(), strTokenStatus, "Token Status")Then
           bverifyTokenStatus=false
       End If
   End If
   verifyTokenStatus_AddInfo = bverifyTokenStatus
End Function

'[Verify field Token Lock Date in Additional Info section on View SR Page displayed as]
Public Function verifyTLockDate_AddInfo(strLockDate)
   bverifyLockDate=true
   If Not IsNull(strLockDate) Then
       If Not VerifyInnerText (ViewSR.lblLockDate(), strLockDate, "Lock Date")Then
           bverifyLockDate=false
       End If
   End If
   verifyTLockDate_AddInfo = bverifyLockDate
End Function

'[Click SR No hyperlink on Service Request Tab]
Public Function viewSRServiceRequestTab(lstSRDetails)
          Dim bviewSRServiceRequestTab:	viewSRServiceRequestTab = True
          bviewIAActivityTab=selectTableLink(ServiceRequest.tblServiceRequestHeader,ServiceRequest.tblServiceRequestContent,lstSRDetails,"ServiceRequestTab" ,"SR No.",True,ServiceRequest.lnkNext ,ServiceRequest.lnkNext1,ServiceRequest.lnkPrevious)
          WaitForICallLoading
		  viewSRServiceRequestTab=bviewSRServiceRequestTab
End Function

'[Verify Additional SR Info Redirection to Foreign Address]
Public Function verifyRedirection_AddInfo(strRedirection)
   bverifyRedirection=true
   If Not IsNull(strRedirection) Then
       If Not VerifyInnerText (ViewSR.lblRedirectionAddress(),strRedirection,"Redirection") Then
           bverifyRedirection=false
       End If
   End If
   verifyRedirection_AddInfo = bverifyRedirection
End Function

'[Verify Additional SR Info Redirection to Country]
Public Function verifyCountry_AddInfo(strCountry)
   bverifyCountry=true
   If Not IsNull(strCountry) Then
       If Not VerifyInnerText (ViewSR.lblCountry(),strCountry,"Country") Then
           bverifyCountry=false
       End If
   End If
   verifyCountry_AddInfo = bverifyCountry
End Function

'[Verify Additional SR Info Courier Service]
Public Function verifyCourierService_AddInfo(strCourierService)
   bverifyCourierService=true
   If Not IsNull(strCourierService) Then
       If Not VerifyInnerText (ViewSR.lblCourierService(), strCourierService, "Courier Service")Then
           bverifyCourierService=false
       End If
   End If
   verifyCourierService_AddInfo = bverifyCourierService
End Function

'[Verify Additional SR Info Waive Courier Fee selected option]
Public Function verifyWaiveCourierFee_AddInfo(strSelectWaiveCourierFee)
   bverifyWaiveCourierFee=true
   If Not IsNull(strSelectWaiveCourierFee) Then
       If Not VerifyInnerText (ViewSR.lblWaiveCourierFee(), strSelectWaiveCourierFee, "Waive Courier Fee Selected as")Then
           bverifyWaiveCourierFee=false
       End If
   End If
   verifyWaiveCourierFee_AddInfo = bverifyWaiveCourierFee
End Function

'[Verify Additional SR Info Waive Courier Fee]
Public Function verifyCourierCharge_AddInfo(strCourierFee)
   bverifyCourierFee=true
   If Not IsNull(strCourierFee) Then
       If Not VerifyInnerText (ViewSR.lblWaiveCourierFee(), strCourierFee, "Courier Fee Charge")Then
           bverifyCourierFee=false
       End If
   End If
   verifyCourierCharge_AddInfo = bverifyCourierFee
End Function

'[Verify Additional SR Info Courier Fee Waive Reason]
Public Function verifyWaiveCourierFeeReason_AddInfo(strWaiveCourierFeeReason)
   bverifyCourierFeeWaiveReason=true
   If Not IsNull(strWaiveCourierFeeReason) Then
       If Not VerifyInnerText (ViewSR.lblCourierFeeWaiverReason(), strWaiveCourierFeeReason, "Courier Fee Waive Reason") Then
           bverifyCourierFeeWaiveReason=false
       End If
   End If
   verifyWaiveCourierFeeReason_AddInfo = bverifyCourierFeeWaiveReason
End Function

'[Verify Additional SR Info Waive Replacement Fee selected option]
Public Function verifyWaiveReplaceFee_AddInfo(strSelectWaiveReplaceFee)
   bverifyReplaceCourierFee=true
   If Not IsNull(strSelectWaiveReplaceFee) Then
       If Not VerifyInnerText (ViewSR.lblWaiveCourierFee(), strSelectWaiveReplaceFee, "Waive Replacement Fee Selected as")Then
           bverifyReplaceCourierFee=false
       End If
   End If
   verifyWaiveReplaceFee_AddInfo = bverifyReplaceCourierFee
End Function

'[Verify Additional SR Info Replacement Fee]
Public Function verifyWaiveReplacementFee_AddInfo(strWaiveReplacementFee)
   bverifyWaiveReplacementFee=true
   If Not IsNull(strWaiveReplacementFee) Then
       If Not VerifyInnerText (ViewSR.lblWaiveReplacementFee(), strWaiveReplacementFee, "Waive Replacement Fee")Then
           bverifyWaiveReplacementFee=false
       End If
   End If
   verifyWaiveReplacementFee_AddInfo = bverifyWaiveReplacementFee
End Function

'[Verify Additional SR Info Waive Replacement Fee Reason]
Public Function verifyWaiveReplacementFeeReason_AddInfo(strWaiveReplaceFeeReason)
   bverifyReplacementFeeWaiveReason=true
   If Not IsNull(strWaiveReplaceFeeReason) Then
       If Not VerifyInnerText (ViewSR.lblReplacementWaiverReason(), strWaiveReplaceFeeReason, "Replacement Fee Waive Reason") Then
           bverifyReplacementFeeWaiveReason=false
       End If
   End If
   verifyWaiveReplacementFeeReason_AddInfo = bverifyReplacementFeeWaiveReason
End Function


''''''''''''''''''''''''''''''''' For stop Cheque (verifying the additional SR info) ''''''''''''''

'[Verify Field No of Selected Cheque on View SR Screen displayed as]
Public Function verifySelectedChequeNo_viewSR(strNoCheque)
	bverifySelectedChequeNo = true
	If Not IsNull(strNoCheque) Then
       If Not VerifyInnerText (ViewSR.lblNofCheque(), strNoCheque, "No of Selected Cheque") Then
           bverifySelectedChequeNo=false
       End If
   End If
   verifySelectedChequeNo_viewSR = bverifySelectedChequeNo
End Function

'[Verify Field Service Charge on View SR Page displayed as]
Public Function verifyServiceCharge_ViewSR(strServiceCharge)
	bverifyServiceCharge = true
	If Not IsNull(strServiceCharge) Then
       If Not VerifyInnerText (ViewSR.lblServiceCharge(), strServiceCharge, "Service Charge") Then
           bverifyServiceCharge=false
       End If
   End If
   verifyServiceCharge_ViewSR = bverifyServiceCharge
End Function

'[Verify Field Stop Cheque Fee Waiver on View SR Page displayed as]
Public Function VerifyFeeWaiver_ViewSR(strFeeWaiver)
	bverifyFeeWaiver = true
	If Not IsNull(strFeeWaiver) Then
       If Not VerifyInnerText (ViewSR.lblFeeWaiver(), strFeeWaiver, "Fee Waiver") Then
           bverifyFeeWaiver=false
       End If
   End If
   VerifyFeeWaiver_ViewSR = bverifyFeeWaiver
End Function

'[Verify Field Cheque Number on View SR Page displayed as]
Public Function VerifyChequeNumber_ViewSR(strChequeNumber)
	bverifyChequeNumber = true
	If Not IsNull(strChequeNumber) Then
       If Not VerifyInnerText (ViewSR.lblChequeNumber(), strChequeNumber, "Cheque Number")Then
           bverifyChequeNumber=false
       End If
   End If
   VerifyChequeNumber_ViewSR = bverifyChequeNumber
End Function
