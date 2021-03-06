'*****This is auto generated code using code generator please Re-validate ****************
Dim strRunTimeSRNumber:strRunTimeSRNumber=""  'This Variable is used to Store SR numbers at runtime
Dim strRunTimeDataStore_BlockedCardStep:strRunTimeDataStore_BlockedCardStep="" 'This Variable is used to store step name that adds blocked cards to Data Store
Dim strRunTimeDataStore_VarName:strRunTimeDataStore_VarName=""

'[Click Button Block Card]
Public Function clickButtonBlockCard()
   bDevPending=false
   BlockCancelCards.btnBlockCard.click
   If Err.Number<>0 Then
       clickButtonBlockCard=false
            LogMessage "WARN","Verification","Failed to Click Button : BlockCard" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickButtonBlockCard=true
End Function

'[Verify Tab Block Card displayed]
Public Function verifyTabBlockCardexist()
   bDevPending=False
   verifyTabBlockCardexist=verifyTabExist("Block Card")
End Function

'[Verify Tab Report/Stolen displayed]
Public Function verifyTabReportStolenExist()
	bDevPending=False
	verifyTabReportStolenExist =verifyTabExist("Report Lost/Stolen")
End Function

'[Select Tab Block Card]
Public Function setectTabBlockCard(strTabName)
   bDevPending=true
   setectTabBlockCard=selectTab(strTabName)
End Function

'[Close Tab Block Card]
Public Function closeTabBlockCard(strTabName)
   bDevPending=true
   closeTabBlockCard=closeTab(strTabName)
   WaitForICallLoading
End Function

'[Click Button Select All]
Public Function clickButtonSelectAll()
   bDevPending=true
   BlockCancelCards.btnSelectAll.click
   If Err.Number<>0 Then
       clickButtonSelectAll=false
            LogMessage "WARN","Verification","Failed to Click Button : Select All" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickButtonSelectAll=true
End Function

'[Select Combobox Reason For Blocking as]
Public Function selectReasonForBlockingComboBox(strReasonForBlocking)
   bDevPending=False
   bSelectReasonForBlockingComboBox=true
   If Not IsNull(strReasonForBlocking) Then
	   BlockCancelCards.lstReasonForBlocking.RefreshObject
       If Not (selectItem_Combobox (BlockCancelCards.lstReasonForBlocking(), strReasonForBlocking))Then
            LogMessage "WARN","Verification","Failed to select :"&strReasonForBlocking&" From Reason For Blocking drop down list" ,false
           bSelectReasonForBlockingComboBox=false
		Else
			  LogMessage "RSLT","Verification","Selected :"&strReasonForBlocking&" From Reason For Blocking drop down list" ,true
       End If
   End If
   WaitForICallLoading
   selectReasonForBlockingComboBox=bSelectReasonForBlockingComboBox
End Function

'[Verify Reason For blocking Combobox has Items]
Public Function verifyReasonForBlockingComboboxItems(lstItems)
   bDevPending=false
   bVerifyReasonForBlockingItems=true
   If Not IsNull(lstItems) Then
       If Not verifyComboboxItems (BlockCancelCards.lstReasonForBlocking(), lstItems, "Reason For Blocking")Then
           bVerifyReasonForBlockingItems=false
       End If
   End If
   verifyReasonForBlockingComboboxItems=bVerifyReasonForBlockingItems
End Function

'[Verify Combobox Reason For Blocking displayed as]
Public Function verifyReasonForBlocking_Default(strReason)
   bDevPending=false
   bVerifyReasonForBlockingText=true
   If Not IsNull(strReason) Then
       If Not verifyComboSelectItem (BlockCancelCards.lstReasonForBlocking(), strReason, "ReasonForBlocking")Then
           bVerifyReasonForBlockingText=false
       End If
   End If
   verifyReasonForBlocking_Default=bVerifyReasonForBlockingText
End Function

'[Verify Combobox Reason For Blocking has items]
Public Function verifyReasonForBlocking_ItemList(lstItems)
   bDevPending=false
   bVerifyReasonForBlockingText=true
   If Not IsNull(lstItems) Then
	
       If Not verifyComboboxItems (BlockCancelCards.lstReasonForBlocking(), lstItems, "ReasonForBlocking")Then
           bVerifyReasonForBlockingText=false
       End If
   End If
   verifyReasonForBlocking_ItemList=bVerifyReasonForBlockingText
End Function

'[Click Button Cancel on Block Card Screen]
Public Function clickButtonCancel_TabBlockCard()
   bDevPending=true
   BlockCancelCards.btnCancel_TabBlockCard.click
   If Err.Number<>0 Then
       clickButtonCancel_TabBlockCard=false
            LogMessage "WARN","Verification","Failed to Click Button : Cancel_TabBlockCard" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickButtonCancel_TabBlockCard=true
End Function

'[Verify Table Selected Cards displayed]
Public Function verifySelectedCardsTabledisplayed()
   bDevPending=false
   bverifySelectedCardsTabledisplayed=true
   If not (BlockCancelCards.tblSelectedCardsHeader.Exist(1)) Then
		bverifySelectedCardsTabledisplayed=false
   End If
	verifySelectedCardsTabledisplayed=bverifySelectedCardsTabledisplayed
End Function

'[Verify Table Selected Cards has following Columns]
Public Function verifySelectedCardsTableColumns(arrColumnNameList)
   bDevPending=true
   verifySelectedCardsTableColumns=verifyTableColumns(BlockCancelCards.tblSelectedCards,arrColumnNameList)
End Function

'[Verify row Data in Table Selected Cards for Block Card]
Public Function verifytblSelectedCardsBlockCards_RowData(lstlstSelectedCards)
   bverifytblSelectedCardsBlockCards_RowData = true
   verifytblSelectedCardsBlockCards_RowData=verifyTableContentList(BlockCancelCards.tblSelectedCardsHeader,BlockCancelCards.tblSelectedCardsContent,lstlstSelectedCards,"Selected Card",False,Null ,Null,Null)
   verifytblSelectedCardsBlockCards_RowData = bverifytblSelectedCardsBlockCards_RowData
End Function

'[Click <Column Name> link in Table Selected Cards]
Public Function clickSelectedCards_link(arrRowDataList)
   bDevPending=true
   clickSelectedCards_link=selectTableLink(tblSelectedCardsHeader,tblSelectedCardsContent,arrRowDataList,"SelectedCards" ,"Column Name",bPagination,BlockCancelCards.lnkNext ,BlockCancelCards.lnkNext1 ,BlockCancelCards.lnkPrevious)
End Function

'[Get Description Label Text]
Public Function getDescriptionText()
   bDevPending=true
   getDescriptionText=BlockCancelCards.lblDescription.GetRoProperty("innertext")
End Function

'[Verify Field Description displayed as]
Public Function verifyDescriptionText(strDescription)
   bDevPending=False
   bVerifyDescriptionText=true
   If Not IsNull(strDescription) Then
       If Not VerifyInnerText (BlockCancelCards.lblDescription(), strDescription, "Description")Then
           bVerifyDescriptionText=false
       End If
   End If
   verifyDescriptionText=bverifyDescriptionText
End Function

'[Verify Knowledge base link is enabled]
Public Function VerifyKnowledgebaselinkEnabled()
      bDevPending=False
   Dim bVerifyKnowledgebaselink:bVerifyKnowledgebaselink=true
     strKBLink=BlockCancelCards.lnkKnowledgeBase.GetROProperty("Outerhtml")
	
    If inStr(strKBLink,"v-disabled") = 0Then
		LogMessage "RSLT","Verification","Knowledge base Link  enabled successfully as expected",true
	else
		LogMessage "WARN","Verification","Knowledge base Link  does not enabledas expected",false
		bVerifyKnowledgebaselink=false
	End If
	VerifyKnowledgebaselinkEnabled=bVerifyKnowledgebaselink
End Function

'[Verify Knowledge base link is disabled]
Public Function VerifyKnowledgebaselinkDisabled()
      bDevPending=False
   Dim bVerifyKnowledgebaselink:bVerifyKnowledgebaselink=true
     strKBLink=BlockCancelCards.lnkKnowledgeBase.GetROProperty("Outerhtml")
	
    If not inStr(strKBLink,"v-disabled") = 0Then
		LogMessage "RSLT","Verification","Knowledge base Link  disabled successfully as expected",true
	else
		LogMessage "WARN","Verification","Knowledge base Link  does not disabled as expected",false
		bVerifyKnowledgebaselink=false
	End If
	VerifyKnowledgebaselinkDisabled=bVerifyKnowledgebaselink
End Function

'[Verify Knowledge base link displayed on Block Card Screen]
Public Function VerifyKnowledgebaselink_BlockCard(strExpectedLink)
      'bDevPending=false
   bverifyKnowledgeBase_BlockCard=true
   If Not IsNull(strExpectedText) Then
		
	Set oDesc_KB = Description.Create()
	oDesc_KB("micclass").Value = "Link"
	'strKBLink=FeeAdjustment.lnkKnowledgeBase.ChildObjects(oDesc_KB)(0).GetROProperty("href")
	strKBLink=SpendingLimit.lnkKnowledgeBase.GetROProperty("href")
	strExpectedLink=Replace(strExpectedLink,"@","=")			
       If not MatchStr(strKBLink, strExpectedLink)Then
		   LogMessage "RSLT","Verification","Knowledge base link does not matched with expected. Actual : "&strKBLink&" Expected "&strExpectedLink,false
           bverifyKnowledgeBase_BlockCard=false
	   else
	 		LogMessage "RSLT","Verification","Knowledge base link matrched with expected",true
       End If
   End If
   VerifyKnowledgebaselink_BlockCard=bverifyKnowledgeBase_BlockCard
End Function


'[Click Button Notes]
Public Function clickButtonAddNotes()
   bDevPending=true
   BlockCancelCards.btnAddNotes.click
   If Err.Number<>0 Then
       clickButtonAddNotes=false
            LogMessage "WARN","Verification","Failed to Click Button : AddNotes" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickButtonAddNotes=true
End Function

'[Verify Button Add Notes is enabled]
Public Function VerifybtnAddNote_enabled()
	bDevPending=False
   Dim bVerifyAddNote:bVerifyAddNote=true
	intBtnNote=Instr(BlockCancelCards.btnAddNotes.GetROproperty("outerhtml"),"v-disabled")
	If  intBtnNote=0 Then
		LogMessage "RSLT","Verification","Note button is enable as per expectation.",True
		bVerifyAddNote=true
	Else
		LogMessage "WARN","Verifiation","Note button is disable. Expected to be enable.",false
		bVerifyAddNote=false
	End If
	VerifybtnAddNote_enabled=bVerifyAddNote
End Function

'[Verify Button Add Notes is disabled]
Public Function VerifybtnAddNote_disabled()
	bDevPending=False
   Dim bVerifyAddNote:bVerifyAddNote=true
	intBtnNote=Instr(BlockCancelCards.btnAddNotes.GetROproperty("outerhtml"),"v-disabled")
	If not intBtnNote=0 Then
		LogMessage "RSLT","Verification","Note button is disabled as per expectation.",True
		bVerifyAddNote=true
	Else
		LogMessage "WARN","Verifiation","Note button is enable. Expected to be disabale.",false
		bVerifyAddNote=false
	End If
	VerifybtnAddNote_enabled=bVerifyAddNote
End Function

'[Perform Add Notes by clicking Add Notes Button on block Card page]
Public Function addNote(strNote)
   bDevPending=False
   bVerifypopupNotes=true
	Dim bVerifypopupNotes:VerifypopupNotes=true
	BlockCancelCards.btnAddNotes.click
	WaitForICallLoading
	If not isNull(strNote) Then
            If not   ServiceRequest.popupVerification.exist(5)Then
				LogMessage "WARN","Verification","New Note dialog did not displayed",false
				bVerifypopupNotes=false
			 else
			 strMessage=ServiceRequest.lblMaxAllowed.GetROProperty("innerText")
				If not strMessage="Max allowed - 3000" Then
					LogMessage "WARN","Verification","Add New Comment popup dislog incorrectly displayed max allowed character count for comment. Expected : Max allowed - 3000 and Actual: "&strMessage,false
					bVerifypopupNotes=false
				End If
			   ServiceRequest.txtNewComment.set strNote
			  
				   ServiceRequest.clickSave_Popup
			  WaitForIcallLoading
		   End If 
		End If 
	addNote=bVerifypopupNotes
End Function

'[Click Link Notes]
Public Function clickLinkNotes()
   bDevPending=true
   BlockCancelCards.lnkNotes.click
   If Err.Number<>0 Then
       clickLinkNotes=false
            LogMessage "WARN","Verification","Failed to Click Link : Notes" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickLinkNotes=true
End Function


'[Verify Textbox Comment displayed as]
Public Function verifyCommentTextBox(strComment)
   bDevPending=False
   bVerifyCommentText=true
   If Not IsNull(strComment) Then
       If Not VerifyField( BlockCancelCards.txtComment(), strComment, "Comment")Then
           bVerifyCommentText=false
       End If
   End If			
   verifyCommentTextBox=bVerifyCommentText
End Function


'[Set TextBox Comment to Block Card]
Public Function setCommentTextbox(strComment)
   bDevPending=False
   BlockCancelCards.txtComment.Set(strComment)
   If Err.Number<>0 Then
       setCommentTextbox=false
            LogMessage "WARN","Verification","Failed to Set Text Box :Comment" ,false
       Exit Function
   End If
   setCommentTextbox=true
End Function

'[Set TextBox Comment on Status Block Card popup to]
Public Function setCommentTextbox_Popup(strComment)
   bDevPending=False
   BlockCancelCards.txtComment_BlockCard.Set(strComment)
   If Err.Number<>0 Then
       setCommentTextbox=false
            LogMessage "WARN","Verification","Failed to Set Text Box :Comment" ,false
       Exit Function
   End If
   setCommentTextbox=true
