'*****This is auto generated code using code generator please Re-validate ****************
'Dim strRunTimeStmtDate:strRunTimeStmtDate="" 'To get Statement date from statement page
'Dim strRunTimePymtDueDate:strRunTimePymtDueDate="" 'To get Payment Due Date from statement page

'[Get Statement Date and Payment Due Date from Statement Page]
Public Function getDate_Statement()
   bDevPending=false
   bgetDate_Statement=true
   WaitForIcallLoading
   For iCountOne = 1 To 180 Step 1
		If Not bcStatements.txtStatementDate.Exist(0.5) Then
			Wait(0.5)
		else
			gstrRunTimeStmtDate = bcStatements.txtStatementDate.getroProperty("value")
			Exit for
		End if
	Next
  	
  	'strRunTimePymtDueDate=bcStatements.tblStatementSummaryContent.getcellData(1,9)
  	gstrRunTimePymtDueDate= getCellTextFor(bcStatements.tblStatementSummaryHeader,bcStatements.tblStatementSummaryContent,"0","Statement Due Date")
   getDate_Statement=bgetDate_Statement
End Function

'[Verify row Data in Table Current Statement Cycle for Billing Cycle Change]
Public Function verifytblCurrentStmtContent_BCC()
   bDevPending=false
   Dim lstlstCurrentStatment
   'Below line of code will always go False hence commenting.
   lstlstCurrentStatment=CheckNull("(Statement Date:"&gstrRunTimeStmtDate&"|Payment Due Date:"&gstrRunTimePymtDueDate&")|")
   verifytblCurrentStmtContent_BCC=verifyTableContentList(BillingCycle_Page.tblCurrentStatementHeader,BillingCycle_Page.tblCurrentStatementContent,lstlstCurrentStatment,"SelectedCardsContent",false,null,null,null)
End Function


'[Click Button Cancel On Billing Cycle]
Public Function clickButtonCancel_BC()
   bDevPending=false
   BillingCycle_Page.btnCancel.click
   If Err.Number<>0 Then
       clickButtonCancel_BC=false
            LogMessage "WARN","Verification","Failed to Click Button : Cancel" ,false
       Exit Function
   End If
   WaitForIcallLoading
   clickButtonCancel_BC=true
End Function

'[Click Button Cancel Request On OnHold SR]
Public Function clickButtonCancelRequest_BC()
   bDevPending=false
   BillingCycle_Page.btnCancelRequest.click
   If Err.Number<>0 Then
       clickButtonCancelRequest_BC=false
            LogMessage "WARN","Verification","Failed to Click Button : Cancel Request" ,false
       Exit Function
   End If
   WaitForIcallLoading
   clickButtonCancelRequest_BC=true
End Function

'[Click Button NotesADD On BC]
Public Function clickButtonNotesADD_BC()
   bDevPending=false
   BillingCycle_Page.btnNotesADD.click
   If Err.Number<>0 Then
       clickButtonNotesADD_BC=false
            LogMessage "WARN","Verification","Failed to Click Button : NotesADD" ,false
       Exit Function
   End If
   clickButtonNotesADD_BC=true
End Function

'[Verify Billing Cycle SR opened successfully]
Public Function verifyBillingCycle()
    WaitForICallLoading
    Wait(30)
    For iCount = 1 To 180 Step 1
		If Not BillingCycle_Page.lstReasonForChangeBC.Exist(0.5) Then
			Wait(0.5)
		else
			verifyBillingCycle=BillingCycle_Page.pageExists
			Exit for
		End if
	Next
	WaitForICallLoading
End Function

'[Click Button Submit On BC]
Public Function clickButtonSubmit_BC()
   bDevPending=false
   BillingCycle_Page.btnSubmit.click
   If Err.Number<>0 Then
       clickButtonSubmit_BC=false
            LogMessage "WARN","Verification","Failed to Click Button : Submit" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickButtonSubmit_BC=true
End Function

'[Get NextPaymentDueDate Label Text On BC]
Public Function getNextPaymentDueDateText_BC()
   bDevPending=false
   getNextPaymentDueDateText_BC=BillingCycle_Page.lblNextPaymentDueDate.GetRoProperty("innertext")
End Function

