'*****This is auto generated code using code generator please Re-validate ****************
'******** For Current Credit Limit Table
'Dim strRunTimeRtlCrLimit:strRunTimeRtlCrLimit="" 'This Variable is used to Store Relationship credit limit in runtime
'Dim strRunTimeAcctTotalCrLimit:strRunTimeAcctTotalCrLimit="" 'This Variable is used to Store Account Total Credit Limit in runtime
'Dim strRunTimeEmbosserCrLimit:strRunTimeEmbosserCrLimit="" 'This Variable is used to Store Embosser Credit Limit in runtime

'******* For Outstanding Balances Table
'Dim strRunTimeRtlOutStandingBal:strRunTimeRtlOutStandingBal="" 'This Variable is used to Store Relationship Outstanding Balance
'Dim strRunTimeAcctOutStandingBal:strRunTimeAcctOutStandingBal="" 'This Variable is used to Store Account Outstanding Balance
'Dim strRunTimeEmbosserOutStandingBal:strRunTimeEmbosserOutStandingBal="" 'This Variable is used to Store Embosser Outstanding Balance

Dim strSrSubmitTime

'[Click Button NewSR]
Public Function clickButtonNewSR()
   bDevPending=true
   NewSR.btnNewSR.click
   If Err.Number<>0 Then
       clickButtonNewSR=false
            LogMessage "WARN","Verification","Failed to Click Button : NewSR" ,false
       Exit Function
   End If
   waitForIcallLoading
   clickButtonNewSR=true
End Function

'[Click Button EditSR]
Public Function clickButtonEditSR()
   bDevPending=true
   ServiceRequest.btnEdit.click
   If Err.Number<>0 Then
       clickButtonEditSR=false
            LogMessage "WARN","Verification","Failed to Click Button : EditSR" ,false
       Exit Function
   End If
   waitForIcallLoading
   clickButtonEditSR=true
End Function

'[Click Button Yes Edit SR]
Public Function clickButtonYesEditSR()
   bDevPending=true
   ServiceRequest.btnYesSR.click
   If Err.Number<>0 Then
       clickButtonYesEditSR=false
            LogMessage "WARN","Verification","Failed to Click Button Yes : EditSR" ,false
       Exit Function
   End If
   waitForIcallLoading
   clickButtonYesEditSR=true
End Function
'******************Added by kalyan dated 9122016**************************
'[Check Button NewSR Enabled Disabled]
Public Function verifyButtonNewSRE(strStatus)
   bDevPending=true
   bverifyButtonNewSRE=true
   bverifyButtonNewSRE=CheckVaadinObject_Disabled1(NewSR.btnNewSR(), strStatus)
   verifyButtonNewSRE=bverifyButtonNewSRE
End Function

'[Select Combobox Related To as]
Public Function selectRelatedToComboBox(strRelatedTo)
   bDevPending=false
   bselectRelatedToComboBox=true
   waitForIcallLoading
   If Not IsNull(strRelatedTo) Then
       If Not (selectItem_Combobox (NewSR.lstRelatedTo(), strRelatedTo))Then
            LogMessage "WARN","Verification","Failed to select :"&strRelatedTo&" From RelatedTo drop down list" ,false
           bselectRelatedToComboBox=false
       End If
   End If
   waitForIcallLoading
   selectRelatedToComboBox=bselectRelatedToComboBox
End Function

'[Verify default value of Combobox Related To displayed as]
Public Function verifyDefltRelatedToComboBox(strDRelatedTo)
   bDevPending = false
   bverifyDefltRelatedToComboBox = true
   waitForIcallLoading
   If Not IsNull(strDRelatedTo) Then
       If Not verifyComboSelectItem (NewSR.lstRelatedTo(), strDRelatedTo, "Related To") Then
           LogMessage "WARN","Verification","Default value doesnt match with expected value" ,false
           bverifyDefltRelatedToComboBox = false
       End If
   End If
   verifyDefltRelatedToComboBox = bverifyDefltRelatedToComboBox
End Function

'[Select Combobox Account Number as]
Public Function selectAccountNumberComboBox(strAccountNumber)
   bDevPending=false
   bselectAccountNumberComboBox=true
   waitForIcallLoading
   If Not IsNull(strAccountNumber) Then
       If Not (selectItem_Combobox (NewSR.lstAccountNumber(), strAccountNumber))Then
            LogMessage "WARN","Verification","Failed to select :"&strAccountNumber&" From Account Number drop down list" ,false
           bselectAccountNumberComboBox=false
       End If
   End If
   waitForIcallLoading
   selectAccountNumberComboBox=bselectAccountNumberComboBox
End Function

'[Select Combobox Type as]
Public Function selectTypeComboBox(strType)
   bDevPending=false
   bselectTypeComboBox=true
   waitForIcallLoading
   If Not IsNull(strType) Then
       If Not (selectItem_Combobox (NewSR.lstType(), strType))Then
            LogMessage "WARN","Verification","Failed to select :"&strType&" From Type drop down list" ,false
           bselectTypeComboBox=false
       End If
   End If
   waitForIcallLoading
   selectTypeComboBox=bselectTypeComboBox
End Function

'[Verify Default value of Combobox Type displayed as]
Public Function verifyTypeComboboxas(strDType)
	bDevPending = False
	bverifyTypeComboboxas = True
	waitForIcallLoading
	If Not IsNull(strDType) Then
		 If Not verifyComboSelectItem (NewSR.lstType(), strDType, "Type") Then
           LogMessage "WARN","Verification","Type Combobox Default value doesnt match with expected value" ,false
           bverifyTypeComboboxas = False
       End If
	End If
	verifyTypeComboboxas = bverifyTypeComboboxas
End Function

'[Verify AssignedTo is disabled in New SR]
Public Function verifyAssignTo_Disable()
	bverifyAssignTo_Disable=true	
	intAssignedTo =InStr(NewSR.lstAssignedTo.GetROProperty("class"),"disabled-area")
	If not intAssignedTo=0 Then
		LogMessage "RSLT","Verification","Assigned To Field is disable as expected.",True
		bverifyAssignTo_Disable=true
	Else
		LogMessage "WARN","Verifiation","Assigned To Field is enable. Expected to be disable.",false
		bverifyAssignTo_Disable=false
	End If
	verifyAssignTo_Disable=bverifyAssignTo_Disable
End Function


'[Select Combobox Sub Type as]
Public Function selectSubTypeComboBox(strSubType)
   bDevPending=false
   bselectSubTypeComboBox=true
   waitForIcallLoading
   If Not IsNull(strSubType) Then
       If Not (selectItem_Combobox (NewSR.lstSubType(), strSubType))Then
            LogMessage "WARN","Verification","Failed to select :"&strSubType&" From SubType drop down list" ,false
           bselectSubTypeComboBox=false
       End If
   End If
   waitForIcallLoading
   NewSR.btnGo.click
   
   If Err.Number<>0 Then
       bselectSubTypeComboBox=false
            LogMessage "WARN","Verification","Failed to Click Button : Go" ,false
       Exit Function
   End If
   waitForIcallLoading
   selectSubTypeComboBox=bselectSubTypeComboBox
End Function


'[Verify Default value of Combobox SubType displayed as]
Public Function verifySubTypeCombobox(strDSubType)
	bDevPending = False
	bverifySubTypeCombobox = True
	waitForIcallLoading
	If Not IsNull(strDSubType) Then
		 If Not verifyComboSelectItem (NewSR.lstSubType(), strDSubType, "Sub Type") Then
           LogMessage "WARN","Verification","Sub Type Combobox Default value "&strDSubType&" doesnt match with expected value" ,false
           bverifySubTypeCombobox = False
       End If
	End If
	verifySubTypeCombobox = bverifySubTypeCombobox
End Function