End Function

'[Verify Button Submit on Block Cards Screen is enabled]
Public Function VerifybtnSubmit_BlockCard()
	bDevPending=False
   Dim bVerifyButtonSubmit:bVerifyButtonSubmit=true
	'intBtnSubmit=Instr(BlockCancelCards.btnSubmit.GetROproperty("outerhtml"),("v-disabled"))
	intBtnSubmit=Instr(BlockCancelCards.btnSubmit.Object.GetAttribute("disabled"),("disabled"))
	'intBtnSubmit=Instr(ServiceActivation.btnSubmit.Object.GetAttribute("disabled"),("disabled"))
	If  intBtnSubmit=0 Then
		LogMessage "RSLT","Verification","Submit button is enable as per expectation.",True
		bVerifyButtonSubmit=true
	Else
		LogMessage "WARN","Verifiation","Submit button is disable. Expected to be enable.",false
		bVerifyButtonSubmit=false
	End If
	VerifybtnSubmit_BlockCard=bVerifyButtonSubmit
End Function

'[Verify Button Submit on New SR Screen is disabled]
Public Function VerifybtnSubmit_NewSRPage()
	bDevPending=false
   Dim bVerifyButtonSubmit:bVerifyButtonSubmit=true
	intBtnSubmit=Instr(BlockCancelCards.btnSubmit_1.GetROproperty("outerhtml"),("v-disabled"))
	If not intBtnSubmit=0 Then
		LogMessage "RSLT","Verification","Submit button is disabled as per expectation.",True
		bVerifyButtonSubmit=true
	Else
		LogMessage "WARN","Verifiation","Submit button is Enabled. Expected to be disabled.",false
		bVerifyButtonSubmit=false
	End If
	VerifybtnSubmit_NewSRPage=bVerifyButtonSubmit
End Function

'[Verify Button Cancel on Block Cards Screen is enabled]
Public Function VerifyBtnCancel_CardList()
   bDevPending=false
	Dim bVerifyBtnCancel:bVerifyBtnCancel=true
	intBtnCancel=Instr(BlockCancelCards.btnCancel_TabBlockCard.GetROproperty("outerhtml"),("v-disabled"))
	If  intBtnCancel=0 Then
		LogMessage "RSLT","Verification","Cancel button is enable as per expectation.",True
		bVerifyBtnCancel=true
	Else
		LogMessage "WARN","Verifiation","Cancel button is disable. Expected to be enable.",false
		bVerifyBtnCancel=false
	End If
	VerifyBtnCancel_CardList=bVerifyBtnCancel
End Function

'[Verify Button Cancel on New SR Screen is enabled]
Public Function VerifyBtnCancel_NewSRPage()
   bDevPending=true
	Dim bVerifyBtnCancel:bVerifyBtnCancel=true
	intBtnCancel=Instr(BlockCancelCards.btnCancel_NewSR.GetROproperty("outerhtml"),("v-disabled"))
	If  intBtnCancel=0 Then
		LogMessage "RSLT","Verification","Cancel button is enable as per expectation.",True
		bVerifyBtnCancel=true
	Else
		LogMessage "WARN","Verifiation","Cancel button is disable. Expected to be enable.",false
		bVerifyBtnCancel=false
	End If
	VerifyBtnCancel_NewSRPage=bVerifyBtnCancel
End Function

'[Verify Button Cancel on New SR Screen is disabled]
Public Function VerifyBtnCancelDisabled_NewSRPage()
   bDevPending=true
	Dim bVerifyBtnCancel:bVerifyBtnCancel=true
	intBtnCancel=Instr(BlockCards.btnCancel_BlockCards.GetROproperty("outerhtml"),("v-disabled"))
	If  not intBtnCancel=0 Then
		LogMessage "RSLT","Verification","Cancel button is disabled as per expectation.",True
		bVerifyBtnCancel=true
	Else
		LogMessage "WARN","Verifiation","Cancel button is enabled. Expected to be disabled.",false
		bVerifyBtnCancel=false
	End If
	VerifyBtnCancelDisabled_NewSRPage=bVerifyBtnCancel
End Function

'[Click Button Submit]
Public Function clickButtonSubmit()
   bDevPending=False
   BlockCancelCards.btnSubmit.click
   If Err.Number<>0 Then
       clickButtonSubmit=false
            LogMessage "WARN","Verification","Failed to Click Button : Submit" ,false
       Exit Function
   End If
    '*************** Capturing time stamp to open Memo for this SR by Manish
	
	strRunTimeTimeStamp_Step="Click Button Submit"
	strDate="9 Apr 2014"
	strTempTime=FormatDateTime(now,4)	
 	strTimeStamp=strDate&" "&strTempTime
	insertDataStore "TimeStamp", strTimeStamp
   WaitForICallLoading
   clickButtonSubmit=true
End Function

'[Verify Tab Cancel Card displayed]
Public Function verifyTabCancelCardexist(strTabName)
   bDevPending=true
   verifyTabCancelCardexist=verifyTabExist(strTabName)
End Function

'[Select Tab Cancel Card]
Public Function setectTabCancelCard(strTabName)
   bDevPending=true
   setectTabCancelCard=selectTab(strTabName)
End Function

'[Close Tab Cancel Card]
Public Function closeTabCancelCard(strTabName)
   bDevPending=true
   closeTabCancelCard=closeTab(strTabName)
   WaitForICallLoading
End Function

'[Select Combobox Reason For Cancellation as]
Public Function selectReasonForCancellationComboBox(strReasonForCancellation)
   bDevPending=false
   bSelectReasonForCancellationComboBox=true
   if Not IsNull(strReasonForCancellation) Then
   	BlockCancelCards.lstReasonForCancellation.RefreshObject
       If Not (selectItem_Combobox (BlockCancelCards.lstReasonForCancellation(), strReasonForCancellation))Then
            LogMessage "WARN","Verification","Failed to select :"&strReasonForCancellation&" From ReasonForCancellation drop down list" ,false
           bSelectReasonForCancellationComboBox=false
       End If
   End If
   selectReasonForCancellationComboBox=bSelectReasonForCancellationComboBox
End Function

'[Get selected item from combo box Reason For Cancellation]
Public Function getReasonForCancellationSelectedItem()
   bDevPending=true
   getReasonForCancellationSelectedItem=getVadinCombo_SelectedItem(BlockCancelCards.lstReasonForCancellation)
End Function

'[Verify Combobox Reason For Cancellation displayed as]
Public Function verifyReasonForCancellationText(strCancellation)
   bDevPending=false
   bVerifyReasonForCancellationText=true
   If Not IsNull(strExpectedText) Then
       If Not verifyComboSelectItem (BlockCancelCards.lstReasonForCancellation(), strCancellation, "ReasonForCancellation")Then
           bVerifyReasonForCancellationText=false
       End If
   End If
   verifyReasonForCancellationText=bVerifyReasonForCancellationText
End Function

'[Get Memo Label Text]
Public Function getMemoText()
   bDevPending=true
   getMemoText=BlockCancelCards.txtMemo.GetRoProperty("innertext")
End Function

'[Verify Field Memo displayed as]
Public Function verifyMemoText(strExpectedText)
   bDevPending=true
   bVerifyMemoText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyField( BlockCancelCards.txtMemo(), strExpectedText, "Memo")Then
           bVerifyMemoText=false
       End If
   End If
   verifyMemoText=bVerifyMemoText
End Function

'[Set TextBox Memo to]
Public Function setMemoTextbox(strMemo)
   bDevPending=true
   BlockCancelCards.txtMemo.Set(strMemo)
   If Err.Number<>0 Then
       setMemoTextbox=false
            LogMessage "WARN","Verification","Failed to Set Text Box :Memo" ,false
       Exit Function
   End If
   setMemoTextbox=true
End Function

'[Verify Popup Request Submitted exist]
Public Function verifyPopupRequestSubmittedexist(bExist)
   bDevPending=false
   bActualExist=BlockCancelCards.popupRequestSubmitted.Exist(4)
   If bExist And  bActualExist  Then
       LogMessage "RSLT","Verification","Popup :RequestSubmitted Exists As Expected" ,true
       verifyPopupRequestSubmittedexist=True
   ElseIf not bExist And  not bActualExist  Then
       LogMessage "RSLT","Verification","Popup :RequestSubmitted does not Exists As Expected" ,true
       verifyPopupRequestSubmittedexist=True
   ElseIf bExist And  not bActualExist  Then
       LogMessage "WARN","Verification","Popup :RequestSubmitted does not Exists As Expected" ,False
       verifyPopupRequestSubmittedexist=False
   ElseIf not bExist And   bActualExist  Then
       LogMessage "WARN","Verification","Popup :RequestSubmitted Still Exists" ,False
       verifyPopupRequestSubmittedexist=False
   End If
End Function

'[Verify Popup Cancel Card exist]
Public Function verifyPopupCancelCardexist(bExist)
   bDevPending=true
   bActualExist=BlockCancelCards.popupCancelCard.Exist(1)
   If bExist And  bActualExist  Then
       LogMessage "RSLT","Verification","Popup :CancelCard Exists As Expected" ,true
       verifyPopupCancelCardexist=True
   ElseIf not bExist And  not bActualExist  Then
       LogMessage "RSLT","Verification","Popup :CancelCard does not Exists As Expected" ,true
       verifyPopupCancelCardexist=True
   ElseIf bExist And  not bActualExist  Then
       LogMessage "WARN","Verification","Popup :CancelCard does not Exists As Expected" ,False
       verifyPopupCancelCardexist=False
   ElseIf not bExist And   bActualExist  Then
       LogMessage "WARN","Verification","Popup :CancelCard Still Exists" ,False
       verifyPopupCancelCardexist=False
   End If
End Function

'[Get CardNumber on Request Submitted popup Label Text]
Public Function getCardNumber_RequestSubmittedText()
   '******DO NOT DELETE
   bDevPending=true
   getCardNumber_RequestSubmittedText=BlockCancelCards.lblCardNumber_RequestSubmitted.GetRoProperty("innertext")
End Function

'[Verify Field CardNumber on Request Submitted popup displayed as]
Public Function verifyCardNumber_RequestSubmittedText(strCardNumberRequestSubmitted)
   bDevPending=false
   bVerifyCardNumber_RequestSubmittedText=true
   If Not IsNull(strCardNumberRequestSubmitted) Then
       If Not VerifyInnerText (BlockCancelCards.lblCardNumber_RequestSubmitted(), strCardNumberRequestSubmitted, "CardNumber_RequestSubmitted")Then
           bVerifyCardNumber_RequestSubmittedText=false
       End If
   End If
   verifyCardNumber_RequestSubmittedText=bVerifyCardNumber_RequestSubmittedText
End Function

'[Verify Field CardNumber on Cancel popup displayed as]
Public Function verifyCardNumber_CancelText(strCardNumber_Cancel)
   bDevPending=true
   bverifyCardNumber_CancelText=true
   If Not IsNull(strCardNumber_Cancel) Then
       If Not VerifyInnerText (BlockCancelCards.lblCardNumber_RequestSubmitted(), strCardNumber_Cancel, "CardNumber_CancelPopup")Then
           bverifyCardNumber_CancelText=false
       End If
   End If
   verifyCardNumber_CancelText=bverifyCardNumber_CancelText
End Function

'[Get Product Description on RequestSubmitted popup Label Text]
Public Function getProductDescription_RequestSubmittedText()
	'******DO NOT DELETE
   bDevPending=true

   getProductDescription_RequestSubmittedText=BlockCancelCards.lblProductDescription_RequestSubmitted.GetRoProperty("innertext")
End Function

'[Verify Field Product Description on Request Submitted popup displayed as]
Public Function verifyProductDescription_RequestSubmittedText(strProductDescriptionRequestSubmitted)
   bDevPending=false
   bVerifyProductDescription_RequestSubmittedText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (BlockCancelCards.lblProductDescription_RequestSubmitted(), strProductDescriptionRequestSubmitted, "ProductDescription_RequestSubmitted")Then
           bVerifyProductDescription_RequestSubmittedText=false
       End If
   End If
   verifyProductDescription_RequestSubmittedText=bVerifyProductDescription_RequestSubmittedText
End Function

'[Verify Field Product Description on Cancel popup displayed as]
Public Function verifyProductDescription_CancelText(strDescription_Cancel)
   bDevPending=true
   bverifyProductDescription_CancelText=true
   If Not IsNull(strDescription_Cancel) Then
       If Not VerifyInnerText (BlockCancelCards.lblProductDescription_RequestSubmitted(), strDescription_Cancel, "ProductDescription_CancelPopup")Then
           bverifyProductDescription_CancelText=false
       End If
   End If
   verifyProductDescription_CancelText=bverifyProductDescription_CancelText
End Function

