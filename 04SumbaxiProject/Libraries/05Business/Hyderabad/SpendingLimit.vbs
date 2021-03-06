'*****This is auto generated code using code generator please Re-validate ****************

'[Verify Tab Spending Limit is displayed]
Public Function verifyTabSpendingLimitExist_SL()
   bDevPending=false
   Wait(10)
   waitForIcallLoading
   verifyTabSpendingLimitExist_SL=verifyTabExist("Change of Spending Limit")
   waitForIcallLoading
End Function

'[Get Comment Label Text]
Public Function getCommentText()
   bDevPending=false
   getCommentText=SpendingLimit.txtComment.GetRoProperty("innertext")
End Function

'[Verify Field Comment on Spending Limit displayed as]
Public Function verifyCommentText_SL(strExpectedText)
   bDevPending=false
   bVerifyCommentText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyField( SpendingLimit.txtComment(), strExpectedText, "Comment")Then
           bVerifyCommentText=false
       End If
   End If
   verifyCommentText_SL=bVerifyCommentText
End Function

'[Set TextBox Comment on Spending Limit to]
Public Function setCommentTextbox_SL(strComment)
   bDevPending=False
   strTimeStamp = ""&now
	strComment =strComment &" "&strTimeStamp
	gstrRuntimeCommentStep="Set TextBox Comment on Spending Limit to"
	gstrParameterNameStep = "TimeStamp"&replace((replace((replace(now,"/","-"))," ","-")),":","-")
	insertDataStore gstrParameterNameStep, strComment
	'insertDataStore "SRComment", strComment
	
   SpendingLimit.txtComment.Set(strComment)
   If Err.Number<>0 Then
       setCommentTextbox_SL=false
            LogMessage "WARN","Verification","Failed to Set Text Box :Comment" ,false
       Exit Function
   End If
   setCommentTextbox_SL=true
End Function

'[Set TextBox on Spending Limit Comment to]
Public Function setCommentTextbox_SL(strComment)
   bDevPending=false
   SpendingLimit.txtComment.Set(strComment)
   If Err.Number<>0 Then
       setCommentTextbox_SL=false
            LogMessage "WARN","Verification","Failed to Set Text Box :Comment" ,false
       Exit Function
   End If
   setCommentTextbox_SL=true
End Function

'[Get EffectiveDate Label Text]
Public Function getEffectiveDateText()
   bDevPending=false
   getEffectiveDateText=SpendingLimit.txtEffectiveDate.GetRoProperty("innertext")
End Function

'[Verify Field EffectiveDate on Spending Limit displayed as]
Public Function verifyEffectiveDateText_SL(strExpectedText)
   bDevPending=false
   bVerifyEffectiveDateText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyField( SpendingLimit.txtEffectiveDate(), strExpectedText, "EffectiveDate")Then
           bVerifyEffectiveDateText=false
       End If
   End If
   verifyEffectiveDateText_SL=bVerifyEffectiveDateText
End Function

'[Set TextBox EffectiveDate on Spending Limit to]
Public Function setEffectiveDateTextbox_SL(strEffectiveDate)
	bDevPending=false
	setEffectiveDateTextbox_SL=true
	If Not IsNull (strEffectiveDate) Then
		If strEffectiveDate = "RUNTIME" Then
			strActualDateTime = fGetText(strSession, "01", "071", "10")
			'If len(Day(CDate(strActualDateTime)))=1 Then
				'strDay="0"&Day(CDate(strActualDateTime))
			'else
				strDay=""&Day(CDate(strActualDateTime))
			'End If	
			strEffectiveDate=""&strDay & " "&monthName(Month(CDate(strActualDateTime)),true) &" " &Year(CDate(strActualDateTime))
			setEffectiveDateTextbox_SL = SelectDatePicker_FromDate(strEffectiveDate)
			'SpendingLimit.txtEffectiveDate.Set(strEffectiveDate)
			gstrRuntimeEffectiveDateStep="Set TextBox EffectiveDate on Spending Limit to"
			insertDataStore "SREffectiveDate", strEffectiveDate
		Else
			setEffectiveDateTextbox_SL = SelectDatePicker_FromDate(strEffectiveDate)		
			'SpendingLimit.txtEffectiveDate.Set(strEffectiveDate)	
		End If
	End If
		
	If Err.Number<>0 Then
		setEffectiveDateTextbox_SL=false
		LogMessage "WARN","Verification","Failed to Set Text Box :EffectiveDate" ,false
		Exit Function
	End If	
End Function

'[Get ExpiryDate Label Text]
Public Function getExpiryDateText()
   bDevPending=false
   getExpiryDateText=SpendingLimit.txtExpiryDate.GetRoProperty("innertext")
