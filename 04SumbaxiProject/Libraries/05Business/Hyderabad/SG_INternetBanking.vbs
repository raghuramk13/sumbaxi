'*****This is auto generated code using code generator please Re-validate ****************
'Dim strRunTimeSRNumber_RC:strRunTimeSRNumber_RC=""  'This Variable is used to Store SR numbers at runtime

'[Click Internet Banking on Customer Overview Screen]
Public Function clicklink_InternetBanking()
   WaitForICallLoading
   bcCustomerOverview.lnkInternetBanking.click
   If Err.Number<>0 Then
       clicklink_InternetBanking=false
       LogMessage "WARN","Verification","Failed to Click Link : Internet Banking" ,false
       Exit Function
   End If
   WaitForICallLoading
   clicklink_InternetBanking=true
End Function

'[Verify Internet Banking Page is Displayed]
Public Function verifyInternetBankingPage()
   InternetBanking.lblProfSystemUserId.exist
   If Err.Number<>0 Then
       verifyInternetBankingPage=false
            LogMessage "WARN","Verification","Internet Banking page not displayed" ,false
       Exit Function
   End If
   WaitForICallLoading
   verifyInternetBankingPage=true
End Function

'[Verify row Data in Table Pin History on IB Screen]
Public Function verifytblPinHistory(lstlstPinHistory)
	If Not IsNull(lstlstPinHistory) Then
		verifytblPinHistory=verifyTableContentList(InternetBanking.tblPinHistorySelectedProfileHeader,InternetBanking.tblPinHistorySelectedProfileContent,lstlstPinHistory,"Pin History" , false,null ,null,null)
	End If   
End Function

'[Verify row Data in Third Party Payee Arrangement Table on IB Screen]
Public Function verifytblThirdPartyPayeeArgmt(lstlstThirdPartyPayeeArgmt)  
   verifytblThirdPartyPayeeArgmt=verifyTableContentList(InternetBanking.tblPayeeArgmtHeader,InternetBanking.tblPayeeArgmtContent,lstlstThirdPartyPayeeArgmt,"Third Party Payee Arrangement" , false,null ,null,null)
End Function

'[Verify row Data in Inter Bank Payee Arrangement Table on IB Screen]
Public Function verifytblInterBankPayeeArgmt(lstlstInterBankPayeeArgmt) 
   verifytblInterBankPayeeArgmt=verifyTableContentList(InternetBanking.tblInterBankPayeeArgmtHeader,InternetBanking.tblInterBankPayeeArgmtContent,lstlstInterBankPayeeArgmt,"Inter Bank Payee Arrangement" , false,null ,null,null)
End Function

'[Verify row Data in Inter Bank Funds Transfer Table on IB Screen]
Public Function verifytblInterBankFundsTnsfr(lstlstInterBankFundsTnsfr) 
  WaitForICallLoading	
   verifytblInterBankFundsTnsfr=verifyTableContentList(InternetBanking.tblTransactionDetailsHeader,InternetBanking.tblTransactionDetailsContent,lstlstInterBankFundsTnsfr,"InterBankFundsTransfer",false,NULL,NULL,NULL)
End Function

'[Verify row Data in Todays Transaction Table on IB Screen]
Public Function verifytblTodaysTransaction(lstlstTodaysTransaction) 
WaitForICallLoading
   verifytblTodaysTransaction=verifyTableContentList(InternetBanking.tblTodaysTrnsDetailsHeader,InternetBanking.tblTodaysTrnsDetailsContent,lstlstTodaysTransaction,"Todays Transaction" , false,null ,null,null)
End Function

'[Verify row Data in Future Dated Transfer Table on IB Screen]
Public Function verifytblFutureDatedTnsfr(lstlstFutureDtdTnsfr)   
   verifytblFutureDatedTnsfr=verifyTableContentList(InternetBanking.tblFuturedatedTrnsDetailsHeader,InternetBanking.tblFuturedatedTrnsDetailsContent,lstlstFutureDtdTnsfr,"Future Dated Transfer" , false,null ,null,null)
End Function

'[Verify row Data in Application Status Table on IB Screen]
Public Function verifytblApplicationStatus(lstlstApplicationStatus) 
   verifytblApplicationStatus=verifyTableContentList(InternetBanking.tblApplStatusHeader,InternetBanking.tblApplStatusContent,lstlstApplicationStatus,"Application Status" , false,null ,null,null)
End Function

'[Verify Customer Profile field values on IB Screen displayed as]
Public Function verifyCustomerProfile(strSystemUserId,strUserIdIB, strUserIdIchangedDate,strProfileStatus,strReason,strClosedDate,strTransactionDate )
   bverifyCustomerProfile=true   
   If Not IsNull(strSystemUserId) Then
       If Not VerifyInnerText (InternetBanking.lblProfSystemUserId(), strSystemUserId, "SystemUserId")Then
           bverifyCustomerProfile=false
       End If
   End If 
   If Not IsNull(strUserIdIB) Then
       If Not VerifyInnerText (InternetBanking.lblProfUserIdIB(), strUserIdIB, "User Id")Then
           bverifyCustomerProfile=false
       End If
   End If   
   If Not IsNull(strUserIdIchangedDate) Then
       If Not VerifyInnerText (InternetBanking.lblProfUserIdIchangedDate(), strUserIdIchangedDate, "UserIdIchangedDate")Then
           bverifyCustomerProfile=false
       End If
   End If   
   If Not IsNull(strProfileStatus) Then
       If Not VerifyInnerText (InternetBanking.lblProfProfileStatus(), strProfileStatus, "ProfileStatus")Then
           bverifyCustomerProfile=false
        End If
   End If
   If Not IsNull(strReason) Then
       If Not VerifyInnerText (InternetBanking.lblProfReason(), strReason, "Reason")Then
           bverifyCustomerProfile=false
       End If
   End If  
   If Not IsNull(strClosedDate) Then
       If Not VerifyInnerText (InternetBanking.lblProfClosedDate(), strClosedDate, "ClosedDate")Then
           bverifyCustomerProfile=false
       End If
   End If   
   If Not IsNull(strTransactionDate) Then
       If Not VerifyInnerText (InternetBanking.lblProfTransactionDate(), strTransactionDate, "Transaction Date")Then
           bverifyCustomerProfile=false
       End If
   End If   
   WaitForICallLoading
   verifyCustomerProfile=bverifyCustomerProfile
End Function

