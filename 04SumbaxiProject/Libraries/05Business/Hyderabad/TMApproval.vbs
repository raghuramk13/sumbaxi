'*****This is auto generated code using code generator please Re-validate ****************

'[Verify Table AdditionalSRInfo displayed]
Public Function verifyAdditionalSRInfoTabledisplayed()
   bDevPending=false
   verifyAdditionalSRInfodisplayed= TMApproval.tblAdditionalSRInfo.Exist(1)
End Function

'[Verify row Data in Table AdditionalSRInfo on TM Approval Screen]
Public Function verifytblAdditionalSRInfo_RowData(arrRowDataList)
   bDevPending=false
   verifytblAdditionalSRInfo_RowData=verifyTableContentList(TMApproval.tblAdditionalSRInfoHeader,TMApproval.tblAdditionalSRInfoContent,arrRowDataList,"AdditionalSRInfo" , False,Null ,Null,Null)
End Function

'[Verify Field SRType on TM Approval Screen displayed as]
Public Function verifySRType_TM(strExpectedText)
   bDevPending=false
   bVerifySRType_TM=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (TMApproval.lblSRType(), strExpectedText, "SRType")Then
           bVerifySRType_TM=false
       End If
   End If
   verifySRType_TM=bVerifySRType_TM
End Function

'[Verify Field SubType on TM Approval Screen displayed as]
Public Function verifySubType_TM(strExpectedText)
   bDevPending=false
   bVerifySubTypeText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (TMApproval.lblSubType(), strExpectedText, "SubType")Then
           bVerifySubTypeText=false
       End If
   End If
   verifySubType_TM=bVerifySubTypeText
End Function

'[Verify Field CustomerCIN on TM Approval Screen displayed as]
Public Function verifyCustomerCIN_TM(strExpectedText)
   bDevPending=false
   bVerifyCustomerCINText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (TMApproval.lblCustomerCIN(), strExpectedText, "CustomerCIN")Then
           bVerifyCustomerCINText=false
       End If
   End If
   verifyCustomerCIN_TM=bVerifyCustomerCINText
End Function

'[Verify Field CreatedBy on TM Approval Screen displayed as]
Public Function verifyCreatedBy_TM(strCreatedBy)
   bDevPending=false
   bVerifyCreatedByText=true
   If Not IsNull(strCreatedBy) Then
       If Not VerifyInnerText (TMApproval.lblCreatedBy(), strCreatedBy, "CreatedBy")Then
           bVerifyCreatedByText=false
       End If
   End If
   verifyCreatedBy_TM=bVerifyCreatedByText
End Function

'[Verify Field CreatedOn on TM Approval Screen displayed as]
Public Function verifyCreatedOn_TM(strExpectedText,strType)
   bDevPending=false
   bVerifyCreatedOnText=true
   If Not IsNull(strExpectedText) Then
	   If Ucase(strExpectedText)="SR CREATED ON" Then
		   'strExpectedText=fetchFromDataStore("Set TextBox Comment on Service Activation to","BLANK","SRComment")(0)
		   strComment=fetchFromDataStore(gstrRuntimeCommentStep,"BLANK",gstrParameterNameStep)(0)
			strQuery_CreatedOn="Select createdOn from cca_tmapproval_sr where SRTYPE ='"&strType&"' and comments LIKE '%"&strComment&"%' order by createdon desc"
			strTST=getDBValForColumn(strQuery_CreatedOn)(0)
			strTempDate=Left(strTST, Len(strTST) - 6)
			strTime=FormatDateTime(Left(strTST, Len(strTST) - 6) &" "&Right(strTST,2),4)
            If len(Day(CDate(strTempDate)))=1 Then
				strDay="0"&Day(CDate(strTempDate))
			else
				strDay=""&Day(CDate(strTempDate))
			End If
			strCreatedDatePattern=""&strDay & " "&monthName(Month(CDate(strTempDate)),true) &" " &Year(CDate(strTempDate))&" " &strTime		
	   End If
       If Not VerifyInnerText (TMApproval.lblCreatedOn(), strCreatedDatePattern, "CreatedOn")Then
           bVerifyCreatedOnText=false
       End If
   End If
   verifyCreatedOn_TM=bVerifyCreatedOnText
