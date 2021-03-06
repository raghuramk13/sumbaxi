'*****This is auto generated code using code generator please Re-validate ****************
'******** For Current Credit Limit Table
'Dim strRunTimeRtlCrLimit:strRunTimeRtlCrLimit="" 'This Variable is used to Store Relationship credit limit in runtime
'Dim strRunTimeAcctTotalCrLimit:strRunTimeAcctTotalCrLimit="" 'This Variable is used to Store Account Total Credit Limit in runtime
'Dim strRunTimeEmbosserCrLimit:strRunTimeEmbosserCrLimit="" 'This Variable is used to Store Embosser Credit Limit in runtime

'******* For Outstanding Balances Table
'Dim strRunTimeRtlOutStandingBal:strRunTimeRtlOutStandingBal="" 'This Variable is used to Store Relationship Outstanding Balance
'Dim strRunTimeAcctOutStandingBal:strRunTimeAcctOutStandingBal="" 'This Variable is used to Store Account Outstanding Balance
'Dim strRunTimeEmbosserOutStandingBal:strRunTimeEmbosserOutStandingBal="" 'This Variable is used to Store Embosser Outstanding Balance
Dim strDueDateComments, strSubmitTime

'[Click Button NewIA]
Public Function clickButtonNewIACustOverView()
   bDevPending=true
   NewActivities.btnNewIA.click
   If Err.Number<>0 Then
       clickButtonNewIACustOverView=false
            LogMessage "WARN","Verification","Failed to Click Button : NewIA" ,false
       Exit Function
   End If
   waitForIcallLoading
   clickButtonNewIACustOverView=true
End Function

'******************Added by kalyan dated 9122016**************************
'[Check Button NewIA Enabled Disabled]
Public Function verifyButtonNewIAE(strStatus)
   bDevPending=true
   bverifyButtonNewIAE=true
   bverifyButtonNewIAE=CheckVaadinObject_Disabled1(NewActivities.btnNewIA(), strStatus)
   verifyButtonNewIAE=bverifyButtonNewIAE
End Function

'[Click Button Add CSO Home Page]
Public Function clickButtonNewIA()
   bDevPending=true
   NewActivities.btnNewIA.click
   If Err.Number<>0 Then
       clickButtonNewIA=false
            LogMessage "WARN","Verification","Failed to Click Button : NewIA" ,false
       Exit Function
   End If
   waitForIcallLoading
   clickButtonNewIA=true
End Function

'[Set IA Combobox Related To as]
Public Function selectRelatedToComboBoxIA1(strRelatedTo)
   
   bselectRelatedToComboBoxIA1=true
   If Not IsNull(strRelatedTo) Then
   	   selectItem_Combobox1 NewActivities.lstRelatedTo,NewActivities.txtIARelatedTo,strRelatedTo
   End If
   waitForIcallLoading
   selectRelatedToComboBoxIA1=bselectRelatedToComboBoxIA1
End Function

''[Select IA Combobox Related To as]
'Public Function selectRelatedToComboBoxIA(strRelatedTo)
'   bDevPending=false
'   bselectRelatedToComboBoxIA=true
'   If Not IsNull(strRelatedTo) Then
'       If Not (verifyComboList (strRelatedTo, Activities.lstRelatedTo()))Then
'            LogMessage "WARN","Verification","Failed to select :"&strRelatedTo&" From RelatedTo drop down list" ,false
'           bselectRelatedToComboBoxIA=false
'       End If
'   End If
'   waitForIcallLoading
'   selectRelatedToComboBoxIA=bselectRelatedToComboBoxIA
'End Function


'[Select IA Combobox Account Number as]
Public Function selectAccountNumberComboBoxIA(strAccountNumber)
   bDevPending=false
   bselectAccountNumberComboBoxIA=true

   If Not IsNull(strAccountNumber) Then
       If Not (verifyComboList (strAccountNumber, NewActivities.lstAccount()))Then
            LogMessage "WARN","Verification","Failed to select :"&strAccountNumber&" From Account Number drop down list" ,false
           bselectAccountNumberComboBoxIA=false
       End If
   End If
   waitForIcallLoading
   selectAccountNumberComboBoxIA=bselectAccountNumberComboBoxIA
End Function

'[Select IA Combobox Type as]
'Public Function selectTypeComboBoxIA(strType)
'   bDevPending=false
'   bselectTypeComboBoxIA=true
'
'   If Not IsNull(strType) Then
'       If Not (verifyComboList (strType, Activities.lstType()))Then
'            LogMessage "WARN","Verification","Failed to select :"&strType&" From Type drop down list" ,false
'           bselectTypeComboBoxIA=false
'       End If
'   End If
'   waitForIcallLoading
'   selectTypeComboBoxIA=bselectTypeComboBoxIA
'End Function

