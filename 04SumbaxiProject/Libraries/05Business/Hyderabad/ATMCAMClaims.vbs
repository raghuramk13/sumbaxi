'*****This is auto generated code using code generator please Re-validate ****************

'[Select Combobox File Mode Type in ATM CAM Transaction Screen]
Public Function selectFileMode_Claims(strFileMode)
	bselectFileMode_Claims=true
	If Not IsNull(strFileMode) Then
       If Not (selectItem_Combobox (Claims.lstFileMode(), strFileMode))Then
            LogMessage "WARN","Verification","Failed to select :"&strFileMode&" From File Mode drop down list" ,false
           bselectFeeReversalType_FR=false
       End If
	End If
	WaitForICallLoading
	selectFileMode_Claims=bselectFileMode_Claims
End Function

'[Select Combobox ATM CAM Card No in ATM CAM Transaction Screen]
Public Function selectATMCAMCardNo_Claims(strAccountNo)
	bselectATMCAMCardNo_Claims=true
	If Not IsNull(strAccountNo) Then
       If Not (selectItem_Combobox (Claims.lstATMCAMCardNo(), strAccountNo))Then
            LogMessage "WARN","Verification","Failed to select :"&strAccountNo&" From ATM CAM Card No drop down list" ,false
           bselectATMCAMCardNo_Claims=false
       End If
	End If
	WaitForICallLoading
	selectATMCAMCardNo_Claims=bselectATMCAMCardNo_Claims
End Function

'[Select Combobox Terminal ID in ATM CAM Transaction Screen]
Public Function selectTerminalID_Claims(strTerminalID)
	bselectTerminalID_Claims=true
	If Not IsNull(strTerminalID) Then		
       If Not (selectItem_Combobox1 (Claims.lstTerminalID(),Claims.txtTerminalID, strTerminalID))Then
            LogMessage "WARN","Verification","Failed to select :"&strTerminalID&" From Terminal ID drop down list" ,false
           bselectTerminalID_Claims=false
       End If		
	End If
	WaitForICallLoading
	selectTerminalID_Claims=bselectTerminalID_Claims
End Function

'[Select Combobox Duration in ATM CAM Transaction Screen]
Public Function selectDuration_Claims(strDuration)
	bselectDuration_Claims=true
	If Not IsNull(strDuration) Then
       If Not (selectItem_Combobox1 (Claims.lstDuration(),Claims.txtDuration(), strDuration))Then
            LogMessage "WARN","Verification","Failed to select :"&strDuration&" From Duration drop down list" ,false
           bselectDuration_Claims=false
       End If
	End If
	WaitForICallLoading
	selectDuration_Claims=bselectDuration_Claims
End Function

'[Click on Go button from ATM CAM Transaction screen]
Public Function clickbtnGO_Claims()
	clickbtnGO_Claims=true
	Claims.btnGo.Click
	If Err.Number<>0 Then
       clickbtnGO_Claims=false
       LogMessage "WARN","Verification","Failed to Click Button  : Go" ,false
       Exit Function
	End If
	WaitForICallLoading
	Wait 1
End Function

'[Click on Go button of the Terminal ID]
Public Function clickbtnGO_TerminalID()
	clickbtnGO_TerminalID=true
	Claims.btnGoTerminalID.Click
	If Err.Number<>0 Then
       clickbtnGO_TerminalID=false
       LogMessage "WARN","Verification","Failed to Click Button in Terminal ID : Go" ,false
       Exit Function
	End If
	WaitForICallLoading
	Wait 1
End Function

'[Click on Claims button from ATM CAM Claims screen]
Public Function clickbtnClaims_Claims()
	clickbtnClaims_Claims=true
	Claims.btnClaims.Click
	If Err.Number<>0 Then
       clickbtnClaims_Claims=false
       LogMessage "WARN","Verification","Failed to Click Button  : Claims" ,false
       Exit Function
	End If
	WaitForICallLoading
	Wait 1
End Function

'[Select Action Menu Claims from Transaction Record Details on Claims Screen]
Public Function selectClaims_Claims(lstTransactionRecordDetails)
   bDevPending=False
   bselectClaims_Claims=true
 	With Claims
		  bselectClaims_Claims= selectTableSubMenu(.tblTransactionDetailsHeader,.tblTransactionDetailsContent,lstTransactionRecordDetails,"Transaction Record Details","Action",false,.btnNext,.lnkNext,.btnPrevious,"Claims",false)
	End With
	If bDisabled Then
		LogMessage "RSLT", "Verification","Claims action menu is not enabled",false
		bselectClaims_Claims=false
	End If
	WaitForICallLoading
	Wait 1
    selectClaims_Claims=bselectClaims_Claims
End Function

'[Verify row Data in Table SelectedCards for Claims]
Public Function verifytblSelectedCardsContent_Claims(arrRowDataList)
   bDevPending=false 
   verifytblSelectedCardsContent_Claims=verifyTableContentList(Claims.tblSelectedCardsHeader,Claims.tblSelectedCardsContent,arrRowDataList,"SelectedCardsContent",false,null ,null,null)