End Function

'[Verify Field AccountNo on TM Approval Screen displayed as]
Public Function verifyAccountNo_TM(strExpectedText)
   bDevPending=false
   bVerifyAccountNoText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (TMApproval.lblAccountNo(), strExpectedText, "AccountNo")Then
           bVerifyAccountNoText=false
       End If
   End If
   verifyAccountNo_TM=bVerifyAccountNoText
End Function

'[Verify Field ProductDesc on TM Approval Screen displayed as]
Public Function verifyProductDesc_TM(strExpectedText)
   bDevPending=false
   bVerifyProductDescText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (TMApproval.lblProductDesc(), strExpectedText, "ProductDesc")Then
           bVerifyProductDescText=false
       End If
   End If
   verifyProductDesc_TM=bVerifyProductDescText
End Function

'[Verify Field Comments on TM Approval Screen displayed as]
Public Function verifyComments_TM(strExpectedComment,strAccountNumber,strCreatedDate,strCreatedBy)
   bDevPending=false
   bVerifyServiceRequest=true
 '  strAccountNumber=Replace(strAccountNumber,"-","")
   If Not IsNull(strExpectedComment) Then
	   If Ucase(strExpectedComment)="RUNTIME SR COMMENT" Then
		   strExpectedComment=fetchFromDataStore(gstrRuntimeCommentStep,"BLANK",gstrParameterNameStep)(0)
	   End If
	    If Ucase(strExpectedComment)="RUNTIME TM COMMENT" Then
		   strExpectedComment=fetchFromDataStore(gstrRuntimeTMCommentStep,"BLANK","TMComment")(0)
	   End If

      strActualComment= TMApproval.lblComments.GetROProperty("innertext")
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

   verifyComments_TM=bVerifyServiceRequest
End Function

'[Click Button Reject on TM Approval Screen]
Public Function clickButtonReject_TM()
   bDevPending=false
   TMApproval.btnReject.click
   If Err.Number<>0 Then
       clickButtonReject_TM=false
            LogMessage "WARN","Verification","Failed to Click Button : Approve" ,false
       Exit Function
   End If
   clickButtonReject_TM=true
End Function

'[Click Button Approve on TM Approval Screen]
Public Function clickButtonApprove_TM()
   bDevPending=false
   TMApproval.btnApprove.click
   If Err.Number<>0 Then
       clickButtonApprove_TM=false
            LogMessage "WARN","Verification","Failed to Click Button : Approve" ,false
       Exit Function
   End If
   clickButtonApprove_TM=true
End Function

'[Click Button Close on TM Approval Screen]
Public Function clickButtonClose_TM()
   bDevPending=false
   TMApproval.btnClose.click
   If Err.Number<>0 Then
       clickButtonClose_TM=false
            LogMessage "WARN","Verification","Failed to Click Button : Close" ,false
       Exit Function
   End If
   clickButtonClose_TM=true
End Function

'[Verify Popup Comment on TM Approval Screen exist]
Public Function verifyPopupCommentexist_TM(bExist)
   bDevPending=False
   bActualExist=TMApproval.popupTMComment.Exist(1)
   If bExist And  bActualExist  Then
       LogMessage "RSLT","Verification","Popup :Comment Exists As Expected" ,true
       verifyPopupCommentexist_TM=True
   ElseIf not bExist And  not bActualExist  Then
       LogMessage "RSLT","Verification","Popup :Comment does not Exists As Expected" ,true
       verifyPopupCommentexist_TM=True
   ElseIf bExist And  not bActualExist  Then
       LogMessage "WARN","Verification","Popup :Comment does not Exists As Expected" ,False
       verifyPopupCommentexist_TM=False
   ElseIf not bExist And   bActualExist  Then
       LogMessage "WARN","Verification","Popup :Comment Still Exists" ,False
       verifyPopupCommentexist_TM=False
   End If
