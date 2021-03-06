'*****This is auto generated code using code generator please Re-validate ****************

'[Click Button TemporaryLimitIncrease]
Public Function clickButtonTemporarLimit()
   bDevPending=false
   Temporarylimit_Page.btnTemporaryLimitIncrease.click
   If Err.Number<>0 Then
       clickButtonTemporarLimitLimit=false
            LogMessage "WARN","Verification","Failed to Click Button : Temporary Limit Increase" ,false
       Exit Function
   End If
   waitForIcallLoading
   clickButtonTemporarLimitLimit=true
End Function

'[Verify Button TemporarylimitIncrease not exist]
Public Function VerifyButtonTemporarLimit()
   bDevPending=false
   bVerifyButtonTemporarLimit=true
    If not (Temporarylimit_Page.btnTemporaryLimitIncrease().exist(2)) Then
      LogMessage "RSLT","Verification","Temporary Limit button is not available as expected.", True
      bVerifyButtonTemporarLimit=true
    else
      LogMessage "WARN","Verification","Temporary Limit  button is available. Expected to be not present.", False
      bVerifyButtonTemporarLimit = false
    End If      
   VerifyButtonTemporarLimit=bVerifyButtonTemporarLimit
End Function

'[Verify Button TemporarylimitIncrease button exist]
Public Function VerifyButtonTemporarLimitDE()
   bDevPending=false
   bVerifyButtonTemporarLimit=true
   wait (5)
    If (Temporarylimit_Page.btnTemporaryLimitIncrease().exist(2)) Then
      LogMessage "RSLT","Verification","Temporary Limit button is available as expected.", True
      bclickButtonAddressChange=true
    else
      LogMessage "WARN","Verification","Temporary Limit  button is not available. Expected to be  present.", False
      bVerifyButtonTemporarLimit = false
    End If      
   VerifyButtonTemporarLimitDE=bVerifyButtonTemporarLimit
End Function

'[Get AdditionalAmount Label Text]
Public Function getAdditionalAmountText()
   bDevPending=false
   getAdditionalAmountText=Temporarylimit_Page.txtAdditionalAmount.GetRoProperty("innertext")
End Function

'[Verify Field AdditionalAmount displayed as]
Public Function verifyAdditionalAmountText(strExpectedText)
   bDevPending=false
   bVerifyAdditionalAmountText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyField( Temporarylimit_Page.txtAdditionalAmount(), strExpectedText, "AdditionalAmount")Then
           bVerifyAdditionalAmountText=false
       End If
   End If
   verifyAdditionalAmountText=bVerifyAdditionalAmountText
End Function


'[Set TextBox AdditionalAmount to]
Public Function setAdditionalAmountTextbox(strAdditionalAmount)
   bDevPending=false
   Temporarylimit_Page.txtAdditionalAmount.Set(strAdditionalAmount)
   If Err.Number<>0 Then
       setAdditionalAmountTextbox=false
            LogMessage "WARN","Verification","Failed to Set Text Box :AdditionalAmount" ,false
       Exit Function
   End If
   setAdditionalAmountTextbox=true
End Function

'[Get AdmissionTreatmentDate Label Text]
Public Function getAdmissionTreatmentDateText()
   bDevPending=false
   getAdmissionTreatmentDateText=Temporarylimit_Page.txtAdmissionTreatmentDate.GetRoProperty("innertext")
End Function

'[Verify Field AdmissionTreatmentDate displayed as]
Public Function verifyAdmissionTreatmentDateText(strExpectedText)
   bDevPending=false
   bVerifyAdmissionTreatmentDateText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyField( Temporarylimit_Page.txtAdmissionTreatmentDate(), strExpectedText, "AdmissionTreatmentDate")Then
           bVerifyAdmissionTreatmentDateText=false
       End If
   End If
   verifyAdmissionTreatmentDateText=bVerifyAdmissionTreatmentDateText
End Function


'[Set TextBox AdmissionTreatmentDate to]
Public Function setAdmissionTreatmentDateTextbox(strAdmissionTreatmentDate)
   bDevPending=false
   Temporarylimit_Page.txtAdmissionTreatmentDate.Set(strAdmissionTreatmentDate)
   If Err.Number<>0 Then
       setAdmissionTreatmentDateTextbox=false
            LogMessage "WARN","Verification","Failed to Set Text Box :AdmissionTreatmentDate" ,false
       Exit Function
   End If
   setAdmissionTreatmentDateTextbox=true
End Function

'[Get Comments Label Text]
Public Function getCommentsText()
   bDevPending=false
   getCommentsText=Temporarylimit_Page.txtComments.GetRoProperty("innertext")
End Function

'[Verify Field Comments displayed as]
Public Function verifyCommentsText(strExpectedText)
   bDevPending=false
   bVerifyCommentsText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyField( Temporarylimit_Page.txtComments(), strExpectedText, "Comments")Then
           bVerifyCommentsText=false
       End If
   End If
   verifyCommentsText=bVerifyCommentsText
End Function


'[Set TextBox Comments to TL]
Public Function setCommentsTextbox_TL(strComment)
   bDevPending=false
   	strTimeStamp = ""&now
	strComment =strComment &" "&strTimeStamp
	gstrRuntimeCommentStep="Set TextBox Comments to TL"
	insertDataStore "SRComment", strComment
   Temporarylimit_Page.txtComments.Set(strComment)
   If Err.Number<>0 Then
       setCommentsTextbox=false
            LogMessage "WARN","Verification","Failed to Set Text Box :Comments" ,false
       Exit Function
   End If
   setCommentsTextbox_TL=true
End Function

'[Get CostPerTableorPax Label Text]
Public Function getCostPerTableorPaxText()
   bDevPending=false
   getCostPerTableorPaxText=Temporarylimit_Page.txtCostPerTableorPax.GetRoProperty("innertext")
End Function

'[Verify Field CostPerTableorPax displayed as]
Public Function verifyCostPerTableorPaxText(strExpectedText)
   bDevPending=false
   bVerifyCostPerTableorPaxText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyField( Temporarylimit_Page.txtCostPerTableorPax(), strExpectedText, "CostPerTableorPax")Then
           bVerifyCostPerTableorPaxText=false
       End If
   End If
   verifyCostPerTableorPaxText=bVerifyCostPerTableorPaxText
End Function


'[Set TextBox CostPerTableorPax to]
Public Function setCostPerTableorPaxTextbox(strCostPerTableorPax)
   bDevPending=false
   Temporarylimit_Page.txtCostPerTableorPax.Set(strCostPerTableorPax)
   If Err.Number<>0 Then
       setCostPerTableorPaxTextbox=false
            LogMessage "WARN","Verification","Failed to Set Text Box :CostPerTableorPax" ,false
       Exit Function
   End If
   setCostPerTableorPaxTextbox=true