End Function

'[Verify Account Card Number on Claims Screen]
Public Function verifyAccountCardNumber_Claims(strAccountNo)
	bverifyAccountNumber_Claims=true
	'strAccountNo=replace(strAccountNo,"-","")
	If Not IsNull(strAccountNo) Then
       If Not VerifyInnerText (Claims.lblAccountCardNo(), strAccountNo, "Account Number")Then
           bverifyAccountNumber_Claims=false
       End If
   End If
   verifyAccountCardNumber_Claims=bverifyAccountNumber_Claims
End Function

'[Verify Terminal ID on Claims Screen]
Public Function verifyTerminalID_Claims(strTerminalID)
	bverifyTerminalID_Claims=true
	If Not IsNull(strTerminalID) Then
       If Not VerifyInnerText (Claims.lblTerminalID(), strTerminalID, "Terminal ID")Then
           bverifyTerminalID_Claims=false
       End If
   End If
   verifyTerminalID_Claims=bverifyTerminalID_Claims
End Function

'[Verify Requested Amount on Claims Screen]
Public Function verifyRequestedAmount_Claims(strRequestedAmount)
	bverifyRequestedAmount_Claims=true
	If Not IsNull(strRequestedAmount) Then
       If Not VerifyInnerText (Claims.lblRequestedAmount(), strRequestedAmount, "Requested Amount")Then
           bverifyRequestedAmount_Claims=false
       End If
   End If
   verifyRequestedAmount_Claims=bverifyRequestedAmount_Claims
End Function

'[Verify Received Amount on Claims Screen]
Public Function verifyReceivedAmount_Claims(strReceivedAmount)
	bverifyReceivedAmount_Claims=true
	If Not IsNull(strReceivedAmount) Then
       If Not VerifyInnerText (Claims.lblReceivedAmount(),strReceivedAmount, "Received Amount")Then
           bverifyReceivedAmount_Claims=false
       End If
   End If
   verifyReceivedAmount_Claims=bverifyReceivedAmount_Claims
End Function

'[Verify Denial Code on Claims Screen]
Public Function verifyDenialCode_Claims(strDenialCode)
	bverifyDenialCode_Claims=true
	If Not IsNull(strDenialCode) Then
       If Not VerifyInnerText (Claims.lblDenialCode(), strDenialCode, "Denial Code")Then
           bverifyDenialCode_Claims=false
       End If
   End If
   verifyDenialCode_Claims=bverifyDenialCode_Claims
End Function

'[Verify Account Number on Claims Screen]
Public Function verifyAccountNo_Claims(strAccountNo)
	bverifyAccountNo_Claims=true
	If Not IsNull(strAccountNo) Then
       If Not VerifyInnerText (Claims.lblAccountNo(), strAccountNo, "Account Number")Then
           bverifyAccountNo_Claims=false
       End If
   End If
   verifyAccountNo_Claims=bverifyAccountNo_Claims
End Function

'[Verify No Account Info InLine Message on Claims Screen]
Public Function verifyInlineInfo_Claims(strInLineMessage)
	bverifyInlineInfo_Claims=true
	If Not IsNull(strInLineMessage) Then
       If Not VerifyInnerText (Claims.lblNoAcctInfoLabel(), strInLineMessage, "InLine Message")Then
           bverifyInlineInfo_Claims=false
       End If
   End If
   verifyInlineInfo_Claims=bverifyInlineInfo_Claims
End Function

'[Select Combobox Claims Request Type in Claims Screen]
Public Function selectClaimsRequestType_Claims(strClaimsRequestType)
	bselectClaimsRequestType_Claims=true
	If Not IsNull(strClaimsRequestType) Then
       If Not (selectItem_Combobox (Claims.lstClaimsRequestType(), strClaimsRequestType))Then
            LogMessage "WARN","Verification","Failed to select :"&strClaimsRequestType&" From Claims Request Type drop down list" ,false
           bselectClaimsRequestType_Claims=false
       End If
	End If
	WaitForICallLoading
	selectClaimsRequestType_Claims=bselectClaimsRequestType_Claims
End Function

'[Verify Claims Request Type Combobox has Items]
Public Function verifyClaimsRequestTypeComboboxItems(lstItems)
   bDevPending=false
   bverifyClaimsRequestTypeComboboxItems=true
   If Not IsNull(lstItems) Then
       If Not verifyComboboxItems (Claims.lstClaimsRequestType(),lstItems, "Claims Request Type")Then
           bverifyClaimsRequestTypeComboboxItems=false
       End If
   End If
   verifyClaimsRequestTypeComboboxItems=bverifyClaimsRequestTypeComboboxItems
End Function