End Function

'[Set TextBox Comment onTM Comment Popup on TM Approval Screen to]
Public Function setComment_TMTextbox(strComment_TM)
   bDevPending=False
   If not isNull(strComment_TM) Then
	   	gstrRuntimeTMCommentStep="Set TextBox Comment onTM Comment Popup on TM Approval Screen to"
		insertDataStore "TMComment", strComment_TM
	   TMApproval.txtComment_TM.Set(strComment_TM)
	   WaitForIcallLoading
   End If
   If Err.Number<>0 Then
       setComment_TMTextbox=false
            LogMessage "WARN","Verification","Failed to Set Text Box :Comment_TM" ,false
       Exit Function
   End If
   setComment_TMTextbox=true
End Function

'[Perform Add Notes by clicking Add Notes Button on TM Comment Popup]
Public Function addNote_TM(strNote)
   bDevPending=false
   bVerifypopupNotes=true
	Dim bVerifypopupNotes:VerifypopupNotes=true
	
	If not isNull(strNote) Then
		TMApproval.btnAddNote_TMCommentPopup.click
		WaitForICallLoading
            If not   TMApproval.popupNotes_TMComment.exist(5)Then
				LogMessage "WARN","Verification","New Note dialog did not displayed",false
				bVerifypopupNotes=false
			 else
'			 strMessage=TMApproval.lblMaxAllowed.GetROProperty("innerText")
'				If not strMessage="Max allowed - 3000" Then
'					LogMessage "WARN","Verification","Add New Comment popup dialog incorrectly displayed max allowed character count for comment. Expected : Max allowed - 3000 and Actual: "&strMessage,false
'					bVerifypopupNotes=false
'				End If
			   TMApproval.txtNotes_TMNotesPopup.set strNote
			  
				TMApproval.btnSave_TmNotesPopup.Click
			  WaitForIcallLoading
		   End If 
		End If 
	addNote_TM=bVerifypopupNotes
End Function

'[Click Button OK on TM Comment Popup on TM Approval Screen]
Public Function clickButtonOK_TMCommentPopup()
   bDevPending=false
   TMApproval.btnOK_TMCommentPopup.click
   '*************** Capturing time stamp to open Memo for this SR
	strRunTimeTimeStamp_Step="Click Button OK on TM Comment Popup on TM Approval Screen"
	strDate="9 Apr 2014"
	strTempTime=FormatDateTime(now,4)	
 	strTimeStamp=strDate&" "&strTempTime
	insertDataStore "TimeStamp", strTimeStamp
	WaitForIcallLoading
   If Err.Number<>0 Then
       clickButtonOK_TMCommentPopup=false
            LogMessage "WARN","Verification","Failed to Click Button : OK_TMCommentPopup" ,false
       Exit Function
   End If
   WaitForIcallLoading
   clickButtonOK_TMCommentPopup=true
End Function

'[Verify Popup RequestSubmitted on TM Approval Screen exist]
Public Function verifyPopupRequestSubmittedexist_TM(bExist)
   bDevPending=False
   WaitForIcallLoading
   For iCounti = 1 To 180 Step 1
		If Not FeeAdjustment.popupRequestSubmitted.Exist(0.5) Then
			Wait(0.5)
		else
			 bActualExist=FeeAdjustment.popupRequestSubmitted.Exist(1)
			Exit for
		End if
	Next
   If bExist And  bActualExist  Then
       LogMessage "RSLT","Verification","Popup :RequestSubmitted Exists As Expected" ,true
       verifyPopupRequestSubmittedexist_TM=True
   ElseIf not bExist And  not bActualExist  Then
       LogMessage "RSLT","Verification","Popup :RequestSubmitted does not Exists As Expected" ,true
       verifyPopupRequestSubmittedexist_TM=True
   ElseIf bExist And  not bActualExist  Then
       LogMessage "WARN","Verification","Popup :RequestSubmitted does not Exists As Expected" ,False
       verifyPopupRequestSubmittedexist_TM=False
   ElseIf not bExist And   bActualExist  Then
       LogMessage "WARN","Verification","Popup :RequestSubmitted Still Exists" ,False
       verifyPopupRequestSubmittedexist_TM=False
   End If
   WaitForIcallLoading