'[Verify default Assigned To Value]
Public Function verifyDefaultAssignedTo(strSubType)
	bDevPending=false
   bverifyDefaultAssignedTo=true
   If Not IsNull(strSubType) Then
		waitForIcallLoading
		strQuery="select Assigned_To_ICALL from cca_prm_sr_relto inner join cca_prm_sr_type on cca_prm_sr_relto.RLT_ID=cca_prm_sr_type.RLT_ID inner join cca_prm_sr_subtype on cca_prm_sr_type.RT_ID=cca_prm_sr_subtype.rt_id inner join cca_prm_sr_other on cca_prm_sr_subtype.otherparameo_ot_id=cca_prm_sr_other.ot_id where req_sub_type='"&strSubType&"'"
		strRslt=getDBValForColumn_FE(strQuery)(0)
		waitForIcallLoading
		strAssignedToRT=NewSR.lstAssignedTo.GetROProperty("Value")
		'strAssignedToRT=NewSR.lstAssignedTo.GetContent()
		If Ucase(Trim(strAssignedToRT)) = UCase(Trim(strRslt)) Then
			LogMessage "RSLT","Verification","Default Assigned To matching with the expected value. Expected: "& strRslt &" , Actual: "& strAssignedToRT ,True
			bverifyDefaultAssignedTo=true
		Else
			bverifyDefaultAssignedTo = False
			LogMessage "WARN","Verification","Default Assigned To not matching with the expected value. Expected: "& strRslt &" , Actual: "& strAssignedToRT ,False
		End If
   End If
	verifyDefaultAssignedTo=bverifyDefaultAssignedTo
End Function


'[Select Combobox Product as]
Public Function selectProductComboBox(strProduct)
   bDevPending=false
   bselectProductComboBox=true
   waitForIcallLoading
   If Not IsNull(strProduct) Then
       If Not (selectItem_Combobox (NewSR.lstProduct(), strProduct))Then
            LogMessage "WARN","Verification","Failed to select :"&strProduct&" From Product drop down list" ,false
           bselectProductComboBox=false
       End If
   End If
   waitForIcallLoading
   selectProductComboBox=bselectProductComboBox
End Function

'[Verify Description Text for Capture Source]
Public Function verifyDescription(strDescription)
  verifyDescription=true
  If Not IsNull(strDescription) Then
    If Not verifyInnerText(NewSR.lblDescription(), strDescription, "Capture Source Description") Then
       verifyDescription=false
    End If
  End If
End Function

'[Select Combobox AssignedTo as]
Public Function selectAssignedToComboBox(strAssignedTo)
   bDevPending=false
   bselectAssignedToComboBox=true
   waitForIcallLoading
   If Not IsNull(strAssignedTo) Then
       If Not (selectItem_Combobox (ServiceRequest.lstAssignTo(), strAssignedTo))Then
            LogMessage "WARN","Verification","Failed to select :"&strAssignedTo&" From AssignedTo drop down list" ,false
           bselectAssignedToComboBox=false
       End If
   End If
   waitForIcallLoading
   selectAssignedToComboBox=bselectAssignedToComboBox
End Function

'[Verify AssignedTo Combobox has Items]
Public Function verifyAssignedToComboboxItems(lstAssignedToItems)
   bverifyAssignedToComboboxItems=true
   If Not IsNull(lstAssignedToItems) Then
       If Not verifyComboboxItems (NewSR.lstAssignedTo(), lstAssignedToItems, "Assigned To List")Then
           bverifyAssignedToComboboxItems=false
       End If
   End If
   verifyAssignedToComboboxItems=bverifyAssignedToComboboxItems
End Function


'[Select Combobox Status as]
Public Function selectStatusComboBox(strStatus)
   bDevPending=false
   bselectStatusComboBox=true
   waitForIcallLoading
   If Not IsNull(strStatus) Then
       If Not (selectItem_Combobox (ServiceRequest.lstStatus(), strStatus))Then
            LogMessage "WARN","Verification","Failed to select :"&strStatus&" From Status drop down list" ,false
           bselectStatusComboBox=false
       End If
   End If
   waitForIcallLoading
   selectStatusComboBox=bselectStatusComboBox
End Function

'[Select Combobox SubStatus as]
Public Function selectSubStatusComboBox(strSubStatus)
   bDevPending=false
   bselectSubStatusComboBox=true
   waitForIcallLoading
   If Not IsNull(strSubStatus) Then
       If Not (selectItem_Combobox (ServiceRequest.lstSubStatus(), strSubStatus))Then
            LogMessage "WARN","Verification","Failed to select :"&strSubStatus&" From SubStatus drop down list" ,false
           bselectSubStatusComboBox=false
       End If
   End If
   waitForIcallLoading
   selectSubStatusComboBox=bselectSubStatusComboBox
End Function

'[Select Combobox RequestExecuted as]
Public Function selectRequestExecutedComboBox(strRequestExecuted)
   bDevPending=false
   bselectRequestExecutedComboBox=true
   waitForIcallLoading
   If Not IsNull(strRequestExecuted) Then
       If Not (selectItem_Combobox (NewSR.lstRequestExecuted(), strRequestExecuted))Then
            LogMessage "WARN","Verification","Failed to select :"&strRequestExecuted&" From RequestExecuted drop down list" ,false
           bselectRequestExecutedComboBox=false
       End If
   End If
   waitForIcallLoading
   selectRequestExecutedComboBox=bselectRequestExecutedComboBox
End Function

'[Select Combobox Priority as]
Public Function selectPriorityComboBox(strPriority)
   bDevPending=false
   bselectPriorityComboBox=true
   waitForIcallLoading
   If Not IsNull(strPriority) Then
       If Not (selectItem_Combobox (NewSR.lstPriority(), strPriority))Then
            LogMessage "WARN","Verification","Failed to select :"&strPriority&" From Priority drop down list" ,false
           bselectPriorityComboBox=false
       End If
   End If
   waitForIcallLoading
   selectPriorityComboBox=bselectPriorityComboBox
End Function

'[Select Combobox FollowupRequired as]
Public Function selectFollowupRequiredComboBox(strFollowupRequired)
   bDevPending=false
   bselectFollowupRequiredComboBox=true
   waitForIcallLoading
   If Not IsNull(strFollowupRequired) Then
       If Not (selectItem_Combobox (NewSR.lstFollowupRequired(), strFollowupRequired))Then
            LogMessage "WARN","Verification","Failed to select :"&strFollowupRequired&" From FollowupRequired drop down list" ,false
           bselectFollowupRequiredComboBox=false
       End If
   End If
   waitForIcallLoading
   selectFollowupRequiredComboBox=bselectFollowupRequiredComboBox
End Function

'[Verify ManagerApproval Text for Capture Source]
Public Function verifyManagerApproval(strManagerApproval)
	bverifyManagerApproval=true
	If Not verifyFieldValue(NewSR.lblManagerApproval(), strManagerApproval, "Capture Source ManagerApproval") Then
		bverifyManagerApproval=false
	End If
	verifyManagerApproval=bverifyManagerApproval
End Function

'[Select Combobox ManagerApproval as]
Public Function selectManagerApprovalComboBox(strManagerApproval)
   bDevPending=false
   bselectManagerApprovalComboBox=true
   waitForIcallLoading
   If Not IsNull(strManagerApproval) Then
       If Not (selectItem_Combobox (NewSR.lblManagerApproval(), strManagerApproval))Then
            LogMessage "WARN","Verification","Failed to select :"&strManagerApproval&" From ManagerApproval drop down list" ,false
           bselectManagerApprovalComboBox=false
       End If
   End If
   waitForIcallLoading
   selectManagerApprovalComboBox=bselectManagerApprovalComboBox
End Function

'****************Triplet set2 dynamic fields**************