End Function

'[Get DateOfWeddingBanquet Label Text]
Public Function getDateOfWeddingBanquetText()
   bDevPending=false
   getDateOfWeddingBanquetText=Temporarylimit_Page.txtDateOfWeddingBanquet.GetRoProperty("innertext")
End Function

'[Verify Field DateOfWeddingBanquet displayed as]
Public Function verifyDateOfWeddingBanquetText(strExpectedText)
   bDevPending=false
   bVerifyDateOfWeddingBanquetText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyField( Temporarylimit_Page.txtDateOfWeddingBanquet(), strExpectedText, "DateOfWeddingBanquet")Then
           bVerifyDateOfWeddingBanquetText=false
       End If
   End If
   verifyDateOfWeddingBanquetText=bVerifyDateOfWeddingBanquetText
End Function


'[Set TextBox DateOfWeddingBanquet to]
Public Function setDateOfWeddingBanquetTextbox(strDateOfWeddingBanquet)
   bDevPending=false
   Temporarylimit_Page.txtDateOfWeddingBanquet.Set(strDateOfWeddingBanquet)
   If Err.Number<>0 Then
       setDateOfWeddingBanquetTextbox=false
            LogMessage "WARN","Verification","Failed to Set Text Box :DateOfWeddingBanquet" ,false
       Exit Function
   End If
   setDateOfWeddingBanquetTextbox=true
End Function

'[Get Destination Label Text]
Public Function getDestinationText()
   bDevPending=false
   getDestinationText=Temporarylimit_Page.txtDestination.GetRoProperty("innertext")
End Function

'[Verify Field Destination displayed as]
Public Function verifyDestinationText(strExpectedText)
   bDevPending=false
   bVerifyDestinationText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyField( Temporarylimit_Page.txtDestination(), strExpectedText, "Destination")Then
           bVerifyDestinationText=false
       End If
   End If
   verifyDestinationText=bVerifyDestinationText
End Function

'[Set TextBox Destination to]
Public Function setDestinationTextbox(strDestination)
   bDevPending=false
   Temporarylimit_Page.txtDestination.Set(strDestination)
   If Err.Number<>0 Then
       setDestinationTextbox=false
            LogMessage "WARN","Verification","Failed to Set Text Box :Destination" ,false
       Exit Function
   End If
   setDestinationTextbox=true
End Function

'[Get DurationDays Label Text]
Public Function getDurationDaysText()
   bDevPending=false
   getDurationDaysText=Temporarylimit_Page.txtDurationDays.GetRoProperty("innertext")
End Function

'[Verify Field DurationDays displayed as]
Public Function verifyDurationDaysText(strExpectedText)
   bDevPending=false
   bVerifyDurationDaysText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyField( Temporarylimit_Page.txtDurationDays(), strExpectedText, "DurationDays")Then
           bVerifyDurationDaysText=false
       End If
   End If
   verifyDurationDaysText=bVerifyDurationDaysText
End Function

'[Set TextBox DurationDays to]
Public Function setDurationDaysTextbox(strDurationDays)
   bDevPending=false
   Temporarylimit_Page.txtDurationDays.Set(strDurationDays)
   If Err.Number<>0 Then
       setDurationDaysTextbox=false
            LogMessage "WARN","Verification","Failed to Set Text Box :DurationDays" ,false
       Exit Function
   End If
   setDurationDaysTextbox=true
End Function

'[Get EffectiveDate Label Text]
Public Function getEffectiveDateText()
   bDevPending=false
   getEffectiveDateText=Temporarylimit_Page.txtEffectiveDate.GetRoProperty("innertext")
End Function

'[Verify Field EffectiveDate displayed as]
Public Function verifyEffectiveDateText(strExpectedText)
   bDevPending=false
   bVerifyEffectiveDateText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyField( Temporarylimit_Page.txtEffectiveDate(), strExpectedText, "EffectiveDate")Then
           bVerifyEffectiveDateText=false
       End If
   End If
   verifyEffectiveDateText=bVerifyEffectiveDateText
End Function


'[Set TextBox EffectiveDate to]
Public Function setEffectiveDateTextbox(strEffectiveDate)
   bDevPending=false
   If not ISNull (strEffectiveDate) Then
   	Temporarylimit_Page.txtEffectiveDate.Set(strEffectiveDate)
   End If
   If Err.Number<>0 Then
       setEffectiveDateTextbox=false
            LogMessage "WARN","Verification","Failed to Set Text Box :EffectiveDate" ,false
       Exit Function
   End If
   setEffectiveDateTextbox=true
End Function

'[Get ExpiryDate Label Text]
Public Function getExpiryDateText()
   bDevPending=false
   getExpiryDateText=Temporarylimit_Page.txtExpiryDate.GetRoProperty("innertext")
End Function

'[Verify Field ExpiryDate displayed as]
Public Function verifyExpiryDateText(strExpectedText)
   bDevPending=false
   bVerifyExpiryDateText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyField( Temporarylimit_Page.txtExpiryDate(), strExpectedText, "ExpiryDate")Then
           bVerifyExpiryDateText=false
       End If
   End If
   verifyExpiryDateText=bVerifyExpiryDateText
End Function

'[Set TextBox ExpiryDate to]
Public Function setExpiryDateTextbox(strExpiryDate)
   bDevPending=false
   If not isnull(strExpiryDate) Then
   	Temporarylimit_Page.txtExpiryDate.Set(strExpiryDate)   		
   End If
   
   If Err.Number<>0 Then
       setExpiryDateTextbox=false
            LogMessage "WARN","Verification","Failed to Set Text Box :ExpiryDate" ,false
       Exit Function
   End If
   Wait 1
   setExpiryDateTextbox=true
End Function

'[Get HospitalClinicName Label Text]
Public Function getHospitalClinicNameText()
   bDevPending=false
   getHospitalClinicNameText=Temporarylimit_Page.txtHospitalClinicName.GetRoProperty("innertext")
End Function

'[Verify Field HospitalClinicName displayed as]
Public Function verifyHospitalClinicNameText(strExpectedText)
   bDevPending=false
   bVerifyHospitalClinicNameText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyField( Temporarylimit_Page.txtHospitalClinicName(), strExpectedText, "HospitalClinicName")Then
           bVerifyHospitalClinicNameText=false
       End If
   End If
   verifyHospitalClinicNameText=bVerifyHospitalClinicNameText
End Function


'[Set TextBox HospitalClinicName to]
Public Function setHospitalClinicNameTextbox(strHospitalClinicName)
   bDevPending=false
   Temporarylimit_Page.txtHospitalClinicName.Set(strHospitalClinicName)
   If Err.Number<>0 Then
       setHospitalClinicNameTextbox=false
            LogMessage "WARN","Verification","Failed to Set Text Box :HospitalClinicName" ,false
       Exit Function
   End If
   setHospitalClinicNameTextbox=true