End Function

'[Verify Field CardNumber_RequestSubmitted on Request Submitted popup for TM Approval displayed as]
Public Function verifyCardNumber_RequestSubmittedText_TM(strExpectedText)
   bDevPending=False
   bVerifyCardNumber_RequestSubmittedText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (FeeAdjustment.lblCardNumber_RequestSubmitted(), strExpectedText, "CardNumber_RequestSubmitted")Then
           bVerifyCardNumber_RequestSubmittedText=false
       End If
   End If
   verifyCardNumber_RequestSubmittedText_TM=bVerifyCardNumber_RequestSubmittedText
End Function

'[Verify Field ProductDescription_RequestSubmitted on Request Submitted popup for TM Approval displayed as]
Public Function verifyProductDescription_RequestSubmittedText_TM(strExpectedText)
   bDevPending=False
   bVerifyProductDescription_RequestSubmittedText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (TMApproval.lblProductDescription_RequestSubmitted(), strExpectedText, "ProductDescription_RequestSubmitted")Then
           bVerifyProductDescription_RequestSubmittedText=false
       End If
   End If
   verifyProductDescription_RequestSubmittedText_TM=bVerifyProductDescription_RequestSubmittedText
End Function

'[Verify Link SRNumber available on Request Submitted popup for TM Approval Screen]
Public Function verifyLinkSRNumber_RequestSubmitted_TM()
   bDevPending=False
   bverifyLinkSRNumber_RequestSubmitted=true
	strSelectedSR=FeeAdjustment.lnkSRNumber_RequestSubmitted.GetRoProperty("innerText")
	insertDataStore "SelectedSRLink", strSelectedSR
	If instr(FeeAdjustment.lnkSRNumber_RequestSubmitted.GetRoProperty("class"),"link")=0 Then
		bverifyLinkSRNumber_RequestSubmitted=false
	else
		bverifyLinkSRNumber_RequestSubmitted=true
	end If
	LogMessage "RSLT","Verification","SR Number link "& strSelectedSR &" displayed on Request Submitted popup",true
	If IsNull(strSRNumber) Then
		LogMessage "WARN","Verification", "SR Number not available with link on Request Submitted popup.",false
		bverifyLinkSRNumber_RequestSubmitted=false
	End If

   verifyLinkSRNumber_RequestSubmitted_TM=bverifyLinkSRNumber_RequestSubmitted
End Function

'[Click Link SRNumber_RequestSubmitted on TM Approval Screen]
Public Function clickLinkSRNumber_RequestSubmitted_TM()
   bDevPending=False
   gstrRuntimeSRNumStep="Click Link SRNumber_RequestSubmitted on TM Approval Screen"
	strSelectedSR=FeeAdjustment.lnkSRNumber_RequestSubmitted.GetRoProperty("innerText")
   If strSelectedSR<>"" Then
	 insertDataStore "SelectedSRLink", strSelectedSR
	  FeeAdjustment.lnkSRNumber_RequestSubmitted.click
	 else
   		LogMessage "RSLT","Verification","SR Number did not displayed on Request Submitted pop up",false
	End If
   WaitForIcallLoading
   If Err.Number<>0 Then
       clickLinkSRNumber_RequestSubmitted_TM=false
            LogMessage "WARN","Verification","Failed to Click Link : SRNumber_RequestSubmitted" ,false
       Exit Function
   End If
   clickLinkSRNumber_RequestSubmitted_TM=true