'[Select Combobox DynFldPurposeofWaiver as]
Public Function selectDynFldPurposeofWaiverComboBox(strDynFldPurposeofWaiver)
   bDevPending=false
   bselectDynFldPurposeofWaiverComboBox=true
   waitForIcallLoading
   If Not IsNull(strDynFldPurposeofWaiver) Then
       If Not (selectItem_Combobox (NewSR.lstDynFldPurposeofWaiver(), strDynFldPurposeofWaiver))Then
            LogMessage "WARN","Verification","Failed to select :"&strDynFldPurposeofWaiver&" From DynFldPurposeofWaiver drop down list" ,false
           bselectDynFldPurposeofWaiverComboBox=false
       End If
   End If
   waitForIcallLoading
   selectDynFldPurposeofWaiverComboBox=bselectDynFldPurposeofWaiverComboBox
End Function

'[Verify DynFldPurposeofWaiver Combobox has Items]
Public Function verifyDynFldPurposeofWaiverComboboxItems(lstDynFldPurposeofWaiverItems)
   bverifyDynFldPurposeofWaiverComboboxItems=true
   If Not IsNull(lstDynFldPurposeofWaiverItems) Then
       If Not verifyComboboxItems (NewSR.lstDynFldPurposeofWaiver(), lstDynFldPurposeofWaiverItems, "DynFldPurposeofWaiver Items")Then
           bverifyDynFldPurposeofWaiverComboboxItems=false
       End If
   End If
   verifyDynFldPurposeofWaiverComboboxItems=bverifyDynFldPurposeofWaiverComboboxItems
End Function

'[Select Combobox DynFldAccountNumber as]
Public Function selectDynFldAccountNumber(strDynFldAccountNumber)
   bDevPending=false
   bselectDynFldAccountNumber=true
   waitForIcallLoading
   If Not IsNull(strDynFldAccountNumber) Then
       If Not (selectItem_Combobox (NewSR.lstDynFldAccountNumber(), strDynFldAccountNumber))Then
            LogMessage "WARN","Verification","Failed to select :"&strDynFldAccountNumber&" From DynFldAccountNumber drop down list" ,false
           bselectDynFldAccountNumber=false
       End If
   End If
   waitForIcallLoading
   selectDynFldAccountNumber=bselectDynFldAccountNumber
End Function

'[Set Amount on DynFldAmount textfield for Capture Source]
Public Function setDynFldAmount(strDynFldAmount)
	bsetDynFldAmount=true
	If Not IsNull(strDynFldAmount) Then
		NewSR.txtDynFldAmount().set strDynFldAmount
	End If
	WaitForICallLoading
	setDynFldAmount=bsetDynFldAmount
End Function

'***********************************************************************************

'********************************Triplet3 Capture at source********************************

'[Set code on DynFldCampaignCode textfield for Capture Source]
Public Function setDynFldCampaignCode(strDynFldCampaignCode)
	bsetDynFldCampaignCode=true
	If Not IsNull(strDynFldCampaignCode) Then
		NewSR.txtDynFldCampaignCode().set strDynFldCampaignCode
	End If
	WaitForICallLoading
	setDynFldCampaignCode=bsetDynFldCampaignCode
End Function

'[Select Combobox DynFldSalCredCASANo as]
Public Function selectDynFldSalCredCASANoComboBox(strDynFldSalCredCASANo)
   bDevPending=false
   bselectDynFldSalCredCASANoComboBox=true
   waitForIcallLoading
   If Not IsNull(strDynFldSalCredCASANo) Then
       If Not (selectItem_Combobox (NewSR.lstDynFldSalCredCASANo(), strDynFldSalCredCASANo))Then
            LogMessage "WARN","Verification","Failed to select :"&strDynFldSalCredCASANo&" From DynFldSalCredCASANo drop down list" ,false
           bselectDynFldSalCredCASANoComboBox=false
       End If
   End If
   waitForIcallLoading
   selectDynFldSalCredCASANoComboBox=bselectDynFldSalCredCASANoComboBox
End Function

'[Set name on DynFldNameCurntCompny textfield for Capture Source]
Public Function setDynFldNameCurntCompny(strDynFldNameCurntCompny)
	bsetDynFldNameCurntCompny=true
	If Not IsNull(strDynFldNameCurntCompny) Then
		NewSR.txtDynFldNameCurntCompny().set strDynFldNameCurntCompny
	End If
	WaitForICallLoading
	setDynFldNameCurntCompny=bsetDynFldNameCurntCompny
End Function

'[Select Combobox DynFldJobStatus as]
Public Function selectDynFldJobStatus(strDynFldJobStatus)
   bDevPending=false
   bselectDynFldJobStatus=true
   waitForIcallLoading
   If Not IsNull(strDynFldJobStatus) Then
       If Not (selectItem_Combobox (NewSR.lstDynFldJobStatus(), strDynFldJobStatus))Then
            LogMessage "WARN","Verification","Failed to select :"&strDynFldJobStatus&" From DynFldJobStatus drop down list" ,false
           bselectDynFldJobStatus=false
       End If
   End If
   waitForIcallLoading
   selectDynFldJobStatus=bselectDynFldJobStatus
End Function

'[Set title on DynFldJobTitle textfield for Capture Source]
Public Function setDynFldJobTitle(strDynFldJobTitle)
	bsetDynFldJobTitle=true
	If Not IsNull(strDynFldJobTitle) Then
		NewSR.txtDynFldJobTitle().set strDynFldJobTitle
	End If
	WaitForICallLoading
	setDynFldJobTitle=bsetDynFldJobTitle
End Function

'[Set employment on DynFldLnthEmplymnt textfield for Capture Source]
Public Function setDynFldLnthEmplymnt(strDynFldLnthEmplymnt)
	bsetDynFldLnthEmplymnt=true
	If Not IsNull(strDynFldLnthEmplymnt) Then
		NewSR.txtDynFldLnthEmplymnt().set strDynFldLnthEmplymnt
	End If
	WaitForICallLoading
	setDynFldLnthEmplymnt=bsetDynFldLnthEmplymnt
End Function

'[Select Combobox DynFldCrdtLmtPrfrnce as]
Public Function selectDynFldCrdtLmtPrfrnce(strDynFldCrdtLmtPrfrnce)
   bDevPending=false
   bselectDynFldCrdtLmtPrfrnce=true
   waitForIcallLoading
   If Not IsNull(strDynFldCrdtLmtPrfrnce) Then
       If Not (selectItem_Combobox (NewSR.lstDynFldCrdtLmtPrfrnce(), strDynFldCrdtLmtPrfrnce))Then
            LogMessage "WARN","Verification","Failed to select :"&strDynFldCrdtLmtPrfrnce&" From DynFldCrdtLmtPrfrnce drop down list" ,false
           bselectDynFldCrdtLmtPrfrnce=false
       End If
   End If
   waitForIcallLoading
   selectDynFldCrdtLmtPrfrnce=bselectDynFldCrdtLmtPrfrnce
End Function

'[Set credit limit on DynFldPrfrdCrdtLmt textfield for Capture Source]
Public Function setDynFldPrfrdCrdtLmt(strDynFldPrfrdCrdtLmt)
	bsetDynFldPrfrdCrdtLmt=true
	If Not IsNull(strDynFldPrfrdCrdtLmt) Then
		NewSR.txtDynFldPrfrdCrdtLmt().set strDynFldPrfrdCrdtLmt
	End If
	WaitForICallLoading
	setDynFldPrfrdCrdtLmt=bsetDynFldPrfrdCrdtLmt
End Function

'[Set Agent Code on DynFldAgentCode textfield for Capture Source]
Public Function setDynFldAgentCode(strDynFldAgentCode)
	bsetDynFldAgentCode=true
	If Not IsNull(strDynFldAgentCode) Then
		NewSR.txtDynFldAgentCode().set strDynFldAgentCode
	End If
	WaitForICallLoading
	setDynFldAgentCode=bsetDynFldAgentCode
End Function
'**************************************************************************************

'********************************Triplet4 Capture at Source***************************************

