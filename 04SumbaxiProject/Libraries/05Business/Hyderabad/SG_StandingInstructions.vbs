	Dim strRunTimeFirstPaymentDate:strRunTimeFirstPaymentDate=""
Dim strRunTimeLastPaymentDate:strRunTimeLastPaymentDate=""

'[Verify default Account Number in standing Instruction Page displayed as]
Public Function VerifyAccountNumber_SI(strAccNo)
   bVerifyAccountNumber=true
   If Not IsNull(strAccNo) Then
       If Not verifyComboSelectItem (SI.lstAccountNo(),strAccNo, "Account/Card No.")Then
    	  LogMessage "WARN","Verification","Expected Default Account type:"&strAccNo&" not displayed in the Account/Card No field" ,false
          bVerifyAccountNumber=false
       End If
   End If
   VerifyAccountNumber_SI = bVerifyAccountNumber
End Function

'[Verify list of values displayed in Account Number dropdown in SI Page]
Public Function VerifylistAccountNo_SI(lstAccNo) 
	bVerifylistAccountNo = True 
	If Not IsNull(lstAccNo) Then
       If Not verifyComboboxItems(SI.lstAccountNo(),lstAccNo, "Account/Card No.")Then
       	   LogMessage "WARN","Verification","List of Account No displayed in the combox box is not as expected" ,false
           bVerifylistAccountNo=false
       End If
   End If
   VerifylistAccountNo_SI = bVerifylistAccountNo
End Function

'[Select Account Number combox box in SI Page as]
Public Function SelectAccountNo_SI(strAccNo)
	bSelectAccountNo=true
	If Not IsNull(strAccNo) Then
       If Not (selectItem_Combobox (SI.lstAccountNo(), strAccNo))Then
           LogMessage "WARN","Verification","Failed to select :"&strAccNo&" From Account/Card No dropdown list" ,false
           bSelectAccountNo=false
       End If
   End If
   WaitForICallLoading
   SelectAccountNo_SI=bSelectAccountNo
End Function

'[Click on SR Shortcut Button SI Setup]
Public Function clickBtnSISetup_SI()
	bclickBtnSISetup=true
	SI.btnSISetup.click
	If Err.Number<>0 Then
       clickBtnSISetup=false
       LogMessage "WARN","Verification","Failed to Click Button : SI Setup" ,false
       Exit Function
   End If
    clickBtnSISetup_SI=true
	WaitForICallLoading
End Function

'[Verify MA Message For SI STP displayed as]
Public Function verifyMAMessage_SI(strExpectedText)
   bDevPending=False
   bverifyMAMessage_SI=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (SI.lblConfirmationMessage(), strExpectedText, "MA Validation Message")Then
           bverifyMAMessage_SI=false
       End If
   End If
   SI.btnOK_ConfirmationMsg.Click
   WaitForICallLoading
   verifyMAMessage_SI=bverifyMAMessage_SI
End Function

'[Verify Pre Validation Message displayed on SI as]
Public Function verifyValidationMessage_SI(strValidationMessage)
   bDevPending=False
   bVerifyValidationMessageText=true
   If Not IsNull(strValidationMessage) Then
       If Not VerifyInnerText (SI.lblValidationMessage(), strValidationMessage, "Validation Message")Then
           bVerifyValidationMessageText=false
        Else
         bVerifyValidationMessageText=True
       End If
   End If
   verifyValidationMessage_SI=bVerifyValidationMessageText
End Function

'[Verify SI table details displayed and click on status link]
Public Function clickActiveHyperlink(lstStandingInstructionDetails)
	bclickActiveHyperlink = true
	bclickActiveHyperlink = selectTableLink(SI.tblStandingInstructionsHeader, SI.tblStandingInstructionsContents, lstStandingInstructionDetails, "Standing Instructions Details", "Status", false, null, null, null)
	clickActiveHyperlink = bclickActiveHyperlink
End Function

'[Verify Additional Details of SI]
Public Function verifyAdditionalDetails(lstAdditionalDetails)
	bverifyAdditionalDetails = true
	intSize = Ubound(lstAdditionalDetails)
	For Iterator = 0 To intSize Step 1
		arrLabel = trim(Split(lstAdditionalDetails(Iterator),":")(0))
		arrValue = trim(Split(lstAdditionalDetails(Iterator),":")(1))
		Select Case (arrLabel)
			Case "Start Date"
				'write the code for start date
				If Not IsNull(arrValue) Then
			       If Not VerifyInnerText (SI.lblStartDate(), arrValue, "Start Date")Then
			           bverifyAdditionalDetails=false
			       End If
			    End If
			Case "End Date"
				'write the code for end date
				If Not IsNull(arrValue) Then
			       If Not VerifyInnerText (SI.lblEndDate(), arrValue, "End Date")Then
			           bverifyAdditionalDetails=false
			       End If
			    End If
			 Case "Termination Input Date"
				 If Not IsNull(arrValue) Then
				       If Not VerifyInnerText (SI.lblTerminationInputDate(), arrValue, "Termination Input Date")Then
				           bverifyAdditionalDetails=false
				       End If
				    End If
			 Case "Termination Date"
				  If Not IsNull(arrValue) Then
				       If Not VerifyInnerText (SI.lblTerminationDate(), arrValue, "Termination Date")Then
				           bverifyAdditionalDetails=false
				       End If
				  End If
		End Select
	Next
	WaitForICallLoading
	'********** Click on OK button
	SI.btnOK.click
	verifyAdditionalDetails = bverifyAdditionalDetails
End Function

