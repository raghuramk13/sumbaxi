'//////////////////////////////////////////////////////////////////////////////////////GUI Functions ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	Public Function login_iCall(strUserType, strUserName, strPassword,strExpectedStatus,strMessage )

		Dim bLogin
		
		'bLogin = bcLoginICALLScreen.signIn(strUserType, strUserName, strPassword,strExpectedStatus,strMessage)
		'bLogin = signIn(strUserType, strUserName, strPassword,strExpectedStatus,strMessage)
		
		If UCase(Environment.Value("Country")) = "SINGAPORE" Then
			bLogin = bcLoginICALLScreen.signIn(strUserType, strUserName, strPassword,strExpectedStatus,strMessage)
		ElseIf UCase(Environment.Value("Country")) = "HONGKONG" Then
			bLogin = signIn(strUserType, strUserName, strPassword,strExpectedStatus,strMessage)
		End If
	
		If Not bLogin Then
		   login_iCall = False
		   LogMessage "RSLT","Verification-BusinessAction","Failed to Process  Login Business Action",False
		Else
		   login_iCall = True
		   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  Login Business Action",True
		End If
		
	End Function

	Public Function SelectCustomer(strCIN, strName, strDateOfBirth)
'		WaitForICallLoading
'		bcCustomerSearch.ResultTableExists()
	
		Dim bSelectCustomer
		bSelectCustomer = bcCustomerSearch.SelectCustomer(strCIN,strName, strDateOfBirth)

		Wait 2
		WaitForICallLoading
		bSelectCustomer = bcCustomerOverview.pageExists()
    	
		If Not bSelectCustomer Then
		   SelectCustomer = False
		   LogMessage "RSLT","Verification-BusinessAction","Failed to Process  Select Customer Business Action",False
		Else
		   SelectCustomer = True	
		   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  Select Customer Business Action",True
		End If

	End Function


	'***********To select customer from verify link*****************
	Public Function SelectCustomer_Verify(strCIN, strName, strDateOfBirth)
'			WaitForICallLoading
'			bcCustomerSearch.ResultTableExists()
	
		Dim bSelectCustomer_Verify
		bSelectCustomer_Verify = bcCustomerSearch.SelectCustomer_Verify(strCIN,strName, strDateOfBirth)

		Wait 2
		WaitForICallLoading
			Wait 5
		'bSelectCustomer_Verify = bcCustomerOverview.alertWindowExists()
		 'bSelectCustomer_Verify = bcCustomerOverview.pageExists()
    	
    	
		If Not bSelectCustomer_Verify Then
		   SelectCustomer_Verify = False
		   LogMessage "RSLT","Verification-BusinessAction","Failed to Process  Select Customer Business Action",False
		Else
		   SelectCustomer_Verify = True	
		   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  Select Customer Business Action",True
		End If

	End Function
	Public Function VerifyCustomerSearchResult(strSearchBy, strSearchNRICorPP, strSearchName, strSearchDOB, strCreditCardNumber, strDebitCardNumber, strName, strCINandSuffix, strDOB, strVerifyStatus, strMessage)
		WaitForICallLoading
		Dim bVerifyCustomerSearchResult

		bVerifyCustomerSearchResult = bcCustomerSearch.pageExists()

		If Not bVerifyCustomerSearchResult Then
		   LogMessage "RSLT","Verification","Customer Search Result screen is not active",False
		End If
	
		bVerifyCustomerSearchResult = bcCustomerSearch.VerifyCustomerSearchResult(strSearchBy, strSearchNRICorPP, strSearchName, strSearchDOB, strCreditCardNumber, strDebitCardNumber, strName, strCINandSuffix, strDOB, strVerifyStatus, strMessage)
	
		If Not bVerifyCustomerSearchResult Then
		   VerifyCustomerSearchResult = False
		   LogMessage "RSLT","Verification-BusinessAction","Failed to Process  Verify Search and Verify Customer Search Result Business Action",False
		Else
		   VerifyCustomerSearchResult = True	
		   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  Verify Search and Verify Customer Search Result Business Action",True
		End If
	End Function


	Public Function VerifyCustomerOverviewAccounts( strAccountStatus, strProductType, lstLstAccounts)
		Dim bVerifyCustomerOverviewAccounts

		bVerifyCustomerOverviewAccounts = bcCustomerOverview.pageExists()

		If Not bVerifyCustomerOverviewAccounts Then
		   LogMessage "RSLT","Verification","Customer Overview screen is not active",False
		End If

		bVerifyCustomerOverviewAccounts = bcCustomerOverview.VerifyCustomerOverviewAccounts(strAccountStatus, strProductType, lstLstAccounts)
	
		If Not bVerifyCustomerOverviewAccounts Then
		   LogMessage "RSLT","Verification-BusinessAction","Failed to Process Verify Customer Overview Accounts",False
		   VerifyCustomerOverviewAccounts = False
'		   Exit Function
		Else
		   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  Verify Customer Overview Accounts",True
		   VerifyCustomerOverviewAccounts = True	
		End If
	End Function


	Public Function VerifyContactDetails(strHomePhone, strHandPhone, strHandPhoneRegistered, strOfficePhone, strFaxNumber, strOfficialEmail, strMarketingEmail )

		Dim bVerifyContactDetails
		bVerifyContactDetails = bcCustomerOverview.pageExists()

		If Not bVerifyContactDetails Then
		   LogMessage "RSLT","Verification","Customer Overview screen is not active",False
		End If

		bVerifyContactDetails = bcCustomerOverview.VerifyContactDetails(strHomePhone, strHandPhone, strHandPhoneRegistered, strOfficePhone, strFaxNumber, strOfficialEmail, strMarketingEmail )
	
		If Not bVerifyContactDetails Then
		   LogMessage "RSLT","Verification-BusinessAction","Failed to Process  Verify Customer Overview Contact Details",False
		   VerifyContactDetails = False
'		   Exit Function
		Else
		   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  Verify Customer Overview Contact Details",True
		   VerifyContactDetails = True	
		End If
	End Function


	Public Function ReturnToHomePage( )
				
				Dim bReturnToHomePage
				bReturnToHomePage = bcCustomerOverview.pageExists()
				If Not bReturnToHomePage Then
				   LogMessage "RSLT","Verification","Customer Overview screen is not active",False
				End If

				bcCustomerOverview.clickBackToHomepage()

				WaitForICallLoading
				
				bReturnToHomePage = bcCustomerSearch.pageExists()

				If Not bReturnToHomePage Then
				   LogMessage "RSLT","Verification-BusinessAction","Failed to Process  Return To HomePage Business Action",False
				   ReturnToHomePage = False
				Else
				   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  Return To HomePage Business Action",True
				   ReturnToHomePage = True	
				End If
	End Function


		Public Function VerifyCustomerData(strCustomerName, strCustomerType, strVerficationStatus )
				Dim bVerifyCustomerData

				bVerifyCustomerData = bcCustomerOverview.pageExists()

				If Not bVerifyCustomerData Then
				   LogMessage "RSLT","Verification","Customer Overview screen is not active",False
				End If
	
				bVerifyCustomerData = bcCustomerOverview.VerifyCustomerData(strCustomerName, strCustomerType, strVerficationStatus )

				If Not bVerifyCustomerData Then
				   LogMessage "RSLT","Verification-BusinessAction","Failed to Process  Verify Customer Data Business Action",False
				   VerifyCustomerData = False
				Else
				   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  Verify Customer Data Business Action",True
				   VerifyCustomerData = True	
				End If
	End Function

		Public Function VerifyProfile(strCIN, strName, strAlias, strStatus1, strStatus2, strStatus3, strStatus4, strSalutation, strDOB, strEthnicType,_
																			 strSex, strMaritalStatus, strNationality, strCtryOfResidence, strEmployerName,strOccupation,strJobTitle, strRelManager, strSegment, strCDP, lstLstddress )
				Dim bVerifyProfile		
				WaitForICallLoading
				bVerifyProfile = bcCustomerOverview.pageExists()

				If Not bVerifyProfile Then
				   LogMessage "RSLT","Verification","Customer Overview screen is not active",False
				End If

				bVerifyProfile = bcCustomerProfile.VerifyProfile(strCIN, strName, strAlias, strStatus1, strStatus2, strStatus3, strStatus4, strSalutation, strDOB, strEthnicType,_
																			 strSex, strMaritalStatus, strNationality, strCtryOfResidence, strEmployerName,strOccupation,strJobTitle, strRelManager, strSegment, strCDP, lstLstddress )

				bcCustomerOverview.weTabOverview().Click
				bcCustomerOverview.pageExists()

				If Not bVerifyProfile Then
				   LogMessage "RSLT","Verification-BusinessAction","Failed to Process  Verify Customer Profile Business Action",False
				   VerifyProfile = False
				Else
				   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  Verify Customer Profile Business Action",True
				   VerifyProfile = True	
				End If
	End Function
	
Public Function VerifyCardList (lstLstCardList )
    Dim bVerifyCardList:bVerifyCardList = True
    WaitForICallLoading
	bVerifyCardList = bcCardList.pageExists()

	If Not bVerifyCardList Then
	   LogMessage "RSLT","Verification","Customer Overview screen is not active",False
	End If
		
    bVerifyCardList = bcCardList.VerifyCardList(lstLstCardList)
	If Not bVerifyCardList Then
	   LogMessage "RSLT","Verification-BusinessAction","Failed to Process  VerifyCardList Business Action",False
	   VerifyCardList = False
	Else
	   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  VerifyCardLists Business Action",True
	   VerifyCardList = True	
	End If