'[Set Loan Accnt No on DynFldLoanAccntNo textfield for Capture Source]
Public Function setDynFldLoanAccntNo(strDynFldLoanAccntNo)
	bsetDynFldLoanAccntNo=true
	If Not IsNull(strDynFldLoanAccntNo) Then
		NewSR.txtDynFldLoanAccntNo().set strDynFldLoanAccntNo
	End If
	WaitForICallLoading
	setDynFldLoanAccntNo=bsetDynFldLoanAccntNo
End Function

'[Select Combobox DynFldCASAAccntNo as]
Public Function selectDynFldCASAAccntNo(strDynFldCASAAccntNo)
   bDevPending=false
   bselectDynFldCASAAccntNo=true
   waitForIcallLoading
   If Not IsNull(strDynFldCASAAccntNo) Then
       If Not (selectItem_Combobox (NewSR.lstDynFldCASAAccntNo(), strDynFldCASAAccntNo))Then
            LogMessage "WARN","Verification","Failed to select :"&strDynFldCASAAccntNo&" From DynFldCASAAccntNo drop down list" ,false
           bselectDynFldCASAAccntNo=false
       End If
   End If
   waitForIcallLoading
   selectDynFldCASAAccntNo=bselectDynFldCASAAccntNo
End Function
'******************************************************************************************

'********************************Triplet5 Capture at Source***************************************

'[Set Org on DynFldOrg textfield for Capture Source]
Public Function setDynFldOrg(strDynFldOrg)
	bsetDynFldOrg=true
	If Not IsNull(strDynFldOrg) Then
		NewSR.txtDynFldOrg().set strDynFldOrg
	End If
	WaitForICallLoading
	setDynFldOrg=bsetDynFldOrg
End Function

'[Set CDM on DynFldTypeCDM textfield for Capture Source]
Public Function setDynFldTypeCDM(strDynFldTypeCDM)
	bsetDynFldTypeCDM=true
	If Not IsNull(strDynFldTypeCDM) Then
		NewSR.txtDynFldTypeCDM().set strDynFldTypeCDM
	End If
	WaitForICallLoading
	setDynFldTypeCDM=bsetDynFldTypeCDM
End Function

'[Set Source Code on DynFldSourceCode textfield for Capture Source]
Public Function setDynFldSourceCode(strDynFldSourceCode)
	bsetDynFldSourceCode=true
	If Not IsNull(strDynFldSourceCode) Then
		NewSR.txtDynFldSourceCode().set strDynFldSourceCode
	End If
	WaitForICallLoading
	setDynFldSourceCode=bsetDynFldSourceCode
End Function

'[Set Product Id on DynFldProductID textfield for Capture Source]
Public Function setDynFldProductID(strDynFldProductID)
	bsetDynFldProductID=true
	If Not IsNull(strDynFldProductID) Then
		NewSR.txtDynFldProductID().set strDynFldProductID
	End If
	WaitForICallLoading
	setDynFldProductID=bsetDynFldProductID
End Function

'[Set Billing Address on DynFldBillingAddress textfield for Capture Source]
Public Function setDynFldBillingAddress(strDynFldBillingAddress)
	bsetDynFldBillingAddress=true
	If Not IsNull(strDynFldBillingAddress) Then
		NewSR.txtDynFldBillingAddress().set strDynFldBillingAddress
	End If
	WaitForICallLoading
	setDynFldBillingAddress=bsetDynFldBillingAddress
End Function

'[Set Embosse Name on DynFldEmbossedName textfield for Capture Source]
Public Function setDynFldEmbossedName(strDynFldEmbossedName)
	bsetDynFldEmbossedName=true
	If Not IsNull(strDynFldEmbossedName) Then
		NewSR.txtDynFldEmbossedName().set strDynFldEmbossedName
	End If
	WaitForICallLoading
	setDynFldEmbossedName=bsetDynFldEmbossedName
End Function

'[Set Monthly Income on DynFldMonthlyIncome textfield for Capture Source]
Public Function setDynFldMonthlyIncome(strDynFldMonthlyIncome)
	bsetDynFldMonthlyIncome=true
	If Not IsNull(strDynFldMonthlyIncome) Then
		NewSR.txtDynFldMonthlyIncome().set strDynFldMonthlyIncome
	End If
	WaitForICallLoading
	setDynFldMonthlyIncome=bsetDynFldMonthlyIncome
End Function
'***************************************************************************************************


'[Click Button Submit NewSR]
Public Function clickButtonSubmitNewSR()
   bDevPending=false
   bclickButtonSubmitNewSR=true
   NewSR.btnSubmit.click
   If Err.Number<>0 Then
       bclickButtonSubmitNewSR=false
            LogMessage "WARN","Verification","Failed to Click Submit Button : NewSR" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickButtonSubmitNewSR=bclickButtonSubmitNewSR
End Function

'[Click Button Close NewSRCapture Popup]
Public Function clickButtonCloseNewSR()
   bDevPending=false
   bclickButtonCloseNewSR=true
   NewSR.btnClose_Confirmation.click
   If Err.Number<>0 Then
       bclickButtonCloseNewSR=false
            LogMessage "WARN","Verification","Failed to Click Submit Close : NewSR" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickButtonCloseNewSR=bclickButtonCloseNewSR
End Function


'***********************************Triplet6 Capture at Source********************************
'[Select Combobox dynamic field ATM Card No as]
Public Function selectDynFldATMCardNo(strDynFldATMCardNo)
   bDevPending=false
   bselectDynFldATMCardNo=true
   waitForIcallLoading
   If Not IsNull(strDynFldATMCardNo) Then
       If Not (selectItem_Combobox (NewSR.lstDynFldATMCardNo(), strDynFldATMCardNo))Then
            LogMessage "WARN","Verification","Failed to select :"&strDynFldATMCardNo&" From Dyn Fld ATMCardNo drop down list" ,false
           bselectDynFldATMCardNo=false
       End If
   End If
   waitForIcallLoading
   selectDynFldATMCardNo=bselectDynFldATMCardNo
End Function

'[Select Combobox DynFldRsnforRplacmnt as]
Public Function selectDynFldRsnforRplacmnt(strDynFldRsnforRplacmnt)
   bDevPending=false
   bselectDynFldRsnforRplacmnt=true
   waitForIcallLoading
   If Not IsNull(strDynFldRsnforRplacmnt) Then
       If Not (selectItem_Combobox (NewSR.lstDynFldRsnforRplacmnt(), strDynFldRsnforRplacmnt))Then
            LogMessage "WARN","Verification","Failed to select :"&strDynFldRsnforRplacmnt&" From DynFldRsnforRplacmnt drop down list" ,false
           bselectDynFldRsnforRplacmnt=false
       End If
   End If
   waitForIcallLoading
   selectDynFldRsnforRplacmnt=bselectDynFldRsnforRplacmnt
End Function

'[Set New Name Embsd Card on DynFldNewNameEmbsdCard textfield for Capture Source]
Public Function setDynFldNewNameEmbsdCard(strDynFldNewNameEmbsdCard)
	bsetDynFldNewNameEmbsdCard=true
	If Not IsNull(strDynFldNewNameEmbsdCard) Then
		NewSR.txtDynFldNewNameEmbsdCard().set strDynFldNewNameEmbsdCard
	End If
	WaitForICallLoading
	setDynFldNewNameEmbsdCard=bsetDynFldNewNameEmbsdCard
End Function

'[Select Combobox DynFldTypofMailng as]
Public Function selectDynFldTypofMailng(strDynFldTypofMailng)
   bDevPending=false
   bselectDynFldTypofMailng=true
   waitForIcallLoading
   If Not IsNull(strDynFldTypofMailng) Then
       If Not (selectItem_Combobox (NewSR.lstDynFldTypofMailng(), strDynFldTypofMailng))Then
            LogMessage "WARN","Verification","Failed to select :"&strDynFldTypofMailng&" From DynFldTypofMailng drop down list" ,false
           bselectDynFldTypofMailng=false
       End If
   End If
   waitForIcallLoading
   selectDynFldTypofMailng=bselectDynFldTypofMailng