'[Verify only CASA accounts are shown in the drop down values]
Public Function verifyAccountsComboboxItems_SI(lstCaSaAccounts)
	bDevPending=false
   bverifyAccountsComboboxItems=true
   If Not IsNull(lstCaSaAccounts) Then
       If Not verifyComboboxItems (SI.lstAccounts(), lstCaSaAccounts, "Accounts has items")Then
           bverifyAccountsComboboxItems=false
       End If
   End If
   verifyAccountsComboboxItems_SI=bverifyAccountsComboboxItems
End Function

'[Check the status of the action link in SI Screen]
Public Function checkActionLink(strExceptedStatus,lstTransactionRecordDetails)
	WaitForICallLoading
	bcheckActionLink = true
	With SI
		  bcheckActionLink_status= selectTableSubMenu_ForDisabled(.tblStandingInstructionsHeader,.tblStandingInstructionsContents,lstTransactionRecordDetails,"Standing Instructions Details","Action",False, Null, Null, Null,"Maintenance",strExceptedStatus)
	End With
    checkActionLink=bcheckActionLink	
End Function

'[Click on Account No hyperlink from table displayed in SI Page]
Public Function verifyHyperlinkAcct(lstStandingInstructionsDetails)
	bverifyHyperlinkAcct = true
	bverifyHyperlinkAcct = selectTableLink(SI.tblStandingInstructionsHeader, SI.tblStandingInstructionsContents, lstStandingInstructionsDetails, "Standing Instructions Details", "Account No.", false, null, null, null)
	verifyHyperlinkAcct = bverifyHyperlinkAcct
End Function

'[Click on Maintenance action gear in SI]
Public Function clickMaintenanceActionGear(lstTransactionRecordDetails)
	bDevPending = false
	bclickMaintenanceActionGear = true
	WaitForICallLoading
	With SI
		  bcheckActionLink_status= selectTableSubMenu(.tblStandingInstructionsHeader,.tblStandingInstructionsContents,lstTransactionRecordDetails,"Standing Instructions Details","Action",False, Null, Null, Null,"Maintenance",bDisabled)
	End With
	Wait (3)
    clickMaintenanceActionGear=bclickMaintenanceActionGear	
End Function

'[Select Combobox Request Type in SI Maintenance Screen]
Public Function selectRequestType_SI(strRequestType)
	bselectRequestType_SI=true
	If Not IsNull(strRequestType) Then
	   WaitForICallLoading
       If Not (selectItem_Combobox (SI.lstRequestType(), strRequestType))Then
            LogMessage "WARN","Verification","Failed to select :"&strRequestType&" From Request Type drop down list" ,false
           bselectRequestType_SI=false
       End If
	End If
	WaitForICallLoading
	selectRequestType_SI = bselectRequestType_SI
End Function

'[Set TextBox Payment Amount in SI Setup Screen to]
Public Function setPaymentAmountTextbox(strPaymentAmount)
   bDevPending=false
   SI.txtPaymentAmount.Set(strPaymentAmount)
   If Err.Number<>0 Then
       setPaymentAmountTextbox=false
            LogMessage "WARN","Verification","Failed to Set Text Box :PaymentAmount" ,false
       Exit Function
   End If
   setPaymentAmountTextbox=true
End Function

'[Verify Validation Message for First Payment Date displayed on SI Page as]
Public Function verifyValidationMessage_PaymentAmt(strValidationMessage)
   bDevPending=False
   bVerifyValidationMessageText=true
   If Not IsNull(strValidationMessage) Then
       If Not VerifyInnerText (SI.lblPaymentAmountValidation(), strValidationMessage, "Validation Message: Payment Amount")Then
           bVerifyValidationMessageText=false
        Else
         bVerifyValidationMessageText=True
       End If
   End If
   verifyValidationMessage_PaymentAmt=bVerifyValidationMessageText
End Function

'[Set TextBox Last Payment Amount in SI Setup Screen to]
Public Function setLastPaymentAmountTextbox(strPaymentAmount)
   bDevPending=false
   SI.txtLastPaymentAmount.Set(strPaymentAmount)
   If Err.Number<>0 Then
       setLastPaymentAmountTextbox=false
            LogMessage "WARN","Verification","Failed to Set Text Box :Last PaymentAmount" ,false
       Exit Function
   End If
   setLastPaymentAmountTextbox=true
End Function

'[Verify Validation Message for Last Payment Date displayed on SI Page as]
Public Function verifyValidationMessage_LastPaymentAmt(strValidationMessage)
   bVerifyValidationMessageText=true
   If Not IsNull(strValidationMessage) Then
 	   WaitForICallLoading
       If Not VerifyInnerText (SI.lblLastPaymentAmountValidation(), strValidationMessage, "Validation Message: Last Payment")Then
           bVerifyValidationMessageText=false
        Else
         bVerifyValidationMessageText=True
       End If
   End If
   verifyValidationMessage_LastPaymentAmt=bVerifyValidationMessageText
End Function