'[Set TextBox Received Amount on Claims Screen]
Public Function setReceivedAmount_Claims(strReceivedAmount)
   Claims.txtReceivedAmount.Set(strReceivedAmount)
   If Err.Number<>0 Then
       setReceivedAmount_Claims=false
       LogMessage "WARN","Verification","Failed to Set Text Box :Received Amount" ,false
       Exit Function
   End If
   setReceivedAmount_Claims=true
End Function

'[Verify TextBox Received Amount exist in Claims Screen]
Public Function verifyReceivedAmount_Exist()
	bverifyReceivedAmount_Exist=true
	If not (Claims.txtReceivedAmount().Exist) Then
		LogMessage "WARN", "Verification","Received Amount Text Field not available on screen. Expected to be available.", false
		bverifyReceivedAmount_Exist=false
	End If
	verifyReceivedAmount_Exist=bverifyReceivedAmount_Exist
End Function

'[Verify Field Requested Amount from the label to text field]
Public Function verifyRequestedAmount_RunTime()
   bDevPending=False
   bverifyRequestedAmount_RunTime=true
   strReceivedAmount_label=Claims.lblReceivedAmount.GetROProperty("innertext")
   strReceivedAmount_txtField=Claims.txtReceivedAmount.GetROProperty("value")
   If not strReceivedAmount_label = strReceivedAmount_txtField Then
   	LogMessage "WARN", "Verification","Received Amount in Text Field not matching with Received Amount from label.", false
		bverifyRequestedAmount_RunTime=false
   End If
   verifyRequestedAmount_RunTime=bverifyRequestedAmount_RunTime
End Function

'[Set TextBox Claims Amount on Claims Screen]
Public Function setClaimsAmount_Claims(strClaimsAmount)
   Claims.txtClaimsAmount.Set(strClaimsAmount)
   If Err.Number<>0 Then
       setClaimsAmount_Claims=false
       LogMessage "WARN","Verification","Failed to Set Text Box :Claims Amount" ,false
       Exit Function
   End If
   setClaimsAmount_Claims=true
End Function

'[Select Checkbox No Reversal in CPS from Claims screen]
Public Function selectCheckBoxNoReversalinCPS_Claims()
	Claims.chkNoReversalinCPS.set("ON")
	If Err.Number<>0 Then
       selectCheckBoxNoReversalinCPS_Claims=false
       LogMessage "WARN","Verification","Failed to Click CheckBox: No Reversal in CPS" ,false
       Exit Function
   End If
    selectCheckBoxNoReversalinCPS_Claims=true
	WaitForICallLoading
End Function

'[Verify Button Submit is enabled on Claims SR Screen]
Public Function VerifybtnSubmit_Claims(bEnabled)
	bDevPending=False
   bVerifybtnSubmit_Claims=true
	intBtnSubmit=Instr(Claims.btnSubmit.object.getAttribute("disabled"),"disabled")
	If bEnabled Then
		If  intBtnSubmit=0 Then
			LogMessage "RSLT","Verification","Submit button is enable as per expectation.",True
			bVerifybtnSubmit_Claims=true
		Else
			LogMessage "WARN","Verifiation","Submit button is disable. Expected to be enable.",false
			bVerifybtnSubmit_Claims=false
		End If
	else
		If  intBtnSubmit<>0 Then
			LogMessage "RSLT","Verification","Submit button is disabled as per expectation.",True
			bVerifybtnSubmit_Claims=true
		Else
			LogMessage "WARN","Verifiation","Submit button is Enabled. Expected to be disabled.",false
			bVerifybtnSubmit_Claims=false
		End If
	End If
	VerifybtnSubmit_Claims=bVerifybtnSubmit_Claims
End Function

'[Verify Received Amount InLine Message on Claims Screen]
Public Function verifyInlineReceivedAmount_Claims(strInLineMessage)
	bverifyInlineReceivedAmount_Claims=true
	If Not IsNull(strInLineMessage) Then
       If Not VerifyInnerText (Claims.lblInLineMessage_ReceivedAmount(), strInLineMessage, "Received Amount")Then
           bverifyInlineReceivedAmount_Claims=false
       End If
   End If
   verifyInlineReceivedAmount_Claims=bverifyInlineReceivedAmount_Claims
End Function

'[Verify Claims Amount InLine Message on Claims Screen]
Public Function verifyInlineClaimsAmount_Claims(strInLineMessage)
	verifyInlineClaimsAmount_Claims=true
	If Not IsNull(strInLineMessage) Then
       If Not VerifyInnerText (Claims.lblInLineMessage_ClaimsAmount(), strInLineMessage, "Claims Amount")Then
           bverifyInlineClaimsAmount_Claims=false
       End If
   End If
   verifyInlineClaimsAmount_Claims=bverifyInlineClaimsAmount_Claims
End Function

'[Verify Received Amount field is blank in Claims Screen]
Public Function verifyReceivedAmountBlank_Claims()
	bverifyReceivedAmount=true
	strReceivedAmount=Claims.txtReceivedAmount.GetROProperty("innertext")
	If Not strReceivedAmount = "" Then
		LogMessage "WARN", "Verification","Received Amount is not blank as expected.",False
		bverifyReceivedAmount=false
	End If
	verifyReceivedAmountBlank_Claims=bverifyReceivedAmount