End Function

Public Function CheckCardListLink(strCardListLinkStatus)
    Dim bCheckCardListLink:bCheckCardListLink = True

    WaitForICallLoading
	
    bCheckCardListLink = bcCustomerOverview.CheckCardListLink(strCardListLinkStatus)

	If Not bCheckCardListLink Then
	   LogMessage "RSLT","Verification-BusinessAction","Failed to Process  CheckCardListLink Business Action",False
	   CheckCardListLink = False
	Else
	   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  CheckCardListLink Business Action",True
	   CheckCardListLink = True	
	End If
End Function

Public Function  SelectCardNumber(strCardNumber )
    Dim bSelectCardNumber:bSelectCardNumber= True
    WaitForReady
'	bcCardList.pageExists()
		
    bSelectCardNumber= bcCardList.SelectCardNumber(strCardNumber)
	WaitForICallLoading
	'bSelectCardNumber = bcCardAndInfo.pageExists()

	If Not bSelectCardNumber Then
	   LogMessage "RSLT","Verification-BusinessAction","Failed to Process  SelectCardNumber Business Action",False
	   SelectCardNumber= False
	Else
	   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  SelectCardNumber Business Action",True
	   SelectCardNumber= True	
	End If
End Function


Public Function VerifyCardAccountSummary(strProduct, strSubProduct, strAccountNumber, strAccountName, strStatus, strCurrency, strType, strOpenDate)
    WaitForICallLoading
    Dim bVerifyCardAccountSummary
	bcCardAccountSummary.pageExists()
    bVerifyCardAccountSummary = bcCardAccountSummary.VerifyCardAccountSummary(strProduct, strSubProduct, strAccountNumber, strAccountName, strStatus, strCurrency, strType, strOpenDate)

	If Not bVerifyCardAccountSummary Then
       LogMessage "RSLT","Verification-BusinessAction","Failed to Process VerifyCardAccountSummary Business Action",False
       VerifyCardAccountSummary = False
	Else
	   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  VerifyCardAccountSummary Business Action",True
	   VerifyCardAccountSummary = True	
	End If

End Function

Public Function VerifyCardAndPINInfo(strSummary_CardNumber, strSummary_EmbossedName, strSummary_CardStatus, strSummary_ActionStatus, strSummary_Reason, strSummary_DateTime, strSummary_TaggedBy, strSummary_Brand, strSummary_PINTries, strSummary_PINIssued, strSummary_LastPINIssuedDate, strDetails_OverseasWdl, strDetails_CashLineLink, strDetails_AccountNo, strDetails_FirstIssued, strDetails_ExpiryDate, strDetails_LastReplaced, strDetails_NoOfCardIssued, strDetails_IssuerID, strDetails_PINGenDate, strDetails_ActivationDate, strDetails_BOI, strDetails_LastTransactionDate, strDetails_LastUpdatedOn, strDetails_LastServiceType, strDetails_FPC, strReplaceHist_OldCardNumber, strReplaceHist_NewCardNumber,strCPFISLinkage)
    Dim bVerifyCardAndPINInfo
    WaitForICallLoading
    bVerifyCardAndPINInfo = bcCardAndInfo.VerifyCardAndPINInfo(strSummary_CardNumber, strSummary_EmbossedName, strSummary_CardStatus, strSummary_ActionStatus, strSummary_Reason, strSummary_DateTime, strSummary_TaggedBy, strSummary_Brand, strSummary_PINTries, strSummary_PINIssued, strSummary_LastPINIssuedDate, strDetails_OverseasWdl, strDetails_CashLineLink, strDetails_AccountNo, strDetails_FirstIssued, strDetails_ExpiryDate, strDetails_LastReplaced, strDetails_NoOfCardIssued, strDetails_IssuerID, strDetails_PINGenDate, strDetails_ActivationDate, strDetails_BOI, strDetails_LastTransactionDate, strDetails_LastUpdatedOn, strDetails_LastServiceType, strDetails_FPC, strReplaceHist_OldCardNumber, strReplaceHist_NewCardNumber,strCPFISLinkage)
	
	
	If Not bVerifyCardAndPINInfo Then
       LogMessage "RSLT","Verification-BusinessAction","Failed to Process VerifyCardAndPINInfo Business Action",False
       VerifyCardAndPINInfo = False
	Else
	   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  VerifyCardAndPINInfo Business Action",True
	   VerifyCardAndPINInfo = True	
	End If

End Function


Public Function SelectAccountLink(strProduct,strAccountNumber)
    Dim bSelectAccountLink:bSelectAccountLink = True

    WaitForICallLoading

	bcCustomerOverview.pageExists()
    bSelectAccountLink = bcCustomerOverview.SelectAccountLink(strProduct,strAccountNumber)

	If Not bSelectAccountLink Then
	   LogMessage "RSLT","Verification-BusinessAction","Failed to Process  SelectAccountLink Business Action",False
	   SelectAccountLink = False
	Else
       LogMessage "RSLT","Verification-BusinessAction","Successfully processed  SelectAccountLink Business Action",True
	   SelectAccountLink = True	
	End If
End Function


Public Function VerifyKeyInfo(strFromPage, strAccount_BlockCode1, strAccount_BlockCode1_Date, strAccount_BlockCode2, strAccount_BlockCode2_Date, strBillingCycle, strBillingLevel,_ 
		    strAccount_MultitudeCardNo, strAccount_Status, strAccount_PricingFlag, strAccount_PrimaryAccountNo, strAccount_OpenDate, strAccount_AnnualFeeDate, strAccount_FeeWaiverStartDate, strAccount_FeeWaiverEndDate,strCard_Organization,_ 
		    strCard_Logo,strCard_CardFace,strCard_EmbossName1, strCard_EmbossName2,strCard_FullName, strCard_BlockCode, strCard_BlockDate,strCard_OMSStartDate,strCard_OMSEndDate,_ 
		    strCard_IssueDate, strCard_ExpiryDate, strCard_PrevCardExpiryDate, strCard_AnnualFeeAmount, strCard_CurrentFeeDate, strCard_NextFeeDate, strCard_AnnualFeeReversalFlag,strCard_NeedToActivate,_ 
		    strCard_MainSupplementaryIndicator, strCard_CVVCode, strCard_Previous_NewCardNumber, strCard_NFCMobileNo, strCard_NFCMobileOperatorID,strCard_ComGatewayEnrollment,strCard_AuthCountry,strCard_CardType,strCard_Mailer,_
		    strLoan_LoanCode,strLoan_LoanStatus,strLoan_LastAdviceDate,strLoan_MetricNo,strLoan_StudentNSCode,strLoan_InstitutionName)

    WaitForICallLoading
    Dim bKeyInfo
    bKeyInfo = bcKeyInfo.VerifyKeyInfo(strFromPage, strAccount_BlockCode1, strAccount_BlockCode1_Date, strAccount_BlockCode2, strAccount_BlockCode2_Date, strBillingCycle, strBillingLevel,_ 
		    strAccount_MultitudeCardNo, strAccount_Status, strAccount_PricingFlag, strAccount_PrimaryAccountNo, strAccount_OpenDate, strAccount_AnnualFeeDate, strAccount_FeeWaiverStartDate, strAccount_FeeWaiverEndDate,strCard_Organization,_ 
		    strCard_Logo,strCard_CardFace,strCard_EmbossName1, strCard_EmbossName2,strCard_FullName, strCard_BlockCode, strCard_BlockDate,strCard_OMSStartDate,strCard_OMSEndDate,_ 
		    strCard_IssueDate, strCard_ExpiryDate, strCard_PrevCardExpiryDate, strCard_AnnualFeeAmount, strCard_CurrentFeeDate, strCard_NextFeeDate, strCard_AnnualFeeReversalFlag,strCard_NeedToActivate,_ 
		    strCard_MainSupplementaryIndicator, strCard_CVVCode, strCard_Previous_NewCardNumber, strCard_NFCMobileNo, strCard_NFCMobileOperatorID,strCard_ComGatewayEnrollment,strCard_AuthCountry,strCard_CardType,strCard_Mailer,_
		    strLoan_LoanCode,strLoan_LoanStatus,strLoan_LastAdviceDate,strLoan_MetricNo,strLoan_StudentNSCode,strLoan_InstitutionName)

	If Not bKeyInfo Then
	   LogMessage "RSLT","Verification-BusinessAction","Failed to Process  VerifyKeyInfo Business Action",False
	   VerifyKeyInfo = False
	Else
	   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  VerifyKeyInfo Business Action",True
	   VerifyKeyInfo = True	
	End If
End Function


Public Function VerifyCustomerDetails(strPriCust_CIN, strPriCust_MotherName, strPriCust_VIP, strPriCust_Employer, strPriCust_AnnualIncome, strPriCust_EnrollmentStatus, strPriCust_EnrollmentDate, strEmbossName_CardholderName, strEmbossName_Gender, strEmbossName_DOB, strEmbossName_CIN)

    WaitForICallLoading
	Dim bCustomerDetails
    bCustomerDetails = bcCustomerDetails.VerifyCustomerDetails(strPriCust_CIN, strPriCust_MotherName, strPriCust_VIP, strPriCust_Employer, strPriCust_AnnualIncome, strPriCust_EnrollmentStatus, strPriCust_EnrollmentDate, strEmbossName_CardholderName, strEmbossName_Gender, strEmbossName_DOB, strEmbossName_CIN)

    If Not bCustomerDetails Then
       VerifyCustomerDetails = False
       LogMessage "RSLT","Verification-BusinessAction","Failed to Process VerifyCustomerDetails Business Action",False
	Else
	   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  VerifyCustomerDetails Business Action",True
	   VerifyCustomerDetails = True	
    End If

