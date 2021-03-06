'[Click on TD Account link]
Public Function clickLinkTDAccount()
	ClickOnObject HK_CCTR_TDKeyInfo_Page.lnkTDAccountNum(),"TD account link"
	WaitForICallLoading
End Function
'[Verify TD Placement Info link is enabled]
Public Function verifyPlacementTDInfo_Enable()
	VerifyObjectEnabledDisabled HK_CCTR_TDKeyInfo_Page.lnkTDPlacementInfo(),"Enable","Placement Info link"
End Function
'[Verify TD Key Info link is enabled]
Public Function verifyTDInfo_Enable()
	VerifyObjectEnabledDisabled HK_CCTR_TDKeyInfo_Page.lnkTDKeyInfo(),"Enable","Info link"
End Function
'[Verify TD Address and Account Linkage link is enabled]
Public Function verifyTDAddACCLinkInfo_Enable()
	VerifyObjectEnabledDisabled HK_CCTR_TDKeyInfo_Page.lnkTDAddressAccLinkage(),"Enable","Address & Account Linkage link"
End Function
'[Click on TD Address and Account Linkage link]
Public Function clickLinkTDAccount()
	ClickOnObject HK_CCTR_TDKeyInfo_Page.lnkTDAddressAccLinkage(),"Address & Account Linkage link"
	WaitForICallLoading
End Function
'[Click on TD Key Info link]
Public Function clickLinkTDKeyInfo()
	ClickOnObject HK_CCTR_TDKeyInfo_Page.lnkTDKeyInfo(),"Key Info link"
	WaitForICallLoading