'[Verify Link SRNumber available on Request Submitted popup]
Public Function verifyLinkSRNumber_RequestSubmitted()
   bDevPending=False
   bverifyLinkSRNumber_RequestSubmitted=true
	strSelectedSR=BlockCancelCards.lnkSRNumber_RequestSubmitted.GetRoProperty("innerText")

	strCardDescription=getProductDescription_RequestSubmittedText()
	strCardNumber=getCardNumber_RequestSubmittedText()
	If strRunTimeDataStore_BlockedCardStep<>"" Then
		strRunTimeDataStore_BlockedCardStep="Verify Link SRNumber available on Request Submitted popup"
		strRunTimeDataStore_VarName= "SingleBlockedCard"
	End If
	 insertDataStore "SingleBlockedCard", ""&strCardNumber&":"&strCardDescription

	If instr(BlockCancelCards.lnkSRNumber_RequestSubmitted.GetRoProperty("class"),"link")=0 Then
		bverifyLinkSRNumber_RequestSubmitted=false
	else
		bverifyLinkSRNumber_RequestSubmitted=true
	end If
	LogMessage "RSLT","Verification","SR Number link "& strSRNumber &" displayed on Request Submitted popup",true
	If IsNull(strSRNumber) Then
		LogMessage "WARN","Verification", "SR Number not available with link on Request Submitted popup.",false
		bverifyLinkSRNumber_RequestSubmitted=false
	End If
	insertDataStore "SingleSRNumber", strSelectedSR
   verifyLinkSRNumber_RequestSubmitted=bverifyLinkSRNumber_RequestSubmitted
End Function

'[Verify Link SRNumber available on Cancel popup]
Public Function verifyLinkSRNumber_Cancel()
   bDevPending=true
   bverifyLinkSRNumber_Cancel=true
	strSelectedSR=BlockCancelCards.lnkSRNumber_RequestSubmitted.GetRoProperty("innerText")
	If instr(BlockCancelCards.lnkSRNumber_RequestSubmitted.GetRoProperty("class"),"LINK")=0 Then
		bverifyLinkSRNumber_Cancel=false
	else
		bverifyLinkSRNumber_Cancel=true
	end If
	LogMessage "RSLT","Verification","SR Number link "& strSRNumber &" displayed on Cancel popup",true
	If IsNull(strSRNumber) Then
		LogMessage "WARN","Verification", "SR Number not available with link on Cancel popup.",false
		bverifyLinkSRNumber_Cancel=false
	End If
		insertDataStore "SingleSRNumber", strSelectedSR
   verifyLinkSRNumber_Cancel=bverifyLinkSRNumber_Cancel
End Function

'[Click Link SRNumber on Request Submitted popup]
Public Function clickLinkSRNumber_RequestSubmitted()
   bDevPending=False
	strSelectedSR=BlockCancelCards.lnkSRNumber_RequestSubmitted.GetRoProperty("innerText")
	 insertDataStore "SelectedSRLink", strSelectedSR
   BlockCancelCards.lnkSRNumber_RequestSubmitted.click
   If Err.Number<>0 Then
       clickLinkSRNumber_RequestSubmitted=false
            LogMessage "WARN","Verification","Failed to Click Link : SRNumber_RequestSubmitted" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickLinkSRNumber_RequestSubmitted=true
End Function

'[Click Link SRNumber on Cancel popup]
Public Function clickLinkSRNumber_Cancel()
   bDevPending=true
	strSelectedSR=BlockCancelCards.lnkSRNumber_RequestSubmitted.GetRoProperty("innerText")
	 insertDataStore "SelectedSRLink", strSelectedSR
   BlockCancelCards.lnkSRNumber_RequestSubmitted.click
   If Err.Number<>0 Then
       clickLinkSRNumber_RequestSubmitted=false
            LogMessage "WARN","Verification","Failed to Click Link : SRNumber_Cancel" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickLinkSRNumber_Cancel=true
End Function

'[Get Status on Request Submitted popup Label Text]
Public Function getStatus_RequestSubmittedText()
   bDevPending=true
   getStatus_RequestSubmittedText=BlockCancelCards.lblStatus_RequestSubmitted.GetRoProperty("innertext")
End Function

'[Verify Field Status on Request Submitted popup displayed as]
Public Function verifyStatus_RequestSubmittedText(strStatus)
   bDevPending=false
   bVerifyStatus_RequestSubmittedText=true
   If Not IsNull(strStatus) Then
       If Not VerifyInnerText (BlockCancelCards.lblStatus_RequestSubmitted(), strStatus, "Status_RequestSubmitted")Then
           bVerifyStatus_RequestSubmittedText=false
       End If
   End If
   verifyStatus_RequestSubmittedText=bVerifyStatus_RequestSubmittedText
End Function

'[Verify Field Replacement Required on Request Submitted popup displayed as]
Public Function verifyReplacementRequired_RequestSubmittedText(strReplacementRequired)
   bDevPending=false
   bVerifyStatus_RequestSubmittedText=true
   If Not IsNull(strReplacementRequired) Then
       If Not VerifyInnerText (BlockCancelCards.lblReplacementRequired_RequestSubmitted(), strReplacementRequired, "ReplacementRequired_RequestSubmitted")Then
           bVerifyStatus_RequestSubmittedText=false
       End If
   End If
   verifyReplacementRequired_RequestSubmittedText=bVerifyStatus_RequestSubmittedText
End Function

'[Verify Field Status on Cancel popup displayed as]
Public Function verifyStatus_CancelText(strStatus_Cancel)
   bDevPending=true
   bverifyStatus_CancelText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (BlockCancelCards.lblStatus_RequestSubmitted(), strStatus_Cancel, "Status_CancelPopup")Then
           bverifyStatus_CancelText=false
       End If
   End If
   verifyStatus_CancelText=bverifyStatus_CancelText
End Function

'[Verify Table Request Submitted displayed]
Public Function verifyRequestSubmittedTabledisplayed()
   bDevPending=true
   verifyRequestSubmitteddisplayed= BlockCancelCards.tblRequestSubmittedHeader.Exist(1)
End Function

'[Verify Table Request Submitted displayed on Tab]
Public Function verifyRequestSubmittedTabledisplayedTab()
   bDevPending=true
   verifyRequestSubmitteddisplayed= BlockCancelCards.tblRequestSubmittedHeader_Tab.Exist(1)
End Function

'[Verify Table Request Submitted has following Columns]
Public Function verifyRequestSubmittedTableColumns(arrColumnNameList)
   bDevPending=False
   verifyRequestSubmittedTableColumns=verifyTableColumns(BlockCancelCards.tblRequestSubmittedHeader,arrColumnNameList)
End Function

'[Verify Table Request Submitted has following Columns on Tab]
Public Function verifyRequestSubmittedTableColumnsTab(arrColumnNameList)
   bDevPending=False
   verifyRequestSubmittedTableColumnsTab=verifyTableColumns(BlockCancelCards.tblRequestSubmittedHeader_Tab,arrColumnNameList)
End Function

'[Verify row Data in Table Request Submitted]
Public Function verifytblRequestSubmitted_RowData(lstlstRequestSubmitted)
   bDevPending=False
   verifytblRequestSubmitted_RowData=verifyTableContentList(BlockCancelCards.tblRequestSubmittedHeader,BlockCancelCards.tblRequestSubmittedContent,lstlstRequestSubmitted,"Request Submitted" , false,null ,null,null)
End Function

'[Verify row Data in Table Request Submitted on Request Submitted Tab]
Public Function verifytblRequestSubmitted_RowDataTab(lstlstRequestSubmitted)
   bDevPending=False
   verifytblRequestSubmitted_RowDataTab=verifyTableContentList(BlockCancelCards.tblRequestSubmittedHeader_Tab,BlockCancelCards.tblRequestSubmittedContent_Tab,lstlstRequestSubmitted,"Request Submitted" , false,null ,null,null)
End Function

'[Click on row Data in Table Request Submitted on Request Submitted Tab]
Public Function clicktblRequestSubmitted_RowDataTab(lstRequestSubmitted)
   bDevPending=False
   clicktblRequestSubmitted_RowDataTab=selectTableLink(BlockCancelCards.tblRequestSubmittedHeader_Tab,BlockCancelCards.tblRequestSubmittedContent_Tab,lstRequestSubmitted,"Request Submitted" ,"Replace Card",False,NULL,NULL,NULL)
End Function

'[Verify row Data in Table Cancel Card]
Public Function verifytblCancelCard_RowData(lstlstRequestSubmitted)
   bDevPending=true
   verifytblRequestSubmitted_RowData=verifyTableContentList(BlockCancelCards.tblRequestSubmittedHeader,BlockCancelCards.tblRequestSubmittedContent,lstlstRequestSubmitted,"Request Submitted" , false,null ,null,null)
End Function

'[Verify SR Number Column values in Table Request Submitted displayed as Link]
Public Function verifySRNumberLink_tblRequestSubmitted()
	  bDevPending=false
	iRowCount=BlockCancelCards.tblRequestSubmittedContent.RowCount
	Dim strCardNumber,strSRNumber,strForDataStore
	strCardNumber=""
	strSRNumber=""
	strForDataStore=""
	For iCount=1 to iRowCount
		strCardNumber=getCellTextFor (BlockCancelCards.tblRequestSubmittedHeader,BlockCancelCards.tblRequestSubmittedContent,iCount,"Card Number")
		strSRNumber=getCellTextFor (BlockCancelCards.tblRequestSubmittedHeader,BlockCancelCards.tblRequestSubmittedContent,iCount,"SR Number")
		strProductDescription=getCellTextFor (BlockCancelCards.tblRequestSubmittedHeader,BlockCancelCards.tblRequestSubmittedContent,iCount,"Product Description")
		strStatus=getCellTextFor (BlockCancelCards.tblRequestSubmittedHeader,BlockCancelCards.tblRequestSubmittedContent,iCount,"Status")
		If strCardNumber<>""  Then
			strForDataStore=strForDataStore & "(Card Number:"&strCardNumber&"|SR Nmuber:"&strSRNumber&"|Product Description:"&strProductDescription&"|Status:"&strStatus&")|"
			 insertDataStore "MultipleBlockedCardsSRNumber-"&strCardNumber, strSRNumber
			 If strRunTimeDataStore_BlockedCardStep<>"" Then
				strRunTimeDataStore_BlockedCardStep="Verify SR Number Column values in Table Request Submitted displayed as Link"
				strRunTimeDataStore_VarName="MultipleBlockedCardsSRNumber"
			End If
			bLink=verifyTableCellHasLink (BlockCancelCards.tblRequestSubmittedHeader,BlockCancelCards.tblRequestSubmittedContent,"Request Submitted","SR Number",iCount)
			If not bLink Then
				verifySRNumberLink_tblRequestSubmitted=false
			End If
		End If

	Next
	 insertDataStore "AllBlockedCardsDetails", strForDataStore '
	 	verifySRNumberLink_tblRequestSubmitted=true
End Function

'[Verify SR Number Column values in Table Request Submitted Tab displayed as Link]
Public Function verifySRNumberLink_tblRequestSubmittedTab()
	  bDevPending=false
	iRowCount=BlockCancelCards.tblRequestSubmittedContent_Tab.RowCount
	Dim strCardNumber,strSRNumber,strForDataStore
	strCardNumber=""
	strSRNumber=""
	strForDataStore=""
	For iCount=1 to iRowCount
		strCardNumber=getCellTextFor (BlockCancelCards.tblRequestSubmittedHeader_Tab,BlockCancelCards.tblRequestSubmittedContent_Tab,iCount,"Account/Card No.")
		strSRNumber=getCellTextFor (BlockCancelCards.tblRequestSubmittedHeader_Tab,BlockCancelCards.tblRequestSubmittedContent_Tab,iCount,"SR Number")
		strProductDescription=getCellTextFor (BlockCancelCards.tblRequestSubmittedHeader_Tab,BlockCancelCards.tblRequestSubmittedContent_Tab,iCount,"Product Description")
		strStatus=getCellTextFor (BlockCancelCards.tblRequestSubmittedHeader_Tab,BlockCancelCards.tblRequestSubmittedContent_Tab,iCount,"Status")
		If strCardNumber<>""  Then
			strForDataStore=strForDataStore & "(Card Number:"&strCardNumber&"|SR Nmuber:"&strSRNumber&"|Product Description:"&strProductDescription&"|Status:"&strStatus&")|"
			 insertDataStore "MultipleBlockedCardsSRNumber-"&strCardNumber, strSRNumber
			 If strRunTimeDataStore_BlockedCardStep<>"" Then
				strRunTimeDataStore_BlockedCardStep="Verify SR Number Column values in Table Request Submitted Tab displayed as Link"
				strRunTimeDataStore_VarName="MultipleBlockedCardsSRNumber"
			End If
			bLink=verifyTableCellHasLink (BlockCancelCards.tblRequestSubmittedHeader_Tab,BlockCancelCards.tblRequestSubmittedContent_Tab,"Request Submitted","SR Number",iCount)
			If not bLink Then
				verifySRNumberLink_tblRequestSubmittedTab=false
			End If
		End If
 
	Next
	 insertDataStore "AllBlockedCardsDetails", strForDataStore '
	 	verifySRNumberLink_tblRequestSubmittedTab=true
End Function

'[Click SR Number link in Table Request Submitted]
Public Function clickRequestSubmitted_link(lstRequestSubmitted)
   bDevPending=false
      bClicked=selectTableLink_getText(BlockCancelCards.tblRequestSubmittedHeader,BlockCancelCards.tblRequestSubmittedContent,lstRequestSubmitted,"RequestSubmitted" ,"SR Number",false,null ,null,null,strLinkClicked)
	 insertDataStore "SelectedSR", strLinkClicked
	 WaitForICallLoading
	clickRequestSubmitted_link=bClicked
End Function

'[Click SR Number link in Table Request Submitted Tab]
Public Function clickRequestSubmitted_linkTab(lstRequestSubmitted)
   bDevPending=false
      bClicked=selectTableLink_getText(BlockCancelCards.tblRequestSubmittedHeader_Tab,BlockCancelCards.tblRequestSubmittedContent_Tab,lstRequestSubmitted,"RequestSubmitted" ,"SR Number",false,null ,null,null,strLinkClicked)
	 insertDataStore "SelectedSR", strLinkClicked
	 WaitForICallLoading
	clickRequestSubmitted_linkTab=bClicked
End Function