End Function


Public Function VerifyInstallmentPlan (strInstalmentPlanCount,lstLstCardList )
   WaitForICallLoading
    Dim bVerifyInstallmentPlan

    bVerifyInstallmentPlan = bcInstallmentPlan.verifyInstallmentPlanDetails(strInstalmentPlanCount,lstLstCardList)
	If Not bVerifyInstallmentPlan Then
	   VerifyInstallmentPlan = False
	   LogMessage "RSLT","Verification-BusinessAction","Failed to Process  VerifyInstallmentPlan Business Action",False
	Else
	   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  VerifyInstallmentPlans Business Action",True
	   VerifyInstallmentPlan = True	
	End If

End Function


Public Function VerifyMerchantInfoAndprincipleAmount(arrInstallmentData,strMerchantName,strMerchantID,strCity,strAdd1,strAdd2,strAdd3,strAdd4,strPostalCode,strPhone,_ 
	   strProcessingFee,strAdministrationFee,strNoInstallment,strInstallmentPaid,strStatementDate)
	WaitForReady
    Dim bVerifyMerchantInfo

    bVerifyMerchantInfo = bcInstallmentPlan.verifyMerchantDataAndPrinciple(arrInstallmentData,strMerchantName,strMerchantID,strCity,strAdd1,strAdd2,strAdd3,strAdd4,strPostalCode,strPhone,_ 
	   strProcessingFee,strAdministrationFee,strNoInstallment,strInstallmentPaid,strStatementDate)
	If Not bVerifyMerchantInfo Then
	   VerifyMerchantInfoAndprincipleAmount = False
	   LogMessage "RSLT","Verification-BusinessAction","Failed to Process  VerifyMerchantInfo Business Action",False
	Else
	   VerifyMerchantInfoAndprincipleAmount = True	
	   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  VerifyMerchantInfo Business Action",True
	End If

End Function



Public Function VerifyPrincipalAmount(lstInstallmentPlan, strProcessFee, strAdminFee, strInstallmentPeriod, strNoOfInstallmentsPaid, strStatementDate)
	WaitForReady
    Dim bVerifyPrincipalAmount

    bVerifyPrincipalAmount = bcInstallmentPlan.VerifyPrincipalAmount(lstInstallmentPlan, strProcessFee, strAdminFee, strInstallmentPeriod, strNoOfInstallmentsPaid, strStatementDate)

	If Not bVerifyPrincipalAmount Then
	   VerifyPrincipalAmount = False
	   LogMessage "RSLT","Verification-BusinessAction","Failed to Process  VerifyPrincipalAmount Business Action",False
	Else
	   VerifyPrincipalAmount = True	
	   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  VerifyPrincipalAmount Business Action",True
	End If

End Function


Public Function VerifyStatementDateField(strFromPage,strDefaultValue, strNumOfStmts)
	WaitForReady
    Dim bVerifyStatementDateField

    bVerifyStatementDateField = bcStatements.VerifyStatementDateField(strFromPage,strDefaultValue, strNumOfStmts)

	If Not bVerifyStatementDateField Then
	   VerifyStatementDateField = False
	   LogMessage "RSLT","Verification-BusinessAction","Failed to Process  VerifyStatementDateField Business Action",False
	Else
	   VerifyStatementDateField = True	
	   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  VerifyStatementDateField Business Action",True
	End If

End Function
'********************************** ********************************************
'Function Search by Card
Public Function SearchByCard(strCardNumber,strProductTypeDesc,strName,strCINandSuffix,strVerifyStatus,strExpectedMsg,bVerifyResult,strSearchResultMessage)
		WaitForICallLoading
		Dim bSearchByCard

		bSearchByCard = bcCustomerSearch.pageExists()

		If Not bSearchByCard Then
		   LogMessage "RSLT","Verification","Customer Search Result screen is not active",False
		End If
	
		bSearchByCard = bcCustomerSearch.searchByCard(strCardNumber,strProductTypeDesc,strName,strCINandSuffix,strVerifyStatus,strExpectedMsg,bVerifyResult,strSearchResultMessage)
	
		If Not bSearchByCard Then
		   SearchByCard = False
		   LogMessage "RSLT","Verification-BusinessAction","Failed to Process   Search and Verify Card Search Result Business Action",False
		Else
		   SearchByCard = True	
		   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  Verify Search and Verify Card Search Result Business Action",True
		End If
	End Function

'Funciton user profile management
'GUI Function Generation
Public Function searchUser(str1BankID,strName,strRole,strStatus, bManager, intDirectReportCount, lstDirectReportee)

    WaitForICallLoading
    UserProfileManagement.pageExists()
    Dim bManageUserProfile
    bManageUserProfile = UserProfileManagement.searchUser( str1BankID,strName,strRole,strStatus, bManager, intDirectReportCount, lstDirectReportee)

		If Not bManageUserProfile Then
       		   searchUser = False
		   LogMessage "RSLT","Verification-BusinessAction","Failed to Process   Search User Business Action",False
		Else
		   searchUser = True	
		   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  Search User Business Action",True
		End If
End Function 

''GUI Function verifyLimits_Usage
'Function verify Limits and Usage for respective card
Public Function verifyLimits_Usage( bVerifyLimits, arrExpectedLimits,bVerifyUsage,arrExpectedUsage)
	
    WaitForICallLoading
    LimitsandUsage.pageExists()
    Dim bverifyLimits_Usage
    bverifyLimits_Usage = LimitsandUsage.verifyLimits_Usage(  bVerifyLimits, arrExpectedLimits,bVerifyUsage,arrExpectedUsage )

	If Not bverifyLimits_Usage Then
       		   verifyLimits_Usage = False
		   LogMessage "RSLT","Verification-BusinessAction","Failed to Process   Verify Limits and Usage Business Action",False
		Else
		   verifyLimits_Usage = True	
		   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  Limits and Usage Business Action",True
	End If
End Function


''GUI Function verifyStatementTransactions
'Function verify Statement Transaction Details
Public Function verifyStatementTransactionDetails( strStatementDate,strTransactionCount,arrTransactionData,strErrorNoData,strMerchantcategory,strSequenceNo,strPointsEarned,strAuthorizationCode,strCheckNo,_ 
			 strMerchantID,strMerchantName,strCity,strAdd1,strAdd2,strAdd3,strAdd4,strPostalCode,strPhoneNo,bPlanEnabled,strPlanDataCount,arrPlanData,strRewardsDataCount,arrRewardsData,strBlockCode1,strBlockCode2,strCreditLimit,arrRelationTranSummaryData)
	
    WaitForICallLoading
    
    Dim bverifyStatement
    bverifyStatement =bcStatements.verifyStatementTransactions(strStatementDate,strTransactionCount,arrTransactionData,strErrorNoData,strMerchantcategory,strSequenceNo,strPointsEarned,strAuthorizationCode,strCheckNo,_ 
			 strMerchantID,strMerchantName,strCity,strAdd1,strAdd2,strAdd3,strAdd4,strPostalCode,strPhoneNo,bPlanEnabled,strPlanDataCount,arrPlanData,strRewardsDataCount,arrRewardsData,strBlockCode1,strBlockCode2,strCreditLimit,arrRelationTranSummaryData )

	If Not bverifyStatement Then
       		   verifyStatementTransactionDetails = False
		   LogMessage "RSLT","Verification-BusinessAction","Failed to Process   Verify StatementTransactionDetails Business Action",False
		Else
		   verifyStatementTransactionDetails = True	
		   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  StatementTransactionDetails Business Action",True
	End If
End Function
''GUI Function verifyStatementSummary
'Function verify Statement Summary Details
'Public Function verifyStatementSummary(strStatementDate, strBeginningBalance, strTotalDebits, strTotalCredits, strInterest, strCurrentBalance, strPastDue,_ 
'	 strCurrentDue,strTotalDue, strPaymentDueDate, strGIRODeductionAmount)
	Public Function verifyStatementSummary(strStatementDate,arrStatementData)
    WaitForICallLoading
    
    Dim bverifyStatementSummary
    'bverifyStatementSummary =bcStatements.verifyStatementSummary(strStatementDate, strBeginningBalance, strTotalDebits, strTotalCredits, strInterest, strCurrentBalance, strPastDue,_ 
	 'strCurrentDue,strTotalDue, strPaymentDueDate, strGIRODeductionAmount)
	bverifyStatementSummary =bcStatements.verifyStatementSummary(strStatementDate,arrStatementData)
	If Not bverifyStatementSummary Then
       		   verifyStatementSummary = False
		   LogMessage "RSLT","Verification-BusinessAction","Failed to Process   Verify StatementTransactionDetails Business Action",False
		Else
		   verifyStatementSummary = True	
		   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  StatementTransactionDetails Business Action",True
	End If
End Function