End Function

'[Verify Field ExpiryDate on Spending Limit displayed as]
Public Function verifyExpiryDateText_SL(strExpectedText)
   bDevPending=false
   bVerifyExpiryDateText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyField( SpendingLimit.txtExpiryDate(), strExpectedText, "ExpiryDate")Then
           bVerifyExpiryDateText=false
       End If
   End If
   verifyExpiryDateText_SL=bVerifyExpiryDateText
End Function


'[Set TextBox ExpiryDate on Spending Limit to]
Public Function setExpiryDateTextbox_SL(strExpiryDate)
	bDevPending=false
	setExpiryDateTextbox_SL=true	
	If Not IsNull (strExpiryDate) Then
		If strExpiryDate = "RUNTIME" Then
			strActualDateTime = fGetText(strSession, "01", "071", "10")
			'If len(Day(CDate(strActualDateTime)))=1 Then ' BAU Change Updated
				'strDay="0"&Day(CDate(strActualDateTime))
			'else
				strDay=""&Day(CDate(strActualDateTime))
			'End If	
			strExpiryDate=""&strDay & " "&monthName(Month(CDate(strActualDateTime)),true) &" " &Year(CDate(strActualDateTime))
			
			'SpendingLimit.txtExpiryDate.Set(strExpiryDate)
			setExpiryDateTextbox_SL = SelectDatePicker_TODate(strExpiryDate)
		Else
			setExpiryDateTextbox_SL = SelectDatePicker_TODate(strExpiryDate)
			'SpendingLimit.txtExpiryDate.Set(strExpiryDate)	
		End If
	End If 
	If Err.Number<>0 Then
		setExpiryDateTextbox_SL=false
		LogMessage "WARN","Verification","Failed to Set Text Box :ExpiryDate" ,false
		Exit Function
	End If
	
End Function

'[Get NewSpendingLimit Label Text]
Public Function getNewSpendingLimitText()
   bDevPending=false
   getNewSpendingLimitText=SpendingLimit.txtNewSpendingLimit.GetRoProperty("innertext")
End Function

'[Verify Field NewSpendingLimit on Spending Limit displayed as]
Public Function verifyNewSpendingLimitText_SL(strExpectedText)
   bDevPending=false
   bVerifyNewSpendingLimitText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyField( SpendingLimit.txtNewSpendingLimit(), strExpectedText, "NewSpendingLimit")Then
           bVerifyNewSpendingLimitText=false
       End If
   End If
   verifyNewSpendingLimitText_SL=bVerifyNewSpendingLimitText
End Function


'[Set TextBox NewSpendingLimit on Spending Limit to]
Public Function setNewSpendingLimitTextbox_SL(strNewSpendingLimit)
   bDevPending=false
   SpendingLimit.txtNewSpendingLimit.Set(strNewSpendingLimit)
   If Err.Number<>0 Then
       setNewSpendingLimitTextbox_SL=false
            LogMessage "WARN","Verification","Failed to Set Text Box :NewSpendingLimit" ,false
       Exit Function
   End If
   setNewSpendingLimitTextbox_SL=true
End Function

'[Click Button AddNotes on Spending Limit]
Public Function clickButtonAddNotes_SL()
   bDevPending=false
   SpendingLimit.btnAddNotes.click
   If Err.Number<>0 Then
       clickButtonAddNotes_SL=false
            LogMessage "WARN","Verification","Failed to Click Button : AddNotes" ,false
       Exit Function
   End If
   clickButtonAddNotes_SL=true
End Function

'[Click Button Cancel on Spending Limit]
Public Function clickButtonCancel_SL()
   bDevPending=false
   SpendingLimit.btnCancel.click
   If Err.Number<>0 Then
       clickButtonCancel_SL=false
            LogMessage "WARN","Verification","Failed to Click Button : Cancel" ,false
       Exit Function
   End If
   clickButtonCancel_SL=true
End Function

'[Verify Button Submit is enabled on Spending Limit Screen]
Public Function VerifybtnSubmit_SL()
	bDevPending=False
   Dim bVerifybtnSubmit_CC:bVerifybtnSubmit_CC=true
	'CashlineCancellation.tblSelectedCardsHeader.Click
	intBtnSubmit=Instr(SpendingLimit.btnSubmit.GetROproperty("outerhtml"),("v-disabled"))
	If  intBtnSubmit=0 Then
		LogMessage "RSLT","Verification","Submit button is enable as per expectation.",True
		bVerifybtnSubmit_CC=true
	Else
		LogMessage "WARN","Verifiation","Submit button is disable. Expected to be enable.",false
		bVerifybtnSubmit_CC=false
	End If
	VerifybtnSubmit_SL=bVerifybtnSubmit_CC
