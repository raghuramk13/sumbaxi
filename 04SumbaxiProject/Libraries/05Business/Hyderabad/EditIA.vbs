'*****This is auto generated code using code generator please Re-validate ****************
'******** For Current Credit Limit Table
'Dim strRunTimeRtlCrLimit:strRunTimeRtlCrLimit="" 'This Variable is used to Store Relationship credit limit in runtime
'Dim strRunTimeAcctTotalCrLimit:strRunTimeAcctTotalCrLimit="" 'This Variable is used to Store Account Total Credit Limit in runtime
'Dim strRunTimeEmbosserCrLimit:strRunTimeEmbosserCrLimit="" 'This Variable is used to Store Embosser Credit Limit in runtime

'******* For Outstanding Balances Table
'Dim strRunTimeRtlOutStandingBal:strRunTimeRtlOutStandingBal="" 'This Variable is used to Store Relationship Outstanding Balance
'Dim strRunTimeAcctOutStandingBal:strRunTimeAcctOutStandingBal="" 'This Variable is used to Store Account Outstanding Balance
'Dim strRunTimeEmbosserOutStandingBal:strRunTimeEmbosserOutStandingBal="" 'This Variable is used to Store Embosser Outstanding Balance


'[Verify the EditIA button is enabled]
Public Function verifyEditIAbtn(strEnabled)
	verifyEditIAbtn = true
	btnDisabled = EditActivityIA.btnEdit().getroproperty("aria-disabled")
	'btnDisabled = 0 (if it is enabled); = 1 (if it is disabled)
	If btnDisabled = 1 Then
		'it is disabled
		If strEnabled = "False" Then
			LogMessage "RSLT","Verification","EditIA Button is disabled as expected." ,true
		else
			LogMessage "WARN","Verification","EditIA Button is enabled but was expected to be disabled." ,False
			verifyEditIAbtn = false
		End If
	else
		'the button is enabled
		If strEnabled = "True" Then
			LogMessage "RSLT","Verification","EditIA Button is enabled as expected." ,true
		else
			LogMessage "WARN","Verification","EditIA Button is disabled but was expected to be enabled." ,False
			verifyEditIAbtn = false
		End If
	End If
End Function


'[Click Button EditIA]
Public Function clickButtonEditIA()
   bDevPending=true
   EditActivityIA.btnEdit.click
   If Err.Number<>0 Then
       clickButtonEditIA=false
            LogMessage "WARN","Verification","Failed to Click Button : EditIA" ,false
       Exit Function
   End If
   waitForIcallLoading
   clickButtonEditIA=true
End Function

'[Verify Tab EditIA displayed]
Public Function verifyTabEditIAexist(strTabName)
   bDevPending=false
   verifyTabEditIAexist=verifyTabExist(strTabName)
End Function

'[Verify Edit IA Combobox Related To as]
Public Function selectRelatedToComboBoxEditIA(strRelatedTo)
   bDevPending=false
   bselectRelatedToComboBoxEditIA=true
   If Not IsNull(strRelatedTo) Then
     If Not VerifyInnerText (EditActivityIA.lblRelatedTo(), strRelatedTo, "Related To")Then
	   bselectRelatedToComboBoxEditIA=false
	End If
   End If
   selectRelatedToComboBoxEditIA=bselectRelatedToComboBoxEditIA
End Function

'[Verify Edit IA Combobox Account Number as]
Public Function selectAccountNumberComboBoxEditIA(strAccountNumber)
   bDevPending=false
   bselectAccountNumberComboBoxEditIA=true
   If Not IsNull(strAccountNumber) Then
       If Not VerifyInnerText (EditActivityIA.lblAccountNumber(), strAccountNumber, "Account Number")Then
           bselectAccountNumberComboBoxEditIA=false
       End If
   End If
   selectAccountNumberComboBoxEditIA=bselectAccountNumberComboBoxEditIA
End Function

'[Verify Edit IA Combobox Type as]
Public Function selectTypeComboBoxEditIA(strType)
   bDevPending=false
   bselectTypeComboBoxEditIA=true
   waitForIcallLoading
   If Not IsNull(strType) Then
       If Not VerifyInnerText (EditActivityIA.lblType(), strType, "Type")Then
           bselectTypeComboBoxEditIA=false
       End If
   End If
   waitForIcallLoading
   selectTypeComboBoxEditIA=bselectTypeComboBoxEditIA
