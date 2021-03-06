'[Select Mortgage Product Type Value as]
Public Function selectMortgageProductTyp(strProdTyp)
	blnselectMortgageProductTyp=true
	If Not IsNull(strProdTyp) Then
       If Not (selectItem_Combobox (SG_HELLO_Mortgage_Page.cmbProductType(), strProdTyp))Then
           LogMessage "WARN","Verification","Failed to select :"&strProdTyp&" From Product Type dropdown list" ,false
           blnselectMortgageProductTyp = false
       End If
   End If
   WaitForICallLoading
   selectMortgageProductTyp=blnselectMortgageProductTyp
End Function


'[Set Value in NRIC or Passport field in overview page]
Public Function setCommentTextboxNRIC(strPassport)
   blnsetCommentTextboxNRIC=true
   SG_HELLO_Mortgage_Page.txtPassport().Set(strPassport)
   If Err.Number<>0 Then
       blnsetCommentTextboxNRIC=false
            LogMessage "WARN","Verification","Failed to Set Text Box :NRIC or Passport" ,false
       		blnsetCommentTextboxNRIC=False
   End If
   setCommentTextboxNRIC=blnsetCommentTextboxNRIC
End Function

'[Click On Status in Table for Mortgage applications in overview Page]
Public Function clickStatusMortgageOverview(strMortgageStatusDetails)
	Dim blnclickStatusMortgageOverview:blnclickStatusMortgageOverview = True
	blnclickStatusMortgageOverview = selectTableLink(SG_HELLO_Mortgage_Page.tblMortgageStatusHeader(),SG_HELLO_Mortgage_Page.tblMortgageStatusContent(),strMortgageStatusDetails,"Mortgage status" ,"Status",False,NULL,NULL,NULL)
	WaitForICallLoading
		
	clickStatusMortgageOverview = blnclickStatusMortgageOverview
End Function

'[Verify text product selected is displayed in Application Details page]
Public Function VerifyTextProductSelected(strPrductSelectedValue)
	blnVerifyTextProductSelected = true
	If Not IsNull(strPrductSelectedValue) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleProductSelected(),strPrductSelectedValue, "Product Selected") Then
			blnVerifyTextProductSelected = false
		End If
	End If
	VerifyTextProductSelected = blnVerifyTextProductSelected
End Function

'[Verify text pricing package is displayed in Application Details page]
Public Function VerifyTextPricingPackage(strPricingPackageValue)
	blnVerifyTextPricingPackage = true
	If Not IsNull(strPricingPackageValue) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.welePricingPackage(),strPricingPackageValue, "Pricing Package") Then
			blnVerifyTextPricingPackage = false
		End If
	End If
	VerifyTextPricingPackage = blnVerifyTextPricingPackage
End Function

'[Verify text Number of Applicants is displayed in Application Details page]
Public Function VerifyTextNumberofApplicants(strNumberofApplicantsValue)
	blnVerifyTextNumberofApplicants = true
	If Not IsNull(strNumberofApplicantsValue) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleNumberOfApplicants(),strNumberofApplicantsValue, "Number of Applicants") Then
			blnVerifyTextNumberofApplicants = false
		End If
	End If
	VerifyTextNumberofApplicants = blnVerifyTextNumberofApplicants
End Function

'[Verify text Requested Loan Amount is displayed in Application Details page]
Public Function VerifyTextRequestedLoanAmount(strRequestedLoanAmountValue)
	blnVerifyTextRequestedLoanAmount = true
	If Not IsNull(strRequestedLoanAmountValue) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleRequestedLoanAmount(),strRequestedLoanAmountValue, "Requested Loan Amount") Then
			blnVerifyTextRequestedLoanAmount = false
		End If
	End If
	VerifyTextRequestedLoanAmount = blnVerifyTextRequestedLoanAmount
End Function

'[Verify text Loan Tenure is displayed in Application Details page]
Public Function VerifyTextLoanTenure(strLoanTenureValue)
	blnVerifyTextLoanTenure = true
	If Not IsNull(strLoanTenureValue) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleLoanAmount(),strLoanTenureValue, "Loan Tenure") Then
			blnVerifyTextLoanTenure = false
		End If
	End If
	VerifyTextLoanTenure = blnVerifyTextLoanTenure
End Function


'[Verify text Name of Housing Project is displayed in Application Details page]
Public Function VerifyTextNameofHousingProject(strNameofHousingProjectValue)
	blnVerifyTextNameofHousingProject = true
	If Not IsNull(strNameofHousingProjectValue) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleNameOfHousingProject(),strNameofHousingProjectValue, "Name of Housing Project") Then
			blnVerifyTextNameofHousingProject = false
		End If
	End If
	VerifyTextNameofHousingProject = blnVerifyTextNameofHousingProject
End Function

'[Verify text Purchase Price is displayed in Application Details page]
Public Function VerifyTextPurchasePrice(strPurchasePriceValue)
	blnVerifyTextPurchasePrice = true
	If Not IsNull(strPurchasePriceValue) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.welePurchasePrice(),strPurchasePriceValue, "Purchase Price") Then
			blnVerifyTextPurchasePrice = false
		End If
	End If
	VerifyTextPurchasePrice = blnVerifyTextPurchasePrice
End Function

'[Verify text Date of Purchase is displayed in Application Details page]
Public Function VerifyTextDateofPurchase(strDateofPurchaseValue)
	blnVerifyTextDateofPurchase = true
	If Not IsNull(strDateofPurchaseValue) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleDateofPurchase(),strDateofPurchaseValue, "Date of Purchase") Then
			blnVerifyTextDateofPurchase = false
		End If
	End If
	VerifyTextDateofPurchase = blnVerifyTextDateofPurchase
End Function

'[Verify text Premium Payment is displayed in Application Details page]
Public Function VerifyTextPremiumPayment(strPremiumPaymentValue)
	blnVerifyTextPremiumPayment = true
	If Not IsNull(strPremiumPaymentValue) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.welePremiumPayment(),strPremiumPaymentValue, "Premium Payment") Then
			blnVerifyTextPremiumPayment = false
		End If
	End If
	VerifyTextPremiumPayment = blnVerifyTextPremiumPayment
End Function