'[Verify IBanking Message field values on IB Screen displayed as]
Public Function verifyIBankingMessage(strPhoneStatus, strMobileNo,strLastChangedDate)
   bverifyIBankingMessage=true   
   If Not IsNull(strPhoneStatus) Then
       If Not VerifyInnerText (InternetBanking.lblProfPhoneStatus(), strPhoneStatus, "PhoneStatus")Then
       bverifyIBankingMessage=false
       End If
   End If   
   If Not IsNull(strMobileNo) Then
       If Not VerifyInnerText (InternetBanking.lblProfMobileNo(), strMobileNo, "MobileNo")Then
       bverifyIBankingMessage=false 
       End If
   End If   
   If Not IsNull(strLastChangedDate) Then
       If Not VerifyInnerText (InternetBanking.lblProfLastChangedDate(), strLastChangedDate, "LastChangedDate")Then
       bverifyIBankingMessage=false
       End If
   End If   
   WaitForICallLoading
   verifyIBankingMessage=bverifyIBankingMessage
End Function

'[Verify PIN Information field values on IB Screen displayed as]
Public Function verifyPinInformation(strFirstPINGen, strPinIssucedVia, strModeOfApplication, strPrimaryAccountNo)
   bverifyPinInformation=true  
   If Not IsNull(strFirstPINGen) Then
       If Not VerifyInnerText (InternetBanking.lblProfFirstPINGen(), strFirstPINGen, "FirstPINGen")Then
       bverifyPinInformation=false
       End If
   End If   
   If Not IsNull(strPinIssucedVia) Then
       If Not VerifyInnerText (InternetBanking.lblProfPinIssuedVia(), strPinIssucedVia, "PinIssucedVia")Then
       bverifyPinInformation=false
       End If
   End If   
   If Not IsNull(strModeOfApplication) Then
       If Not VerifyInnerText (InternetBanking.lblProfModeOfApplication(), strModeOfApplication, "ModeOfApplication")Then
       bverifyPinInformation=false
       End If
   End If  
   If Not IsNull(strPrimaryAccountNo) Then
       If Not VerifyInnerText (InternetBanking.lblProfPrimaryAccountNo(), strPrimaryAccountNo, "PrimaryAccountNo")Then
       bverifyPinInformation=false
       End If
   End If   
   WaitForICallLoading
   verifyPinInformation=bverifyPinInformation
End Function

'[Click on left menu link in Internet Banking Page]
Public Function ClickLeftMenulink_IB(strleftmenu)
  bClickLeftMenulink_IB = True 
   If Not IsNull(strleftmenu) Then
   	  If strleftmenu = "Profile" Then
   	  	 InternetBanking.lnkProfile.click 	
   	  ElseIf strleftmenu = "Third Party Payee Arrangement" Then 
   	     InternetBanking.lnkPayeeArrangement.click
      ElseIf strleftmenu = "Inter Bank Payee Arrangement" Then 
   	     InternetBanking.lnkInterBankPayeeArrangement.click	  	  	
      ElseIf strleftmenu = "Inter Bank Funds Transfer" Then 
   	     InternetBanking.lnkInterBankFundsTransfer.click
   	  ElseIf strleftmenu = "Todays Transaction" Then 
   	     InternetBanking.lnkTodaysTransaction.click
   	  ElseIf strleftmenu = "Future Dated Funds Transfer" Then 
   	     InternetBanking.lnkfutureDatTransfer.click   	  	
   	  ElseIf strleftmenu = "Application Status" Then 
   	     InternetBanking.lnkApplicationStatus.click  
   	  End If 
   End If  
   If Err.Number<>0 Then
       bClickLeftMenulink_IB=false
       LogMessage "WARN","Verification","Failed to Click Link from left menu: "&strleftmenu&"" ,False
       Exit Function
   End If
ClickLeftMenulink_IB = bClickLeftMenulink_IB
End Function

'[Verify Account details in Internet Banking Page displayed]
Public Function verifyPayeeArrangement_IB(strNoofActiveAccts, strAvailLimit, strTrasnferLimit, strUsedLimit)
   bverifyPayeeArrangementfields=true 
   If Not IsNull(strNoofActiveAccts) Then
       If Not VerifyInnerText (InternetBanking.lblNoofActiveAccounts(), strNoofActiveAccts, "No. of Active Accounts")Then
       bverifyPayeeArrangementfields=false
       End If
   End If   
   If Not IsNull(strAvailLimit) Then
       If Not VerifyInnerText (InternetBanking.lblavailablelimit(), strAvailLimit, "Available Limit")Then
       bverifyPayeeArrangementfields=false
       End If
   End If   
    If Not IsNull(strTrasnferLimit) Then
       If Not VerifyInnerText (InternetBanking.lblTransferlimit(), strTrasnferLimit, "Transfer Limit")Then
       bverifyPayeeArrangementfields=false
       End If
   End If   
    If Not IsNull(strUsedLimit) Then
       If Not VerifyInnerText (InternetBanking.lblUsedLimit(), strUsedLimit, "Used Limit")Then
       bverifyPayeeArrangementfields=false
       End If
   End If   
   WaitForICallLoading
   verifyPayeeArrangement_IB=bverifyPayeeArrangementfields
End Function

'[Click More Info View hyperlink on IB Third Party Payee Arrangement Screen]
Public Function viewPayeeArrgmtMoreInfo(lstPayeeArrgmtMoreInfo)
  Dim bviewPayeeArrgmtMoreInfo: 	viewPayeeArrgmtMoreInfo = True
  bviewPayeeArrgmtMoreInfo=selectTableLink(InternetBanking.tblPayeeArgmtHeader,InternetBanking.tblPayeeArgmtContent,lstPayeeArrgmtMoreInfo,"Payee Arrangement" ,"More Info",false,null ,null ,null)
  viewPayeeArrgmtMoreInfo=bviewPayeeArrgmtMoreInfo
End Function

'[Click Account Number hyperlink on IB Third Party Payee Arrangement Screen]
Public Function ClickAccountNoLink_IBPayeeArrangement(lstPayeeArrgmtMoreInfo)
  bClickAccountNoLink = True 
  bClickAccountNoLink = selectTableLink(InternetBanking.tblPayeeArgmtHeader,InternetBanking.tblPayeeArgmtContent,lstPayeeArrgmtMoreInfo,"Payee Arrangement" ,"Account No",false,null ,null ,null)
  ClickAccountNoLink_IBPayeeArrangement = bClickAccountNoLink
End Function

