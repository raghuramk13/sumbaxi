'[Verify Account section displayed in Customer Overview page]
Public Function verifyAccountsSectionCustomerOverview()
	blnverifyAccountsSectionCustomerOverview=True
	If Not (HK_CCTR_CustomerOverview_Page.lblOverviewAccounts().Exist(10)) Then
		blnverifyAccountsSectionCustomerOverview=false
		LogMessage "WARN","Verification","Accounts section is not displayed" ,false
	Else
		LogMessage "RSLT","Verification","Accounts section is displayed as expected",True
		blnverifyAccountsSectionCustomerOverview=true
	End If
	verifyAccountsSectionCustomerOverview=blnverifyAccountsSectionCustomerOverview
End Function
'[Verify Banking Facilities section displayed in Customer Overview page]
Public Function verifyBankingFacilitiesSectionCustomerOverview()
	blnverifyBankingFacilitiesSectionCustomerOverview=True
	If Not (HK_CCTR_CustomerOverview_Page.lblOverviewBankingFacilities().Exist(10)) Then
		blnverifyBankingFacilitiesSectionCustomerOverview=false
		LogMessage "WARN","Verification","Banking Facilities section is not displayed" ,false
	Else
		LogMessage "RSLT","Verification","Banking Facilities section is displayed as expected",True
		blnverifyBankingFacilitiesSectionCustomerOverview=true
	End If
	verifyBankingFacilitiesSectionCustomerOverview=blnverifyBankingFacilitiesSectionCustomerOverview
End Function
'[Verify Activities tab displayed in Customer Overview page]
Public Function verifyActivitiesCustomerOverview()
	blnverifyActivitiesCustomerOverview=True
	If Not (HK_CCTR_CustomerOverview_Page.tabOverviewActivities().Exist(10)) Then
		blnverifyActivitiesCustomerOverview=false
		LogMessage "WARN","Verification","Activities tab is not displayed" ,false
	Else
		LogMessage "RSLT","Verification","Activities tab is displayed as expected",True
		blnverifyActivitiesCustomerOverview=true
	End If
	verifyActivitiesCustomerOverview=blnverifyActivitiesCustomerOverview
End Function
'[Verify Pending SR tab displayed in Customer Overview page]
Public Function verifyPendingSRCustomerOverview()
	blnverifyPendingSRCustomerOverview=True
	If Not (HK_CCTR_CustomerOverview_Page.tabOverviewPendingSR().Exist(10)) Then
		blnverifyPendingSRCustomerOverview=false
		LogMessage "WARN","Verification","Pending SR tab is not displayed" ,false
	Else
		LogMessage "RSLT","Verification","Pending SR tab is displayed as expected",True
		blnverifyPendingSRCustomerOverview=true
	End If
	verifyPendingSRCustomerOverview=blnverifyPendingSRCustomerOverview
End Function
'[Verify SR tab displayed in Customer Overview page]
Public Function verifySRCustomerOverview()
	blnverifySRCustomerOverview=True
	If Not (HK_CCTR_CustomerOverview_Page.tabOverviewSR().Exist(10)) Then
		blnverifySRCustomerOverview=false
		LogMessage "WARN","Verification","SR tab is not displayed" ,false
	Else
		LogMessage "RSLT","Verification","SR tab is displayed as expected",True
		blnverifySRCustomerOverview=true
	End If
	verifySRCustomerOverview=blnverifySRCustomerOverview
End Function
'[Verify Past Verification tab displayed in Customer Overview page]
Public Function verifyPastVerificationCustomerOverview()
	blnverifyPastVerificationCustomerOverview=True
	If Not (HK_CCTR_CustomerOverview_Page.tabOverviewPastVerification().Exist(10)) Then
		blnverifyPastVerificationCustomerOverview=false
		LogMessage "WARN","Verification","Past Verification tab is not displayed" ,false
	Else
		LogMessage "RSLT","Verification","Past Verification tab is displayed as expected",True
		blnverifyPastVerificationCustomerOverview=true
	End If
	verifyPastVerificationCustomerOverview=blnverifyPastVerificationCustomerOverview
End Function
'[Verify Contact Details tab displayed in Customer Overview page]
Public Function verifyContactDetailsCustomerOverview()
	blnverifyContactDetailsCustomerOverview=True
	If Not (HK_CCTR_CustomerOverview_Page.tabOverviewContactDetails().Exist(10)) Then
		blnverifyContactDetailsCustomerOverview=false
		LogMessage "WARN","Verification","Contact Details tab is not displayed" ,false
	Else
		LogMessage "RSLT","Verification","Contact Details tab is displayed as expected",True
		blnverifyContactDetailsCustomerOverview=true
	End If
	verifyContactDetailsCustomerOverview=blnverifyContactDetailsCustomerOverview