'[Verify text Property Type is displayed in Application Details page]
Public Function VerifyTextPropertyType(strPropertyTypeValue)
	blnVerifyTextPropertyType = true
	If Not IsNull(strPropertyTypeValue) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.welePropertyType(),strPropertyTypeValue, "Property Type") Then
			blnVerifyTextPropertyType = false
		End If
	End If
	VerifyTextPropertyType = blnVerifyTextPropertyType
End Function

'[Verify text Property Description is displayed in Application Details page]
Public Function VerifyTextPropertyDescription(strPropertyDescriptionValue)
	blnVerifyTextPropertyDescription = true
	If Not IsNull(strPropertyDescriptionValue) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.welePropertyDescription(),strPropertyDescriptionValue, "Property Description") Then
			blnVerifyTextPropertyDescription = false
		End If
	End If
	VerifyTextPropertyDescription = blnVerifyTextPropertyDescription
End Function

'[Verify text Property Status is displayed in Application Details page]
Public Function VerifyTextPropertyStatus(strPropertyStatusValue)
	blnVerifyTextPropertyStatus = true
	If Not IsNull(strPropertyStatusValue) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.welePropertyStatus(),strPropertyStatusValue, "Property Status") Then
			blnVerifyTextPropertyStatus = false
		End If
	End If
	VerifyTextPropertyStatus = blnVerifyTextPropertyStatus
End Function

'[Verify text Source of funds for Down Payment is displayed in Application Details page]
Public Function VerifyTextSourceoffundsforDownPayment(strSourceoffundsforDownPaymentValue)
	blnVerifyTextSourceoffundsforDownPayment = true
	If Not IsNull(strSourceoffundsforDownPaymentValue) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleSourceOfFunds(),strSourceoffundsforDownPaymentValue, "Source of funds for Down Payment") Then
			blnVerifyTextSourceoffundsforDownPayment = false
		End If
	End If
	VerifyTextSourceoffundsforDownPayment = blnVerifyTextSourceoffundsforDownPayment
End Function

'[Verify text Expected Top Date is displayed in Application Details page]
Public Function VerifyTextExpectedTopDate(strExpectedTopDateValue)
	blnVerifyTextExpectedTopDate = true
	If Not IsNull(strExpectedTopDateValue) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleExpectedTopDate(),strExpectedTopDateValue, "Expected Top Date") Then
			blnVerifyTextExpectedTopDate = false
		End If
	End If
	VerifyTextExpectedTopDate = blnVerifyTextExpectedTopDate
End Function

'[Verify text Property Transaction Type is displayed in Application Details page]
Public Function VerifyTextPropertyTransactionType(strPropertyTransactionType)
	blnVerifyTextPropertyTransactionType = true
	If Not IsNull(strPropertyTransactionType) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.welePropTranType(),strPropertyTransactionType, "Property Transaction Type") Then
			blnVerifyTextPropertyTransactionType = false
		End If
	End If
	VerifyTextPropertyTransactionType = blnVerifyTextPropertyTransactionType
End Function

'[Verify text Use Of Property is displayed in Application Details page]
Public Function VerifyTextUseOfPropertye(strUseOfProperty)
	blnVerifyTextUseOfPropertye = true
	If Not IsNull(strUseOfProperty) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleUseOfPropType(),strUseOfProperty, "Use Of Property") Then
			blnVerifyTextUseOfPropertye = false
		End If
	End If
	VerifyTextUseOfPropertye = blnVerifyTextUseOfPropertye
End Function

'[Verify text No of Storeys is displayed in Application Details page]
Public Function VerifyTextNoofStoreys(strNoofStoreys)
	blnVerifyTextNoofStoreys = true
	If Not IsNull(strNoofStoreys) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleNoStories(),strNoofStoreys, "No. of Storeys") Then
			blnVerifyTextNoofStoreys = false
		End If
	End If
	VerifyTextNoofStoreys = blnVerifyTextNoofStoreys
End Function

'[Verify text Flat Model is displayed in Application Details page]
Public Function VerifyTextFlatModel(strFlatModel)
	blnVerifyTextFlatModel = true
	If Not IsNull(strFlatModel) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleFlatModel(),strFlatModel, "Flat Model") Then
			blnVerifyTextFlatModel = false
		End If
	End If
	VerifyTextFlatModel = blnVerifyTextFlatModel
End Function

'[Verify text Salutation is displayed in Application Details page]
Public Function VerifyTextSalutation(strSalutation)
	blnVerifyTextSalutation = true
	If Not IsNull(strSalutation) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleSalutation(),strSalutation, "Salutation") Then
			blnVerifyTextSalutation = false
		End If
	End If
	VerifyTextSalutation = blnVerifyTextSalutation
End Function

'[Verify text Name is displayed in Application Details page]
Public Function VerifyTextName(strName)
	blnVerifyTextName = true
	If Not IsNull(strName) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleName(),strName, "Name") Then
			blnVerifyTextName = false
		End If
	End If
	VerifyTextName = blnVerifyTextName
End Function

'[Verify text Passport  is displayed in Application Details page]
Public Function VerifyTextPassport(strPassport)
	blnVerifyTextPassport = true
	If Not IsNull(strPassport) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.welePassport(),strPassport, "Passport") Then
			blnVerifyTextPassport = false
		End If
	End If
	VerifyTextPassport = blnVerifyTextPassport
End Function

'[Verify text Date of Birth is displayed in Application Details page]
Public Function VerifyTextDateofBirth(strDOB)
	blnVerifyTextDateofBirth = true
	If Not IsNull(strDOB) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleDOB(),strDOB, "Date of Birth") Then
			blnVerifyTextDateofBirth = false
		End If
	End If
	VerifyTextDateofBirth = blnVerifyTextDateofBirth
End Function

'[Verify text Nationality is displayed in Application Details page]
Public Function VerifyTextNationality(strNationality)
	blnVerifyTextNationalityh = true
	If Not IsNull(strNationality) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleNationality(),strNationality, "Nationality") Then
			blnVerifyTextNationalityh = false
		End If
	End If
	VerifyTextNationality = blnVerifyTextNationalityh
End Function