End Function

'[Click Button Submit on Spending Limit]
Public Function clickButtonSubmit_SL()
   bDevPending=false
   SpendingLimit.btnSubmit.click
   If Err.Number<>0 Then
       clickButtonSubmit_SL=false
            LogMessage "WARN","Verification","Failed to Click Button : Submit" ,false
       Exit Function
   End If
   waitForIcallLoading
   clickButtonSubmit_SL=true
End Function

'[Verify Popup Request Submitted exist for Spending Limit]
Public Function verifyPopupRequestSubmitted_SL(bExist)
   bDevPending=false
   bActualExist=SpendingLimit.popupRequestSubmitted.Exist(4)
   If bExist And  bActualExist  Then
       LogMessage "RSLT","Verification","Popup :RequestSubmitted Exists As Expected" ,true
       verifyPopupRequestSubmitted_SL=True
   ElseIf not bExist And  not bActualExist  Then
       LogMessage "RSLT","Verification","Popup :RequestSubmitted does not Exists As Expected" ,true
       verifyPopupRequestSubmitted_SL=True
   ElseIf bExist And  not bActualExist  Then
       LogMessage "WARN","Verification","Popup :RequestSubmitted does not Exists As Expected" ,False
       verifyPopupRequestSubmitted_SL=False
   ElseIf not bExist And   bActualExist  Then
       LogMessage "WARN","Verification","Popup :RequestSubmitted Still Exists" ,False
       verifyPopupRequestSubmitted_SL=False
   End If
End Function

'[Verify Field CardNumber on Request Submitted Popup for Spending Limit displayed as]
Public Function verifyCardNumber_RequestSubmitted_SL(strCardNumber)
   bDevPending=false
   bVerifyCardNumber_RequestSubmittedText=true
   insertDataStore "NewSAUsedCard", ""&strCardNumber
   If Not IsNull(strCardNumber) Then
       If Not VerifyInnerText (SpendingLimit.lblCardNumber_RequestSubmitted(), strCardNumber, "CardNumber_RequestSubmitted")Then
           bVerifyCardNumber_RequestSubmittedText=false
       End If
   End If
   verifyCardNumber_RequestSubmitted_SL=bVerifyCardNumber_RequestSubmittedText
End Function

'[Verify Field ProductDescription on Request Submitted Popup for Spending Limit displayed as]
Public Function verifyProductDescription_RequestSubmitted_SL(strProductDescription)
   bDevPending=false
   bVerifyProductDescription_RequestSubmittedText=true
   If Not IsNull(strProductDescription) Then
       If Not VerifyInnerText (SpendingLimit.lblProductDescription_RequestSubmitted(), strProductDescription, "ProductDescription_RequestSubmitted")Then
           bVerifyProductDescription_RequestSubmittedText=false
       End If
   End If
   verifyProductDescription_RequestSubmitted_SL=bVerifyProductDescription_RequestSubmittedText
End Function

'[Click Link SRNumber on Request Submitted Popup for Spending Limit]
Public Function clickLinkSRNumber_RequestSubmitted_SL()
   bDevPending=false
   gstrRuntimeSRNumStep="Click Link SRNumber on Request Submitted Popup for Spending Limit"
   strSelectedSR=SpendingLimit.lnkSRNumber_RequestSubmitted.GetRoProperty("innerText")
	If strSelectedSR<>"" Then
		 insertDataStore "SelectedSRLink", strSelectedSR	
	   SpendingLimit.lnkSRNumber_RequestSubmitted.click
	 else
   		LogMessage "RSLT","Verification","SR Number did not displayed on Request Submitted pop up",false
	End If
   WaitForIcallLoading
   If Err.Number<>0 Then
       clickLinkSRNumber_RequestSubmitted_SL=false
            LogMessage "WARN","Verification","Failed to Click Link : SRNumber_RequestSubmitted" ,false
       Exit Function
   End If
   clickLinkSRNumber_RequestSubmitted_SL=true
End Function

'[Verify Field Status_RequestSubmitted For Spending Limit displayed as]
Public Function verifyStatus_RequestSubmitted_SL(strExpectedText)
   bDevPending=false
   bVerifyStatus_RequestSubmittedText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (SpendingLimit.lblStatus_RequestSubmitted(), strExpectedText, "Status_RequestSubmitted")Then
           bVerifyStatus_RequestSubmittedText=false
       End If
   End If
   verifyStatus_RequestSubmitted_SL=bVerifyStatus_RequestSubmittedText
