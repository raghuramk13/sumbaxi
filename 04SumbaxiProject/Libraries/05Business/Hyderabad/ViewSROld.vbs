Dim gstrRuntimeSRNumStep,gstrRuntimeTMCommentStep,gstrRuntimeCommentStep
'[Verify Tab ViewSR displayed]
Public Function verifyTabViewSRexist(strTabName)
   bDevPending=false
   verifyTabViewSRexist=verifyTabExist(strTabName)
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

'[Verify Field RelatedTo displayed as]
Public Function verifyRelatedToText(strRelatedTo)
   bDevPending=false
   bVerifyRelatedToText=true
	
   If Not IsNull(strRelatedTo) Then
     If Not VerifyInnerText (ViewSR.lblRelatedTo(), strRelatedTo, "Related To")Then
	   bVerifyRelatedToText=false
	End If
   End If
   verifyRelatedToText=bVerifyRelatedToText
End Function


'[Verify Field CardNumber displayed as]
Public Function verifyCardNumberText(strAccountNumber)
   bDevPending=False
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
   bDevPending=False
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
   bDevPending=false
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
   bDevPending=false
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
   bDevPending=false
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
   bDevPending=false
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
   bDevPending=False
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
   bDevPending=False
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
   verifyRequestExecutedText=bVerifyRequestExecutedText
End Function

'[Verify Field Comments on View SR Tab displayed as]
Public Function verifyComments_ViewSR(strExpectedComment,strAccountNumber,strCreatedDate,strCreatedBy)
   bDevPending=false
   bVerifyServiceRequest=true
 '  strAccountNumber=Replace(strAccountNumber,"-","")
   If Not IsNull(strExpectedComment) Then
	   If Ucase(strExpectedComment)="RUNTIME SR COMMENT" Then
		   strExpectedComment=fetchFromDataStore(gstrRuntimeCommentStep,"BLANK","SRComment")(0)
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
		intCheckox = Instr(ViewSR.chkOnceDone.GetROProperty ("outerhtml"),"checked")
		If bChecked Then
			If intCheckox = 0 Then
				LogMessage "RSLT","Verification","Once and Done check box is not unchecked as expected.",false
				bverifyOnceAndDone=false
            Else
				LogMessage "RSLT","Verification","Once and Done check box is by default unchecked as expected.",true
				bverifyOnceAndDone=true
			End If
		else
				If intCheckox = 0 Then
				LogMessage "RSLT","Verification","Once and Done check box is by default unchecked as expected.",true
				bverifyOnceAndDone=true
			Else
				LogMessage "RSLT","Verification","Once and Done check box is not unchecked as expected.",false
				bverifyOnceAndDone=false	
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
   
  ' If SR link clicked from popup lable link
   If Ucase(strSRNumber)="SELECTED SR LINK" Then
	   If not isNull(gstrRuntimeSRNumStep) Then
		   strSRNumber=fetchFromDataStore(gstrRuntimeSRNumStep,"BLANK","SelectedSRLink")(0)
	   End If
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
Public Function VerifyFieldCreatedBy(strCreatedBy)
   bDevPending=false
   bVerifyFieldCreatedBy=true
	 If Not IsNull(strCreatedBy) Then  'Updated as per code refractoring for View SR
		'strCreatedBy_LAN_Id=readFromINIFile(gstrCurrentProjectDir + "\"+gstrProjectName+ "\Config\SR_Screen_Map.ini",  "LAN ID" , strCreatedBy)
	  If Not VerifyInnerText (ViewSR.lblCreatedBy(), strCreatedBy, "Created By")Then
		   bVerifyFieldCreatedBy=false
		End If
	 End If
	 VerifyFieldCreatedBy=bVerifyFieldCreatedBy
End Function

'[Verify Field Overdue displayed as]
Public Function verifyOverdueText(strOverdue)
   bDevPending=false
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
   bDevPending=false
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
   bDevPending=false
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
   bDevPending=false
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
Public Function VerifyFieldLastUpdateBy(strLastUpdatedBy)
   bDevPending=false
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
		VerifyFieldLastUpdateBy=bVerifyFieldLastUpdateBy
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
		
		ViewSR.tblNotesContent.ChildItem(1,3,"WebElement",0).Click
		
		If Not VerifyInnerText (ViewSR.lblNotesDescription(), strNotesDescription, "Notes")Then
           bVerifyServiceRequest=false
       End If
		
       ViewSR.btnOK_Notes.Click
	End If
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
Public Function verifyAmount_ViewSR(strExpectedText)
   bDevPending=False
   bVerifyAmountText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (ViewSR.lblAmount(), strExpectedText, "Amount")Then
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
Public Function verifyCurrentAddressLine5_ViewSR(strAddressLine5)
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
Public Function verifyAddressLine1_ViewSR()
   bDevPending=false
   bverifyAddressLine1_ViewSR=true
   If Not IsNull(strProduct) Then
       If Not VerifyInnerText (ViewSR.lblQty(), strProduct, "AddressLine1")Then
           bverifyTotalRedeemPoints_ViewSR=false
       End If
   End If
   verifyAddressLine1_ViewSR=bverifyAddressLine1_ViewSR
End Function

'[Verify Country on View SR Page displayed as]
Public Function verifyCountry_ViewSR()
   bDevPending=false
   bverifyCountry_ViewSR=true
   If Not IsNull(strProduct) Then
       If Not VerifyInnerText (ViewSR.lblQty(), strProduct, "Country")Then
           bverifyCountry_ViewSR=false
       End If
   End If
   verifyCountry_ViewSR=bverifyCountry_ViewSR
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