'[Set TextBox Date of First Payment in SI Setup Screen to]
Public Function setFirstPaymentDate(strFirstPaymentDate)
  If Not IsNull(strFirstPaymentDate) Then 
	   If strFirstPaymentDate = "Today" Then
	   		'set today's date
	   		strFirstPaymentDate = now()
	   		strmonth = Monthname(Month(strFirstPaymentDate))
	   		strmonth = Mid(strmonth,1,3)
	   		strDay = Day(strFirstPaymentDate)
	   		If len(strDay)=1 Then
	   			strDay = "0"&strDay
	   		End If
	   		strYear = Year(strFirstPaymentDate)
	   		strDate = strDay &" " &strmonth &" " &strYear
	   		SI.txtFirstPaymentDate.Set(strDate)
	   		strRunTimeFirstPaymentDate = strDate
	   	ElseIf strFirstPaymentDate = "RunTime" Then
	   		'Get the current date of C Region
	   		strDate=fetchCurrentDate_CIS()
	   		If len(Day(CDate(strDate)))=1 Then
	        	strDay="0"&Day(CDate(strDate))
		    else
		        strDay=""&Day(CDate(strDate))
		    End If
			    strDate=""&strDay & " "&monthName(Month(CDate(strDate)),true) &" " &Year(CDate(strDate))		    
		    'add 4 days to the current date
	   		strDate = DateAdd("d",4,strDate)
	   		If len(Day(CDate(strDate)))=1 Then
	       		strDay="0"&Day(CDate(strDate))
		    else
		        strDay=""&Day(CDate(strDate))
		    End If
			    strDate=""&strDay & " "&monthName(Month(CDate(strDate)),true) &" " &Year(CDate(strDate))
	   		
		    SI.txtFirstPaymentDate.Set(strDate)
		    strRunTimeFirstPaymentDate = strDate
	   	Else
	   		'set the same date as passed
	   		SI.txtFirstPaymentDate.Set(strFirstPaymentDate)
	   		strRunTimeFirstPaymentDate = strFirstPaymentDate
	   End If
	   If Err.Number<>0 Then
	       setFirstPaymentDate=false
	       LogMessage "WARN","Verification","Failed to Set Text Box :First Payment Date" ,false
	       Exit Function
	   End If
   End  IF 
   setFirstPaymentDate=true
End Function

'[Verify Validation Message for First Payment Date displayed on SI Setup as]
Public Function verifyValidationMessage_FistPaymentDate(strValidationMessage)
   bDevPending=False
   bVerifyValidationMessageText=true
   If Not IsNull(strValidationMessage) Then
       If Not VerifyInnerText (SI.lblFirstPaymentDateValidation(), strValidationMessage, "Validation Message: First Payment Date")Then
           bVerifyValidationMessageText=false
        Else
         bVerifyValidationMessageText=True
       End If
   End If
   verifyValidationMessage_FistPaymentDate=bVerifyValidationMessageText
End Function

'[Set TextBox Date of Last Payment in SI Setup Screen to]
Public Function setLastPaymentDate(strLastPaymentDate)
   bDevPending=false
   If strLastPaymentDate = "RunTime" Then
   		'Get the current date from C Region and set the year to 1 year
   		strDate=fetchCurrentDate_CIS()
   		If len(Day(CDate(strDate)))=1 Then
        	strDay="0"&Day(CDate(strDate))
    	else
       		 strDay=""&Day(CDate(strDate))
   	 	End If
   	 		strYear = Year(CDate(strDate)) + 1
	    	strDate=""&strDay & " "&monthName(Month(CDate(strDate)),true) &" " &strYear
	    	SI.txtLastPaymentDate.Set(strDate)
	    	strRunTimeLastPaymentDate = strDate
	Else
		SI.txtLastPaymentDate.Set(strLastPaymentDate)
		strRunTimeLastPaymentDate = strLastPaymentDate
   End If  
   If Err.Number<>0 Then
       setLastPaymentDate=false
            LogMessage "WARN","Verification","Failed to Set Text Box :Last Payment Date" ,false
       Exit Function
   End If
   setLastPaymentDate=true
End Function

'[Verify Validation Message for Last Payment Date displayed on SI Setup as]
Public Function verifyValidationMessage_LastPaymentDate(strValidationMessage)
   bVerifyValidationMessageText=true
   If Not IsNull(strValidationMessage) Then
       If Not VerifyInnerText (SI.lblLastPaymentDateValidation(), strValidationMessage, "Validation Message: Last Payment Date")Then
           bVerifyValidationMessageText=false
        Else
         bVerifyValidationMessageText=True
       End If
   End If
   verifyValidationMessage_LastPaymentDate=bVerifyValidationMessageText
End Function

'[Set TextBox Frequency in SI Setup Screen to]
Public Function setFrequency(strFrequency)
   SI.txtFrequencyofPayment.Set(strFrequency)
   If Err.Number<>0 Then
       setFrequency=false
            LogMessage "WARN","Verification","Failed to Set Text Box :Frequency" ,false
       Exit Function
   End If
   setFrequency=true
End Function

'[Set TextBox Day of Payment in SI Setup Screen to]
Public Function setDayofPayment(strDay)
   If Not IsNull(strDay) Then
   	   SI.txtDayofPayment.Set(strDay)
	   If Err.Number<>0 Then
	       setDayofPayment=false
	            LogMessage "WARN","Verification","Failed to Set Text Box :Day of Payment" ,false
	       Exit Function
	   End If
   End IF 
   setDayofPayment=true
End Function

'[Verify Validation Message for Day of Payment displayed on SI Setup as]
Public Function verifyValidationMessage_DayOfPayment(strValidationMessage)
   bVerifyValidationMessageText=true
   If Not IsNull(strValidationMessage) Then
       If Not VerifyInnerText (SI.lblDayOfPaymentValidation(), strValidationMessage, "Validation Message: Day of Payment")Then
           bVerifyValidationMessageText=false
        Else
         bVerifyValidationMessageText=True
       End If
   End If
   verifyValidationMessage_DayOfPayment=bVerifyValidationMessageText
End Function

'[Verify Submit Button  is disabled on SI Setup Screen]
Public Function VerifybtnSubmitDisable_SISetup()
    Dim bVerifybtnSubmit_SISetup:bVerifybtnSubmit_SISetup=true
	intBtnSubmit=Instr(SI.btnSubmit.GetROproperty("outerhtml"),("disabled"))
	If  not intBtnSubmit=0 Then
		LogMessage "RSLT","Verification","Submit button is disabled as per expectation.",True
		bVerifybtnSubmit_SISetup=true
	Else
		LogMessage "WARN","Verifiation","Submit button is enable. Expected to be disable.",false
		bVerifybtnSubmit_SISetup=false
	End If
	VerifybtnSubmitDisable_SISetup=bVerifybtnSubmit_SISetup