'[Verify text Ethnicity is displayed in Application Details page]
Public Function VerifyTextEthnicity(strEthnicity)
	blnVerifyTextEthnicity = true
	If Not IsNull(strEthnicity) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleEthnicity(),strEthnicity, "Ethnicity") Then
			blnVerifyTextEthnicity = false
		End If
	End If
	VerifyTextEthnicity = blnVerifyTextEthnicity
End Function

'[Verify text PR Status is displayed in Application Details page]
Public Function VerifyTextPRStatus(strPRStatus)
	blnVerifyTextPRStatus = true
	If Not IsNull(strPRStatus) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.welePRStatus(),strPRStatus, "PR Status") Then
			blnVerifyTextPRStatus = false
		End If
	End If
	VerifyTextPRStatus = blnVerifyTextPRStatus
End Function

'[Verify text Gender is displayed in Application Details page]
Public Function VerifyTextGender(strGender)
	blnVerifyTextGender = true
	If Not IsNull(strGender) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleGender(),strGender, "Gender") Then
			blnVerifyTextGender = false
		End If
	End If
	VerifyTextGender = blnVerifyTextGender
End Function

'[Verify text Marital Status is displayed in Application Details page]
Public Function VerifyTextMaritalStatus(strMaritalStatus)
	blnVerifyTextMaritalStatus = true
	If Not IsNull(strMaritalStatus) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleMaritalStatus(),strMaritalStatus, "Marital Status") Then
			blnVerifyTextMaritalStatus = false
		End If
	End If
	VerifyTextMaritalStatus = blnVerifyTextMaritalStatus
End Function

'[Verify text Residential Status is displayed in Application Details page]
Public Function VerifyTextResidentialStatus(strResidentialStatus)
	blnVerifyTextResidentialStatus = true
	If Not IsNull(strResidentialStatus) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleResedentialStatus(),strResidentialStatus, "Residential Status") Then
			blnVerifyTextResidentialStatus = false
		End If
	End If
	VerifyTextResidentialStatus = blnVerifyTextResidentialStatus
End Function

'[Verify text Education is displayed in Application Details page]
Public Function VerifyTextEducation(strEducation)
	blnVerifyTextEducation = true
	If Not IsNull(strEducation) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleEducation(),strEducation, "Education") Then
			blnVerifyTextEducation = false
		End If
	End If
	VerifyTextEducation = blnVerifyTextEducation
End Function

'[Verify text No Of Dependents is displayed in Application Details page]
Public Function VerifyNoOfDependents(strNoOfDependents)
	blnVerifyNoOfDependents = true
	If Not IsNull(strNoOfDependents) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleNoOfDependents(),strNoOfDependents, "No Of Dependents") Then
			blnVerifyNoOfDependents = false
		End If
	End If
	VerifyNoOfDependents = blnVerifyNoOfDependents
End Function

'[Verify text Mobile Number is displayed in Application Details page]
Public Function VerifyMobileNumber(strMobileNumber)
	blnVerifyMobileNumber = true
	If Not IsNull(strMobileNumber) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleMobileNumber(),strMobileNumber, "Mobile Number") Then
			blnVerifyMobileNumber = false
		End If
	End If
	VerifyMobileNumber = blnVerifyMobileNumber
End Function

'[Verify text Home Number is displayed in Application Details page]
Public Function VerifyHomeNumber(strHomeNumber)
	blnVerifyHomeNumber = true
	If Not IsNull(strHomeNumber) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleHomeNumber(),strHomeNumber, "Home Number") Then
			blnVerifyHomeNumber = false
		End If
	End If
	VerifyHomeNumber = blnVerifyHomeNumber
End Function

'[Verify text Office Number is displayed in Application Details page]
Public Function VerifyOfficeNumber(strOfficeNumber)
	blnVerifyOfficeNumber = true
	If Not IsNull(strOfficeNumber) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleOfficeNumber(),strOfficeNumber, "Office Number") Then
			blnVerifyOfficeNumber = false
		End If
	End If
	VerifyOfficeNumber = blnVerifyOfficeNumber
End Function

'[Verify text Email Address is displayed in Application Details page]
Public Function VerifyEmailAddress(strEmailAddress)
	blnVerifyEmailAddress = true
	If Not IsNull(strEmailAddress) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleEmailAddress(),strEmailAddress, "Email Address") Then
			blnVerifyEmailAddress = false
		End If
	End If
	VerifyEmailAddress = blnVerifyEmailAddress
End Function

'[Verify text Job Status is displayed in Application Details page]
Public Function VerifyJobStatus(strJobStatus)
	blnVerifyJobStatus = true
	If Not IsNull(strJobStatus) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleJobStatus(),strJobStatus, "Job Status") Then
			blnVerifyJobStatus = false
		End If
	End If
	VerifyJobStatus = blnVerifyJobStatus
End Function

'[Verify text Monthly Income is displayed in Application Details page]
Public Function VerifyMonthlyIncome(strMonthlyIncome)
	blnVerifyMonthlyIncome = true
	If Not IsNull(strMonthlyIncome) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleMonthlyIncome(),strMonthlyIncome, "Monthly Income") Then
			blnVerifyMonthlyIncome = false
		End If
	End If
	VerifyMonthlyIncome = blnVerifyMonthlyIncome
End Function

'[Verify text Annual Income is displayed in Application Details page]
Public Function VerifyAnnualIncome(strAnnualIncome)
	blnVerifyAnnualIncome = true
	If Not IsNull(strAnnualIncome) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleAnnualIncome(),strAnnualIncome, "Annual Income") Then
			blnVerifyAnnualIncome = false
		End If
	End If
	VerifyAnnualIncome = blnVerifyAnnualIncome
End Function

'[Verify text Company Name is displayed in Application Details page]
Public Function VerifyCompanyName(strCompanyName)
	blnVerifyCompanyName = true
	If Not IsNull(strCompanyName) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleCompanyName(),strCompanyName, "Company Name") Then
			blnVerifyCompanyName = false
		End If
	End If
	VerifyCompanyName = blnVerifyCompanyName