End Function

'[Click Button RefreshStatus For Spending Limit]
Public Function clickButtonRefreshStatus_SL()
   bDevPending=false
   SpendingLimit.btnRefreshStatus.click
	WaitForICallLoading
    		'Get Status
		If SpendingLimit.lblStatus_RequestSubmitted.getROProperty("innertext")="In Progress" then 
			bStatus=true
		 else
			bStatus=false
		End If		
	
	While  bStatus AND (iCount<60)
		SpendingLimit.btnRefreshStatus.click
		wait 1
        	'Get Status
			strStatus=SpendingLimit.lblStatus_RequestSubmitted.getROProperty("innertext")
			If Trim(strStatus)="In Progress" then 
				bStatus=true
			 else
				LogMessage "WARN","Verification","Status displayed as  :"&strStatus ,true
				bStatus=false
			End If
		wait 5
		intBtnRefreshStatus=Instr(SpendingLimit.btnRefreshStatus.GetROproperty("outerhtml"),"v-disabled")
		If intBtnRefreshStatus<>0 Then
			LogMessage "WARN","Verification","Button : RefreshStatus is disabled" ,true
			bStatust=true
		End If
		iCount=iCount+1
	  Wend	

   If Err.Number<>0 Then
       
            LogMessage "WARN","Verification","Failed to Click Button : RefreshStatus" ,false
			clickButtonRefreshStatus_SL=false
       Exit Function
   End If
   WaitForICallLoading
  
   clickButtonRefreshStatus_SL=true
End Function

'[Verify Link SRNumber available on Request Submitted popup for Spending Limit Screen]
Public Function verifyLinkSRNumber_RequestSubmitted_SL()
   bDevPending=False
   bverifyLinkSRNumber_RequestSubmitted=true
	strSelectedSR=SpendingLimit.lnkSRNumber_RequestSubmitted.GetRoProperty("innerText")
	insertDataStore "SelectedSRLink", strSelectedSR
	If instr(SpendingLimit.lnkSRNumber_RequestSubmitted.GetRoProperty("class"),"link")=0 Then
		bverifyLinkSRNumber_RequestSubmitted=false
	else
		bverifyLinkSRNumber_RequestSubmitted=true
	end If
	LogMessage "RSLT","Verification","SR Number link "& strSelectedSR &" displayed on Request Submitted popup",true
	If IsNull(strSRNumber) Then
		LogMessage "WARN","Verification", "SR Number not available with link on Request Submitted popup.",false
		bverifyLinkSRNumber_RequestSubmitted=false
	End If

   verifyLinkSRNumber_RequestSubmitted_SL=bverifyLinkSRNumber_RequestSubmitted
End Function

'[Get Description Label Text]
Public Function getDescriptionText()
   bDevPending=false
   getDescriptionText=SpendingLimit.lblDescription.GetRoProperty("innertext")
End Function

'[Verify Field Description displayed as on Spending Limit]
Public Function verifyDescriptionText_SL(strExpectedText)
   bDevPending=false
   bVerifyDescriptionText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (SpendingLimit.lblDescription(), strExpectedText, "Description")Then
           bVerifyDescriptionText=false
       End If
   End If
   verifyDescriptionText_SL=bVerifyDescriptionText
End Function

'[Verify Field Effective Date Error Message on Spending Limit displayed as]
Public Function verifyEffectiveDateErr_SL(strExpectedText)
   bDevPending=false
   bVerifyDescriptionText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (SpendingLimit.lblEffectiveDateError(), strExpectedText, "Effective Date")Then
           bVerifyDescriptionText=false
       End If
   End If
   verifyEffectiveDateErr_SL=bVerifyDescriptionText
End Function

'[Verify Field Expiry Date Error Message on Spending Limit displayed as]
Public Function verifyExpiryDateErr_SL(strExpectedText)
   bDevPending=false
   bVerifyDescriptionText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (SpendingLimit.lblExpiryDateError(), strExpectedText, "Expiry Date")Then
           bVerifyDescriptionText=false
       End If
   End If
   verifyExpiryDateErr_SL=bVerifyDescriptionText
End Function

'[Verify Field New Spending Limit Error Message on Spending Limit displayed as]
Public Function verifySpendingLimitErr_SL(strExpectedText)
   bDevPending=false
   bVerifyDescriptionText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (SpendingLimit.lblSpendingLimitError(), strExpectedText, "New Spending Limit")Then
           bVerifyDescriptionText=false
       End If
   End If
   verifySpendingLimitErr_SL=bVerifyDescriptionText