'GUI Function Generation
'Verify  Balances and Limits for respective card
Public Function verifyBalanceAndLimits(strCurrentBalance, strPendingDebits, strPendingCredits, strOutstandingBalance, strTotalCreditLimit, strAvailableLimit,_ 
    strCashAdvance_Current, strCashAdvance_Outstanding, strCashAdvance_CreditLimit, strCashAdvance_AvailableLimit, strRetail_Current, strRetail_Outstanding, strRetail_CreditLimit, strRetail_AvailableLimit, strRetail_TempCreditLimit, strRetail_EffectiveDate, strRetail_ExpiryDate, strRetail_ChangeReason,_        
	 strCardLimit_WithdrawalPerDay, strCardLimit_WithdrawalPerTransaction, strCardLimit_EligibleTransactions, strCardLimit_CreditLimit, strCardLimit_AvailableLimit, strCardLimit_TempCreditLimit, strCardLimit_EffectiveDate, strCardLimit_ExpiryDate, strCardLimits_RTLPerDay, strCardLimits_RTLPerMonth, strCardLimits_RTLPerYear, _ 
	  strRelationship_CurrentBalance, strRelationship_PendingDebits, strRelationship_PendingCredits, strRelationship_OutstandingBalance, strRelationship_CreditLimit, strRelationship_TempCreditLimit, strRelationship_AvailableCreditLimit, strRelationship_EffectiveDate, strRelationship_ExpiryDate)

    WaitForReady
    BalancesAndLimits.pageExists()
    Dim bverifyBalancesAndLimits
    bverifyBalancesAndLimits = BalancesAndLimits.verifyBalanceAndLimits(strCurrentBalance, strPendingDebits, strPendingCredits, strOutstandingBalance, strTotalCreditLimit, strAvailableLimit,_ 
    strCashAdvance_Current, strCashAdvance_Outstanding, strCashAdvance_CreditLimit, strCashAdvance_AvailableLimit, strRetail_Current, strRetail_Outstanding, strRetail_CreditLimit, strRetail_AvailableLimit, strRetail_TempCreditLimit, strRetail_EffectiveDate, strRetail_ExpiryDate, strRetail_ChangeReason,_        
	 strCardLimit_WithdrawalPerDay, strCardLimit_WithdrawalPerTransaction, strCardLimit_EligibleTransactions, strCardLimit_CreditLimit, strCardLimit_AvailableLimit, strCardLimit_TempCreditLimit, strCardLimit_EffectiveDate, strCardLimit_ExpiryDate, strCardLimits_RTLPerDay, strCardLimits_RTLPerMonth, strCardLimits_RTLPerYear, _ 
	  strRelationship_CurrentBalance, strRelationship_PendingDebits, strRelationship_PendingCredits, strRelationship_OutstandingBalance, strRelationship_CreditLimit, strRelationship_TempCreditLimit, strRelationship_AvailableCreditLimit, strRelationship_EffectiveDate, strRelationship_ExpiryDate)

	If Not bverifyBalancesAndLimits Then
       LogMessage "RSLT","Verification-BusinessAction","Failed to Process verifyBalancesAndLimits",False
       verifyBalanceAndLimits = False
       Exit Function
    End If

    verifyBalanceAndLimits = True

End Function

''''Transaction history

Public Function VerifyTransactionHistory (strAccType,strTranType,strExpectedTranCount,arrTranHistoryData)
   WaitForICallLoading
    Dim bVerifyTransactionHistory

    bVerifyTransactionHistory = TransactionHistory.verifyTranHistoryDetails (strAccType,strTranType,strExpectedTranCount,arrTranHistoryData)
	If Not bVerifyTransactionHistory Then
	   VerifyTransactionHistory = False
	   LogMessage "RSLT","Verification-BusinessAction","Failed to Process  VerifyTransaction history Details Business Action",False
	Else
	   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  VerifyTransaction history Details Business Action",True
	   VerifyTransactionHistory = True	
	End If

End Function

Public Function VerifyTransactionAndMerchantDesc (strProductType,strType,arrTransactionHistoryData,strMerchantCat,strSequence,strAuthCode,strPointsEarned,strCheckNo,_ 
	   strAquiringCountry,strPlanNo,strMerchantName,strMerchantID,strCity,strAdd1,strAdd2,strAdd3,strAdd4,strPostalCode,strPhone,strMerchantOrg,strMerchantCatCode,strPOSEntryMode,strCardAcceptorName,strCardAcceptorCity,strCardAcceptorCountry,strCurrencyCode,streCommerceTranType,strAdditionalIfno)
   WaitForICallLoading
    Dim bVerifyTransactionAndMerchantDesc

    bVerifyTransactionAndMerchantDesc = TransactionHistory.verifyTransactionAndMerchantDetails(strProductType,strType,arrTransactionHistoryData,strMerchantCat,strSequence,strAuthCode,strPointsEarned,strCheckNo,_ 
	  strAquiringCountry,strPlanNo, strMerchantName,strMerchantID,strCity,strAdd1,strAdd2,strAdd3,strAdd4,strPostalCode,strPhone,strMerchantOrg,strMerchantCatCode,strPOSEntryMode,strCardAcceptorName,strCardAcceptorCity,strCardAcceptorCountry,strCurrencyCode,streCommerceTranType,strAdditionalIfno)
	If Not bVerifyTransactionAndMerchantDesc Then
	   VerifyTransactionAndMerchantDesc = False
	   LogMessage "RSLT","Verification-BusinessAction","Failed to Process  VerifyTransaction history Details Business Action",False
	Else
	   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  VerifyTransaction history Details Business Action",True
	   VerifyTransactionAndMerchantDesc = True	
	End If

End Function
''''Transaction History

'********Relationship Details
Public Function VerifyRelationshipDetails(strRelationshipNumber, strAFWScore, strSecureIndicator, strRelationshipBlockCode, strRelationshipOpenDate, strEPExpiryDate,_ 
		    strTitle,strName,strAddressLine1, strAddressLine2, strAddressLine3, strAddressLine4, strAddressLine5,strPostalCode, strCountry,  strHomePhone, strMobilePhone, strEmail,lstPastAddressDetails)
		  WaitForICallLoading
    Dim bVerifyRelationshipDetails

    bVerifyRelationshipDetails = Relationship_Details.verifyRelationshipDetails(strRelationshipNumber, strAFWScore, strSecureIndicator, strRelationshipBlockCode, strRelationshipOpenDate, strEPExpiryDate,_ 
		    strTitle,strName,strAddressLine1, strAddressLine2, strAddressLine3, strAddressLine4,strAddressLine5, strPostalCode, strCountry,  strHomePhone, strMobilePhone, strEmail,lstPastAddressDetails)

	If Not bVerifyRelationshipDetails Then
	   VerifyRelationshipDetails = False
	   LogMessage "RSLT","Verification-BusinessAction","Failed to Process  Verify Relationship  Details Business Action",False
	Else
	   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  Verify Relationship  Details Business Action",True
	   VerifyRelationshipDetails = True	
	End If	
End Function

Public Function VerifyRelationshipAccountDetails(strAccountCount,lstlstAccountData)
		  WaitForICallLoading
    Dim bVerifyRelationshipAccountDetails

    bVerifyRelationshipAccountDetails = Relationship_Details.verifyAccountSummary(strAccountCount,lstlstAccountData)
	If Not bVerifyRelationshipAccountDetails Then
	   VerifyRelationshipAccountDetails = False
	   LogMessage "RSLT","Verification-BusinessAction","Failed to Process  Verify Relationship Account Details Business Action",False
	Else
	   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  Verify Relationship Account Details Business Action",True
	   VerifyRelationshipAccountDetails = True	
	End If	
End Function

Public Function VerifyRelationshipCardSummary(lstAccountDetails,strCardCount,lstlstCardData,bMoreInfo,strCardType,lstCardDetail)
		  WaitForICallLoading
    Dim bVerifyRelationshipCardSummary

    bVerifyRelationshipCardSummary = Relationship_Details.verifyCardSummary(lstAccountDetails,strCardCount,lstlstCardData,bMoreInfo,strCardType,lstCardDetail)
	If Not bVerifyRelationshipCardSummary Then
	   VerifyRelationshipCardSummary = False
	   LogMessage "RSLT","Verification-BusinessAction","Failed to Process  Verify Relationship Card Summary Business Action",False
	Else
	   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  Verify RelationshipCard Summary Business Action",True
	   VerifyRelationshipCardSummary = True	
	End If	
End Function

'GUI Function Generation
	Public Function verifyDeliquency(strBehaviorScore, strCreditClass, strRiskGrade, strScoringDate, strBehaviorIndicator, strPreviousCreditClass, strMescScore, strCbValue,_ 
				strPastDue, strCurrentDue, strTotalDue, lstlstOverDueDetails, lstlstDeliquencyData)
		WaitForReady
		Deliquency.pageExists()
		Dim bverifyDeliquency
		bverifyDeliquency = Deliquency.verifyDeliquency(strBehaviorScore, strCreditClass, strRiskGrade, strScoringDate, strBehaviorIndicator, strPreviousCreditClass, strMescScore, strCbValue,_ 
				strPastDue, strCurrentDue, strTotalDue, lstlstOverDueDetails, lstlstDeliquencyData)
		If Not bverifyDeliquency Then
		   LogMessage "RSLT","Verification-BusinessAction","Failed to Process verifyDeliquency  Business Action",False
		   verifyDeliquency = False
		   Exit Function
		Else
			   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  Verify Deliquency Business Action",True
			   verifyDeliquency = True	
		End If
	End Function

'GUI Function Generation
	Public Function verifyTopUp(strAutoTopupIndicator,  lstlstSavingsAcc, lstlstCurrentAcc,lblErrorMessage)
		WaitForReady
		TopUp.pageExists()
		Dim bverifyTopup
		bverifyTopup = TopUp.verifyAutoTopUp( strAutoTopupIndicator, lstlstSavingsAcc, lstlstCurrentAcc,lblErrorMessage)
		If Not bverifyTopup Then
		   LogMessage "RSLT","Verification-BusinessAction","Failed to Process verifyTopUp  Business Action",False
		   verifyTopUp = False
		   Exit Function
		Else
			   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  Verify Topup Business Action",True
			   verifyTopUp = True	
		End If
	End Function