'[Verify Payee Arrangement Details pop up for Third Party Payee Arrangement]
Public Function verifyPayeeArrgmtDetails(strTransactionRef, strSystemRef, strSystemID)
   bverifyPayeeArrgmtDetails=true 
   If Not IsNull(strTransactionRef) Then
       If Not VerifyInnerText (InternetBanking.lblTransactionRef(), strTransactionRef, "Transaction Ref")Then
       bverifyPayeeArrgmtDetails=false       
       End If
   End If   
   If Not IsNull(strSystemRef) Then
       If Not VerifyInnerText (InternetBanking.lblpayeeargmtSystemRef(), strSystemRef, "System Ref")Then
       bverifyPayeeArrgmtDetails=false
       End If
   End If   
   If Not IsNull(strSystemID) Then
       If Not VerifyInnerText (InternetBanking.lblpayeeargmtSystemID(), strSystemID, "System ID")Then
       bverifyPayeeArrgmtDetails=false
       End If
   End If  
   InternetBanking.btnOK.click   
   WaitForICallLoading
   verifyPayeeArrgmtDetails=bverifyPayeeArrgmtDetails
End Function

'[Click More Info View hyperlink on IB InterBank Payee Arrangement Screen]
Public Function viewInterBankPayeeArrgmtMoreInfo(lstInterBankPayeeArrgmtMoreInfo)
  Dim bviewInterBankPayeeArrgmtMoreInfo:viewInterBankPayeeArrgmtMoreInfo = True
  bviewInterBankPayeeArrgmtMoreInfo=selectTableLink(InternetBanking.tblInterBankPayeeArgmtHeader,InternetBanking.tblInterBankPayeeArgmtContent,lstInterBankPayeeArrgmtMoreInfo,"Inter Bank Payee Arrangement","More Info",false,null ,null ,null)
  viewInterBankPayeeArrgmtMoreInfo=bviewInterBankPayeeArrgmtMoreInfo
End Function

'[Verify Transfer Arrangement Details pop up for Inter Bank Payee Arrangement]
Public Function verifyInterBankPayeeArrgmtDetails(strIBPBranchcode, strIBPG3ACNO, strIBPInitials, strIBPSystemID, strIBPTransRef)
   bverifyInterBankPayeeArrgmtDetails=true 
   If Not IsNull(strIBPBranchcode) Then
       If Not VerifyInnerText (InternetBanking.lblInterBankPayeeArgmBranchcode(), strIBPBranchcode, "Branch Code")Then
       bverifyInterBankPayeeArrgmtDetails=false       
       End If
   End If   
   If Not IsNull(strIBPG3ACNO) Then
       If Not VerifyInnerText (InternetBanking.lblInterBankPayeeArgmG3ACNO(), strIBPG3ACNO, "G3 ACNO")Then
       bverifyInterBankPayeeArrgmtDetails=false 
       End If
   End If   
   If Not IsNull(strIBPSystemID) Then
       If Not VerifyInnerText (InternetBanking.lblInterBankPayeeArgmSystemID(), strIBPSystemID, "System ID")Then
       bverifyInterBankPayeeArrgmtDetails=false
       End If
   End If   
   If Not IsNull(strIBPInitials) Then
       If Not VerifyInnerText (InternetBanking.lblInterBankPayeeArgmInitials(), strIBPInitials, "Initials")Then
       bverifyInterBankPayeeArrgmtDetails=false
       End If
   End If   
   If Not IsNull(strIBPTransRef) Then
       If Not VerifyInnerText (InternetBanking.lblInterBankPayeeArgmTransRef(), strIBPTransRef, "Transaction Ref")Then
		bverifyInterBankPayeeArrgmtDetails=false    
       End If
   End If   
   InternetBanking.btnOK.click   
   WaitForICallLoading
   verifyInterBankPayeeArrgmtDetails=bverifyInterBankPayeeArrgmtDetails
End Function

'[Click From Account hyperlink on IB Future Dated Trnsfr Screen]
Public Function viewAcctDtlFutureDatedFundsTnsfr(lstAccntDtlFutureDated)
  Dim bviewAcctDtlFutureDatedFundsTnsfr:	viewAcctDtlFutureDatedFundsTnsfr = True
  bviewAcctDtlFutureDatedFundsTnsfr=selectTableLink(InternetBanking.tblFuturedatedTrnsDetailsHeader,InternetBanking.tblFuturedatedTrnsDetailsContent,lstAccntDtlFutureDated,"Account Overview" ,"From Account",false,null ,null ,null)
  WaitForICallLoading
  viewAcctDtlFutureDatedFundsTnsfr=bviewAcctDtlFutureDatedFundsTnsfr
End Function

'[Click Transaction Ref hyperlink on IB Future Dated Trnsfr Screen]
Public Function viewTrnsDtlFutureDatedFundsTnsfr(lstTrnsDtlFutureDated)
  Dim bviewTrnsDtlFutureDatedFundsTnsfr:	viewTrnsDtlFutureDatedFundsTnsfr = True
  bviewTrnsDtlFutureDatedFundsTnsfr=selectTableLink(InternetBanking.tblFuturedatedTrnsDetailsHeader,InternetBanking.tblFuturedatedTrnsDetailsContent,lstTrnsDtlFutureDated,"Transfer Details" ,"Transaction Ref",false,null ,null ,null)
  WaitForICallLoading
  viewTrnsDtlFutureDatedFundsTnsfr=bviewTrnsDtlFutureDatedFundsTnsfr
End Function
		