End Function

'[Select Combobox DynFldRedirctnAdrs as]
Public Function selectDynFldRedirctnAdrs(strDynFldRedirctnAdrs)
   bDevPending=false
   bselectDynFldRedirctnAdrs=true
   waitForIcallLoading
   If Not IsNull(strDynFldRedirctnAdrs) Then
       If Not (selectItem_Combobox (NewSR.lstDynFldRedirctnAdrs(), strDynFldRedirctnAdrs))Then
            LogMessage "WARN","Verification","Failed to select :"&strDynFldRedirctnAdrs&" From DynFldRedirctnAdrs drop down list" ,false
           bselectDynFldRedirctnAdrs=false
       End If
   End If
   waitForIcallLoading
   selectDynFldRedirctnAdrs=bselectDynFldRedirctnAdrs
End Function

'[Set postal code on DynFldPostalCode textfield for Capture Source]
Public Function setDynFldPostalCode(strDynFldPostalCode)
	bsetDynFldPostalCode=true
	If Not IsNull(strDynFldPostalCode) Then
		NewSR.txtDynFldPostalCode().set strDynFldPostalCode
	End If
	WaitForICallLoading
	setDynFldPostalCode=bsetDynFldPostalCode
End Function

'[Set Block on DynFldBlock textfield for Capture Source]
Public Function setDynFldBlock(strDynFldBlock)
	bsetDynFldBlock=true
	If Not IsNull(strDynFldBlock) Then
		NewSR.txtDynFldBlock().set strDynFldBlock
	End If
	WaitForICallLoading
	setDynFldBlock=bsetDynFldBlock
End Function

'[Set Level on DynFldLevel textfield for Capture Source]
Public Function setDynFldLevel(strDynFldLevel)
	bsetDynFldLevel=true
	If Not IsNull(strDynFldLevel) Then
		NewSR.txtDynFldLevel().set strDynFldLevel
	End If
	WaitForICallLoading
	setDynFldLevel=bsetDynFldLevel
End Function

'[Set Unit on DynFldUnit textfield for Capture Source]
Public Function setDynFldUnit(strDynFldUnit)
	bsetDynFldUnit=true
	If Not IsNull(strDynFldUnit) Then
		NewSR.txtDynFldUnit().set strDynFldUnit
	End If
	WaitForICallLoading
	setDynFldUnit=bsetDynFldUnit
End Function

'[Set Address Line on DynFldAddrsLine1 textfield for Capture Source]
Public Function setDynFldAddrsLine1(strDynFldAddrsLine1)
	bsetDynFldAddrsLine1=true
	If Not IsNull(strDynFldAddrsLine1) Then
		NewSR.txtDynFldAddrsLine1().set strDynFldAddrsLine1
	End If
	WaitForICallLoading
	setDynFldAddrsLine1=bsetDynFldAddrsLine1
End Function

'[Set Address Line on DynFldAddrsLine2 textfield for Capture Source]
Public Function setDynFldAddrsLine2(strDynFldAddrsLine2)
	bsetDynFldAddrsLine2=true
	If Not IsNull(strDynFldAddrsLine2) Then
		NewSR.txtDynFldAddrsLine2().set strDynFldAddrsLine2
	End If
	WaitForICallLoading
	setDynFldAddrsLine2=bsetDynFldAddrsLine2
End Function

'[Set Address Line on DynFldAddrsLine3 textfield for Capture Source]
Public Function setDynFldAddrsLine3(strDynFldAddrsLine3)
	bsetDynFldAddrsLine3=true
	If Not IsNull(strDynFldAddrsLine3) Then
		NewSR.txtDynFldAddrsLine3().set strDynFldAddrsLine3
	End If
	WaitForICallLoading
	setDynFldAddrsLine3=bsetDynFldAddrsLine3
End Function

'[Set Address Line on DynFldAddrsLine4 textfield for Capture Source]
Public Function setDynFldAddrsLine4(strDynFldAddrsLine4)
	bsetDynFldAddrsLine4=true
	If Not IsNull(strDynFldAddrsLine4) Then
		NewSR.txtDynFldAddrsLine4().set strDynFldAddrsLine4
	End If
	WaitForICallLoading
	setDynFldAddrsLine4=bsetDynFldAddrsLine4
End Function

'[Select File Attachment1]
Public Function selectDynFldAttchmnt1(strDynFldAttchmnt1)
   bDevPending=false
   bselectDynFldAttchmnt1=true
   waitForIcallLoading
   
    If Not IsNull(strDynFldAttchmnt1) Then
       If Not (selectAttachment_File (NewSR.fileDynFldAttchmnt1(), strDynFldAttchmnt1))Then
            LogMessage "WARN","Verification","Failed to select :"&strDynFldAttchmnt1&" From DynFldAttchmnt1 File" ,false
        	
           bselectDynFldDuration=false
       End If
   End If
   waitForIcallLoading
   selectDynFldAttchmnt1=bselectDynFldAttchmnt1
End Function

'[Select File Attachment2]
Public Function selectDynFldAttchmnt2(strDynFldAttchmnt2)
   bDevPending=false
   bselectDynFldAttchmnt2=true
   waitForIcallLoading
   
    If Not IsNull(strDynFldAttchmnt2) Then
       If Not (selectAttachment_File (NewSR.fileDynFldAttchmnt2(), strDynFldAttchmnt2))Then
            LogMessage "WARN","Verification","Failed to select :"&strDynFldAttchmnt2&" From DynFldAttchmnt2 File" ,false
        	
           bselectDynFldDuration=false
       End If
   End If
   waitForIcallLoading
   selectDynFldAttchmnt2=bselectDynFldAttchmnt2
End Function

'[Select File Attachment3]
Public Function selectDynFldAttchmnt3(strDynFldAttchmnt3)
   bDevPending=false
   bselectDynFldAttchmnt3=true
   waitForIcallLoading
   
    If Not IsNull(strDynFldAttchmnt3) Then
       If Not (selectAttachment_File (NewSR.fileDynFldAttchmnt3(), strDynFldAttchmnt3))Then
            LogMessage "WARN","Verification","Failed to select :"&strDynFldAttchmnt3&" From DynFldAttchmnt3 File" ,false
        	
           bselectDynFldDuration=false
       End If
   End If
   waitForIcallLoading
   selectDynFldAttchmnt3=bselectDynFldAttchmnt3
End Function

'[Select File Attachment4]
Public Function selectDynFldAttchmnt4(strDynFldAttchmnt4)
   bDevPending=false
   bselectDynFldAttchmnt4=true
   waitForIcallLoading
   
    If Not IsNull(strDynFldAttchmnt4) Then
       If Not (selectAttachment_File (NewSR.fileDynFldAttchmnt4(), strDynFldAttchmnt4))Then
            LogMessage "WARN","Verification","Failed to select :"&strDynFldAttchmnt4&" From DynFldAttchmnt4 File" ,false
        	
           bselectDynFldDuration=false
       End If
   End If
   waitForIcallLoading
   selectDynFldAttchmnt4=bselectDynFldAttchmnt4
End Function

'[Select File Attachment5]
Public Function selectDynFldAttchmnt1(strDynFldAttchmnt5)
   bDevPending=false
   bselectDynFldAttchmnt5=true
   waitForIcallLoading
   
    If Not IsNull(strDynFldAttchmnt5) Then
       If Not (selectAttachment_File (NewSR.fileDynFldAttchmnt5(), strDynFldAttchmnt5))Then
            LogMessage "WARN","Verification","Failed to select :"&strDynFldAttchmnt5&" From DynFldAttchmnt5 File" ,false
        	
           bselectDynFldDuration=false
       End If
   End If
   waitForIcallLoading
   selectDynFldAttchmnt5=bselectDynFldAttchmnt5