'GUI Function Generation
	Public Function verifyPlans(strProductType,strPlanOption,strPlanCount,lstlstPlanDetails,strPlanNo,lstPlanDetails,strGadgetCount,lstlstGadgetOldCashDetails,strProgramCode,lstProductInfo, lstMoreInfo)
		WaitForReady
		Plans.pageExists()
		Dim bverifyPlans
		bverifyPlans = Plans.verifyPlans(strProductType,strPlanOption,strPlanCount,lstlstPlanDetails,strPlanNo,lstPlanDetails,strGadgetCount,lstlstGadgetOldCashDetails,strProgramCode,lstProductInfo, lstMoreInfo)
		If Not bverifyPlans Then
		   LogMessage "RSLT","Verification-BusinessAction","Failed to Process verifyPlans  Business Action",False
		   verifyPlans = False
		   Exit Function
		Else
			   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  Verify Plans Business Action",True
			   verifyPlans = True	
		End If
	End Function
'GUI Function Generation
	Public Function verifyPaymentHistory(lstlstPaymentHistory,lstPayment,lstlstPaymentDetails,lstSeq,lstlstPaymentHistorySeqNo,lstlstLateFee,lstlstFinanceCharges)
		WaitForReady
		PaymentHistory.pageExists()
		Dim bverifyPlans
		bverifyPaymentHistory = PaymentHistory. verifyPaymentHistory(lstlstPaymentHistory,lstPayment,lstlstPaymentDetails,lstSeq,lstlstPaymentHistorySeqNo,lstlstLateFee,lstlstFinanceCharges)
		If Not bverifyPaymentHistory Then
		   LogMessage "RSLT","Verification-BusinessAction","Failed to Process verifyPaymentHistory  Business Action",False
		   verifyPaymentHistory = False
		   Exit Function
		Else
			   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  verifyPaymentHistory Business Action",True
			   verifyPaymentHistory = True	
		End If
	End Function

	'GUI Function Rewards
	Public Function verifyVerifyRewards(strCardType,strRewardsShow,lstlstRewardsSummary,strRedumptionCount,lstlstRedumptionHistoryData,_ 
		   strAccountDataRowCount,strCardNumber,lstYesterdaysBalance,lstRedeemedToday,lstCurrentBalance,strExpiryPointsRowCount,lstlstPointsExpiry,_ 
		    lstRebateSummary,lstlstRebateBreakdown,strRebateTranHistoryCount,lstlstRebateHistory)
		'WaitForReady
		'Rewards.pageExists()
		Dim bverifyRewards
		bverifyRewards = Rewards. verifyRewards_relationshipSummary(strCardType,strRewardsShow,lstlstRewardsSummary,strRedumptionCount,lstlstRedumptionHistoryData,_ 
		   strAccountDataRowCount,strCardNumber,lstYesterdaysBalance,lstRedeemedToday,lstCurrentBalance,strExpiryPointsRowCount,lstlstPointsExpiry,_ 
		    lstRebateSummary,lstlstRebateBreakdown,strRebateTranHistoryCount,lstlstRebateHistory)
		If Not bverifyRewards Then
		   LogMessage "RSLT","Verification-BusinessAction","Failed to Process verifyVerifyRewards  Business Action",False
		   verifyVerifyRewards = False
		   Exit Function
		Else
			   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  verifyVerifyRewards Business Action",True
			   verifyVerifyRewards = True	
		End If
	End Function
'GUI Manual Authentication
Public Function performManualAuthentication(strCIN,strUser,strCallerId,strIdentificationStatus,lstQues,lstSystemAns,lstAnswer,strExpectedStatus,bIdentificationFail,strAuthenticationStatus,_ 
		   lstAuthQuestions,lstAuthSystemAns,strAuthRowCount,lstAccountDetails,lstCardListDetails,lstAuthAnswer,strExpectedAuthStatus,bAuthenticationFail,strAccountNumber,lstCardQues,lstCardSystemAns,lstCardAnswer,bCardIdentificationFail,_ 
		   lstProductQuestions,lstProductSystemAns,lstProductAnswer,strRowCount, lstCardDetails,lstTransactionDetails,lstInstallmentDetails,lstPlanSummary,bProductAuthenticationFail,strExpectedMessage,strVerficationStatus)
   Dim bVerifyManualAuth
   bVerifyManualAuth= VerifyCustomer.performManualAuthentication(strCIN,strUser,strCallerId,strIdentificationStatus,lstQues,lstSystemAns,lstAnswer,strExpectedStatus,bIdentificationFail,strAuthenticationStatus,_ 
		   lstAuthQuestions,lstAuthSystemAns,strAuthRowCount,lstAccountDetails,lstCardListDetails,lstAuthAnswer,strExpectedAuthStatus,bAuthenticationFail,strAccountNumber,lstCardQues,lstCardSystemAns,lstCardAnswer,bCardIdentificationFail,_ 
		   lstProductQuestions,lstProductSystemAns,lstProductAnswer,strRowCount, lstCardDetails,lstTransactionDetails,lstInstallmentDetails,lstPlanSummary,bProductAuthenticationFail,strExpectedMessage,strVerficationStatus)
	If Not bVerifyManualAuth Then
		   LogMessage "RSLT","Verification-BusinessAction","Failed to Process ManualAuthentication  Business Action",False
		   performManualAuthentication = False
		   Exit Function
		Else
			   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  ManualAuthentication Business Action",True
			   performManualAuthentication = True	
		End If
End Function

'PastVerification:
		Public Function performPastVerification(lstVerificationDetails, strCTIReferance, strCreatedBy, strVerificationStatus, strVerificationStatus_Identification,strVerificationStatus_Authentication, _ 
		   strVerifStartDateTime, strModifieddateTime,strCompletionTime, strOwner, strLastModifiedBy,lstIdentificationQues,lstIdentificationAnswers,lstAuthenticationQues,lstAuthenticationAnswers,_ 
		   lstPortFolioQues,lstPortfolioAnswers,lstCustomQues,lstCustomAnswers,lstlstProductQuesData,lstProductQuesAnswers)
		Dim bPastVerification
		bPastVerification = PastVerification.performPastVerification(lstVerificationDetails, strCTIReferance, strCreatedBy, strVerificationStatus, strVerificationStatus_Identification,strVerificationStatus_Authentication, _ 
		   strVerifStartDateTime, strModifieddateTime,strCompletionTime, strOwner, strLastModifiedBy,lstIdentificationQues,lstIdentificationAnswers,lstAuthenticationQues,lstAuthenticationAnswers,_ 
		   lstPortFolioQues,lstPortfolioAnswers,lstCustomQues,lstCustomAnswers,lstlstProductQuesData,lstProductQuesAnswers)
		If Not bPastVerification Then
		   performPastVerification = False
		   LogMessage "RSLT","Verification-BusinessAction","Failed to Process  PastVerification Business Action",False
		Else
		   performPastVerification = True	
		   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  PastVerification Business Action",True
		End If

	End Function

'SR
'For this excel sheet needs to be in proper format. There should not be any spaces in column name. 
Public function verifySR_DB(strExcelFilePath)
	strTableName="SR_Type_SubType"
	'
	Dim bVerifySR_DB
	bVerifySR_DB=true
	strQuery_RelatedTo="Select DISTINCT [" & strTableName & "$].Related_To  from [" & strTableName & "$]"
	arrRelatedToData= queryDB("ORACLE","EXCEL", strExcelFilePath,"","",strQuery_RelatedTo)
	
	For iRows=0 to Ubound(arrRelatedToData)
		strRelatedTo=arrRelatedToData(iRows,0)
		strExcel_Query="Select  [" & strTableName & "$].Related_To &','&[" & strTableName & "$].Request_Type   &','& [" & strTableName & "$].Request_Sub_Type &','& [" & strTableName & "$].Type &','& [" & strTableName & "$].Area &','& [" & strTableName & "$].Sub_Area &','& [" & strTableName & "$].Assigned_To &','& [" & strTableName & "$].Minimum_Verification_Required  &','& [" & strTableName & "$].TPINo_verified_Required &','& [" & strTableName & "$].TM_Approval_Required from [" & strTableName & "$] where [" & strTableName & "$].Related_To='"&strRelatedTo&"' order by [" & strTableName & "$].Request_Type, [" & strTableName & "$].Request_Sub_Type, [" & strTableName & "$].Type , [" & strTableName & "$].Area , [" & strTableName & "$].Sub_Area"
		'strDBQuery="select a.related_to ||','|| b.req_type ||','|| c.req_sub_type from cca_prm_relto a, cca_prm_type b, cca_prm_subtype c where a.related_to='Cashline' and a.rlt_id= b.rlt_id and b.rt_id= c.rt_id"
		'strDBQuery="select a.related_to ||','|| b.req_type ||','|| c.req_sub_type ||','|| d.type ||','||d.area ||','|| d.sub_area from cca_prm_relto a, cca_prm_type b, cca_prm_subtype c, cca_param_icall_c3_intg d where a.related_to='Cashline' and a.rlt_id= b.rlt_id and b.rt_id= c.rt_id and a.rlt_id= d.rlt_id And b.rt_id= d.rt_id and c.rst_id= d.rst_id order by c.req_sub_type "
		strDBQuery="select a.related_to ||','|| b.req_type ||','|| c.req_sub_type ||','|| d.type ||','||d.area ||','|| d.sub_area ||','|| e.assigned_to_icall ||','||e.min_verification_req ||','|| e.tpin_verification_ind ||','|| e.tm_approval_ind from cca_prm_relto a, cca_prm_type b, cca_prm_subtype c, cca_param_icall_c3_intg d, cca_prm_other e where a.related_to='"&strRelatedTo&"' and a.rlt_id= b.rlt_id and b.rt_id= c.rt_id and a.rlt_id= d.rlt_id And b.rt_id= d.rt_id and c.rst_id= d.rst_id and e.rst_id= c.rst_id order by b.req_type, c.req_sub_type, d.type, d.area, d.sub_area"
		
		bVerifySR_DB=compareTwoDBTables(strExcelFilePath,strTableName,strExcel_Query,strDBQuery)
	Next

