'[Select the radio button show type for the memo page]
Public Function selectMemoType_Memo(strMemoType)
	bselectMemoType_Memo=true
	intRadio_Events=Instr(bcVerify_Memo.rbtnTranType.GetROproperty("class"),"disabled-area")
	If intRadio_Events = 0 Then
		bselectRadioButton_rewards=SelectRadioButtonGrp(strMemoType,bcVerify_Memo.rbtnTranType, Array("Memo","Email/SMS Log"))
	Else
		LogMessage "RSLT","Verification","Radio button is disabled by default.",True
	End If
	If Err.Number<>0 Then
       bselectMemoType_Memo=false
          LogMessage "RSLT","Verification","Failed to select radiobutton or radiobutton is disabled" ,True
       Exit Function
   End If
   selectMemoType_Memo = bselectMemoType_Memo
End Function

'[Verify the row data for Memo table displayed as]
Public Function verifyrowdata_MemoDetails(arrRowDataList)
	bverifyrowdata_MemoDetails = true
	verifyrowdata_MemoDetails = verifyTableContentList(bcVerify_Memo.tblMemoDetailHeader,bcVerify_Memo.tblMemoDetailTable,arrRowDataList,"Memo Details",false,Null,Null,Null)
	verifyrowdata_MemoDetails = bverifyrowdata_MemoDetails
End Function

'[Verify the click for memo details link for Memo table displayed as]
Public Function clickMemoDetails_Memo(lstRowData)
	bclickMemoDetails_Memo = true
	clickMemoDetails_Memo = selectTableLink(bcVerify_Memo.tblMemoDetailHeader,bcVerify_Memo.tblMemoDetailTable,lstRowData,"Memo","Memo Details",false,Null,Null,Null)
	clickMemoDetails_Memo = bclickMemoDetails_Memo
End Function

'[Verify the popup memo details and the text displayed as]
Public Function verifypopupMemoDetails_Memo(strMemoDetails)
	bverifypopupMemoDetails_Memo = true
	WaitForICallLoading
	Wait(10)
	If bcVerify_Memo.tblPopupDetailTable.exist Then	
	If Not IsNull(strMemoDetails) Then
	strMemoDetails_new = Replace (strMemoDetails,"@","=")
			If Not VerifyInnerText (bcVerify_Memo.lblMemoDetailsText(), strMemoDetails_new, "Memo Details")Then
				LogMessage "RSLT","Verification","Event Details - Transaction Description:"&strMemoDetails&" is not displayed as expected",false
				bverifypopupMemoDetails_Memo=false
			End If
		End If
	else
		LogMessage "RSLT","Verification","The popup Memo Details is not displayed as expected.",False
		bverifypopupMemoDetails_Memo=false
	End If
	bcVerify_Memo.btnOKMemoDetails.click
	WaitForICallLoading
	  verifypopupMemoDetails_Memo = bverifypopupMemoDetails_Memo
End Function

'[Verify the row data for Email SMS table displayed as]
Public Function verifyrowdata_EmailSmsDetails(arrRowDataList)
	bverifyrowdata_EmailSmsDetails = true
	verifyrowdata_EmailSmsDetails = verifyTableContentList(bcVerify_Memo.tblSMSDetailHeader,bcVerify_Memo.tblSMSDetailTable,arrRowDataList,"Email/SMS Details",false,Null,Null,Null)
	verifyrowdata_EmailSmsDetails = bverifyrowdata_EmailSmsDetails
End Function

'[Verify the click for message details link for EmailSMS table displayed as]
Public Function clickMesgDetails_SMSEmail(lstRowData)
	bclickMesgDetails_SMSEmail = true
	clickMesgDetails_SMSEmail = selectTableLink(bcVerify_Memo.tblSMSDetailHeader,bcVerify_Memo.tblSMSDetailTable,lstRowData,"Memo","Message Details",false,Null,Null,Null)
	WaitForICallLoading
	clickMesgDetails_SMSEmail = bclickMesgDetails_SMSEmail
End Function

'[Click and verify for view customer memo link details]
Public Function clickverify_CustMemoDetails(strCusMemoDetails)
	bclickverify_CustMemoDetails = true
	bcVerify_Memo.lnkViewCustomerMemo.click
	WaitForICallLoading
	
	If bcVerify_Memo.tblPopupDetailTable.exist Then
		If Not IsNull(strCusMemoDetails) Then
			If Not VerifyInnerText (bcVerify_Memo.lblMemoDetailsText(), strMemoDetails, "Memo Details")Then
				LogMessage "RSLT","Verification","Event Details - Transaction Description:"&strMemoDetails&" is not displayed as expected",false
				bverifypopupMemoDetails_Memo=false
			End If
		End If
		else
	         LogMessage "RSLT","Verification","The popup Memo Details is not displayed as expected.",False		
	End If
	bcVerify_Memo.btnOKCustomerMemoDetails.click
	clickverify_CustMemoDetails = bclickverify_CustMemoDetails
End Function

'[Check the radiobutton email/sms is disabled for cashline and loans]
Public Function verifyEmailSms_disabled()
	bverifyEmailSms_disabled = true
	
	enabled_Obj = bcVerify_Memo.rbtnSMSLog.GetROProperty("disabled")
	If enabled_Obj = 0 Then
		LogMessage "RSLT","Verification","The radiobutton email sms is disabled as expected",True
 	else
 	LogMessage "RSLT","Verification","The radiobutton email sms is not disabled as expected",False
	End If
End Function

'[Click the button add memo from memo page and create a memo]
Public Function clickAddMemo_MemoSubmit(strLetterCode,strComment)
	bclickAddMemo_MemoSubmit = true
	bcAddMemo.Add_Memo.click
	If bcAddMemo.popupAddMemo.exist Then
		bcAddMemo.txtLetterCode.set strLetterCode
		bcAddMemo.txtComment.set strComment
		bcAddMemo.btnSubmit.click
		WaitForICallLoading
		else
		LogMessage "RSLT","Verification","The add memo button was not clicked successfully.",False
		bclickAddMemo_MemoSubmit = false
	End If
	clickAddMemo_MemoSubmit = bclickAddMemo_MemoSubmit
End Function

'[Check the submit button is disabled when all mandatory fields not filled]
Public Function verifySubmitDisabled_AddMemo()
	bverifySubmitDisabled_AddMemo = true
	enabled_ObjSubmit = bcAddMemo.btnSubmit.GetROProperty("disabled")
	If enabled_ObjSubmit = 0 Then
		LogMessage "RSLT","Verification","The button Submit is disabled as expected",True
 	else
 	LogMessage "RSLT","Verification","The button Submit is not disabled as expected",False
	End If
	verifySubmitDisabled_AddMemo = bverifySubmitDisabled_AddMemo
End Function

'[Click the cancel button for the add memo]
Public Function clickCancel_AddMemo()
	bDevPending=False
   bcAddMemo.btnCancel.click
   If Err.Number<>0 Then
       clickCancel_AddMemo=false
            LogMessage "RSLT","Verification","Failed to Click Button : Cancel" ,false
       Exit Function
   End If
   clickCancel_AddMemo=true
End Function

'[Click the add memo button on the screen displayed as]
Public Function clickAddMemo()
	bclickAddMemo = true
	bcAddMemo.Add_Memo.click
	If bcAddMemo.popupAddMemo.exist Then
		LogMessage "RSLT","Verification","Add memo button clicked successfully" ,true
		else
		LogMessage "RSLT","Verification","Add memo button not clicked successfully" ,false
	End If
	clickAddMemo = bclickAddMemo
End Function