'[Verify Status Column values in Table Request Submitted displayed as Link]
Public Function verifyStatusLink_tblRequestSubmitted()
	  bDevPending=true
	iRowCount=BlockCancelCards.tblRequestSubmittedContent.RowCount
	Dim strCardNumber,strSRNumber,strForDataStore
	strCardNumber=""
	strSRNumber=""
	strForDataStore=""
	For iCount=0 to iRowCount
		strCardNumber=getCellTextFor (BlockCancelCards.tblRequestSubmittedHeader,BlockCancelCards.tblRequestSubmittedContent,iCount,"Card Number")
		strSRNumber=getCellTextFor (BlockCancelCards.tblRequestSubmittedHeader,BlockCancelCards.tblRequestSubmittedContent,iCount,"SRNumber")
		If strCardNumber<>""  Then
        bLink=verifyTableCellHasLink (BlockCancelCards.tblRequestSubmittedHeader,BlockCancelCards.tblRequestSubmittedContent,"Request Submitted","Status",intRow)
			If not bLink Then
				verifyStatusLink_tblRequestSubmitted=false
			End If
		End If

	Next
     verifyStatusLink_tblRequestSubmitted=true
End Function

'[Click Failed link in Status Column of Table Request Submitted]
Public Function clickRequestSubmitted_StatusFailedlink(lstRequestSubmitted)
   bDevPending=true
      bClicked=selectTableLink_getText(BlockCancelCards.tblRequestSubmittedHeader,BlockCancelCards.tblRequestSubmittedContent,lstRequestSubmitted,"RequestSubmitted" ,"Status",bPagination,BlockCancelCards.lnkNext ,BlockCancelCards.lnkNext1 ,BlockCancelCards.lnkPrevious,strLinkClicked)
	  WaitForICallLoading
     	clickRequestSubmitted_StatusFailedlink=bClicked
End Function

'[Verify Button Refresh Status is enabled]
Public Function VerifyButtonRefreshStatusEnabled()
   bDevPending=false
   Dim bVerifyButtonRefreshStatusEnabled:bVerifyButtonRefreshStatusEnabled=true
	intBtnRefreshStatus=Instr(BlockCancelCards.btnRefreshStatus.GetROproperty("outerhtml"),"v-disabled")
	If  intBtnRefreshStatus=0 Then
		LogMessage "RSLT","Verification","Refresh Status button is enable as per expectation.",True
		bVerifyButtonRefreshStatusEnabled=true
	Else
		LogMessage "WARN","Verifiation","Refresh Status button is disable. Expected to be enable.",false
		bVerifyButtonRefreshStatusEnabled=false
	End If
	VerifyButtonRefreshStatusEnabled=bVerifyButtonRefreshStatusEnabled
End Function

'[Verify Button OK on Request Submitted is enabled]
Public Function verifybuttonOK()
   bDevPending=false
	Dim bverifybuttonOK:bverifybuttonOK=true
	intBtnOK=Instr(BlockCancelCards.btnClose_RequestSubmitted.GetROproperty("outerhtml"),"v-disabled")
	If  intBtnOK=0 Then
		LogMessage "RSLT","Verification","OK button is enable as per expectation.",True
		bverifybuttonOK=true
	Else
		LogMessage "WARN","Verifiation","OK button is disable. Expected to be enable.",false
		bverifybuttonOK=false
	End If
	verifybuttonOK=bverifybuttonOK
End Function

'[Verify Button Close on Request Submitted is enabled]
Public Function verifybuttonClose()
   bDevPending=false
	Dim bverifybuttonClose:bverifybuttonClose=true
	intBtnOK=Instr(BlockCancelCards.btnClose_RequestSubmitted.GetROproperty("outerhtml"),"v-disabled")
	If  intBtnOK=0 Then
		LogMessage "RSLT","Verification","Close button is enable as per expectation.",True
		bverifybuttonClose=true
	Else
		LogMessage "WARN","Verifiation","Close button is disable. Expected to be enable.",false
		bverifybuttonClose=false
	End If
	verifybuttonClose=bverifybuttonClose
End Function

'[Click Button Refresh Status]
Public Function clickButtonRefreshStatus()
   bDevPending=False
   BlockCancelCards.btnRefreshStatus.click
	WaitForICallLoading
	bTable=BlockCancelCards.tblRequestSubmittedHeader.Exist(1)
	If bTable Then
		'Get Status for  all table cell that has 'In Progress'
		intRow=	getRowForColumns (BlockCancelCards.tblRequestSubmittedHeader,BlockCancelCards.tblRequestSubmittedContent,Array("Status"), Array("In Progress"))
		If intRow=-1 Then
			bStatus=False
		else
			bStatus=true
		End If
	else
		'Get Status
		If BlockCancelCards.lblStatus_RequestSubmitted.getROProperty("innertext")="In Progress" then 
			bStatus=true
		 else
			bStatus=false
		End If
		
	End If
	While  bStatus OR (iCount=60)
		BlockCancelCards.btnRefreshStatus.click
		wait 1
		If bTable Then
			'Get Status for  all table cell that has 'In Progress'
			intRow=	getRowForColumns (BlockCancelCards.tblRequestSubmittedHeader,BlockCancelCards.tblRequestSubmittedContent,Array("Status"), Array("In Progress"))
			If intRow=-1 Then
				bStatus=False
			else
				bStatus=True
			End If
		else
			'Get Status
			If BlockCancelCards.lblStatus_RequestSubmitted.getROProperty("innertext")="In Progress" then 
				bStatus=true
			 else
				bStatus=false
			End If
		
		End If
		wait 5
		intBtnRefreshStatus=Instr(BlockCancelCards.btnRefreshStatus.GetROproperty("outerhtml"),"v-disabled")
		If intBtnRefreshStatus<>0 Then
			LogMessage "WARN","Verification","Button : RefreshStatus is disabled" ,true
			bStatust=true
		End If
		iCount=iCount+1
	  Wend	

   If Err.Number<>0 Then
       clickButtonRefreshStatus=false
            LogMessage "WARN","Verification","Failed to Click Button : RefreshStatus" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickButtonRefreshStatus=true
End Function


'[Click Button Refresh Status on Request Submitted Tab]
Public Function clickButtonRefreshStatusonTab()
   bDevPending=False
   BlockCancelCards.btnRefreshCard.click
	WaitForICallLoading
	bTable=BlockCancelCards.tblRequestSubmittedHeader_Tab.Exist(1)
	If bTable Then
		'Get Status for  all table cell that has 'In Progress'
		intRow=	getRowForColumns (BlockCancelCards.tblRequestSubmittedHeader_Tab,BlockCancelCards.tblRequestSubmittedContent_Tab,Array("Status"), Array("In Progress"))
		If intRow=-1 Then
			bStatus=False
		else
			bStatus=true
		End If
	else
		'Get Status
		If BlockCancelCards.lblStatus_RequestSubmitted.getROProperty("innertext")="In Progress" then 
			bStatus=true
		 else
			bStatus=false
		End If
		
	End If
	While  bStatus OR (iCount=60)
		BlockCancelCards.btnRefreshCard.click
		wait 1
		If bTable Then
			'Get Status for  all table cell that has 'In Progress'
			intRow=	getRowForColumns (BlockCancelCards.tblRequestSubmittedHeader_Tab,BlockCancelCards.tblRequestSubmittedContent_Tab,Array("Status"), Array("In Progress"))
			If intRow=-1 Then
				bStatus=False
			else
				bStatus=True
			End If
		else
			'Get Status
			If BlockCancelCards.lblStatus_RequestSubmitted.getROProperty("innertext")="In Progress" then 
				bStatus=true
			 else
				bStatus=false
			End If
		
		End If
		wait 5
		intBtnRefreshStatus=Instr(BlockCancelCards.btnRefreshCard.GetROproperty("outerhtml"),"v-disabled")
		If intBtnRefreshStatus<>0 Then
			LogMessage "WARN","Verification","Button : RefreshStatus is disabled" ,true
			bStatust=true
		End If
		iCount=iCount+1
	  Wend	

   If Err.Number<>0 Then
       clickButtonRefreshStatusonTab=false
            LogMessage "WARN","Verification","Failed to Click Button : RefreshStatus" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickButtonRefreshStatusonTab=true
End Function

'[Click Replace Card link in Table Request Submitted Tab]
Public Function clickRequestSubmitted_ReplaceCard(lstRequestSubmitted)
   bDevPending=false
      bClicked=selectTableLink_getText(BlockCancelCards.tblRequestSubmittedHeader_Tab,BlockCancelCards.tblRequestSubmittedContent_Tab,lstRequestSubmitted,"RequestSubmitted" ,"Replace Card",false,null ,null,null,strLinkClicked)
	  WaitForICallLoading
	clickRequestSubmitted_ReplaceCard=bClicked
End Function

'[Click Button Close on Request Submitted popup]
Public Function clickButtonClose_RequestSubmitted()
   bDevPending=false
   Wait 1
   BlockCancelCards.btnClose_RequestSubmitted.click
   If Err.Number<>0 Then
       clickButtonClose_RequestSubmitted=false
            LogMessage "WARN","Verification","Failed to Click Button : Close_RequestSubmitted" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickButtonClose_RequestSubmitted=true
End Function

'[Click Button Close on Request Submitted Tab for Block Cards]
Public Function clickButtonClose_RequestSubmittedTab()
   bDevPending=false
   BlockCancelCards.btnClose_RequestSubmittedTab.click
   If Err.Number<>0 Then
       clickButtonClose_RequestSubmittedTab=false
            LogMessage "WARN","Verification","Failed to Click Button : Close_RequestSubmitted" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickButtonClose_RequestSubmittedTab=true
End Function

'[Click Button OK on Cancel popup]
Public Function clickButtonOK_Cancel()
   bDevPending=true
   BlockCancelCards.btnOK_Cancel.click
   If Err.Number<>0 Then
       clickButtonOK_Cancel=false
            LogMessage "WARN","Verification","Failed to Click Button : OK_Cancel" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickButtonOK_Cancel=true
End Function

'[Verify button Refresh Status is disabled]
Public Function VerifybuttonRefreshstatusDisabled()
   bDevPending=false
   Dim bVerifybuttonRefreshstatus:bVerifybuttonRefreshstatus=true
	intBtnRefreshStatus=Instr(BlockCancelCards.btnRefreshStatus.GetROproperty("outerhtml"),"v-disabled")
	If  not intBtnRefreshStatus=0 Then
		LogMessage "RSLT","Verification","Refresh Status button is disabled as per expectation.",True
		bVerifybuttonRefreshstatus=true
	Else
		LogMessage "WARN","Verifiation","Refresh Status button is enable. Expected to be disable.",false
		bVerifybuttonRefreshstatus=false
	End If
	VerifybuttonRefreshstatusDisabled=bVerifybuttonRefreshstatus
End Function

'[Verify Button Report Lost/Stolen is enabled]
Public Function verifybuttonReportLostStolen()
   bDevPending=false
	Dim bverifybuttonReportLostStolen:bverifybuttonReportLostStolen=true
	intBtnOK=Instr(BlockCancelCards.btnReportLostStolenCard.GetROproperty("outerhtml"),"v-disabled")
	If intBtnOK=0 Then
		LogMessage "RSLT","Verification","Report Lost/Stolen button is enable as per expectation.",True
		bverifybuttonReportLostStolen=true
	Else
		LogMessage "WARN","Verifiation","Report Lost/Stolen button is disable. Expected to be enable.",false
		bverifybuttonReportLostStolen=false
	End If
	verifybuttonReportLostStolen=bverifybuttonReportLostStolen
End Function

'[Click Button Report Lost/Stolen]
Public Function clickButtonReportLostStolen()
   bDevPending=False
   BlockCancelCards.btnReportLostStolenCard.click
   If Err.Number<>0 Then
       clickButtonReportLostStolen=false
        LogMessage "WARN","Verification","Failed to Click Button : ReportLostStolen" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickButtonReportLostStolen=true
End Function

'[Verify Tab CardList displayed]
Public Function verifyTabCardListexist()
   bDevPending=false
   verifyTabCardListexist=verifyTabExist("Card List")
End Function

'[Select Tab CardList]
Public Function setectTabCardList(strTabName)
   bDevPending=false
   setectTabCardList=selectTab(strTabName)
End Function

'[Close Tab CardList]
Public Function closeTabCardList(strTabName)
   bDevPending=false
   closeTabCardList=closeTab(strTabName)
End Function

'[Verify Combobox Reason For Blocking on CardList Screen as]
Public Function verifyReasonForBlockingTextCardList(strReason_CardList)
   bDevPending=false
   bVerifyReasonForBlockingText=true
   If Not IsNull(strReason_CardList) Then
       If Not verifyComboSelectItem (BlockCancelCards.lstReasonForBlocking_CardList(), strReason_CardList, "ReasonForBlocking")Then
           bVerifyReasonForBlockingText=false
       End If
   End If
   verifyReasonForBlockingTextCardList=bVerifyReasonForBlockingText
End Function

'[Select Combobox Reason For Blocking on CardList Screen as]
Public Function selectReasonForBlocking_CardListComboBox(strReasonForBlocking_CardList)
   bDevPending=false
   bSelectReasonForBlocking_CardListComboBox=true
   If Not IsNull(strReasonForBlocking_CardList) Then
       If Not (selectItem_Combobox (BlockCancelCards.lstReasonForBlocking_CardList(), strReasonForBlocking_CardList))Then
            LogMessage "WARN","Verification","Failed to select :"&strControlName&" From ReasonForBlocking_CardList drop down list" ,false
           bSelectReasonForBlocking_CardListComboBox=false
       End If
   End If
   WaitForICallLoading
   selectReasonForBlocking_CardListComboBox=bSelectReasonForBlocking_CardListComboBox
