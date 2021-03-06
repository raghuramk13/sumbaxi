'[Click on Send SMS Button]
Public Function clickBtnSendSMS()
	IComm.ButtonSendSMS.click
	If Err.Number<>0 Then
       clickBtnSendSMS=false
       LogMessage "WARN","Verification","Failed to Click Button : Send SMS" ,false
       Exit Function
   End If
    clickBtnSendSMS=true
	WaitForICallLoading
End Function

'[Verify Registered Mobile Number displayed as]
Public Function verifyRegisteredMobileNo(strMobileNumber)
   bDevPending=false
   bverifyRegisteredMobileNo=true
   If Not IsNull(strMobileNumber) Then
       If Not verifyInnerText(IComm.RegisteredMobNo() , strMobileNumber, "Registered MobileNumber")Then
			bverifyRegisteredMobileNo = False
		End If
   End If
   verifyRegisteredMobileNo=bverifyRegisteredMobileNo
End Function

'[Verify Mobile Number displayed as]
Public Function verifyMobileNo(strMobileNumber)
   bDevPending=false
   bverifyMobileNo=true
   If Not IsNull(strMobileNumber) Then
   IserveMobileNumber = IComm.MobileNo.GetROProperty("value") 
   If Ucase(Trim(strMobileNumber)) = Ucase(Trim(IserveMobileNumber)) Then
	   LogMessage "RSLT","Verification","Mobile Number displayed matched as expected. Actual : "&IserveMobileNumber&" Expected "&strMobileNumber,True
	   bverifyMobileNo = True 
   Else 
   	   bverifyMobileNo = False
   End If
   End If 
   verifyMobileNo=bverifyMobileNo
End Function

'[Verify list of values displayed in SMS Template Combobox]
Public Function verifySMSTemplateComboboxItems(lstItems)
   bDevPending=false
   bverifySMSTemplateComboboxItems=true
   If Not IsNull(lstItems) Then
       If Not verifyComboboxItems(IComm.SMSTemplate(),lstItems, "SMS Template")Then
           bverifySMSTemplateComboboxItems=false
       End If
   End If
   verifySMSTemplateComboboxItems=bverifySMSTemplateComboboxItems
End Function

'[Verify Field KnowledgeBase in Send SMS page displayed as]
Public Function verifyKnowledgeBase_SendSMS(strExpectedLink)
   bDevPending=false
   bverifyKnowledgeBase_FR=true
   If Not IsNull(strExpectedLink) Then		
		Set oDesc_KB = Description.Create()
			oDesc_KB("micclass").Value = "Link"		
			strKBLink=IComm.lnkKnowledgeBase.GetROProperty("href")
			strExpectedLink=Replace(strExpectedLink,"@","=")
       If not MatchStr(strKBLink, strExpectedLink)Then
		   LogMessage "RSLT","Verification","Knowledge base link does not matched with expected. Actual : "&strKBLink&" Expected "&strExpectedLink,false
           bverifyKnowledgeBase_FR=false
	   else
	 		LogMessage "RSLT","Verification","Knowledge base link matched with expected link",true
       End If
   End If
   verifyKnowledgeBase_SendSMS=bverifyKnowledgeBase_FR
End Function

'[Perform Add Notes by clicking Add Notes Button on Send SMS Page]
Public Function addNote_SendSMS(strNote)
   bDevPending=false
   baddNote_SendSMS=true	
	If not isNull(strNote) Then
		IComm.btnAdd.click
		WaitForICallLoading
           If Not IComm.NotesPopup.exist(5)Then
			  LogMessage "WARN","Verification","Add New Comment action failed"
			  baddNote_SendSMS=false
		   else
			  LogMessage "RSLT","Verification","Add New Comment performed successfully" ,true
			  baddNote_SendSMS=True
	  	   End If
		IComm.txtNotes.set strNote
		IComm.btnSave.Click
		WaitForIcallLoading
	End If		
	addNote_SendSMS=baddNote_SendSMS
End Function

