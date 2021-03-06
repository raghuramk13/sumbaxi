'*****This is auto generated code using code generator please Re-validate ****************

'[Verify Queue Combobox has Items]
Public Function verifyQueueComboboxItems(lstQueueItems)
   bverifyQueueComboboxItems=true
   If Not IsNull(lstQueueItems) Then
       If Not verifyComboboxItems (ReferralRequest.lstQueue(), lstQueueItems, "Referral Request Queue")Then
           bverifyQueueComboboxItems=false
       End If
   End If
   verifyQueueComboboxItems=bverifyQueueComboboxItems
End Function

'[Verify Queue field value for Referral Request]
Public Function verifyQueueText_RR(StrQueue)
	bverifyQueueText=true
	If Not verifyFieldValue(ReferralRequest.txtQueue(), StrQueue, "Referral Request Queue field") Then
		bverifyQueueText = false
	End If
	verifyQueueText_RR = bverifyQueueText
End Function

'[Verify ORG Text for Referral Request]
Public Function verifyORGText(strORGText)
	bverifyORGText=true
	If Not verifyFieldValue(ReferralRequest.txtORG(), strORGText, "Referral Request ORG Text") Then
		bverifyORGText=false
	End If
	verifyORGText=bverifyORGText
End Function

'[Verify REP ID Text for Referral Request]
Public Function verifyREPIDText(strREPIDText)
	bverifyREPIDText=true
	If Not verifyFieldValue(ReferralRequest.txtRepId(), strREPIDText, "Referral Request REPID Text") Then
		bverifyREPIDText=false
	End If
	verifyREPIDText=bverifyREPIDText
End Function

'[Set text on Org ID text field for Referral Request]
Public Function setORG_ReferralRequest(strORGTxt)
	bsetORG_ReferralRequest=true
	'If Not IsNull(strORGTxt) Then
		ReferralRequest.txtORG().set strORGTxt
	'End If
	WaitForICallLoading
	setORG_ReferralRequest=bsetORG_ReferralRequest
End Function

'[Set text on REP ID text field for Referral Request]
Public Function setREPID_ReferralRequest(strREPID)
	bsetREPID_ReferralRequest=true
	'If Not IsNull(strREPID) Then
		ReferralRequest.txtRepId().set strREPID
	'End If
	WaitForICallLoading
	setREPID_ReferralRequest=bsetREPID_ReferralRequest
End Function

'[Select Combobox Queue Referral Request]
Public Function selectQueueComboBox(strQueue)
   bDevPending=false
   bselectQueueComboBox=true
   If Not IsNull(strQueue) Then
       If Not (selectItem_Combobox (ReferralRequest.lstQueue(), strQueue))Then
            LogMessage "WARN","Verification","Failed to select :"&strControlName&" From Show drop down list" ,false
           bselectQueueComboBox=false
       End If
   End If
   WaitForICallLoading
   selectQueueComboBox=bselectQueueComboBox
End Function

'[Verify error message displayed based on search criteria]
Public Function verifyErrorMessage_RR(strErrorMessage)
bverifyErrorMessage = true
	If Not IsNull(strErrorMessage) Then
 		If Not VerifyInnerText (ReferralRequest.lblErrorMessage(), strErrorMessage, "Validation Error Message")Then
		   bverifyErrorMessage = false
		End If
	End If
	verifyErrorMessage_RR = bverifyErrorMessage
End Function

'[Verify Referral Request table details displayed based on search criteria]
Public Function verifytblSelectedContent_RR(arrRowDataList)
   bverifytable = True 
   bverifytable=verifyTableContentList(ReferralRequest.tblReferralRequestHeader,ReferralRequest.tblReferralRequestContent,arrRowDataList,"SelectedReferralRequestContent",false,null ,null,null)
   verifytblSelectedContent_RR = bverifytable
End Function

'[Verify total records and pagination in Referral Request details table]
Public Function ValidatePagination_ReferralRequest()
 bValidatePagination_RR=true
 bNextPageExist = True
	While bNextPageExist = True
	 intRecordCount = getRecordsCountForColumn(ReferralRequest.tblReferralRequestHeader,ReferralRequest.tblReferralRequestContent,"Status")	
	 iCheck = 10
		If intRecordCount <=iCheck  Then
	     LogMessage "RSLT","Verification","Number of records displayed per page matched with expected. Expected Count is less than or equal to "&iCheck, true   
	     bValidatePagination_RR=true
		 If intRecordCount < iCheck Then
		   	bNextPageExist =matchStr(ReferralRequest.lnkNext.GetROProperty("class"),"enabled")
			If bNextPageExist Then
			LogMessage "WARN","Verification","Next link expected to be disabled if record is less than "&iCheck&". Currently it is enabled.",false
			bValidatePagination_RR=false
			Else
			LogMessage "RSLT","Verification","Next link is disabled as per expectation.",true
			End If
		ElseIf intRecordCount = iCheck Then
			bNextPageExist = matchStr(ReferralRequest.lnkNext.GetROProperty("class"),"enabled")
			If bNextPageExist Then
			   ReferralRequest.lnkNext.Click
			End If
		End If
		Else 
			LogMessage "RSLT","Verification","Number of records displayed per page not matched with expected. Expected Count is less than or equal to 5", false   
			bNextPageExist = False
		End If
   Wend
   ValidatePagination_ReferralRequest = bValidatePagination_RR
End Function

'[Verify Audit Trial]
Public Function VerifyAuditTrial(strDBType, strDBServer, strDBName, strUser, strPassword,strQuery, arrExpectedData)
	Dim bVerifyAuditTrial:bVerifyAuditTrial = true
	verifyDB = verifyDBValue_iCall(strDBType, strDBServer, strDBName, strUser, strPassword,strQuery, arrExpectedData)                    			
    VerifyAuditTrial=bVerifyAuditTrial
End Function