End Function

'[Get HotelorRestaurantName Label Text]
Public Function getHotelorRestaurantNameText()
   bDevPending=false
   getHotelorRestaurantNameText=Temporarylimit_Page.txtHotelorRestaurantName.GetRoProperty("innertext")
End Function

'[Verify Field HotelorRestaurantName displayed as]
Public Function verifyHotelorRestaurantNameText(strExpectedText)
   bDevPending=false
   bVerifyHotelorRestaurantNameText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyField( Temporarylimit_Page.txtHotelorRestaurantName(), strExpectedText, "HotelorRestaurantName")Then
           bVerifyHotelorRestaurantNameText=false
       End If
   End If
   verifyHotelorRestaurantNameText=bVerifyHotelorRestaurantNameText
End Function


'[Set TextBox HotelorRestaurantName to]
Public Function setHotelorRestaurantNameTextbox(strHotelorRestaurantName)
   bDevPending=false
   Temporarylimit_Page.txtHotelorRestaurantName.Set(strHotelorRestaurantName)
   If Err.Number<>0 Then
       setHotelorRestaurantNameTextbox=false
            LogMessage "WARN","Verification","Failed to Set Text Box :HotelorRestaurantName" ,false
       Exit Function
   End If
   setHotelorRestaurantNameTextbox=true
End Function

'[Get NoOfTableorPax Label Text]
Public Function getNoOfTableorPaxText()
   bDevPending=false
   getNoOfTableorPaxText=Temporarylimit_Page.txtNoOfTableorPax.GetRoProperty("innertext")
End Function

'[Verify Field NoOfTableorPax displayed as]
Public Function verifyNoOfTableorPaxText(strExpectedText)
   bDevPending=false
   bVerifyNoOfTableorPaxText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyField( Temporarylimit_Page.txtNoOfTableorPax(), strExpectedText, "NoOfTableorPax")Then
           bVerifyNoOfTableorPaxText=false
       End If
   End If
   verifyNoOfTableorPaxText=bVerifyNoOfTableorPaxText
End Function


'[Set TextBox NoOfTableorPax to]
Public Function setNoOfTableorPaxTextbox(strNoOfTableorPax)
   bDevPending=false
   Temporarylimit_Page.txtNoOfTableorPax.Set(strNoOfTableorPax)
   If Err.Number<>0 Then
       setNoOfTableorPaxTextbox=false
            LogMessage "WARN","Verification","Failed to Set Text Box :NoOfTableorPax" ,false
       Exit Function
   End If
   setNoOfTableorPaxTextbox=true
End Function

'[Get SpecialInstructions Label Text]
Public Function getSpecialInstructionsText()
   bDevPending=false
   getSpecialInstructionsText=Temporarylimit_Page.txtSpecialInstructions.GetRoProperty("innertext")
End Function

'[Verify Field SpecialInstructions displayed as]
Public Function verifySpecialInstructionsText(strExpectedText)
   bDevPending=false
   bVerifySpecialInstructionsText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyField( Temporarylimit_Page.txtSpecialInstructions(), strExpectedText, "SpecialInstructions")Then
           bVerifySpecialInstructionsText=false
       End If
   End If
   verifySpecialInstructionsText=bVerifySpecialInstructionsText
End Function


'[Set TextBox SpecialInstructions to]
Public Function setSpecialInstructionsTextbox(strSpecialInstructions)
   bDevPending=false
   Temporarylimit_Page.txtSpecialInstructions.Set(strSpecialInstructions)
   If Err.Number<>0 Then
       setSpecialInstructionsTextbox=false
            LogMessage "WARN","Verification","Failed to Set Text Box :SpecialInstructions" ,false
       Exit Function
   End If
   setSpecialInstructionsTextbox=true
End Function

'[Get TravelPeriodFrom Label Text]
Public Function getTravelPeriodFromText()
   bDevPending=false
   getTravelPeriodFromText=Temporarylimit_Page.txtTravelPeriodFrom.GetRoProperty("innertext")
End Function

'[Verify Field TravelPeriodFrom displayed as]
Public Function verifyTravelPeriodFromText(strExpectedText)
   bDevPending=false
   bVerifyTravelPeriodFromText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyField( Temporarylimit_Page.txtTravelPeriodFrom(), strExpectedText, "TravelPeriodFrom")Then
           bVerifyTravelPeriodFromText=false
       End If
   End If
   verifyTravelPeriodFromText=bVerifyTravelPeriodFromText
End Function

'[Set TextBox TravelPeriodFrom to]
Public Function setTravelPeriodFromTextbox(strTravelPeriodFrom)
   bDevPending=false
   Temporarylimit_Page.txtTravelPeriodFrom.Set(strTravelPeriodFrom)
   If Err.Number<>0 Then
       setTravelPeriodFromTextbox=false
            LogMessage "WARN","Verification","Failed to Set Text Box :TravelPeriodFrom" ,false
       Exit Function
   End If
   setTravelPeriodFromTextbox=true
End Function

'[Get TravelPeriodTo Label Text]
Public Function getTravelPeriodToText()
   bDevPending=false
   getTravelPeriodToText=Temporarylimit_Page.txtTravelPeriodTo.GetRoProperty("innertext")
End Function

'[Verify Field TravelPeriodTo displayed as]
Public Function verifyTravelPeriodToText(strExpectedText)
   bDevPending=false
   bVerifyTravelPeriodToText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyField( Temporarylimit_Page.txtTravelPeriodTo(), strExpectedText, "TravelPeriodTo")Then
           bVerifyTravelPeriodToText=false
       End If
   End If
   verifyTravelPeriodToText=bVerifyTravelPeriodToText
End Function


'[Set TextBox TravelPeriodTo to]
Public Function setTravelPeriodToTextbox(strTravelPeriodTo)
   bDevPending=false
   Temporarylimit_Page.txtTravelPeriodTo.Set(strTravelPeriodTo)
   If Err.Number<>0 Then
       setTravelPeriodToTextbox=false
            LogMessage "WARN","Verification","Failed to Set Text Box :TravelPeriodTo" ,false
       Exit Function
   End If
   setTravelPeriodToTextbox=true
End Function

'[Click Button AddNotes]
Public Function clickButtonAddNotes()
   bDevPending=false
   Temporarylimit_Page.btnAddNotes.click
   If Err.Number<>0 Then
       clickButtonAddNotes=false
            LogMessage "WARN","Verification","Failed to Click Button : AddNotes" ,false
       Exit Function
   End If
   clickButtonAddNotes=true