End Function
'[Verify text Length of Current Employment is displayed in Application Details page]
Public Function VerifyLengthofCurrentEmploymente(strLengthofCurrentEmployment)
	blnVerifyLengthofCurrentEmploymente = true
	If Not IsNull(strLengthofCurrentEmployment) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleLOFCurrentEmployment(),strLengthofCurrentEmployment, "Length of Current Employment") Then
			blnVerifyLengthofCurrentEmploymente = false
		End If
	End If
	VerifyLengthofCurrentEmploymente = blnVerifyLengthofCurrentEmploymente
End Function
'[Verify text Occupation is displayed in Application Details page]
Public Function VerifyOccupation(strOccupation)
	blnVerifyOccupation = true
	If Not IsNull(strOccupation) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleOccupation(),strOccupation, "Occupation") Then
			blnVerifyOccupation = false
		End If
	End If
	VerifyOccupation = blnVerifyOccupation
End Function
'[Verify text Previous Company is displayed in Application Details page]
Public Function VerifyPreviousCompany(strPreviousCompany)
	blnVerifyPreviousCompany = true
	If Not IsNull(strPreviousCompany) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.welePreviousCompany(),strPreviousCompany, "Previous Company") Then
			blnVerifyPreviousCompany = false
		End If
	End If
	VerifyPreviousCompany = blnVerifyPreviousCompany
End Function

'[Verify text Length of Previous Employment is displayed in Application Details page]
Public Function VerifyLengthofPreviousEmployment(strLengthofPreviousEmployment)
	blnVerifyLengthofPreviousEmployment = true
	If Not IsNull(strLengthofPreviousEmployment) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleLenOfPrevCompany(),strLengthofPreviousEmployment, "Length of Previous Employment") Then
			blnVerifyLengthofPreviousEmployment = false
		End If
	End If
	VerifyLengthofPreviousEmployment = blnVerifyLengthofPreviousEmployment
End Function
'[Verify text Previous Occupation is displayed in Application Details page]
Public Function VerifyPreviousOccupation(strPreviousOccupation)
	blnVerifyPreviousOccupation = true
	If Not IsNull(strPreviousOccupation) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.welePreviousOccupation(),strPreviousOccupation, "Previous Occupation") Then
			blnVerifyPreviousOccupation = false
		End If
	End If
	VerifyPreviousOccupation = blnVerifyPreviousOccupation
End Function
'[Verify text Tax Residency is displayed in Application Details page]
Public Function VerifyTaxResidency(strTaxResidency)
	blnVerifyTaxResidency = true
	If Not IsNull(strTaxResidency) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleTaxResidency(),strTaxResidency, "Tax Residency") Then
			blnVerifyTaxResidency = false
		End If
	End If
	VerifyTaxResidency = blnVerifyTaxResidency
End Function
'[Verify text Latest year of Income Tax Assessment is displayed in Application Details page]
Public Function VerifyLatestyearofIncomeTaxAssessment(strLatestyearofIncomeTaxAssessment)
	blnVerifyLatestyearofIncomeTaxAssessment = true
	If Not IsNull(strLatestyearofIncomeTaxAssessment) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleLatestTax(),strLatestyearofIncomeTaxAssessment, "Latest year of Income Tax Assessment") Then
			blnVerifyLatestyearofIncomeTaxAssessment = false
		End If
	End If
	VerifyLatestyearofIncomeTaxAssessment = blnVerifyLatestyearofIncomeTaxAssessment
End Function
'[Verify text Campaign Code is displayed in Application Details page]
Public Function VerifyCampaignCode(strCampaignCode)
	blnVerifyCampaignCode = true
	If Not IsNull(strCampaignCode) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleCampaignCode(),strCampaignCode, "Campaign Code") Then
			blnVerifyCampaignCode = false
		End If
	End If
	VerifyCampaignCode = blnVerifyCampaignCode
End Function
'[Verify text Promo code is displayed in Application Details page]
Public Function VerifyPromocode(strPromocode)
	blnVerifyPromocode = true
	If Not IsNull(strPromocode) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.welePromoCode(),strPromocode, "Promo Code") Then
			blnVerifyPromocode = false
		End If
	End If
	VerifyPromocode = blnVerifyPromocode
End Function
'[Verify text Branch Code is displayed in Application Details page]
Public Function VerifyBranchCode(strBranchCode)
	blnVerifyBranchCode = true
	If Not IsNull(strBranchCode) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleBranchCode(),strBranchCode, "Branch Code") Then
			blnVerifyBranchCode = false
		End If
	End If
	VerifyBranchCode = blnVerifyBranchCode
End Function
'[Verify text Agent is displayed in Application Details page]
Public Function VerifyAgent(strAgent)
	blnVerifyAgent = true
	If Not IsNull(strAgent) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleAgent(),strAgent, "Agent") Then
			blnVerifyAgent = false
		End If
	End If
	VerifyAgent = blnVerifyAgent
End Function
'[Verify text Referral Code is displayed in Application Details page]
Public Function VerifyReferralCode(strReferralCode)
	blnVerifyReferralCode = true
	If Not IsNull(strReferralCode) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleReferralCode(),strReferralCode, "Referral Code") Then
			blnVerifyReferralCode = false
		End If
	End If
	VerifyReferralCode = blnVerifyReferralCode
End Function
'[Verify text Credit Limit is displayed in Application Details page]
Public Function VerifyCreditLimit(strCreditLimit)
	blnVerifyCreditLimit = true
	If Not IsNull(strCreditLimit) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleCL(),strCreditLimit, "Credit Limit") Then
			blnVerifyCreditLimit = false
		End If
	End If
	VerifyCreditLimit = blnVerifyCreditLimit
End Function
'[Verify text iConcierge is displayed in Application Details page]
Public Function VerifyiConcierge(striConcierge)
	blnVerifyiConcierge = true
	If Not IsNull(striConcierge) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleiConcierge(),striConcierge, "iConcierge Application Status") Then
			blnVerifyiConcierge = false
		End If
	End If
	VerifyiConcierge = blnVerifyiConcierge
End Function
'[Verify text LEAPS Application Status is displayed in Application Details page]
Public Function VerifyLEAPSApplicationStatus(strLEAPSApplicationStatus)
	blnVerifyLEAPSApplicationStatus = true
	If Not IsNull(strLEAPSApplicationStatus) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleLEAPSAppStatus(),strLEAPSApplicationStatus, "LEAPS Application Status") Then
			blnVerifyLEAPSApplicationStatus = false
		End If
	End If
	VerifyLEAPSApplicationStatus = blnVerifyLEAPSApplicationStatus