End Function
'[Verify TD Pink Panel Details]
Public Function verifyPinkPanelTDAddAccLinkage(strProduct,strcardNumber,strStatus,strAccCardInd,strStaffIndc,strSubProduct,strOpenDate)
	blnverifyPinkPanelTDAddAccLinkage=true
	
	If HK_CCTR_TDKeyInfo_Page.lblTDProduct().Exist(gWaitTime) Then
		LogMessage "RSLT","Verification","Product Label is displayed as expected.",True
		blnverifyPinkPanelTDAddAccLinkage=true
	Else
		LogMessage "WARN","Verifiation","Failed to display Product Label",false
		blnverifyPinkPanelTDAddAccLinkage=false
	End If
	If HK_CCTR_TDKeyInfo_Page.lblTDAccountNumber().Exist(gWaitTime) Then
		LogMessage "RSLT","Verification","Account Number Label is displayed as expected.",True
		blnverifyPinkPanelTDAddAccLinkage=true
	Else
		LogMessage "WARN","Verifiation","Failed to display Account Number Label",false
		blnverifyPinkPanelTDAddAccLinkage=false
	End If
	If HK_CCTR_TDKeyInfo_Page.lblTDStatus().Exist(gWaitTime) Then
		LogMessage "RSLT","Verification","Status Label is displayed as expected.",True
		blnverifyPinkPanelTDAddAccLinkage=true
	Else
		LogMessage "WARN","Verifiation","Failed to display Status Label",false
		blnverifyPinkPanelTDAddAccLinkage=false
	End If
	If HK_CCTR_TDKeyInfo_Page.lblTDAccCardInd().Exist(gWaitTime) Then
		LogMessage "RSLT","Verification","Acct/Card Ind Label is displayed as expected.",True
		blnverifyPinkPanelTDAddAccLinkage=true
	Else
		LogMessage "WARN","Verifiation","Failed to display Acct/Card Ind Label",false
		blnverifyPinkPanelTDAddAccLinkage=false
	End If
	If HK_CCTR_TDKeyInfo_Page.lblTDStaffInd().Exist(gWaitTime) Then
		LogMessage "RSLT","Verification","Staff Salary Crediting Indicator Label is displayed as expected.",True
		blnverifyPinkPanelTDAddAccLinkage=true
	Else
		LogMessage "WARN","Verifiation","Failed to display Staff Salary Crediting Indicator Label",false
		blnverifyPinkPanelTDAddAccLinkage=false
	End If
	If HK_CCTR_TDKeyInfo_Page.lblTDSubProduct().Exist(gWaitTime) Then
		LogMessage "RSLT","Verification","Sub Product Label is displayed as expected.",True
		blnverifyPinkPanelTDAddAccLinkage=true
	Else
		LogMessage "WARN","Verifiation","Failed to display Sub Product Label",false
		blnverifyPinkPanelTDAddAccLinkage=false
	End If
	If HK_CCTR_TDKeyInfo_Page.lblTDBrnachCodeName().Exist(gWaitTime) Then
		LogMessage "RSLT","Verification","Branch Code Name Label is displayed as expected.",True
		blnverifyPinkPanelTDAddAccLinkage=true
	Else
		LogMessage "WARN","Verifiation","Failed to display Branch Code Name Label",false
		blnverifyPinkPanelTDAddAccLinkage=false
	End If
	If HK_CCTR_TDKeyInfo_Page.lblTDCurencyCode().Exist(gWaitTime) Then
		LogMessage "RSLT","Verification","Currency Code Name Label is displayed as expected.",True
		blnverifyPinkPanelTDAddAccLinkage=true
	Else
		LogMessage "WARN","Verifiation","Failed to display Currency Code Name Label",false
		blnverifyPinkPanelTDAddAccLinkage=false
	End If
	If HK_CCTR_TDKeyInfo_Page.lblTDOpenDate().Exist(gWaitTime) Then
		LogMessage "RSLT","Verification","Open Date Label is displayed as expected.",True
		blnverifyPinkPanelTDAddAccLinkage=true
	Else
		LogMessage "WARN","Verifiation","Failed to display Open Date Label",false
		blnverifyPinkPanelTDAddAccLinkage=false
	End If

	
	If Not verifyInnerText_Pattern(HK_CCTR_TDKeyInfo_Page.weleTDProduct(), strProduct, "Product Text") Then
		blnverifyPinkPanelTDAddAccLinkage=false
	End If
	If Not verifyInnerText_Pattern(HK_CCTR_TDKeyInfo_Page.weleTDAccCardNo(), strcardNumber, "Card Number Text") Then
		blnverifyPinkPanelTDAddAccLinkage=false
	End If
	If Not verifyInnerText_Pattern(HK_CCTR_TDKeyInfo_Page.weleTDStatus(), strStatus, "Status Text") Then
		blnverifyPinkPanelTDAddAccLinkage=false
	End If
	If Not verifyInnerText_Pattern(HK_CCTR_TDKeyInfo_Page.weleTDAccCardInd(), strAccCardInd, "Account Card Indicator Text") Then
		blnverifyPinkPanelTDAddAccLinkage=false
	End If
	If Not verifyInnerText_Pattern(HK_CCTR_TDKeyInfo_Page.weleTDStaffInd(), strStaffIndc, "Staff Indicator Text") Then
		blnverifyPinkPanelTDAddAccLinkage=false
	End If
	If Not verifyInnerText_Pattern(HK_CCTR_TDKeyInfo_Page.weleTDSubProduct(), strSubProduct, "Sub Product Text") Then
		blnverifyPinkPanelTDAddAccLinkage=false
	End If
	If Not verifyInnerText_Pattern(HK_CCTR_TDKeyInfo_Page.weleTDOpenDate(), strOpenDate, "Open Date Text") Then
		blnverifyPinkPanelTDAddAccLinkage=false
	End If

	verifyPinkPanelTDAddAccLinkage=blnverifyPinkPanelTDAddAccLinkage
	