verifySR_DB=bVerifySR_DB

End Function
Public Function CreateServiceRequest(bShortCut,strName,strCIN,strSegment,bVerifyCombo,strRelatedTo,strAccount,strType,strSubType,strDescription,strKnoledgeBase,strProduct,strExpectd_AssignTo,strAssignedTo_New,_ 
   strStatus,strSubStatus,strRequestExecuted,bOnceAndDone,strComment, strNotes,bAddNotes,strExpectedProgressStatus,strActivityType,strActivitySubType,	strActivityAssignedTo,strActivity_Comments,bSubmit,strErrorMessage)
	Dim bServiceRequest
	bServiceRequest = ServiceRequest.createServiceRequest(bShortCut,strName,strCIN,strSegment,bVerifyCombo,strRelatedTo,strAccount,strType,strSubType,strDescription,strKnoledgeBase,strProduct,strExpectd_AssignTo,strAssignedTo_New,_ 
   strStatus,strSubStatus,strRequestExecuted,bOnceAndDone,strComment, strNotes,bAddNotes,strExpectedProgressStatus,strActivityType,strActivitySubType,	strActivityAssignedTo,strActivity_Comments,bSubmit,strErrorMessage)
	If Not bServiceRequest Then
	   CreateServiceRequest = False
	   LogMessage "RSLT","Verification-BusinessAction","Failed to Process  Create Service Request Business Action",False
	Else
	   CreateServiceRequest = True	
	   LogMessage "RSLT","Verification-BusinessAction","Successfully processed Create Service Request Business Action",True
	End If

End Function

Public Function VerifyServiceRequest(strServiceRequestNo,strName,strCIN,strSegment,strRelatedTo,strAccountNumber,strType,strSubType,strProduct,strDescription,strKnoledgeBase,strAssignedTo_New,strStatus,_ 
   strSubStatus,strRequestExecuted,bOnceAndDone,strComment, strChannel, strCreatedDate,strCreatedBy,strOverdue,strDuration,strClosedDate,strLastUpdateDate,strLastUpdateBy,lstNotes,lstActivity)
	Dim bVerifyServiceRequest
		bVerifyServiceRequest = ServiceRequest. verifyServiceRequest(strServiceRequestNo,strName,strCIN,strSegment,strRelatedTo,strAccountNumber,strType,strSubType,strProduct,strDescription,strKnoledgeBase,strAssignedTo_New,strStatus,_ 
   strSubStatus,strRequestExecuted,bOnceAndDone,strComment, strChannel, strCreatedDate,strCreatedBy,strOverdue,strDuration,strClosedDate,strLastUpdateDate,strLastUpdateBy,lstNotes,lstActivity)
		If Not bVerifyServiceRequest Then
		   VerifyServiceRequest = False
		   LogMessage "RSLT","Verification-BusinessAction","Failed to Process Verify Service Request Business Action",False
		Else
		   VerifyServiceRequest = True	
		   LogMessage "RSLT","Verification-BusinessAction","Successfully processed Verify Service Request Business Action",True
		End If

End Function
Public Function  VerifyServiceRequest_Shortcut(strProductType,strLeftMenuName,lstButtonNames, strButtonToClick,strRelatedTo,strType,lstSubType)
	Dim bVerifyServiceRequest_Shortcut
		bVerifyServiceRequest_Shortcut = ServiceRequest.verifyShortcutButtons(strProductType,strLeftMenuName,lstButtonNames, strButtonToClick,strRelatedTo,strType,lstSubType)
		If Not bVerifyServiceRequest_Shortcut Then
		   VerifyServiceRequest_Shortcut = False
		   LogMessage "RSLT","Verification-BusinessAction","Failed to Process Verify Service Request Shortcut Business Action",False
		Else
		   VerifyServiceRequest_Shortcut = True	
		   LogMessage "RSLT","Verification-BusinessAction","Successfully processed Verify Service Request Shortcut Business Action",True
		End If

End Function
Public Function EditServiceRequest(strServiceRequestNo, strAssignedTo,strStatus,strSubStatus, strRequestExecuted,strCreatedBy,strComment,strNotes,_ 
	    lstActivityDetails, strLoggedInUser,strActivityAssignTo,strActivityStatus, strActivityResolution,bActivityOnceandDone,strActivityComment,strActivityCreatedBy,bSubmit,strExpectedProgress)
	Dim bServiceRequest
	bServiceRequest = ServiceRequest.editServiceRequest(strServiceRequestNo, strAssignedTo,strStatus,strSubStatus, strRequestExecuted,strCreatedBy,strComment,strNotes,_ 
	    lstActivityDetails, strLoggedInUser,strActivityAssignTo,strActivityStatus, strActivityResolution,bActivityOnceandDone,strActivityComment,strActivityCreatedBy,bSubmit ,strExpectedProgress )
	If Not bServiceRequest Then
	   EditServiceRequest = False
	   LogMessage "RSLT","Verification-BusinessAction","Failed to Process  Edit Service Request Business Action",False
	Else
	   EditServiceRequest = True	
	   LogMessage "RSLT","Verification-BusinessAction","Successfully processed Edit Service Request Business Action",True
	End If

End Function

'******************************************** *********************************************************************************

'GUI function for Customer Alert
'By Manish 29-05-2013

Public Function Customer_Alert(bAutoAlert, strSelectAlert, strAlertCount, strNoAlertMsg, strComments, strExpiresOn, strStartDate, strCreatedBy, strDuration, strUnitType, strExpiryDate, strTargetOrg, strPriority, strCategory, strMessage)
            
    WaitForICallLoading    
    Dim bCustomerAlert
    bCustomerAlert = bcCustomerOverview.Customer_Alert(bAutoAlert, strSelectAlert, strAlertCount, strNoAlertMsg, strComments, strExpiresOn, strStartDate, strCreatedBy, strDuration, strUnitType, strExpiryDate, strTargetOrg, strPriority, strCategory, strMessage)

    If Not bCustomerAlert Then
		Customer_Alert = False
       LogMessage "WARN","Verification-BusinessAction","Failed to Process CustomerAlert Business Action",False
       Else
		   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  CustomerAlert Business Action",True
		  Customer_Alert = True 
     
    End If

   End Function
               

'GUI function for Verify Account Link
'By Manish 4-06-2013

Public Function VerifyAccountLink(strAccountStatus, strProducts, strAccountNumber, strCurrency, strJoint_Single)
            
    WaitForICallLoading    
    Dim bVerifyAccountLink
    bVerifyAccountLink = bcCustomerOverview.VerifyAccountLink(strAccountStatus, strProducts, strAccountNumber, strCurrency, strJoint_Single)

    If Not bVerifyAccountLink Then
       LogMessage "RSLT","Verification-BusinessAction","Failed to Process Verify Account Link Business Action",False
	   VerifyAccountLink = False
       Else
		 LogMessage "RSLT","Verification-BusinessAction","Successfully processed  Verify Account Link Business Action",True
		VerifyAccountLink = True	
     
    End If

   End Function


'GUI function for SMS Tresholds for Debit Card
'By Manish 10-06-2013
Public Function SMSThresholds(strThresholdType, strLocal, strOverseas)

    WaitForICallLoading
    Dim bSMSThresholds
    bSMSThresholds = bcSMS_Thresholds.SMSThresholds(strThresholdType, strLocal, strOverseas)

    If Not bSMSThresholds Then
       LogMessage "RSLT","Verification-BusinessAction","Failed to Process SMS Threshold Business Action",False
	   bSMSThresholds = False
	   Else
		LogMessage "RSLT","Verification-BusinessAction","Successfully processed  SMS Threshold Business Action",True
        bSMSThresholds = True
      
    End If
    SMSThresholds = bSMSThresholds
End Function



'GUI Function Generation for DirectDebit management
' By manish on 11-06-2013

Public Function DirectDebitArrangement(strDirectDebitArrangement, strBankCode, strBankAccountNo, strPaymentIndicator, strNominatedAmount, strNominatedPercentage, strStartDate, strExpiryDate, strStatus)

    WaitForICallLoading
    Dim bDirectDebitArrangement
    bDirectDebitArrangement = bcDirectDebit_Arrangement.DirectDebitArrangement(strDirectDebitArrangement, strBankCode, strBankAccountNo, strPaymentIndicator, strNominatedAmount, strNominatedPercentage, strStartDate, strExpiryDate, strStatus)

    If Not bDirectDebitArrangement Then
        LogMessage "RSLT","Verification-BusinessAction","Failed to Process Direct Debit Arrangement Business Action",False
       DirectDebitArrangement = False
	   Else
	   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  Direct Debit Arrangement Business Action",True
	   DirectDebitArrangement = True
      
    End If
    