End Function
'[Verify text PWeb Reference Number is displayed in Application Details page]
Public Function VerifyPWebReferenceNumber(strPWebReferenceNumber)
	blnVerifyPWebReferenceNumber = true
	If Not IsNull(strPWebReferenceNumber) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.welePWEBRef(),strPWebReferenceNumber, "PWeb Reference Number") Then
			blnVerifyPWebReferenceNumber = false
		End If
	End If
	VerifyLEAPSApplicationStatus = blnVerifyPWebReferenceNumber
End Function
'[Verify text LEAPS Reference Number is displayed in Application Details page]
Public Function VerifyLEAPSReferenceNumber(strLEAPSReferenceNumber)
	blnVerifyLEAPSReferenceNumber = true
	If Not IsNull(strLEAPSReferenceNumber) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleLEAPSREf(),strLEAPSReferenceNumber, "LEAPS Reference Number") Then
			blnVerifyLEAPSReferenceNumber = false
		End If
	End If
	VerifyLEAPSReferenceNumber = blnVerifyLEAPSReferenceNumber
End Function
'[Verify text Application Case is displayed in Application Details page]
Public Function VerifyApplicationCase(strApplicationCase)
	blnVerifyApplicationCase = true
	If Not IsNull(strApplicationCase) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleAppRef(),strApplicationCase, "Application Case") Then
			blnVerifyApplicationCase = false
		End If
	End If
	VerifyApplicationCase = blnVerifyApplicationCase
End Function
'[Verify text Mailing Postal code is displayed in Application Details page]
Public Function VerifyMailingPostalcode(strMailingPostalcode)
	blnVerifyMailingPostalcode = true
	If Not IsNull(strMailingPostalcode) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleMailingPostalCode(),strMailingPostalcode, "Mailing Postal code") Then
			blnVerifyMailingPostalcode = false
		End If
	End If
	VerifyMailingPostalcode = blnVerifyMailingPostalcode
End Function
'[Verify text Mailing Block is displayed in Application Details page]
Public Function VerifyMailingBlock(strMailingBlock)
	blnVerifyMailingBlock = true
	If Not IsNull(strMailingBlock) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleMailingBlock(),strMailingBlock, "Mailing Block") Then
			blnVerifyMailingBlock = false
		End If
	End If
	VerifyMailingBlock = blnVerifyMailingBlock
End Function
'[Verify text Mailing Unit is displayed in Application Details page]
Public Function VerifyMailingUnit(strMailingUnit)
	blnVerifyMailingUnit = true
	If Not IsNull(strMailingUnit) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleMailingUnit(),strMailingUnit, "Mailing Unit") Then
			blnVerifyMailingUnit = false
		End If
	End If
	VerifyMailingUnit = blnVerifyMailingUnit
End Function
'[Verify text Mailing Level is displayed in Application Details page]
Public Function VerifyMailingLevel(strMailingLevel)
	blnVerifyMailingLevel = true
	If Not IsNull(strMailingLevel) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleMailingLevel(),strMailingLevel, "Mailing Level") Then
			blnVerifyMailingLevel = false
		End If
	End If
	VerifyMailingLevel = blnVerifyMailingLevel
End Function
'[Verify text Mailing Address is displayed in Application Details page]
Public Function VerifyMailingAddress(strMailingAddress)
	blnVerifyMailingAddress = true
	If Not IsNull(strMailingLevel) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleMailingAddress(),strMailingAddress, "Mailing Address") Then
			blnVerifyMailingAddress = false
		End If
	End If
	VerifyMailingAddress = blnVerifyMailingAddress
End Function
'[Verify text Mailing Country is displayed in Application Details page]
Public Function VerifyMailingCountry(strMailingCountry)
	blnVerifyMailingCountry = true
	If Not IsNull(strMailingCountry) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleMailingCountry(),strMailingCountry, "Mailing Country") Then
			blnVerifyMailingCountry = false
		End If
	End If
	VerifyMailingCountry = blnVerifyMailingCountry
End Function
'[Verify text Residential Postal code is displayed in Application Details page]
Public Function VerifyResidentialPostalcode(strResidentialPostalcode)
	blnVerifyResidentialPostalcode = true
	If Not IsNull(strResidentialPostalcode) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleResidentialPostalCode(),strResidentialPostalcode, "Residential Postal code") Then
			blnVerifyResidentialPostalcode = false
		End If
	End If
	VerifyResidentialPostalcode = blnVerifyResidentialPostalcode
End Function
'[Verify text Residential Block is displayed in Application Details page]
Public Function VerifyResidentialBlock(strResidentialBlock)
	blnVerifyResidentialBlock = true
	If Not IsNull(strResidentialBlock) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleResidentialBlock(),strResidentialBlock, "Residential Block") Then
			blnVerifyResidentialBlock = false
		End If
	End If
	VerifyResidentialBlock = blnVerifyResidentialBlock
End Function
'[Verify text Residential Unit is displayed in Application Details page]
Public Function VerifyResidentialUnit(strResidentialUnit)
	blnVerifyResidentialUnit = true
	If Not IsNull(strResidentialUnit) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleResidentialUnit(),strResidentialUnit, "Residential Unit") Then
			blnVerifyResidentialUnit = false
		End If
	End If
	VerifyResidentialUnit = blnVerifyResidentialUnit
End Function

'[Verify text Residential Level is displayed in Application Details page]
Public Function VerifyResidentialLevel(strResidentialLevel)
	blnVerifyResidentialLevel = true
	If Not IsNull(strResidentialLevel) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleResidentialLevel(),strResidentialLevel, "Residential Level") Then
			blnVerifyResidentialLevel = false
		End If
	End If
	VerifyResidentialLevel = blnVerifyResidentialLevel
End Function
'[Verify text Residential Country is displayed in Application Details page]
Public Function VerifyResidentialCountry(strResidentialCountry)
	blnVerifyResidentialCountry = true
	If Not IsNull(strResidentialCountry) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleResidentialCountry(),strResidentialCountry, "Residential Country") Then
			blnVerifyResidentialCountry = false
		End If
	End If
	VerifyResidentialCountry = blnVerifyResidentialCountry