'[Set TextBox Comments on Send SMS Page]
Public Function setCommentsTextbox_SendSMS(strComment)
   bDevPending=false
   strTimeStamp = ""&now
   strComment =strComment &" "&strTimeStamp
   gstrRuntimeCommentStep="Set TextBox Comments to Send SMS"
   insertDataStore "SRComment", strComment
   IComm.txtComment.Set strComment
   If Err.Number<>0 Then
       setCommentsTextbox_SendSMS=false
            LogMessage "WARN","Verification","Failed to Set Text Box :Comments" ,false
       Exit Function
   End If
   setCommentsTextbox_SendSMS=true
End Function

'[Verify Button Submit display on Send SMS Page]
Public Function VerifybtnSubmit_SendSMS(strAction)
	bDevPending=false
    bVerifybtnSubmit_SendSMS=true
    If strAction = "Enabled" Then
    	intBtnSubmit=Instr(IComm.btnSubmit.GetROproperty("outerhtml"),("v-disabled"))
		If  intBtnSubmit=0 Then
			LogMessage "RSLT","Verification","Submit button is enabled as expected.",True
			bVerifybtnSubmit_SendSMS=true
		Else
			LogMessage "WARN","Verifiation","Submit button is disabled.",false
			bVerifybtnSubmit_SendSMS=false
		End If
	Else  If strAction = "Disabled" Then
	    	intBtnSubmit=Instr(IComm.btnSubmit.GetROproperty("outerhtml"),("v-enabled"))
		If  intBtnSubmit=0 Then
			LogMessage "RSLT","Verification","Submit button is disabled as expected.",True
			bVerifybtnSubmit_SendSMS=true
		Else
			LogMessage "WARN","Verifiation","Submit button is enabled.",false
			bVerifybtnSubmit_SendSMS=false
		End If
	End If 
    End If
	VerifybtnSubmit_SendSMS=bVerifybtnSubmit_SendSMS
End Function

'[Verify Button SendSMS display on SMS Email Inquiry Page]
Public Function VerifybtnSendSMS_SendSMSInquriy(strAction)
	bDevPending=false
    bVerifybtnSendSMS_SendSMSInquriy=true
    If strAction = "Enabled" Then
    	intBtnSendSMS=Instr(IComm.ButtonSendSMS.GetROproperty("outerhtml"),("v-disabled"))
		If  intBtnSendSMS=0 Then
			LogMessage "RSLT","Verification","Send SMS button is enabled as expected.",True
			bVerifybtnSendSMS_SendSMSInquriy=true
		Else
			LogMessage "WARN","Verifiation","Send SMS button is disabled.",false
			bVerifybtnSendSMS_SendSMSInquriy=false
		End If
	Else  If strAction = "Disabled" Then
	    	intBtnSendSMS=Instr(IComm.ButtonSendSMS.GetROproperty("outerhtml"),("v-enabled"))
		If  intBtnSendSMS=0 Then
			LogMessage "RSLT","Verification","Send SMS button is disabled as expected.",True
			bVerifybtnSendSMS_SendSMSInquriy=true
		Else
			LogMessage "WARN","Verifiation","Send SMS button is enabled.",false
			bVerifybtnSendSMS_SendSMSInquriy=false
		End If
	End If 
    End If
	VerifybtnSendSMS_SendSMSInquriy=bVerifybtnSendSMS_SendSMSInquriy
End Function

'[Click Button Submit on Send SMS Page]
Public Function clickButtonSubmit_SendSMS()
   bDevPending=false
   IComm.btnSubmit.click
   If Err.Number<>0 Then
       clickButtonSubmit_SendSMS=false
            LogMessage "WARN","Verification","Failed to Click Button : Submit" ,false
       Exit Function
   End If
   WaitForIcallLoading
   clickButtonSubmit_SendSMS=true
End Function

'[Click button Close on Request Submitted Popup]
Public Function clickBtnClose_RequestSubmitSendSMS()
	bDevPending=false
   IComm.btnClose.click
   If Err.Number<>0 Then
       clickBtnClose_RequestSubmitSendSMS=false
            LogMessage "WARN","Verification","Failed to Click Button : Close_RequestSubmitted" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickBtnClose_RequestSubmitSendSMS=true
End Function

'[Click Button Cancel on Send SMS Page]
Public Function clickButtonCancel_SendSMS()
   bDevPending=false
   IComm.btnCancel.click
   If Err.Number<>0 Then
       clickButtonCancel_SendSMS=false
            LogMessage "WARN","Verification","Failed to Click Button : Cancel" ,false
       Exit Function
   End If
   WaitForIcallLoading
   clickButtonCancel_SendSMS=true