End Function

'GUI Function Generation for Insurance Plan
'By Manish 17-06-2013
Public Function VerifyInsurance(lstlstInsuranceList, lstInsurance, lstlstInsuranceDetails)

    WaitForICallLoading
    Dim bVerifyInsurance
    bVerifyInsurance = bcVerify_Insurance.VerifyInsurance(lstlstInsuranceList, lstInsurance, lstlstInsuranceDetails)

    If Not bVerifyInsurance Then
       LogMessage "RSLT","Verification-BusinessAction","Failed to Process Insurance Plan Business Action",False
       VerifyInsurance = False
	   Else
	   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  Insurance Plan Business Action",True
	   VerifyInsurance = True
    
    End If
   
End Function


'GUI Function Generation for Cashline Cheque
'By Manish 17-06-2013
Public Function CashlineCheque(lstlstChequeInfo, lstCheque, strIssuedDate, strPaidCheque,strTotalNoofCheques, lstlstChequeList, lstChequeSelect, lstChequeDetails)

    WaitForICallLoading
    
    Dim bCashlineCheque
    bCashlineCheque = bcCashline_Cheque.CashlineCheque(lstlstChequeInfo, lstCheque, strIssuedDate, strPaidCheque,strTotalNoofCheques, lstlstChequeList, lstChequeSelect, lstChequeDetails)

    If Not bCashlineCheque Then
       LogMessage "RSLT","Verification-BusinessAction","Failed to Process Cheque Info Business Action",False
       CashlineCheque = False
	   Else
	   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  Cheque Info Business Action",True
	   CashlineCheque = True
       
    End If

End Function


'GUI Function Generation for Account and address linkage
'By manish 18-06-2013
Public Function VerifyAccountAndAddress(lstAddressDetails, strRSLTingMessage, lstlstAccountList, lstAccount, strRemarks)

    WaitForICallLoading
    Dim bVerifyAccountAndAddress
    bVerifyAccountAndAddress = bcVerify_AccountAndAddress.VerifyAccountAndAddress(lstAddressDetails, strRSLTingMessage, lstlstAccountList, lstAccount, strRemarks)

    If Not bVerifyAccountAndAddress Then
       LogMessage "RSLT","Verification-BusinessAction","Failed to Process VerifyAccountAndAddress Business Action",False
       VerifyAccountAndAddress = False
	   Else
		 LogMessage "RSLT","Verification-BusinessAction","Sucessfully Processed VerifyAccountAndAddress Business Action",True
		 VerifyAccountAndAddress = true
    End If
    VerifyAccountAndAddress = bVerifyAccountAndAddress
End Function


'GUI Function Generation for Notes
'By Manish on 20-06-2013
Public Function VerifyNotes(strAccType,strTranType,strMemoCount,lstlstMemo,lstMemo,strMemoDetailsText,strCustomerMemoDetailsText,strSMSCount,lstlstSMS,lstSMS,strMessageDetailsText)

    WaitForICallLoading    
    Dim bVerifyNotes
    bVerifyNotes = bcVerify_Notes.VerifyNotes(strAccType,strTranType,strMemoCount,lstlstMemo,lstMemo,strMemoDetailsText,strCustomerMemoDetailsText,strSMSCount,lstlstSMS,lstSMS,strMessageDetailsText)

    If Not bVerifyNotes Then
       LogMessage "RSLT","Verification-BusinessAction","Failed to Process VerifyNotes",False
       bVerifyNotes = False
	Else
		LogMessage "RSLT","Verification-BusinessAction","Sucessfully Processed VerifyNotes Business Action",True
	    bVerifyNotes = true      
    End If
    VerifyNotes = bVerifyNotes
End Function

'GUI Function Generation for recurring Arrangements
'By Manish 1-07-2013
Public Function RecurringArrangements(strAccountCount,lstlstRecurringArrangementsList)

    WaitForICallLoading    
    Dim bRecurringArrangements
    bRecurringArrangements = bcRecurring_Arrangements.RecurringArrangements(strAccountCount,lstlstRecurringArrangementsList)

    If Not bRecurringArrangements Then
       LogMessage "RSLT","Verification-BusinessAction","Failed to Process RecurringArrangements  business action",False
       RecurringArrangements = False
	Else
		LogMessage "RSLT","Verification-BusinessAction","Sucessfully Processed RecurringArrangements  business action",True
       RecurringArrangements = True
	End If
		RecurringArrangements = bRecurringArrangements
       
End Function

'GUI Function Generation for Logout
'By Manish 4-07-2013
Public Function verifyLogout(strLogoutScenario,strUrl, strExpectedError,strUserName,strPassword,strExpectedMessage)

    WaitForICallLoading
   Dim bverifyLogout
    bverifyLogout = bcverify_Logout.verifyLogout(strLogoutScenario,strUrl, strExpectedError,strUserName,strPassword,strExpectedMessage)

    If Not bverifyLogout Then
       LogMessage "RSLT","Verification-BusinessAction","Failed to Process verifyLogout  business action",False
       verifyLogout = False
	Else
		LogMessage "RSLT","Verification-BusinessAction","Sucessfully Processed verifyLogout business action.",True
       verifyLogout = True
	End If
      
  verifyLogout = bverifyLogout

End Function

'GUI Function Generation for call Prediction
'By Manish on 19-09-2013
Public Function VerifyCP(strEventCount, lstlstEvents, lstEventDetails, strCardAccountNumber, strMobileNo, strEventType, strDate, strTime, strTransactionCode, strTransactionDescription,_ 
		   strSMSMessageSent, strSuggestedAction, strOtherDetails, strComments, strYesNo, strCancelSave)

    WaitForICallLoading
    
    Dim bVerifyCP
    bVerifyCallPrediction = CallPrediction.VerifyCP(strEventCount, lstlstEvents, lstEventDetails, strCardAccountNumber, strMobileNo, strEventType, strDate, strTime, strTransactionCode, strTransactionDescription,_ 
		   strSMSMessageSent, strSuggestedAction, strOtherDetails, strComments, strYesNo, strCancelSave)

    If Not bVerifyCallPrediction Then
       LogMessage "WARN","Verification-BusinessAction","Failed to Process VerifyCallPrediction",False
       bVerifyCP = False
	else
		LogMessage "RSLT","Verification-BusinessAction","Successfully Processed VerifyCallPrediction", True
		bVerifyCP=True
       
    End If

    VerifyCP = bVerifyCP

End Function
Public Function VerifyAuditTrial(strDBType, strDBServer, strDBName, strUser, strPassword,strQuery, arrExpectedData)

    WaitForICallLoading
   Dim bVerifyAuditTrial
    bVerifyAuditTrial = bcVerifyAuditTrial.VerifyAuditTrial(strDBType, strDBServer, strDBName, strUser, strPassword,strQuery, arrExpectedData)

    If Not bVerifyAuditTrial Then
       LogMessage "RSLT","Verification-BusinessAction","Failed to Process verifyAuditTrail  business action",False
       VerifyAuditTrial = False
	Else
		LogMessage "RSLT","Verification-BusinessAction","Sucessfully Processed verifyAuditTrail business action.",True
       VerifyAuditTrial = True
	End If
      
  VerifyAuditTrial = bVerifyAuditTrial

End Function

'GUI function for Customer Activity
'By Manish 12-11-2013

Public Function Verify_Activity(strActivityType,strActivityScreen,strCSO,strFromDate,strToDate,strErrorMessage,lstlstActivity,lstActivity,bActivityVerify,strpopupName,strCIN,strName,strSegment,strRelatedTo,strAccountNumber,strType,strSubType,strProduct,strComments,strAssignedTo,strStatus,strResolution,strActivityID,strServiceRequestNo,strChannel,strCreatedDate,strCreatedBy,strOverdue,strDuration,strClosedDate,strLastUpdatedDate,strLastUpdatedBy,bCreateActivity)
            
    WaitForICallLoading    
    Dim bVerify_Activity
    bVerify_Activity = bcActivities.verifyActivity(strActivityType,strActivityScreen,strCSO,strFromDate,strToDate,strErrorMessage,lstlstActivity,lstActivity,bActivityVerify,strpopupName,strCIN,strName,strSegment,strRelatedTo,strAccountNumber,strType,strSubType,strProduct,strComments,strAssignedTo,strStatus,strResolution,strActivityID,strServiceRequestNo,strChannel,strCreatedDate,strCreatedBy,strOverdue,strDuration,strClosedDate,strLastUpdatedDate,strLastUpdatedBy,bCreateActivity)

    If Not bVerify_Activity Then
		bVerify_Activity = False
       LogMessage "WARN","Verification-BusinessAction","Failed to Process Verify Activity Business Action",False
       Else
		   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  Verify Activity Business Action",True
		  bVerify_Activity = True      
    End If
		Verify_Activity = bVerify_Activity
End Function

Public Function Create_Activity(strActivityScreen,bverifyActivity,strpopupName,strName,strCIN,strSegment,bVerifyCombo,strRelatedTo,strAccount,strType,strSubType,strProduct,strExpectd_AssignTo,strAssignedTo_New,strStatus,strResolution,strDueDate,bOnceAndDone,strComment,strErrMessage)
            
    WaitForICallLoading    
    Dim bCreate_Activity
    bCreate_Activity = bcActivities.createupdateActivity(strActivityScreen,bverifyActivity,strpopupName,strName,strCIN,strSegment,bVerifyCombo,strRelatedTo,strAccount,strType,strSubType,strProduct,strExpectd_AssignTo,strAssignedTo_New,strStatus,strResolution,strDueDate,bOnceAndDone,strComment,strErrMessage)

    If Not bCreate_Activity Then
		bCreate_Activity = False
       LogMessage "WARN","Verification-BusinessAction","Failed to Process Create Activity Business Action",False
       Else
		   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  Create Activity Business Action",True
		  bCreate_Activity = True      
    End If
		Create_Activity = bCreate_Activity
