'*****This is auto generated code using code generator please Re-validate ****************
Dim strRunTimeSRNumber_RC:strRunTimeSRNumber_RC=""  'This Variable is used to Store SR numbers at runtime

'[Verify Tab Card Replacement displayed]
Public Function verifyTabReplacementExist()
   bDevPending=false
   verifyTabReplacementExist=verifyTabExist("Card Replacement")
End Function

'[Click Button Replace Card]
Public Function clickButtonReplaceCard()
   bDevPending=false
   bclickButtonReplaceCard=true
   CardReplacement.btnReplaceCard.click
   If Err.Number<>0 Then
       clickButtonReplaceCard=false
            LogMessage "WARN","Verification","Failed to Click Button : ReplaceCard" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickButtonReplaceCard=bclickButtonReplaceCard
End Function

'[Verify Button Replace Card Exist]
Public Function verifyButtonReplaceCard()
   bDevPending=false
   bverifyButtonReplaceCard=true
	If not (CardReplacement.btnReplaceCard.exist(0)) Then
		bverifyButtonReplaceCard=false
	End If
    verifyButtonReplaceCard=bverifyButtonReplaceCard
End Function

'[Verify button Replace Card is disabled]
Public Function verifybuttonReplaceCardDisabled()
   bDevPending=false
   Dim bverifybuttonReplaceCardDisabled:bverifybuttonReplaceCardDisabled=true
	intBtnRefreshStatus=Instr(CardReplacement.btnReplaceCard.GetROproperty("outerhtml"),"v-disabled")
	If  not intBtnRefreshStatus=0 Then
		LogMessage "RSLT","Verification","Replace Card button is disabled as per expectation.",True
		bverifybuttonReplaceCardDisabled=true
	Else
		LogMessage "WARN","Verifiation","Replace Card button is enable. Expected to be disable.",false
		bverifybuttonReplaceCardDisabled=false
	End If
	verifybuttonReplaceCardDisabled=bverifybuttonReplaceCardDisabled
End Function

'[Select Combobox Replacement Reason on Replace Card Screen as]
Public Function selectReplacementReasonComboBox(strReplacementReason)
   bDevPending=false
   bselectReplacementReasonComboBox=true
   If Not IsNull(strReplacementReason) Then
       If Not (selectItem_Combobox (CardReplacement.lstReplacementReason(), strReplacementReason))Then
            LogMessage "WARN","Verification","Failed to select :"&strReplacementReason&" From Replacement Reason drop down list" ,false
           bselectReplacementReasonComboBox=false
       End If
   End If
   selectReplacementReasonComboBox=bselectReplacementReasonComboBox
End Function

'[Verify Field Replacement Type on Replace Card Screen displayed as]
Public Function verifyReplacementTypeText(strReplacementType)
   bDevPending=false
   bVerifyReplacementTypeText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (CardReplacement.lblReplacementType(), strReplacementType, "Replacement Type")Then
           bVerifyReplacementTypeText=false
       End If
   End If
   verifyReplacementTypeText=bVerifyReplacementTypeText
End Function

'[Select Combobox New Card Type on Replace Card Screen as]
Public Function selectNewCardTypeComboBox(strNewCardType)
   bDevPending=false
   bselectNewCardTypeComboBox=true
   If Not IsNull(strNewCardType) Then
       If Not (selectItem_Combobox (CardReplacement.lstNewCardType(), strNewCardType))Then
            LogMessage "WARN","Verification","Failed to select :"&strNewCardType&" From New Card Type drop down list" ,false
           bselectNewCardTypeComboBox=false
       End If
   End If
   selectNewCardTypeComboBox=bselectNewCardTypeComboBox
End Function

'[Verify Table Selected Cards displayed on Replace Card Screen]
Public Function verifySelectedCardsTabledisplayed_RC()
   bDevPending=false
   bverifySelectedCardsTabledisplayed=true
   If not (BlockCancelCards.tblSelectedCardsHeader.Exist(1)) Then
		bverifySelectedCardsTabledisplayed=false
   End If
	verifySelectedCardsTabledisplayed_RC=bverifySelectedCardsTabledisplayed
End Function


'[Verify Field New Embossing Name on Replace Card Screen displayed as]
Public Function verifyNewEmbossingNameText(strNewEmbossingName)
   bDevPending=false
   bVerifyNewEmbossingNameText=true
   strObservedValue = CardReplacement.txtNewEmbossingName.getROProperty("value")
   If Not IsNull(strNewEmbossingName) Then
       'If Not verifyField (CardReplacement.txtNewEmbossingName(), strNewEmbossingName, "New Embossing Name")Then
       '*********** Done the changes coz have to check that emboss name is always Upper case
       	' By Manish on 28-01-2015
       If  Not (Trim(strObservedValue)) = UCase(Trim(strNewEmbossingName)) Then
       	LogMessage "WARN","Verification","Observed Emboss Name "&strObservedValue&" is not as per expected value. "&strNewEmbossingName&"" ,false
           bVerifyNewEmbossingNameText=false
       End If
   End If
   verifyNewEmbossingNameText=bVerifyNewEmbossingNameText
End Function

'[Set TextBox New Empossing Name on Card Replacement Screen to]
Public Function setNewEmbossingNameText(strNewEmbossingName)
 
   bDevPending=false
   bNewEmbossingNameText=true
   If Not IsNull(strNewEmbossingName) Then
		  CardReplacement.txtNewEmbossingName.set strNewEmbossingName
   End If
   setNewEmbossingNameText=bNewEmbossingNameText
End Function

'[Verify Text Box New Embossing Name on Replace Card Screen is enabled]
Public Function verifyNewEmbossingNameEnabled(bEnabled)
   bDevPending=False
   bVerifyNewEmbossingName=true
   strClassProp=CardReplacement.lblCardReplacementLayout.getroproperty("class")
	intEnabled=Instr(strClassProp,("disabled-area"))
	If bEnabled Then
		If  intEnabled=0 Then
		'If  CardReplacement.txtNewEmbossingName.Exist Then
			LogMessage "RSLT","Verification","Textbox New Embossing Name is enable as per expectation.",True
			bVerifyNewEmbossingName=true
		Else
			LogMessage "WARN","Verifiation","Textbox New Embossing Name is disable. Expected to be enable.",false
			bVerifyNewEmbossingName=false
		End If
	else
		If  not intEnabled=0 Then
			LogMessage "RSLT","Verification","Textbox New Embossing Name is disabled as per expectation.",True
			bVerifyNewEmbossingName=true
		Else
			LogMessage "WARN","Verifiation","Textbox New Embossing Name is Enabled. Expected to be disabled.",false
			bVerifyNewEmbossingName=false
		End If
	End If
    verifyNewEmbossingNameEnabled=bVerifyNewEmbossingName