'[Verify Transaction Details pop up for Future Dated Transfer]
Public Function verifyTransDtlFutureDatedTrnsfr(strBankCode, strBranchCodeFD, strFutureTnsfrDate, strG3Account, strSystemId, strSystemRef)
   bverifyTransDtlFutureDatedTrnsfr=true  
   If Not IsNull(strBankCode) Then
       If Not VerifyInnerText (InternetBanking.lblBankCode(), strBankCode, "strBankCode")Then
           bverifyTransDtlFutureDatedTrnsfr=false
       End If
   End If   
   If Not IsNull(strBranchCodeFD) Then
       If Not VerifyInnerText (InternetBanking.lblBranchCodeFD(), strBranchCodeFD, "BranchCodeFD")Then
           bverifyTransDtlFutureDatedTrnsfr=false
       End If
   End If   
   If Not IsNull(strFutureTnsfrDate) Then
       If Not VerifyInnerText (InternetBanking.lblFutureTnsfrDate(), strFutureTnsfrDate, "FutureTnsfrDate")Then
           bverifyTransDtlFutureDatedTrnsfr=false
       End If
   End If   
   If Not IsNull(strG3Account) Then
       If Not VerifyInnerText (InternetBanking.lblG3Account(), strG3Account, "G3Account")Then
           bverifyTransDtlFutureDatedTrnsfr=false
       End If
   End If   
   If Not IsNull(strSystemId) Then
       If Not VerifyInnerText (InternetBanking.lblSystemId(), strSystemId, "SystemId")Then
           bverifyTransDtlFutureDatedTrnsfr=false
       End If
   End If   
   If Not IsNull(strSystemRef) Then
       If Not VerifyInnerText (InternetBanking.lblSystemRef(), strSystemRef, "SystemRef")Then
           bverifyTransDtlFutureDatedTrnsfr=false
       End If
   End If   
   InternetBanking.btnOK.click   
   WaitForICallLoading
   verifyTransDtlFutureDatedTrnsfr=bverifyTransDtlFutureDatedTrnsfr
End Function

'[Verify Account Number field value on Account Overview]
Public Function verifyAccountOverview(strAccntNo)
   bverifyAccountOverview=true  
   If Not IsNull(strAccntNo) Then
       If Not VerifyInnerText (InternetBanking.lblAccountNumber(), strAccntNo, "Account/CardNo")Then
       bverifyAccountOverview=false 
       End If
   End If
   WaitForICallLoading
   verifyAccountOverview=bverifyAccountOverview
End Function

'[Click From Account hyperlink on IB Inter Bank Trnsfr Screen]
Public Function viewAcctDtlInterBankTnsfr(lstAccntDtlInterBank)
  Dim bviewAcctDtlInterBankTnsfr:	viewAcctDtlInterBankTnsfr = True
  bviewAcctDtlInterBankTnsfr=selectTableLink(InternetBanking.tblTransactionDetailsHeader,InternetBanking.tblTransactionDetailsContent,lstAccntDtlInterBank,"Account Overview" ,"From Account",false,null ,null ,null)
  WaitForICallLoading
  viewAcctDtlInterBankTnsfr=bviewAcctDtlInterBankTnsfr
End Function

'[Click Transaction Ref hyperlink on IB Inter Bank Trnsfr Screen]
Public Function viewTrnsDtlInterBankTnsfr(lstTrnsDtlInterBank)
  Dim bviewTrnsDtlInterBankTnsfr:	viewTrnsDtlInterBankTnsfr = True
  bviewTrnsDtlInterBankTnsfr=selectTableLink(InternetBanking.tblTransactionDetailsHeader,InternetBanking.tblTransactionDetailsContent,lstTrnsDtlInterBank,"Transfer Details" ,"Transaction Ref",false,null ,null ,null)
  WaitForICallLoading
  viewTrnsDtlInterBankTnsfr=bviewTrnsDtlInterBankTnsfr
End Function

'[Verify Transaction Details pop up for Inter Bank Funds Transfer]
Public Function verifyTransDtlInterBankTrnsfr(strBranchCode, strChannelId, strGIRORef, strInitials, strToBank)
   bverifyTransDtlInterBankTrnsfr=true  
   If Not IsNull(strBranchCode) Then
       If Not VerifyInnerText (InternetBanking.lblBranchCode(), strBranchCode, "strBranchCode")Then
           bverifyTransDtlInterBankTrnsfr=false
       End If
   End If   
   If Not IsNull(strChannelId) Then
       If Not VerifyInnerText (InternetBanking.lblChannelId(), strChannelId, "strChannelId")Then
           bverifyTransDtlInterBankTrnsfr=false
       End If
   End If   
   If Not IsNull(strGIRORef) Then
       If Not VerifyInnerText (InternetBanking.lblGIRORef(), strGIRORef, "strGIRORef")Then
           bverifyTransDtlInterBankTrnsfr=false
       End If
   End If  
   If Not IsNull(strInitials) Then
       If Not VerifyInnerText (InternetBanking.lblInitials(), strInitials, "strInitials")Then
           bverifyTransDtlInterBankTrnsfr=false
       End If
   End If   
   If Not IsNull(strToBank) Then
       If Not VerifyInnerText (InternetBanking.lblToBank(), strToBank, "strToBank")Then
           bverifyTransDtlInterBankTrnsfr=false
       End If
   End If   
   InternetBanking.btnOK.click   
   WaitForICallLoading
   verifyTransDtlInterBankTrnsfr=bverifyTransDtlInterBankTrnsfr
End Function

'[Click Record No hyperlink on IB Todays Transaction Screen]
Public Function viewTrnsDtlTdysTxn(lstTrnsDtlTdysTxn)
  Dim bviewTrnsDtlTdysTxn:	viewTrnsDtlTdysTxn = True
  bviewTrnsDtlTdysTxn=selectTableLink(InternetBanking.tblTodaysTrnsDetailsHeader,InternetBanking.tblTodaysTrnsDetailsContent,lstTrnsDtlTdysTxn,"Transfer Details" ,"Record Number",false,null ,null ,null)
  WaitForICallLoading
  viewTrnsDtlTdysTxn=bviewTrnsDtlTdysTxn
End Function

