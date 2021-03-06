'[Check the Top Up Details lable as]
Public Function checkTopUpDetailsLable(strTopUpDetailsLable)
	checkTopUpDetailsLable = true
	 If Not IsNull (strTopUpDetailsLable) Then
       checkTopUpDetailsLable = verifyInnerText(TopUpDetails.lbltopUp_h5(),strTopUpDetailsLable, "TopUp Details Lable")
    else
       checkTopUpDetailsLable = false
    End If
End Function

'[Verify Auto Top Up Indicator flag as]
Public Function VerifyAutoTopUpIndicatorFlag(strAutoTopUpIndicatorFlag)
	VerifyAutoTopUpIndicatorFlag = true
	If Not IsNull (strAutoTopUpIndicatorFlag) Then
       VerifyAutoTopUpIndicatorFlag = verifyInnerText(TopUpDetails.lbltopUpAutoNo_div(),strAutoTopUpIndicatorFlag, "Auto TopUp Indicator Flag")
    else
       VerifyAutoTopUpIndicatorFlag = false
    End If
End Function

'[Verify Saving Account Top Up Details Table list data as]
Public Function verifySATopUpDetailsTableList(lstlstSATopUpDetailsTableList)
   verifySATopUpDetailsTableList = verifyTableContentList(TopUpDetails.lbltopUpSaveAcctableheaderEQ, TopUpDetails.lbltopUpSaveAcctablecontentEQ,lstlstSATopUpDetailsTableList,"Saving Account Top Up Details Table List",false,NULL,NULL,NULL)
   WaitForICallLoading
End Function

'[Verify Current Account Top Up Details Table list data as]
Public Function verifyCATopUpDetailsTableList(lstlstCATopUpDetailsTableList)
   verifyCATopUpDetailsTableList = verifyTableContentList(TopUpDetails.lbltopUpCurrAcc_table_header, TopUpDetails.lbltopUpCurrAcc_table_content,lstlstCATopUpDetailsTableList,"Current Account Top Up Details Table List",false,NULL,NULL,NULL)
   WaitForICallLoading
End Function

'[Verify the shortcut buttons on Top Up Details page]
Public Function verifyShortCutButtonTopUpDetailsPage()
	verifyShortCutButtonTopUpDetailsPage = true
	If (TopUpDetails.btncancellation.Exist(1)) Then
		LogMessage "RSLT","Verification","cellation button is available for Top Up Details Page." ,True
	Else
	    LogMessage "WARN","Verification","cellation button is not available for Top Up Details Page. Expected to be Enabled." ,false
	    verifyShortCutButtonTopUpDetailsPage = False
	End If

    If (TopUpDetails.btnmoreServices.Exist(1)) Then
		LogMessage "RSLT","Verification","More Services Button is available for Top Up Details Page." ,True		
	Else
	   LogMessage "WARN","Verification","More Services button is not available for Top Up Details Page. Expected to be Enabled." ,false
	   verifyShortCutButtonTopUpDetailsPage = False
	End If
	WaitForICallLoading
End Function