'[Set IA Combobox Type To as]
Public Function selectTypeComboBoxIA1(strType)
   
   bselectTypeComboBoxIA1=true
   If Not IsNull(strType) Then
       'Activities.lstType().set strType
       selectItem_Combobox1 NewActivities.lstType,NewActivities.txtIAType,strType
   End If
   waitForIcallLoading
   selectTypeComboBoxIA1=bselectTypeComboBoxIA1
End Function

'[Select IA Combobox Sub Type as]
'Public Function selectSubTypeComboBoxIA(strSubType)
'   bDevPending=false
'   bselectSubTypeComboBoxIA=true
'
'   If Not IsNull(strSubType) Then
'       If Not (verifyComboList (strSubType, Activities.lstSubType()))Then
'            LogMessage "WARN","Verification","Failed to select :"&strSubType&" From SubType drop down list" ,false
'           bselectSubTypeComboBoxIA=false
'       End If
'   End If
'   waitForIcallLoading
'   selectSubTypeComboBoxIA=bselectSubTypeComboBoxIA
'End Function

'[Set IA Combobox Sub Type as]
Public Function selectSubTypeComboBoxIA1(strSubType)
   
   bselectSubTypeComboBoxIA1=true
   If Not IsNull(strSubType) Then
       'Activities.lstSubType().set strSubType
       selectItem_Combobox1 NewActivities.lstSubType,NewActivities.txtIASubType,strSubType
   End If
   waitForIcallLoading
   selectSubTypeComboBoxIA1=bselectSubTypeComboBoxIA1
End Function


'[Set IA Combobox Product as]
Public Function selectProductComboBoxIA1(strProduct)
   
   bselectProductComboBoxIA1=true

  If Not IsNull(strProduct) Then
       'Activities.lstProduct().set strProduct
       selectItem_Combobox1 NewActivities.lstProduct,NewActivities.txtIAProdType,strProduct
   End If
   waitForIcallLoading
   selectProductComboBoxIA1=bselectProductComboBoxIA1
End Function


'[Select IA Combobox Product as]
'Public Function selectProductComboBoxIA(strProduct)
'   bDevPending=false
'   bselectProductComboBoxIA=true
'
'   If Not IsNull(strProduct) Then
'       If Not (verifyComboList (strProduct, Activities.lstProduct()))Then
'            LogMessage "WARN","Verification","Failed to select :"&strProduct&" From Product drop down list" ,false
'           bselectProductComboBoxIA=false
'       End If
'   End If
'   waitForIcallLoading
'   selectProductComboBoxIA=bselectProductComboBoxIA
'End Function

'[Set IA Combobox AssignedTo as]
Public Function selectAssignedToComboBoxIA1(strAssignedTo)
   bselectAssignedToComboBoxIA1=true
 
   If Not IsNull(strAssignedTo) Then
        'Activities.lstAssignTo().set strAssignedTo
        selectItem_Combobox1 NewActivities.lstAssignTo,NewActivities.txtIAAssigndTo,strAssignedTo
   End If
   waitForIcallLoading
   selectAssignedToComboBoxIA1=bselectAssignedToComboBoxIA1
End Function


'[Select IA Combobox AssignedTo as]
'Public Function selectAssignedToComboBoxIA(strAssignedTo)
'   bDevPending=false
'   bselectAssignedToComboBoxIA=true
' 
'   If Not IsNull(strAssignedTo) Then
'       If Not (verifyComboList (strAssignedTo, Activities.lstAssignTo()))Then
'            LogMessage "WARN","Verification","Failed to select :"&strAssignedTo&" From AssignedTo drop down list" ,false
'           bselectAssignedToComboBoxIA=false
'       End If
'   End If
'   waitForIcallLoading
'   selectAssignedToComboBoxIA=bselectAssignedToComboBoxIA
'End Function

'[Set IA Combobox Status as]
Public Function selectStatusComboBoxIA1(strStatus)
   bDevPending=false
   bselectStatusComboBoxIA1=true

   If Not IsNull(strStatus) Then
       'Activities.lstStatus().set strStatus
       selectItem_Combobox NewActivities.lstStatus,strStatus
   End If
   waitForIcallLoading
   selectStatusComboBoxIA1=bselectStatusComboBoxIA1
End Function