End Function

'[Verify TextBox Deposit Amount exist in Claims Screen]
Public Function verifyDepositAmount_Exist()
	bverifyDepositAmount_Exist=true
	If not (Claims.txtDepositAmount().Exist) Then
		LogMessage "WARN", "Verification","Deposit Amount Text Field not available on screen. Expected to be available.", false
		bverifyDepositAmount_Exist=false
	End If
	verifyDepositAmount_Exist=bverifyDepositAmount_Exist
End Function

'[Set TextBox Deposit Amount on Claims Screen]
Public Function setDepositAmount_Claims(strDepositAmount)
   Claims.txtDepositAmount.Set(strDepositAmount)
   If Err.Number<>0 Then
       setDepositAmount_Claims=false
       LogMessage "WARN","Verification","Failed to Set Text Box :Deposit Amount" ,false
       Exit Function
   End If
   setDepositAmount_Claims=true
End Function

'[Verify Deposit Amount InLine Message on Claims Screen]
Public Function verifyInlineDepositAmount_Claims(strInLineMessage)
	bverifyInlineDepositAmount_Claims=true
	If Not IsNull(strInLineMessage) Then
       If Not VerifyInnerText (Claims.lblInLineMessage_DepositAmount(), strInLineMessage, "Deposit Amount")Then
           bverifyInlineDepositAmount_Claims=false
       End If
   End If
   verifyInlineDepositAmount_Claims=bverifyInlineDepositAmount_Claims
End Function

'[Verify Claims Amount field is blank in Claims Screen]
Public Function verifyClaimAmount()
	bverifyClaimAmount=true
	strReceivedAmount=Claims.txtClaimsAmount.GetROProperty("innertext")
	If Not strReceivedAmount = "" Then
		LogMessage "WARN", "Verification","Claim Amount is not blank as expected.",False
		bverifyClaimAmount=false
	End If
	verifyClaimAmount=bverifyClaimAmount
End Function

'[Select Checkbox Undefined Amount from Claims screen]
Public Function selectCheckBoxUndefinedAmount_Claims()
	'Claims.chkUndefinedAmount.set("ON")
	Claims.chkUndefinedAmount.Click
	If Err.Number<>0 Then
       selectCheckBoxUndefinedAmount_Claims=false
       LogMessage "WARN","Verification","Failed to Click CheckBox: No Reversal in CPS" ,false
       Exit Function
   End If
    selectCheckBoxUndefinedAmount_Claims=true
	WaitForICallLoading
	Wait 1
End Function

'[Set TextBox From Amount on Claims Screen]
Public Function setFromAmount_Claims(strFromAmount)
  If Not IsNull (strFromAmount) Then
   Claims.txtFromAmount.Set(strFromAmount)
   If Err.Number<>0 Then
       setFromAmount_Claims=false
       LogMessage "WARN","Verification","Failed to Set Text Box :From Amount" ,false
       Exit Function
   End If
 End If 
   setFromAmount_Claims=true
End Function

'[Set TextBox To Amount on Claims Screen]
Public Function setToAmount_Claims(strToAmount)
 If Not IsNull (strToAmount) Then
   Claims.txtToAmount.Set(strToAmount)
   If Err.Number<>0 Then
       setToAmount_Claims=false
       LogMessage "WARN","Verification","Failed to Set Text Box :To Amount" ,false
       Exit Function
   End If
  End If 
   setToAmount_Claims=true
End Function

'[Verify From Amount InLine Message on Claims Screen]
Public Function verifyInlineFromToAmount_Claims(strInLineMessage)
	bverifyInlineFromToAmount_Claims=true
	If Not IsNull(strInLineMessage) Then
       If Not VerifyInnerText (Claims.lblInLineMessage_FromAmount(), strInLineMessage, "From Amount")Then
           bverifyInlineFromToAmount_Claims=false
       End If
   End If
   verifyInlineFromToAmount_Claims=bverifyInlineFromToAmount_Claims
End Function

'[Click another tab]
Public Function clickAnotherTab()
	Claims.txtContactPerson.Click
End Function

'[Verify To Amount InLine Message on Claims Screen]
Public Function verifyInlineToAmount_Claims(strInLineMessage)
	bverifyInlineToAmount_Claims=true
	If Not IsNull(strInLineMessage) Then
       If Not VerifyInnerText (Claims.lblInLineMessage_ToAmount(), strInLineMessage, "To Amount")Then
           bverifyInlineToAmount_Claims=false
       End If
   End If
   verifyInlineToAmount_Claims=bverifyInlineToAmount_Claims
End Function