End Function
'[Verify TD Address Details]
Public Function verifyTDAddressDetails(strAddAccLinkName,strAddAccType,strAddAccLine1,strAddAccLine2,strAddAccLine3,strAddAccContry)
	blnverifyTDAddressDetails=true
	
	If HK_CCTR_TDKeyInfo_Page.lblTDAddressName().Exist(gWaitTime) Then
		LogMessage "RSLT","Verification","Address Name Label is displayed as expected.",True
		blnverifyTDAddressDetails=true
	Else
		LogMessage "WARN","Verifiation","Failed to display Address Name Label",false
		blnverifyTDAddressDetails=false
	End If
	If HK_CCTR_TDKeyInfo_Page.lblTDAddressType().Exist(gWaitTime) Then
		LogMessage "RSLT","Verification","Address Type Label is displayed as expected.",True
		blnverifyTDAddressDetails=true
	Else
		LogMessage "WARN","Verifiation","Failed to display Address Type Label",false
		blnverifyTDAddressDetails=false
	End If
	If HK_CCTR_TDKeyInfo_Page.lblTDAddressLine1().Exist(gWaitTime) Then
		LogMessage "RSLT","Verification","Address Line 1 is displayed as expected.",True
		blnverifyTDAddressDetails=true
	Else
		LogMessage "WARN","Verifiation","Failed to display Address Line 1 Label",false
		blnverifyTDAddressDetails=false
	End If
	
	If HK_CCTR_TDKeyInfo_Page.lblTDAdressLine2().Exist(gWaitTime) Then
		LogMessage "RSLT","Verification","Address Line 2 is displayed as expected.",True
		blnverifyTDAddressDetails=true
	Else
		LogMessage "WARN","Verifiation","Failed to display Address Line 2 Label",false
		blnverifyTDAddressDetails=false
	End If
	
	If HK_CCTR_TDKeyInfo_Page.lblTDAddressLine3().Exist(gWaitTime) Then
		LogMessage "RSLT","Verification","Address Line 3 is displayed as expected.",True
		blnverifyTDAddressDetails=true
	Else
		LogMessage "WARN","Verifiation","Failed to display Address Line 3 Label",false
		blnverifyTDAddressDetails=false
	End If
	
	If HK_CCTR_TDKeyInfo_Page.lblTDAddresscountry().Exist(gWaitTime) Then
		LogMessage "RSLT","Verification","Address Country Label is displayed as expected.",True
		blnverifyTDAddressDetails=true
	Else
		LogMessage "WARN","Verifiation","Failed to display Address Country Label",false
		blnverifyTDAddressDetails=false
	End If
	
	If Not verifyInnerText_Pattern(HK_CCTR_TDKeyInfo_Page.weleTDAddAccLinkName(), strAddAccLinkName, "Name") Then
		blnverifyTDAddressDetails=false
	End If
	If Not verifyInnerText_Pattern(HK_CCTR_TDKeyInfo_Page.weleTDAddAccAddresType(), strAddAccType, "Address Type") Then
		blnverifyTDAddressDetails=false
	End If
	If Not verifyInnerText_Pattern(HK_CCTR_TDKeyInfo_Page.weleTDAddAccLine1(), strAddAccLine1, "Address Line 1") Then
		blnverifyTDAddressDetails=false
	End If
	If Not verifyInnerText_Pattern(HK_CCTR_TDKeyInfo_Page.weleTDAddAccLine2(), strAddAccLine2, "Address Line 2") Then
		blnverifyTDAddressDetails=false
	End If
	If Not verifyInnerText_Pattern(HK_CCTR_TDKeyInfo_Page.weleTDAddAccLine3(), strAddAccLine3, "Address Line 3") Then
		blnverifyTDAddressDetails=false
	End If
	If Not verifyInnerText_Pattern(HK_CCTR_TDKeyInfo_Page.weleTDAddAccCountry(), strAddAccContry, "Country") Then
		blnverifyTDAddressDetails=false
	End If
	
	verifyTDAddressDetails=blnverifyTDAddressDetails
	
End Function
'[Click Time Deposit account number in customer overview page]
Public Function viewTimeDepositDetails(strlstTimeDepositdetails)
	Dim blnviewTimeDepositDetails:blnviewTimeDepositDetails = True
	
	blnviewCIFDetails=selectTableLink(HK_CCTR_TDKeyInfo_Page.tblTDOverviewHeader(),HK_CCTR_TDKeyInfo_Page.tblTDOverviewContent(),strlstTimeDepositdetails,"Time Deposit" ,"Accounts",false,NULL,NULL,NULL)

	WaitForICallLoading
	viewTimeDepositDetails=blnviewTimeDepositDetails