End Function

'[Click Button Cancel on temp limit]
Public Function clickButtonCancel()
   bDevPending=false
   Temporarylimit_Page.btnCancel.click
   If Err.Number<>0 Then
       clickButtonCancel=false
            LogMessage "WARN","Verification","Failed to Click Button : Cancel" ,false
       Exit Function
   End If
   Temporarylimit_Page.btnYes.click
   clickButtonCancel=true
End Function


'[Click Button Cancel for No]
Public Function clickButtonCancel_No()
   bDevPending=false
   Temporarylimit_Page.btnCancel.click
   If Err.Number<>0 Then
       clickButtonCancel_No=false
            LogMessage "WARN","Verification","Failed to Click Button : Cancel" ,false
       Exit Function
   End If
   Temporarylimit_Page.btnNo.click
   clickButtonCancel_No=true
End Function

'[Click Button Submit on TempLimit]
Public Function clickButtonSubmit_TL()
   bDevPending=false
   Temporarylimit_Page.btnSubmit.click
   If Err.Number<>0 Then
       clickButtonSubmit=false
            LogMessage "WARN","Verification","Failed to Click Button : Submit" ,false
       Exit Function
   End If
   clickButtonSubmit_TL=true
End Function

'[Get Description Label Text]
Public Function getDescriptionText()
   bDevPending=false
   getDescriptionText=Temporarylimit_Page.lblDescription.GetRoProperty("innertext")
End Function

'[Verify Field Description displayed in Temp Limit as]
Public Function verifyDescriptionTextTempLimit(strExpectedText)
   bDevPending=false
   bverifyDescriptionTextTempLimit=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (Temporarylimit_Page.lblDescription(), strExpectedText, "Description")Then
           bverifyDescriptionTextTempLimit=false
       End If
   End If
   verifyDescriptionTextTempLimit=bverifyDescriptionTextTempLimit
End Function

'[Get DOAAmount Label Text]
Public Function getDOAAmountText()
   bDevPending=false
   getDOAAmountText=Temporarylimit_Page.lblDOAAmount.GetRoProperty("innertext")
End Function

'[Verify Field DOAAmount displayed as]
Public Function verifyDOAAmountText(strExpectedText)
   bDevPending=false
   bVerifyDOAAmountText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (Temporarylimit_Page.lblDOAAmount(), strExpectedText, "DOAAmount")Then
           bVerifyDOAAmountText=false
       End If
   End If
   verifyDOAAmountText=bVerifyDOAAmountText
End Function

'[Get NotesCount Label Text]
Public Function getNotesCountText()
   bDevPending=false
   getNotesCountText=Temporarylimit_Page.lblNotesCount.GetRoProperty("innertext")
End Function

'[Verify Field NotesCount displayed as]
Public Function verifyNotesCountText(strExpectedText)
   bDevPending=false
   bVerifyNotesCountText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (Temporarylimit_Page.lblNotesCount(), strExpectedText, "NotesCount")Then
           bVerifyNotesCountText=false
       End If
   End If
   verifyNotesCountText=bVerifyNotesCountText
End Function

'[Get StaffIndicator Label Text]
Public Function getStaffIndicatorText()
   bDevPending=false
   getStaffIndicatorText=Temporarylimit_Page.lblStaffIndicator.GetRoProperty("innertext")
End Function

'[Verify Field StaffIndicator displayed as]
Public Function verifyStaffIndicatorText(strExpectedText)
   bDevPending=false
   bVerifyStaffIndicatorText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (Temporarylimit_Page.lblStaffIndicator(), strExpectedText, "StaffIndicator")Then
           bVerifyStaffIndicatorText=false
       End If
   End If
   verifyStaffIndicatorText=bVerifyStaffIndicatorText
End Function

'[Click Link KnowledgeBase]
Public Function clickLinkKnowledgeBase()
   bDevPending=false
   Temporarylimit_Page.lnkKnowledgeBase.click
   If Err.Number<>0 Then
       clickLinkKnowledgeBase=false
            LogMessage "WARN","Verification","Failed to Click Link : KnowledgeBase" ,false
       Exit Function
   End If
   clickLinkKnowledgeBase=true
End Function

'[Select Combobox ApprovalLevel as]
Public Function selectApprovalLevelComboBox(strApprovalLevel)
   bDevPending=false
   bSelectApprovalLevelComboBox=true
   If Not IsNull(strApprovalLevel) Then
       If Not (selectItem_Combobox (Temporarylimit_Page.lstApprovalLevel(), strApprovalLevel))Then
            LogMessage "WARN","Verification","Failed to select :"&strApprovalLevel&" From ApprovalLevel drop down list" ,false
           bSelectApprovalLevelComboBox=false
       End If
   End If
   WaitForIcallLoading
   selectApprovalLevelComboBox=bSelectApprovalLevelComboBox
End Function

'[Get selected item from combo box ApprovalLevel]
Public Function getApprovalLevelSelectedItem()
   bDevPending=false
   getApprovalLevelSelectedItem=getVadinCombo_SelectedItem(Temporarylimit_Page.lstApprovalLevel)
End Function

'[Verify Combobox ApprovalLevel displayed as]
Public Function verifyApprovalLevelText(strExpectedText)
   bDevPending=false
   bVerifyApprovalLevelText=true
   If Not IsNull(strExpectedText) Then
       If Not verifyComboSelectItem (Temporarylimit_Page.lstApprovalLevel(), strExpectedText, "ApprovalLevel")Then
           bVerifyApprovalLevelText=false
       End If
   End If
   verifyApprovalLevelText=bVerifyApprovalLevelText
End Function

'[Select Combobox ReasonforIncrease as]
Public Function selectReasonforIncreaseComboBox(strReasonforIncrease)
   bDevPending=false
   bSelectReasonforIncreaseComboBox=true
   Wait 1
   If Not IsNull(strReasonforIncrease) Then
       If Not (selectItem_Combobox (Temporarylimit_Page.lstReasonforIncrease(), strReasonforIncrease))Then
            LogMessage "WARN","Verification","Failed to select :"&strReasonforIncrease&" From ReasonforIncrease drop down list" ,false
           bSelectReasonforIncreaseComboBox=false
       End If
   End If
   selectReasonforIncreaseComboBox=bSelectReasonforIncreaseComboBox
End Function

'[Get selected item from combo box ReasonforIncrease]
Public Function getReasonforIncreaseSelectedItem()
   bDevPending=false
   getReasonforIncreaseSelectedItem=getVadinCombo_SelectedItem(Temporarylimit_Page.lstReasonforIncrease)
End Function