'[Select IA Combobox Status as]
'Public Function selectStatusComboBoxIA(strStatus)
'   bDevPending=false
'   bselectStatusComboBoxIA=true
'
'   If Not IsNull(strStatus) Then
'       If Not (verifyComboList (strStatus, Activities.lstStatus()))Then
'            LogMessage "WARN","Verification","Failed to select :"&strStatus&" From Status drop down list" ,false
'           bselectStatusComboBoxIA=false
'       End If
'   End If
'   waitForIcallLoading
'   selectStatusComboBoxIA=bselectStatusComboBoxIA
'End Function

'[Set IA Combobox Resolution as]
Public Function selectResolutionComboBoxIA1(strResolution)
   bDevPending=false
   bselectResolutionComboBoxIA1=true

   If Not IsNull(strResolution) Then
      'Activities.lstResolution().set strResolution
      selectItem_Combobox1 NewActivities.lstResolution,NewActivities.txtIAResolution,strResolution
   End If
   waitForIcallLoading
   selectResolutionComboBoxIA1=bselectResolutionComboBoxIA1
End Function

'[Select IA Combobox Resolution as]
'Public Function selectResolutionComboBoxIA(strResolution)
'   bDevPending=false
'   bselectResolutionComboBoxIA=true
'
'   If Not IsNull(strResolution) Then
'       If Not (verifyComboList (strResolution, Activities.lstResolution()))Then
'            LogMessage "WARN","Verification","Failed to select :"&strResolution&" From Resolution drop down list" ,false
'           bselectResolutionComboBoxIA=false
'       End If
'   End If
'   waitForIcallLoading
'   selectResolutionComboBoxIA=bselectResolutionComboBoxIA
'End Function


'[Click Button Submit NewIA]
Public Function clickButtonSubmitNewIA()
   bDevPending=false
   bclickButtonSubmitNewIA=true
   WaitForICallLoading
   NewActivities.btnSubmit.click
   WaitForICallLoading
   strSubmitTime = now
   If Err.Number<>0 Then
       bclickButtonSubmitNewIA=false
            LogMessage "WARN","Verification","Failed to Click Submit Button : NewIA" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickButtonSubmitNewIA=bclickButtonSubmitNewIA
End Function

'[Verify Button Submit NewIA disbaled]
Public Function VerifyButtonSubmitNewIA_Disbale()
  bVerifyButtonSubmitNewIA_Disbale=true	
	intbtnSUbmitNewIA =NewActivities.btnSubmit().GetROProperty("disabled")
	If not intbtnSUbmitNewIA=0 Then
		LogMessage "RSLT","Verification","Submit button is disabled as expected.",True
		bVerifyButtonSubmitNewIA_Disbale=true
	Else
		LogMessage "WARN","Verifiation","Submit button is enabled. Expected disabled.",false
		bVerifyButtonSubmitNewIA_Disbale=false
	End If
	VerifyButtonSubmitNewIA_Disbale=bVerifyButtonSubmitNewIA_Disbale
End Function

'[Verify Button Submit NewIA Enabled]
Public Function VerifyButtonSubmitNewIA_Enable()
  bVerifyButtonSubmitNewIA_Enable=true	
	'intbtnSubmitNewIA =Activities.btnSubmit().GetROProperty("outerhtml")
	intbtnSubmitNewIA =matchStr(NewActivities.btnSubmit().GetROProperty("outerhtml"),"false")
	If intbtnSubmitNewIA="True" Then
		LogMessage "RSLT","Verification","Submit button is enabled as expected.",True
		bVerifyButtonSubmitNewIA_Enable=true
	Else
		LogMessage "WARN","Verifiation","Submit button is disabled. Expected enabled.",false
		bVerifyButtonSubmitNewIA_Enable=false
	End If
	VerifyButtonSubmitNewIA_Enable=bVerifyButtonSubmitNewIA_Enable
End Function

'[Click Button Cancel NewIA]
Public Function clickButtonCancelNewIA()
   bDevPending=false
   bclickButtonCancelNewIA=true
   NewActivities.btnCancel.click
   If Err.Number<>0 Then
       bclickButtonCancelNewIA=false
            LogMessage "WARN","Verification","Failed to Click Cancel Button : NewIA" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickButtonCancelNewIA=bclickButtonCancelNewIA
End Function

'[Verify Button Cancel NewIA Enabled]
Public Function VerifyButtonCancelNewIA_Enable()
  bVerifyButtonCancelNewIA_Enable=true	
	intbtnCancelNewIA =matchStr(NewActivities.btnCancel().GetROProperty("outerhtml"),"false")
	If intbtnCancelNewIA="True" Then
		LogMessage "RSLT","Verification","Cancel button is enabled as expected.",True
		bVerifyButtonCancelNewIA_Enable=true
	Else
		LogMessage "WARN","Verifiation","Cancel button is disabled. Expected enabled.",false
		bVerifyButtonCancelNewIA_Enable=false
	End If
	VerifyButtonCancelNewIA_Enable=bVerifyButtonCancelNewIA_Enable