End Function
'******************************************************************************************
'************************Triplet 7 Capture at Source**********************************
'[Select Combobox dynamic field Duration as]
Public Function selectDynFldDuration(strDynFldDuration)
   bDevPending=false
   bselectDynFldDuration=true
   waitForIcallLoading
   If Not IsNull(strDynFldDuration) Then
       If Not (selectItem_Combobox (NewSR.lstDynFldDuration(), strDynFldDuration))Then
            LogMessage "WARN","Verification","Failed to select :"&strDynFldDuration&" From DynFldDuration drop down list" ,false
           bselectDynFldDuration=false
       End If
   End If
   waitForIcallLoading
   selectDynFldDuration=bselectDynFldDuration
End Function

'************************Triplet 8 Capture at Source**********************************
'[Select Combobox DynFldCreditCardNo as]
Public Function selectDynFldCreditCardNo(strDynFldCreditCardNo)
   bDevPending=false
   bselectDynFldCreditCardNo=true
   waitForIcallLoading
   If Not IsNull(strDynFldCreditCardNo) Then
       If Not (selectItem_Combobox (NewSR.lstDynFldCreditCardNo(), strDynFldCreditCardNo))Then
            LogMessage "WARN","Verification","Failed to select :"&strDynFldCreditCardNo&" From DynFldCreditCardNo drop down list" ,false
           bselectDynFldCreditCardNo=false
       End If
   End If
   waitForIcallLoading
   selectDynFldCreditCardNo=bselectDynFldCreditCardNo
End Function

'[Set Amt to Refund on DynFldAmounttoRefund textfield for Capture Source]
Public Function setDynFldAmounttoRefund(strDynFldAmounttoRefund)
	bsetDynFldAmounttoRefund=true
	If Not IsNull(strDynFldAmounttoRefund) Then
		NewSR.txtDynFldAmounttoRefund().set strDynFldAmounttoRefund
	End If
	WaitForICallLoading
	setDynFldAmounttoRefund=bsetDynFldAmounttoRefund
End Function

'[Set Reason1 on DynFldReason1 textfield for Capture Source]
Public Function setDynFldReason1(strDynFldReason1)
	bsetDynFldReason1=true
	If Not IsNull(strDynFldReason1) Then
		NewSR.txtDynFldReason1().set strDynFldReason1
	End If
	WaitForICallLoading
	setDynFldReason1=bsetDynFldReason1
End Function

'[Set Reason2 on DynFldReason2 textfield for Capture Source]
Public Function setDynFldReason2(strDynFldReason2)
	bsetDynFldReason2=true
	If Not IsNull(strDynFldReason2) Then
		NewSR.txtDynFldReason2().set strDynFldReason2
	End If
	WaitForICallLoading
	setDynFldReason2=bsetDynFldReason2
End Function

'[Set Seq No on DynFldSeqNo textfield for Capture Source]
Public Function setDynFldSeqNo(strDynFldSeqNo)
	bsetDynFldSeqNo=true
	If Not IsNull(strDynFldSeqNo) Then
		NewSR.txtDynFldSeqNo().set strDynFldSeqNo
	End If
	WaitForICallLoading
	setDynFldSeqNo=bsetDynFldSeqNo
End Function
'**********************************************************************************************
'****************************Triplet 9 capture Source******************************************
'[Select Combobox DynFldRsnFrWriteoff as]
Public Function selectDynFldRsnFrWriteoff(strDynFldRsnFrWriteoff)
   bDevPending=false
   bselectDynFldRsnFrWriteoff=true
   waitForIcallLoading
   If Not IsNull(strDynFldRsnFrWriteoff) Then
       If Not (selectItem_Combobox (NewSR.lstDynFldRsnFrWriteoff(), strDynFldRsnFrWriteoff))Then
            LogMessage "WARN","Verification","Failed to select :"&strDynFldRsnFrWriteoff&" From DynFldRsnFrWriteoff drop down list" ,false
           bselectDynFldRsnFrWriteoff=false
       End If
   End If
   waitForIcallLoading
   selectDynFldRsnFrWriteoff=bselectDynFldRsnFrWriteoff
End Function

'[Select Combobox DynFldDbtCardNo as]
Public Function selectDynFldDbtCardNo(strDynFldDbtCardNo)
   bDevPending=false
   bselectDynFldDbtCardNo=true
   waitForIcallLoading
   If Not IsNull(strDynFldDbtCardNo) Then
       If Not (selectItem_Combobox (NewSR.lstDynFldDbtCardNo(), strDynFldDbtCardNo))Then
            LogMessage "WARN","Verification","Failed to select :"&strDynFldDbtCardNo&" From DynFldDbtCardNo drop down list" ,false
           bselectDynFldDbtCardNo=false
       End If
   End If
   waitForIcallLoading
   selectDynFldDbtCardNo=bselectDynFldDbtCardNo
End Function

'[Set Amount1 on DynFldAmount1 textfield for Capture Source]
Public Function setDynFldAmount1(strDynFldAmount1)
	bsetDynFldAmount1=true
	If Not IsNull(strDynFldAmount1) Then
		NewSR.txtDynFldAmount1().set strDynFldAmount1
	End If
	WaitForICallLoading
	setDynFldAmount1=bsetDynFldAmount1
End Function

'[Set Merchant Name on DynFldNameofMrchnt textfield for Capture Source]
Public Function setDynFldNameofMrchnt(strDynFldNameofMrchnt)
	bsetDynFldNameofMrchnt=true
	If Not IsNull(strDynFldNameofMrchnt) Then
		NewSR.txtDynFldNameofMrchnt().set strDynFldNameofMrchnt
	End If
	WaitForICallLoading
	setDynFldNameofMrchnt=bsetDynFldNameofMrchnt
End Function

'[Set Date of txn on DynFldDateofTransaction textfield for Capture Source]
Public Function setDynFldDateofTransaction(strDynFldDateofTransaction)
	bsetDynFldDateofTransaction=true
	If Not IsNull(strDynFldDateofTransaction) Then
		NewSR.txtDynFldDateofTransaction().set strDynFldDateofTransaction
	End If
	WaitForICallLoading
	setDynFldDateofTransaction=bsetDynFldDateofTransaction
End Function
'**************************************************************************

'****************************Triplet 10 Capture at Source******************************

'[Select Combobox DynFldDbtCardNo1 as]
Public Function selectDynFldDbtCardNo1(strDynFldDbtCardNo1)
   bDevPending=false
   bselectDynFldDbtCardNo1=true
   waitForIcallLoading
   If Not IsNull(strDynFldDbtCardNo1) Then
       If Not (selectItem_Combobox (NewSR.lstDynFldDbtCardNo1(), strDynFldDbtCardNo1))Then
            LogMessage "WARN","Verification","Failed to select :"&strDynFldDbtCardNo1&" From DynFldDbtCardNo1 drop down list" ,false
           bselectDynFldDbtCardNo1=false
       End If
   End If
   waitForIcallLoading
   selectDynFldDbtCardNo1=bselectDynFldDbtCardNo1
End Function

'[Select Combobox DynFldCASAAccntNo1 as]
Public Function selectDynFldCASAAccntNo1(strDynFldCASAAccntNo1)
   bDevPending=false
   bselectDynFldCASAAccntNo1=true
   waitForIcallLoading
   If Not IsNull(strDynFldCASAAccntNo1) Then
       If Not (selectItem_Combobox (NewSR.lstDynFldCASAAccntNo1(), strDynFldCASAAccntNo1))Then
            LogMessage "WARN","Verification","Failed to select :"&strDynFldCASAAccntNo1&" From DynFldCASAAccntNo1 drop down list" ,false
           bselectDynFldCASAAccntNo1=false
       End If
   End If
   waitForIcallLoading
   selectDynFldCASAAccntNo1=bselectDynFldCASAAccntNo1