End Function

'[Verify the Cancel Confirmation message displayed as]
Public Function verifyConfirmationPop_Cancel(strConfirmMsg)
   bDevPending=false
   bverifyConfirmationPop=true
   If Not IsNull(strConfirmMsg) Then
       If Not verifyInnerText(IComm.txtConfirmationMsg() , strConfirmMsg, "ConfirmationPopup")Then
			bverifyConfirmationPop = False
		End If
   End If
   verifyConfirmationPop_Cancel=bverifyConfirmationPop
End Function

'[Verify error message displayed as]
Public Function verifyerrorMsg_SendSMS(strErrorMsg)
   bDevPending=false
   bverifyerrorMsg_SendSMS=true
   If Not IsNull(strErrorMsg) Then
       If Not verifyInnerText(IComm.txtErrorMsg(), strErrorMsg, "Error Message")Then
			bverifyerrorMsg_SendSMS = False
		End If
   End If
   verifyerrorMsg_SendSMS=bverifyerrorMsg_SendSMS
End Function

'[Click Button NO in the Message displayed]
Public Function clickButtonNO_SendSMS()
   bDevPending=false
   IComm.btnNO.click
   If Err.Number<>0 Then
       clickButtonNO_SendSMS=false
            LogMessage "WARN","Verification","Failed to Click Button : NO in Confirmation Popup" ,false
       Exit Function
   End If
   WaitForIcallLoading
   clickButtonNO_SendSMS=true
End Function

'[Click Button Yes in the Message displayed]
Public Function clickButtonYES_SendSMS()
   bDevPending=false
   IComm.btnYES.click
   If Err.Number<>0 Then
       clickButtonYES_SendSMS=false
            LogMessage "WARN","Verification","Failed to Click Button : YES in Confirmation Popup" ,false
       Exit Function
   End If
   WaitForIcallLoading
   clickButtonYES_SendSMS=true
End Function

'[Click Button GO in SMS EMail Inquiry Page]
Public Function clickButtonGO_SMSInquiry()
   bDevPending=false
   IComm.btnGO.click
   If Err.Number<>0 Then
       clickButtonGO_SMSInquiry=false
            LogMessage "WARN","Verification","Failed to Click Button : GO in SMS EMail INquiry Popup" ,false
       Exit Function
   End If
   WaitForIcallLoading
   clickButtonGO_SMSInquiry=true
End Function

'[Verify Field CardNumber on Request Submitted Popup for Fee Reversal displayed as]
Public Function verifyCardNumber_RequestSubmitted_FR(strCardNumber)
   bDevPending=false
   bVerifyCardNumber_RequestSubmittedText=true
   insertDataStore "NewCardNumber", ""&strCardNumber
   If Not IsNull(strCardNumber) Then
       If Not VerifyInnerText (IComm.lblCardNumber_RequestSubmitted(), strCardNumber, "CardNumber_RequestSubmitted")Then
           bVerifyCardNumber_RequestSubmittedText=false
       End If
   End If
   verifyCardNumber_RequestSubmitted_FR=bVerifyCardNumber_RequestSubmittedText
End Function

'[Verify list of values in show dropdown displayed as]
Public Function verifyShowDropdown(lstShow)
   bDevPending=false
   bverifyShowDropdown=true
   If Not IsNull(lstShow) Then
       If Not verifyComboboxItems(IComm.showdropdown(),lstShow, "Show combobox")Then
           bverifyShowDropdown=false
       End If
   End If
   verifyShowDropdown=bverifyShowDropdown
End Function

'[Select Combobox Show on SendSMS Enquiry Page as]
Public Function selectShowComboBox_SMSEnquiry(strShow)
   bDevPending=false
   bselectShowComboBox_SMSEnquiry=true
   If Not IsNull(strShow) Then
       If Not (selectItem_Combobox (IComm.showdropdown(), strShow))Then
            LogMessage "WARN","Verification","Failed to select :"&strControlName&" From Show drop down list" ,false
           bSelectShowComboBox=false
       End If
   End If
   WaitForICallLoading
   selectShowComboBox_SMSEnquiry=bselectShowComboBox_SMSEnquiry