End Function
'[Verify Field New Expiry Date on Replace Card Screen displayed as]
Public Function verifyNewExpiryDateText(strNewExpiryDate)
   bDevPending=false
   bVerifyNewExpiryDateText=true
   If Not IsNull(strNewExpiryDate) Then
       If Not VerifyInnerText (CardReplacement.lblNewExpiryDate(), strNewExpiryDate, "New Expiry Date")Then
           bVerifyNewExpiryDateText=false
       End If
   End If
   verifyNewExpiryDateText=bVerifyNewExpiryDateText
End Function

'[Verify Combobox Urgency displayed default value on Replace Card Screen as]
Public Function verifyUrgencyText(strUrgency)
   bDevPending=false
   bVerifyUrgencyText=true
   If Not IsNull(strUrgency) Then
       If Not verifyComboSelectItem (CardReplacement.lstUrgency(), strUrgency, "Urgency")Then
           bVerifyUrgencyText=false
       End If
   End If
   verifyUrgencyText=bVerifyUrgencyText
End Function

'[Verify Combobox Urgency on Replace Card Screen has items]
Public Function verifyUrgency_ItemList(lstItems)
   bDevPending=false
   bVerifyUrgencyText=true
   If Not IsNull(lstItems) Then
	
       If Not verifyComboboxItems (CardReplacement.lstUrgency, lstItems, "Urgency")Then
           bVerifyUrgencyText=false
       End If
   End If
   verifyUrgency_ItemList=bVerifyUrgencyText
End Function

'[Select Combobox Urgency on Replace Card Screen as]
Public Function selectUrgencyComboBox(strUrgency_Select)
   'bDevPending=false
   bSelectUrgencyComboBox=true
   If Not IsNull(strUrgency_Select) Then
       If Not (selectItem_Combobox (CardReplacement.lstUrgency(), strUrgency_Select))Then
            LogMessage "WARN","Verification","Failed to select :"&strControlName&" From Urgency drop down list" ,false
           bSelectUrgencyComboBox=false
       End If
   End If
   selectUrgencyComboBox=bSelectUrgencyComboBox
End Function

'[Verify Field Redirection Address on Replace Card Screen displayed as]
Public Function verifyRedirectionAddressText(strRedirectionAddress)
   bDevPending=false
   bVerifyRedirectionAddressText=true
   If Not IsNull(strRedirectionAddress) Then
       If Not VerifyInnerText (CardReplacement.lblRedirectionAddress(), strRedirectionAddress, "Redirection Address")Then
           bVerifyRedirectionAddressText=false
       End If
   End If
   verifyRedirectionAddressText=bVerifyRedirectionAddressText
End Function

'[Select Radio Button of Redirection Required on Replace Card Screen]
Public Function selectRedirectionRequiredRadio(strRedirectionRequired)
	bDevPending=false
	bselectRedirectionRequiredRadio=true
	bselectRedirectionRequiredRadio=SelectRadioButtonGrp(strRedirectionRequired, CardReplacement.rbtnRedirectionRequired, Array("Yes","No"))
	If not IsNull (strRedirectionRequired) Then
		Select Case strRedirectionRequired
			Case "Yes"
                'strPostalCode=CardReplacement.txtPostalCode.GetROProperty("Outerhtml")
                strPostalCode=CardReplacement.txtPostalCode.Object.GetAttribute("disabled")
                If not inStr(strPostalCode,"disabled") = 0 Then
					 LogMessage "WARN","Verification","Postal Code is not enable as expected",false
					 bselectRedirectionRequiredRadio=false
				 End If
			Case "No"
            	'strPostalCode=CardReplacement.txtPostalCode.GetROProperty("Outerhtml")
            	strPostalCode=CardReplacement.txtPostalCode.Object.GetAttribute("disabled")
				 If inStr(strPostalCode,"disabled") = 0 Then
					 LogMessage "WARN","Verification","Postal Code is not disable as expected",false
					 bselectRedirectionRequiredRadio=false
				 End If
		End Select
	End If
	If Err.Number<>0 Then
	   bselectRedirectionRequiredRadio=false
		  LogMessage "WARN","Verification","Failed to Click Button : Redirection Required" ,false
	   Exit Function
   End If
   selectRedirectionRequiredRadio=bselectRedirectionRequiredRadio
End Function

'**********************1601 added new radio button***********************
'[Select Radio Button of Customer agree to reveal contact number on Replace Card Screen]
Public Function selectCustomerAgreeRevealConctNumber(strCustomerAgree)
	bDevPending=false
	bselectCustomerAgreeRevealConctNumber=true	
	If Not IsNull (strCustomerAgree) Then
		bselectCustomerAgreeRevealConctNumber = SelectRadioButtonGrp(strCustomerAgree, CardReplacement.rbtnCustomerAgreeRevealConctNo, Array("Yes","No"))
		WaitForICallLoading
		Select Case strCustomerAgree
			Case "Yes"
                'strPostalCode=CardReplacement.txtPostalCode.GetROProperty("Outerhtml")
                strContactNumber=CardReplacement.txtContactNumber.Object.GetAttribute("disabled")
                'strcompare=inStr(strContactNumber,"disabled") 
              
                'Print "Value is "&strcompare
                If inStr(strContactNumber,"disabled") = 0 Then
                'If not Ucase(Trim(strContactNumber))="" Then
					 LogMessage "RSLT","Verification","Contact Number is enabled as expected",true
					 bselectCustomerAgreeRevealConctNumber=true
				Else
					LogMessage "WARN","Verification","Contact Number is not enabled",false
					bselectCustomerAgreeRevealConctNumber=false						
				 End If
			Case "No"
            	'strPostalCode=CardReplacement.txtPostalCode.GetROProperty("Outerhtml")
            	strContactNumber=CardReplacement.txtContactNumber.Object.GetAttribute("disabled")
				 If inStr(strContactNumber,"disabled") = 0 Then
					 LogMessage "WARN","Verification","Contact Number is not disabled",false
					 bselectCustomerAgreeRevealConctNumber=false
				Else
					LogMessage "RSLT","Verification","Contact Number is disabled as expected",true
					bselectCustomerAgreeRevealConctNumber=true					
					 
				 End If
		End Select
	End If
	If Err.Number<>0 Then
	   bselectCustomerAgreeRevealConctNumber=false
		  LogMessage "WARN","Verification","Failed to Click Button : CustomerAgreeRevealConctNumber" ,false
	   Exit Function
   End If
   selectCustomerAgreeRevealConctNumber=bselectCustomerAgreeRevealConctNumber
End Function

'[Select Radio Button Customer agree to reveal contact number on Replace Card Screen as]
'Public Function selectCustomerAgreeRevealRadio(strCustomerAgree)
'	bDevPending=true
'	bselectCustomerAgreeRevealRadio=true
'	bselectCustomerAgreeRevealRadio=SelectRadioButtonGrp(strCustomerAgree, CardReplacement.rbtnCustomerAgreeRevealConctNo, Array("Yes","No"))
 '   If Err.Number<>0 Then
 '      bselectCustomerAgreeRevealRadio=false
 '         LogMessage "WARN","Verification","Failed to Click Radio Button :Customer Agree Reveal" ,false
 '      Exit Function
 '  End If
 '  selectCustomerAgreeRevealRadio=bselectCustomerAgreeRevealRadio