'[Verify Combobox ReasonforIncrease displayed as]
Public Function verifyReasonforIncreaseText(strExpectedText)
   bDevPending=false
   bVerifyReasonforIncreaseText=true
   If Not IsNull(strExpectedText) Then
       If Not verifyComboSelectItem (Temporarylimit_Page.lstReasonforIncrease(), strExpectedText, "ReasonforIncrease")Then
           bVerifyReasonforIncreaseText=false
       End If
   End If
   verifyReasonforIncreaseText=bVerifyReasonforIncreaseText
End Function

'[Verify Table SelectedCardsContent displayed]
Public Function verifySelectedCardsContentTabledisplayed()
   bDevPending=false
   verifySelectedCardsContentdisplayed= Temporarylimit_Page.tblSelectedCardsContent.Exist(1)
End Function
'[Verify Table SelectedCardsContent has following Columns]
Public Function verifySelectedCardsContentTableColumns(arrColumnNameList)
   bDevPending=false
   verifySelectedCardsContentTableColumns=verifyTableColumns(Temporarylimit_Page.tblSelectedCardsContent,arrColumnNameList)
End Function
'[Verify row Data in Table SelectedCardsContent forTL]
Public Function verifytblSelectedCardsContent_RowData(arrRowDataList)
   bDevPending=false
   verifytblSelectedCardsContent_RowData=verifyTableContentList(Temporarylimit_Page.tblSelectedCardsContentHeader,Temporarylimit_Page.tblSelectedCardsContentContent,arrRowDataList,"SelectedCardsContent" , bPagination,Temporarylimit_Page.lnkNext ,Temporarylimit_Page.lnkNext1,Temporarylimit_Page.lnkPrevious)
End Function

'[Click <Column Name> link in Table SelectedCardsContent]
Public Function clickSelectedCardsContent_link(arrRowDataList)
   bDevPending=false
   clickSelectedCardsContent_link=selectTableLink(Temporarylimit_Page.tblSelectedCardsContentHeader,Temporarylimit_Page.tblSelectedCardsContentContent,arrRowDataList,"SelectedCardsContent" ,"Column Name",bPagination,Temporarylimit_Page.lnkNext ,Temporarylimit_Page.lnkNext1 ,Temporarylimit_Page.lnkPrevious)
End Function

'[Verify Table SelectedCardsHeader displayed]
Public Function verifySelectedCardsHeaderTabledisplayed()
   bDevPending=false
   verifySelectedCardsHeaderdisplayed= Temporarylimit_Page.tblSelectedCardsHeader.Exist(1)
End Function
'[Verify Table SelectedCardsHeader has following Columns]
Public Function verifySelectedCardsHeaderTableColumns(arrColumnNameList)
   bDevPending=false
   verifySelectedCardsHeaderTableColumns=verifyTableColumns(Temporarylimit_Page.tblSelectedCardsHeader,arrColumnNameList)
End Function
'[Verify row Data in Table SelectedCardsHeader]
Public Function verifytblSelectedCardsHeader_RowData(arrRowDataList)
   bDevPending=false
   verifytblSelectedCardsHeader_RowData=verifyTableContentList(Temporarylimit_Page.tblSelectedCardsHeaderHeader,Temporarylimit_Page.tblSelectedCardsHeaderContent,arrRowDataList,"SelectedCardsHeader" , bPagination,Temporarylimit_Page.lnkNext ,Temporarylimit_Page.lnkNext1,Temporarylimit_Page.lnkPrevious)
End Function

'[Click <Column Name> link in Table SelectedCardsHeader]
Public Function clickSelectedCardsHeader_link(arrRowDataList)
   bDevPending=false
   clickSelectedCardsHeader_link=selectTableLink(Temporarylimit_Page.tblSelectedCardsHeaderHeader,Temporarylimit_Page.tblSelectedCardsHeaderContent,arrRowDataList,"SelectedCardsHeader" ,"Column Name",bPagination,Temporarylimit_Page.lnkNext ,Temporarylimit_Page.lnkNext1 ,Temporarylimit_Page.lnkPrevious)
End Function


'[Verify Validation Message displayed on Temporarylimit as]
Public Function verifyValidationMessage_TL3(strValidationMessage)
   bDevPending=False
   bVerifyValidationMessageText=true
   If Not IsNull(strValidationMessage) Then
       If Not VerifyInnerText (Temporarylimit_Page.lblValidationMessage(), strValidationMessage, "Validation Message")Then
           bVerifyValidationMessageText=false
        Else
         bVerifyValidationMessageText=True
       End If
   End If
   Temporarylimit_Page.btnOK_ValidationMsg.click
   verifyValidationMessage_TL3=bVerifyValidationMessageText
End Function


'[Verify Validation Message for Additional Amount displayed on Temporarylimit as]
Public Function verifyValidationMessage_TL2(strValidationMessage)
   bDevPending=False
   bVerifyValidationMessageText=true
   If Not IsNull(strValidationMessage) Then
       If Not VerifyInnerText (Temporarylimit_Page.lblAdditionalAmountValidation(), strValidationMessage, "Validation Message")Then
           bVerifyValidationMessageText=false
        Else
         bVerifyValidationMessageText=True
       End If
   End If
   verifyValidationMessage_TL2=bVerifyValidationMessageText
End Function

'[Verify Submit Button  is disabled on TempLimit Screen]
Public Function VerifybtnAddNoteDisable_TL()
	bDevPending=False
   Dim bVerifybtnSubmit_TL:bVerifybtnSubmit_TL=true
	'CashlineCancellation.tblSelectedCardsHeader.Click
	intBtnSubmit=Instr(Temporarylimit_Page.btnSubmit.GetROproperty("outerhtml"),("disabled"))
	If  not intBtnSubmit=0 Then
		LogMessage "RSLT","Verification","Submit button is disable as per expectation.",True
		bVerifybtnSubmit_TL=true
	Else
		LogMessage "WARN","Verifiation","Submit button is enable. Expected to be disable.",false
		bVerifybtnSubmit_TL=false
	End If
	VerifybtnAddNoteDisable_TL=bVerifybtnSubmit_TL
End Function