'[Verify Field NextPaymentDueDate displayed as BC]
Public Function verifyNextPaymentDueDateText_BC(strExpectedText)
   bDevPending=false
   bVerifyNextPaymentDueDateText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (BillingCycle_Page.lblNextPaymentDueDate(), strExpectedText, "NextPaymentDueDate")Then
           bVerifyNextPaymentDueDateText=false
       End If
   End If
   verifyNextPaymentDueDateText_BC=bVerifyNextPaymentDueDateText
End Function

'[Get NextStatementDate Label Text On BC]
Public Function getNextStatementDateText_BC()
   bDevPending=false
   getNextStatementDateText_BC=BillingCycle_Page.lblNextStatementDate.GetRoProperty("innertext")
End Function

'[Verify Field NextStatementDate displayed as BC]
Public Function verifyNextStatementDateText_BC(strExpectedText)
   bDevPending=false
   WaitForIcallLoading
   Wait(20) ' To be removed if application performance improved
   bverifyNextStatementDateText_BC=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (BillingCycle_Page.lblNextStatementDate(), strExpectedText, "NextStatementDate")Then
           bverifyNextStatementDateText_BC=false
       End If
   End If
   verifyNextStatementDateText_BC=bverifyNextStatementDateText_BC
End Function

'[Get ServiceRequestProcessdate Label Text On BC]
Public Function getServiceRequestProcessdateText_BC()
   bDevPending=false
   getServiceRequestProcessdateText_BC=BillingCycle_Page.lblServiceRequestProcessdate.GetRoProperty("innertext")
End Function

'[Verify Field ServiceRequestProcessdate displayed as BC]
Public Function verifyServiceRequestProcessdateText_BC(strExpectedText)
   bDevPending=false
   bVerifyServiceRequestProcessdateText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (BillingCycle_Page.lblServiceRequestProcessdate(), strExpectedText, "ServiceRequestProcessdate")Then
           bVerifyServiceRequestProcessdateText=false
       End If
   End If
   verifyServiceRequestProcessdateText_BC=bVerifyServiceRequestProcessdateText
End Function

'[Get ValidationMsg Label Text On BC]
Public Function getValidationMsgText_BC()
   bDevPending=false
   getValidationMsgText_BC=BillingCycle_Page.lblValidationMsg.GetRoProperty("innertext")
End Function

'[Verify Field ValidationMsg displayed as BC]
Public Function verifyValidationMsgText_BC(strExpectedText)
	bDevPending = false
	verifyValidationMsgText_BC = True
	WaitForIcallLoading
	If Not IsNull(strExpectedText) Then
		If BillingCycle_Page.popupPreValidation.exist(5) Then
			If Not VerifyInnerText (BillingCycle_Page.lblValidationMsg(), strExpectedText, "ValidationMsg")Then
				verifyValidationMsgText_BC = false
			Else
				BillingCycle_Page.btnValidataionMsgOK.click
				WaitForIcallLoading
			End If
		Else
			verifyValidationMsgText_BC = false
		End If  
	End If
	WaitForIcallLoading
	WaitForIcallLoading
End Function

'[Verify Field Confirmation Message on Billing Cycle displayed as]
Public Function verifyConfirmationMsgText_BC(strExpectedText)
   bDevPending=false
   bverifyConfirmationMsgText_BC=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (BillingCycle_Page.lblConfirmationMsg(), strExpectedText, "ValidationMsg")Then
           bverifyConfirmationMsgText_BC=false
       End If
   End If
   BillingCycle_Page.btnOK_Confirmation.click
   WaitForIcallLoading
   verifyConfirmationMsgText_BC=bverifyConfirmationMsgText_BC
End Function

'[Select Combobox NewBillingCycle as BC]
Public Function selectNewBillingCycleComboBox_BC(strNewBillingCycle)
   bDevPending=false
   bSelectNewBillingCycleComboBox=true
   If Not IsNull(strNewBillingCycle) Then
       If Not (selectItem_Combobox (BillingCycle_Page.lstNewBillingCycle(), strNewBillingCycle))Then
            LogMessage "WARN","Verification","Failed to select :"&strControlName&" From NewBillingCycle drop down list" ,false
           bSelectNewBillingCycleComboBox=false
       End If
   End If
   selectNewBillingCycleComboBox_BC=bSelectNewBillingCycleComboBox
End Function