End Function
'[Select show accounts radio button in Customer Overview page]
Public Function selectrbtnAccountsShowCustomerOverview(intShowOption)
	blnselectrbtnAccountsShowCustomerOverview=True
	HK_CCTR_CustomerOverview_Page.rbtnShowAccountsOverview().Select "#" & intShowOption

	If Err.Number <> 0 Then
		blnselectrbtnAccountsShowCustomerOverview=false
		LogMessage "WARN","Verification","show accounts radio button not selected as expected" ,false
	Else
		LogMessage "RSLT","Verification","show accounts radio button is selected as expected",True
		blnselectrbtnAccountsShowCustomerOverview=true
	End If
	selectrbtnAccountsShowCustomerOverview=blnselectrbtnAccountsShowCustomerOverview
End Function
'[Click on New IA Button in Customer Overview Page]
Public Function clickNEWIAButton()
	ClickOnObject HK_CCTR_CustomerOverview_Page.btnNewIAOverview(),"New IA Button"
End Function
'[Click on New SR Button in Customer Overview Page]
Public Function clickNewSRButtonCustOverview()
	ClickOnObject HK_CCTR_CustomerOverview_Page.btnNewSRCustOverview(),"New SR Button"
End Function
'[Verify row Data in Table for Accounts in Customer Overview Page]
Public Function verifytblContentAccTaggedCustOverview(arraccOverviewDataList)
   verifytblContentAccTaggedCustOverview=verifyTableContentList(HK_CCTR_CustomerOverview_Page.tblAccountsOverviewHeader(),HK_CCTR_CustomerOverview_Page.tblAccountsOverviewContent(),arraccOverviewDataList,"Accounts - Overview",false,NULL,NULL,NULL)
End Function
'[Close NEW IA Tab in Customer Overview Page]
Public Function closeNewIATab()
	verifyCrossMarkAndCloseTab "New IA",True
End Function
'[Close NEW SR Tab in Customer Overview Page]
Public Function closeNewSRTab()
	verifyCrossMarkAndCloseTab "New SR",True
End Function
'[Verify the existance of Phone Banking link in Customer Overview Page]
Public Function verifyPhoneBankingLinkCustOverview()
	
	blnverifyPhoneBankingLinkCustOverview=True
	If Not (HK_CCTR_CustomerOverview_Page.lnkPhoneBankingCustOverview().Exist(10)) Then
		blnverifyPhoneBankingLinkCustOverview=false
		LogMessage "WARN","Verification","Phone Banking link is not displayed" ,false
	Else
		LogMessage "RSLT","Verification","Phone Banking link is displayed as expected",True
		blnverifyPhoneBankingLinkCustOverview=true
	End If
	verifyPhoneBankingLinkCustOverview=blnverifyPhoneBankingLinkCustOverview
	
End Function
'[Verify the existance of Direct Debit Account link in Customer Overview Page]
Public Function verifyDDALinkCustOverview()
	
	blnverifyDDALinkCustOverview=True
	If Not (HK_CCTR_CustomerOverview_Page.lnkDDACustOverview().Exist(10)) Then
		blnverifyDDALinkCustOverview=false
		LogMessage "WARN","Verification","DDA link is not displayed" ,false
	Else
		LogMessage "RSLT","Verification","DDA link is displayed as expected",True
		blnverifyDDALinkCustOverview=true
	End If
	verifyDDALinkCustOverview=blnverifyDDALinkCustOverview
	
End Function
'[Verify the existance of Foreign Exchange Rate link in Customer Overview Page]
Public Function verifyForeignExchangeLinkCustOverview()
	
	blnverifyForeignExchangeLinkCustOverview=True
	If Not (HK_CCTR_CustomerOverview_Page.lnkForeignExchangeCustOverview().Exist(10)) Then
		blnverifyForeignExchangeLinkCustOverview=false
		LogMessage "WARN","Verification","Foreign Exchange Rate link is not displayed" ,false
	Else
		LogMessage "RSLT","Verification","Foreign Exchange Rate link is displayed as expected",True
		blnverifyForeignExchangeLinkCustOverview=true
	End If
	verifyForeignExchangeLinkCustOverview=blnverifyDDALinkCustOverview
	
End Function
'[Verify the existance of CASA Balance and AUM link in Customer Overview Page]
Public Function verifyCASABalLinkCustOverview()
	
	blnverifyCASABalLinkCustOverview=True
	If Not (HK_CCTR_CustomerOverview_Page.lnkCASABalCustOverview().Exist(10)) Then
		blnverifyCASABalLinkCustOverview=false
		LogMessage "WARN","Verification","CASA Balance and AUM link is not displayed" ,false
	Else
		LogMessage "RSLT","Verification","CASA Balance and AUM link is displayed as expected",True
		blnverifyCASABalLinkCustOverview=true
	End If
	verifyCASABalLinkCustOverview=blnverifyDDALinkCustOverview
	
End Function
'[Click on Current Account collapse button in Customer Overview Page]
Public Function clickCollapseCurrentAccountCustOverview()
	ClickOnObject HK_CCTR_CustomerOverview_Page.btnCurrentAccountsCustOverview(),"Current Account Collapse Button"
	
End Function