End Function

'[Verify row Data in Table Bank Account Details]
Public Function verifyBankAccountDetails_RowData(arrRowDataList)
   verifyBankAccountDetails_RowData=verifyTableContentList(SI.tblStandingInstructionsHeader,SI.tblStandingInstructionsContents,arrRowDataList,"Bank Account Details" , false, null, null, null)
End Function

'[Verify Frequency Combo box has Items]
Public Function verifyFrequencyComboboxItems(strlstFrequency)
   bverifyFrequencyComboboxItems=true
   If Not IsNull(strlstFrequency) Then
       If Not verifyComboboxItems (SI.lstFrequencyofPayment(), strlstFrequency, "Frquency has items")Then
           bverifyFrequencyComboboxItems=false
       End If
   End If
   verifyFrequencyComboboxItems=bverifyFrequencyComboboxItems
End Function

'[Verify Beneficiary Bank Code Combo box has Items]
Public Function verifyBeneficiaryComboboxItems(lstBeneficaryBankCode)
   bverifyBeneficiaryComboboxItems=true
   If Not IsNull(lstBeneficaryBankCode) Then
       If Not verifyComboboxItems (SI.lstBeneficiaryBankCode(), lstBeneficaryBankCode, "Beneficary Bank Code")Then
           bverifyBeneficiaryComboboxItems=false
       End If
   End If
   verifyBeneficiaryComboboxItems=bverifyBeneficiaryComboboxItems
End Function

'[Verify default Frequency of Payment displayed in SI page]
Public Function verifyFrequencyOfPaymentText(strFrequencyOfPayment)
   bverifyFrequencyOfPaymentText=true
   If Not IsNull(strFrequencyOfPayment) Then
       If Not verifyComboSelectItem(SI.lstFrequencyofPayment(), strFrequencyOfPayment, "Frequency of Payment")Then
           bverifyFrequencyOfPaymentText=false
       End If
   End If
   verifyFrequencyOfPaymentText=bverifyFrequencyOfPaymentText
End Function

'[Verify default Day of Payment displayed in SI page]
Public Function verifydefaultDayOfPayment_SI(strDayOfPayment)
   berifydefaultDayOfPayment=true
   If Not IsNull(strDayOfPayment) Then
       If Not verifyFieldValue(SI.txtDayofPayment(), strDayOfPayment, "Day of Payment")Then
           berifydefaultDayOfPayment=false
       End If
   End If
   verifydefaultDayOfPayment_SI = berifydefaultDayOfPayment
End Function

'[Verify default First Payment Date displayed in SI Page]
Public Function verifydefaultFirstPaymentdate_SI(strFirstPaymentDate)
   bverifydefaultFirstPaymentdate=true
   If Not IsNull(strFirstPaymentDate) Then
      If Not verifyFieldValue(SI.txtFirstPaymentDate(), strFirstPaymentDate, "First Payment Date") Then
           bverifydefaultFirstPaymentdate=false
       End If
   End If
   verifydefaultFirstPaymentdate_SI = bverifydefaultFirstPaymentdate
End Function

'[Verify default Last Payment Date displayed in SI Page]
Public Function verifydefaultLastPaymentdate_SI(strLastPaymentDate)
   bverifydefaultLastPaymentdate=true
   If Not IsNull(strLastPaymentDate) Then
       If Not verifyFieldValue(SI.txtLastPaymentDate(), strLastPaymentDate, "Last Payment Date")Then
           bverifydefaultLastPaymentdate = false
       End If
   End If
   verifydefaultLastPaymentdate_SI=bverifydefaultLastPaymentdate
End Function

'[Verify default Payment Amount displayed in SI Page]
Public Function verifyPaymentAmt_SI(strPaymentAmt)
   bverifyPaymentAmt=true
   If Not IsNull(strPaymentAmt) Then
       If Not verifyFieldValue(SI.txtPaymentAmount(), strPaymentAmt, "Payment Amount")Then
           bverifyPaymentAmt=false
       End If
   End If
   verifyPaymentAmt_SI=bverifyPaymentAmt
End Function

'[Verify default LastPayment Amount displayed in SI Page]
Public Function verifyLastPaymentAmt_SI(strLastPaymentAmt)
   bverifyLastPaymentAmt=true
   If Not IsNull(strLastPaymentAmt) Then
       If Not verifyFieldValue(SI.txtLastPaymentAmount(), strLastPaymentAmt, "Last Payment Amount")Then
           bverifyLastPaymentAmt=false
       End If
   End If
   verifyLastPaymentAmt_SI=bverifyLastPaymentAmt
End Function

'[Verify Field Description on SI Setup displayed as]
Public Function verifyDescriptionText_SISetup(strDescription)
   bVerifyDescriptionText=true
   If Not IsNull(strDescription) Then
       If Not VerifyInnerText(SI.lblDescription(), strDescription, "Description")Then
           bVerifyDescriptionText=false
       End If
   End If
   verifyDescriptionText_SISetup=bVerifyDescriptionText
End Function

'[Verify Knowledge base link on SI Setup Screen is enabled]
Public Function VerifyKnowledgebaselinkEnabled_SISetup()
   Dim bVerifyKnowledgebaselink:bVerifyKnowledgebaselink=true
     strKBLink=SI.lnkKnowledgeBase.GetROProperty("Outerhtml")
    If inStr(strKBLink,"v-disabled") = 0 Then
		LogMessage "RSLT","Verification","Knowledge base Link  enabled successfully as expected",true
	else
		LogMessage "WARN","Verification","Knowledge base Link  does not enabledas expected",false
		bVerifyKnowledgebaselink=false
	End If
	VerifyKnowledgebaselinkEnabled_SISetup=bVerifyKnowledgebaselink
