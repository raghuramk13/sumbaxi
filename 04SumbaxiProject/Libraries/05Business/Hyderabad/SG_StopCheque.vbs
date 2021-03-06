'[Verify the row data for selected account table in stop cheque]
Public Function verifyrowdata_AccSelecStopCheque(arrRowDataList)
	WaitForIcallLoading
	bverifyrowdata_AccSelecStopCheque = verifyTableContentList(StopCheque.tblselectedAccountheader_StopCheq,StopCheque.tblselectedAccountcontent_StopCheq,arrRowDataList,"Selected Account",false,Null,Null,Null)
	verifyrowdata_AccSelecStopCheque = bverifyrowdata_AccSelecStopCheque
End Function

'[Verify the row data for selected cheque table displayed as]
Public Function verifyrowdata_SelectedCheque(arrRowDataList)
	bverifyrowdata_SelectedCheque = verifyTableContentList(StopCheque.tblSelectedCheqheader_StopCheq,StopCheque.tblSelectedCheqcontent_StopCheq,arrRowDataList,"Selected Cheque",false,Null,Null,Null)
	verifyrowdata_SelectedCheque = bverifyrowdata_SelectedCheque
End Function

'[Verify the field available balance displayed in stop cheque]
Public Function verifyfieldAvaiBal_StopCheq(strAvaiBal)
	bverifyfieldAvaiBal_StopCheq = true
   If Not IsNull(strAvaiBal) Then
       If Not VerifyInnerText (StopCheque.lblAvailBal_StopCheq(), strAvaiBal, "Available Balance")Then
           bverifyfieldAvaiBal_StopCheq=false
       End If
   End If
   verifyfieldAvaiBal_StopCheq=bverifyfieldAvaiBal_StopCheq	
End Function

'[Verify the field number of cheque displayed in stop cheque]
Public Function verifyfieldNoCheq_StopCheq(strNoCheque)
	bverifyfieldNoCheq_StopCheq = true
   If Not IsNull(strNoCheque) Then
       If Not VerifyInnerText (StopCheque.lblNoOfCheques(),strNoCheque, "No. of Selected Cheque")Then
           bverifyfieldAvaiBal_StopCheq=false
       End If
   End If
   verifyfieldNoCheq_StopCheq=bverifyfieldNoCheq_StopCheq	
End Function

'[Verify the field service charge displayed in stop cheque]
Public Function verifyServCharge_StopCheq(strServCharge)
  bverifyServCharge_StopCheq = true
   If Not IsNull(strServCharge) Then
       If Not VerifyInnerText (StopCheque.lblServCharge_StopCheq(),strServCharge, "Service Charge")Then
           bverifyServCharge_StopCheq=false
       End If
   End If
   verifyServCharge_StopCheq=bverifyServCharge_StopCheq	
End Function

'[Verify the inline message for service charge displayed as]
Public Function verifyInlineMessage_ServCharge(strInlineMesg)
	'bDevPending=false
   bverifyInlineMessage_ServCharge=true
   If Not IsNull(strInlineMesg) Then
       If Not VerifyInnerText (StopCheque.lblInlineMesg_StopCheq(),strInlineMesg, "InLine Message")Then
           bverifyInlineMessage_ServCharge=false
       End If
   End If
   verifyInlineMessage_ServCharge=bverifyInlineMessage_ServCharge	
End Function

'[Verify the field description is displayed as in stop cheque]
Public Function verifyDesc_StopCheq(strDesc)
	bverifyDesc_StopCheq = true
   If Not IsNull(strDesc) Then
       If Not VerifyInnerText(StopCheque.lblDescription_StopCheq(),strDesc,"Description")Then
           bverifyDesc_StopCheq=false
       End If
   End If
   verifyDesc_StopCheq= bverifyDesc_StopCheq	
End Function

'[Select the value for stop cheque fee waiver]
Public Function selectStopCheqFeeWaiver(strStopFeeWaiver)
   bselectStopCheqFeeWaiver=true
   If Not IsNull(strStopFeeWaiver) Then
       If Not (selectItem_Combobox(StopCheque.lstStopCheqWaiveFee(),strStopFeeWaiver))Then
            LogMessage "RSLT","Verification","Failed to select :"&strStopFeeWaiver&" From Stop Cheque Fee Waiver drop down list" ,false
           bselectStopCheqFeeWaiver=false
       End If
   End If
   WaitForIcallLoading
   selectStopCheqFeeWaiver=bselectStopCheqFeeWaiver
End Function

'[Verify default Fee Waiver Reason in stop cheque page displayed as]
Public Function verifyFeeWaiverReason_StopChq(strFeeWaiverReason_Default)
   bverifyFeeWaiverReason=true
   If Not IsNull(strFeeWaiverReason_Default) Then
       If Not verifyComboSelectItem (StopCheque.lstWaiverReason(),strFeeWaiverReason_Default, "Default Fee Waiver Reason")Then
           bverifyFeeWaiverReason=false
       End If
   End If
   verifyFeeWaiverReason_StopChq=bverifyFeeWaiverReason