'End Function
'****************************************************************************************************************


'[Select Radio Button of Waive Replacement Fee on Replace Card Screen]
Public Function selectWaiveReplacementFeeRadio(strWaiveReplacementFee)
	bDevPending=true
	bselectWaiveReplacementFeeRadio=true
	bselectWaiveReplacementFeeRadio=SelectRadioButtonGrp(strWaiveReplacementFee, CardReplacement.rbtnWaiveReplacementFee, Array("Yes","No"))
   
	If Err.Number<>0 Then
       bselectWaiveReplacementFeeRadio=false
          LogMessage "WARN","Verification","Failed to Click Button : Waive Replacement Fee" ,false
       Exit Function
   End If
   selectWaiveReplacementFeeRadio=bselectWaiveReplacementFeeRadio
End Function

'[Select Radio Button Charge for Urgent Mailing on Replace Card Screen]
Public Function selectUrgentMailingRadio(strUrgentMailing)
	bDevPending=true
	bselectUrgentMailingRadio=true
	bselectUrgentMailingRadio=SelectRadioButtonGrp(strUrgentMailing, CardReplacement.rbtnChargeforUrgentMailing, Array("Yes","No"))
    If Err.Number<>0 Then
       bselectUrgentMailingRadio=false
          LogMessage "WARN","Verification","Failed to Click Button : Charge for Urgent Mailing" ,false
       Exit Function
   End If
   selectUrgentMailingRadio=bselectUrgentMailingRadio
End Function
'[Select Radio Button New PIN on Replace Card Screen as]
Public Function selectNewPinRadio(strNewPinRequired)
	bDevPending=true
	bSelectNewPinRadio=true
	bSelectNewPinRadio=SelectRadioButtonGrp(strNewPinRequired, CardReplacement.rbtnNewPin, Array("Yes","No"))
    If Err.Number<>0 Then
       bSelectNewPinRadio=false
          LogMessage "WARN","Verification","Failed to Click Radio Button : Urgent Mailing" ,false
       Exit Function
   End If
   selectNewPinRadio=bSelectNewPinRadio
End Function

'[Verify Radio Button New Pin Radio on Replace Card Screen Selected as]
Public Function verifyDefaultNewPinRadioSelection(strSelectedradioButton)
	bDevPending=False
	bSelectNewPinRadio=true
	bSelectNewPinRadio=VerifyRadioButtonGrpSelection(strSelectedradioButton, CardReplacement.rbtnNewPin, Array("Yes","No"))
	If bSelectNewPinRadio Then
		          LogMessage "RSLT","Verification","Radio Button :New Pin selected as ecxpected. Selected value is "&strSelectedradioButton ,true
		else
				LogMessage "RSLT","Verification","Radio Button :New Pin is not selected as ecxpected. Selected value is "&strSelectedradioButton ,false
	End If
    If Err.Number<>0 Then
       bSelectNewPinRadio=false
          LogMessage "WARN","Verification","Failed to Verify Radio Button :New Pin" ,false
       Exit Function
   End If
   verifyDefaultNewPinRadioSelection=bSelectNewPinRadio
End Function

'[Select Radio Button Redirection Required on Replace Card Screen as]
Public Function selectRedirectionRadio(strRedirectionRequired)
	bDevPending=true
	bSelectRedirectionRequiredRadio=true
	bSelectRedirectionRequiredRadio=SelectRadioButtonGrp(strRedirectionRequired, CardReplacement.rbtnRedirectionRequired, Array("Yes","No"))
    If Err.Number<>0 Then
       bSelectRedirectionRequiredRadio=false
          LogMessage "WARN","Verification","Failed to Click Radio Button :Redirection Required" ,false
       Exit Function
   End If
   selectRedirectionRadio=bSelectRedirectionRequiredRadio
End Function

'[Verify Radio Button Redirection Required on Replace Card Screen Selected as]
Public Function verifyRedirectionSelection(strSelectedradioButton)
	bDevPending=False
	bSelectRedirectRadio=true
	bSelectRedirectRadio=VerifyRadioButtonGrpSelection(strSelectedradioButton, CardReplacement.rbtnRedirectionRequired, Array("Yes","No"))
	If bSelectRedirectRadio Then
			  LogMessage "RSLT","Verification","Radio Button Redirection Required selected as ecxpected. Selected value is "&strSelectedradioButton ,true
	else
			LogMessage "RSLT","Verification","Radio Button :Redirection Required is not selected as ecxpected. Selected value is "&strSelectedradioButton ,false
			bSelectRedirectRadio=false
	End If
	If Err.Number<>0 Then
       bSelectRedirectRadio=false
          LogMessage "WARN","Verification","Failed to Verify Radio Button Redirection Required" ,false
       Exit Function
   End If
   verifyRedirectionSelection=bSelectRedirectRadio
End Function

'[Select Combobox Reason for Urgency on Replace Card Screen as]
Public Function selectReasonforUrgencyComboBox(strReasonforUrgency)
   bDevPending=false
   bselectReasonforUrgencyComboBox=true
   If Not IsNull(strReasonforUrgency) Then
       If Not (selectItem_Combobox (CardReplacement.lstReasonforUrgency(), strReasonforUrgency))Then
            LogMessage "WARN","Verification","Failed to select :"&strReasonforUrgency&" From Reason for Urgency drop down list" ,false
           bselectReasonforUrgencyComboBox=false
       End If
   End If
   selectReasonforUrgencyComboBox=bselectReasonforUrgencyComboBox
End Function
'
'[Verify Combobox Urgency on Replace Card Screen as]
Public Function selectReasonforUrgencyComboBox(strReasonforUrgency)
   bDevPending=false
   bselectReasonforUrgencyComboBox=true
   If Not IsNull(strReasonforUrgency) Then
       If Not (selectItem_Combobox (CardReplacement.lstUrgency(), strReasonforUrgency))Then
            LogMessage "WARN","Verification","Failed to select :"&strReasonforUrgency&" From Reason for Urgency drop down list" ,false
           bselectReasonforUrgencyComboBox=false
       End If
   End If
   selectReasonforUrgencyComboBox=bselectReasonforUrgencyComboBox
End Function