End Function

'[Get selected item from combo box Reason For Blocking on CardList Screen]
Public Function getReasonForBlocking_CardListSelectedItem()
   bDevPending=true
   getReasonForBlocking_CardListSelectedItem=getVadinCombo_SelectedItem(BlockCancelCards.lstReasonForBlocking_CardList)
End Function

'[Verify Combobox Reason For Blocking on CardList Screen displayed as]
Public Function verifyReasonForBlocking_CardList(strExpectedText)
   bDevPending=false
   bVerifyReasonForBlocking_CardListText=true
   If Not IsNull(strExpectedText) Then
       If Not verifyComboSelectItem (BlockCancelCards.lstReasonForBlocking_CardList(), strExpectedText, "ReasonForBlocking_CardList")Then
           bVerifyReasonForBlocking_CardListText=false
       End If
   End If
   verifyReasonForBlocking_CardList=bVerifyReasonForBlocking_CardListText
End Function

'[Verify Table Cards To Be Blocked displayed]
Public Function verifyCardsToBeBlockedTabledisplayed()
   bDevPending=false   
   verifyCardsToBeBlockedTabledisplayed=BlockCancelCards.tblCardsToBeBlockedHeader().Exist(2)
End Function

'[Verify Table Cards To Be Blocked has following Columns]
Public Function verifyCardsToBeBlockedTableColumns(arrColumnNameList)
   bDevPending=False
   verifyCardsToBeBlockedTableColumns=verifyTableColumns(BlockCancelCards.tblCardsToBeBlockedHeader,arrColumnNameList)
End Function

'[Verify row Data in Table Cards To Be Blocked]
Public Function verifytblCardsToBeBlocked_RowData(lstlstCardsToBeBlocked)
   bDevPending=false
   verifytblCardsToBeBlocked_RowData=verifyTableContentList(BlockCancelCards.tblCardsToBeBlockedHeader,BlockCancelCards.tblCardsToBeBlockedContent,lstlstCardsToBeBlocked,"CardsToBeBlocked" , false,null ,null,null)
End Function

'[Select Check box for Single Card to block from Table Cards To Be Blocked]
Public Function selectCheckBoxForSingleCardToBlock(lstCardToBlocked)
   'This Function Selects Single Card
   bDevPending=False
   selectCheckBoxForSingleCardToBlock=selectTableCheckBox(BlockCancelCards.tblCardsToBeBlockedHeader,BlockCancelCards.tblCardsToBeBlockedContent,lstCardToBlocked,"CardsToBeBlocked" ,"", false,null ,null,null)
End Function

'[Select Check box for Cards to block from Table Cards To Be Blocked]
Public Function selectCheckBoxForCardsToBlock(lstlstCardsToBeBlocked)
   'This Function Selects multiple cards Card
   bDevPending=False
   Dim strCardNumber:strCardNumber=""
   For iCount=0 to Ubound(lstlstCardsToBeBlocked,1)
		strTempCardNumber=Split(lstlstCardsToBeBlocked(iCount,0),":")(1)
		If iCount=0 Then
			strCardNumber=strTempCardNumber
		else
			strCardNumber=strCardNumber&"|"&strTempCardNumber
		End If
   Next
    insertDataStore "SelectedCardsForBlocking", strCardNumber
   selectCheckBoxForCardsToBlock=selectTableCheckBox_MultipleRow(BlockCancelCards.tblCardsToBeBlockedHeader,BlockCancelCards.tblCardsToBeBlockedContent,lstlstCardsToBeBlocked,"CardsToBeBlocked" ,"", false,null ,null,null)
End Function

'[UnCheck Check box for Cards Replacement Required from Table Cards To Be Blocked]
Public Function unCheckBoxForCardsToBlock(lstlstCardsToBeBlocked)
   'This Function Selects multiple cards Card
   bDevPending=False
   Dim strCardNumber:strCardNumber=""
   For iCount=0 to Ubound(lstlstCardsToBeBlocked,1)
		strTempCardNumber=Split(lstlstCardsToBeBlocked(iCount,0),":")(1)
		If iCount=0 Then
			strCardNumber=strTempCardNumber
		else
			strCardNumber=strCardNumber&"|"&strTempCardNumber
		End If
   Next
    unCheckBoxForCardsToBlock=selectTableCheckBox_MultipleRow(BlockCancelCards.tblCardsToBeBlockedHeader,BlockCancelCards.tblCardsToBeBlockedContent,lstlstCardsToBeBlocked,"CardsToBeBlocked" ,"Replacement Required", false,null ,null,null)
End Function

'[Verify Status Check box for Cards to block from Table Cards To Be Blocked]
Public Function verifyCheckBoxForCards_Enabled(lstCardToBlocked,strStatus)
   'This Function Selects multiple cards Card
   'bDevPending=false
 'lstCardToBlocked=Array("Card Number:"&strCardNumber)
   bverifyCheckBoxForCards_Enabled = true
   strActualStatus=verifyCheckBoxEnabled_tblCell(BlockCancelCards.tblCardsToBeBlockedHeader,BlockCancelCards.tblCardsToBeBlockedContent,lstCardToBlocked,"CardsToBeBlocked","",false,null,null,null)
  If UCase(strStatus)=Ucase(strActualStatus) Then
	LogMessage "RSLT","Verification","Expected Status for Check box Matched with Actual Status for Card Number : "&strCardNumber ,true
	bStatus=true
  else
	LogMessage "RSLT","Verification","Expected Status "&strStatus&" for Check box not Matched with Actual Status "&strActualStatus&" for Card Number : "&strCardNumber ,false
	bStatus=false
  End If
  verifyCheckBoxForCards_Enabled=bverifyCheckBoxForCards_Enabled
End Function
 
'[Verify Table Card To be Blocked Has Check Box]
Public Function VerifyTableCardToBeBlockedHasCheckBox(lstlstCardToBeBlocked)
   bDevPending=false
	
	For iRowCount=0 to Ubound(lstlstCardToBeBlocked,1)
		intSize=Ubound(lstlstCardToBeBlocked,2)
        ReDim arrColumns(intSize)
		ReDim arrValues(intSize)

		For iCount=0 to intSize
			arrTemp=Split(lstlstCardToBeBlocked(iRowCount,iCount),":")
			arrColumns(iCount)=arrTemp(0)
			arrValues(iCount)=checkNull(arrTemp(1))
		Next	
	   
		Dim intRow
        intRow=getRowForColumns (BlockCancelCards.tblCardsToBeBlockedHeader,BlockCancelCards.tblCardsToBeBlockedContent,arrColumns, arrValues)

	Next
   VerifyTableCardToBeBlockedHasCheckBox=verifyTableCellHasCheckBox(BlockCancelCards.tblCardsToBeBlockedHeader,BlockCancelCards.tblCardsToBeBlockedContent,"CardsToBeBlocked","",intRow)
   
End Function


'[Verify Button BlockCard on CardList Screen is enabled]
Public Function verifyButtonBlockCards_CardList_Enabled()
   bDevPending=false
   Dim bBLOCKCARDSbutton:bBLOCKCARDSbutton=true
	intBlockCard=Instr(BlockCancelCards.btnBlockCard_CardList.GetROproperty("outerhtml"),("v-disabled"))
	If  intBlockCard=0 Then
		LogMessage "RSLT","Verification","Block card button is enable as per expectation.",True
		bBLOCKCARDSbutton=true
	Else
		LogMessage "WARN","Verifiation","Block card button is disable. Expected to be enable.",false
		bBLOCKCARDSbutton=false
	End If
   verifyButtonBlockCards_CardList_Enabled=bBLOCKCARDSbutton	
End Function

'[Click Button BlockCard on CardList Screen]
Public Function clickButtonBlockCard_CardList()
   bDevPending=false
   Wait 1
   BlockCancelCards.btnBlockCard_CardList.click
   If Err.Number<>0 Then
       clickButtonBlockCard_CardList=false
            LogMessage "WARN","Verification","Failed to Click Button : BlockCard_CardList" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickButtonBlockCard_CardList=true
End Function

'[Verify Popup Confirmation:Block Cards exist]
Public Function verifyPopupConfirmationBlockCardsexist(bExist)
   bDevPending=false
   bActualExist=BlockCancelCards.popupConfirmationBlockCards.Exist(2)
   If bExist And  bActualExist  Then
       LogMessage "RSLT","Verification","Popup :ConfirmationBlockCards Exists As Expected" ,true
       verifyPopupConfirmationBlockCardsexist=True
   ElseIf not bExist And  not bActualExist  Then
	    LogMessage "RSLT","Verification","Popup :ConfirmationBlockCards does not Exists As Expected" ,true
       verifyPopupConfirmationBlockCardsexist=True
  ElseIf bExist And  not bActualExist  Then
	    LogMessage "WARN","Verification","Popup :ConfirmationBlockCards does not Exists As Expected" ,False
       verifyPopupConfirmationBlockCardsexist=False
   ElseIf not bExist And   bActualExist  Then
        LogMessage "WARN","Verification","Popup :ConfirmationBlockCards Still Exists" ,False
		'clickButtonOK_ConfirmationBlockCards() 'Click Ok if pop up still exists
       verifyPopupConfirmationBlockCardsexist=False
   End If
End Function

'[Verify Field Question on Confirmation:Block Cards popup displayed as Are you sure you want to block the following cards?]
Public Function verifyQuestion_ConfirmationBlockCardsText()
   bDevPending=False
   bVerifyQuestion_ConfirmationBlockCardsText=true
          If Not VerifyInnerText (BlockCancelCards.lblQuestion_ConfirmationBlockCards(), "Are you sure you want to block the following card(s)?", "Confirmation Block Cards")Then
           bVerifyQuestion_ConfirmationBlockCardsText=false
       End If
      verifyQuestion_ConfirmationBlockCardsText=bVerifyQuestion_ConfirmationBlockCardsText
End Function

'[Verify Table Confirmation:Block Cards displayed]
Public Function verifyConfirmationBlockCardsTabledisplayed()
   bDevPending=False
   verifyConfirmationBlockCardsTabledisplayed= BlockCancelCards.tblConfirmationBlockCardsHeader.Exist(1)
End Function

'[Verify Table Confirmation:Block Cards has following Columns]
Public Function verifyConfirmationBlockCardsTableColumns(arrColumnNameList)
   bDevPending=False
   verifyConfirmationBlockCardsTableColumns=verifyTableColumns(BlockCancelCards.tblConfirmationBlockCardsHeader,arrColumnNameList)
End Function

'[Verify row Data in Table Confirmation:Block Cards]
Public Function verifytblConfirmationBlockCards_RowData(lstlstConfirmationBlockCards)
   bDevPending=False
   verifytblConfirmationBlockCards_RowData=verifyTableContentList(BlockCancelCards.tblConfirmationBlockCardsHeader,BlockCancelCards.tblConfirmationBlockCardsContent,lstlstConfirmationBlockCards,"Confirmation Block Cards" , false,null ,null,null)
   End Function

'[Verify Button OK on Confirmation:Block Cards popup is enabled]
Public Function VerifyBtnOK_Confirmation()
   bDevPending=false
	Dim bVerifyBtnOK:bVerifyBtnOK=true
	intBtnOK=Instr(BlockCancelCards.btnOK_ConfirmationBlockCards.GetROproperty("outerhtml"),"v-disabled")
	If  intBtnOK=0 Then
		LogMessage "RSLT","Verification","OK button is enable as per expectation.",True
		bVerifyBtnOK=true
	Else
		LogMessage "WARN","Verifiation","OK button is disable. Expected to be enable.",false
		bVerifyBtnOK=false
	End If
	VerifyBtnOK_Confirmation=bVerifyBtnOK
End Function

'[Verify Button Cancel on Confirmation:Block Cards popup is enabled]
Public Function VerifyBtnCancel()
   bDevPending=true
	Dim bVerifyBtnCancel:bVerifyBtnCancel=true
	intBtnCancel=Instr(BlockCancelCards.btnCancel_ConfirmationBlockCards.GetROproperty("outerhtml"),("v-disabled"))
	If  intBtnCancel=0 Then
		LogMessage "RSLT","Verification","Cancel button is enable as per expectation.",True
		bVerifyBtnCancel=true
	Else
		LogMessage "WARN","Verifiation","Cancel button is disable. Expected to be enable.",false
		bVerifyBtnCancel=false
	End If
	VerifyBtnCancel=bVerifyBtnCancel
End Function

'[Click Button OK on Confirmation Block Card]
Public Function clickButtonOK_ConfirmationBlockCards()
   bDevPending=true
   BlockCancelCards.btnOK_ConfirmationBlockCards.click
   If Err.Number<>0 Then
       clickButtonOK_ConfirmationBlockCards=false
            LogMessage "WARN","Verification","Failed to Click Button : OK_ConfirmationBlockCards" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickButtonOK_ConfirmationBlockCards=true
End Function

'[Click Button Cancel on Confirmation:Block Cards popup]
Public Function clickButtonCancel_ConfirmationBlockCards()
   bDevPending=true
   BlockCancelCards.btnCancel_ConfirmationBlockCards.click
   If Err.Number<>0 Then
       clickButtonCancel_ConfirmationBlockCards=false
            LogMessage "WARN","Verification","Failed to Click Button : Cancel_ConfirmationBlockCards" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickButtonCancel_ConfirmationBlockCards=true
End Function

'[Verify Tab NewSR displayed]
Public Function verifyTabNewSRexist(strTabName)
   bDevPending=false
   verifyTabNewSRexist=verifyTabExist(strTabName)
End Function

'[Select Tab NewSR]
Public Function setectTabNewSR(strTabName)
   bDevPending=false
   setectTabNewSR=selectTab(strTabName)