End Function
'[Verify row Data in Table for TD Key Info]
Public Function verifytblContentTDKeyInfo(arrKeyInfoRowDataList)
   WaitForICallLoading
   verifytblContentTDKeyInfo=verifyTableContentList(HK_CCTR_TDKeyInfo_Page.tblTDKeyInfoHeader(),HK_CCTR_TDKeyInfo_Page.tblTDKeyInfoContent(),arrKeyInfoRowDataList,"Key Info",false,NULL,NULL,NULL)
End Function
'[Verify row Data in Table for TD Placement Info]
Public Function verifytblContentTDPlacementInfo(arrPlacementInfoRowDataList)

   verifytblContentTDPlacementInfo=verifyTableContentList(HK_CCTR_TDKeyInfo_Page.tblPlacementInfoHeader(),HK_CCTR_TDKeyInfo_Page.tblPlacementInfoContent(),arrPlacementInfoRowDataList,"Placement Info",false,NULL,NULL,NULL)
End Function
'[Verify row Data in Table for TD Placement Info Available Balance]
Public Function verifytblContentTDPlacementInfoAvailBal(arrPlacementInfoAvailableBalanceRowDataList)

   verifytblContentTDPlacementInfoAvailBal=verifyTableContentList(HK_CCTR_TDKeyInfo_Page.tblPlacementInfoHeader1(),HK_CCTR_TDKeyInfo_Page.tblPlacementInfoContent1(),arrPlacementInfoAvailableBalanceRowDataList,"Placement Info-Available Balance",false,NULL,NULL,NULL)
End Function
'[Verify row Data in Table for TD Placement Info Placement Status]
Public Function verifytblContentTDPlacementInfoPlacementStatus(arrPlacementInfoPlacementStatusRowDataList)

   verifytblContentTDPlacementInfoPlacementStatus=verifyTableContentList(HK_CCTR_TDKeyInfo_Page.tblPlacementInfoHeader2(),HK_CCTR_TDKeyInfo_Page.tblPlacementInfoContent2(),arrPlacementInfoPlacementStatusRowDataList,"Placement Info-Placement Status",false,NULL,NULL,NULL)
End Function
'[Click Deposit account number in TD Placement Info page]
Public Function clickTDPlacementInfoDepositDetails(strlstDepositdetails)
	Dim blnviewTDPlacementInfoDepositDetails:blnviewTDPlacementInfoDepositDetails = True
	
	blnviewTDPlacementInfoDepositDetails=selectTableLink(HK_CCTR_TDKeyInfo_Page.tblPlacementInfoHeader(),HK_CCTR_TDKeyInfo_Page.tblPlacementInfoContent(),strlstDepositdetails,"Deposit" ,"Deposit No.",false,NULL,NULL,NULL)

	WaitForICallLoading
	clickTDPlacementInfoDepositDetails=blnviewTDPlacementInfoDepositDetails