End Function

'[Select the SMS Template Comboxbox as]
Public Function selectSMSTemplate_SendSMS(strSMSTemplate)
	bselectSMSTemplate_SendSMS=true
	If Not IsNull(strSMSTemplate) Then
       If Not (selectItem_Combobox (IComm.SMSTemplate(), strSMSTemplate))Then
            LogMessage "WARN","Verification","Failed to select :"&strSMSTemplate&" From SMS Template Type drop down list" ,false
           bselectSMSTemplate_SendSMS=false
       End If
   End If
   WaitForICallLoading
   selectSMSTemplate_SendSMS=bselectSMSTemplate_SendSMS
End Function

'[Enter Hours in the Hours Text box as]
Public Function setHours_SendSMS(strHours)
   IComm.txtHours.Set(strHours)
   If Err.Number<>0 Then
       setHours_SendSMS=false
       LogMessage "WARN","Verification","Failed to Set Text Box :Hours" ,false
       Exit Function
   End If
   setHours_SendSMS=true
End Function

'[Verify SMS Text displayed in the SMS Textbox as]
Public Function verifySMSText_SendSMS(strSMSText)
   bDevPending=false
   bverifySMSText_SendSMS=true
   If Not IsNull(strSMSText) Then
       If Not VerifyInnerText (IComm.SMSText(), strSMSText, "SMS Text for selectedTemplate")Then
           bverifySMSText_SendSMS=false
       End If
   End If
   verifySMSText_SendSMS=bverifySMSText_SendSMS
End Function

'[Click on link SMS/Email Inquiry in Customer Overview Page]
Public Function clickSMSInquiry()	
	bcCustomerOverview.lnkEmailSMSInquiry.Click
	If Err.Number<>0 Then
       clickSMSInquiry=false
       LogMessage "WARN","Verification","Failed to Click Button : SMS/Email Inquiry" ,false
       Exit Function
   End If
    clickSMSInquiry=true
	WaitForICallLoading
End Function

'[Verify Verification Message displayed on Send SMS Page]
Public Function verifyMessagePopup(strVerificationMsg)
   bDevPending=false
   bverifyMessagePopup=true
   If Not IsNull(strVerificationMsg) Then
    If Not verifyInnerText(IComm.txtVerificationMsg() , strVerificationMsg, "VerificationMessage")Then
	   bverifyMessagePopup = False
	End If
   End If
   IComm.btnOK.click
   verifyMessagePopup=bverifyMessagePopup
End Function

'[Verify iB User ID displayed as]
Public Function verifyiBUserID(strUserID)
   bDevPending=false
   bverifyiBUserID=true
   If Not IsNull(strUserID) Then
       If Not verifyInnerText(IComm.IBUserID() , strUserID, "UserID")Then
			bverifyiBUserID = False
		End If
   End If
   verifyiBUserID=bverifyiBUserID
End Function

'[Verify iB Registration Code displayed as]
Public Function verifyiBRegCode(strRegCode)
   bDevPending=false
   bverifyiBRegCode=true
   If Not IsNull(strRegCode) Then
       If Not verifyInnerText(IComm.IBRegCode() , strRegCode, "Registeration Code")Then
			bverifyiBRegCode = False
		End If
   End If
   verifyiBRegCode=bverifyiBRegCode
End Function

'[Verify text Description displayed as]
Public Function verifyDescription_SendSMS(strDescription)
   bDevPending=false
   bverifyDescription_SendSMS=true
   If Not IsNull(strDescription) Then
       If Not VerifyInnerText (IComm.lblDescription(), strDescription, "Description")Then
           bverifyDescription_SendSMS=false
       End If
   End If
   verifyDescription_SendSMS=bverifyDescription_SendSMS
End Function

'[Click on link Token Management in Customer Overview Page]
Public Function clicklnkTokenMgt()	
	bcCustomerOverview.lnkTokenMgt.Click
	If Err.Number<>0 Then
       clicklnkTokenMgt=false
       LogMessage "WARN","Verification","Failed to Click Link : Token Management" ,false
       Exit Function
   End If
    clicklnkTokenMgt=true
	WaitForICallLoading
End Function