End Function

'[Close Tab NewSR]
Public Function closeTabNewSR(strTabName)
   bDevPending=false
   closeTabNewSR=closeTab(strTabName)
End Function

'[Verify Table CardSummary on NewSR Screen displayed]
Public Function verifyCardSummary_NewSRTabledisplayed()
   bDevPending=False
   verifyCardSummary_NewSRdisplayed= BlockCancelCards.tblCardSummary_NewSR.Exist(1)
End Function

'[Verify Table CardSummary on NewSR Screen has following Columns]
Public Function verifyCardSummary_NewSRTableColumns(arrColumnNameList)
   bDevPending=False
   verifyCardSummary_NewSRTableColumns=verifyTableColumns(BlockCancelCards.tblCardSummary_NewSR,arrColumnNameList)
End Function

'[Verify row Data in Table CardSummary on NewSR Screen]
Public Function verifytblCardSummary_NewSR_RowData(lstlstCardSummary)
   bDevPending=False
   iRowCount=BlockCancelCards.tblCardSummary_NewSRContent.RowCount
	Dim strCardNumber,strSRNumber,strForDataStore
	strCardNumber=""
	strSRNumber=""
	strForDataStore=""
	For iCount=1 to iRowCount
		strCardNumber=getCellTextFor (BlockCancelCards.tblCardSummary_NewSRHeader,BlockCancelCards.tblCardSummary_NewSRContent,iCount,"Card Number")
        If strCardNumber<>""  Then
			strForDataStore=strForDataStore & ""&strCardNumber&"|"
		End If	
    Next
	 insertDataStore "CanceledCards",strForDataStore
   verifytblCardSummary_NewSR_RowData=verifyTableContentList(BlockCancelCards.tblCardSummary_NewSRHeader,BlockCancelCards.tblCardSummary_NewSRContent,lstlstCardSummary,"CardSummary_NewSR" , False,NULL ,NULL,NULL)
End Function

'[Click SR Number link in Table CardSummary on NewSR Screen]
Public Function clickCardSummary_NewSR_link(arrRowDataList)
   bDevPending=true
   clickCardSummary_NewSR_link=selectTableLink(tblCardSummary_NewSRHeader,tblCardSummary_NewSRContent,arrRowDataList,"CardSummary_NewSR" ,"SR Number",bPagination,BlockCancelCards.lnkNext ,BlockCancelCards.lnkNext1 ,BlockCancelCards.lnkPrevious)
	WaitForICallLoading
End Function

'[Verify Popup Status:Block Cards exist]
Public Function verifyPopupStatusBlockCardsexist(bExist)
   bDevPending=false
   bActualExist=BlockCancelCards.popupStatusBlockCards.Exist(2)
   If bExist And  bActualExist  Then
       LogMessage "RSLT","Verification","Popup :StatusBlockCards Exists As Expected" ,true
       verifyPopupStatusBlockCardsexist=True
   ElseIf not bExist And  not bActualExist  Then
       LogMessage "RSLT","Verification","Popup :StatusBlockCards does not Exists As Expected" ,true
       verifyPopupStatusBlockCardsexist=True
   ElseIf bExist And  not bActualExist  Then
       LogMessage "WARN","Verification","Popup :StatusBlockCards does not Exists As Expected" ,False
       verifyPopupStatusBlockCardsexist=False
   ElseIf not bExist And   bActualExist  Then
       LogMessage "WARN","Verification","Popup :StatusBlockCards Still Exists" ,False
       verifyPopupStatusBlockCardsexist=False
   End If
End Function


'[Verify Field Note on Status:Block Cards popup displayed as Successfully blocked cards would only be processed as part of this service request]
Public Function verifyQuestion_StatusBlockCardsText()
   bDevPending=false
   bVerifyQuestion_StatusBlockCardsText=true
       If Not VerifyInnerText (BlockCancelCards.lblQuestion_StatusBlockCards(), "Successfully blocked card(s) will be processed as part of this Service Request.", "Question_StatusBlockCards")Then
           bVerifyQuestion_StatusBlockCardsText=false
       End If
   verifyQuestion_StatusBlockCardsText=bVerifyQuestion_StatusBlockCardsText
End Function

'[Verify Field Note on Status:Block Cards popup displayed as All selected cards are blocked and SR will be created.]
Public Function verifyConfirm_StatusBlockCardsText()
   bDevPending=false
   bVerifyQuestion_StatusBlockCardsText=true
       If Not VerifyInnerText (BlockCancelCards.lblQuestion_StatusBlockCards(), "All selected cards are blocked and SR will be created.", "Confirm_StatusBlockCards")Then
           bVerifyQuestion_StatusBlockCardsText=false
       End If
   verifyConfirm_StatusBlockCardsText=bVerifyQuestion_StatusBlockCardsText
End Function

'[Verify Table Status:Block Cards displayed]
Public Function verifyStatusBlockCardsTabledisplayed()
   bDevPending=False
   verifyStatusBlockCardsdisplayed= BlockCancelCards.tblStatusBlockCards.Exist(1)
End Function

'[Verify Table Status:Block Cards has following Columns]
Public Function verifyStatusBlockCardsTableColumns(arrColumnNameList)
   bDevPending=False
   verifyStatusBlockCardsTableColumns=verifyTableColumns(BlockCancelCards.tblStatusBlockCards,arrColumnNameList)
End Function

'[Verify row Data in Table Status Block Cards]
Public Function verifytblStatusBlockCards_RowData(lstlstStatusBlockCards)
   bDevPending=False
	strSuccessfullCards= getCellTextForMatchingColumnValues(BlockCancelCards.tblStatusBlockCardsHeader,BlockCancelCards.tblStatusBlockCardsContent,"Account/Card No.","Status","Successful",false,null,null,null)
	lstSuccessfullCards=Split(strSuccessfullCards,"|")
	strProductDescription=getCellTextForMatchingColumnValues(BlockCancelCards.tblStatusBlockCardsHeader,BlockCancelCards.tblStatusBlockCardsContent,"Product Description","Status","Successful",false,null,null,null)
	lstProductDescription=Split(strProductDescription,"|")
	For iCount=0 to Ubound(lstSuccessfullCards)
		lstBlockedCards=lstBlockedCards&""&lstSuccessfullCards(iCount) &":"&lstProductDescription(iCount)&"|"
	Next
	insertDataStore "SuccessfullBlockedCards", lstBlockedCards
		 If strRunTimeDataStore_BlockedCardStep<>"" Then
			strRunTimeDataStore_BlockedCardStep="Verify row Data in Table Status Block Cards"
			strRunTimeDataStore_VarName="SuccessfullBlockedCards"
		End If		
   verifytblStatusBlockCards_RowData=verifyTableContentList(BlockCancelCards.tblStatusBlockCardsHeader,BlockCancelCards.tblStatusBlockCardsContent,lstlstStatusBlockCards,"StatusBlockCards" , false,null ,null,null)
End Function

'************ Few new step added as per change in Story. MR1501 Block Card Revamp
'************ By Manish on 9th feb 2015

'[Verify row Data in Table Status Block Cards For Already Block Cards]
Public Function verifytblStatusBlockCards_AlreadyBlkCard(lstlstStatusBlockCards)
   bDevPending=False
	strSuccessfullCards= getCellTextForMatchingColumnValues(BlockCancelCards.tblAlreadyBlockCardsHeader,BlockCancelCards.tblAlreadyBlockCardsContent,"Account/Card No.","Status","Successful",false,null,null,null)
	lstSuccessfullCards=Split(strSuccessfullCards,"|")
	strProductDescription=getCellTextForMatchingColumnValues(BlockCancelCards.tblAlreadyBlockCardsHeader,BlockCancelCards.tblAlreadyBlockCardsContent,"Product Description","Status","Successful",false,null,null,null)
	lstProductDescription=Split(strProductDescription,"|")
	For iCount=0 to Ubound(lstSuccessfullCards)
		lstBlockedCards=lstBlockedCards&""&lstSuccessfullCards(iCount) &":"&lstProductDescription(iCount)&"|"
	Next
	verifytblStatusBlockCards_AlreadyBlkCard=verifyTableContentList(BlockCancelCards.tblAlreadyBlockCardsHeader,BlockCancelCards.tblAlreadyBlockCardsContent,lstlstStatusBlockCards,"StatusAlreadyBlockCards" , false,null ,null,null)
End Function

'[Set TextBox Comment on Status Block Card to]
Public Function setComment_StatusBlockCard(strComment)
   bDevPending=False
   BlockCancelCards.txtComment_StatusBlockCard.Set(strComment)
   If Err.Number<>0 Then
       setComment_StatusBlockCard=false
            LogMessage "WARN","Verification","Failed to Set Text Box :Comment" ,false
       Exit Function
   End If
   setComment_StatusBlockCard=true
End Function

'[Verify Field Replacement Request Question on Status Block Cards popup displayed as Do you want to proceed with Card Replacement?]
Public Function verifyReplacementQuestion_StatusBlockCardsText()
   'bDevPending=false
   bVerifyQuestion_StatusBlockCardsText=true
       If Not VerifyInnerText (BlockCancelCards.lblReplacementQuestion_StatusBlockCards(), "Do you want to proceed with Card Replacement?", "ReplacementQuestion_StatusBlockCards")Then
           bVerifyQuestion_StatusBlockCardsText=false
       End If
   verifyReplacementQuestion_StatusBlockCardsText=bVerifyQuestion_StatusBlockCardsText
End Function

'[Click Button No Replacement for Block Cards popup]
Public Function clickButtonNo_StatusBlockCards()
   bDevPending=false
   BlockCancelCards.btnNo_StatusBlockCards.click
   If Err.Number<>0 Then
       clickButtonNo_StatusBlockCards=false
            LogMessage "WARN","Verification","Failed to Click Button : No_StatusBlockCards" ,false
       Exit Function
   End If
   WaitForICallLoading
   Wait 13
   clickButtonNo_StatusBlockCards=true
End Function

'[Click Button Yes on Status:Block Cards popup]
Public Function clickButtonYes_StatusBlockCards()
   bDevPending=false
   BlockCancelCards.btnYes_StatusBlockCards.click
   If Err.Number<>0 Then
       clickButtonYes_StatusBlockCards=false
            LogMessage "WARN","Verification","Failed to Click Button : Yes_StatusBlockCards" ,false
       Exit Function
   End If
   WaitForICallLoading
   Wait 10
   clickButtonYes_StatusBlockCards=true
End Function

'[Verify Popup Validation Failed exist]
Public Function verifyPopupValidationFailedexist(bExist)
   bDevPending=false
   bActualExist=BlockCancelCards.popupStatusBlockCards.Exist(2)
   If bExist And  bActualExist  Then
       LogMessage "RSLT","Verification","Popup :Validation Failed Exists As Expected" ,true
       verifyPopupValidationFailedexist=True
   ElseIf not bExist And  not bActualExist  Then
       LogMessage "RSLT","Verification","Popup :Validation Failed does not Exists As Expected" ,true
       verifyPopupValidationFailedexist=True
   ElseIf bExist And  not bActualExist  Then
       LogMessage "WARN","Verification","Popup :Validation Failed does not Exists As Expected" ,False
       verifyPopupValidationFailedexist=False
   ElseIf not bExist And   bActualExist  Then
       LogMessage "WARN","Verification","Popup :Validation Failed Still Exists" ,False
       verifyPopupValidationFailedexist=False
   End If
End Function

'[Verify Field Note on Status:Block Cards popup displayed as For Unsuccessful/Failed cards(s),Please check and submit "Block Card(s)" to block the card as Replacement Not Required.]
Public Function verifyNote_StatusBlockCardsText()
   bDevPending=false
   bVerifyQuestion_StatusBlockCardsText=true
       If Not VerifyInnerText (BlockCancelCards.lblNotes_StatusBlockCards(), "For Unsuccessful/Failed cards(s),Please check and submit.*", "Note_StatusBlockCards")Then
           bVerifyQuestion_StatusBlockCardsText=false
       End If
   verifyNote_StatusBlockCardsText=bVerifyQuestion_StatusBlockCardsText
End Function

'[Verify row Data in Table Status Block Cards For Blocked ATM/UDC Cards]
Public Function verifytblStatusBlockCards_ATMUDC(lstlstStatusBlockCards)
   bDevPending=False
	strSuccessfullCards= getCellTextForMatchingColumnValues(BlockCancelCards.tblStatusBlockCardsHeader,BlockCancelCards.tblStatusBlockCardsContent,"Account/Card No.","Status","Successful",false,null,null,null)
	lstSuccessfullCards=Split(strSuccessfullCards,"|")
	strProductDescription=getCellTextForMatchingColumnValues(BlockCancelCards.tblStatusBlockCardsHeader,BlockCancelCards.tblStatusBlockCardsContent,"Product Description","Status","Successful",false,null,null,null)
	lstProductDescription=Split(strProductDescription,"|")
	For iCount=0 to Ubound(lstSuccessfullCards)
		lstBlockedCards=lstBlockedCards&""&lstSuccessfullCards(iCount) &":"&lstProductDescription(iCount)&"|"
	Next
	verifytblStatusBlockCards_ATMUDC=verifyTableContentList(BlockCancelCards.tblStatusBlockCardsHeader,BlockCancelCards.tblStatusBlockCardsContent,lstlstStatusBlockCards,"StatusBlockCards" , false,null ,null,null)
End Function