End Function
'[Verify TD Key Info Account Information]
Public Function verifyTDKeyInfoAccInformation(strKIAcctype,strKIAST,strKIStatus,strKIOD)
	blnverifyTDKeyInfoAccInformation=true
	
	If HK_CCTR_TDKeyInfo_Page.lblTDKeyInfoAccType().Exist(gWaitTime) Then
		LogMessage "RSLT","Verification","Account Type Label is displayed as expected.",True
		blnverifyTDKeyInfoAccInformation=true
	Else
		LogMessage "WARN","Verifiation","Failed to display Account Type Label",false
		blnverifyTDKeyInfoAccInformation=false
	End If
	If HK_CCTR_TDKeyInfo_Page.lblTDKeyInfoAccSignType().Exist(gWaitTime) Then
		LogMessage "RSLT","Verification","Account Signatory Type Label is displayed as expected.",True
		blnverifyTDKeyInfoAccInformation=true
	Else
		LogMessage "WARN","Verifiation","Failed to display Account Sginatory Type Label",false
		blnverifyTDKeyInfoAccInformation=false
	End If
	If HK_CCTR_TDKeyInfo_Page.lblTDKeyInfoAccStatus().Exist(gWaitTime) Then
		LogMessage "RSLT","Verification","Status Label is displayed as expected.",True
		blnverifyTDKeyInfoAccInformation=true
	Else
		LogMessage "WARN","Verifiation","Failed to display Status Label",false
		blnverifyTDKeyInfoAccInformation=false
	End If
	If HK_CCTR_TDKeyInfo_Page.lblTDKeyInfoAccOpeningDate().Exist(gWaitTime) Then
		LogMessage "RSLT","Verification","Opening Date Label is displayed as expected.",True
		blnverifyTDKeyInfoAccInformation=true
	Else
		LogMessage "WARN","Verifiation","Failed to display Opening Date Label",false
		blnverifyTDKeyInfoAccInformation=false
	End If
	If HK_CCTR_TDKeyInfo_Page.lblTDKeyInfoAcClosedDate().Exist(gWaitTime) Then
		LogMessage "RSLT","Verification","Closed Date Label is displayed as expected.",True
		blnverifyTDKeyInfoAccInformation=true
	Else
		LogMessage "WARN","Verifiation","Failed to display Closed Date Label",false
		blnverifyTDKeyInfoAccInformation=false
	End If
	
	
	If Not verifyInnerText_Pattern(HK_CCTR_TDKeyInfo_Page.weleTDKeyInfoAcctype(), strKIAcctype, "Account Type") Then
		blnverifyTDKeyInfoAccInformation=false
	End If
	If Not verifyInnerText_Pattern(HK_CCTR_TDKeyInfo_Page.weleTDKeyInfoAccSignType(), strKIAST, "Account Signatory Type") Then
		blnverifyTDKeyInfoAccInformation=false
	End If
	If Not verifyInnerText_Pattern(HK_CCTR_TDKeyInfo_Page.weleTDKeyInfoStatus(), strKIStatus, "Status Text") Then
		blnverifyTDKeyInfoAccInformation=false
	End If
	If Not verifyInnerText_Pattern(HK_CCTR_TDKeyInfo_Page.weleTDKeyInfoOpeningDate(), strKIOD, "Opening Date") Then
		blnverifyTDKeyInfoAccInformation=false
	End If
	
	verifyTDKeyInfoAccInformation=blnverifyTDKeyInfoAccInformation
	
End Function
'[Click CIF number in Account Holders TD Key Info page]
Public Function clickTDKeyInfoAccountHoldersTable(strlstKeyInfodetails)
	Dim blnclickTDKeyInfoAccountHoldersTable:blnclickTDKeyInfoAccountHoldersTable = True
	
	blnclickTDKeyInfoAccountHoldersTable=selectTableLink(HK_CCTR_TDKeyInfo_Page.tblTDKeyInfoHeader(),HK_CCTR_TDKeyInfo_Page.tblTDKeyInfoContent(),strlstKeyInfodetails,"Key Info" ,"CIF",false,NULL,NULL,NULL)
	WaitForICallLoading
	WaitForICallLoading
	clickTDKeyInfoAccountHoldersTable=blnclickTDKeyInfoAccountHoldersTable
End Function
'[Verify labels and values in Key Info page]
Public Function verifyKeyInfoLabelsAndValues(strlstKeyInfoLablesAndValues)

	Dim blnverifyKeyInfoLabelsAndValues:blnverifyKeyInfoLabelsAndValues = True
	
	blnverifyKeyInfoLabelsAndValues = verifyLabelValuePairs(strlstKeyInfoLablesAndValues)

	verifyKeyInfoLabelsAndValues=blnverifyKeyInfoLabelsAndValues
End Function