End Function

'[Click Link KnowledgeBase on Spending Limit]
Public Function clickLinkKnowledgeBase_SL()
   bDevPending=false
   SpendingLimit.lnkKnowledgeBase.click
   If Err.Number<>0 Then
       clickLinkKnowledgeBase_SL=false
            LogMessage "WARN","Verification","Failed to Click Link : KnowledgeBase" ,false
       Exit Function
   End If
   clickLinkKnowledgeBase_SL=true
End Function

'[Verify Field KnowledgeBase on Spending Limit SR Screen displayed as]
Public Function verifyKnowledgeBase_SL(strExpectedLink)
   bDevPending=false
   bVerifyKnowledgeBaseText=true
   If Not IsNull(strExpectedLink) Then
		
		Set oDesc_KB = Description.Create()
			oDesc_KB("micclass").Value = "Link"		
			'strKBLink=SpendingLimit.lnkKnowledgeBase.ChildObjects(oDesc_KB)(0).GetROProperty("href")
			strKBLink = SpendingLimit.lnkKnowledgeBase.GetROProperty("href")
			strExpectedLink=Replace(strExpectedLink,"@","=")
       If not MatchStr(strKBLink, strExpectedLink)Then
		   LogMessage "RSLT","Verification","Knowledge base link does not matched with expected. Actual : "&strKBLink&" Expected "&strExpectedLink,false
           bVerifyKnowledgeBaseText=false
	   else
	 		LogMessage "RSLT","Verification","Knowledge base link matrched with expected",true
       End If
   End If
   verifyKnowledgeBase_SL=bVerifyKnowledgeBaseText
End Function

'[Select Combobox ReasonForChange on Spending Limit as]
Public Function selectReasonForChangeComboBox_SL(strReasonForChange)
   bDevPending=false
   bSelectReasonForChangeComboBox=true
   If Not IsNull(strReasonForChange) Then
       If Not (selectItem_Combobox (SpendingLimit.lstReasonForChange(), strReasonForChange))Then
            LogMessage "WARN","Verification","Failed to select :"&strControlName&" From ReasonForChange drop down list" ,false
           bSelectReasonForChangeComboBox=false
       End If
   End If
   WaitForIcallLoading
   selectReasonForChangeComboBox_SL=bSelectReasonForChangeComboBox
End Function

'[Get selected item from combo box ReasonForChange]
Public Function getReasonForChangeSelectedItem()
   bDevPending=false
   getReasonForChangeSelectedItem=getVadinCombo_SelectedItem(SpendingLimit.lstReasonForChange)
End Function

'[Verify Combobox ReasonForChange on Spending Limit displayed as]
Public Function verifyReasonForChangeText_SL(strExpectedText)
   bDevPending=false
   bVerifyReasonForChangeText=true
   If Not IsNull(strExpectedText) Then
       If Not verifyComboSelectItem (SpendingLimit.lstReasonForChange(), strExpectedText, "ReasonForChange")Then
           bVerifyReasonForChangeText=false
       End If
   End If
   verifyReasonForChangeText_SL=bVerifyReasonForChangeText
End Function

'[Select Combobox SpendingLimitType on Spending Limit as]
Public Function selectSpendingLimitTypeComboBox_SL(strSpendingLimitType)
   bDevPending=false
   bSelectSpendingLimitTypeComboBox=true
   If Not IsNull(strSpendingLimitType) Then
       If Not (selectItem_Combobox (SpendingLimit.lstSpendingLimitType(), strSpendingLimitType))Then
            LogMessage "WARN","Verification","Failed to select :"&strControlName&" From SpendingLimitType drop down list" ,false
           bSelectSpendingLimitTypeComboBox=false
       End If
   End If
   Wait(20)
   WaitForIcallLoading
   selectSpendingLimitTypeComboBox_SL=bSelectSpendingLimitTypeComboBox
End Function

'[Get selected item from combo box SpendingLimitType]
Public Function getSpendingLimitTypeSelectedItem()
   bDevPending=false
   getSpendingLimitTypeSelectedItem=getVadinCombo_SelectedItem(SpendingLimit.lstSpendingLimitType)
End Function

'[Verify Combobox SpendingLimitType on Spending Limit displayed as]
Public Function verifySpendingLimitTypeText_SL(strExpectedText)
   bDevPending=false
   bVerifySpendingLimitTypeText=true
   If Not IsNull(strExpectedText) Then
       If Not verifyComboSelectItem (SpendingLimit.lstSpendingLimitType(), strExpectedText, "SpendingLimitType")Then
           bVerifySpendingLimitTypeText=false
       End If
   End If
   WaitForIcallLoading
   verifySpendingLimitTypeText_SL=bVerifySpendingLimitTypeText