'[Verify Field Note on Status:Block Cards popup displayed as Following Cards are already Blocked hence will not be processed as part of this request.]
Public Function verifySecondNote_StatusBlockCardsText()
   bDevPending=false
   bVerifyQuestion_StatusBlockCardsText=true
       If Not VerifyInnerText (BlockCancelCards.lblSecondNotes_StatusBlockCards(), "Following Cards are already Blocked hence will not be processed as part of this request.", "NoteSecond_StatusBlockCards")Then
           bVerifyQuestion_StatusBlockCardsText=false
       End If
   verifySecondNote_StatusBlockCardsText=bVerifyQuestion_StatusBlockCardsText
End Function

'[Verify row Data in Table Status Block Cards For Blocked CC/EDC Cards]
Public Function verifytblStatusBlockCards_CCEDC(lstlstStatusBlockCards)
   'bDevPending=False
bverifytblStatusBlockCards_CCEDC = true
verifytblStatusBlockCards_CCEDC=verifyTableContentList(BlockCancelCards.tblblockedCardListTableHeader,BlockCancelCards.tblblockedCardListTableContent,lstlstStatusBlockCards,"StatusBlockCards" , false,null ,null,null)
verifytblStatusBlockCards_CCEDC = bverifytblStatusBlockCards_CCEDC
End Function

'[Verify Button OK on Status:Block Cards is enabled]
Public Function VerifyBtnOK_StatusBlockCard()
   bDevPending=false
	Dim bVerifyBtnOK:bVerifyBtnOK=true
	intBtnOK=Instr(BlockCancelCards.btnOK_StatusBlockCards.GetROproperty("outerhtml"),("v-disabled"))					   
	If  intBtnOK=0 Then
		LogMessage "RSLT","Verification","OK button is enable as per expectation.",True
		bVerifyBtnOK=true
	Else
		LogMessage "WARN","Verifiation","OK button is disable. Expected to be enable.",false
		bVerifyBtnOK=false
	End If
	VerifyBtnOK_StatusBlockCard=bVerifyBtnOK
End Function

'[Click Button OK on Status Block Cards popup]
Public Function clickButtonOK_StatusBlockCards()
   bDevPending=false
   BlockCancelCards.btnOK_StatusBlockCards.click
   If Err.Number<>0 Then
       clickButtonOK_StatusBlockCards=false
            LogMessage "WARN","Verification","Failed to Click Button : OK_StatusBlockCards" ,false
       Exit Function
   End If
   WaitForICallLoading
   Wait 10
   clickButtonOK_StatusBlockCards=true
End Function

'[Verify Multiple Cards Blocked SR Details]
Public Function verifyMultipleCardsBlockedSRDetails(lstBlockedCards)
	'Get Steps from Navigation Key
	'Repeat steps at run time
	Dim bVerify:bVerify=true
	strBlockedDetails=fetchFromDataStore("Verify SR Number Column values in Table Request Submitted displayed as Link","BLANK","AllBlockedCardsDetails")(0)
	arrBlockedCards=CheckNull(strBlockedDetails)
	For intCardCount=0 to Ubound(lstBlockedCards)
		strCurrentCard=lstBlockedCards(intCardCount)
		For intAllBlockedCards=0 to Ubound(arrBlockedCards,1)
			strCardNumber=Split(arrBlockedCards(intAllBlockedCards,0),":")(1)
			strSRNumber=Split(arrBlockedCards(intAllBlockedCards,1),":")(1)
			strRunTimeSRNumber=strSRNumber
			strProductDesc=Split(arrBlockedCards(intAllBlockedCards,2),":")(1)
			strStatus=Split(arrBlockedCards(intAllBlockedCards,3),":")(1)
		   If strCardNumber=strCurrentCard Then
			   'Check if SR Sucessfull
			   If strStatus<>"Successful" Then
				   LogMessage "WARN","Verification","Sr Status for Card Number :" &strCardNumber&" is "&strStatus,false
				   bVerify=false
			   End If
			bVerify= executeRuntimeNavigationKey ("Verify SR For Blocked Card from Customer Overview Page")
		   End If
		Next
	Next
	 verifyMultipleCardsBlockedSRDetails=bVerify
End Function

'[Verify Multiple Cards Blocked SR Number]
Public Function verifyMultipleCardsBlockedSRDetails(lstBlockedCards)
	'Get Steps from Navigation Key
	'Repeat steps at run time
	Dim bVerify:bVerify=true
	strBlockedDetails=fetchFromDataStore("Verify SR Number Column values in Table Request Submitted Tab displayed as Link","BLANK","AllBlockedCardsDetails")(0)
	arrBlockedCards=CheckNull(strBlockedDetails)
	For intCardCount=0 to Ubound(lstBlockedCards)
		strCurrentCard=lstBlockedCards(intCardCount)
		For intAllBlockedCards=0 to Ubound(arrBlockedCards,1)
			strCardNumber=Split(arrBlockedCards(intAllBlockedCards,0),":")(1)
			strSRNumber=Split(arrBlockedCards(intAllBlockedCards,1),":")(1)
			strRunTimeSRNumber=strSRNumber
			strProductDesc=Split(arrBlockedCards(intAllBlockedCards,2),":")(1)
			strStatus=Split(arrBlockedCards(intAllBlockedCards,3),":")(1)
		   If strCardNumber=strCurrentCard Then
			   'Check if SR Sucessfull
			   If strStatus<>"Closed" Then
				   LogMessage "WARN","Verification","Sr Status for Card Number :" &strCardNumber&" is "&strStatus,false
				   bVerify=false
			   End If
			bVerify= executeRuntimeNavigationKey ("Verify SR Number For Blocked Card from Customer Overview Page")
		   End If
		Next
	Next
	 verifyMultipleCardsBlockedSRDetails=bVerify
End Function

'[Verify Multiple Cards Blocked Account Status from KeyInfo and Relationship Detail and Card Info]
Public Function verifyMultipleCardsBlockedStatusDetails(lstBlockedCards)
	'Get Steps from Navigation Key
	'Repeat steps at run time
	Dim bVerify:bVerify=true
	strBlockedDetails=fetchFromDataStore("Verify SR Number Column values in Table Request Submitted displayed as Link","BLANK","AllBlockedCardsDetails")(0)
	arrBlockedCards=CheckNull(strBlockedDetails)
	For intCardCount=0 to Ubound(lstBlockedCards)
		strCurrentCard=lstBlockedCards(intCardCount)
		For intAllBlockedCards=0 to Ubound(arrBlockedCards,1)
			strCardNumber=Split(arrBlockedCards(intAllBlockedCards,0),":")(1)
             gstrRuntimeArgDict.Item("$Account")=""&strCardNumber
			
			strSRNumber=Split(arrBlockedCards(intAllBlockedCards,1),":")(1)
			strRunTimeSRNumber=strSRNumber
			strProductDesc=Split(arrBlockedCards(intAllBlockedCards,2),":")(1)
			strStatus=Split(arrBlockedCards(intAllBlockedCards,3),":")(1)
		   If strCardNumber=strCurrentCard Then
			   'Check if SR Sucessfull
			   If strStatus<>"Successful" Then
				   LogMessage "WARN","Verification","Sr Status for Card Number :" &strCardNumber&" is "&strStatus,false
				   bVerify=false
			   End If
			   'Get Card Type for navigation from Overview or Card List
				If Instr(strProductDesc,"DEBIT")<>0Then
					strCardType="ATM/Debit"
					'Close All other Tabs
                  bVerify= executeRuntimeNavigationKey ("Select Card From Card List Page")
				  'TODO Set Corresponding Block status values based on card Type at run time by using dictionary 
				  'gstrRuntimeArgDict .Item($Account)=strAccount
				else
					bVerify=executeRuntimeNavigationKey ("Select Account from Accounts Table")
				End If
			bVerify= executeRuntimeNavigationKey ("Verify Account Status KeyInfo")
			bVerify= executeRuntimeNavigationKey ("Verify Card Status Relationship Details")
			bVerify= executeRuntimeNavigationKey ("Verify Card Status Card and PIN Info")
		   End If
		Next
	Next
	verifyMultipleCardsBlockedStatusDetails=bVerify
End Function

'[Verify Verification Alert Message]
Public Function verifyVerificationAlertMessage(strVerificationAlertMessage)
	bverifyVerificationAlertMessage=true
	If not VerifyInnerText(BlockCancelCards.lblValidationMessage(),strVerificationAlertMessage,"Verification Required") Then
		bverifyVerificationAlertMessage=false
	End If
	 BlockCancelCards.btnOK_ValidationMsg.click
   If Err.Number<>0 Then
       bverifyVerificationAlertMessage=false
            LogMessage "WARN","Verification","Failed to Click OK : Verification Required" ,false
       Exit Function
   End If
   WaitForICallLoading
	verifyVerificationAlertMessage=bverifyVerificationAlertMessage
End Function

'[Verify Closed Card Validation Failed Error Message]
Public Function verifyValidationErrorMessage()
   bverifyValidationErrorMessage=true
	If not VerifyInnerText(BlockCancelCards.lblValidationFailedMessage(),"This card does not have the correct status","Validation Failed") Then
		bverifyValidationErrorMessage=false
	End If
	 BlockCancelCards.btnOK_ValidationFailed.click
   If Err.Number<>0 Then
       bverifyValidationErrorMessage=false
            LogMessage "WARN","Verification","Failed to Click OK : Validation Failed" ,false
       Exit Function
   End If
   WaitForICallLoading
   verifyValidationErrorMessage=bverifyValidationErrorMessage
End Function

'[Verify Block Card Validation Failed Error Message]
Public Function verifyBlockCardErrorMessage(strErrorMessage)
   bverifyBlockCardErrorMessage=true
   Wait 1
	'If not VerifyInnerText(BlockCancelCards.lblValidationFailedMessage(), strErrorMessage,"Validation Failed") Then
	If not VerifyInnerText(BlockCancelCards.lblValidationMessage(), strErrorMessage,"Validation Failed") Then
		bverifyBlockCardErrorMessage=false
	End If
	 'BlockCancelCards.btnOK_ValidationFailed.click
	 BlockCancelCards.btnOK_ValidationMsg.click
   If Err.Number<>0 Then
       bverifyBlockCardErrorMessage=false
            LogMessage "WARN","Verification","Failed to Click OK : Validation Failed" ,false
       Exit Function
   End If
   WaitForICallLoading
   verifyBlockCardErrorMessage=bverifyBlockCardErrorMessage
End Function

'[Verify Field Reason For Blocking displayed as]
Public Function verifyReasonForBlockingText(strReasonforBlocking)
   bDevPending=false
   bVerifyReasonForBlockingText=true
   If Not IsNull(strReasonforBlocking) Then
       If Not VerifyInnerText (BlockCancelCards.lblReasonForBlocking(), strReasonforBlocking, "Reason For Blocking")Then
           bVerifyReasonForBlockingText=false
       End If
   End If
   verifyReasonForBlockingText=bVerifyReasonForBlockingText
End Function

'[Verify Confirmation Popup To Cancel SR]
Public Function verifyConfirmationPopupCancelSR()
   bverifyConfirmationPopupCancelSR=true
	If not VerifyInnerText(BlockCancelCards.lblConfirmationCancelSR(),"Are you sure you want to discard the changes (if any) and leave this page?","Validation Failed") Then
		bverifyConfirmationPopupCancelSR=false
	End If
	 BlockCancelCards.btnCancel_ConfirmationPopup.click
   If Err.Number<>0 Then
       bverifyConfirmationPopupCancelSR=false
            LogMessage "WARN","Verification","Failed to Click Cancel : Validation Failed" ,false
       Exit Function
   End If
   WaitForICallLoading
   verifyConfirmationPopupCancelSR=bverifyConfirmationPopupCancelSR
End Function

'[Verify the Radio button is enabled]
Public Function Verify_rbtnReplacementRequired()
	bDevPending=False
  	intrbtnReplacementRequired=Instr(BlockCancelCard.rbtnReplacementRequired.Object.GetAttribute("disabled"),("disabled"))
	If  intrbtnReplacementRequired=0 Then
		LogMessage "RSLT","Verification","Radibutton is enable as per expectation.",True
		bVerifybtnSubmit_CC=true
	Else
		LogMessage "WARN","Verifiation","Radiobutton is disable.",false
		bVerifybtnSubmit_CC=false
	End If
	Verify_rbtnReplacementRequired=true 
	
End Function

'[Select Radio Button Replacement Required on Block Card Screen]
Public Function selectReplacementRequiredRadio(strReplacementRequired)
	bDevPending=true
	bselectUrgentMailingRadio=true
	intReplacementRadio=Instr(BlockCancelCards.rbtnReplacementRequired.GetROproperty("outerhtml"),"disabled-area")
	If intReplacementRadio <> 0 Then
		bselectUrgentMailingRadio=SelectRadioButtonGrp(strReplacementRequired, BlockCancelCards.rbtnReplacementRequired, Array("Yes","No"))
	Else
		'LogMessage "RSLT","Verifiation","Radio button is disabled by default.",True
	End If
	If Err.Number<>0 Then
       bselectUrgentMailingRadio=false
          LogMessage "WARN","Verification","Failed to select radiobutton or radiobutton is disabled" ,True
       Exit Function
   End If
   selectReplacementRequiredRadio=bselectUrgentMailingRadio
End Function

'[Perform Additional Verification for TPIN call from Block Card Screen]
Public Function performTPINPlusOne_BlockCard(bExpectedVerification, strValidationMessage)
   Dim bPerformTPINPlusOneVerification:bPerformTPINPlusOneVerification=true
   bActualExist=BlockCancelCards.popupValidationMessage.Exist(1)
	'bActualExist=true	
   If bExpectedVerification Then
		If not bActualExist Then
			bPerformTPINPlusOneVerification=false
		 else
			strActualValidationMessage=BlockCancelCards.lblValidationMessage.GetRoProperty("innertext")
			If Not IsNull(strActualValidationMessage) Then
				If Not VerifyInnerText (BlockCancelCards.lblValidationMessage(), strValidationMessage, "ValidationMessage")Then
					bPerformTPINPlusOneVerification=false
				End If
			End If
			BlockCancelCards.btnOK_ValidationMsg.Click
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
   performTPINPlusOne_BlockCard=bPerformTPINPlusOneVerification