End Function

'[Verify Combobox Beneficiary Bank Code displayed as]
Public Function verifyBeneficiaryBankCodeText(strBeneficiaryBankCode)
   bverifyBeneficiaryBankCodeText=true
   If Not IsNull(strBeneficiaryBankCode) Then
       If Not verifyComboSelectItem (SI.lstBeneficiaryBankCode(), strBeneficiaryBankCode, "Beneficiary Bank Code")Then
           bverifyBeneficiaryBankCodeText=false
       End If
   End If
   verifyBeneficiaryBankCodeText=bverifyBeneficiaryBankCodeText
End Function

'[Click Button Add Notes on SI Setup Screen]
Public Function clickButtonAddNotes_SISetup()
   SI.btnAddNotes.click
   If Err.Number<>0 Then
       clickButtonAddNotes_SISetup=false
            LogMessage "WARN","Verification","Failed to Click Button : AddNotes" ,false
       Exit Function
   End If
   clickButtonAddNotes_SISetup=true
End Function

'[Click Button Cancel of Notes PopUp on SI Setup Screen]
Public Function clickButtonCancelAddNotes_SISetup()
   SI.btnCancelNotesPopUp.click
   If Err.Number<>0 Then
       clickButtonCancelAddNotes_SISetup=false
            LogMessage "WARN","Verification","Failed to Click Button : Cancel of Notes PopUp" ,false
       Exit Function
   End If
   clickButtonCancelAddNotes_SISetup=true
End Function

'[Verify No Of Notes being displayed in SI Setup Screen]
Public Function verifyNoOfNotes_SISetup(strDescription)
   bverifyNoOfNotes_SISetup=true
   If Not IsNull(strDescription) Then
       If Not VerifyInnerText (SI.lblNoOfNotes(), strDescription, "No of Notes")Then
           bverifyNoOfNotes_SISetup=false
       End If
   End If
   verifyNoOfNotes_SISetup=bverifyNoOfNotes_SISetup
End Function

'[Verify Combobox Request Type displayed as]
Public Function verifyRequestTypeText(strRequestType)
   bverifyRequestTypeText=true
   If Not IsNull(strRequestType) Then
       If Not verifyComboSelectItem (SI.lstRequestType(), strRequestType, "Request Type")Then
           bverifyRequestTypeText=false
       End If
   End If
   verifyRequestTypeText=bverifyRequestTypeText
End Function

'[Verify Request Type Combo box has Items]
Public Function verifyRequestTypeComboboxItems_SI(strlstRequestType)
   bverifyRequestTypeComboboxItems_SI=true
   If Not IsNull(strlstRequestType) Then
       If Not verifyComboboxItems (SI.lstRequestType(), strlstRequestType, "Request Type has items")Then
           bverifyRequestTypeComboboxItems_SI=false
       End If
   End If
   verifyRequestTypeComboboxItems_SI=bverifyRequestTypeComboboxItems_SI
End Function

'[Verify row Data in Table Beneficiary Details]
Public Function verifyBeneficiaryDetails_RowData(arrRowDataList)
   verifyBeneficiaryDetails_RowData=verifyTableContentList(SI.tblBeneficiaryDetailsHeader,SI.tblBeneficiaryDetailsContents,arrRowDataList,"Beneficiary Details" , false, null, null, null)
End Function

'[Verify row Data in Table Standing Instruction Details]
Public Function verifySIDetails_RowData(arrRowDataList)
   verifySIDetails_RowData=verifyTableContentList(SI.tblSIDetailsHeader,SI.tblSIDetailsContents,arrRowDataList,"Standing Instruction Details" , false, null, null, null)
End Function

'[Verify row Data in Table Standing Instruction Date Details]
Public Function verifySIDateDetails_RowData(arrRowDataList)
   verifySIDateDetails_RowData=verifyTableContentList(SI.tblSIDateDetailsHeader,SI.tblSIDateDetailsContents,arrRowDataList,"Standing Instruction Details" , false, null, null, null)
End Function

'[Set the Frequency of Payment on SI Screen to]
Public Function setFrequencyOfPayment_SI(strFrequency)
   If not isNull(strFrequency) Then
	   SI.txtFrequencyofPayment.Set(strFrequency)
   End If
   If Err.Number<>0 Then
       setFrequencyOfPayment_SI=false
            LogMessage "WARN","Verification","Failed to Set :Frequency of Payment" ,false
       Exit Function
   End If
   setFrequencyOfPayment_SI=true
End Function

'[Verify the Field Day of Payment exists]
Public Function verifyDayOfPaymentExists(booleanStatus)
	bDevPending=false
	verifyDayOfPaymentExists = true
	If booleanStatus Then
		'The field is excepted to exists
		If SI.txtDayofPayment.Exist Then
			LogMessage "RSLT","Verification","The field Day of Payment Exists as expected." ,True
		Else
			LogMessage "WARN","Verification","The field Day of Payment Exists but is not expected." ,false
		End If
	Else
		'The field is excepted not to exists
		If SI.txtDayofPayment.Exist Then
			LogMessage "WARN","Verification","The field Day of Payment Exists but is not expected." ,false
		Else
			LogMessage "RSLT","Verification","The field Day of Payment Does not Exists as expected." ,True
		End If
	End If
End Function