'[Verify If Combobox Reason for Special Mailing is enabled on Replace Card Screen]
Public Function VerifyReasonSpecialMailing_enabled(bEnabled)
	bDevPending=False
   Dim bVerifySplMailing:bVerifySplMailing=true
	intBtnLookUp=Instr(CardReplacement.lstReasonforSpecialMailing.GetROproperty("outerhtml"),"v-disabled")

	If bEnabled Then
		If  intBtnLookUp=0 Then
			LogMessage "RSLT","Verification","Combobox Reason for Special Mailing is enable as per expectation.",True
			bVerifySplMailing=true
		Else
			LogMessage "WARN","Verifiation","Combobox Reason for Special Mailing is disable. Expected to be enable.",false
			bVerifySplMailing=false
		End If
	else
		If  intBtnLookUp<>0 Then
			LogMessage "RSLT","Verification","Combobox Reason for Special Mailing is disabled as per expectation.",True
			bVerifySplMailing=true
		Else
			LogMessage "WARN","Verifiation","Combobox Reason for Special Mailing is Enabled. Expected to be disabled.",false
			bVerifySplMailing=false
		End If
	End If
    
	VerifyReasonSpecialMailing_enabled=bVerifySplMailing
End Function

'[Select Combobox Reason for Special Mailing on Replace Card Screen as]
Public Function selectReasonforSpecialMailingComboBox(strReasonforSpecialMailing)
   bDevPending=false
   bSelectReasonforSpecialMailingComboBox=true
   If Not IsNull(strReasonforSpecialMailing) Then
       If Not (selectItem_Combobox (CardReplacement.lstReasonforSpecialMailing(), strReasonforSpecialMailing))Then
            LogMessage "WARN","Verification","Failed to select :"&strControlName&" From ReasonforSpecialMailing drop down list" ,false
           bSelectReasonforSpecialMailingComboBox=false
       End If
   End If
   selectReasonforSpecialMailingComboBox=bSelectReasonforSpecialMailingComboBox
End Function

'[Verify Combobox Reason for Special Mailing on Replace Card Screen displayed as]
Public Function verifyReasonforSpecialMailingText(strReasonforSpecialMailing)
   bDevPending=false
   bVerifyReasonforSpecialMailingText=true
   If Not IsNull(strReasonforSpecialMailing) Then
       If Not verifyComboSelectItem (CardReplacement.lstReasonforSpecialMailing(), strReasonforSpecialMailing, "Reason for Special Mailing")Then
           bVerifyReasonforSpecialMailingText=false
       End If
   End If
   verifyReasonforSpecialMailingText=bVerifyReasonforSpecialMailingText
End Function

'[Verify Field Description on Replace Card Screen displayed as]
Public Function verifyDescriptionText_RC(strDescription)
   bDevPending=false
   bVerifyDescriptionText=true
   If Not IsNull(strDescription) Then
       If Not VerifyInnerText (CardReplacement.lblDescription(), strDescription, "Description")Then
           bVerifyDescriptionText=false
       End If
   End If
   verifyDescriptionText_RC=bVerifyDescriptionText
End Function

'[Verify Knowledge base link is enabled on Replace Card Screen]
Public Function VerifyKnowledgebaselinkEnabled_RC()
      bDevPending=false
   Dim bVerifyKnowledgebaselink:bVerifyKnowledgebaselink=true
     strKBLink=CardReplacement.lnkKnowledgeBase.GetROProperty("Outerhtml")
	
    If inStr(strKBLink,"v-disabled") = 0Then
		LogMessage "RSLT","Verification","Knowledge base Link  enabled successfully as expected",true
	else
		LogMessage "WARN","Verification","Knowledge base Link  does not enabledas expected",false
		bVerifyKnowledgebaselink=false
	End If
	VerifyKnowledgebaselinkEnabled_RC=bVerifyKnowledgebaselink
End Function

'[Verify Field KnowledgeBase on Replace Card SR Screen displayed as]
Public Function verifyKnowledgeBase_Replace(strExpectedLink)
   bDevPending=false
   bVerifyKnowledgeBaseText=true
   If Not IsNull(strExpectedLink) Then
		
		'Set oDesc_KB = Description.Create()
		'	oDesc_KB("micclass").Value = "Link"		
		'	strKBLink=CardReplacement.lnkKnowledgeBase.ChildObjects(oDesc_KB)(0).GetROProperty("href")
			strKBLink=CardReplacement.lnkKnowledgeBase.GetROProperty("href")
			strExpectedLink=Replace(strExpectedLink,"@","=")
			intKnowledgeLink=InStr(strKBLink, strExpectedLink)
       If intKnowledgeLink=0 Then
		   LogMessage "RSLT","Verification","Knowledge base link does not matched with expected. Actual : "&strKBLink&" Expected "&strExpectedLink,false
           bVerifyKnowledgeBaseText=false
	   else
	 		LogMessage "RSLT","Verification","Knowledge base link matrched with expected",true
       End If
   End If
   verifyKnowledgeBase_Replace=bVerifyKnowledgeBaseText
End Function

'[Click Button AddNotes on Replace Card Screen]
Public Function clickButtonAddNotes_RC()
   bDevPending=false
   CardReplacement.btnAddNotes.click
   If Err.Number<>0 Then
       clickButtonAddNotes=false
            LogMessage "WARN","Verification","Failed to Click Button : AddNotes" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickButtonAddNotes=true
End Function

'[Perform Add Notes by clicking Add Notes Button on Replace Card Screen]
Public Function addNote_RC(strNote)
   bDevPending=false
   bVerifypopupNotes=true
	Dim bVerifypopupNotes:VerifypopupNotes=true
	
	If not isNull(strNote) Then
		CardReplacement.btnAddNotes.click
		WaitForICallLoading
            If not   CardReplacement.popupValidationMessage.exist(5)Then
				LogMessage "WARN","Verification","New Note dialog did not displayed",false
				bVerifypopupNotes=false
			 else
			 strMessage=CardReplacement.lblMaxAllowed.GetROProperty("innerText")
				If not strMessage="Max allowed - 3000" Then
					LogMessage "WARN","Verification","Add New Comment popup dialog incorrectly displayed max allowed character count for comment. Expected : Max allowed - 3000 and Actual: "&strMessage,false
					bVerifypopupNotes=false
				End If
			   CardReplacement.txtComment_Notes.set strNote
			  
				CardReplacement.btnOK_ValidationMsg.Click
			  WaitForIcallLoading
		   End If 
		End If 
	addNote_RC=bVerifypopupNotes
End Function

'[Verify Button Add Notes is enabled on Replace Card Screen]
Public Function VerifybtnAddNoteEnabled_RC()
	bDevPending=False
   Dim bVerifyAddNote:bVerifyAddNote=true
	intBtnNote=Instr(CardReplacement.btnAddNotes.GetROproperty("outerhtml"),"v-disabled")
	If  intBtnNote=0 Then
		LogMessage "RSLT","Verification","Note button is enable as per expectation.",True
		bVerifyAddNote=true
	Else
		LogMessage "WARN","Verifiation","Note button is disable. Expected to be enable.",false
		bVerifyAddNote=false
	End If
	VerifybtnAddNoteEnabled_RC=bVerifyAddNote
End Function