'[Verify New Billing Cycle Combobox has Items]
Public Function verifyNewBillingCycleComboboxItems(lstItems)
   bDevPending=false
   bverifyNewBillingCycleComboboxItems=true
   If Not IsNull(lstItems) Then
       If Not verifyComboboxItems (BillingCycle_Page.lstNewBillingCycle(), lstItems, "New Billing Cycle")Then
           bverifyNewBillingCycleComboboxItems=false
       End If
   End If
   verifyNewBillingCycleComboboxItems=bverifyNewBillingCycleComboboxItems
End Function

'[Get selected item from combo box NewBillingCycle On BC]
Public Function getNewBillingCycleSelectedItem_BC()
   bDevPending=false
   getNewBillingCycleSelectedItem_BC=getVadinCombo_SelectedItem(BillingCycle_Page.lstNewBillingCycle)
End Function

'[Verify Combobox NewBillingCycle displayed as BC]
Public Function verifyNewBillingCycleText_BC(strExpectedText)
   bDevPending=false
   bVerifyNewBillingCycleText=true
   If Not IsNull(strExpectedText) Then
       If Not verifyComboSelectItem (BillingCycle_Page.lstNewBillingCycle(), strExpectedText, "NewBillingCycle")Then
           bVerifyNewBillingCycleText=false
       End If
   End If
   verifyNewBillingCycleText_BC=bVerifyNewBillingCycleText
End Function

'[Select Combobox ReasonForChange as BC]
Public Function selectReasonForChangeComboBox_BC(strReasonForChange)
   bDevPending=false
   WaitForIcallLoading
   bSelectReasonForChangeComboBox=true
   If Not IsNull(strReasonForChange) Then
       If Not (selectItem_Combobox (BillingCycle_Page.lstReasonForChangeBC(), strReasonForChange))Then
            LogMessage "WARN","Verification","Failed to select :"&strControlName&" From ReasonForChange drop down list" ,false
           bSelectReasonForChangeComboBox=false
       End If
   End If
   selectReasonForChangeComboBox_BC=bSelectReasonForChangeComboBox
End Function

'[Get selected item from combo box ReasonForChange On BC]
Public Function getReasonForChangeSelectedItem_BC()
   bDevPending=false
   getReasonForChangeSelectedItem_BC=getVadinCombo_SelectedItem(BillingCycle_Page.lstReasonForChangeBC)
End Function

'[Verify Combobox ReasonForChange displayed as BC]
Public Function verifyReasonForChangeText_BC(strExpectedText)
   bDevPending=false
   bVerifyReasonForChangeText=true
   If Not IsNull(strExpectedText) Then
       If Not verifyComboSelectItem (BillingCycle_Page.lstReasonForChangeBC(), strExpectedText, "ReasonForChange")Then
           bVerifyReasonForChangeText=false
       End If
   End If
   verifyReasonForChangeText_BC=bVerifyReasonForChangeText
End Function

'[Get Comment Label Text On BC]
Public Function getCommentText_BC()
   bDevPending=false
   getCommentText_BC=BillingCycle_Page.txtComment.GetRoProperty("innertext")
End Function

'[Verify Field Comment displayed as BC]
Public Function verifyCommentText_BC(strExpectedText)
   bDevPending=false
   bVerifyCommentText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyField( BillingCycle_Page.txtComment(), strExpectedText, "Comment")Then
           bVerifyCommentText=false
       End If
   End If
   verifyCommentText_BC=bVerifyCommentText
End Function

'[Set TextBox Comment on Billing Cycle to]
Public Function setCommentTextbox_BC(strComment)
   bDevPending=False
   strTimeStamp = ""&now
	strComment =strComment &" "&strTimeStamp
	gstrRuntimeCommentStep="Set TextBox Comment on Billing Cycle to"
	gstrParameterNameStep = "TimeStamp"&replace((replace((replace(now,"/","-"))," ","-")),":","-")
	insertDataStore gstrParameterNameStep, strComment
	'insertDataStore "SRComment", strComment
	
   BillingCycle_Page.txtComment.Set(strComment)
   If Err.Number<>0 Then
       setCommentTextbox_BC=false
            LogMessage "WARN","Verification","Failed to Set Text Box :Comment" ,false
       Exit Function
   End If
   setCommentTextbox_BC=true
End Function