End Function
'[Verify row Data in Table for income details in Application Details Page]
Public Function verifytblContentIncomeDetailsInApplicationDetailsPage(arrIncomeDetailsRowDataList)

   verifytblContentIncomeDetailsInApplicationDetailsPage=verifyTableContentList(SG_HELLO_Mortgage_Page.tblIncomeDetailsHeader(),SG_HELLO_Mortgage_Page.tblIncomeDetailsContent(),arrIncomeDetailsRowDataList,"Income Details",false,NULL,NULL,NULL)
End Function
'[Verify row Data in Table for uploaded documents in Application Details Page]
Public Function verifytblContentUploadedDocumentsInApplicationDetailsPage(arrUploadedDocumentsRowDataList)

   verifytblContentUploadedDocumentsInApplicationDetailsPage=verifyTableContentList(SG_HELLO_Mortgage_Page.tblUploadedDocumentsHeader(),SG_HELLO_Mortgage_Page.tblUploadedDocumentsContent(),arrUploadedDocumentsRowDataList,"Uploaded Documents",false,NULL,NULL,NULL)
End Function
'[Verify row Data in Table for loan details in Application Details Page]
Public Function verifytblContentLoanDetailsInApplicationDetailsPage(arrLoanDetailsRowDataList)

   verifytblContentLoanDetailsInApplicationDetailsPage=verifyTableContentList(SG_HELLO_Mortgage_Page.tblLoanDetailsHeader(),SG_HELLO_Mortgage_Page.tblLoanDetailsContent(),arrLoanDetailsRowDataList,"Loan Details",false,NULL,NULL,NULL)
End Function
'[Verify row Data in Table for card details in Application Details Page]
Public Function verifytblContentCardDetailsInApplicationDetailsPage(arrCardDetailsRowDataList)

   verifytblContentCardDetailsInApplicationDetailsPage=verifyTableContentList(SG_HELLO_Mortgage_Page.tblCardDetailsHeader(),SG_HELLO_Mortgage_Page.tblCardDetailsContent(),arrCardDetailsRowDataList,"Card Details",false,NULL,NULL,NULL)
End Function
'[Click on More link in Application Details Page]
Public Function ClickMoreLink()
 
   SG_HELLO_Mortgage_Page.lnkMore().click
   If Err.Number<>0 Then
       ClickMoreLink=false
            LogMessage "WARN","Verification","Failed to Click Link : More" ,false
       Exit Function
   End If
   ClickMoreLink=true
End Function
'[Verify text Built Up Area is displayed in Application Details page]
Public Function VerifyBuiltUpArea(strBuiltUpArea)
	blnVerifyBuiltUpArea = true
	If Not IsNull(strBuiltUpArea) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleBuiltupArea(),strBuiltUpArea, "Built Up Area") Then
			blnVerifyBuiltUpArea = false
		End If
	End If
	VerifyBuiltUpArea = blnVerifyBuiltUpArea
End Function
'[Verify text Land Area is displayed in Application Details page]
Public Function VerifyLandArea(strLandArea)
	blnVerifyLandArea = true
	If Not IsNull(strLandArea) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleLandArea(),strLandArea, "Land Area") Then
			blnVerifyLandArea = false
		End If
	End If
	VerifyLandArea = blnVerifyLandArea
End Function
'[Verify text Land Tenure Type is displayed in Application Details page]
Public Function VerifyLandTenureType(strLandTenureType)
	blnVerifyLandTenureType = true
	If Not IsNull(strLandTenureType) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleLandTenureType(),strLandTenureType, "Land Tenure Type") Then
			blnVerifyLandTenureType = false
		End If
	End If
	VerifyLandTenureType = blnVerifyLandTenureType
End Function
'[Verify text Remaining Lease Of Property is displayed in Application Details page]
Public Function VerifyRemainingLeaseOfProperty(strRemainingLeaseOfProperty)
	blnVerifyRemainingLeaseOfProperty = true
	If Not IsNull(strRemainingLeaseOfProperty) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleRemainingLeseofProperty(),strRemainingLeaseOfProperty, "Remaining Lease Of Property") Then
			blnVerifyRemainingLeaseOfProperty = false
		End If
	End If
	VerifyRemainingLeaseOfProperty = blnVerifyRemainingLeaseOfProperty
End Function
'[Verify text Conservation Status is displayed in Application Details page]
Public Function VerifyConservationStatus(strConservationStatus)
	blnVerifyConservationStatus = true
	If Not IsNull(strConservationStatus) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleConversationStatus(),strConservationStatus, "Conservation Status") Then
			blnVerifyConservationStatus = false
		End If
	End If
	VerifyConservationStatus = blnVerifyConservationStatus
End Function
'[Verify text Pre War is displayed in Application Details page]
Public Function VerifyPreWar(strPreWar)
	blnVerifyPreWar = true
	If Not IsNull(strPreWar) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.welePreWar(),strPreWar, "Pre War") Then
			blnVerifyPreWar = false
		End If
	End If
	VerifyPreWar = blnVerifyPreWar
End Function
'[Verify text Popup Address is displayed in Application Details page]
Public Function VerifyPopupAddress(strPopupAddress)
	blnVerifyPopupAddress = true
	If Not IsNull(strPopupAddress) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.welePopupAddress(),strPopupAddress, "Popup Address") Then
			blnVerifyPopupAddress = false
		End If
	End If
	VerifyPopupAddress = blnVerifyPopupAddress
End Function
'[Verify text Popup Building is displayed in Application Details page]
Public Function VerifyPopupBuilding(strPopupBuilding)
	blnVerifyPopupBuilding = true
	If Not IsNull(strPopupBuilding) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.welePopupBuilding(),strPopupBuilding, "Popup Building") Then
			blnVerifyPopupBuilding = false
		End If
	End If
	VerifyPopupBuilding = blnVerifyPopupBuilding
End Function
'[Verify text Popup block is displayed in Application Details page]
Public Function VerifyPopupBlock(strPopupBlock)
	blnVerifyPopupBlock = true
	If Not IsNull(strPopupBlock) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.welePopupBlock(),strPopupBlock, "Popup Block") Then
			blnVerifyPopupBlock = false
		End If
	End If
	VerifyPopupBlock = blnVerifyPopupBlock