'[Verify Button Add Notes is disabled on Replace Card Screen]
Public Function VerifybtnAddNoteDisabled_RC()
	bDevPending=False
   Dim bVerifyAddNote:bVerifyAddNote=true
	intBtnNote=Instr(CardReplacement.btnAddNotes.GetROproperty("outerhtml"),"v-disabled")
	If not intBtnNote=0 Then
		LogMessage "RSLT","Verification","Note button is disabled as per expectation.",True
		bVerifyAddNote=true
	Else
		LogMessage "WARN","Verifiation","Note button is enable. Expected to be disabale.",false
		bVerifyAddNote=false
	End If
	VerifybtnAddNoteDisabled_RC=bVerifyAddNote
End Function

'[Click Link Notes on Replace Card Screen]
Public Function clickLinkNotes_RC()
   bDevPending=false
   CardReplacement.lnkNotes.click
   If Err.Number<>0 Then
       clickLinkNotes=false
            LogMessage "WARN","Verification","Failed to Click Link : Notes" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickLinkNotes=true
End Function

'[Verify Field Comment on Replace Card Screen displayed as]
Public Function verifyCommentText_RC(strComment)
   bDevPending=false
   bVerifyCommentText=true
   If Not IsNull(strComment) Then
       If Not VerifyField( CardReplacement.txtComment(), strComment, "Comment")Then
           bVerifyCommentText=false
       End If
   End If
   verifyCommentText=bVerifyCommentText
End Function

'[Set TextBox Comment to on Replace Card Screen]
Public Function setCommentTextbox_RC(strComment)
   bDevPending=False
   strTimeStamp = ""&now
	strComment =strComment &" "&strTimeStamp
	gstrRuntimeCommentStep="Set TextBox Comment to on Replace Card Screen"
	insertDataStore "SRComment", strComment
	
   CardReplacement.txtComment.Set(strComment )
   If Err.Number<>0 Then
       setCommentTextbox_RC=false
            LogMessage "WARN","Verification","Failed to Set Text Box :Comment" ,false
       Exit Function
   End If
   setCommentTextbox_RC=true
End Function


'[Click Button Submit on Replace Card Screen]
Public Function clickButtonSubmit_RC()
   bDevPending=false
   CardReplacement.btnSubmit.click
   If Err.Number<>0 Then
       clickButtonSubmit=false
            LogMessage "WARN","Verification","Failed to Click Button : Submit" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickButtonSubmit_RC=true
End Function

'[Verify Button Submit is enabled on Replace Card Screen]
Public Function VerifybtnSubmit_RC()
	bDevPending=False
   Dim bVerifybtnSubmit:bVerifybtnSubmit=true
	CardReplacement.tblSelectedCardsHeader.Click
	intBtnSubmit=Instr(CardReplacement.btnSubmit.Object.GetAttribute("disabled"),("disabled"))
	If  intBtnSubmit=0 Then
		LogMessage "RSLT","Verification","Submit button is enable as per expectation.",True
		bVerifybtnSubmit=true
	Else
		LogMessage "WARN","Verifiation","Submit button is disable. Expected to be enable.",false
		bVerifybtnSubmit=false
	End If
	VerifybtnSubmit_RC=bVerifybtnSubmit
End Function

'[Verify Button Submit is disabled on Replace Card Screen]
Public Function VerifybtnSubmitDisabled_RC()
	bDevPending=False
   Dim bVerifybtnSubmit:bVerifybtnSubmit=true
	intBtnSubmit=Instr(CardReplacement.btnSubmit.Object.GetAttribute("disabled"),("disabled"))
	If  not intBtnSubmit=0 Then
		LogMessage "RSLT","Verification","Submit button is disable as expected.",True
		bVerifybtnSubmit=true
	Else
		LogMessage "WARN","Verifiation","Submit button is enable. Expected to be disable.",false
		bVerifybtnSubmit=false
	End If
	VerifybtnSubmitDisabled_RC=bVerifybtnSubmit
End Function

'[Verify Button Submit if is enabled on Replace Card Screen]
Public Function VerifybtnSubmit_ReplaceCard()
	bVerifybtnSubmit_ReplaceCard = true
	
	obj_enabled = CardReplacement.btnSubmit.GetROProperty("disabled")
	
	If obj_enabled = 0 Then
		LogMessage "RSLT","Verification","Submit button is enable as per expectation.",True
	else
		LogMessage "RSLT","Verifiation","Submit button is disable. Expected to be enable.",false
		VerifybtnSubmit_ReplaceCard = false
	End If
	VerifybtnSubmit_ReplaceCard = bVerifybtnSubmit_ReplaceCard
End Function
'Public Function VerifybtnSubmit_ReplaceCard(bEnabled)
'	bDevPending=false
'   Dim bVerifyButtonSubmit:bVerifyButtonSubmit=true
'	'intBtnSubmit=Instr(CardReplacement.btnSubmit.Object.GetAttribute("disabled"),("disabled"))
'	intBtnSubmit=Instr(CardReplacement.btnSubmit.GetROProperty("disabled"))
'	If bEnabled Then
'		If  intBtnSubmit=0 Then
'			LogMessage "RSLT","Verification","Submit button is enable as per expectation.",True
'			bVerifyButtonSubmit=true
'		Else
'			LogMessage "WARN","Verifiation","Submit button is disable. Expected to be enable.",false
'			bVerifyButtonSubmit=false
'		End If
'	else
'		If  intBtnSubmit<>0 Then
'			LogMessage "RSLT","Verification","Submit button is disabled as per expectation.",True
'			bVerifyButtonSubmit=true
'		Else
'			LogMessage "WARN","Verifiation","Submit button is Enabled. Expected to be disabled.",false
'			bVerifyButtonSubmit=false
'		End If
'	End If
'    VerifybtnSubmit_ReplaceCard=bVerifyButtonSubmit
'End Function


'[Verify Button Cancel is enabled on Replace Card Screen]
Public Function VerifybtnCancel_RC()
	bDevPending=False
   Dim bVerifybtnCancel_RC:bVerifybtnCancel_RC=true
	intBtnCancel=Instr(CardReplacement.btnCancel.GetROproperty("outerhtml"),("v-disabled"))
	If  intBtnCancel=0 Then
		LogMessage "RSLT","Verification","Cancel button is enable as per expectation.",True
		bVerifybtnCancel_RC=true
	Else
		LogMessage "WARN","Verifiation","Cancel button is disable. Expected to be enable.",false
		bVerifybtnCancel_RC=false
	End If
	VerifybtnCancel_RC=bVerifybtnCancel_RC
End Function

'[Click Button Cancel on Replace Card Screen]
Public Function clickButtonCancel_RC()
   bDevPending=false
   CardReplacement.btnCancel.click
   If Err.Number<>0 Then
       clickButtonCancel=false
            LogMessage "WARN","Verification","Failed to Click Button : Cancel" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickButtonCancel_RC=true
End Function