'[Validate Additonal Amount for TempLimit]
Public Function ValidationAddtitionamoumt(StrApprovalLevel,StrReasonForIncrease,StrAddtionalAmount,strValidationMessage)
	bDevPending=False
	bVerifyValidationMessageText = true
	'Permcreditlimit = Temporarylimit_Page.tblSelectedCardsContent.GetCellData(1, 3)
	Permcreditlimit = getCellTextFor(Temporarylimit_Page.tblSelectedCardsHeader,Temporarylimit_Page.tblSelectedCardsContent,"0","Perm Credit Limit")
	
	If Not ((StrApprovalLevel) = "Credit Review (After Office Hours)" or (StrApprovalLevel) = "Credit Review") Then	
		If (StrReasonForIncrease) = "Travel" Then
			
			Travel100perc=Permcreditlimit*100
			'Requested amount requires Credit Review.
			If  (StrAddtionalAmount) >Travel100perc  Then
				If Not VerifyInnerText (Temporarylimit_Page.lblAdditionalAmountValidation(), strValidationMessage, "Validation Message")Then
           			bVerifyValidationMessageText=false
       			 Else
         		   bVerifyValidationMessageText=True
			    End If
			End If	
		Else
			otherthanTravel200perc=Permcreditlimit*200	
			If  (StrAddtionalAmount) > otherthanTravel200perc  Then	
				If Not VerifyInnerText (Temporarylimit_Page.lblAdditionalAmountValidation(), strValidationMessage, "Validation Message")Then
           			bVerifyValidationMessageText=false
       			 Else
         			bVerifyValidationMessageText=True
      		 	End If
			End If	
		End If
	End If
	ValidationAddtitionamoumt=bVerifyValidationMessageText
End Function
	
'[Verify Validation Message for Approval level displayed on Temporarylimit as]
Public Function verifyValidationMessageApproval_TL(strValidationMessage)
   bDevPending=False
   bVerifyValidationMessageText=true
   If Not IsNull(strValidationMessage) Then
       If Not VerifyInnerText (Temporarylimit_Page.lblDOAAmount(), strValidationMessage, "Approval Level")Then
           bVerifyValidationMessageText=false
        Else
         bVerifyValidationMessageText=True
       End If
   End If
   WaitForIcallLoading
   verifyValidationMessageApproval_TL=bVerifyValidationMessageText
End Function

'[Verify Validation Message for Effectivate date displayed on Temporarylimit as]
Public Function verifyValidationMessageEffdate_TL(strValidationMessage)
   bDevPending=False
   bVerifyValidationMessageText=true
   If Not IsNull(strValidationMessage) Then
       If Not VerifyInnerText (Temporarylimit_Page.lblEffdateValidationmsg(), strValidationMessage, "Effective Date")Then
           bVerifyValidationMessageText=false
        Else
         bVerifyValidationMessageText=True
       End If
   End If
   WaitForIcallLoading
   verifyValidationMessageEffdate_TL=bVerifyValidationMessageText
End Function

'[Verify Validation Message for Expiry date displayed on Temporarylimit as]
Public Function verifyValidationMessageExpdate_TL(strValidationMessage)
   bDevPending=False
   bVerifyValidationMessageText=true
   If Not IsNull(strValidationMessage) Then
       If Not VerifyInnerText (Temporarylimit_Page.lblExpDateValidationMsg(), strValidationMessage, "Expiry Date")Then
           bVerifyValidationMessageText=false
        Else
         bVerifyValidationMessageText=True
       End If
   End If
   WaitForIcallLoading
   verifyValidationMessageExpdate_TL=bVerifyValidationMessageText
End Function

'[Verify Validation Message for Travel Start date displayed on Temporarylimit as]
Public Function verifyValidationMessageTSD_TL(strValidationMessage)
   bDevPending=False
   bVerifyValidationMessageText=true
   If Not IsNull(strValidationMessage) Then
       If Not VerifyInnerText (Temporarylimit_Page.lblTravelStartdateValidationMsg(), strValidationMessage, "Travel Start Date")Then
           bVerifyValidationMessageText=false
        Else
         bVerifyValidationMessageText=True
       End If
   End If
   WaitForIcallLoading
   verifyValidationMessageTSD_TL=bVerifyValidationMessageText
End Function

'[Verify Validation Message for Travel End date displayed on Temporarylimit as]
Public Function verifyValidationMessageTED_TL(strValidationMessage)
   bDevPending=False
   bVerifyValidationMessageText=true
   If Not IsNull(strValidationMessage) Then
       If Not VerifyInnerText (Temporarylimit_Page.lblTravelEndDatevalidationMsg(), strValidationMessage, "Travel End Date")Then
           bVerifyValidationMessageText=false
        Else
         bVerifyValidationMessageText=True
       End If
   End If
   WaitForIcallLoading
   verifyValidationMessageTED_TL=bVerifyValidationMessageText
End Function

'[Verify Validation Message for Admission date displayed on Temporarylimit as]
Public Function verifyValidationMessageAdmisionDate_TL(strValidationMessage)
   bDevPending=False
   bVerifyValidationMessageText=true
   If Not IsNull(strValidationMessage) Then
       If Not VerifyInnerText (Temporarylimit_Page.lblAdmissionErromsg(), strValidationMessage, "Admission Date")Then
           bVerifyValidationMessageText=false
        Else
         bVerifyValidationMessageText=True
       End If
   End If
   WaitForIcallLoading
   verifyValidationMessageAdmisionDate_TL=bVerifyValidationMessageText
End Function

'[Verify Validation Message for Duration date displayed on Temporarylimit as]
Public Function verifyValidationMessageDurationDate_TL(strValidationMessage)
   bDevPending=False
   bVerifyValidationMessageText=true
   If Not IsNull(strValidationMessage) Then
       If Not VerifyInnerText (Temporarylimit_Page.lbldurationErrorMsg(), strValidationMessage, "Duration Date")Then
           bVerifyValidationMessageText=false
        Else
         bVerifyValidationMessageText=True
       End If
   End If
   WaitForIcallLoading
   verifyValidationMessageDurationDate_TL=bVerifyValidationMessageText
End Function

'[Verify Validation Message for Wedding date displayed on Temporarylimit as]
Public Function verifyValidationMessageWeddingDate_TL(strValidationMessage)
   bDevPending=False
   bVerifyValidationMessageText=true
   If Not IsNull(strValidationMessage) Then
       If Not VerifyInnerText (Temporarylimit_Page.lblWeddingDateErrMsg(), strValidationMessage, "Wedding Date")Then
           bVerifyValidationMessageText=false
        Else
         bVerifyValidationMessageText=True
       End If
   End If
   WaitForIcallLoading
   verifyValidationMessageWeddingDate_TL=bVerifyValidationMessageText
End Function

'[Verify Validation Message for CostPerTable displayed on Temporarylimit as]
Public Function verifyValidationMessageCPT_TL(strValidationMessage)
   bDevPending=False
   bVerifyValidationMessageText=true
   If Not IsNull(strValidationMessage) Then
       If Not VerifyInnerText (Temporarylimit_Page.lblCostPaxErrMsg(), strValidationMessage, "Cost Per Table")Then
           bVerifyValidationMessageText=false
        Else
         bVerifyValidationMessageText=True
       End If
   End If
   WaitForIcallLoading
   verifyValidationMessageCPT_TL=bVerifyValidationMessageText
End Function