'[Click on Button SMS Registeration Code in Token Management Page]
Public Function clickBtnSMSRegisterCode()	
	IComm.btnSMSRegCode.Click
	If Err.Number<>0 Then
       clicklnkTokenMgt=false
       LogMessage "WARN","Verification","Failed to Click Button : Token Management" ,false
       Exit Function
   End If
    clickBtnSMSRegisterCode=true
	WaitForICallLoading
End Function

'[Verify Pink Panel in Send SMS screen]
Public Function verifySendSMSPinkPanel(strName,strCIN,strSegment)
	bverifySendSMSPinkPanel=true
	If Not IsNull (strName) Then
		If Not verifyInnerText(IComm.lblName(),strName, "Name") Then
			bverifySendSMSPinkPanel=false
		End If
	End If
	If Not IsNull (strCIN) Then
		If Not verifyInnerText(IComm.lblCIN(),strCIN, "CIN") Then
			bverifySendSMSPinkPanel=false
		End If
	End If
	If Not IsNull (strSegment) Then
		If Not verifyInnerText(IComm.lblSegment(),strSegment, "Segment") Then
			bverifySendSMSPinkPanel=false
		End If
	End If
	verifySendSMSPinkPanel=bverifySendSMSPinkPanel
End Function

'[verify the message displayed in SMS Details table]
Public Function VerifySMSDetails(strRegMobileNo,strSMSText)
	If Not IsNull(strRegMobileNo) Then
	   listsendSMS = (checknull("(Type: SMS|Direction:Out|Message:"&strSMSText&"|Message Status:Successful|Sent By:ICAL)|"))
	   verifySMStable=verifyTableContentList(IComm.SMSEmailEnquirytblheader,IComm.SMSEmailEnquirytblContent,listsendSMS,"SMS/Email enquiry",false,null,null,null)
	   'If verifySMStable = True Then
	   	   LogMessage "WARN","Verification","Details displayed in the table matched with the expected value" ,True
		   UserclickMessageLink=selectTableLink(IComm.SMSEmailEnquirytblheader,IComm.SMSEmailEnquirytblContent,Array("Sent To:"&strRegMobileNo),"SMS/Email Inquiry table","Message",False,null,null,null)	
	 	   LogMessage "WARN","Verification","Message is clicked successfully from the record table" ,True
	 	   If verifyInnerText(IComm.SMSEmailMessagePopup(),strSMSText, "Message text") Then
			  LogMessage "WARN","Verification","Message displayed matched with the SMS text sent" ,True
		   End If  
		   IComm.ButtonOK.Click
	   'End If
 	End If 
	WaitForIcallLoading
	'ClickMessageID = bClickMessageID
End Function