'[Verify Date of Last Payment displayed as]
Public Function verifyDateOfLastPaymentText(strDateOfLastPayment)
   bDevPending=false
   bverifyDateOfLastPaymentText=true
   If Not IsNull(strDateOfLastPayment) Then
   		strActualVal = SI.txtLastPaymentDate().GetRoProperty("value")
   		If strDateOfLastPayment =  strActualVal Then
   			LogMessage "RSLT","Verification","Date of Last Payment matches. Expected: "&strDateOfLastPayment & "Actual:" &strActualVal ,True
   		else
   			LogMessage "WARN","Verification","Date of Last Payment does not matche. Expected: "&strDateOfLastPayment & "Actual:" &strActualVal ,False
   			bverifyDateOfLastPaymentText=false
   		End If
   End If
   verifyDateOfLastPaymentText=bverifyDateOfLastPaymentText
End Function

'[Verify Payment Amount displayed as]
Public Function verifyPaymentAmountText(strPaymentAmount)
   bDevPending=false
   bverifyPaymentAmountText=true
   If Not IsNull(strPaymentAmount) Then
   		strActualVal = SI.txtPaymentAmount().GetRoProperty("value")
   		If trim(strPaymentAmount) =  trim(strActualVal) Then
   			LogMessage "RSLT","Verification","Payment Amount matches. Expected: "&strPaymentAmount & "Actual:" &strActualVal ,True
   		else
   			LogMessage "WARN","Verification","Payment Amount does not match. Expected: "&strPaymentAmount & "Actual:" &strActualVal ,False
   			bverifyPaymentAmountText=false
   		End If
   End If
   verifyPaymentAmountText=bverifyPaymentAmountText
End Function

'[Set Payment Amount in SI Screen to]
Public Function setPaymentAmount_SI(strPaymentAmount)
	bDevPending=false
	If not isNull(strPaymentAmount) Then
	   SI.txtPaymentAmount.Set(strPaymentAmount)
   End If
   If Err.Number<>0 Then
       setPaymentAmount_SI=false
            LogMessage "WARN","Verification","Failed to Set :Payment Amount" ,false
       Exit Function
   End If
   setPaymentAmount_SI=true
End Function

'[Verify Inline Message for Larger Payment Amount]
Public Function verifyInlineMsgPaymentAmtText_SI(strInlineMsg)
   bDevPending=false
   bVerifyDescriptionText=true
   'Get the Payment amount
   strPaymentAmt = trim(SI.txtPaymentAmount.GetRoProperty("value"))
   If strPaymentAmt > 19999 Then
   		'Verify if the inline msg exists
   		If SI.lblInlineMsgPaymentAmount().Exist Then
   			LogMessage "RSLT","Verification","Inline Msg exists as expected." ,True
   		Else
   			LogMessage "WARN","Verification","Inline Msg Does not exists as expected." ,False
   		End If
   		If Not IsNull(strInlineMsg) Then
	       If Not VerifyInnerText (SI.lblInlineMsgPaymentAmount(), strInlineMsg, "Inline Msg")Then
	           bVerifyDescriptionText=false
	       End If
	   End If
	 Else
	 	'The inline message should not exists
	 	If SI.lblInlineMsgPaymentAmount().Exist Then
   			LogMessage "WARN","Verification","Inline Msg should not exist but is existing." ,False
   		Else
   			LogMessage "RSLT","Verification","Inline Msg Does not exist as expected." ,True
   		End If
   End If  
   verifyInlineMsgPaymentAmtText_SI=bVerifyDescriptionText
End Function

'[Verify Amount of Last Payment displayed as]
Public Function verifyLastPaymentAmountText(strPaymentAmount)
   bDevPending=false
   bverifyPaymentAmountText=true
   If Not IsNull(strPaymentAmount) Then
   		strActualVal = SI.txtLastPaymentAmount().GetRoProperty("value")
   		If trim(strPaymentAmount) =  trim(strActualVal) Then
   			LogMessage "RSLT","Verification","Amount of Last Payment matches. Expected: "&strPaymentAmount & "Actual:" &strActualVal ,True
   		else
   			LogMessage "WARN","Verification","Amount of Last Payment does not matche. Expected: "&strPaymentAmount & "Actual:" &strActualVal ,False
   			bverifyPaymentAmountText=false
   		End If
   End If
   verifyLastPaymentAmountText=bverifyPaymentAmountText
End Function

'[Verify Account to be charged on SI displayed as]
Public Function verifyAccountToBeCharged_SI(strCustSegment,strAccount)
   bDevPending=false
   bVerifyDescriptionText=true
   If strCustSegment = "0001" Then
   		If SI.lblAccountToBeCharged.Exist Then
   			'The field exists as expected
   			LogMessage "RSLT","Verification","The field Account to be Charged exists for the Mass Market." ,True
   			If Not IsNull(strAccount) Then
		       If Not VerifyInnerText (SI.lblAccountToBeCharged(), strAccount, "Account To Be Charged")Then
		           bVerifyDescriptionText=false
		       End If
		   End If
   		Else
   			LogMessage "WARN","Verification","The field Account to be Charged does not exist for the Mass Market." ,False
   			bVerifyDescriptionText = false
   		End If
   	Else
   		'for Non Mass customer it should not exist
   		If SI.lblFeeCharge.Exist Then
   			LogMessage "WARN","Verification","The field Account to be Charged exists for the Non-Mass Market." ,False
   			bVerifyDescriptionText = false
   		Else
   			LogMessage "RSLT","Verification","The field Account to be Charged does not exist for the Non-Mass Market." ,True
   		End If
   End If
   verifyAccountToBeCharged_SI=bVerifyDescriptionText
End Function