End Function

'[Click Button Yes Cancel Popup NewIA]
Public Function clickButtonYesCancelNewIA()
   bDevPending=false
   bclickButtonYesCancelNewIA=true
   NewActivities.btnYes.click
   If Err.Number<>0 Then
       bclickButtonYesCancelNewIA=false
            LogMessage "WARN","Verification","Failed to Click Yes Cancel Popup Button : NewIA" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickButtonYesCancelNewIA=bclickButtonYesCancelNewIA
End Function

'[Click Button No Cancel Popup NewIA]
Public Function clickButtonNoCancelNewIA()
   bDevPending=false
   bclickButtonNoCancelNewIA=true
   NewActivities.btnNo.click
   If Err.Number<>0 Then
       bclickButtonNoCancelNewIA=false
            LogMessage "WARN","Verification","Failed to Click No Cancel Popup Button : NewIA" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickButtonNoCancelNewIA=bclickButtonNoCancelNewIA
End Function

'[Click Button OK NewIA]
Public Function clickButtonOkNewIA()
   bDevPending=false
   bclickButtonOkNewIA=true
   NewActivities.btnOK.click
   If Err.Number<>0 Then
       bclickButtonOkNewIA=false
            LogMessage "WARN","Verification","Failed to Click OK Button : NewIA" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickButtonOkNewIA=bclickButtonOkNewIA
End Function

'[Set text on IA Comments textfield]
Public Function setComments_IA(strCommentsTxt)
	bsetComments_IA=true
	If Not IsNull(strCommentsTxt) Then
		NewActivities.txtComment().set strCommentsTxt
	End If
	WaitForICallLoading
	setComments_IA=bsetComments_IA
End Function

'[Click checkbox Once and Done for NewIA]
Public Function clickChkBoxOnceandDone()
   bDevPending=false
   bclickChkBoxOnceandDone=true
   NewActivities.chkOnceDone.click
   If Err.Number<>0 Then
       bclickChkBoxOnceandDone=false
            LogMessage "WARN","Verification","Failed to Click CheckBox Once and Done : NewIA" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickChkBoxOnceandDone=bclickChkBoxOnceandDone
End Function

'[Select Add IA DueDate as]
Public Function setDueDate_AddIA(txtDueDate)
	bsetDueDate_AddIA=true
	NewActivities.txtDueDate().set txtDueDate
	'strDueDateComments=strDueDateComments1
	'msgbox strDueDateComments
	'If Not IsNull(strDueDate) Then
	'	Activities.lblDueDate().set strDueDate
		
	'End If
	WaitForICallLoading
	setDueDate_AddIA=bsetDueDate_AddIA
End Function

'Added by Kalyan IA Prospects 1603 dated 28/07/2016

'[Set text on RefNo. textfield for New IA Prospects]
'Public Function setRefNo_IAProspects(strRefNo)
'	bsetRefNo_IAProspects=true
'	If Not IsNull(strRefNo) Then
'		Activities.txtProspectsRef().set strRefNo
'	End If
'	WaitForICallLoading
'	setRefNo_IAProspects=bsetRefNo_IAProspects
'End Function

'[Set text on NRIC textfield for New IA Prospects]
'Public Function setNRIC_IAProspects(strNRIC)
'	bsetNRIC_IAProspects=true
'	If Not IsNull(strNRIC) Then
'		Activities.txtProspectsNRIC().set strNRIC
'	End If
'	WaitForICallLoading
'	setNRIC_IAProspects=bsetNRIC_IAProspects
'End Function

'[Set text on Mobile textfield for New IA Prospects]
'Public Function setMobile_IAProspects(strMobile)
'	bsetMobile_IAProspects=true
'	If Not IsNull(strMobile) Then
'		Activities.txtProspectsMobile().set strMobile
'	End If
'	WaitForICallLoading
'	setMobile_IAProspects=bsetMobile_IAProspects
'End Function

'[Set text on FirstName textfield for New IA Prospects]
'Public Function setFstName_IAProspects(strFirstName)
'	bsetFstName_IAProspects=true
'	If Not IsNull(strFirstName) Then
'		Activities.txtProspectsFirstName().set strFirstName
'	End If
'	WaitForICallLoading
'	setFstName_IAProspects=bsetFstName_IAProspects
'End Function