'[Verify details displayed in table SMS Email Inquiry]
Public Function ClickMessageLink_SMSEnquiry(strSMSText,strStatus,strTmpId,strSentTo)
	strToday = CDate(Now)
	If len(Day(strToday))=1 Then
		strDay="0"&Day(strToday)
	else
		strDay=""&Day(strToday)
	End If
	strToday=""&strDay & " "&monthName(Month(strToday),true) &" " &Year(strToday)&""
	intRecordCount = getRecordsCountForColumn(IComm.SMSEmailEnquirytblheader,IComm.SMSEmailEnquirytblContent, "Type")
	For i = 0 To intRecordCount - 1
		strCellValueType=getCellTextFor(IComm.SMSEmailEnquirytblheader,IComm.SMSEmailEnquirytblContent,i, "Type")
		strCellValueDir=getCellTextFor(IComm.SMSEmailEnquirytblheader,IComm.SMSEmailEnquirytblContent,i, "Direction")
		strCellValueCreated=getCellTextFor(IComm.SMSEmailEnquirytblheader,IComm.SMSEmailEnquirytblContent,i, "Created Date")
		strCellValueCreated = Left(strCellValueCreated,12)
		strCellValueSentDate=getCellTextFor(IComm.SMSEmailEnquirytblheader,IComm.SMSEmailEnquirytblContent,i, "Sent Date")
		strCellValueSentDate = Left(strCellValueSentDate,12)
		strCellValueStatus=getCellTextFor(IComm.SMSEmailEnquirytblheader,IComm.SMSEmailEnquirytblContent,i, "Message Status")
		strCellValueTmpId=getCellTextFor(IComm.SMSEmailEnquirytblheader,IComm.SMSEmailEnquirytblContent,i, "Template Id")
		strCellValueSentTo=getCellTextFor(IComm.SMSEmailEnquirytblheader,IComm.SMSEmailEnquirytblContent,i, "Sent To")
		strCellValueSentBy=getCellTextFor(IComm.SMSEmailEnquirytblheader,IComm.SMSEmailEnquirytblContent,i, "Sent By")
		If UCase(strCellValueType) = "SMS" AND UCase(strCellValueDir) = "OUT" AND strCellValueCreated = strToday AND strCellValueSentDate = strToday AND strCellValueStatus = strStatus AND strCellValueTmpId = strTmpId AND strCellValueSentBy = "ICAL" AND strCellValueSentTo = strSentTo Then
			UserclickMessageLink=selectTableLink(IComm.SMSEmailEnquirytblheader,IComm.SMSEmailEnquirytblContent,Array("Sent By:"&strSentBy),"SMS/Email Inquiry table","Message",False,null,null,null)
			If UserclickMessageLink Then
				LogMessage "RSLT","Verification","Message is clicked successfully from the record table" ,True
				If verifyInnerText(IComm.SMSEmailMessagePopup(),strSMSText, "Message text") Then
					LogMessage "RSLT","Verification","Message displayed matched with the SMS text sent" ,True
				Else
					LogMessage "WARN","Verification","Message displayed matched with the SMS text sent" ,False
				End If
				IComm.ButtonOK.Click
				WaitForIcallLoading
			Else
				LogMessage "WARN","Verification","Message is not clicked successfully from the record table" ,False
			End If			
		Exit For
		ElseIf i=4 Then
			LogMessage "WARN","Verification","SMS Sent is not found in Page" ,False
		End If
	Next
End Function

'[Verify list of values displayed in Show dropdown as]
Public Function verifyShowdropdown(lstShow)
   bDevPending=false
   bverifyShowdropdown=true
   If Not IsNull(lstShow) Then
       If Not verifyComboboxItems(IComm.showdropdown(),lstShow, "Show Dropdown")Then
           bverifyShowdropdown=false
       End If
   End If
   verifyShowdropdown=bverifyShowdropdown
End Function

'[Validate Pagination of SMS Email Inquiry Page]
Public Function validatePagination_SMSInquiry(strshow)
 bvalidatePagination_SMSInquiry=true
 
If strshow = "All" OR strshow = "Email" Then
	iCheck = 5
ElseIf strshow = "SMS" Then
	iCheck = 10
End If
bNextPageExist = True
While bNextPageExist = True
	 intRecordCount = getRecordsCountForColumn(IComm.SMSEmailEnquirytblheader,IComm.SMSEmailEnquirytblContent, "Type")
	 If intRecordCount <=iCheck  Then
	     LogMessage "RSLT","Verification","Number of records displayed per page matched with expected. Expected Count is less than or equal to "&iCheck, true   
	     bvalidatePagination_SMSInquiry=true
		 If intRecordCount < iCheck Then
		   	bNextPageExist =matchStr(IComm.lnkNext.GetROProperty("outerhtml"),"v-enabled")
			If bNextPageExist Then
			LogMessage "WARN","Verification","Next link expected to be disabled if record is less than "&iCheck&". Currently it is enabled.",false
			bvalidatePagination=false
			Else
			LogMessage "RSLT","Verification","Next link is disabled as per expectation.",true
			End If
		ElseIf intRecordCount = iCheck Then
			bNextPageExist = matchStr(IComm.lnkNext.GetROProperty("outerhtml"),"v-enabled")
			If bNextPageExist Then
				IComm.lnkNext.Click
			End If
		End If
	Else 
		LogMessage "RSLT","Verification","Number of records displayed per page not matched with expected. Expected Count is less than or equal to 5", false   
		bNextPageExist = False
	End If

Wend
End Function