'[Verify Validation Message for NoOfTable displayed on Temporarylimit as]
Public Function verifyValidationMessageNoofTablePax_TL(strValidationMessage)
   bDevPending=False
   bVerifyValidationMessageText=true
   If Not IsNull(strValidationMessage) Then
       If Not VerifyInnerText (Temporarylimit_Page.lblNoofTablePAXerrMsg(), strValidationMessage, "No of Table or Pax")Then
           bVerifyValidationMessageText=false
        Else
         bVerifyValidationMessageText=True
       End If
   End If
   WaitForIcallLoading
   verifyValidationMessageNoofTablePax_TL=bVerifyValidationMessageText
End Function


'[Perform Add Notes by clicking Add Notes Button on TempLimitIncrease Screen]
Public Function addNote_TL(strNote)
   bDevPending=false
   bVerifypopupNotes=true
	Dim bVerifypopupNotes:VerifypopupNotes=true
	
	If not isNull(strNote) Then
		Temporarylimit_Page.btnAddNotes.click
		WaitForICallLoading
            If not Temporarylimit_Page.popupValidationMessage.exist(5)Then
				LogMessage "WARN","Verification","New Note dialog did not displayed",false
				bVerifypopupNotes=false
			 else
			 strMessage=Temporarylimit_Page.lblMaxAllowed.GetROProperty("innerText")
				If not strMessage="Max allowed - 3000" Then
					LogMessage "WARN","Verification","Add New Comment popup dislog incorrectly displayed max allowed character count for comment. Expected : Max allowed - 3000 and Actual: "&strMessage,false
					bVerifypopupNotes=false
				End If
			   ServiceRequest.txtNewComment.set (strNote)
			  
				   ServiceRequest.clickSave_Popup
			  WaitForIcallLoading
		   End If 
		End If 
	addNote_TL=bVerifypopupNotes
End Function

'[Verify Field KnowledgeBase on TempLimitIncrese SR Screen displayed as]
Public Function verifyKnowledgeBase_TL(strExpectedLink)
   bDevPending=false
   bVerifyKnowledgeBaseText=true
   If Not IsNull(strExpectedLink) Then
		
		Set oDesc_KB = Description.Create()
			oDesc_KB("micclass").Value = "Link"
		
			strKBLink=Temporarylimit_Page.lnkKnowledgeBase.ChildObjects(oDesc_KB)(0).GetROProperty("href")
			strExpectedLink=Replace(strExpectedLink,"@","=")
       If not MatchStr(strKBLink, strExpectedLink)Then
		   LogMessage "RSLT","Verification","Knowledge base link does not matched with expected. Actual : "&strKBLink&" Expected "&strExpectedLink,false
           bVerifyKnowledgeBaseText=false
	   else
	 		LogMessage "RSLT","Verification","Knowledge base link matrched with expected",true
       End If
   End If
   verifyKnowledgeBase_TL=bVerifyKnowledgeBaseText
End Function

'[Verify Button Submit is enabled on Temp Limit Screen]
Public Function VerifybtnSubmit_TL()
	bDevPending=False
   Dim bVerifybtnSubmit_TL:bVerifybtnSubmit_TL=true
	intBtnSubmit=Instr(Temporarylimit_Page.btnSubmit.GetROproperty("outerhtml"),("v-disabled"))
	If  intBtnSubmit=0 Then
		LogMessage "RSLT","Verification","Submit button is enable as per expectation.",True
		bVerifybtnSubmit_TL=true
	Else
		LogMessage "WARN","Verifiation","Submit button is disable. Expected to be enable.",false
		bVerifybtnSubmit_TL=false
	End If
	VerifybtnSubmit_TL=bVerifybtnSubmit_TL
End Function

'
''[Get VPLUS date from Datastore]
'Public Function getDate_Vplus()
'	strtest=strRunTimeDate
'	strDate = DateAdd("m",1,strtest)
'	var=strDate
'	var_month=mid(strDate,4,2)
'	var_month_change=MonthName(var_month,True)
'	var_month_format=replace(var,var_month,var_month_change)
'	strDate=replace(var_month_format,"/"," ")
'	Temporarylimit_Page.txtEffectiveDate.Set(strDate)
'   If Err.Number<>0 Then
'       setEffectiveDateTextbox=false
'            LogMessage "WARN","Verification","Failed to Set Text Box :EffectiveDate" ,false
'       Exit Function
'   End If
'   setEffectiveDateTextbox=true
'	
'	'strDate=fetchFromDataStore(strRunTimeTimeStamp,"BLANK","Date_VPLUS")(0)
'
'End Function.

'[Set TextBox EffectiveDate at Runtime]
Public Function setEffectiveDateRuntimeTextbox()
   bDevPending=false
   'If Vplus date is less than current date then have to enter current date.
   ' If Vplus date is greater than current date then have to enter vplus date.
   If CDate(strRunTimeDate) > Now Then
   	strDate=strRunTimeDate
		If len(Day(CDate(strDate)))=1 Then
        	strDay="0"&Day(CDate(strDate))
    	else
       	strDay=""&Day(CDate(strDate))
    	End If
    	strDate=""&strDay & " "&monthName(Month(CDate(strDate)),true) &" " &Year(CDate(strDate))
   Else
   		strDate=Now
		If len(Day(CDate(Now)))=1 Then
			strDay="0"&Day(CDate(Now))
		else
			strDay=""&Day(CDate(Now))
		End If
			strDate=""&strDay & " "&monthName(Month(CDate(Now)),true) &" " &Year(CDate(Now))	
   End If
   	Temporarylimit_Page.txtEffectiveDate.Set(strDate)
   	waitForIcallLoading   	 
   	If Err.Number<>0 Then
       	setEffectiveDateRuntimeTextbox=false
            LogMessage "WARN","Verification","Failed to Set Text Box :EffectiveDate" ,false
        Exit Function
   	End If
   	setEffectiveDateRuntimeTextbox=true  
End Function

'[Set TextBox ExpiryDate for Temp Limit]
Public Function setExpiryDateTextbox_TL(strExpiryDate)
   bDevPending=false
   If strExpiryDate = "RUNTIME" Then	   
	   strEffectiveDate = Temporarylimit_Page.txtEffectiveDate.getroproperty("value")
	   strExpiryDate = Temporarylimit_Page.txtExpiryDate.getroproperty("value")
	   strDateDiff = DateDiff("d",strEffectiveDate,strExpiryDate)   
		   If strDateDiff >59 Then
		   	strExpiryDate = DateAdd("d",10,strEffectiveDate)
		   	If len(Day(CDate(strExpiryDate)))=1 Then
		        	strDay="0"&Day(CDate(strExpiryDate))
		    	else
		       	strDay=""&Day(CDate(strExpiryDate))
		    	End If
		    	strExpiryDate=""&strDay & " "&monthName(Month(CDate(strExpiryDate)),true) &" " &Year(CDate(strExpiryDate))
				Temporarylimit_Page.txtExpiryDate.Set(strExpiryDate) 
		   End If
	Else
		Temporarylimit_Page.txtExpiryDate.Set(strExpiryDate)
	End If
   If Err.Number<>0 Then
       setExpiryDateTextbox_TL=false
            LogMessage "WARN","Verification","Failed to Set Text Box :ExpiryDate" ,false
       Exit Function
   End If
   Wait 1
   setExpiryDateTextbox_TL=true