End Function
'[Verify text Popup Level is displayed in Application Details page]
Public Function VerifyPopupLevel(strPopupLevel)
	blnVerifyPopupLevel = true
	If Not IsNull(strPopupLevel) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.welePopupLevel(),strPopupLevel, "Popup Level") Then
			blnVerifyPopupLevel = false
		End If
	End If
	VerifyPopupLevel = blnVerifyPopupLevel
End Function
'[Verify text Popup Unit is displayed in Application Details page]
Public Function VerifyPopupUnit(strPopupUnit)
	blnVerifyPopupUnit = true
	If Not IsNull(strPopupUnit) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.welePopupUnit(),strPopupUnit, "Popup Unit") Then
			blnVerifyPopupUnit = false
		End If
	End If
	VerifyPopupUnit = blnVerifyPopupUnit
End Function
'[Verify text Popup Postal Code is displayed in Application Details page]
Public Function VerifyPopupPostalCode(strPopupPostalCode)
	blnVerifyPopupPostalCode = true
	If Not IsNull(strPopupPostalCode) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.welePopupPostalCode(),strPopupPostalCode, "Popup Postal Code") Then
			blnVerifyPopupPostalCode = false
		End If
	End If
	VerifyPopupPostalCode = blnVerifyPopupPostalCode
End Function
'[Verify text Popup District is displayed in Application Details page]
Public Function VerifyPopupDistrict(strPopupDistrict)
	blnVerifyPopupDistrict = true
	If Not IsNull(strPopupDistrict) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.welePopupDistrict(),strPopupDistrict, "Popup District") Then
			blnVerifyPopupDistrict = false
		End If
	End If
	VerifyPopupDistrict = blnVerifyPopupDistrict
End Function
'[Verify text Popup State Of Province is displayed in Application Details page]
Public Function VerifyPopupStateOfProvince(strPopupStateOfProvince)
	blnVerifyPopupStateOfProvince = true
	If Not IsNull(strPopupStateOfProvince) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.welePopupStateOfProvince(),strPopupStateOfProvince, "Popup State Of Province") Then
			blnVerifyPopupStateOfProvince = false
		End If
	End If
	VerifyPopupStateOfProvince = blnVerifyPopupStateOfProvince
End Function
'[Verify text Popup Estate is displayed in Application Details page]
Public Function VerifyPopupEstate(strPopupEstate)
	blnVerifyPopupEstate = true
	If Not IsNull(strPopupEstate) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.welePopupeState(),strPopupEstate, "Popup Estate") Then
			blnVerifyPopupEstate = false
		End If
	End If
	VerifyPopupEstate = blnVerifyPopupEstate
End Function
'[Verify text Popup City is displayed in Application Details page]
Public Function VerifyPopupCity(strPopupCity)
	blnVerifyPopupCity = true
	If Not IsNull(strPopupCity) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.welePopupCity(),strPopupCity, "Popup City") Then
			blnVerifyPopupCity = false
		End If
	End If
	VerifyPopupCity = blnVerifyPopupCity
End Function
'[Verify text Popup Country is displayed in Application Details page]
Public Function VerifyPopupCountry(strPopupCountry)
	blnVerifyPopupCountry = true
	If Not IsNull(strPopupCountry) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.welePopupCountry(),strPopupCountry, "Popup Country") Then
			blnVerifyPopupCountry = false
		End If
	End If
	VerifyPopupCountry = blnVerifyPopupCountry
End Function
'[Verify text Popup Existing Financier of Loan is displayed in Application Details page]
Public Function VerifyPopupExistingFinancierofLoan(strPopupExistingFinancierofLoan)
	blnVerifyPopupExistingFinancierofLoan = true
	If Not IsNull(strPopupExistingFinancierofLoan) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.welePopupExstFiancier(),strPopupExistingFinancierofLoan, "Popup Existing Financier of Loan") Then
			blnVerifyPopupExistingFinancierofLoan = false
		End If
	End If
	VerifyPopupExistingFinancierofLoan = blnVerifyPopupExistingFinancierofLoan
End Function
'[Verify text Popup Conduct Of Account is displayed in Application Details page]
Public Function VerifyPopupConductOfAccount(strPopupConductOfAccount)
	blnVerifyPopupConductOfAccount = true
	If Not IsNull(strPopupConductOfAccount) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.welePopupConductOfAccount(),strPopupConductOfAccount, "Popup Conduct Of Account") Then
			blnVerifyPopupConductOfAccount = false
		End If
	End If
	VerifyPopupConductOfAccount = blnVerifyPopupConductOfAccount
End Function
'[Verify text Popup Date of first Disbursement of loan is displayed in Application Details page]
Public Function VerifyPopupDateoffirstDisbursementofloan(strPopupDateoffirstDisbursementofloan)
	blnVerifyPopupDateoffirstDisbursementofloan = true
	If Not IsNull(strPopupDateoffirstDisbursementofloan) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.welePopupFrstDeimbLoanDate(),strPopupDateoffirstDisbursementofloan, "Popup Date of first Disbursement of loan") Then
			blnVerifyPopupDateoffirstDisbursementofloan = false
		End If
	End If
	VerifyPopupDateoffirstDisbursementofloan = blnVerifyPopupDateoffirstDisbursementofloan
End Function
'[Verify text Popup Outstanding Loan Amount is displayed in Application Details page]
Public Function VerifyPopupOutstandingLoanAmount(strPopupOutstandingLoanAmount)
	blnVerifyPopupOutstandingLoanAmount = true
	If Not IsNull(strPopupOutstandingLoanAmount) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.welePopupOutStndLoanAmt(),strPopupOutstandingLoanAmount, "Popup Outstanding Loan Amount") Then
			blnVerifyPopupOutstandingLoanAmount = false
		End If
	End If
	VerifyPopupOutstandingLoanAmount = blnVerifyPopupOutstandingLoanAmount