'[Verify Date of Fist Payment displayed as]
Public Function verifyDateOfFirstPaymentText(strSegment, strDateOfFirstPayment)
   bDevPending=false
   bverifyDateOfFirstPaymentText=true
   'Date of First payment field is visible only for the Non Mass Market
   If strSegment <> "0001" Then
   		'check the field
   		If Not IsNull(strDateOfFirstPayment) Then
	   		strActualVal = SI.txtFirstPaymentDate().GetRoProperty("value")
	   		If strDateOfFirstPayment =  strActualVal Then
	   			LogMessage "RSLT","Verification","Date of First Payment matches. Expected: "&strDateOfFirstPayment & "Actual:" &strActualVal ,True
	   		else
	   			LogMessage "WARN","Verification","Date of First Payment does not matche. Expected: "&strDateOfFirstPayment & "Actual:" &strActualVal ,False
	   			bverifyDateOfFirstPaymentText=false
	   		End If
	   End If
	   Else
	   	'if the field exists for Mass market, then it is a defect
	   	If SI.txtFirstPaymentDate().Exist Then
	   		LogMessage "WARN","Verification","Date of First Payment exists for the Mass Market." ,False
	   		bverifyDateOfFirstPaymentText=false
	   	Else
	   		LogMessage "RSLT","Verification","Date of First Payment does not exist for the Mass Market." ,True
	   		bverifyDateOfFirstPaymentText=True
	   	End If
   End If
   
   verifyDateOfFirstPaymentText=bverifyDateOfFirstPaymentText
End Function

'[Verify Field Fee Charge on SI Maintanence page displayed as]
Public Function verifyFeeCharge_SI(strFeeCharge)
   bDevPending=false
   bverifyFeeCharge_SI=true
   If Not IsNull(strFeeCharge) Then
       If Not VerifyInnerText (SI.lblFeeCharge(), strFeeCharge, "Fee Charge")Then
           bverifyFeeCharge_SI=false
       End If
   End If
   verifyFeeCharge_SI=bverifyFeeCharge_SI
End Function

'[Verify the Field Fee Charge is displayed on SI Screen]
Public Function verifyFeeChargeDsiplayed_SI(strCustSegment)
   bDevPending=false
   bverifyFeeCharge_SI=true
   '*** The field Fee Charge is applicable only for Personal Banking Customer
   If strCustSegment = "0001" Then
   		If SI.lblFeeCharge.Exist Then
   			'The field exists as expected
   			LogMessage "RSLT","Verification","The field Fee Charge exists for the Mass Market." ,True
   		Else
   			LogMessage "WARN","Verification","The field Fee Charge does not exist for the Mass Market." ,False
   			bverifyFeeCharge_SI = false
   		End If
   	Else
   		'for Non Mass customer it should not exist
   		If SI.lblFeeCharge.Exist Then
   			LogMessage "WARN","Verification","The field Fee Charge exists for the Non-Mass Market." ,False
   			bverifyFeeCharge_SI = false
   		Else
   			LogMessage "RSLT","Verification","The field Fee Charge does not exist for the Non-Mass Market." ,True
   		End If
   End If
   verifyFeeChargeDsiplayed_SI=bverifyFeeCharge_SI
End Function

'[Verify Confirmation PopUp on Clicking Cancel on SI Screen]
Public Function verifyPopUponCancel_SI()
	bverify = True
	SI.btnCancel.Click
	'Verify the popup exists
	If SI.PopUpConfirmationOnCancel.Exist Then
		LogMessage "RSLT","Verification","Confirmation Popup exists on clicking Cancel." ,True
	Else
		LogMessage "WARN","Verification","Confirmation Popup does not exist on clicking Cancel" ,False
	End If
	SI.btnNo_Cancel().Click
End Function

'[Set TextBox Beneficiary Full Name in SI Screen to]
Public Function setBeneficiaryFullName(strBenFullName)
   bDevPending=false
   SI.txtBeneficiaryFullName.Set(strBenFullName)
   If Err.Number<>0 Then
       setBeneficiaryFullName=false
            LogMessage "WARN","Verification","Failed to Set Text Box :Beneficiary Full Name" ,false
       Exit Function
   End If
   setBeneficiaryFullName=true
End Function

'[Set TextBox Beneficiary Bank Code in SI Screen to]
Public Function setBeneficiaryBankCode(strBenBankCode)
   bDevPending=false
   SI.txtBeneficiaryBankCode.Set(strBenBankCode)
   If Err.Number<>0 Then
       setBeneficiaryBankCode=false
            LogMessage "WARN","Verification","Failed to Set Text Box :Beneficiary Bank Code" ,false
       Exit Function
   End If
   setBeneficiaryBankCode=true
End Function

'[Set TextBox Beneficiary Bank Account Type in SI Screen to]
Public Function setBeneficiaryBankAcctType(strBenBankAcctType)
   bDevPending=false
   SI.txtBeneficiaryBankAcctType.Set(strBenBankAcctType)
   If Err.Number<>0 Then
       setBeneficiaryBankAcctType=false
            LogMessage "WARN","Verification","Failed to Set Text Box :Beneficiary Bank Account Type" ,false
       Exit Function
   End If
   setBeneficiaryBankAcctType=true
End Function

'[Set TextBox Beneficiary Account No in SI Screen to]
Public Function setBeneficiaryAcctNo(strBenAcctNo)
   bDevPending=false
   SI.txtBeneficiaryAccountNo.Set(strBenAcctNo)
   If Err.Number<>0 Then
       setBeneficiaryAcctNo=false
            LogMessage "WARN","Verification","Failed to Set Text Box :Beneficiary Account Number" ,false
       Exit Function
   End If
   setBeneficiaryAcctNo=true
End Function