'[Set TextBox From Date on SMS Email Inquiry to]
Public Function setFromTextbox_SMSInquiry(strFrom)
   bDevPending=true
   If not isNull(strFrom) Then
	   If Ucase(strFrom)="TODAY" Then
			If len(Day(CDate(Now)))=1 Then
				strDay="0"&Day(CDate(Now))
			else
				strDay=""&Day(CDate(Now))
			End If
			strFrom=""&strDay & " "&monthName(Month(CDate(Now)),true) &" " &Year(CDate(Now))&""
	   End If
	   IComm.txtFrom.Set(strFrom)
   End If
   If Err.Number<>0 Then
       setFromTextbox_SMSInquiry=false
            LogMessage "WARN","Verification","Failed to Set Text Box :From" ,false
       Exit Function
   End If
   setFromTextbox_SMSInquiry=true
End Function

'[Set TextBox To Date on SMS Email Inquiry to]
Public Function setToTextbox_SMSInquiry(strTo)
   bDevPending=true
   If not isNull(strTo) Then
	   If Ucase(strTo)="TODAY" Then
			If len(Day(CDate(Now)))=1 Then
				strDay="0"&Day(CDate(Now))
			else
				strDay=""&Day(CDate(Now))
			End If
			strTo=""&strDay & " "&monthName(Month(CDate(Now)),true) &" " &Year(CDate(Now))&""
	   End If
   IComm.txtTo.Set(strTo)
   End If
   If Err.Number<>0 Then
       setToTextbox_SMSInquiry=false
            LogMessage "WARN","Verification","Failed to Set Text Box :To" ,false
       Exit Function
   End If
   setToTextbox_SMSInquiry=true
End Function

'[Verify Inline error Message on SMS Email Inquiry page displayed as]
Public Function verifyInlineErrorMessage_SendSMSInquiry(strInLineMessage)
	bverifyInlineErrorMessage=true
	If Not IsNull(strInLineMessage) Then
       If Not VerifyInnerText (IComm.lblDateErrorMessage(), strInLineMessage, "Inline Info Message")Then
           bverifyInlineErrorMessage=false
       End If
   End If
   verifyInlineErrorMessage_SendSMSInquiry=bverifyInlineErrorMessage
End Function

'[Verify default From date and To Date displayed as]
Public Function VerifyDefaultDate_SMSInquiry(strToDate)
   bDevPending=true
   IserveSMSFromDate = IComm.txtFrom.GetROProperty("value") 
   IserveSMSToDate= IComm.txtTo.GetROProperty("value") 
   If not isNull(strToDate) Then
	   If Ucase(strToDate)="TODAY" Then
			If len(Day(CDate(Now)))=1 Then
				strDay="0"&Day(CDate(Now))
			else
				strDay=""&Day(CDate(Now))
			End If
			strExpTODate=""&strDay & " "&monthName(Month(CDate(Now)),true) &" " &Year(CDate(Now))&""
			'Set From Date
			strExpFromDate = Cdate(Now)-29
			If len(Day(strExpFromDate))=1 Then
				strDay="0"&Day(strExpFromDate)
			else
				strDay=""&Day(strExpFromDate)
			End If
			strExpFromDate=""&strDay & " "&monthName(Month(strExpFromDate),true) &" " &Year(strExpFromDate)&""			
			If Ucase(Trim(strExpFromDate)) = Ucase(Trim(IserveSMSFromDate)) Then
			   LogMessage "RSLT", "Verification","From Date is set to today's date as expected. Expected: "+ strExpFromDate &" , Actual: "& IserveSMSFromDate, True
			End If
			If Ucase(Trim(strExpTODate)) = Ucase(Trim(IserveSMSToDate)) Then
			   LogMessage "RSLT", "Verification","To Date is set to 30 days before today's date. Expected: "+ strExpToDate &" , Actual: "& IserveSMSToDate, True
			End If			
	   End If
   End If
End Function

'[Click Button send SMS on SMS Email Inquiry Page]
Public Function clickButtonSubmit_SendSMS()
   bDevPending=false
   IComm.btnSubmit.click
   If Err.Number<>0 Then
       clickButtonSubmit_SendSMS=false
            LogMessage "WARN","Verification","Failed to Click Button : Submit" ,false
       Exit Function
   End If
   WaitForIcallLoading
   clickButtonSubmit_SendSMS=true
End Function

