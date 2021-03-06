'[Verify table row Selected Card displayed for Cancel Card]
Public Function VerifytblSelectedCard_CC(lstSelectedCard)
	VerifytblSelectedCard_CC = VerifyTableSingleRowData(coCancelCard_Page.tblSelectedCardHeader,coCancelCard_Page.tblSelectedCardBody,lstSelectedCard,"Selected Card")
End Function

'[Set value for Reason for Cancellation dropdown displayed]
Public Function SetReasonforCancellation_CC(strCancelReason)
	bVerifytext = False
	coCancelCard_Page.txtCancelReason().set strCancelReason
	If Err.Number <> 0 Then
	  LogMessage "WARN","Verification","Failed to Set Reason for Cancellation in text box", False
	  Exit Function
	Else
	  bVerifytext = True
	End If
	WaitForIServeLoading
	SetReasonforCancellation_CC = bVerifytext
End Function

'[Click On Select All CheckBox displayed in Cancel All cards STP Page]
Public Function Selectcheckbox_CancelAllCards()
	WaitForIServeLoading
	coCancelCard_Page.tblCheckBox.Click 
	If Err.Number <> 0 Then
	  Selectcheckbox_CancelAllCards = False
	  LogMessage "WARN","Verification","Failed to tick checkbox in table header", False
	  Exit Function
	Else
	  Selectcheckbox_CancelAllCards = True
	End If
End Function

'[Verify Validation Failed table displayed in Cancel All cards STP Page]
Public Function VerifyFailedMessage_CancelAllCards(lstVaidtionFailedMsg)
	wait(1)
	bverifyFailedMsg = True 
	If NOT isNull(lstVaidtionFailedMsg) Then
		bverifyFailedMsg = VerifyTableSingleRowData(coCancelCard_Page.tblValidationFailedHeader,coCancelCard_Page.tblValidationFailedContent,lstVaidtionFailedMsg,"Validation Failed Cards")
		If coCommon_Page.btnOK.Exist Then 
		   coCommon_Page.btnOK.Click
		End IF
	End If	
	VerifyFailedMessage_CancelAllCards = bverifyFailedMsg
End Function