End Function

'[Verify Popup ValidationMessage on Spending Limit exist]
Public Function verifyPopupValidationMessageexist_SL(bExist)
   bDevPending=false
   bActualExist=strTestAppFrameClass.Exist()
   If bExist And  bActualExist  Then
       LogMessage "RSLT","Verification","Popup :ValidationMessage Exists As Expected" ,true
       verifyPopupValidationMessageexist_SL=True
   ElseIf not bExist And  not bActualExist  Then
       LogMessage "RSLT","Verification","Popup :ValidationMessage does not Exists As Expected" ,true
       verifyPopupValidationMessageexist_SL=True
   ElseIf bExist And  not bActualExist  Then
       LogMessage "WARN","Verification","Popup :ValidationMessage does not Exists As Expected" ,False
       verifyPopupValidationMessageexist_SL=False
   ElseIf not bExist And   bActualExist  Then
       LogMessage "WARN","Verification","Popup :ValidationMessage Still Exists" ,False
       verifyPopupValidationMessageexist_SL=False
   End If
End Function

'[Get Notes Label Text]
Public Function getNotesText()
   bDevPending=false
   getNotesText=SpendingLimit.txtNotes.GetRoProperty("innertext")
End Function

'[Verify Field Notes on Spending Limit displayed as]
Public Function verifyNotesText_SL(strExpectedText)
   bDevPending=false
   bVerifyNotesText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyField(SpendingLimit.txtNotes(), strExpectedText, "Notes")Then
           bVerifyNotesText=false
       End If
   End If
   verifyNotesText_SL=bVerifyNotesText
End Function

'[Perform Add Notes by clicking Add Notes Button on Spending Limit Screen]
Public Function addNote_SL(strNote)
   bDevPending=false
   bVerifypopupNotes=true
	Dim bVerifypopupNotes:VerifypopupNotes=true
	
	If not isNull(strNote) Then
		SpendingLimit.btnAddNotes.click
		WaitForICallLoading
            If not SpendingLimit.popupValidationMessage.exist(5)Then
				LogMessage "WARN","Verification","New Note dialog did not displayed",false
				bVerifypopupNotes=false
			 else
			 strMessage=SpendingLimit.lblMaxAllowed.GetROProperty("innerText")
				If not strMessage="Max allowed - 3000" Then
					LogMessage "WARN","Verification","Add New Comment popup dislog incorrectly displayed max allowed character count for comment. Expected : Max allowed - 3000 and Actual: "&strMessage,false
					bVerifypopupNotes=false
				End If
			   ServiceRequest.txtNewComment.set strNote
			  
				   ServiceRequest.clickSave_Popup
			  WaitForIcallLoading
		   End If 
		End If 
	addNote_SL=bVerifypopupNotes
End Function

'[Click Button OK_ValidationMsg on Spending Limit]
Public Function clickButtonOK_ValidationMsg_SL()
   bDevPending=false
   SpendingLimit.btnOK_ValidationMsg.click
   If Err.Number<>0 Then
       clickButtonOK_ValidationMsg_SL=false
            LogMessage "WARN","Verification","Failed to Click Button : OK_ValidationMsg" ,false
       Exit Function
   End If
   clickButtonOK_ValidationMsg_SL=true
End Function

'[Get ValidationMessage Label Text]
Public Function getValidationMessageText()
   bDevPending=false
   getValidationMessageText=SpendingLimit.lblValidationMessage.GetRoProperty("innertext")
End Function

'[Verify Field ValidationMessage on Spending Limit displayed as]
Public Function verifyValidationMessageText_SL(strExpectedText)
   bDevPending=false
   bVerifyValidationMessageText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (SpendingLimit.lblValidationMessage(), strExpectedText, "ValidationMessage")Then
           bVerifyValidationMessageText=false
       End If
   End If
   verifyValidationMessageText_SL=bVerifyValidationMessageText
End Function

'[Verify Table CurrentSpendingLimitContent displayed]
Public Function verifyCurrentSpendingLimitContentTabledisplayed()
   bDevPending=false
   verifyCurrentSpendingLimitContentdisplayed= SpendingLimit.tblCurrentSpendingLimitContent.Exist(1)
End Function

'[Verify Table CurrentSpendingLimitContent has following Columns]
Public Function verifyCurrentSpendingLimitContentTableColumns(arrColumnNameList)
   bDevPending=false
   verifyCurrentSpendingLimitContentTableColumns=verifyTableColumns(SpendingLimit.tblCurrentSpendingLimitContent,arrColumnNameList)