End Function

'[Select Combobox DynFldCASAAccntNo2 as]
Public Function selectDynFldCASAAccntNo2(strDynFldCASAAccntNo2)
   bDevPending=false
   bselectDynFldCASAAccntNo2=true
   waitForIcallLoading
   If Not IsNull(strDynFldCASAAccntNo2) Then
       If Not (selectItem_Combobox (NewSR.lstDynFldCASAAccntNo2(), strDynFldCASAAccntNo2))Then
            LogMessage "WARN","Verification","Failed to select :"&strDynFldCASAAccntNo2&" From DynFldCASAAccntNo2 drop down list" ,false
           bselectDynFldCASAAccntNo2=false
       End If
   End If
   waitForIcallLoading
   selectDynFldCASAAccntNo2=bselectDynFldCASAAccntNo2
End Function

'[Select Combobox DynFldCASAAccntNo3 as]
Public Function selectDynFldCASAAccntNo3(strDynFldCASAAccntNo3)
   bDevPending=false
   bselectDynFldCASAAccntNo3=true
   waitForIcallLoading
   If Not IsNull(strDynFldCASAAccntNo3) Then
       If Not (selectItem_Combobox (NewSR.lstDynFldCASAAccntNo3(), strDynFldCASAAccntNo3))Then
            LogMessage "WARN","Verification","Failed to select :"&strDynFldCASAAccntNo3&" From DynFldCASAAccntNo3 drop down list" ,false
           bselectDynFldCASAAccntNo3=false
       End If
   End If
   waitForIcallLoading
   selectDynFldCASAAccntNo3=bselectDynFldCASAAccntNo3
End Function

'[Set Earmark Amt1 on DynFldEarmarkAmntRlsd1 textfield for Capture Source]
Public Function setDynFldEarmarkAmntRlsd1(strDynFldEarmarkAmntRlsd1)
	bsetDynFldEarmarkAmntRlsd1=true
	If Not IsNull(strDynFldEarmarkAmntRlsd1) Then
		NewSR.txtDynFldEarmarkAmntRlsd1().set strDynFldEarmarkAmntRlsd1
	End If
	WaitForICallLoading
	setDynFldEarmarkAmntRlsd1=bsetDynFldEarmarkAmntRlsd1
End Function

'[Set Earmark Amt2 on DynFldEarmarkAmntRlsd2 textfield for Capture Source]
Public Function setDynFldEarmarkAmntRlsd2(strDynFldEarmarkAmntRlsd2)
	bsetDynFldEarmarkAmntRlsd2=true
	If Not IsNull(strDynFldEarmarkAmntRlsd2) Then
		NewSR.txtDynFldEarmarkAmntRlsd2().set strDynFldEarmarkAmntRlsd2
	End If
	WaitForICallLoading
	setDynFldEarmarkAmntRlsd2=bsetDynFldEarmarkAmntRlsd2
End Function

'[Set Earmark Amt3 on DynFldEarmarkAmntRlsd3 textfield for Capture Source]
Public Function setDynFldEarmarkAmntRlsd3(strDynFldEarmarkAmntRlsd3)
	bsetDynFldEarmarkAmntRlsd3=true
	If Not IsNull(strDynFldEarmarkAmntRlsd3) Then
		NewSR.txtDynFldEarmarkAmntRlsd3().set strDynFldEarmarkAmntRlsd3
	End If
	WaitForICallLoading
	setDynFldEarmarkAmntRlsd3=bsetDynFldEarmarkAmntRlsd3
End Function

'[Set Ttl Earmark Amt on DynFldTtlEarmarkamntrlse textfield for Capture Source]
Public Function setDynFldTtlEarmarkamntrlse(strDynFldTtlEarmarkamntrlse)
	bsetDynFldTtlEarmarkamntrlse=true
	If Not IsNull(strDynFldTtlEarmarkamntrlse) Then
		NewSR.txtDynFldTtlEarmarkamntrlse().set strDynFldTtlEarmarkamntrlse
	End If
	WaitForICallLoading
	setDynFldTtlEarmarkamntrlse=bsetDynFldTtlEarmarkamntrlse
End Function

'[Set Rsn for Release on DynFldRsnforRlse textfield for Capture Source]
Public Function setDynFldRsnforRlse(strDynFldRsnforRlse)
	bsetDynFldRsnforRlse=true
	If Not IsNull(strDynFldRsnforRlse) Then
		NewSR.txtDynFldRsnforRlse().set strDynFldRsnforRlse
	End If
	WaitForICallLoading
	setDynFldRsnforRlse=bsetDynFldRsnforRlse
End Function
'*****************************************************************************************************

'****************************** Added by Sunil for 1603 Requirement **************
'[Set the Ref in New SR Page as]
Public Function setRef_SR(strRef)
	setRef_SR = true
	NewSR.txtRef().Set strRef
	If err.number <> 0 Then
		'Error occurred
		LogMessage "WARN","Verification","Not able to Set the Ref#. " ,False
		setRef_SR = false
	End If
End Function

'[Set the Reason in New SR Page as]
Public Function setReason_SR(strReason)
	setReason_SR = true
	NewSR.txtReason.Set strReason
	If err.number <> 0 Then
		'Error occurred
		LogMessage "WARN","Verification","Not able to Set the Reason. " ,False
		setReason_SR = false
	End If
End Function

'[Set the Employee ID in New SR Page as]
Public Function setEmp_ID_SR(strEmpID)
	setEmp_ID_SR = true
	NewSR.txtEmpID.Set strEmpID
	If err.number <> 0 Then
		'Error occurred
		LogMessage "WARN","Verification","Not able to Set the Employee ID. " ,False
		setEmp_ID_SR = false
	End If
End Function

'[Verify the field Branch exists and set the value as]
Public Function verifyBranch_ExistsNSet(bolExists,strBranch)
	verifyBranch_ExistsNSet = true
	'check if the field exists or not
	If NewSR.txtBranch().Exist Then
		If bolExists = "True" Then
			LogMessage "RSLT","Verification","Branch field exists as expected. " ,True
			'Then set the value
			NewSR.txtBranch().Set strBranch
			If err.number <> 0 Then
				'Error occurred
				LogMessage "WARN","Verification","Not able to Set the Branch. " ,False
				verifyBranch_ExistsNSet = false
			End If
		else
			LogMessage "WARN","Verification","Branch filed exists but was not expected. " ,False
			verifyBranch_ExistsNSet = false
		End If
	else
		If bolExists = "False" Then
			LogMessage "RSLT","Verification","Branch field does not exist as expected. " ,True
		else
			LogMessage "WARN","Verification","Branch filed does not exist but was expected. " ,False
			verifyBranch_ExistsNSet = false
		End If
	End If
End Function

'[Click on Submit button of SR Page]
Public Function clickSubmit_NewSR() 
	clickSubmit_NewSR = true
   ServiceRequest.clickSubmit()
	strSrSubmitTime=now   
   waitForIcallLoading
   If Err.Number<>0 Then
        LogMessage "WARN","Verification","Failed to Click Button : Submit" ,false
        clickSubmit_NewSR = false
   Exit Function
   End If
End Function

'*********************** The below codes are for Create SR in Prospects page *************
'[Set Assigned To in Prospect SR Page as]
Public Function setAssignedTo_SR(strAssignedTo)
	setAssignedTo_SR = true
	NewSR.txtAssignedTo().Set strAssignedTo
	If Err.Number<>0 Then
        LogMessage "WARN","Verification","Failed to Set the Assigned To field." ,false
        setAssignedTo_SR = false
      else
      	LogMessage "RSLT","Verification","Assigned To field set successfully." ,true
   	End If
End Function