End Function

'[Verify Field Status_RequestSubmitted on TM Approval Screen displayed as]
Public Function verifyStatus_RequestSubmittedText_TM(strExpectedText)
   bDevPending=False
   bVerifyStatus_RequestSubmittedText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (TMApproval.lblStatus_RequestSubmitted(), strExpectedText, "Status_RequestSubmitted")Then
           bVerifyStatus_RequestSubmittedText=false
       End If
   End If
   verifyStatus_RequestSubmittedText_TM=bVerifyStatus_RequestSubmittedText
End Function

'[Click Button RefreshStatus on RequestSubmitted  Popup for TM Approval Screen]
Public Function clickButtonRefreshStatus_TM()
   bDevPending=False
   wait 1
   FeeAdjustment.btnRefreshStatus.click
	WaitForICallLoading
    		'Get Status
		If FeeAdjustment.lblStatus_RequestSubmitted.getROProperty("innertext")="In Progress" then 
			bStatus=true
		 else
			bStatus=false
		End If
	While  bStatus AND (iCount<60)
		FeeAdjustment.btnRefreshStatus.click
		wait 1
        	'Get Status
			strStatus=FeeAdjustment.lblStatus_RequestSubmitted.getROProperty("innertext")
			If Trim(strStatus)="In Progress" then 
				bStatus=true
			 else
				LogMessage "WARN","Verification","Status displayed as  :"&strStatus ,true
				bStatus=false
			End If
		wait 5
		intBtnRefreshStatus=Instr(FeeAdjustment.btnRefreshStatus.GetROproperty("outerhtml"),"v-disabled")
		If intBtnRefreshStatus<>0 Then
			LogMessage "WARN","Verification","Button : RefreshStatus is disabled" ,true
			bStatust=true
		End If
		iCount=iCount+1
	  Wend	
      If Err.Number<>0 Then
       clickButtonRefreshStatus_FA=false
            LogMessage "WARN","Verification","Failed to Click Button : RefreshStatus" ,false
       Exit Function
   End If
   clickButtonRefreshStatus_TM=true
End Function

'[Click Button OK_RequestSubmitted on RequestSubmitted  Popup for TM Approval Screen]
Public Function clickButtonOK_RequestSubmitted_TM()
	bDevPending = False
	Wait(20)
	For iCountji = 1 To 180 Step 1
		If Not TMApproval.btnOK_RequestSubmitted.Exist(0.5) Then
			Wait(0.5)
			clickButtonOK_RequestSubmitted_TM = False
		else
			TMApproval.btnOK_RequestSubmitted.click
			clickButtonOK_RequestSubmitted_TM = True
			Exit for
		End if
	Next
	If Err.Number<>0 Then
		clickButtonOK_RequestSubmitted_TM = False
		LogMessage "WARN","Verification","Failed to Click Button : OK_RequestSubmitted",False
		Exit Function
	End If	
End Function

'[Verify Field Reason for TM Approval displayed as]
Public Function verifyTMApprovalReason_TM(strExpectedText)
   bDevPending=false
   bverifyTMApprovalReason=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (TMApproval.lblTMAppReason(), strExpectedText, "Reason for TM Approval")Then
           bverifyTMApprovalReason=false
       End If
   End If
   verifyTMApprovalReason_TM=bverifyTMApprovalReason
End Function

'[Click Button Close on Submitted TM popup]
Public Function clickButtonClose_TMSubmitted()
   bDevPending=false
   Wait 1
   TMApproval.btnClose_RequestSubmitted.click
   If Err.Number<>0 Then
       clickButtonClose_TMSubmitted=false
            LogMessage "WARN","Verification","Failed to Click Button : Close_RequestSubmitted" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickButtonClose_TMSubmitted=true
End Function