End Function

'[Verify row Data in Table CurrentSpendingLimit for Spending Limit]
Public Function verifytblCurrentSpendingLimit_RowData_SL(arrRowDataList)
   bDevPending=false
   verifytblCurrentSpendingLimit_RowData_SL=verifyTableContentList(SpendingLimit.tblCurrentSpendingLimitHeader,SpendingLimit.tblCurrentSpendingLimitContent,arrRowDataList,"CurrentSpendingLimitContent" , false,null ,null,null)
End Function

'[Click <Column Name> link in Table CurrentSpendingLimitContent]
Public Function clickCurrentSpendingLimitContent_link(arrRowDataList)
   bDevPending=false
   clickCurrentSpendingLimitContent_link=selectTableLink(SpendingLimit.tblCurrentSpendingLimitContentHeader,SpendingLimit.tblCurrentSpendingLimitContentContent,arrRowDataList,"CurrentSpendingLimitContent" ,"Column Name",bPagination,SpendingLimit.lnkNext,SpendingLimit.lnkNext1 ,SpendingLimit.lnkPrevious)
End Function

'[Verify Table CurrentSpendingLimitHeader displayed]
Public Function verifyCurrentSpendingLimitHeaderTabledisplayed()
   bDevPending=false
   verifyCurrentSpendingLimitHeaderdisplayed= SpendingLimit.tblCurrentSpendingLimitHeader.Exist(1)
End Function

'[Verify Table CurrentSpendingLimitHeader has following Columns]
Public Function verifyCurrentSpendingLimitHeaderTableColumns(arrColumnNameList)
   bDevPending=false
   verifyCurrentSpendingLimitHeaderTableColumns=verifyTableColumns(SpendingLimit.tblCurrentSpendingLimitHeader,arrColumnNameList)
End Function

'[Verify row Data in Table CurrentSpendingLimitHeader]
Public Function verifytblCurrentSpendingLimitHeader_RowData(arrRowDataList)
   bDevPending=false
   verifytblCurrentSpendingLimitHeader_RowData=verifyTableContentList(SpendingLimit.tblCurrentSpendingLimitHeaderHeader,SpendingLimit.tblCurrentSpendingLimitHeaderContent,arrRowDataList,"CurrentSpendingLimitHeader" , bPagination,SpendingLimit.lnkNext ,SpendingLimit.lnkNext1,SpendingLimit.lnkPrevious)
End Function

'[Click <Column Name> link in Table CurrentSpendingLimitHeader]
Public Function clickCurrentSpendingLimitHeader_link(arrRowDataList)
   bDevPending=false
   clickCurrentSpendingLimitHeader_link=selectTableLink(SpendingLimit.tblCurrentSpendingLimitHeaderHeader,SpendingLimit.tblCurrentSpendingLimitHeaderContent,arrRowDataList,"CurrentSpendingLimitHeader" ,"Column Name",bPagination,SpendingLimit.lnkNext ,SpendingLimit.lnkNext1 ,SpendingLimit.lnkPrevious)
End Function

'[Verify Table SelectedCardsContent displayed]
Public Function verifySelectedCardsContentTabledisplayed()
   bDevPending=false
   verifySelectedCardsContentdisplayed= SpendingLimit.tblSelectedCardsContent.Exist(1)
End Function

'[Verify Table SelectedCardsContent has following Columns]
Public Function verifySelectedCardsContentTableColumns(arrColumnNameList)
   bDevPending=false
   verifySelectedCardsContentTableColumns=verifyTableColumns(SpendingLimit.tblSelectedCardsContent,arrColumnNameList)
End Function

'[Verify row Data in Table SelectedCards for Spending Limit]
Public Function verifytblSelectedCardsContent_RowData_SL(arrRowDataList)
   bDevPending=false
   WaitForIcallLoading
   verifytblSelectedCardsContent_RowData_SL=verifyTableContentList(SpendingLimit.tblSelectedCardsHeader,SpendingLimit.tblSelectedCardsContent,arrRowDataList,"SelectedCards" , false,null ,null,null)
   WaitForIcallLoading
End Function

'[Click <Column Name> link in Table SelectedCardsContent]
Public Function clickSelectedCardsContent_link(arrRowDataList)
   bDevPending=false
   clickSelectedCardsContent_link=selectTableLink(SpendingLimit.tblSelectedCardsContentHeader,SpendingLimit.tblSelectedCardsContentContent,arrRowDataList,"SelectedCardsContent" ,"Column Name",bPagination,SpendingLimit.lnkNext ,SpendingLimit.lnkNext1 ,SpendingLimit.lnkPrevious)