'[Set the NRIC Passport Number in Prospect SR Page as]
Public Function setNRICPassport_SR(NRICPassport)
	setNRICPassport_SR = true
	NewSR.txtNRICPassport().Set NRICPassport
	If Err.Number<>0 Then
        LogMessage "WARN","Verification","Failed to Set the NRIC/Passport field." ,false
        setNRICPassport_SR = false
      else
      	LogMessage "RSLT","Verification","NRIC/Passport field set successfully." ,true
   	End If
End Function

'[Set the First Name in Prospect SR Page as]
Public Function setFName_SR(fName)
	setFName_SR = true
	NewSR.txtFirstName().Set fName
	If Err.Number<>0 Then
        LogMessage "WARN","Verification","Failed to Set the First Name field." ,false
        setFName_SR = false
      else
      	LogMessage "RSLT","Verification","First Name field set successfully." ,true
   	End If
End Function

'[Set the Mobile in Prospect SR Page as]
Public Function setMobile_SR(strMobile)
	setMobile_SR = true
	NewSR.txtMobile().Set strMobile
	If Err.Number<>0 Then
        LogMessage "WARN","Verification","Failed to Set the Mobile field." ,false
        setMobile_SR = false
      else
      	LogMessage "RSLT","Verification","Mobile field set successfully." ,true
   	End If
End Function

'[Verify NRIC Passport in Prospect SR Page displayed as]
Public Function verify_FName_SR(fName)
	verify_FName_SR = true
	strActual_fName = NewSR.txtFirstName().GetRoProperty("innertext")
	If strActual_fName = fName Then
		LogMessage "RSLT","Verification","First Name Matching as expected. Actual: " &strActual_fName& " Expected: " &fName ,true
	else
		LogMessage "WARN","Verification","First Name Matching as expected. Actual: " &strActual_fName& " Expected: " &fName ,true
		verify_FName_SR = false
	End If
End Function

'[Set the Proxy value in New SR Page as]
Public Function setProxyValue_SR(strProxyVal)
	setProxyValue_SR = True
	If Not IsNull(strProxyVal) Then
		NewSR.txtProxyValue().Set strProxyVal
		If Err.Number<>0 Then
			LogMessage "WARN","Verification","Failed to Set the Proxy value field." ,false
			setProxyValue_SR = false
		else
			LogMessage "RSLT","Verification","Proxy value field set successfully." ,true
		End If
	End If	
End Function

'[Verify Field Proxy value Inline Message displayed as]
Public Function verifyProxyInlineMessageText(strProxyInlineMessage)
   bDevPending = false
   bverifyProxyInlineMessageText = true
   WaitForICallLoading   
   For iCount = 1 To 180 Step 1
		If Not NewSR.lblProxyInlineMessage.Exist(0.5) Then
			Wait(0.5)
		else
			If Not IsNull(strProxyInlineMessage) Then
				If Not VerifyInnerText (NewSR.lblProxyInlineMessage(), strProxyInlineMessage, "ProxyInlineMessage")Then
					bverifyProxyInlineMessageText = false
				End If
			End If
			Exit for
		End if
	Next   
   verifyProxyInlineMessageText = bverifyProxyInlineMessageText
End Function

'[Set the Owning Bank value in New SR Page as]
Public Function setOwningBankValue_SR(strOwningBankVal)
	setOwningBankValue_SR = True
	If Not IsNull(strOwningBankVal)Then
		NewSR.txtOwingBank().Set strOwningBankVal
		If Err.Number<>0 Then
			LogMessage "WARN","Verification","Failed to Set the Owning Bank value field." ,false
			setOwningBankValue_SR = false
		else
			LogMessage "RSLT","Verification","Owning Bank value field set successfully." ,true
		End If
	End If	
End Function

'[Click on Go Button in the IB PayNow Transactions]
Public Function clickGObuttonPayNowTrans(strOk)
	clickGObuttonPayNowTrans = True
	If Not IsNull(strOk) Then
		waitForIcallLoading
		NewSR.btnGo.click
		waitForIcallLoading
	End If	
	If Err.Number<>0 Then
		clickGObuttonPayNowTrans=false
		LogMessage "WARN","Verification","Failed to Click Button : Go" ,false
		Exit Function
	End If

End Function

'[Verify Field Validation Message For PayNow NSTP displayed as]
Public Function verifyValidationSRMessagePayNow(strExpectedText)
	verifyValidationSRMessagePayNow=true
	WaitForICallLoading
	If Not IsNull(strExpectedText) Then
		If Not VerifyInnerText (NewSR.lblSrMaPopMsgPayNow(), strExpectedText, "Validation Message")Then
			verifyValidationSRMessagePayNow=false
		End If
		NewSR.btnSrMaPopOk.Click
		WaitForICallLoading
	End If
End Function

'[Select Combobox From Account as]
Public Function selectfromAccountComboBox(strFromAccount)
   selectfromAccountComboBox=true
   If Not IsNull(strFromAccount) Then
      waitForIcallLoading
       If Not (selectItem_Combobox (NewSR.lstFromAccount(), strFromAccount))Then
            LogMessage "WARN","Verification","Failed to select :"&strFromAccount&" From From Account drop down list" ,false
           selectfromAccountComboBox=false
       End If
       waitForIcallLoading
   End If   
End Function

'[Set Amount on Amount textfield for PayNow NSTP]
Public Function setAmountPayNowtransNSTP(strAmountPayNow)
	setAmountPayNowtransNSTP=true
	If Not IsNull(strAmountPayNow) Then
		NewSR.txtAmountPayNowNSTP().set strAmountPayNow
		WaitForICallLoading
	End If
	If Err.Number<>0 Then
		setAmountPayNowtransNSTP=false
		LogMessage "WARN","Verification","Failed to set Amount" ,false
		Exit Function
	End If
End Function

'[set Transaction Ref text field value for PayNow NSTP]
Public Function setTransactionRefPayNowNSTP(strTransactionRef)
	setTransactionRefPayNowNSTP = True
	If Not IsNull(strTransactionRef) Then
		WaitForICallLoading
		NewSR.txtTransactionRef().set strTransactionRef
	End If
	If Err.Number<>0 Then
		setTransactionRefPayNowNSTP=false
		LogMessage "WARN","Verification","Failed to set Transaction Ref" ,false
		Exit Function
	End If	
End Function

'[set Proxy Value text field value for PayNowProfile NSTP]
Public Function setProxyPayNowNSTP(strProxy)
	setProxyPayNowNSTP = True	
	If Not IsNull(strProxy) Then
		WaitForICallLoading
		NewSR.txtProxyValueNSTP().set strProxy
	End If
	If Err.Number<>0 Then
		setProxyPayNowNSTP=false
		LogMessage "WARN","Verification","Failed to set Proxy value" ,false
		Exit Function
	End If	
End Function

'[set Owning Bank text field value for PayNowProfile NSTP]
Public Function setOwningPayNowNSTP(strOwning)
	setOwningPayNowNSTP=True
	If Not IsNull(strOwning) Then
		NewSR.txtOwningBankNSTP().set strOwning
	End If
	If Err.Number<>0 Then
		setOwningPayNowNSTP=false
		LogMessage "WARN","Verification","Failed to set Owning Bank" ,false
		Exit Function
	End If	
End Function

'[Click Submit and OK Button on NewSR Page]
Public Function clickSubmitOkNewSRPage(strSubmitOk)
	clickSubmitOkNewSRPage = True
	If Not IsNull(strSubmitOk) Then
		clickSubmitOkNewSRPage = clickButtonSubmitNewSR()
		WaitForICallLoading
		clickSubmitOkNewSRPage = clickButtonCloseNewSR()
	End If
	If Err.Number<>0 Then
		clickSubmitOkNewSRPage=false
		LogMessage "WARN","Verification","Failed to click Submit Button NewSR Page" ,false
		Exit Function
	End If
End Function