End Function
'[Verify text Popup Outstanding Loan Period is displayed in Application Details page]
Public Function VerifyPopupOutstandingLoanPeriod(strPopupOutstandingLoanPeriod)
	blnVerifyPopupOutstandingLoanPeriod = true
	If Not IsNull(strPopupOutstandingLoanAmount) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.welePopupOutstandingLoanPeriod(),strPopupOutstandingLoanPeriod, "Popup Outstanding Loan Period") Then
			blnVerifyPopupOutstandingLoanPeriod = false
		End If
	End If
	VerifyPopupOutstandingLoanPeriod = blnVerifyPopupOutstandingLoanPeriod
End Function
'[Verify text Popup No Of Outstanding Loans is displayed in Application Details page]
Public Function VerifyPopupNoOfOutstandingLoans(strPopupOutNoOfOutstandingLoans)
	blnVerifyPopupNoOfOutstandingLoans = true
	If Not IsNull(strPopupOutNoOfOutstandingLoans) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleNoOfOutstndLoans(),strPopupOutNoOfOutstandingLoans, "Popup No Of Outstanding Loans") Then
			blnVerifyPopupNoOfOutstandingLoans = false
		End If
	End If
	VerifyPopupNoOfOutstandingLoans = blnVerifyPopupNoOfOutstandingLoans
End Function
'[Verify text Popup Sold Property is displayed in Application Details page]
Public Function VerifyPopupSoldProperty(strPopupSoldProperty)
	blnVerifyPopupSoldProperty = true
	If Not IsNull(strPopupSoldProperty) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleSoldProperty(),strPopupSoldProperty, "Popup Sold Property") Then
			blnVerifyPopupSoldProperty = false
		End If
	End If
	VerifyPopupSoldProperty = blnVerifyPopupSoldProperty
End Function
'[Verify text Popup Property Count is displayed in Application Details page]
Public Function VerifyPopupPropertyCount(strPopupPropertyCount)
	blnVerifyPopupPropertyCount = true
	If Not IsNull(strPopupPropertyCount) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.welePropertyCount(),strPopupPropertyCount, "Popup Property Count") Then
			blnVerifyPopupPropertyCount = false
		End If
	End If
	VerifyPopupPropertyCount = blnVerifyPopupPropertyCount
End Function
'[Verify text Popup CPF Lump Sum is displayed in Application Details page]
Public Function VerifyPopupCPFLumpSum(strPopupCPFLumpSum)
	blnVerifyPopupCPFLumpSum = true
	If Not IsNull(strPopupCPFLumpSum) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleCPFLumpSum(),strPopupCPFLumpSum, "Popup CPF Lump Sum") Then
			blnVerifyPopupCPFLumpSum = false
		End If
	End If
	VerifyPopupCPFLumpSum = blnVerifyPopupCPFLumpSum
End Function
'[Verify text Popup CPF Grant is displayed in Application Details page]
Public Function VerifyPopupCPFLumpSum(strPopupCPFGrant)
	blnVerifyPopupCPFLumpSum = true
	If Not IsNull(strPopupCPFGrant) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleCPFGrant(),strPopupCPFGrant, "Popup CPF Grant") Then
			blnVerifyPopupCPFLumpSum = false
		End If
	End If
	VerifyPopupCPFLumpSum = blnVerifyPopupCPFLumpSum
End Function
'[Verify text Popup CPF Withdrawal Limit is displayed in Application Details page]
Public Function VerifyPopupCPFWithdrawalLimit(strPopupCPFWithdrawalLimit)
	blnVerifyPopupCPFWithdrawalLimit = true
	If Not IsNull(strPopupCPFWithdrawalLimit) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleCPFWithdrawlLimit(),strPopupCPFWithdrawalLimit, "Popup CPF Withdrawal Limit") Then
			blnVerifyPopupCPFWithdrawalLimit = false
		End If
	End If
	VerifyPopupCPFWithdrawalLimit = blnVerifyPopupCPFWithdrawalLimit
End Function
'[Click on Ok button in Property Details Page]
Public Function ClickOkButtonPropertyDetails()
 
   SG_HELLO_Mortgage_Page.btnPropertyDetailOk().click
   If Err.Number<>0 Then
       ClickOkButtonPropertyDetails=false
            LogMessage "WARN","Verification","Failed to Click Button : Ok" ,false
       Exit Function
   End If
   ClickOkButtonPropertyDetails=true
End Function
'[Click on Event Log link in Application Details Page]
Public Function ClickEventLogLinkAppDetails()
 
   SG_HELLO_Mortgage_Page.lnkEventLog().click
   WaitForICallLoading
   If Err.Number<>0 Then
       ClickEventLogLinkAppDetails=false
            LogMessage "WARN","Verification","Failed to Click Link : Event Log" ,false
       Exit Function
   End If
   ClickEventLogLinkAppDetails=true
End Function
'[Click on Loan Offer Details link in Application Details Page]
Public Function ClickLoanOfferDetailsLinkAppDetails()
 
   SG_HELLO_Mortgage_Page.lnkLoanOfferDetails().click
   WaitForICallLoading
   If Err.Number<>0 Then
       ClickLoanOfferDetailsLinkAppDetails=false
            LogMessage "WARN","Verification","Failed to Click Link : Loan Offer Details" ,false
       Exit Function
   End If
   ClickLoanOfferDetailsLinkAppDetails=true
End Function
'[Verify text Maximum Loan Amount is displayed in Application Details page]
Public Function VerifyMaximumLoanAmount(strMaximumLoanAmount)
	blnVerifyMaximumLoanAmount = true
	If Not IsNull(strMaximumLoanAmount) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleMaxLoanAmount(),strMaximumLoanAmount,"Maximum Loan Amount") Then
			blnVerifyMaximumLoanAmount = false
		End If
	End If
	VerifyMaximumLoanAmount = blnVerifyMaximumLoanAmount
End Function
'[Verify text Maximum Loan term is displayed in Application Details page]
Public Function VerifyMaximumLoanterm(strMaximumLoanterm)
	blnVerifyMaximumLoanterm = true
	If Not IsNull(strMaximumLoanterm) Then
		If Not VerifyInnerText (SG_HELLO_Mortgage_Page.weleMaxLoanTerm(),strMaximumLoanterm,"Maximum Loan term") Then
			blnVerifyMaximumLoanterm = false
		End If
	End If
	VerifyMaximumLoanterm = blnVerifyMaximumLoanterm
End Function
