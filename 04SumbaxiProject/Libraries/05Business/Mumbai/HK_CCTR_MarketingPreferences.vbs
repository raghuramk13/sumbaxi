'[Click on Navigation Bar Customer Name]
Public Function clickLinkNavBarCustomerName()
	ClickOnObject HK_CCTR_MarketingPreferences_Page.lnkNavigationBarCustomerName(),"Customer Name"
	WaitForICallLoading
End Function
'[Click on Marketing Preferences Button]
Public Function clickBtnMarketingPreferences()
	ClickOnObject HK_CCTR_MarketingPreferences_Page.btnMarketingPreferences(),"Marketing Preferences Button"
	WaitForICallLoading
End Function
'[Verify row Data in Table for Existing Marketing Preferences]
Public Function verifytblContentExistingMarketingPreferences(arrExstMarkPrefRowDataList)
   verifytblContentExistingMarketingPreferences=verifyTableContentList(HK_CCTR_MarketingPreferences_Page.tblExstMarkPrefHeader(),HK_CCTR_MarketingPreferences_Page.tblExstMarkPrefContent(),arrExstMarkPrefRowDataList,"Existing Marketing Preferences",false,NULL,NULL,NULL)
End Function
'[Select Radio Button for Marketing Preferences All]
Public Function selectMarketingRadioAllRadioProspects(strSelection)
	
	blnselectMarketingRadioAllRadioProspects=true
	blnselectMarketingRadioAllRadioProspects=SelectRadioButtonGrp(strSelection, HK_CCTR_MarketingPreferences_Page.rbtnMarkPrefAll(), Array("Opt-In","Opt-Out"))
	If Not(blnselectMarketingRadioAllRadioProspects) Then
		blnclickConfirmationYesButtonUpdateMI=false
		LogMessage "WARN","Verification","Failed to select Marketing all radio button" ,false
	Else
		LogMessage "RSLT","Verification","selected marketing all as expected",True
		blnclickConfirmationYesButtonUpdateMI=true
	End If
    WaitForICallLoading
    selectMarketingRadioAllRadioProspects=blnselectMarketingRadioAllRadioProspects
End Function
'[Select Radio Button for Marketing Preferences Direct Marketing]
Public Function selectMarketingRadioDirectMarketingRadioProspects(strSelection)
	
	blnselectMarketingRadioDirectMarketingRadioProspects=true
	blnselectMarketingRadioDirectMarketingRadioProspects=SelectRadioButtonGrp(strSelection, HK_CCTR_MarketingPreferences_Page.rbtnDirectMarketing(), Array("Opt-In","Opt-Out"))
	If Not(blnselectMarketingRadioDirectMarketingRadioProspects) Then
		blnclickConfirmationYesButtonUpdateMI=false
		LogMessage "WARN","Verification","Failed to select Direct Marketing radio button" ,false
	Else
		LogMessage "RSLT","Verification","selected Direct Marketing as expected",True
		blnclickConfirmationYesButtonUpdateMI=true
	End If
    WaitForICallLoading
    selectMarketingRadioDirectMarketingRadioProspects=blnselectMarketingRadioDirectMarketingRadioProspects
End Function
'[Click on Marketing Preferences Close Button]
Public Function clickMrktPrefCloseButton()
	blnclickCloseButton=true
	WaitForICallLoading
	HK_CCTR_MarketingPreferences_Page.btnMarkPrefClose().Click
	WaitForICallLoading
	If Err.Number<>0 Then
		blnclickCloseButton=false
		LogMessage "WARN","Verification","Failed to Click Button :Close" ,false
	Else
		LogMessage "RSLT","Verification","Clicked on Confirmation - Close Button as expected.",True
		blnclickCloseButton=true
	End If
	clickMrktPrefCloseButton=blnclickCloseButton
End Function