'[Verify Transaction Info pop up for Todays Transaction]
Public Function verifyTransInfoTdysTxn(strCurrTdysTxn,strForeignAmountTdysTxn,strFromBalanceTdysTxn,strModeTdysTxn,strServiceChrgsTdysTxn,strSIDateTdysTxn,strSIFreqdayTdysTxn,strSIFreqPeriodTdysTxn,strSysIdTdysTxn,strToBalanceTdysTxn,strTxnDtlsTdysTxn,strUIDTdysTxn,strErrorMessage)
   bverifyTransInfoTdysTxn=true   
   If Not IsNull(strCurrTdysTxn) Then
       If Not VerifyInnerText (InternetBanking.lblCurrTdysTxn(), strCurrTdysTxn, "strCurrTdysTxn")Then
       bverifyTransInfoTdysTxn=false
       End If
   End If   
   If Not IsNull(strForeignAmountTdysTxn) Then
       If Not VerifyInnerText (InternetBanking.lblForeignAmountTdysTxn(), strForeignAmountTdysTxn, "strForeignAmountTdysTxn")Then
       bverifyTransInfoTdysTxn=false
       End If
   End If   
   If Not IsNull(strFromBalanceTdysTxn) Then
       If Not VerifyInnerText (InternetBanking.lblFromBalanceTdysTxn(), strFromBalanceTdysTxn, "strFromBalanceTdysTxn")Then
           bverifyTransInfoTdysTxn=false
       End If
   End If   
   If Not IsNull(strModeTdysTxn) Then
       If Not VerifyInnerText (InternetBanking.lblModeTdysTxn(), strModeTdysTxn, "strModeTdysTxn")Then
           bverifyTransInfoTdysTxn=false
       End If
   End If   
   If Not IsNull(strServiceChrgsTdysTxn) Then
       If Not VerifyInnerText (InternetBanking.lblServiceChrgsTdysTxn(), strServiceChrgsTdysTxn, "strServiceChrgsTdysTxn")Then
       bverifyTransInfoTdysTxn=false
       End If
   End If   
   If Not IsNull(strSIDateTdysTxn) Then
       If Not VerifyInnerText (InternetBanking.lblSIDateTdysTxn(), strSIDateTdysTxn, "strSIDateTdysTxn")Then
       bverifyTransInfoTdysTxn=false        
       End If
   End If   
   If Not IsNull(strSIFreqdayTdysTxn) Then
       If Not VerifyInnerText (InternetBanking.lblSIFreqdayTdysTxn(), strSIFreqdayTdysTxn, "strSIFreqdayTdysTxn")Then
       bverifyTransInfoTdysTxn=false    
       End If
   End If  
   If Not IsNull(strSIFreqPeriodTdysTxn) Then
       If Not VerifyInnerText (InternetBanking.lblSIFreqPeriodTdysTxn(), strSIFreqPeriodTdysTxn, "strSIFreqPeriodTdysTxn")Then
       bverifyTransInfoTdysTxn=false       
       End If
   End If 
   If Not IsNull(strSysIdTdysTxn) Then
       If Not VerifyInnerText (InternetBanking.lblSysIdTdysTxn(), strSysIdTdysTxn, "strSysIdTdysTxn")Then
       bverifyTransInfoTdysTxn=false
       End If
   End If  
   If Not IsNull(strToBalanceTdysTxn) Then
       If Not VerifyInnerText (InternetBanking.lblToBalanceTdysTxn(), strToBalanceTdysTxn, "strToBalanceTdysTxn")Then
       bverifyTransInfoTdysTxn=false
       End If
   End If   
   If Not IsNull(strTxnDtlsTdysTxn) Then
   	   strTxnDtlsTdysTxn = Replace(strTxnDtlsTdysTxn,"$","=")
   	   strTxnDtlsTdysTxn = Replace(strTxnDtlsTdysTxn,"@",":")	
       If Not VerifyInnerText (InternetBanking.lblTxnDtlsTdysTxn(), strTxnDtlsTdysTxn, "strTxnDtlsTdysTxn")Then
       bverifyTransInfoTdysTxn=false
       End If
   End If  
   If Not IsNull(strUIDTdysTxn) Then
       If Not VerifyInnerText (InternetBanking.lblUIDTdysTxn(), strUIDTdysTxn, "strUIDTdysTxn")Then
       bverifyTransInfoTdysTxn=false
       End If
   End If   
   If Not IsNull(strErrorMessage) Then
       If Not VerifyInnerText (InternetBanking.lblErrorMessage(), strErrorMessage, "Error Message")Then
       bverifyTransInfoTdysTxn=false
       End If
   End If 
   InternetBanking.btnOK.click  
   WaitForICallLoading
   verifyTransInfoTdysTxn=bverifyTransInfoTdysTxn
End Function

'[Click Record Number hyperlink on IB Application Status Screen]
Public Function ViewApplicationdetails(lstApplicationdetails)
  bViewApplicationdetails = True
  bViewApplicationdetails=selectTableLink(InternetBanking.tblApplStatusHeader,InternetBanking.tblApplStatusContent,lstApplicationdetails,"Application Details" ,"Record No",false,null ,null ,null)
  ViewApplicationdetails = bViewApplicationdetails
End Function

'[Verify Application details displayed in the pop up]
Public Function VerifyApplicationdetails(StrPryAccNo, StrPrddescription, strTransactiondetails,strErrormsg)
   bVerifyApplicationdetails = True 
   If Not IsNull(StrPryAccNo) Then
       If Not VerifyInnerText (InternetBanking.lblPrimaryAccNo(), StrPryAccNo, "Primary Account Number")Then
       bVerifyApplicationdetails=false
       End If
   End If  
   If Not IsNull(StrPrddescription) Then
       If Not VerifyInnerText (InternetBanking.lblProductDescription(), StrPrddescription, "Product Description")Then
       bVerifyApplicationdetails=false
       End If
   End If   
   If Not IsNull(strTransactiondetails) Then
   	   strTransactiondetails = Replace(strTransactiondetails,"@",":")
       If Not VerifyInnerText (InternetBanking.lblTransactionDetails(), strTransactiondetails, "Transaction Details")Then
       bVerifyApplicationdetails=false
       End If
   End If  
   If Not IsNull(strErrormsg) Then
       If Not VerifyInnerText (InternetBanking.lblAppErrorMessage(), strErrormsg, "Error Message")Then
       bVerifyApplicationdetails=false
       End If
   End If  
    InternetBanking.btnOK.click  
   WaitForICallLoading 
VerifyApplicationdetails = 	bVerifyApplicationdetails
End Function

'[Click Account Number hyperlink on IB Application status Screen]
Public Function ClickAccountNoLink_IBApplicationstatus(lstApplicationstatus)
  bClickAccountNoLink = True 
  bClickAccountNoLink = selectTableLink(InternetBanking.tblApplStatusHeader,InternetBanking.tblApplStatusContent,lstApplicationstatus,"Application Status" ,"Card Number",false,null ,null ,null)
  ClickAccountNoLink_IBApplicationstatus = bClickAccountNoLink
End Function

'[Click on Action Icon in the User ID field and verify Send SMS Link exist]
Public Function verifySendSMSlink_IB(strlinkname)
	bverifySendSMSlink = True 
	If Not IsNull(strlinkname) Then
		InternetBanking.SMSActionIcon.Click
		If Err.Number<>0 Then
	       LogMessage "WARN","Verification","Failed to Click Button : UserID Action Icon" ,false
	       bverifySendSMSlink=false
	       Exit Function
	    Else 
	     strActlinkname = InternetBanking.SendSMSLink.GetROProperty("innertext")
	     If Trim(strlinkname) = Trim(strActlinkname) Then
	     	LogMessage "WARN","Verification","Send SMS IB User ID exist",True
	     Else 
	        LogMessage "WARN","Verification","Send SMS IB User ID doesnt exist",False
	        bverifySendSMSlink = False
	     End If
	    End If
    End If
	WaitForICallLoading
	verifySendSMSlink_IB = bverifySendSMSlink