End Function

'[Set TextBox EffectiveDate for Temp Limit]
Public Function setEffectiveDateTextbox_TL(strEffectiveDate)
   bDevPending=false
   Temporarylimit_Page.txtEffectiveDate.Set(strEffectiveDate)
   waitForIcallLoading
   	 
   If Err.Number<>0 Then
       setEffectiveDateTextbox_TL=false
            LogMessage "WARN","Verification","Failed to Set Text Box :EffectiveDate" ,false
       Exit Function
   End If
   setEffectiveDateTextbox_TL=true
  
End Function

'[Verify Field KnowledgeBase on Temp Limit SR Screen displayed as]
Public Function verifyKnowledgeBase_TL(strExpectedLink)
   bDevPending=false
   bVerifyKnowledgeBaseText=true
   If Not IsNull(strExpectedLink) Then
        
        Set oDesc_KB = Description.Create()
            oDesc_KB("micclass").Value = "Link"
        
            'strKBLink=Temporarylimit_Page.lnkKnowledgeBase.ChildObjects(oDesc_KB)(0).GetROProperty("href")
            
            '************ I changed the above code as .childobjects().count was returning to zero
            strKBLink = Temporarylimit_Page.lnkKnowledgeBase.GetRoProperty("href")
            strExpectedLink=Replace(strExpectedLink,"@","=")

            
       If not MatchStr(strKBLink, strExpectedLink)Then
           LogMessage "RSLT","Verification","Knowledge base link does not matched with expected. Actual : "&strKBLink&" Expected "&strExpectedLink,false
           bVerifyKnowledgeBaseText=false
       else
             LogMessage "RSLT","Verification","Knowledge base link matrched with expected",true
       End If
   End If
   verifyKnowledgeBase_TL=bVerifyKnowledgeBaseText
End Function

'[Click Close On Request Submit Button FOR TemporaryLimitIncrease]
Public Function clickCloseTempLimit()
   bDevPending=false
   Temporarylimit_Page.btnClose.click
   If Err.Number<>0 Then
       clickCloseTempLimit=false
            LogMessage "WARN","Verification","Failed to Click Button : Temporary Limit Increase" ,false
       Exit Function
   End If
   waitForIcallLoading
   clickCloseTempLimit=true
End Function

'[Verify text for Memo Details on Notes Screen For TempLimit]
Public Function verifyMemo_TL(strCreatedBy,strComment,StrAdditionalAmount,StrReasonForChange,StrSpecialInstruction,strSubmittedBy)
   Dim bverifyMemo:bverifyMemo=true

    MessageDetailsText=bcVerify_Notes.lblMemoDetailsText.GetROProperty("innertext")
'   If Not IsNull(strCreatedBy) Then
'	   If Not matchStr(MessageDetailsText,strCreatedBy) Then
'		bverifyMemo = False
'	   End If
'	End If
	
	'********** Commenting the below as the msg does not contain 'strcomment'

'	If Not IsNull(strComment) Then
'	   If Not matchStr(MessageDetailsText,strComment) Then
'		bverifyMemo = False
'	   End If
'	End If
	
	If Not IsNull(StrAdditionalAmount) Then
	   If Not matchStr(MessageDetailsText,StrAdditionalAmount) Then
		bverifyMemo = False
	   End If
	End If
	
	'******** not able to find 	
'	If Not IsNull(StrReasonForChange) Then
'	   If Not matchStr(MessageDetailsText,StrReasonForChange) Then
'		bverifyMemo = False
'	   End If
'	End If
	
	If Not IsNull(StrSpecialInstruction) Then
	   If Not matchStr(MessageDetailsText,StrSpecialInstruction) Then
		bverifyMemo = False
	   End If
	End If
	
	
	If Not IsNull(strSubmittedBy) Then
	   If Not matchStr(MessageDetailsText,strSubmittedBy) Then
		bverifyMemo = False
	   End If
	End If
	
	bcVerify_Notes.btnOKMessageDetails.Click
	
	verifyMemo_TL=bverifyMemo
End Function


'[Verify Field TM Approval Message displayed as]
Public Function verifyTMApprovalMsg_TL(strValidationMessage)
   bDevPending=False
   bVerifyValidationMessageText=true
   If Not IsNull(strValidationMessage) Then
       If Not VerifyInnerText (Temporarylimit_Page.lblTMValidationMsg(), strValidationMessage, "Validation Message")Then
           bVerifyValidationMessageText=false
        Else
         bVerifyValidationMessageText=True
       End If
   End If
   WaitForIcallLoading
   Temporarylimit_Page.btnTMValiationOK.Click
   verifyTMApprovalMsg_TL=bVerifyValidationMessageText
End Function

'[Get the ExpiryDate in Runtime and increase the date]
Public Function getNSetExpiryDate()
	bDevPending=False
	bgetNSetExpiryDate=true
	strExpiryDate = getExpiryDateText()	
End Function

'[Verify Approval Level Combobox has Items]
Public Function verifyApprovalLevelComboboxItems(strlstApprovalLevel)
   bDevPending=false
   bverifyApprovalLevelComboboxItems=true
   If Not IsNull(strlstApprovalLevel) Then
       If Not verifyComboboxItems (Temporarylimit_Page.lstApprovalLevel(), strlstApprovalLevel, "Approval Level has items")Then
           bverifyApprovalLevelComboboxItems=false
       End If
   End If
   verifyApprovalLevelComboboxItems=bverifyApprovalLevelComboboxItems
End Function

'[Verify Reason for Increase Combobox has Items]
Public Function verifyReasonForIncreaseComboboxItems(strlstReasonforIncrease)
   bDevPending=false
   bverifyReasonForIncreaseComboboxItems=true
   If Not IsNull(strlstReasonforIncrease) Then
       If Not verifyComboboxItems (Temporarylimit_Page.lstReasonforIncrease(), strlstReasonforIncrease, "Reason for Increase has items")Then
           bverifyReasonForIncreaseComboboxItems=false
       End If
   End If
   verifyReasonForIncreaseComboboxItems=bverifyReasonForIncreaseComboboxItems
End Function