End Function

'[Verify Edit IA Combobox Sub Type as]
Public Function selectSubTypeComboBoxEditIA(strSubType)
   bDevPending=false
   bselectSubTypeComboBoxEditIA=true
   waitForIcallLoading
    If Not IsNull(strSubType) Then
       If Not VerifyInnerText (EditActivityIA.lblSubType(), strSubType, "SubType")Then
           bselectSubTypeComboBoxEditIA=false
       End If
   End If
   waitForIcallLoading
   selectSubTypeComboBoxEditIA=bselectSubTypeComboBoxEditIA
End Function


'[Verify Edit IA Combobox Product as]
Public Function selectProductComboBoxEditIA(strProduct)
   bDevPending=false
   bselectProductComboBoxEditIA=true
   waitForIcallLoading
    If Not IsNull(strProduct) Then
       If Not VerifyInnerText (EditActivityIA.lblProduct(), strProduct, "Product")Then
           bselectProductComboBoxEditIA=false
       End If
   End If
   waitForIcallLoading
   selectProductComboBoxEditIA=bselectProductComboBoxEditIA
End Function


'[Set Edit IA Combobox AssignedTo as]
Public Function selectAssignedToComboBoxEditIA1(strAssignedTo)
   bselectAssignedToComboBoxEditIA1=true
   If Not IsNull(strAssignedTo) Then
       'EditActivityIA.txtEditIAAssigndTo().set strAssignedTo
       selectItem_Combobox1 EditActivityIA.lstEditIAAssignTo,EditActivityIA.txtEditIAAssigndTo,strAssignedTo
   End If
   waitForIcallLoading
   selectAssignedToComboBoxEditIA1=bselectAssignedToComboBoxEditIA1
End Function

''[Select Edit IA Combobox AssignedTo as]
'Public Function selectAssignedToComboBoxEditIA(strAssignedTo)
'   bDevPending=false
'   bselectAssignedToComboBoxEditIA=true
'   waitForIcallLoading
'   If Not IsNull(strAssignedTo) Then
'       If Not (verifyComboList (strAssignedTo, EditActivityIA.txtAssignedTo()))Then
'            LogMessage "WARN","Verification","Failed to select :"&strAssignedTo&" From AssignedTo drop down list" ,false
'           bselectAssignedToComboBoxEditIA=false
'       End If
'   End If
'   waitForIcallLoading
'   selectAssignedToComboBoxEditIA=bselectAssignedToComboBoxEditIA
'End Function

'[Set Edit IA Combobox Status as]
Public Function selectStatusComboBoxEditIA1(strStatus)
   bselectStatusComboBoxEditIA1=true
   If Not IsNull(strStatus) Then
       EditActivityIA.txtEditIAStatus().set strStatus
   End If
   waitForIcallLoading
   selectStatusComboBoxEditIA1=bselectStatusComboBoxEditIA1
End Function

''[Select Edit IA Combobox Status as]
'Public Function selectStatusComboBoxEditIA(strStatus)
'   bDevPending=false
'   bselectStatusComboBoxEditIA=true
'   waitForIcallLoading
'   If Not IsNull(strStatus) Then
'       If Not (verifyComboList (strStatus, EditActivityIA.txtStatus()))Then
'            LogMessage "WARN","Verification","Failed to select :"&strStatus&" From Status drop down list" ,false
'           bselectStatusComboBoxEditIA=false
'       End If
'   End If
'   waitForIcallLoading
'   selectStatusComboBoxEditIA=bselectStatusComboBoxEditIA
'End Function


'[Set Edit IA Combobox Resolution as]
Public Function selectResolutionComboBoxEditIA1(strResolution)
   bselectResolutionComboBoxEditIA1=true
   If Not IsNull(strResolution) Then
      EditActivityIA.txtEditIAResolution().set strResolution
      'selectItem_Combobox1 EditActivityIA.lstEditIAResolution,EditActivityIA.txtEditIAResolution,strResolution
   End If
   waitForIcallLoading
   selectResolutionComboBoxEditIA1=bselectResolutionComboBoxEditIA1