'[Verify Combobox NewBillingCycle displayed as after today]
Public Function verifyNewBillingCycle_afterToday(strExpectedText)
   bDevPending=false
   bVerifyNewBillingCycleText=true
    LastStatementDate=BillingCycle_Page.lblAddressLine1.GetRoProperty("innertext")
    PaymentDueDate=BillingCycle_Page.lblAddressLine1.GetRoProperty("innertext")
    NewBillingCycleDate=BillingCycle_Page.lstNewBillingCycle.GetRoProperty("innertext")
    LastStatementDateDiff=DateDiff("m",LastStatementDate,Now)
    PaymentDueDateDiff=DateDiff("m",PaymentDueDate,Now)
    PaymentDueDateCurrentdate=DateDiff("d",PaymentDueDate,Now)
    If LastStatementDateDiff>1 and PaymentDueDateDiff>1 Then 
    	ElseIf LastStatementDateDiff>1 and PaymentDueDateCurrentdate = 0 Then
    		ElseIf LastStatementDateDiff>1  and  PaymentDueDateCurrentdate > 1 Then
              If Not IsNull(strExpectedText) Then
               If Not verifyComboSelectItem (BillingCycle_Page.lstNewBillingCycle(), strExpectedText, "NewBillingCycleDate")Then
                bVerifyNewBillingCycleText=false
               End If
   	          End If
   	 End If
          
   verifyNewBillingCycle_afterToday=bVerifyNewBillingCycleText
End Function


'[Verify Combobox NewBillingCycle displayed as PaymentDate+2]
Public Function verifyNewBillingCycle_PaymentDate2(strExpectedText)
   bDevPending=false
   bVerifyNewBillingCycleText=true
    LastStatementDate=BillingCycle_Page.lblAddressLine1.GetRoProperty("innertext")
    PaymentDueDate=BillingCycle_Page.lblAddressLine1.GetRoProperty("innertext")
    NewBillingCycleDate=BillingCycle_Page.lstNewBillingCycle.GetRoProperty("innertext")
    LastStatementDateDiff=DateDiff("m",LastStatementDate,Now)
    PaymentDueDateDiff=DateDiff("m",PaymentDueDate,Now)
    PaymentDueDateCurrentdate=DateDiff("d",PaymentDueDate,Now)
    If LastStatementDateDiff>1 and PaymentDueDateCurrentdate > 1 Then 
    	ElseIf LastStatementDateDiff=0 and PaymentDueDateDiff < 0 Then
              If Not IsNull(strExpectedText) Then
               If Not verifyComboSelectItem (BillingCycle_Page.lstNewBillingCycle(), strExpectedText, "NewBillingCycleDate")Then
                bVerifyNewBillingCycleText=false
               End If
   	          End If
   	 End If
          
   verifyNewBillingCycle_PaymentDate2=bVerifyNewBillingCycleText
End Function

'[Verify NextStatement Date displayed as DDNewBillingcycle and MMYYcurrentMonth]
Public Function verifyStatementDate_DDNewBillingcycle_MMYYCurrentMonth(strExpectedText)
   bDevPending=false
   bVerifyNewBillingCycleText=true
    LastStatementDate=BillingCycle_Page.lblAddressLine1.GetRoProperty("innertext")
    PaymentDueDate=BillingCycle_Page.lblAddressLine1.GetRoProperty("innertext")
    NewBillingCycleDate=BillingCycle_Page.lstNewBillingCycle.GetRoProperty("innertext")
    LastStatementDateDiff=DateDiff("m",LastStatementDate,Now)
    PaymentDueDateDiff=DateDiff("m",PaymentDueDate,Now)
    PaymentDueDateCurrentdate=DateDiff("d",PaymentDueDate,Now)
    If LastStatementDateDiff>1 and PaymentDueDateCurrentdate > 1 Then 
    
    	ElseIf LastStatementDateDiff=0 and PaymentDueDateDiff < 0 Then
              If Not IsNull(strExpectedText) Then
               If Not verifyComboSelectItem (BillingCycle_Page.lstNewBillingCycle(), strExpectedText, "NewBillingCycleDate")Then
                bVerifyNewBillingCycleText=false
               End If
   	          End If
   	 End If
          
   verifyNewBillingCycle_PaymentDate2=bVerifyNewBillingCycleText
End Function