'[Verify Verification failed Error Message on Replace Card Screen]
Public Function verifyVerificationErrorMessage_RC(strValidationMessage)
	bverifyVerificationErrorMessage_RC=true
	If not VerifyInnerText(CardReplacement.lblValidationMessage(),strValidationMessage,"Verification Required") Then
		bverifyVerificationErrorMessage_RC=false
	End If
	 CardReplacement.btnOK_ValidationPopup.click
   If Err.Number<>0 Then
       bverifyVerificationErrorMessage_RC=false
            LogMessage "WARN","Verification","Failed to Click OK : Verification Required" ,false
       Exit Function
   End If
   WaitForICallLoading
	verifyVerificationErrorMessage_RC=bverifyVerificationErrorMessage_RC
End Function

'[Verify Error Message for Postal Code on Replace Card Screen]
Public Function verifyErrorPostalCode_RC(strPostalCodeError)
	bverifyErrorPostalCode_RC=true
	If not VerifyInnerText(CardReplacement.lblValidationMessage(),strPostalCodeError,"Verification Required") Then
		bverifyErrorPostalCode_RC=false
	End If
	 CardReplacement.btnOK_VerificationFailed.click
   If Err.Number<>0 Then
       bverifyErrorPostalCode_RC=false
            LogMessage "WARN","Verification","Failed to Click OK : Verification Required" ,false
       Exit Function
   End If
   WaitForICallLoading
	verifyErrorPostalCode_RC=bverifyErrorPostalCode_RC
End Function

'[Verify Field Replacement Option on Replace Card Screen displayed as]
Public Function verifyReplacementOption(strReplacementOption)
	bverifyReplacementOption=true
	WaitForICallLoading
	If not isNull(strReplacementOption) Then
		WaitForICallLoading
		If not VerifyInnerText(CardReplacement.lblReplacementOption(), strReplacementOption,"Replacement Option") Then
			bverifyReplacementOption=false
		End If
	End If
	verifyReplacementOption=bverifyReplacementOption
End Function


'[Verify Popup ValidationMessage exist for Card Replacement]
Public Function verifyPopupValidationMessage_Replacement(bExist)
   bDevPending=False
   bActualExist=CardReplacement.popupValidationMessage.Exist(1)
   If bExist And  bActualExist  Then
       LogMessage "RSLT","Verification","Popup :ValidationMessage Exists As Expected" ,true
       verifyPopupValidationMessage_Replacement=True
   ElseIf not bExist And  not bActualExist  Then
       LogMessage "RSLT","Verification","Popup :ValidationMessage does not Exists As Expected" ,true
       verifyPopupValidationMessage_Replacement=True
   ElseIf bExist And  not bActualExist  Then
       LogMessage "WARN","Verification","Popup :ValidationMessage does not Exists As Expected" ,False
       verifyPopupValidationMessage_Replacement=False
   ElseIf not bExist And   bActualExist  Then
       LogMessage "WARN","Verification","Popup :ValidationMessage Still Exists" ,False
       verifyPopupValidationMessage_Replacement=False
   End If
End Function

'[Click Button OK_ValidationPopup For Card Replacement]
Public Function clickButtonOK_ValidationPopup_Replacement()
   bDevPending=False
   CardReplacement.btnOK_ValidationPopup.click
   If Err.Number<>0 Then
       clickButtonOK_ValidationPopup_Replacement=false
            LogMessage "WARN","Verification","Failed to Click Button : OK_ValidationPopup" ,false
       Exit Function
   End If
   clickButtonOK_ValidationPopup_Replacement=true
End Function

'[Verify Field ValidationMessage For Card Replacement displayed as]
Public Function verifyValidationMessageReplacement(strExpectedText)
   bDevPending=False
   bVerifyValidationMessageText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (CardReplacement.lblValidationMessage(), strExpectedText, "ValidationMessage")Then
           bVerifyValidationMessageText=false
       End If
   End If
   verifyValidationMessageReplacement=bVerifyValidationMessageText
End Function

'[Verify row Data in Table Selected Cards on Replace Card Screen]
Public Function verifytblSelectedCards_RC(lstlstSelectedCards)
   bDevPending=false   
   verifytblSelectedCards_RC=verifyTableContentList(CardReplacement.tblSelectedCardsHeader,CardReplacement.tblSelectedCardsContent,lstlstSelectedCards,"Selected Cards" , false,null ,null,null)
End Function


'[Verify Combobox New Card Type displayed default value on Replace Card Screen as]
Public Function verifyNewCardTypeText(strNewCardType)
    bDevPending=false
   bNewCardType=true
   If Not IsNull(strNewCardType) Then
       If Not verifyComboSelectItem (CardReplacement.lstNewCardType(), strNewCardType, "New Card Type")Then
           bNewCardType=false
       End If
   End If
   verifyNewCardTypeText=bNewCardType
End Function

'[Verify Radio Button Waive Replacement Fee Radio on Replace Card Screen is enable or disable]
Public Function VerifyWaiveReplacementFeeRadio(strStatus)
	bDevPending=False
	bWaiveReplacementFeeRadio=true
	Wait 1
	If VerifyObjectEnable(CardReplacement.rbtnWaiveReplacementFee, strStatus) Then
		 LogMessage "WARN","Verification","The Radio Button Charge for Waive Replacement Fee  is with expected status"&strStatus, true
		else
		bWaiveReplacementFeeRadio =  false
         LogMessage "WARN","Verification","The Radio Button Charge for Waive Replacement Fee  is not with expected status"&strStatus, false
	End If
	VerifyWaiveReplacementFeeRadio = bWaiveReplacementFeeRadio
End Function

'[Verify Radio Button Waive Replacement Fee Radio on Replace Card Screen Selected as]
Public Function verifyDefaultWaiveReplacementFeeSelection(strSelectedradioButton)
	bDevPending=False
	bSelectWaiveReplacementFeeRadio=true
	bSelectWaiveReplacementFeeRadio=VerifyRadioButtonGrpSelection(strSelectedradioButton, CardReplacement.rbtnWaiveReplacementFee, Array("Yes","No"))
	If bSelectWaiveReplacementFeeRadio Then
		LogMessage "RSLT","Verification","Radio Button Waive Replacement Fee selected as expected. Selected value is "&strSelectedradioButton ,true
	else
		LogMessage "RSLT","Verification","Radio ButtonWaive Replacement Fee is not selected as expected. Selected value is "&strSelectedradioButton ,false
	End If
    If Err.Number<>0 Then
       bSelectWaiveReplacementFeeRadio=false
          LogMessage "WARN","Verification","Failed to Verify Radio Button :Waive Replacement Fee" ,false
       Exit Function
   End If
   verifyDefaultWaiveReplacementFeeSelection=bSelectWaiveReplacementFeeRadio
End Function

'[Verify Radio Button Charge for Urgent Mailing Radio on Replace Card Screen is enable or disable]
Public Function VerifyChargeforUrgentMailingRadio(strStatus)
	bDevPending=False
	bChargeforUrgentMailingRadio=true
	Wait 1
	If VerifyObjectEnable(CardReplacement.rbtnChargeforUrgentMailing, strStatus) Then
		LogMessage "WARN","Verification","The Radio Button Charge for Urgent Mailing  is with expected status"&strStatus, true
	else
		bChargeforUrgentMailingRadio =  false
    	LogMessage "WARN","Verification","The Radio Button Charge for Urgent Mailing  is not with expected status"&strStatus, false
	End If
	VerifyChargeforUrgentMailingRadio = bChargeforUrgentMailingRadio