'[Verify Caller Mobile Number field is blank in Claims Screen]
Public Function verifyCallerMobileNumber()
	bverifyCallerMobileNumber=true
	strCallerMobileNumber=Claims.txtCallerMobileNumber.GetROProperty("innertext")
	If Not strCallerMobileNumber = "" Then
		LogMessage "WARN", "Verification","Caller Mobile Number is not blank as expected.",False
		bverifyCallerMobileNumber=false
	End If
	verifyCallerMobileNumber=bverifyCallerMobileNumber
End Function

'[Verify Caller Mobile Number field on Claims Screen]
Public Function verifyCallerMobileNumber_Claims(strCallerMobileNumber)
	bverifyCallerMobileNumber_Claims=true
	If Not IsNull(strCallerMobileNumber) Then
       If Not VerifyInnerText (Claims.txtCallerMobileNumber(), strCallerMobileNumber, "Caller Mobile Number")Then
           bverifyCallerMobileNumber_Claims=false
       End If
   End If
   verifyInlineFromToAmount_Claims=bverifyCallerMobileNumber_Claims
End Function

'[Verify Contact Person field is blank in Claims Screen]
Public Function verifyContactPerson()
	bverifyContactPerson=true
	strContactPerson=Claims.txtContactPerson.GetROProperty("innertext")
	If Not strContactPerson = "" Then
		LogMessage "WARN", "Verification","Contact Person is not blank as expected.",False
		bverifyContactPerson=false
	End If
	verifyContactPerson=bverifyContactPerson
End Function

'[Verify Contact Person field on Claims Screen]
Public Function verifyContactPerson_Claims(strContactPerson)
	bverifyContactPerson_Claims=true
	If Not IsNull(strContactPerson) Then
'       If Not VerifyInnerText (Claims.txtContactPerson(), strContactPerson, "Contact Person")Then
'           bverifyContactPerson_Claims=false
'       End If
		If Claims.txtContactPerson().GetRoProperty("value")<> strContactPerson Then
			bverifyContactPerson_Claims=false
			LogMessage "WARN","Verifiation","SMS Checkbox is disable. Expected to be enable.",false
		End If
   End If
   verifyContactPerson_Claims=bverifyContactPerson_Claims
End Function

'[Verify Receiver Mobile Number field on Claims Screen]
Public Function verifyReceiverMobileNumber_Claims(strReceiverMobileNumber)
	bverifyReceiverMobileNumber_Claims=true
	If Not IsNull(strReceiverMobileNumber) Then
       If Not VerifyInnerText (Claims.lblReceiverMobileNumber(), strReceiverMobileNumber, "Receiver Mobile Number")Then
           bverifyReceiverMobileNumber_Claims=false
       End If
   End If
   verifyReceiverMobileNumber_Claims=bverifyReceiverMobileNumber_Claims
End Function

'[Verify CheckBox SMS is enable on Claims SR Screen]
Public Function VerifychkSMS_Claims(bEnabled)
	bDevPending=False
   bVerifychkSMS_Claims=true
	intchkSMS=Instr(Claims.chkSMS.GetROproperty("outerhtml"),("v-checkbox-disabled"))
	If bEnabled Then
		If  intchkSMS=0 Then
			LogMessage "RSLT","Verification","SMS Checkbox is enable as per expectation.",True
			bVerifychkSMS_Claims=true
		Else
			LogMessage "WARN","Verifiation","SMS Checkbox is disable. Expected to be enable.",false
			bVerifychkSMS_Claims=false
		End If
	else
		If  intchkSMS<>0 Then
			LogMessage "RSLT","Verification","SMS Checkbox is disabled as per expectation.",True
			bVerifychkSMS_Claims=true
		Else
			LogMessage "WARN","Verifiation","SMS Checkbox is Enabled. Expected to be disabled.",false
			bVerifychkSMS_Claims=false
		End If
	End If
	VerifychkSMS_Claims=bVerifychkSMS_Claims
End Function

'[Verify Description field on Claims Screen]
Public Function verifyDescription_Claims(strDescription)
	bverifyDescription_Claims=true
	If Not IsNull(strDescription) Then
       If Not VerifyInnerText (Claims.lblDescription(), strDescription, "Description")Then
           bverifyDescription_Claims=false
       End If
   End If
   verifyDescription_Claims=bverifyDescription_Claims
End Function

'[Verify Field KnowledgeBase on Claims SR Screen displayed as]
Public Function verifyKnowledgeBase_Claims(strExpectedLink)
   bDevPending=false
   bverifyKnowledgeBase_Claims=true
   If Not IsNull(strExpectedLink) Then		
		Set oDesc_KB = Description.Create()
			oDesc_KB("micclass").Value = "Link"		
			strKBLink=Claims.lnkKnowledgeBase.ChildObjects(oDesc_KB)(0).GetROProperty("href")
			strExpectedLink=Replace(strExpectedLink,"@","=")
       If not MatchStr(strKBLink, strExpectedLink)Then
		   LogMessage "RSLT","Verification","Knowledge base link does not matched with expected. Actual : "&strKBLink&" Expected "&strExpectedLink,false
           bverifyKnowledgeBase_Claims=false
	   else
	 		LogMessage "RSLT","Verification","Knowledge base link matrched with expected",true
       End If
   End If
   verifyKnowledgeBase_Claims=bverifyKnowledgeBase_Claims