'[Verify Field Description on Billing Cycle displayed as]
Public Function verifyDescriptionText_BCC(strExpectedText)
   bDevPending=false
   bVerifyDescriptionText=true
   Wait(10)
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (BillingCycle_Page.lblDescription(), strExpectedText, "Description")Then
           bVerifyDescriptionText=false
       End If
   End If
   verifyDescriptionText_BCC=bVerifyDescriptionText
End Function

'[Verify KnowledgeLink On BC]
Public Function VerifyKnowledgelink_BC()
   bDevPending=false
   VerifyKnowledgelink_BC=BillingCycle_Page.lnkKnowledgeBase.GetRoProperty("innertext") 
End Function

'[Verify Field KnowledgeBase on Billing Cycle Screen displayed as]
Public Function verifyKnowledgeBase_BCC(strExpectedLink)
   bDevPending=false
   bVerifyKnowledgeBaseText=true
   Wait(10)
   If Not IsNull(strExpectedLink) Then
		
		Set oDesc_KB = Description.Create()
			'oDesc_KB("micclass").Value = "Link"		
			'strKBLink=BillingCycle_Page.lnkKnowledgeBase.ChildObjects(oDesc_KB)(0).GetROProperty("href")
			strKBLink=BillingCycle_Page.lnkKnowledgeBase.GetROProperty("href")
			strExpectedLink=Replace(strExpectedLink,"@","=")
       If not MatchStr(strKBLink, strExpectedLink)Then
		   LogMessage "RSLT","Verification","Knowledge base link does not matched with expected. Actual : "&strKBLink&" Expected "&strExpectedLink,false
           bVerifyKnowledgeBaseText=false
	   else
	 		LogMessage "RSLT","Verification","Knowledge base link matrched with expected",true
       End If
   End If
   verifyKnowledgeBase_BCC=bVerifyKnowledgeBaseText
End Function

'[Click Link KnowledgeBase On BC]
Public Function clickKnowledgeBase_BC()
   bDevPending=false
   BillingCycle_Page.lnkKnowledgeBase.click
   If Err.Number<>0 Then
       clickKnowledgeBase_BC=false
            LogMessage "WARN","Verification","Failed to Click Button : ValidataionMsgOK" ,false
       Exit Function
   End If
   clickKnowledgeBase_BC=true
End Function

'[Verify Field KnowledgeBase on BC Screen displayed as]
Public Function verifyKnowledgeBase_BC(strExpectedLink)
   bDevPending=false
   bVerifyKnowledgeBaseText=true
   If Not IsNull(strExpectedLink) Then
	'Set oDesc_KB = Description.Create()
	'oDesc_KB("micclass").Value = "Link"		
	'strKBLink=BillingCycle_Page.lnkKnowledgeBase.ChildObjects(oDesc_KB)(0).GetROProperty("href")
     strKBLink=BillingCycle_Page.lnkKnowledgeBase.GetROProperty("href")
			strExpectedLink=Replace(strExpectedLink,"@","=")
       If not MatchStr(strKBLink, strExpectedLink)Then
		   LogMessage "RSLT","Verification","Knowledge base link does not matched with expected. Actual : "&strKBLink&" Expected "&strExpectedLink,false
           bVerifyKnowledgeBaseText=false
	   else
	 		LogMessage "RSLT","Verification","Knowledge base link matrched with expected",true
       End If
   End If
   verifyKnowledgeBase_BC=bVerifyKnowledgeBaseText
End Function


'[Get Notes Label Text in BC]
Public Function getNotesText()
   bDevPending=false
   getNotesText=BillingCycle_Page.txtNotes.GetRoProperty("innertext")
End Function

'[Verify Field Notes on BC displayed as]
Public Function verifyNotesText_BC(strExpectedText)
   bDevPending=false
   bVerifyNotesText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyField(BillingCycle_Page.txtNotes(), strExpectedText, "Notes")Then
           bVerifyNotesText=false
       End If
   End If
   verifyNotesText_BC=bVerifyNotesText
End Function

'[Set TextBox on BC Comment to]
Public Function setCommentTextbox_SL(strComment)
   bDevPending=false
   BillingCycle_Page.txtComment.Set(strComment)
   If Err.Number<>0 Then
       setCommentTextbox_SL=false
            LogMessage "WARN","Verification","Failed to Set Text Box :Comment" ,false
       Exit Function
   End If
   setCommentTextbox_SL=true