End Function

'[Verify Lost Stolen Button exist]
Public Function verifyLostStolenButtonexist(bExist)
   bDevPending=false
   bActualExist=BlockCancelCards.btnReportLostStolenCard.Exist(2)
   If bExist And  bActualExist  Then
       LogMessage "RSLT","Verification","Button :Validation Failed Exists As Expected" ,true
       verifyLostStolenButtonexist=True
   ElseIf not bExist And  not bActualExist  Then
       LogMessage "RSLT","Verification","Button :Validation Failed does not Exists As Expected" ,true
       verifyLostStolenButtonexist=True
   ElseIf bExist And  not bActualExist  Then
       LogMessage "WARN","Verification","Button :Validation Failed does not Exists As Expected" ,False
       verifyLostStolenButtonexist=False
   ElseIf not bExist And   bActualExist  Then
       LogMessage "WARN","Verification","Button :Validation Failed Still Exists" ,False
       verifyLostStolenButtonexist=False
   End If
End Function

'[Verify row Data in Table SummaryCards for Block Card]
Public Function verifytblSummaryCardsBlock_RowData(lstlstSummaryCards)
bverifytblSummaryCardsBlock_RowData= true
If Not IsNull(lstlstSummaryCards) Then
	verifytblSummaryCardsBlock_RowData=verifyTableContentList(BlockCancelCards.tblCardSummaryHeader,BlockCancelCards.tblCardSummaryContent,lstlstSummaryCards,"Card Summary", false,null ,null,null)	
End If
verifytblSummaryCardsBlock_RowData = bverifytblSummaryCardsBlock_RowData
End Function   

'[Click Button Cancel_Request Submitted for Card Block]
Public Function clickButtonCancel_RequestSubmittedBlockCard()
   bDevPending=false
   BlockCancelCards.btnCancel_RequestSubmitted.click
   waitForIcallLoading
   If Err.Number<>0 Then
       clickButtonCancel_RequestSubmittedBlockCard=false
            LogMessage "WARN","Verification","Failed to Click Button : Cancel_RequestSubmitted" ,false
       Exit Function
   End If
   clickButtonCancel_RequestSubmittedBlockCard=true
End Function

'[Test code for reason for cancellation]
Public Function selectReasonForCancellationComboBox_test(strReasonForCancellation)
   bDevPending=false
   bSelectReasonForCancellationComboBox_test=true
   If BlockCancelCards.lstReasonForCancellation.exist Then
   	if Not IsNull(strReasonForCancellation) Then
       If Not (selectItem_Combobox (BlockCancelCards.lstReasonForCancellation(), strReasonForCancellation))Then
            LogMessage "WARN","Verification","Failed to select :"&strControlName&" From ReasonForCancellation drop down list" ,false
           bSelectReasonForCancellationComboBox_test=false
           logMessage "There is no list for reason of cancellation", true
       End If
   End If
   End If
   
   if Not IsNull(strReasonForCancellation) Then
       If Not (selectItem_Combobox (BlockCancelCards.lstReasonForCancellation(), strReasonForCancellation))Then
            LogMessage "WARN","Verification","Failed to select :"&strControlName&" From ReasonForCancellation drop down list" ,false
           bSelectReasonForCancellationComboBox_test=false
       End If
   End If
   selectReasonForCancellationComboBox_test=bSelectReasonForCancellationComboBox_test
End Function

'[Select Check box for Single Card to Block from Cardlist table]
Public Function selectCheckBoxForSingleCard_ReportStolen(lstlstCardlists)
   'This Function Selects Single Card
   bDevPending=False
   bselectCheckBoxForSingleCard_ReportStolen = true
   intCount = Ubound(lstlstCardlists,1)
	ReDim arrCol(intCount)
	ReDim arrVal(intCount)
   iCount = 0
   Set objAllRows=getAllRows(BlockCancelCards.tblCardsToBeBlockedContent)
   intRow = objAllRows.Count
   	verifytableReportStolen_SelectCard=verifyTableContentList(BlockCancelCards.tblCardsToBeBlockedHeader,BlockCancelCards.tblCardsToBeBlockedContent,lstlstCardlists,"Card(s) to be Blocked",false,null,null,null)	
   	If verifytableReportStolen_SelectCard Then
   		For i = 0 To intCount	  
	   		strExpCardNum = lstlstCardlists(i,0)
	   		strExpCardNum = split(strExpCardNum,":")
	  		arrCol(i) = strExpCardNum(0)
			arrVal(i) = strExpCardNum(1)  		
		
			For j = 0 To intRow -1   
			  strActualCardNumber=getCellTextFor(BlockCancelCards.tblCardsToBeBlockedHeader,objAllRows(j),j,"Account/Card No.")
				If StrComp(arrVal(i),strActualCardNumber) = 0 Then 
		   		  	selectChk = selectCheckBox_selectcardlist(objAllRows(j),"")
		   		  	Exit For
	   			 End If 
	   		Next
   		Next
   	End If
   	selectCheckBoxForSingleCard_ReportStolen =bselectCheckBoxForSingleCard_ReportStolen
End Function

Public Function selectCheckBox_selectcardlist(objTableContent,strColName)
	selectCheckBox_selectcardlist = true
	Set oDesc = Description.Create
	'oDesc("xpath").value ="//div[contains(@class,'dt-cell ng-scope')]" "Commented as of now because of UFT issue"
	 oDesc("class").value = "dt-cell ng-scope.*"  'Modified by Aniket for UFT issue
	'oDesc("xpath").value ="//div[contains(@class,'dt-header-cell ng-scope sortable resizable')]"
	Set tableColObj = objTableContent.childobjects(oDesc)
	'check which childobject contains the class "csat-icon-checkbox ng-binding"
	Dim strColHeader
	strColHeader=tableColObj(0).GetROProperty("innertext")
	Set chkBox = Description.Create
	' Commenting below line of code because of UFT issue
	'chkBox("xpath").value = "//div[contains(@class,'md-container')]"
	chkBox("class").value = "md-container.*"
	Set chkBoxChildObj = tableColObj(0).childobjects(chkBox)
	countChk = chkBoxChildObj.Count
	print countChk
	chkBoxChildObj(0).click
End Function

'[Verify Popup Validation Failed exist for Report/Stolen]
Public Function verifyPopupValidationFailedexist_ReportStolen(bExist)
   bDevPending=False
   bActualExist=BlockCancelCards.popupValidationFailed.Exist(1)
   If bExist And  bActualExist  Then
       LogMessage "RSLT","Verification","Popup :Validation Failed Exists As Expected" ,true
       verifyPopupValidationFailedexist_ReportStolen=True
       'BlockCancelCards.popupValidationFailed.btnOK_ValidationFailedMsg.click
   ElseIf not bExist And  not bActualExist  Then
       LogMessage "RSLT","Verification","Popup :Validation Failed does not Exists As Expected" ,true
       verifyPopupValidationFailedexist_ReportStolen=True
   ElseIf bExist And  not bActualExist  Then
       LogMessage "WARN","Verification","Popup :Validation Failed does not Exists As Expected" ,False
       verifyPopupValidationFailedexist_ReportStolen=False
   ElseIf not bExist And   bActualExist  Then
       LogMessage "WARN","Verification","Popup :Validation Failed Still Exists" ,False
       verifyPopupValidationFailedexist_ReportStolen=False
   End If
End Function

'[Click Button OK for failed validation pop up Report/Stolen]
Public Function clickbtnOK_ValidationFailedMsg()
   bDevPending=False
   BlockCancelCards.btnOK_ValidationMsg_ReportStolen.click
   If Err.Number<>0 Then
       clickbtnOK_ValidationFailedMsg=false
            LogMessage "WARN","Verification","Failed to Click Button : btnOK_ValidationFailedMsg" ,false
       Exit Function
   End If
   clickbtnOK_ValidationFailedMsg=true
End Function

'[Verify row Data in validation failed popup for already blocked table]
Public Function verifytblAlreadyBlocked_RowData(lstlstCardArleadyBlocked)
   bDevPending=false
   bverifytblAlreadyBlocked_RowData = true
   verifytblAlreadyBlocked_RowData=verifyTableContentList(BlockCancelCards.tblAlreadyBlockCardsHeader,BlockCancelCards.tblAlreadyBlockCardsContent,lstlstCardArleadyBlocked,"Card Already Blocked" ,false,null ,null,null)
   verifytblAlreadyBlocked_RowData = bverifytblAlreadyBlocked_RowData
End Function

'[Verify Button Block Card on Report/Stolen is enabled]
Public Function VerifybtnBlockCard_ReportStolen()
	bDevPending=False
   Dim bVerifyButtonBlockCard:bVerifyButtonBlockCard=true
   	intbtnBlockCard=BlockCancelCards.btnBlockCard_CardList.GetROProperty("disabled")  
	'intbtnBlockCard=Instr(BlockCancelCards.btnBlockCard_CardList.Object.GetAttribute("disabled"),("disabled"))   
	'intbtnBlockCard=Instr(BlockCancelCards.btnBlockCard_CardList.GetROproperty("outerhtml"),("v-disabled"))
	If  intbtnBlockCard=0 Then
		LogMessage "RSLT","Verification","Block Card button is enable as per expectation.",True
		bVerifyButtonSubmit=true
	Else
		LogMessage "WARN","Verifiation","Block Card button is disable. Expected to be enable.",false
		bVerifyButtonSubmit=false
	End If
	VerifybtnBlockCard_ReportStolen=bVerifyButtonBlockCard
End Function

'[Verify Popup RequestSubmitted on Block Card SR Screen exist]
Public Function verifyPopupRequestSubmittedexist_BlockCard(bExist)
   bDevPending=False
   bActualExist=BlockCancelCards.popupRequestSubmitted.Exist(1)
   If bExist And  bActualExist  Then
       LogMessage "RSLT","Verification","Popup :RequestSubmitted Exists As Expected" ,true
       verifyPopupRequestSubmittedexist_BlockCard=True
   ElseIf not bExist And  not bActualExist  Then
       LogMessage "RSLT","Verification","Popup :RequestSubmitted does not Exists As Expected" ,true
       verifyPopupRequestSubmittedexist_BlockCard=True
   ElseIf bExist And  not bActualExist  Then
       LogMessage "WARN","Verification","Popup :RequestSubmitted does not Exists As Expected" ,False
       verifyPopupRequestSubmittedexist_BlockCard=False
   ElseIf not bExist And   bActualExist  Then
       LogMessage "WARN","Verification","Popup :RequestSubmitted Still Exists" ,False
       verifyPopupRequestSubmittedexist_BlockCard=False
   End If
End Function

'[Verify Field CardNumber_RequestSubmitted on Block Card SR Screen displayed as]
Public Function verifyCardNumber_RequestSubmittedText_CardNumber(strExpectedText)
   bDevPending=False
   bVerifyCardNumber_RequestSubmittedText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText(BlockCancelCards.lblCardNumber_RequestSubmitted(), strExpectedText, "CardNumber_RequestSubmitted")Then
           bVerifyCardNumber_RequestSubmittedText=false
       End If
   End If
   verifyCardNumber_RequestSubmittedText_CardNumber=bVerifyCardNumber_RequestSubmittedText
End Function

'[Verify Field ProductDescription_RequestSubmitted on Block Card SR Screen displayed as]
Public Function verifyProductDescription_RequestSubmittedText_BlockCard(strExpectedText)
   bDevPending=False
   bVerifyProductDescription_RequestSubmittedText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (BlockCancelCards.lblProductDescription_RequestSubmitted(), strExpectedText, "ProductDescription_RequestSubmitted")Then
           bVerifyProductDescription_RequestSubmittedText=false
       End If
   End If
   verifyProductDescription_RequestSubmittedText_BlockCard=bVerifyProductDescription_RequestSubmittedText
End Function

'[Verify Field Status_RequestSubmitted on Block Card SR Screen displayed as]
Public Function verifyStatus_RequestSubmittedText_BlockCard(strExpectedText)
   bDevPending=False
   bVerifyStatus_RequestSubmittedText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (BlockCancelCards.lblStatus_RequestSubmitted(), strExpectedText, "Status_RequestSubmitted")Then
           bVerifyStatus_RequestSubmittedText=false
       End If
   End If
   verifyStatus_RequestSubmittedText_BlockCard=bVerifyStatus_RequestSubmittedText
End Function

'[Click Button Close_RequestSubmitted on Block Card SR Screen]
Public Function clickCloseButton_RequestSubmitted_BlockCard()
   bDevPending=False
   BlockCancelCards.btnCancel_RequestSubmitted.click
   If Err.Number<>0 Then
       clickCloseButton_RequestSubmitted_BlockCard=false
            LogMessage "WARN","Verification","Failed to Click Button : Close_RequestSubmitted" ,false
       Exit Function
   End If
   clickCloseButton_RequestSubmitted_BlockCard=true
End Function

'[Select Radio Button Replacement required]
Public Function selectRadioButtonReplacement(strReplace)
	bDevPending=False
	bselectRadioReplace=true
	bselectRadioReplace=SelectRadioButtonGrp(strReplace, BlockCancelCards.rbtnReplacementRequired, Array("Yes","No"))   
	If Err.Number<>0 Then
       bselectRadioReplace=false
          LogMessage "WARN","Verification","Failed to select option:Replacement required" ,false
       Exit Function
   End If
   selectRadioButtonReplacement=bselectRadioReplace
End Function