End Function

'[Click on link Send SMS IB User ID]
Public Function clickSendSMSlink()	
	InternetBanking.SendSMSLink.Click
	If Err.Number<>0 Then
       clickSendSMSlink=false
       LogMessage "WARN","Verification","Failed to Click Button :Send SMS IB User ID" ,false
       Exit Function
   End If
    clickSendSMSlink=true
	WaitForICallLoading
End Function

'[Verify Field IB Status on IB Screen displayed as]
Public Function VerifyProfileStatus_IB(StrProfileStatus) 
	bVerifyProfileStatus = True
	If Not IsNull(strProfileStatus) Then
       If Not VerifyInnerText (InternetBanking.lblProfProfileStatus(), strProfileStatus, "ProfileStatus")Then
           bVerifyProfileStatus = false
        End If
   End If
  VerifyProfileStatus_IB = bVerifyProfileStatus
End Function

'[Verify PayNow Profile title label Exist]
Public Function verifyCASprofileTitle(strValCASProfileTitle)
	verifyCASprofileTitle = True
	WaitForICallLoading
	If Not IsNull(strValCASProfileTitle) Then
		If Not VerifyInnerText (InternetBanking.lblCASProfileTitle(), strValCASProfileTitle, "PayNow Profile") Then
			verifyCASprofileTitle = False
		End If
	End If
End Function

'[Verify PayNow Transactions title label Exist]
Public Function verifyPayNowTransactionsTitle(strValPayNowTransactionsTitle)
	verifyPayNowTransactionsTitle = True
	WaitForICallLoading
	If Not IsNull(strValPayNowTransactionsTitle) Then
		If Not VerifyInnerText (InternetBanking.lblPayNowTransactionsTitle(), strValPayNowTransactionsTitle, "PayNow Transactions") Then
			verifyPayNowTransactionsTitle = False
		End If
	End If
End Function

'[Verify PayNow Payees title label Exist]
Public Function verifyPayNowPayeesTitle(strValPayNowPayeesTitle)
	verifyPayNowPayeesTitle = True
	WaitForICallLoading
	If Not IsNull(strValPayNowPayeesTitle) Then
		If Not VerifyInnerText (InternetBanking.lblPayNowPayeesTitle(), strValPayNowPayeesTitle, "PayNow Payees") Then
			verifyPayNowPayeesTitle = False
		End If
	End If
End Function

'[Select Radio Button of PayNow Outgoing Transactions on IB PayNow Transactions Screen]
Public Function selectPayNowOutgoingTransactions(strTransactionsDuration)
	bDevPending=false
	WaitForICallLoading
	bselectPayNowOutgoingTransactions=true
	If Not IsNull (strTransactionsDuration) Then
		bselectPayNowOutgoingTransactions=SelectRadioButtonGrp(strTransactionsDuration,InternetBanking.rbtnLastThreeDays, Array("Last 3 days","Last 6 months (Excluding last 3 days' transactions)"))
		WaitForICallLoading
	End If
	If Err.Number<>0 Then
       bselectPayNowOutgoingTransactions=false
       LogMessage "WARN","Verification","Failed to Click Button : Last 3 days ot 6 months transactions" ,false
       Exit Function
   End If
   WaitForICallLoading
   selectPayNowOutgoingTransactions = bselectPayNowOutgoingTransactions
End Function

'[Verify row Data in PayNow Outgoing Transactions Table for Last 3 days on PayNow Transactions Page]
Public Function vrfyPayNowOutgoingTransactionsTable(lstlstPayNowTransactionsTbl)
	vrfyPayNowOutgoingTransactionsTable = True
	WaitForICallLoading
	If Not IsNull(lstlstPayNowTransactionsTbl) Then
		vrfyPayNowOutgoingTransactionsTable = verifyTableContentList(InternetBanking.tblPayNowTransactionsTbl3DaysDetailsHeader,InternetBanking.tblPayNowTransactionsTbl3DaysDetailsContent,lstlstPayNowTransactionsTbl,"PayNow Transactions", false,null ,null,null)
	End If
End Function

'[Verify row Data in PayNow Outgoing Transactions Table for Last 6 Months on PayNow Transactions Page]
Public Function vrfyPayNowOutgoingTransactionsLastSixMonthTable(lstlstPayNowTransactionsTbl)
	vrfyPayNowOutgoingTransactionsLastSixMonthTable = True
	WaitForICallLoading
	If Not IsNull(lstlstPayNowTransactionsTbl) Then
		vrfyPayNowOutgoingTransactionsLastSixMonthTable = verifyTableContentList(InternetBanking.tblPayNowTransactionsTblDetailsHeader,InternetBanking.tblPayNowTransactionsTblDetailsContent,lstlstPayNowTransactionsTbl,"PayNow 6 months Transactions", false,null ,null,null)
	End If
End Function

'[Verify row Data in PayNow Payees Table on PayNow Payees Page]
Public Function vrfyPayNowPayeesTable(lstlstPayNowPayeesTbl)
	vrfyPayNowPayeesTable = True
	WaitForICallLoading
	If Not IsNull(lstlstPayNowPayeesTbl) Then
		vrfyPayNowPayeesTable = verifyTableContentList(InternetBanking.tblPayNowPayeestblDetailsHeader,InternetBanking.tblPayNowPayeesTblDetailsContent,lstlstPayNowPayeesTbl,"PayNow Payees", false,null ,null,null)
	End If
End Function

'[Verify Button Investigation Exist]
Public Function verifyButtonInvestigation()
   bDevPending=false
   verifyButtonInvestigation=true
	If not (InternetBanking.btnInvestigation.exist(0)) Then
		verifyButtonInvestigation=false
	End If
	WaitForICallLoading
End Function

'[Click Investigation button in the IB PayNow Transactions]
Public Function clickInvestigationButton()
	WaitForICallLoading
	InternetBanking.btnInvestigation.Click
	If Err.Number<>0 Then
		clickInvestigationButton=false
	    LogMessage "WARN","Verification","Failed to Click Button : Investigation in IB PayNow Transactions Page displayed" ,false
		Exit Function
	End If
	WaitForICallLoading
    clickInvestigationButton= True