'[Set TextBox Reference Number in SI Screen to]
Public Function setReferenceNo(strReferenceNo)
   bDevPending=false
   SI.txtReferenceNumber.Set(strReferenceNo)
   If Err.Number<>0 Then
       setReferenceNo=false
            LogMessage "WARN","Verification","Failed to Set Text Box :Beneficiary Account Number" ,false
       Exit Function
   End If
   setReferenceNo=true
End Function

'***** Get the current date from C Region
Public Function fetchCurrentDate_CIS()
	bDevPending = false
	'**** Login to CIS
	CISLogin gstrRegion_CIS,gstrUser_CIS,gstrPassword_CIS
	fSendKeys "[clear]" 
	fSendKeys "DFFA"
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	wait 1
	strDate = fGetText(strSession, "01", "071", "10")
	If instr(strDate,"/")=0 Then
		LogMessage "WARN","Verification","Login to CIS and fetching date failed",false
		fetchCurrentDate_CIS=false
	Exit Function
	 else
	LogMessage "RSLT","Verification","Login to CIS and fetching date Successful.",True
		fetchCurrentDate_CIS=true
	End If
		wait 1
	fetchCurrentDate_CIS = strDate
End Function

'[Set Notes in the SI Screen to]
Public Function setNotes_SI(strNotes)
   bDevPending=false
   SI.txtNotesDesc.Set(strNotes)
   If Err.Number<>0 Then
       setNotes_SI=false
            LogMessage "WARN","Verification","Failed to Set Text Box :Notes in SI" ,false
       Exit Function
   End If
   SI.btnSave.Click
   setNotes_SI=true
End Function

'[Set Comments in the SI Screen to]
Public Function setComments_SI(strComment)  
   bDevPending=False
   strTimeStamp = ""&now
	strComment =strComment &" "&strTimeStamp
	gstrRuntimeCommentStep= "Set Comments in the SI Screen to"
	gstrParameterNameStep = "TimeStamp"&replace((replace((replace(now,"/","-"))," ","-")),":","-")
	insertDataStore gstrParameterNameStep, strComment
	'insertDataStore "SRComment", strComments
   SI.txtComments.Set(strComment)
   If Err.Number<>0 Then
       setComments_SI=false
            LogMessage "WARN","Verification","Failed to Set Text Box :Comment" ,false
       Exit Function
   End If
   setComments_SI=true  
End Function

'[Click on Submit of SI Screen]
Public Function clickSubmit_SI()
	bDevPending=false
	SI.btnSubmit().Click
	If Err.Number<>0 Then
       clickSubmit_SI=false
            LogMessage "WARN","Verification","Failed to Click Submit button." ,false
       Exit Function
   End If
   clickSubmit_SI = true
End Function

'[Verify the Submission TM Approval message]
Public Function verifyTMApprovalMsg_SI(strTMMsg)
	bDevPending=false
	If Not IsNull(strTMMsg) Then
       If Not VerifyInnerText (SI.lblTMApprovalMsg(), strTMMsg, "MA Validation Message")Then
           verifyTMApprovalMsg_SI=false
       End If
   End If
   verifyTMApprovalMsg_SI = true
End Function

'[Click on OK of Submission PopUp]
Public Function clickOk_Submission()
	SI.btnOK_SubmissionPopUp().Click
	If Err.Number<>0 Then
       clickOk_Submission=false
            LogMessage "WARN","Verification","Failed to Click Ok button of Submission PopUp." ,false
       Exit Function
   End If
   clickOk_Submission = true
End Function

'[Verify the Account/Card No in the SR PopUp]
Public Function verifyAccountCardNo_SI(strAccount)
	verifyAccountCardNo_SI = true
	If Not IsNull(strAccount) Then
       If Not VerifyInnerText (SI.txtAccountCardNo_SR(), strAccount, "Account/Card No in SR Submission PopUp")Then
           verifyAccountCardNo_SI=false
       End If
   End If
   verifyAccountCardNo_SI = true
End Function

'[Verify the Product Description in the SR PopUp]
Public Function verifyProductDesc_SI(strProductDesc)
	verifyProductDesc_SI = true
	If Not IsNull(strProductDesc) Then
       If Not VerifyInnerText (SI.txtProductDesc_SR(), strProductDesc, "Product Description in SR Submission PopUp")Then
           verifyProductDesc_SI=false
       End If
   End If
   verifyProductDesc_SI = true
End Function

'[Verify the SR Status in the SR PopUp]
Public Function verifySRStatus_SI()
	verifySRStatus_SI = true
		strActualSRStatus = SI.txtSRStatus_SR().GetRoProperty("innerText")
		If isnull(strActualSRStatus) Then
			LogMessage "WARN","Verification","SR status is blank." ,False
		else
			LogMessage "RSLT","Verification","SR status is ."&strActualSRStatus ,True
			If strActualSRStatus = "Closed" Then
				'Then check SR Number is being displayed
				strSRNumber = SI.txtSRNumber_SR().GetRoProperty("innerText")
				If Not isnull(strSRNumber) Then
					LogMessage "RSLT","Verification","SR Number exists in the PopUp when the SR Status is closed." ,True
				Else
					LogMessage "WARN","Verification","SR Number does not exist in the PopUp when the SR Status is closed." ,False
				End If
			End If
		End If
   verifySRStatus_SI = true
End Function

'[Click on Close button of the SR PopUp]
Public Function clickClose_SR()
	clickClose_SR = true
	SI.btnClose_SI().Click
	If Err.Number<>0 Then
       clickClose_SR=false
            LogMessage "WARN","Verification","Failed to Click Close button." ,false
       Exit Function
   End If
   clickClose_SR = true
End Function

'[Verify structured comments displayed as]
Public Function verifyStructuredComments()
	verifyStructuredComments = true
	strActualCmts = SI.txtStructuredComments.GetRoProperty("innertext")
	Print strActualCmts	
End Function