End Function

'****************************************** For ATM CAM Enquiry **********************************'
'[Verify Day Combox has Items]
Public Function verifyDayComboboxItems(strlstDay)
   bDevPending=false
   bverifyDayComboboxItems=true
   If Not IsNull(strlstDay) Then
       If Not verifyComboboxItems (Claims.lstDay(), strlstDay, "Day has items")Then
           bverifyDayComboboxItems=false
       End If
   End If
   verifyDayComboboxItems=bverifyDayComboboxItems
End Function

'[Set the Day as]
Public Function setDay(strDay)
	bDevPending=false
	bsetDay = true
	If Not IsNull(strDay) Then
		If not (selectItem_Combobox(Claims.lstDay(),strDay))Then
			LogMessage "WARN","Verification","Failed to select :"&strDay&" From the drop down list",false
			bsetDay = false
		End If
	End If
	setDay = bsetDay
End Function

'[Select Transaction Info from Transaction Record Details on Claims Screen]
Public Function selectTranInfo_Claims(lstTransactionRecordDetails)
   bDevPending=False
   bselectTranInfo_Claims=true
 	With Claims
		  'bselectTranInfo_Claims= selectTableSubMenu(.tblTransactionDetailsHeader,.tblTransactionDetailsContent,lstTransactionRecordDetails,"Transaction Record Details","Transaction Info",True,.btnNext,.lnkNext,.btnPrevious,"Claims",bDisabled)
		  'bselectTranInfo_Claims = getRowForColumn_Pagination(.tblTransactionDetailsHeader,.tblTransactionDetailsContent,lstTransactionRecordDetails,"Transaction Info",True,.lnkNext,.lnkNext1,.lnkPrevious)
		  bselectTranInfo_Claims = selectTableLink(.tblTransactionDetailsHeader,.tblTransactionDetailsContent,lstTransactionRecordDetails,"Transaction Record Details" ,"Transaction Info",false,null,null,null)
	End With
	If bDisabled Then
		LogMessage "RSLT", "Verification","Claims action menu is not enabled",false
		bselectTranInfo_Claims=false
	End If
	WaitForICallLoading
	Wait 1
    selectTranInfo_Claims=bselectTranInfo_Claims
End Function

'[Select the Terminal ID Radio Button]
Public Function selectTerminalIDRadioButton()
	bDevPending=False
	bselectTerminalIDRadioButton = true
	Claims.rbtn_TerminalId().Click	
	selectTerminalIDRadioButton = bselectTerminalIDRadioButton
End Function

'[Verify the Inline Messge for ATM CAM]
Public Function verifyInlineMsgCardNo(strInlineMsg)
	bDevPending=False
	bverifyInlineMsgCardNo = true
	If Not IsNull(strInlineMsg) Then
       If Not VerifyInnerText (Claims.txtCardNoMsg(), strInlineMsg, "Inline Card Number")Then
           bverifyInlineMsgCardNo=false
       End If
   End If
   verifyInlineMsgCardNo = bverifyInlineMsgCardNo
End Function

'[Perform Add Notes by clicking Add Notes Button on ATM CAM Screen]
Public Function addNote_ATMCAM(strNote)
   bDevPending=false
   bVerifypopupNotes=true
   Dim bVerifypopupNotes:VerifypopupNotes=true
	
	If not isNull(strNote) Then
		Claims.btnAddNotes.click
		WaitForICallLoading
            If not   Claims.popupVerification.exist(5)Then
				LogMessage "WARN","Verification","New Note dialog did not displayed",false
				bVerifypopupNotes=false
			 else
			 strMessage=Claims.lblMaxAllowed.GetROProperty("innerText")
				If not strMessage="Max allowed - 3000" Then
					LogMessage "WARN","Verification","Add New Comment popup dislog incorrectly displayed max allowed character count for comment. Expected : Max allowed - 3000 and Actual: "&strMessage,false
					bVerifypopupNotes=false
				End If
			   Claims.txtNewComment_Notes.set strNote
			  
				   ServiceRequest.clickSave_Popup
			  WaitForIcallLoading
		   End If 
		End If 
	addNote_ATMCAM=bVerifypopupNotes
End Function

'[Click Button Submit on ATM CAM Screen]
Public Function clickButtonSubmit_ATMCAM()
   bDevPending=false
   Claims.btnSubmit.click
   If Err.Number<>0 Then
       clickButtonSubmit_ATMCAM=false
            LogMessage "WARN","Verification","Failed to Click Button : Submit" ,false
       Exit Function
   End If
   WaitForIcallLoading
   clickButtonSubmit_ATMCAM=true
End Function

