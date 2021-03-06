'[Verify table row Selected Card displayed for Unblock Card]
Public Function VerifytblSelectedCard_UBC(lstSelectedCard)
	VerifytblSelectedCard_UBC = VerifyTableSingleRowData(coUnBlockCard_Page.tblSelectedCardHeader,coUnBlockCard_Page.tblSelectedCardBody,lstSelectedCard,"Selected Card")
End Function

'[Verify list of values displayed for dropdown Reason for Unblock]
Public Function VerifylstAReasonBlocking_UBC(lstBlockReason)
bVerifyValues = False
If Not IsNull(lstBlockReason) Then
bVerifyValues = verifyComboboxItems(coUnBlockCard_Page.lstUnBlockReason,lstBlockReason,"Reason for UnBlocking")		
End If
VerifylstAReasonBlocking_UBC = bVerifyValues	
End Function

'[Set value for Reason for Unblock dropdown displayed]
Public Function SetReasonforBlocking_UBC(strBlockReason)
bVerifytext = True
coUnBlockCard_Page.txtUnBlockReason().set strBlockReason
If Err.Number <> 0 Then
  bVerifytext = False
  LogMessage "WARN","Verification","Failed to Set Reason for UnBlocking in text box", False
  Exit Function
End If
WaitForIServeLoading
SetReasonforBlocking_UBC = bVerifytext
End Function