'[Set text on DOB textfield for New IA Prospects]
'Public Function setDOB_IAProspects(strDOB)
	'bsetDOB_IAProspects=true
'	If Not IsNull(strDOB) Then
'		Activities.txtProspectsDateofBirth().set strDOB
'	End If
'	WaitForICallLoading
'	setDOB_IAProspects=bsetDOB_IAProspects
'End Function

'[Set text on EmailId textfield for New IA Prospects]
'Public Function setEmailId_IAProspects(strEmailId)
'	bsetEmailId_IAProspects=true
'	If Not IsNull(strEmailId) Then
'		Activities.txtProspectsEmailID().set strEmailId
'	End If
'	WaitForICallLoading
'	setEmailId_IAProspects=bsetEmailId_IAProspects
'End Function

'[Set text on LastName textfield for New IA Prospects]
'Public Function setLstName_IAProspects(strLastName)
'	bsetLstName_IAProspects=true
'	If Not IsNull(strLastName) Then
'		Activities.txtProspectsLastName().set strLastName
'	End If
'	WaitForICallLoading
'	setLstName_IAProspects=bsetLstName_IAProspects
'End Function

'[Verify Cancel Popup Message displayed as]
Public Function verifyCancelPopupMsg(strCancelPopupMsg)
   bDevPending=false
   bverifyCancelPopupMsg=true
	
   If Not IsNull(strCancelPopupMsg) Then
     If Not VerifyInnerText (NewActivities.lblCancelMessage(), strCancelPopupMsg, "Cancel Popup Msg")Then
	   bverifyCancelPopupMsg=false
	End If
   End If
   verifyCancelPopupMsg=bverifyCancelPopupMsg
End Function

'[Verify Submit Popup Product Desc displayed as]
Public Function verifySubmitPopupProductdesc(strSubmitPopupProdDesc)
   bDevPending=false
   bverifySubmitPopupProductdesc=true
	
   If Not IsNull(strSubmitPopupProdDesc) Then
     If Not VerifyInnerText (NewActivities.lblProductDesc(), strSubmitPopupProdDesc, "Submit Popup Prod Desc")Then
	   bverifySubmitPopupProductdesc=false
	End If
   End If
   verifySubmitPopupProductdesc=bverifySubmitPopupProductdesc
End Function

'[Verify Submit Popup Status displayed as]
Public Function verifySubmitPopupStatus(strSubmitPopupProdDesc)
   bDevPending=false
   bverifySubmitPopupStatus=true
	
   If Not IsNull(strSubmitPopupProdDesc) Then
     If Not VerifyInnerText (NewActivities.lblSubmitPopupStatus(), strSubmitPopupProdDesc, "Submit Popup Prod Desc")Then
	   bverifySubmitPopupStatus=false
	End If
   End If
   verifySubmitPopupStatus=bverifySubmitPopupStatus
End Function

'[Click Button Close Submit Popup NewIA]
Public Function clickButtonCloseNewIA()
   bDevPending=false
   bclickButtonCloseNewIA=true
   WaitForICallLoading
   NewActivities.btnClose_Popup.Click
   WaitForICallLoading
   If Err.Number<>0 Then
       bclickButtonCloseNewIA=false
            LogMessage "WARN","Verification","Failed to Click Close Button : Submit Popup NewIA" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickButtonCloseNewIA=bclickButtonCloseNewIA
End Function

'[Verify Submit Popup InfoWarn Msg displayed as]
Public Function verifySubmitPopupInfoWarnMsg(strSubmitPopupInfoWarnMsg)
   bDevPending=false
   bverifySubmitPopupInfoWarnMsgc=true
	
   If Not IsNull(strSubmitPopupInfoWarnMsg) Then
     If Not VerifyInnerText (NewActivities.txtInfoWarnMsg(), strSubmitPopupInfoWarnMsg, "Submit Popup Inof Msg")Then
	   bverifySubmitPopupInfoWarnMsg=false
	End If
   End If
   verifySubmitPopupInfoWarnMsg=bverifySubmitPopupInfoWarnMsg
End Function

'[Verify Validation Popup Error Msg displayed as]
Public Function verifyValidationPopupErrMsg(strValidationPopupErrMsg)
   bDevPending=false
   bverifyValidationPopupErrMsg=true
	
   If Not IsNull(strValidationPopupErrMsg) Then
     If Not VerifyInnerText (NewActivities.lblValidationErrMsg(), strValidationPopupErrMsg, "Validation Popup Err Msg")Then
	   bverifyValidationPopupErrMsg=false
	End If
   End If
   verifyValidationPopupErrMsg=bverifyValidationPopupErrMsg
End Function