'[Check the record exists in IWF DB]
Public Function checkRecordsIWF(strCIN)
	bDevPending=false
	bcheckRecordsIWF = true
	strQuery="select * from cwf_cust_claim_history where customer_cin='"&strCIN&"'"
	strQuery_Result=getDBValForColumn_IWF(strQuery)(0)
	
	'**** if strQuery_Result is not blank, then delete the record
	If strQuery_Result <> "" Then
		'delete the record
		connection_string="Driver={Microsoft ODBC for Oracle};" & _
		"CONNECTSTRING=(DESCRIPTION=" & _
		"(ADDRESS=(PROTOCOL=TCP)" & _
		"(HOST=10.91.35.175)(PORT=1521))" & _
		"(CONNECT_DATA=(SERVICE_NAME=bpmsit))); uid=iwfdb;pwd=password1;"
		
		set connection = CreateObject("ADODB.Connection") 
		connection.Open connection_string 
		SQL = "DELETE from cwf_cust_claim_history where customer_cin='T8970004Z'"
		connection.Execute( SQL ) 
		connection.Close
		Set connection = Nothing
	End If
	checkRecordsIWF = bcheckRecordsIWF
End Function

'[Verify Field Status_RequestSubmitted For ATM CAM displayed as]
Public Function verifyStatus_RequestSubmittedATMCAM(strExpectedText)
   bDevPending=false
   bverifyStatus_RequestSubmittedATMCAM=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (Claims.lblStatus_RequestSubmitted(), strExpectedText, "Status_RequestSubmitted")Then
           bverifyStatus_RequestSubmittedATMCAM = false
       End If
   End If
   verifyStatus_RequestSubmittedATMCAM = bverifyStatus_RequestSubmittedATMCAM
End Function

'[Click on Close of the SR PopUp]
Public Function clickButton_Close()
   bDevPending=false
   Claims.btnClose_RequestSubmitted.click
   waitForIcallLoading
   If Err.Number<>0 Then
       clickButton_Close=false
            LogMessage "WARN","Verification","Failed to Click Button of SR PopUp : Close" ,false
       Exit Function
   End If
   clickButton_Close=true
End Function

'[Get the Case Number from OL DB for ATM CAM]
Public Function fetchCaseNumberATMCAM()
	bDevPending=false
	bfetchCaseNumberATMCAM = true
	'***** Fetch the Job ID
	strQuery="select job_id from orchsvc_job where job_code='CASH_CLAIM' ORDER BY start_datetime DESC"
	strQuery_JOBID=getDBValForColumn_OL(strQuery)(0)
	'**** Now fetch the case number
	strQuery1="select message from orchsvc_job_step where job_id='"&strQuery_JOBID&"'"
	strQuery_CaseNumber=getDBValForColumn_OL(strQuery1)(0)
	
	fetchCaseNumberATMCAM = bfetchCaseNumberATMCAM
End Function