End Function

'[Verify Radio Button Charge for Urgent Mailing Radio on Replace Card Screen Selected as]
Public Function verifyDefaultChargeforUrgentMailingSelection(strSelectedradioButton)
	bDevPending=False
	bSelectChargeforUrgentMailing=true
	bSelectChargeforUrgentMailing=VerifyRadioButtonGrpSelection(strSelectedradioButton, CardReplacement.rbtnChargeforUrgentMailing, Array("Yes","No"))
	If bSelectChargeforUrgentMailing Then
		          LogMessage "RSLT","Verification","Radio Button Charge for Urgent Mailing selected as ecxpected. Selected value is "&strSelectedradioButton ,true
		else
				LogMessage "WARN","Verification","Radio ButtonCharge for Urgent Mailing is not selected as ecxpected. Selected value is "&strSelectedradioButton ,false
				bSelectChargeforUrgentMailing=false
	End If
    If Err.Number<>0 Then
       bSelectChargeforUrgentMailing=false
          LogMessage "WARN","Verification","Failed to Verify Radio Button :Charge for Urgent Mailing" ,false
       Exit Function
   End If
   verifyDefaultChargeforUrgentMailingSelection=bSelectChargeforUrgentMailing
End Function



'[Verify Combobox Reason for Special Mailing on Replace Card Screen is enable or disable]
Public Function VerifySpecialMailingCombo(strStatus)
   bDevPending=False
	bSpecialMailingCombo =  true
	Wait 1
	If VerifyObjectEnable(CardReplacement.lstReasonforSpecialMailing, strStatus) Then
		LogMessage "WARN","Verification","The Special mailing Combobox is with expected status"&strStatus, true
	else
		bSpecialMailingCombo =  false
    	LogMessage "WARN","Verification","The Special mailing Combobox is not with expected status"&strStatus, false
	End If
	VerifySpecialMailingCombo = bSpecialMailingCombo
End Function


'[Click Button No for Card Replacement Confirmation Popup]
Public Function clickPopup_No()
   bDevPending=false
   CardReplacement.btnNo_Confirmation.click
   If Err.Number<>0 Then
       clickButtonPopup_No=false
            LogMessage "WARN","Verification","Failed to Click Button : No" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickButtonPopup_No=true
End Function

'[Click Button Yes for Card Replacement Confirmation Popup]
Public Function clickPopup_Yes()
   bDevPending=false
   CardReplacement.btnYes_Confirmation.click
   If Err.Number<>0 Then
       clickButtonPopup_Yes=false
            LogMessage "WARN","Verification","Failed to Click Button : Yes" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickButtonPopup_Yes=true
End Function

'[Set TextBox Postal Code to]
Public Function setPostalCode_RC(strPostalCode)
   If Not IsNull (strPostalCode) Then
	   CardReplacement.txtPostalCode.click
	   CardReplacement.txtPostalCode.set(strPostalCode)
   End If
   If Err.Number<>0 Then
	   setPostalCode_RC=false
	   LogMessage "WARN","Verification","Failed to Set Text Box :Postal Code" ,false
	   Exit Function
   End If
   setPostalCode_RC=true
End Function

'[Click button Get Address]
Public Function clickGetAddress()
	strPostalCode=CardReplacement.txtPostalCode.getROProperty("value")
   If Not (strPostalCode="") Then
		CardReplacement.btnGetAddress.click
		Wait 1
   End If
	 If Err.Number<>0 Then
       clickGetAddress=false
            LogMessage "WARN","Verification","Failed to Click Button : Submit" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickGetAddress=true
End Function

'[Verify Redirection Address on Replace Card Screen]
Public Function verifyRedirectionAddress(lstRedirectionAddress)
   bverifyRedirectionAddress=true

   If Not IsNull (lstRedirectionAddress) Then
	   strPostalCode=lstRedirectionAddress(0)
	   strAddressLine1=lstRedirectionAddress(1)
	   strAddressLine2=lstRedirectionAddress(2)
	   strAddressLine3=lstRedirectionAddress(3)
	   strAddressLine4=lstRedirectionAddress(4)
	   strAddressLine5=lstRedirectionAddress(5)
	
		If not IsNull(strPostalCode) Then
		   If Not verifyField(CardReplacement.txtPostalCode,strPostalCode,"Postal Code") Then
			   bverifyRedirectionAddress=false
		   End If
	   End If
		
	   If not IsNull(strAddressLine1) Then
		   If Not verifyField(CardReplacement.txtAddressLine1,strAddressLine1,"Address 1") Then
			   bverifyRedirectionAddress=false
		   End If
	   End If
	
	   If not IsNull(strAddressLine2) Then
		   If Not verifyField(CardReplacement.txtAddressLine2,strAddressLine2,"Address 2") Then
			   bverifyRedirectionAddress=false
		   End If
	   End If
	
	   If not IsNull(strAddressLine3) Then
		   If Not verifyField(CardReplacement.txtAddressLine3,strAddressLine3,"Address 3") Then
			   bverifyRedirectionAddress=false
		   End If
	   End If
	

	   If not IsNull(strAddressLine4) Then
		   If Not verifyField(CardReplacement.txtAddressLine4,strAddressLine4,"Address 4") Then
			   bverifyRedirectionAddress=false
		   End If
	   End If
	
	   If not IsNull(strAddressLine5) Then
		   If Not verifyField(CardReplacement.txtAddressLine5,strAddressLine5,"Address 5") Then
			   bverifyRedirectionAddress=false
		   End If
	   End If
   End If

	verifyRedirectionAddress=bverifyRedirectionAddress	
End Function

'[Update Redirection Address on Replace Card Screen]
Public Function updateRedirectionAddress(lstRedirectionAddress_Updated)
   bupdateRedirectionAddress=true

   If Not IsNull (lstRedirectionAddress_Updated) Then
	   strPostalCode=lstRedirectionAddress_Updated(0)
	   strAddressLine1=lstRedirectionAddress_Updated(1)
	   strAddressLine2=lstRedirectionAddress_Updated(2)
	   strAddressLine3=lstRedirectionAddress_Updated(3)
	   strAddressLine4=lstRedirectionAddress_Updated(4)
	   strAddressLine5=lstRedirectionAddress_Updated(5)

		If not IsNull(strPostalCode) Then
			CardReplacement.txtPostalCode.set(strPostalCode)
   	   End If
	   
       If not IsNull(strAddressLine1) Then
			CardReplacement.txtAddressLine1.set(strAddressLine1)
   	   End If
	
	   If not IsNull(strAddressLine2) Then
			CardReplacement.txtAddressLine2.set(strAddressLine2)
   	   End If

		If not IsNull(strAddressLine3) Then
			CardReplacement.txtAddressLine3.set(strAddressLine3)
   	   End If

	   If not IsNull(strAddressLine4) Then
			CardReplacement.txtAddressLine4.set(strAddressLine4)
   	   End If

	   If not IsNull(strAddressLine5) Then
			CardReplacement.txtAddressLine5.set(strAddressLine5)
   	   End If

	End If
	updateRedirectionAddress=bupdateRedirectionAddress