End Function

Public Function editActivity(strServiceRequestNo,strLoggedInUser,strAssignTo,strStatus, strResolution,bOnceandDone,strNewComment,strCreatedBy,strErrMessage)
            
    WaitForICallLoading    
    Dim beditActivity
    bCreate_Activity = bcActivities.editActivity(strServiceRequestNo,strLoggedInUser,strAssignTo,strStatus, strResolution,bOnceandDone,strNewComment,strCreatedBy,strErrMessage)

    If Not bCreate_Activity Then
		beditActivity = False
       LogMessage "WARN","Verification-BusinessAction","Failed to Process Create Activity Business Action",False
       Else
		   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  Create Activity Business Action",True
		  beditActivity = True      
    End If
		editActivity = beditActivity
End Function

'GUI function for Date of Birth and Highlight pop up
'By Manish 29-05-2013

Public Function verifyBirthDay_Highlight()            
    WaitForICallLoading    
    Dim bverifyBirthDay_Highlight
    bverifyBirthDay_Highlight = bcCustomerOverview.verifyBirthDayHighlight()
    If Not bverifyBirthDay_Highlight Then
	   verifyBirthDay_Highlight = False
       LogMessage "WARN","Verification-BusinessAction","Failed to Process verifyBirthDay_Highlight Business Action",False
    Else
	   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  verifyBirthDay_Highlight Business Action",True
	   verifyBirthDay_Highlight = True      
    End If

   End Function


'----------Rohit--------------

	Public Function searchUserProfile(strUserName, lstSearchResult, strDirectReportsCount,lstlstDirectReports, strAction,strSearchError,strApproverError)
'		WaitForICallLoading
'		bcCustomerSearch.ResultTableExists()

	'userProfile = bcUserProfile.searchUserProfile("CRMUAT5", lstData, Null, "Configure")
		Dim bSearchUserProfile
		bSearchUserProfile = bcUserProfile.searchUserProfile(strUserName, lstSearchResult,strDirectReportsCount, lstlstDirectReports, strAction,strSearchError,strApproverError)
		If Not bSearchUserProfile Then
           LogMessage "RSLT","Verification-BusinessAction","Failed to Process  Search User Profile Action",False
		     searchUserProfile = False
		Else
           LogMessage "RSLT","Verification-BusinessAction","Successfully processed  Search User Profile Action",True
		   searchUserProfile = True	
		End If
	End Function

	Public Function CreateProfile(str1BankID, strLANID, strName, lstRoles, strRole, strManager1BankID, strInvalidManagerID,strManagerLANID,_ 
	   lstGroup, strGroup,lstChannel, strChannel,lstLocation, strLocation, strC3User, strStaffAccess,strMakerID, strStatus,strCreateDate,strCreateBy,_ 
	   strLastApprovedDate,strLastApprovedBy,strLastUpdatedDate,strLastUpdatedBy,strAction,strErrorMessage)
		Dim bCreateProfile
		bCreateProfile = bcUserProfile.CreateProfile(str1BankID, strLANID, strName, lstRoles, strRole, strManager1BankID, strInvalidManagerID,strManagerLANID,_ 
	   lstGroup, strGroup,lstChannel, strChannel,lstLocation, strLocation, strC3User, strStaffAccess, strMakerID,strStatus,strCreateDate,strCreateBy,_ 
	   strLastApprovedDate,strLastApprovedBy,strLastUpdatedDate,strLastUpdatedBy,strAction,strErrorMessage)

		If Not bCreateProfile Then
		   CreateProfile = False
		   LogMessage "RSLT","Verification-BusinessAction","Failed to Process  Create User Profile Action",False
		Else
		   CreateProfile = True	
		   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  Create User Profile Action",True
		End If

	End Function


	Public Function VerifyUserProfile(str1BankID, strLANID, strName, strRole, strManager1BankID, strManagerLANID,strGroup, strChannel,strLocation,_ 
	    strC3User, strStaffAccess, strStatus,strCreateDate,strCreateBy,strLastApprovedDate,strLastApprovedBy,strLastUpdatedDate,strLastUpdatedBy,strAction)
		Dim bVerifyUserProf
		bVerifyUserProf = bcUserProfile.VerifyUserProfile(str1BankID, strLANID, strName, strRole, strManager1BankID, strManagerLANID,strGroup, strChannel,strLocation,_ 
	    strC3User, strStaffAccess, strStatus,strCreateDate,strCreateBy,strLastApprovedDate,strLastApprovedBy,strLastUpdatedDate,strLastUpdatedBy,strAction)
		If Not bVerifyUserProf Then
		   VerifyUserProf = False
		   LogMessage "RSLT","Verification-BusinessAction","Failed to Process  Verify User Profile Action",False
		Else
		   VerifyUserProf = True	
		   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  Verify User Profile Action",True
		End If
	End Function

	Public Function EditProfile(strRole, strManager1BankID, strManagerLANID, strGroup, strChannel, strLocation, strC3User, strStaffAccess, strStatus)
'		WaitForICallLoading
'		bcCustomerSearch.ResultTableExists()

	'userProfile = bcUserProfile.searchUserProfile("CRMUAT5", lstData, Null, "Configure")
		Dim bEditProfile
		bEditProfile = bcUserProfile.EditProfile(strRole, strManager1BankID, strManagerLANID, strGroup, strChannel, strLocation, strC3User, strStaffAccess, strStatus)

'		Wait 2
		WaitForICallLoading
		'bSelectCustomer = bcCustomerOverview.pageExists()
    	
		If Not bEditProfile Then
		   EditProfile = False
		   LogMessage "RSLT","Verification-BusinessAction","Failed to Process  Verify User Profile Action",False
		Else
		   EditProfile = True	
		   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  Verify User Profile Action",True
		End If

	End Function


	Public Function VerifyAuditTrailReport(strFromDate, strToDate, strMessage, strMakers1BankID, strMakersRecordCreateDate, strCheckers1BankID, strCheckersRecordDate, strUsers1BankID, lstAttributeName, lstAttributeOldValue, lstAttributeNewValue)

		Dim bVerifyAuditTrailReport
		bVerifyAuditTrailReport = bcUserProfile.VerifyAuditTrailReport(strFromDate, strToDate, strMessage, strMakers1BankID, strMakersRecordCreateDate, strCheckers1BankID, strCheckersRecordDate, strUsers1BankID, lstAttributeName, lstAttributeOldValue, lstAttributeNewValue)

'		WaitForICallLoading
    	
		If Not bVerifyAuditTrailReport Then
		   VerifyAuditTrailReport = False
		   LogMessage "RSLT","Verification-BusinessAction","Failed to Process  Verify Audit Trail Report Action",False
		Else
		   VerifyAuditTrailReport = True	
		   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  Verify Audit Trail Report Action",True
		End If

	End Function


	Public Function VerifyInvalidUserReport(lstReportData)

		Dim bVerifyInvalidUserReport
		bVerifyInvalidUserReport = bcUserProfile.verifyReport_InvalidUsers(lstReportData)

'		WaitForICallLoading
    	
		If Not bVerifyInvalidUserReport Then
		   VerifyInvalidUserReport = False
		   LogMessage "RSLT","Verification-BusinessAction","Failed to Process  Verify Invalid Users Report Action",False
		Else
		   VerifyInvalidUserReport = True	
		   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  Verify Invalid Users Report Action",True
		End If

	End Function


	Public Function VerifyInfoWarning(strInfoWarnLocation, strStatus, strInfoMessage, strPageName, strPageNumber, strLinkToClick)

		Dim bVerifyInfoWarning
		bVerifyInfoWarning = bcInfoWarning.VerifyInfoWarning(strInfoWarnLocation, strStatus, strInfoMessage, strPageName, strPageNumber, strLinkToClick)

'		WaitForICallLoading
    	
		If Not bVerifyInfoWarning Then
		   VerifyInfoWarning = False
		   LogMessage "RSLT","Verification-BusinessAction","Failed to Process  VerifyInfoWarning Action",False
		Else
		   VerifyInfoWarning = True	
		   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  VerifyInfoWarning Action",True
		End If

	End Function

	Public Function TriggerCTI(strAuthStatus, strCIN, strCINSFX, strCCNumber, strTransactionIndicator, strSourceOwner, strCallerID, strCustName, strExpVerificationStatus, strExpIdentificationStatus, strExpAuthenticationStatus)

		Dim bTriggerCTI
		bTriggerCTI = bcTriggerCTI.TriggerCTI(strAuthStatus, strCIN, strCINSFX, strCCNumber, strTransactionIndicator, strSourceOwner, strCallerID, strCustName, strExpVerificationStatus, strExpIdentificationStatus, strExpAuthenticationStatus)

'		WaitForICallLoading
    	
		If Not btriggerCTI Then
		   triggerCTI = False
		   LogMessage "RSLT","Verification-BusinessAction","Failed to Process  TriggerCTI Action",False
		Else
		   triggerCTI = True	
		   LogMessage "RSLT","Verification-BusinessAction","Successfully processed  TriggerCTI Action",True
		End If

	End Function