End Function

'[Verify Fee Waiver Reason Combobox has Items in stop cheque page]
Public Function verifyFeewaiverCombolist_StopChq(lstItems)
   bverifyFeewaiverCombolist=true
   If Not IsNull(lstItems) Then
       If Not verifyComboboxItems (StopCheque.lstWaiverReason(),lstItems, "List of Fee Waiver Reason")Then
           bverifyFeewaiverCombolist=false
       End If
   End If
   verifyFeewaiverCombolist_StopChq=bverifyFeewaiverCombolist
End Function

'[Select the value for waive reason for stop cheque]
Public Function selectStopCheqFeeWaiverReason_StopChq(strWaivereason)
   bselectFeeWaiverReason = True
   If Not IsNull(strWaivereason) Then
       If Not (selectItem_Combobox(StopCheque.lstWaiverReason(),strWaivereason))Then
           LogMessage "RSLT","Verification","Failed to select :"&strWaivereason&" From Fee Waiver Reason drop down list" ,false
           bselectFeeWaiverReason=false
       End If
   End If
   WaitForIcallLoading
   selectStopCheqFeeWaiverReason_StopChq = bselectFeeWaiverReason
End Function

'[Verify Popup Request Submitted exist for Stop Cheque]
Public Function verifyPopupRequestSubmitted_StopCheq(bExist)
   bDevPending=false
   bActualExist=StopCheque.popupRequestSubmitted_StopCheq.Exist(4)
   If bExist And  bActualExist  Then
       LogMessage "RSLT","Verification","Popup :RequestSubmitted Exists As Expected" ,true
       verifyPopupRequestSubmitted_StopCheq= True
   ElseIf not bExist And  not bActualExist  Then
       LogMessage "RSLT","Verification","Popup :RequestSubmitted does not Exists As Expected" ,true
       verifyPopupRequestSubmitted_StopCheq=True
   ElseIf bExist And  not bActualExist  Then
       LogMessage "WARN","Verification","Popup :RequestSubmitted does not Exists As Expected" ,False
       verifyPopupRequestSubmitted_StopCheq= False
   ElseIf not bExist And   bActualExist  Then
       LogMessage "WARN","Verification","Popup :RequestSubmitted Still Exists" ,False
       verifyPopupRequestSubmitted_StopCheq=False
   End If
   End Function
   
 '[Verify Field CardNumber on Request Submitted Popup for Stop Cheque displayed as]
Public Function verifyCardNumber_RequestSubmittedStopCheq(strCardNumber)
   'bDevPending=false
   bverifyCardNumber_RequestSubmittedStopCheq=true
   'insertDataStore "NewPINUsedCard", ""&strCardNumber
   If Not IsNull(strCardNumber) Then
       If Not VerifyInnerText(StopCheque.lblAccno_popupReqSubmittedStopCheq(),strCardNumber,"Account/Card No.")Then
           bverifyCardNumber_RequestSubmittedStopCheq = false
       End If
   End If
   verifyCardNumber_RequestSubmittedStopCheq=bverifyCardNumber_RequestSubmittedStopCheq
End Function

'[Verify Field ProductDescription on Request Submitted Popup for Stop cheque displayed as]
Public Function verifyProductDescription_StopCheque(strProductDescription)
   'bDevPending=false
   bverifyProductDescription_StopCheque=true
   If Not IsNull(strProductDescription) Then
       If Not VerifyInnerText (StopCheque.lblDesc_popupReqSubmittedStopCheq(),strProductDescription, "Product Description")Then
           bverifyProductDescription_StopCheque=false
       End If
   End If
   verifyProductDescription_StopCheque=bverifyProductDescription_StopCheque
End Function

'[Verify Field Sr Status For Stop Cheque displayed as]
Public Function verifySrStatus_StopCheq(strExpectedText)
   bDevPending=false
   bverifySrStatus_StopCheq=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText(StopCheque.lblSrStatus_popupReqSubmittedStopCheq(),strExpectedText, "Sr Status")Then
           bVerifyStatus_RequestSubmittedText=false
       End If
   End If
   verifySrStatus_StopCheq=bverifySrStatus_StopCheq
End Function

'[Click Button Close Submitted for Stop Cheque]
Public Function clickButtonClose_StopCheque()
   bDevPending=false
   StopCheque.btnClose_popupReqSubmittedStopCheq.click
   waitForIcallLoading
   If Err.Number<>0 Then
       clickButtonClose_StopCheque=false
            LogMessage "WARN","Verification","Failed to Click Button : Close_RequestSubmitted" ,false
       Exit Function
   End If
   clickButtonClose_StopCheque=true
End Function

'[Click on the button Stop Cheque]
Public Function clickButton_StopCheque()
   bDevPending=false
   StopCheque.btnStopCheque.click
   waitForIcallLoading
   If Err.Number<>0 Then
       clickButton_StopCheque=false
            LogMessage "WARN","Verification","Failed to Click Button : Stop Cheque" ,false
       Exit Function
   End If
   clickButton_StopCheque=true