End Function

''[Select Edit IA Combobox Resolution as]
'Public Function selectResolutionComboBoxEditIA(strResolution)
'   bDevPending=false
'   bselectResolutionComboBoxEditIA=true
'   waitForIcallLoading
'   If Not IsNull(strResolution) Then
'       If Not (verifyComboList (strResolution, EditActivityIA.txtResolution()))Then
'            LogMessage "WARN","Verification","Failed to select :"&strResolution&" From Resolution drop down list" ,false
'           bselectResolutionComboBoxEditIA=false
'       End If
'   End If
'   waitForIcallLoading
'   selectResolutionComboBoxEditIA=bselectResolutionComboBoxEditIA
'End Function


'[Click Button Submit Edit IA]
Public Function clickButtonSubmitEditIA()
   bDevPending=false
   bclickButtonSubmitEditIA=true
   EditActivityIA.btnSubmit.click
   If Err.Number<>0 Then
       bclickButtonSubmitEditIA=false
            LogMessage "WARN","Verification","Failed to Click Submit Button : EditIA" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickButtonSubmitEditIA=bclickButtonSubmitEditIA
End Function

'[Click Button Cancel Edit IA]
Public Function clickButtonCancelEditIA()
   bDevPending=false
   bclickButtonCancelEditIA=true
   EditActivityIA.btnCancel.click
   If Err.Number<>0 Then
       bclickButtonCancelEditIA=false
            LogMessage "WARN","Verification","Failed to Click Cancel Button : EditIA" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickButtonCancelEditIA=bclickButtonCancelEditIA
End Function

'[Click Button Yes Edit IA]
Public Function clickButtonYesEditIA()
   bDevPending=false
   bclickButtonYesEditIA=true
   EditActivityIA.btnYes.click
   If Err.Number<>0 Then
       bclickButtonYesEditIA=false
            LogMessage "WARN","Verification","Failed to Click Yes Button : EditIA" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickButtonYesEditIA=bclickButtonYesEditIA
End Function

'[Click Button No Edit IA]
Public Function clickButtonNoEditIA()
   bDevPending=false
   bclickButtonNoEditIA=true
   EditActivityIA.btnNo.click
   If Err.Number<>0 Then
       bclickButtonNoEditIA=false
            LogMessage "WARN","Verification","Failed to Click No Button : EditIA" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickButtonNoEditIA=bclickButtonNoEditIA
End Function

'[Click Button OK Edit IA]
Public Function clickButtonOkEditIA()
   bDevPending=false
   bclickButtonOkEditIA=true
   EditActivityIA.btnOK.click
   If Err.Number<>0 Then
       bclickButtonOkEditIA=false
            LogMessage "WARN","Verification","Failed to Click OK Button : EditIA" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickButtonOkEditIA=bclickButtonOkEditIA
End Function

'[Set text on Edit IA Comments textfield]
Public Function setComments_EditIA(strCommentsTxt)
	bsetComments_EditIA=true
	If Not IsNull(strCommentsTxt) Then
		EditActivityIA.txtComment().set strCommentsTxt
	End If
	WaitForICallLoading
	setComments_EditIA=bsetComments_EditIA
End Function



'[Verify Once and Done is disabled on Edit IA]
Public Function verifyOnceandDone_Disable()
	bverifyOnceandDone_Disable=true	
	intlblOnceandDone =InStr(EditActivityIA.chkOnceDone.GetROProperty("class"),"aria-disabled")
	If not intlblOnceandDone=0 Then
		LogMessage "RSLT","Verification","Once and Done label is disabled as expected.",True
		bverifyOnceandDone_Disable=true
	Else
		LogMessage "WARN","Verifiation","Once and Done label is enabled. Expected disabled.",false
		bverifyOnceandDone_Disable=false
	End If
	verifyOnceandDone_Disable=bverifyOnceandDone_Disable
End Function

'[Select Edit IA DueDate as]
Public Function setDueDate_EditIA1(strDueDate)
	bsetDueDate_EditIA1=true
	If Not IsNull(strDueDate) Then
		EditActivityIA.txtDueDate().set strDueDate
	End If
	WaitForICallLoading
	setDueDate_EditIA1=bsetDueDate_EditIA1
End Function