End Function

'[Verify Table SelectedCardsHeader displayed]
Public Function verifySelectedCardsHeaderTabledisplayed()
   bDevPending=false
   verifySelectedCardsHeaderdisplayed= SpendingLimit.tblSelectedCardsHeader.Exist(1)
End Function

'[Verify Table SelectedCardsHeader has following Columns]
Public Function verifySelectedCardsHeaderTableColumns(arrColumnNameList)
   bDevPending=false
   verifySelectedCardsHeaderTableColumns=verifyTableColumns(SpendingLimit.tblSelectedCardsHeader,arrColumnNameList)
End Function

'[Verify row Data in Table SelectedCardsHeader]
Public Function verifytblSelectedCardsHeader_RowData(arrRowDataList)
   bDevPending=false
   verifytblSelectedCardsHeader_RowData=verifyTableContentList(SpendingLimit.tblSelectedCardsHeaderHeader,SpendingLimit_Page.tblSelectedCardsHeaderContent,arrRowDataList,"SelectedCardsHeader" , bPagination,SpendingLimit_Page.lnkNext ,SpendingLimit_Page.lnkNext1,SpendingLimit_Page.lnkPrevious)
End Function

'[Click <Column Name> link in Table SelectedCardsHeader]
Public Function clickSelectedCardsHeader_link(arrRowDataList)
   bDevPending=false
   clickSelectedCardsHeader_link=selectTableLink(SpendingLimit.tblSelectedCardsHeaderHeader,SpendingLimit_Page.tblSelectedCardsHeaderContent,arrRowDataList,"SelectedCardsHeader" ,"Column Name",bPagination,SpendingLimit_Page.lnkNext ,SpendingLimit_Page.lnkNext1 ,SpendingLimit_Page.lnkPrevious)
End Function

'[Perform Additional Verification for TPIN call from Spending Limit]
Public Function performTPINPlusOne_SpendingLimit(bExpectedVerification, strValidationMessage)
   Dim bPerformTPINPlusOneVerification:bPerformTPINPlusOneVerification=true
   bActualExist=SpendingLimit.popupValidationMessage.Exist(1)
	'bActualExist=true	
   If bExpectedVerification Then
		If not bActualExist Then
			bPerformTPINPlusOneVerification=false
		 else
			strActualValidationMessage=SpendingLimit.lblValidationMessage.GetRoProperty("innertext")
			If Not IsNull(strActualValidationMessage) Then
				If Not VerifyInnerText (SpendingLimit.lblValidationMessage(), strValidationMessage, "ValidationMessage")Then
					bPerformTPINPlusOneVerification=false
				End If
			End If
			SpendingLimit.btnOK_ValidationMsg.Click
			VerifyCustomer.btnVerify.Click
			waitForIcallLoading
			
			'Check Required Verification met Check box
			Set oDesc= Description.Create()
			oDesc("micclass").Value="WebCheckBox"
			'CardActivation.cbTPINVerification.ChildObjects(oDesc)(0).Set "ON" '******** Check box removed
			CardActivation.rbAdditionalAnswer.click
			'Wait 1
			VerifyCustomer.btnVerifyCustomer().click
			waitForIcallLoading
			If err.number<>0 Then
				bPerformTPINPlusOneVerification=false
			End If
		End If	 
   End If
   performTPINPlusOne_SpendingLimit=bPerformTPINPlusOneVerification
End Function

'[Verify Validation Message displayed on Spending Limit as]
Public Function verifyValidationMessage_SL(strValidationMessage)
	bDevPending = False
	bVerifyValidationMessageText = true
	If Not IsNull(strValidationMessage) Then   
		If (SpendingLimit.popupValidationMessage.Exist) Then
			If Not VerifyInnerText (SpendingLimit.lblValidationMessage(), strValidationMessage, "Validation Message")Then
				bVerifyValidationMessageText=false
			End If
			SpendingLimit.btnOK_ValidationMsg.Click
		else
			bVerifyValidationMessageText = false
		End If		
	End If  
	WaitForIcallLoading
	verifyValidationMessage_SL=bVerifyValidationMessageText
End Function

'[Click Close On Request Submit Button FOR SpendingLimit]
Public Function clickCloseSpendingLimit()
   bDevPending=false
   SpendingLimit.btnCancel_RequestSubmitted.click
   If Err.Number<>0 Then
       clickCloseSpendingLimit=false
            LogMessage "WARN","Verification","Failed to Click Button : SpendingLimit" ,false
       Exit Function
   End If
   waitForIcallLoading
   clickCloseSpendingLimit=true
End Function