End Function 

'[Verify TextBox Contact Number on Card Replacement Screen]
Public Function verifyContactNumber_RC(strContactNumber)
   bverifyContactNumber=true
	If Not IsNull (strContactNumber) Then
		If Not VerifyField(CardReplacement.txtContactNumber,strContactNumber,"Contact Number") Then
		bverifyContactNumber=false
		End If
	End If
	verifyContactNumber_RC=bverifyContactNumber
End Function

'[Set TextBox Contact Number on Card Replacement Screen]
Public Function updateContactNumber(strContactNumber_Update)
	updateContactNumber=true
	If Not isNull (strContactNumber_Update) Then
		CardReplacement.txtContactNumber.set(strContactNumber_Update)
	End If
	If Err.Number<>0 Then
	  updateContactNumber=false
	  LogMessage "WARN","Verification","Failed to Set Contact Number on Card Replacement Screen",false
	  Exit Function
   End If
End Function

'[Verify if Redirection Address Fields are Disabled on Replace Card Screen]
Public Function verifyRedirectionFields_Disabled()
   bverifyRedirectionAddress=true

	intEnabled=Instr(CardReplacement.txtPostalCode.Object.GetAttribute("disabled"),("disabled"))
	If  intEnabled=0 Then
		LogMessage "RSLT","Verification","Postal Code is not disabled as per expectation.",False
		bverifyRedirectionAddress=False
	End If
	intEnabled=Instr(CardReplacement.txtPostalCode.Object.GetAttribute("disabled"),("disabled"))
	If  intEnabled=0 Then
		LogMessage "RSLT","Verification","Address1 is not disabled as per expectation.",False
		bverifyRedirectionAddress=False
	End If		
	intEnabled=Instr(CardReplacement.txtPostalCode.Object.GetAttribute("disabled"),("disabled"))
	If  intEnabled=0 Then
		LogMessage "RSLT","Verification","Address2 is not disabled as per expectation.",False
		bverifyRedirectionAddress=False
	End If
		intEnabled=Instr(CardReplacement.txtPostalCode.Object.GetAttribute("disabled"),("disabled"))
	If  intEnabled=0 Then
		LogMessage "RSLT","Verification","Address3 is not disabled as per expectation.",False
		bverifyRedirectionAddress=False
	End If
	
	intEnabled=Instr(CardReplacement.txtPostalCode.Object.GetAttribute("disabled"),("disabled"))
	If  intEnabled=0 Then
		LogMessage "RSLT","Verification","Address4 is not disabled as per expectation.",False
		bverifyRedirectionAddress=False
	End If

		intEnabled=Instr(CardReplacement.txtPostalCode.Object.GetAttribute("disabled"),("disabled"))
	If  intEnabled=0 Then
		LogMessage "RSLT","Verification","Address5 is not disabled as per expectation.",False
		bverifyRedirectionAddress=False
	End If
	If  bverifyRedirectionAddress Then
		Logmessage "RSLT", "Verification","All the Redirection fields are disabled as expected", true
	End If
	verifyRedirectionFields_Disabled=bverifyRedirectionAddress	
End Function

'[Verify Confirmation Popup on Replace Card Screen]
Public Function verifyConfirmationPopup_RC()
	bverifyConfirmationPopup=true
	If Not verifyInnerText(CardReplacement.lblConfirmationMessage(), "Are you sure you want to discard the changes (if any) and leave this page?", "Verify Pop up confirmation") Then
		bverifyConfirmationPopup=false
	End If
	WaitForICallLoading
	CardReplacement.btnYes_Confirmation.click
	  If Err.Number<>0 Then
       bverifyConfirmationPopup=false
            LogMessage "WARN","Verification","Failed to Click Button : Yes on Confirmation popup" ,false
       Exit Function
   End If
	verifyConfirmationPopup_RC=bverifyConfirmationPopup
End Function

'[Perform Additional Verification for TPIN call from Card Replacement]
Public Function performTPINPlusOne_ReplaceCard(bExpectedVerification, strValidationMessage)
   Dim bPerformTPINPlusOneVerification:bPerformTPINPlusOneVerification=true
   bActualExist=CardReplacement.popupValidationMessage.Exist(1)
	'bActualExist=true	
   If bExpectedVerification Then
		If not bActualExist Then
			bPerformTPINPlusOneVerification=false
		 else
			strActualValidationMessage=CardReplacement.lblValidationMessage.GetRoProperty("innertext")
			If Not IsNull(strActualValidationMessage) Then
				If Not VerifyInnerText (CardReplacement.lblValidationMessage(), strValidationMessage, "ValidationMessage")Then
					bPerformTPINPlusOneVerification=false
				End If
			End If
			CardReplacement.btnOK_ValidationPopup.Click
			VerifyCustomer.btnVerify.Click
			waitForIcallLoading
			
			'Check Required Verification met Check box
			Set oDesc= Description.Create()
			oDesc("micclass").Value="WebCheckBox"
			'CardActivation.cbTPINVerification.ChildObjects(oDesc)(0).Set "ON" '******** Check box removed
			CardActivation.rbAdditionalAnswer.click
			'Wait 1
			VerifyCustomer.btnVerifyCustomer().click
			waitForIcallLoading
			If err.number<>0 Then
				bPerformTPINPlusOneVerification=false
			End If
		End If	 
   End If
   performTPINPlusOne_ReplaceCard=bPerformTPINPlusOneVerification
End Function

'[Click button Close on Request Submitted Popup]
Public Function clickBtnClose_RequestSubmitted()
	bDevPending=false
   CardReplacement.btnOK_RequestSubmitted.click
   If Err.Number<>0 Then
       clickBtnClose_RequestSubmitted=false
            LogMessage "WARN","Verification","Failed to Click Button : Close_RequestSubmitted" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickBtnClose_RequestSubmitted=true
End Function

'[Verify Field TM Approval Message for same card replacement displayed as]
Public Function verifyTMApprovalMessage_RC(strValidationMessage)
   bDevPending=False
   bVerifyValidationMessageText=true
   If Not IsNull(strValidationMessage) Then
       If Not VerifyInnerText (CardReplacement.lblValidationMessage(), strValidationMessage, "Validation Message")Then
           bVerifyValidationMessageText=false
       End If
   End If
   CardReplacement.btnOK_ValidationMsg.Click
   WaitForIcallLoading
   verifyTMApprovalMessage_RC=bVerifyValidationMessageText
End Function