End Function

'[Verify Field Validation Message For Cheque Book Request displayed as]
Public Function verifyValidationMessage_SC(strExpectedText)
   bDevPending=False
   bverifyValidationMessage_SC=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (StopCheque.lblprevalMesg_StopCheq(),strExpectedText, "ValidationMessage")Then
           bverifyValidationMessage_SC=false
       End If
   End If
   StopCheque.btnOk_prevalpopup_StopCheq.Click
   verifyValidationMessage_SC=bverifyValidationMessage_SC
End Function

'[Select all cheques for stop from the cheque status table]
Public Function selectAllCheques_StopCheq(strvalue)
	selectAllCheques_StopCheq = True
	selectCheckBox = true
	Set oDesc = Description.Create
	oDesc("xpath").value =".//div[contains(@class,'dt-header-cell ng-scope')]"
	Set tableColumnsObj = bcCheque_Info.tblChequeStatusHeader.childobjects(oDesc)
	
	Dim strColHeader
	strColHeader=tableColumnsObj(0).GetROProperty("innertext")
	If trim(strColHeader) = trim(strvalue) Then
		'search for the checkbox and click
		Set chkBox = Description.Create
		chkBox("xpath").value = ".//div[contains(@class,'md-container')]"
		Set chkBoxChildObj = tableColumnsObj(0).childobjects(chkBox)
		chkBoxChildObj(0).click
	End If
End Function

'[Select Check box for Single cheque which is to be stopped]
Public Function selectCheques_StopCheq(lstChequesTobeStopped)
	bselectCheques_StopCheq = True
	'split the columns and values	
	intSize = Ubound(lstChequesTobeStopped) + 1
	'intSize = Ubound(lstChequesTobeStopped)
	ReDim arrCol(intSize)
	ReDim arrVal(intSize)
	For iterator = 0 To Ubound(lstChequesTobeStopped)  Step 1
		tempVal = split(lstChequesTobeStopped(iterator),":")
		arrCol(iterator) = tempVal(0)
		arrVal(iterator) = tempVal(1)
	Next	
	'Fetch the total no of rows
	Set objAllRows=getAllRows(bcCheque_Info.tblChequeStatusTable)
	intRow=objAllRows.Count  
	For colLoop = 0 To intSize-1 Step 1
	'Select the checkbox only if arrval() is True
	strColName = arrCol(colLoop)
	If arrval(colLoop) = "True" Then
		'write the function to select the checkbox
		selectChk = selectCheckBox_SC(bcCheque_Info.tblChequeStatusTable,strColName)
		'write the function to read the value
		'strCellVal=getCellTextFor(bcCheque_Info.tblChequeStatusHeader,objAllRows(0),rowLoop,strColName)
		'If strCellVal="" Then
		'	strCellVal = 0
		'End If
		'totalAmt = totalAmt + strCellVal
	End If		
	Next	
	selectCheques_StopCheq = selectChk
End Function

Public Function selectCheckBox_SC(objTableHeader,strColName)
	selectCheckBox = true
	Set oDesc = Description.Create
	oDesc("xpath").value =".//div[contains(@class,'dt-cell ng-scope')]"
	Set tableColumnsObj = objTableHeader.childobjects(oDesc)
	intCol=tableColumnsObj.Count
	For it = 0 To intCol-1 Step 1
		'check which childobject contains the class "csat-icon-checkbox ng-binding"
		Dim strColHeader
		strColHeader=tableColumnsObj(it).GetROProperty("innertext")
		If trim(strColHeader) = trim(strColName) Then
			'search for the checkbox and click
			Set chkBox = Description.Create
			chkBox("xpath").value = ".//div[contains(@class,'md-container')]"
			Set chkBoxChildObj = tableColumnsObj(it).childobjects(chkBox)
			countChk = chkBoxChildObj.Count
			'print countChk
			chkBoxChildObj(0).click
		End If
	Next	
End Function

'[Verify the submit button is enabled for Stop Cheque STP]
Public Function verifySubmitEnabled_StopCheq()
	bverifySubmitEnabled_StopCheq = true
	enabled_Obj = StopCheque.btnSubmit_StopCheq.GetROProperty("disabled")
	If enabled_Obj = 0 Then
 	LogMessage "RSLT","Verification","The button Submit is enabled as expected",True
 	else
 	LogMessage "RSLT","Verification","The button Submit is disabled",False
	 End If
	verifySubmitEnabled_StopCheq = bverifySubmitEnabled_StopCheq
End Function

'[Expand the account when selected account is closed]
Public Function clickAcc_ClosedAccounts()
	bclickAcc_ClosedAccounts = true
	StopCheque.tblCustAcc_ContentClosedAccounts.click
	clickAcc_ClosedAccounts = bclickAcc_ClosedAccounts
End Function