End Function

'[Verify row Data in PayNow Profile Table on PayNow Profile Page]
Public Function vrfyCasProfileTable(lstlstCasProfileTbl)
	vrfyCasProfileTable = True
	WaitForICallLoading
	If Not IsNull(lstlstCasProfileTbl) Then
		vrfyCasProfileTable = verifyTableContentList(InternetBanking.tblCasProfileTblDetailsHeader,InternetBanking.tblCasProfileTblDetailsContent,lstlstCasProfileTbl,"CAS Profile", false,null ,null,null)
	End If
End Function

'[Click Proxy Value hyperlink on PayNow Profile Table]
Public Function clickProxyHyperLinkCAS(lstProxyCASProfile)
	clickProxyHyperLinkCAS = True
	WaitForICallLoading
	If Not IsNull(lstProxyCASProfile) Then
		clickProxyHyperLinkCAS = selectTableLink(InternetBanking.tblCasProfileTblDetailsHeader,InternetBanking.tblCasProfileTblDetailsContent,lstProxyCASProfile,"CAS Profile" ,"Proxy Value",false,null ,null ,null)
	End If
	WaitForICallLoading
End Function

'[Verify PayNow Event Log title label Exist]
Public Function verifyCASEventLogTitle(strValCASEventLogTitle)
	verifyCASEventLogTitle = True
	WaitForICallLoading
	If Not IsNull(strValCASEventLogTitle) Then
		If Not VerifyInnerText (InternetBanking.lblCASEventLogTitle(), strValCASEventLogTitle, "CAS Event Log") Then
			verifyCASEventLogTitle = False
		End If
	End If
End Function

'[Verify PayNow Event Action lable Exist]
Public Function verifyCASEventActionTitle(strValEventAction)
	verifyCASEventActionTitle = True
	WaitForICallLoading
	If Not IsNull(strValEventAction) Then
		If Not VerifyInnerText (InternetBanking.lblCASEventActionTitle(), strValEventAction, "CAS Event Action") Then
			verifyCASEventActionTitle = False
		End If
	End If
End Function

'[Verify row Data in PayNow Event Log Table on PayNow Profile Page]
Public Function vrfyCasEventLogTable(lstlstCasEventLogTbl)
	vrfyCasEventLogTable = True
	WaitForICallLoading
	If Not Isnull(lstlstCasEventLogTbl) Then
		vrfyCasEventLogTable = verifyTableContentList(InternetBanking.tblCasEventLogTblDetailsHeader,InternetBanking.tblCasEventLogTblDetailsContent,lstlstCasEventLogTbl,"PayNow Event Log", false,null ,null,null)	
	End If
End Function

'[Verify Action Menu links from PayNow Profile Details on Internet Banking Screen]
Public Function verifyDeRegisterAction_CASProfile(lstCASprofileDetails,strLinkName,bDisabled)
	bDevPending = False
	bverifyDeRegisterAction_CASProfile = true
	If Not IsNull(lstCASprofileDetails)Then
		With InternetBanking
			bverifyDeRegisterAction_CASProfile = verifyTableSubMenu(.tblCasProfileTblDetailsHeader,.tblCasProfileTblDetailsContent,lstCASprofileDetails,"CAS Profile","Actions",False,NULL,NULL,NULL,strLinkName,bDisabled)
		End With
		WaitForICallLoading
	End If
	verifyDeRegisterAction_CASProfile = bverifyDeRegisterAction_CASProfile
End Function

'[Select Action Menu De-Register from CAS Profile Details on Internet Banking Screen]
Public Function selectDeRegisterAction_CASProfile(lstCASprofileDetails,strLinkName)
	bDevPending = False
	bselectDeRegisterAction_CASProfile = true
	If Not IsNull(lstCASprofileDetails)Then
		With InternetBanking
			bselectDeRegisterAction_CASProfile = selectTableSubMenu(.tblCasProfileTblDetailsHeader,.tblCasProfileTblDetailsContent,lstCASprofileDetails,"CAS Profile","Actions",False,NULL,NULL,NULL,strLinkName,bDisabled)
		End With
		WaitForICallLoading
	End If
	selectDeRegisterAction_CASProfile = bselectDeRegisterAction_CASProfile
End Function

'[Verify default Request Type dropdown value in CAS De-registration Page displayed as]
Public Function vrfyReqTypeDefaltCASProfileSR(strTypeAs)
   bvrfyReqTypeDefaltCASProfileSR=true
   If Not IsNull(strTypeAs) Then
       If Not verifyComboSelectItem(InternetBanking.rEquestTypeDropdown(),strTypeAs, "Request Type")Then
       	  LogMessage "WARN","Verification","Default Request Type value doesnt match with expected value" ,false
          bvrfyReqTypeDefaltCASProfileSR = false
       End If
   End If
   vrfyReqTypeDefaltCASProfileSR = bvrfyReqTypeDefaltCASProfileSR
End Function

'[Verify list of values displayed in CAS DeRegistration Request Type dropdown as]
Public Function verifyReqTypedropdownCAS(lstReqType)
   bverifyReqTypedropdownCAS = true
   If Not IsNull(lstReqType) Then
       If Not verifyComboboxItems(InternetBanking.rEquestTypeDropdown(),lstReqType, "Show Dropdown")Then
           bverifyReqTypedropdownCAS = false
       End If
   End If
   verifyReqTypedropdownCAS = bverifyReqTypedropdownCAS
End Function

'[Select CAS Profile De Registration Combobox Request Type as]
Public Function sElectCasDeRegRequestTypeComboBox(strCasReqType)
   bDevPending = false
   bsElectCasDeRegRequestTypeComboBox = true
   If Not IsNull(strCasReqType) Then
       If Not (selectItem_Combobox (InternetBanking.rEquestTypeDropdown(), strCasReqType))Then
            LogMessage "WARN","Verification","Failed to select CAS Profile De Registration: "&strCasReqType&" From Request Type drop down list" ,false
           bsElectCasDeRegRequestTypeComboBox = false
       End If
   End If
   sElectCasDeRegRequestTypeComboBox = bsElectCasDeRegRequestTypeComboBox
End Function

'[Verify Active CAS Profile Types title label Exist]
Public Function verifyActiveCASProfileTypesTitle(strValCASActiveTitle)
	verifyActiveCASProfileTypesTitle = True
	If Not IsNull(strValCASActiveTitle) Then
		If Not VerifyInnerText (InternetBanking.casDeRegisterTitle(), strValCASActiveTitle, "Active CAS Profile Types") Then
			verifyActiveCASProfileTypesTitle = False
		End If
	End If