End Function

'[Perform Add Notes by clicking Add Notes Button on Billing Cycle Screen]
Public Function addNote_BC(strNote)
   bDevPending=false
   bVerifypopupNotes=true
	Dim bVerifypopupNotes:VerifypopupNotes=true
	
	If not isNull(strNote) Then
		BillingCycle_Page.btnNotesADD.click
		WaitForICallLoading
            If not BillingCycle_Page.popupValidationMessage.exist(5)Then
				LogMessage "WARN","Verification","New Note dialog did not displayed",false
				bVerifypopupNotes=false
			 else
			 strMessage=BillingCycle_Page.lblMaxAllowed.GetROProperty("innerText")
				If not strMessage="Max allowed - 3000" Then
					LogMessage "WARN","Verification","Add New Comment popup dislog incorrectly displayed max allowed character count for comment. Expected : Max allowed - 3000 and Actual: "&strMessage,false
					bVerifypopupNotes=false
				End If
			   ServiceRequest.txtNewComment.set strNote			  
			   ServiceRequest.clickSave_Popup
			  WaitForIcallLoading
		   End If 
		End If 
	addNote_BC=bVerifypopupNotes
End Function

'[Verify row Data in Table Selected Cards for Billing Cycle Change]
Public Function verifytblSelectedCardsContent_BCC(arrRowDataList)
   bDevPending=false
   WaitForIcallLoading
   verifytblSelectedCardsContent_BCC=verifyTableContentList(BillingCycle_Page.tblSelectedCardsHeader,BillingCycle_Page.tblSelectedCardsContent,arrRowDataList,"SelectedCardsContent",false,null,null,null)
End Function

'[Verify Combobox Reason for Change displayed on Billing Cycle as]
Public Function verifyReasonForChange_BCC(strReason)
   bDevPending=false
   bverifyReasonForChange_BCC=true
   If Not IsNull(strReason) Then
       If Not verifyComboSelectItem (BillingCycle_Page.lstReasonForChangeBC(), strReason, "Reason For Change")Then
           bverifyReasonForChange_BCC=false
       End If
   End If
   verifyReasonForChange_BCC=bverifyReasonForChange_BCC
End Function

'[Verify Combobox Reason For Change on Billing Cycle has items]
Public Function verifyReasonForChange_ItemListBCC(lstItems)
   bDevPending=false
   bverifyReasonForChange_ItemListBCC=true
   If Not IsNull(lstItems) Then	
       If Not verifyComboboxItems (BillingCycle_Page.lstReasonForChangeBC(), lstItems, "Reason For Change")Then
           bVerifyReasonForBlockingText=false
       End If
   End If
   verifyReasonForChange_ItemListBCC=bverifyReasonForChange_ItemListBCC
End Function

'[Change Processing Date in Database]
Public Function updateDBCellValue(strDate)
	bupdateDBCellValue=true
	If Ucase(strDate)="TODAY" Then
		If len(Day(CDate(Now)))=1 Then
			strDay="0"&Day(CDate(Now))
		else
			strDay=""&Day(CDate(Now))
		End If
		strDate=""&strDay & " "&monthName(Month(CDate(Now)),true) &" " &Year(CDate(Now))
	End If
	
	strUpdateQuery=updateCellValinDB("update iserve_code_table set code_key_short ='"&strDate&"' where code_id = 'BILL_CYCLE_TEST_DATA'")
	strValue=getDBValForColumn_FE("select code_key_short from iserve_code_table where code_id = 'BILL_CYCLE_TEST_DATA'")(0)
	If not (strValue = strDate) Then
		LogMessage "WARN","Verification","Failed to update cell value to change processing date." ,false
		bupdateDBCellValue=false
	End If
	updateDBCellValue=bupdateDBCellValue
End Function

'[Click button Close on Request Submitted Popup for Billing Cycle]
Public Function clickBtnClose_RequestSubmittedBC()
	bDevPending=false
   BillingCycle_Page.btnCancel_RequestSubmitted.click
   If Err.Number<>0 Then
       clickBtnClose_RequestSubmittedBC=false
            LogMessage "WARN","Verification","Failed to Click Button : Close_RequestSubmitted" ,false
       Exit Function
   End If
   WaitForICallLoading
   Wait(20)
   clickBtnClose_RequestSubmittedBC=true
End Function