'[Verify Message status column value for Email and SMS]
Public Function verifyMessageStatus_SendSMSInquiry()
	intRecordCount = getRecordsCountForColumn(IComm.SMSEmailEnquirytblheader,IComm.SMSEmailEnquirytblContent, "Type")
	
	'loop for number of rows to verify hyperlink
	For i = 0 To intRecordCount - 1
		'intCol=getColIndex (objTableHeader,"Message Status")
		Set objAllRows=getAllRows(IComm.SMSEmailEnquirytblContent)
		set objCountInCell=getCellObject(IComm.SMSEmailEnquirytblheader,IComm.SMSEmailEnquirytblContent,i,"Message Status","md-button")
		iObjCount=objCountInCell.count
		strCellValue=getCellTextFor(IComm.SMSEmailEnquirytblheader,IComm.SMSEmailEnquirytblContent,i, "Message Status")
		
		For j = 0 to iObjCount - 1	
			strClassName=objCountInCell(j).getRoProperty("class")
			If instr (1,strClassName,"md-button",0) or instr (1,strClassName,"v-button-text-link",0)Then
				If (objCountInCell(j).getRoProperty("innertext") =  getCellTextFor(IComm.SMSEmailEnquirytblheader,objAllRows(i),i, "Message Status")) Then
					bDisabled =matchStr(objCountInCell(j).GetROProperty("outerhtml"),"disabled")
					Exit For
				End If
			End If
		Next
		'strCellvalType =  getCellTextFor(IComm.SMSEmailEnquirytblheader,IComm.SMSEmailEnquirytblContent,i,"Message Status")
		If Ucase(strCellValue) = "SUCCESSFUL" OR Ucase(strCellValue) = "CUSTOMER NOT FOUND" OR Ucase(strCellValue) = "CONTACT INVALID" Then
			If bDisabled Then
				LogMessage "RSLT","Verification","Link is disabled.",True
			ElseIf Not bDisabled Then
				LogMessage "WARN","Verification","Link is enabled.",False
				Exit For
			End If
		ElseIf Ucase(strCellValue) = "FAILURE" OR Ucase(strCellValue) = "WAITING" OR Ucase(strCellValue) = "EXPIRED" Then
			If Not bDisabled Then
				LogMessage "RSLT","Verification","Link is enabled.",True
				objCountInCell(j).click
				WaitForIcallLoading
				IComm.btnOK.click
			Else
				LogMessage "WARN","Verification","Link is disabled.",False
				Exit For
			End If
		
		Else 
			LogMessage "WARN","Verification","Message Status Other Than Expected Status",False
		End If
	Next
End Function

'[Verify Sent TO and From columns values displayed for Direction]
Public Function VerifyColumnforDirection_SendSMSInquiry()
	For i = 1 To 10
		intRecordCount = getRecordsCountForColumn(IComm.SMSEmailEnquirytblheader,IComm.SMSEmailEnquirytblContent, "Type")
		For j = 0 To intRecordCount - 1
			strCellValDir = getCellTextFor(IComm.SMSEmailEnquirytblheader,IComm.SMSEmailEnquirytblContent,j, "Direction")
			strCellValFrom = getCellTextFor(IComm.SMSEmailEnquirytblheader,IComm.SMSEmailEnquirytblContent,j, "From")
			strCellValSentTo = getCellTextFor(IComm.SMSEmailEnquirytblheader,IComm.SMSEmailEnquirytblContent,j, "Sent To")
			If UCase(strCellValDir) = "OUT" Then
				If Not IsNull(strCellValSentTo) And trim(strCellValFrom) ="" Then
					LogMessage "RSLT","Verification","Sent To and From column values are displayed as Expected for Out Direction.",True
				Else
					LogMessage "WARN","Verification","Sent To and From column values are not displayed as Expected for Out Direction.",False
					Exit For
					Exit For
				End If
			ElseIf UCase(strCellValDir) = "IN" Then
				If Not IsNull(strCellValFrom) AND Trim(strCellValSentTo) ="" Then
					LogMessage "RSLT","Verification","Sent To and From column values are displayed as Expected for In Direction.",True
				Else
					LogMessage "WARN","Verification","Sent To and From column values are not displayed as Expected for In Direction.",False
					Exit For
					Exit For
				End If
			End If
		Next
		bNextPageExist =matchStr(IComm.lnkNext.GetROProperty("outerhtml"),"v-enabled")
		If bNextPageExist Then
			IComm.lnkNext.Click
		Else
			Exit For
		End If
	Next
End Function