End Function

'[Verify row Data in Table Active CAS Profile Types as]
Public Function verifytblSelectedActiveCASProfileType(arrRowDataList)
   verifytblSelectedActiveCASProfileType = True 
   If Not IsNull(arrRowDataList) Then
   	verifytblSelectedActiveCASProfileType = verifyTableContentList(InternetBanking.tblcasDeRegisterDataTableHeader,InternetBanking.tblcasDeRegisterDataTableContent,arrRowDataList,"Active CAS Profile Types" , false,null ,null,null)
   End If   
End Function

'[Verify CAS Payees Title label Exist]
Public Function verifyCASPayeesTitle(strValCASpayeesTitle)
	verifyCASPayeesTitle = True
	WaitForICallLoading
	If Not IsNull(strValCASpayeesTitle) Then
		If Not VerifyInnerText (InternetBanking.lblcasPayeeTitleLabel(), strValCASpayeesTitle, "CAS Payees") Then
			verifyCASPayeesTitle = False
		End If
	End If
End Function

'[Verify row Data in CAS Payees Table on CAS Payees Page]
Public Function vrfyCasPayeesLogTable(lstlstCasPayeesLogTbl)
	vrfyCasPayeesLogTable = True
	WaitForICallLoading
	If Not Isnull(lstlstCasPayeesLogTbl) Then
		vrfyCasPayeesLogTable = verifyTableContentList(InternetBanking.tblcasPayeesDataTableHeader,InternetBanking.tblcasPayeesDataTableContent,lstlstCasPayeesLogTbl,"CAS Payees", false,null ,null,null)	
	End If
End Function

'[Verify CAS Outgoing Transactions Title label Exist]
Public Function verifyCASOutgoingTransactionsTitle(strValCAStransactionsTitle)
	verifyCASOutgoingTransactionsTitle = True
	WaitForICallLoading
	If Not IsNull(strValCAStransactionsTitle) Then
		If Not VerifyInnerText (InternetBanking.lblcasTransactionsTitleLabel(), strValCAStransactionsTitle, "CAS Payees") Then
			verifyCASOutgoingTransactionsTitle = False
		End If
	End If
End Function

'[select CAS Outgoing Transactions History RadioGroup]
Public Function selectCasTransHistRadioGroup(strTransHistVal)
	selectCasTransHistRadioGroup = True
	WaitForICallLoading
	If Not IsNull(strTransHistVal) Then
		selectCasTransHistRadioGroup = SelectRadioButtonGrp(strTransHistVal,InternetBanking.casTransHistradioGroup,Array("Last 3 days","Last 60 days (Excluding today's transactions)"))
	End If
End Function

'[Verify row Data in CAS Outgoing Transactions History Table on CAS Transactions Page]
Public Function vrfyCasTrnsHistryTable(lstlstCasTrnsHstryTbl)
	vrfyCasTrnsHistryTable = True
	WaitForICallLoading
	If Not Isnull(lstlstCasTrnsHstryTbl) Then
		vrfyCasTrnsHistryTable = verifyTableContentList(InternetBanking.tblCasTrnsactionsDataTableHeader,InternetBanking.tblCasTrnsactionsDataTableContent,lstlstCasTrnsHstryTbl,"CAS Outgoing Transactions", false,null ,null,null)	
	End If
End Function

'[Verify PayNow Event Action Option Combobox has Items]
Public Function verifyCASeventActionOptionComboboxItems(lstItems)
   bDevPending=false
   verifyCASeventActionOptionComboboxItems=true
   WaitForIcallLoading
   For iCountTre = 1 To 180 Step 1
		If Not InternetBanking.lstCASEventAction.Exist(0.5) Then
			Wait(0.5)
		else
			If Not IsNull(lstItems) Then
				If Not verifyComboboxItems (InternetBanking.lstCASEventAction(), lstItems, "PayNow Event Action")Then
					verifyCASeventActionOptionComboboxItems=false
				End If
			End If
			Exit for
		End if
	Next
End Function

'[Select Combobox Event Action Type as]
Public Function selectEventActionTypeComboBox(strEventAction)
   bDevPending=false
   bselectEventActionTypeComboBox = true
   waitForIcallLoading
   If Not IsNull(strEventAction) Then
       If Not(selectItem_Combobox(InternetBanking.lstCASEventAction(),strEventAction))Then
            LogMessage "WARN","Verification","Failed to select :"&strEventAction&" From CappingType drop down list" ,false
           bselectEventActionTypeComboBox = false
       End If
   End If
   waitForIcallLoading
   selectEventActionTypeComboBox = bselectEventActionTypeComboBox
End Function

'[Click on the Send SMS IB User ID link]
Public Function clickSendSMSlink(arrdisplay)
	clickSendSMSlink = True
	If Not IsNull(arrdisplay) Then
		bDisabled =InStr(InternetBanking.SendSMSLink.GetROProperty("class"),"disabled-area")		
		If arrdisplay = "Disabled" Then 
			If bDisabled <>0 Then
				LogMessage "RSLT","Verification","Sub Menu Icon is "&arrdisplay&" as expected",True
				clickSendSMSlink = True 
			Else
				LogMessage "WARN","Verification","Sub Menu Icon Send SMS IB User ID is not "&arrdisplay&" as expected ",False
				clickSendSMSlink = False 
				Exit Function
			End If 
		ElseIf arrdisplay = "Enabled" Then
			If bDisabled = 0 Then
				InternetBanking.SendSMSLink.Click
				LogMessage "RSLT","Verification","Sub Menu Icon is "&arrdisplay&" as expected",True
				clickSendSMSlink = True 
			Else
				LogMessage "WARN","Verification","Sub Menu Icon Send SMS IB User ID is not "&arrdisplay&" as expected ",False
				clickSendSMSlink = False 
				Exit Function
			End If 					
		End If 
	End If
	
	If Err.Number<>0 Then
		clickSendSMSlink=false
		LogMessage "WARN","Verification","Failed to Click Button :Send SMS IB User ID" ,false
		Exit Function
	End If
	WaitForICallLoading
End Function

''[Get selected item from combo box CappingType]
'Public Function getCappingTypeSelectedItem()
'   'bDevPending=false
'   getCappingTypeSelectedItem=getVadinCombo_SelectedItem(CappingLimit_Page.lstCappingType)
'End Function