'[LISA Verify the values displayed in the Terminal Transaction Details as]
Public Function verifyTerminalTranDetails_LISA(strCardOwner,strBusinessRate,strSeqNo,strSubClass,strTranType,strReference,strLedgBal,strAvaiBal,strTerOwner,strTermId,strLocation,strARQC,strCompStatus,strHostInd,strPinTries,strChipSeq,strATB)
	
	' Get the Iserve fields related to terminal transaction details
	strIserveCardOwner = Claims.lblCardOwner.GetROProperty("innertext")
	strIserveBusinessRate = Claims.lblBusinessDate.GetROProperty("innertext")
	strIserveSeqNo = Claims.lblSequenceNo.GetROProperty("innertext")
	strIserveSubClass = Claims.lblSubClass.GetROProperty("innertext")
	strIserveTranType = Claims.lblTransactionType.GetROProperty("innertext")
	strIserveReference = Claims.lblReference.GetROProperty("innertext")
	strIserveLedgBal = Claims.lbLedgerBalance.GetROProperty("innertext")
	strIserveAvaiBal = Claims.lbAvailableBalance.GetROProperty("innertext")
	strIserveTerOwner = Claims.lblTerminalOwner.GetROProperty("innertext")
	strIserveTermId = Claims.lblTerminalID.GetROProperty("innertext")
	strIserveLocation = Claims.lblLocation.GetROProperty("innertext")
	strIserveARQC = Claims.lblARQC.GetROProperty("innertext")
	strIserveCompStatus= Claims.lblCompletionStatus.GetROProperty("innertext")
	strIserveHostInd = Claims.lblHostIndicator.GetROProperty("innertext")
	strIservePinTries = Claims.lblPinTries.GetROProperty("innertext")
	strIServeChipSeq = Claims.lblChipSequences.GetROProperty("innertext")
	strIserveATB = Claims.lblATB.GetROProperty("innertext")
	
	bDevPending=false
   bverifyTerminalTranDetails_LISA=true		
			
	If strCardOwner = strIserveCardOwner Then
		LogMessage "RSLT","Verification","The Iserve Card Owner value is as expected: "&strCardOwner&"",True
		Else 
		LogMessage "WARN","Verification","The Iserve Card Owner value is not as expected: "&strCardOwner&"",False
	End If
	
	If strBusinessRate = strIserveBusinessRate Then
		LogMessage "RSLT","Verification","The Iserve Business Rate value is as expected: "&strBusinessRate&"",True
		Else 
		LogMessage "WARN","Verification","The Iserve Business Rate value is not as expected: "&strBusinessRate&"",False
	End If
	
	If strSeqNo = strIserveSeqNo Then
		LogMessage "RSLT","Verification","The Iserve Sequence No. value is as expected: "&strSeqNo&"",True
		Else 
		LogMessage "WARN","Verification","The Iserve Sequence No. value is not as expected: "&strSeqNo&"",False
	End If
	
	If strSubClass = strIserveSubClass Then
		LogMessage "RSLT","Verification","The Iserve Sub Class value is as expected: "&strSubClass&"",True
		Else 
		LogMessage "WARN","Verification","The Iserve Sub Class value is not as expected: "&strSubClass&"",False
	End If
	
	If strTranType = strIserveTranType Then
		LogMessage "RSLT","Verification","The Iserve Transaction Type value is as expected: "&strTranType&"",True
		Else 
		LogMessage "WARN","Verification","The Iserve Transaction Type value is not as expected: "&strTranType&"",False
	End If
	
	If strReference = strIserveReference Then
		LogMessage "RSLT","Verification","The Iserve Reference value is as expected: "&strReference&"",True
		Else 
		LogMessage "WARN","Verification","The Iserve Reference value is not as expected: "&strReference&"",False
	End If
	
	If strLedgBal = strIserveLedgBal Then
		LogMessage "RSLT","Verification","The Iserve Ledger Balance value is as expected: "&strLedgBal&"",True
		Else 
		LogMessage "WARN","Verification","The Iserve  Ledger Balance value is not as expected: "&strLedgBal&"",False
	End If
	
	If strAvaiBal = strIserveAvaiBal Then
		LogMessage "RSLT","Verification","The Iserve Available Balance value is as expected: "&strAvaiBal&"",True
		Else 
		LogMessage "WARN","Verification","The Iserve Available Balance value is not as expected: "&strAvaiBal&"",False
	End If
	
	If strTerOwner = strIserveTerOwner Then
		LogMessage "RSLT","Verification","The Iserve Terminal Owner value is as expected: "&strTerOwner&"",True
		Else 
		LogMessage "WARN","Verification","The Iserve Terminal Owner value is not as expected: "&strTerOwner&"",False
	End If
	
	If strTermId = strIserveTermId Then
		LogMessage "RSLT","Verification","The Iserve Terminal ID value is as expected: "&strTermId&"",True
		Else 
		LogMessage "WARN","Verification","The Iserve Terminal ID value is not as expected: "&strTermId&"",False
	End If
	
	If strLocation = strIserveLocation Then
		LogMessage "RSLT","Verification","The Iserve Terminal ID value is as expected: "&strLocation&"",True
		Else 
		LogMessage "WARN","Verification","The Iserve Terminal ID value is not as expected: "&strLocation&"",False
	End If
	
	If strARQC = strIserveARQC Then
		LogMessage "RSLT","Verification","The Iserve Terminal ID value is as expected: "&strARQC&"",True
		Else 
		LogMessage "WARN","Verification","The Iserve Terminal ID value is not as expected: "&strARQC&"",False
	End If
	
	If strCompStatus = strIserveCompStatus Then
		LogMessage "RSLT","Verification","The Iserve Terminal ID value is as expected: "&strCompStatus&"",True
		Else 
		LogMessage "WARN","Verification","The Iserve Terminal ID value is not as expected: "&strCompStatus&"",False
	End If
	
	If strHostInd = strIserveHostInd Then
		LogMessage "RSLT","Verification","The Iserve Terminal ID value is as expected: "&strHostInd&"",True
		Else 
		LogMessage "WARN","Verification","The Iserve Terminal ID value is not as expected: "&strHostInd&"",False
	End If
	
	If strPinTries = strIservePinTries Then
		LogMessage "RSLT","Verification","The Iserve Terminal ID value is as expected: "&strPinTries&"",True
		Else 
		LogMessage "WARN","Verification","The Iserve Terminal ID value is not as expected: "&strPinTries&"",False
	End If
	
	If strChipSeq = strIServeChipSeq Then
		LogMessage "RSLT","Verification","The Iserve Terminal ID value is as expected: "&strChipSeq&"",True
		Else 
		LogMessage "WARN","Verification","The Iserve Terminal ID value is not as expected: "&strChipSeq&"",False
	End If
	
	If strATB = strIserveATB Then
		LogMessage "RSLT","Verification","The Iserve Terminal ID value is as expected: "&strATB&"",True
		Else 
		LogMessage "WARN","Verification","The Iserve Terminal ID value is not as expected: "&strATB&"",False
	End If
	verifyTerminalTranDetails_LISA = bverifyTerminalTranDetails_LISA	
End Function


