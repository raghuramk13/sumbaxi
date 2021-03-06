Dim strRunTimeNewCardNumber_RC:strRunTimeNewCardNumber_RC=""  'This Variable is used to Store New Card Number after Replacement
Dim strRunTimeSRNumber_SRTable:strRunTimeSRNumber_SRTable=""  'This Variable is used to get SR number from SR Table

'[Verify Login page is Displayed]
Public Function  VerifyLoginPageDisplayed()
VerifyLoginPageDisplayed = Browser("Browser_iCall_Login").Page("iCall_Login").Exist(2)
End Function

'[User logged in as CSO]
Public Function GivenUserloggedinasCSO(strUserName,strPassword)	
	If strUserName = Environment.Value("strPreviousUser") Then
		strCurrentUser = Environment.Value("strPreviousUser")
	Else
		strCurrentUser = strUserName
		If Environment.Value("intLoginCounter") <> 0 Then
			If Browser("Browser_iCall_Home").Page("iCall_Logout").WebButton("html id:=navBarLogout_button").Exist(1) Then
				Browser("Browser_iCall_Home").Page("iCall_Logout").WebButton("html id:=navBarLogout_button").Click
				If Browser("Browser_iCall_Home").Page("iCall_Logout").WebButton("html id:=logoutYes_button").Exist(1) Then
					Browser("Browser_iCall_Home").Page("iCall_Logout").WebButton("html id:=logoutYes_button").Click
					Wait(3)
					WaitForICallLoading
				End If
			End If
		End If
	End If
		
	If Browser("Browser_iCall_Login").Page("iCall_Login").WebElement("btnLogin").Exist(1) Then
		GivenUserloggedinasCSO = login_iCall("CSO", strCurrentUser, strPassword,"SUCCESS",NULL )
	Else
		Print Vbtab & Vbtab & "User : [" &strCurrentUser&"] is already logged into IServe Application" 
	End If
	Environment.Value("strPreviousUser") = strCurrentUser
	Environment.Value("intLoginCounter") = Environment.Value("intLoginCounter") + 1
End Function


'[Execute LISA Batch to Start Virtual Environment]
Public Function executeLISABatch_Start(strPath)
	executeLISABatch_Start=true
	dim objWshShell
	set objWshShell=createobject("Wscript.shell")	
	If Not IsNull (strPath) Then
		objWshShell.Run (strPath&"\Start.bat")	
	End If
	wait (30)
End Function

'[Execute LISA Batch to Stop Virtual Environment]
Public Function executeLISABatch_Stop(strPath)
	executeLISABatch_Stop=true
	dim objWshShell
	set objWshShell=createobject("Wscript.shell")	
	If Not IsNull (strPath) Then
		objWshShell.Run (strPath&"\Stop.bat")	
	End If
	wait (30)
End Function

'[Perform Logout and Login again as TM]
Public Function Logout_TMLogin(strUserName,strPassword)
	bcverify_Logout.lnkLogout().Click
	WaitForICallLoading
	bcBrowserApplication.relaunchAppURL
	WaitForICallLoading
	Logout_TMLogin=login_iCall("MANAGER", strUserName, strPassword,"SUCCESS",NULL )
End Function

'[Perform Logout and Login again as CSO]
Public Function Logout_CSOLogin(strUserName,strPassword)
	bcverify_Logout.lnkLogout().Click
	WaitForICallLoading
	bcBrowserApplication.relaunchAppURL
	WaitForICallLoading
	Logout_CSOLogin=login_iCall("CSO", strUserName, strPassword,"SUCCESS",NULL )
End Function

'[Search Customer with CIN , Name , DOB]
Public Function SearchCustomerwithCIN(strCIN,strName,strDOB)
	SearchCustomerwithCIN=VerifyCustomerSearchResult("CUSTOMER", strCIN, Null, Null, Null, Null, strName, Null, strDOB, Null, Null)
End Function

'[Click Link Name in Search table]
Public Function ClickLinkNameInSearchTable(strCustCIN)
	 ClickLinkNameInSearchTable=SelectCustomer(strCustCIN, Null, Null)
End Function

'[Verify Customer Overview Page is displayed]
Public Function VerifyCustomerOverviewPageDisplayed()
	VerifyCustomerOverviewPageDisplayed=cCustomerOverview.pageExists
End Function

'[Customer Overview Page is displayed]
Public Function CustomerOverviewpageisdisplayed()
CustomerOverviewpageisdisplayed=cCustomerOverview.pageExists
End Function

'[User Click Link for Account from Accounts Table]
Public Function UserClicksLinkforCreditCardAccount(strProduct,strAccount)
UserClicksLinkforCreditCardAccount=SelectAccountLink(strProduct,strAccount)
WaitForIcallLoading
End Function

'[Verify Account Details Page is Displayed]
Public Function VerifyAccountDetailsPageisDisplayed()
   WaitForIcallLoading
VerifyAccountDetailsPageisDisplayed=bcAccountOverview_LeftMenu.pageExists() '
End Function

'[Verify Card Details Page is Displayed]
Public Function VerifyCardDetailsPageisDisplayed()
VerifyCardDetailsPageisDisplayed=bcCardOverview_LeftMenu.pageExists() '
End Function

'[User Click Left Menu Link]
Public Function UserClicksLeftMenuLink(strLeftMenuName)
 UserClicksLeftMenuLink=clickLefmenuLink(strLeftMenuName)
End Function


'[User Click Card List Link]
Public Function UserClicksLinkCardList()
 bcCustomerOverview.clickCardList()
 WaitForIcallLoading
 UserClicksLinkCardList=true
End Function

'[Verify Card List Page is Displayed]
Public Function VerifyCardListPageisDisplayed()
   WaitForIcallLoading
	VerifyCardListPageisDisplayed=cCardList.pageExists()
End Function

'[Verify Card Status in CardlList Table]
Public Function verifyCardStatusCardList(strCardNumber, strStatus)
   'This Function Selects Single Card
   lstCardData= Array("Card Number:"&strCardNumber,"Card Status:"&strStatus)
   bDevPending=False
   verifyCardStatusCardList=verifySingleRowDataInTable(bcCardList.tblCardListHeader,bcCardList.tblCardListContent,lstCardData,"Card List",True,bcCardList.lnkNext,bcCardList.lnkNext1,bcCardList.lnkPrevious)
  
End Function

'[Verify Card Status in CardlList Table for Multiple Card]
Public Function verifyMultiCardStatusCardList(lstlstCardStatus)
   bverifyMultiCardStatusCardList=true
	For iRowCount=0 to Ubound(lstlstCardStatus,1)
		intSize=Ubound(lstlstCardStatus,2)
		ReDim arrColumns(intSize)
		ReDim arrValues(intSize)

		For iCount=0 to intSize
			arrTemp=Split(lstlstCardStatus(iRowCount,iCount),":")
			arrColumns(iCount)=arrTemp(0)
			arrValues(iCount)=checkNull(arrTemp(1))
		Next
		If bPagination then
		Do
			verifyMultiCardStatusCardList=verifySingleRowDataInTable(bcCardList.tblCardListHeader,bcCardList.tblCardListContent,lstlstCardStatus,"Card List",True,bcCardList.lnkNext,bcCardList.lnkNext1,bcCardList.lnkPrevious)
			If  verifyMultiCardStatusCardList = true Then
				Exit Do
			End If

			bNextEnabled =matchStr(lnkNext1.GetROProperty("outerhtml"),"v-disabled")
			If Not bNextEnabled Then
					lnkNext.Click
					intTablePage=intTablePage+1
					WaitForICallLoading
			End If
           Loop while not bNextEnabled
		Else
		verifyMultiCardStatusCardList=verifySingleRowDataInTable(bcCardList.tblCardListHeader,bcCardList.tblCardListContent,lstlstCardStatus,"Card List",True,bcCardList.lnkNext,bcCardList.lnkNext1,bcCardList.lnkPrevious)
	End If
	Next

End Function

'[User Select Account on Card List page]
Public Function SelectAccountOnCardListPage(strCardNumber)
  SelectAccountOnCardListPage= bcCardList.SelectCardNumber(strCardNumber)
End Function

'[Perform Manual Authentication 2Authentication 2Identification]
Public Function performMA2Auth2Ide(lstQues,lstAuthQuestions)
   bAppStateLogout=true
	bManualAuthentication = True
	waitForIcallLoading
		VerifyCustomer.btnVerify.Click
		WaitForIcallLoading
			   If Not VerifyCustomer.pageExists() Then
					LogMessage "WARN","Verification.","Manual Authentication  does not displayed ",false
					performManualAuthentication=False
					Exit Function
				 Else
						LogMessage "RSLT","Verification.","Manual Authentication page displayed successfully",true
				End If

		'Answer Identification Questions
		intFailCount=0
		If not IsNull(lstQues) Then
				If Not  VerifyCustomer.performIdentification(Null,lstQues,CheckNull("BLANK|BLANK"),CheckNull("Pass|Pass"),False,Null,0) then
					bManualAuthentication=false
				End If
		End If

		'Answer Authentication Questions
			If not IsNull(lstAuthQuestions) Then
					If Not  VerifyCustomer.performAuthentication(Null,lstAuthQuestions,CheckNull("BLANK|BLANK"),CheckNull("BLANK|BLANK"),Null,Null,CheckNull("Pass|Pass"),False,Null,0) then
						bManualAuthentication=false
					End If
			End If
	
			VerifyCustomer.btnVerifyCustomer().click
			WaitForIcallLoading
			 strStatus=VerifyCustomer.lblVerificationStatus.GetROProperty("innertext")
			If Ucase(Trim(strStatus)) = Ucase("Low Risk Verified") Then
				LogMessage "RSLT","Verification","Customer Verification Status is matching with the expected value. Actual: "& strStatus&" , Expected:Low Risk Verified" ,True
				bManualAuthentication = True
			Else						
				LogMessage "WARN","Verification","Customer Verification Status is not matching with the expected value. Actual: "&strStatus&" , Expected:Low Risk Verified" ,False
				bManualAuthentication = False
			End If
		performMA2Auth2Ide=bManualAuthentication
End Function

'[Perform MA with Failed answer Authentication and Identification question]
Public Function performFailedMA_AuthIde(lstQues,lstAuthQuestions)
   bAppStateLogout=true
	bManualAuthentication = True
	waitForIcallLoading
		VerifyCustomer.btnVerify.Click
		WaitForIcallLoading
			   If Not VerifyCustomer.pageExists() Then
					LogMessage "WARN","Verification.","Manual Authentication  does not displayed ",false
					performManualAuthentication=False
					Exit Function
				 Else
						LogMessage "RSLT","Verification.","Manual Authentication page displayed successfully",true
				End If

		'Answer Identification Questions
		intFailCount=0
		If not IsNull(lstQues) Then
			Redim lstAnswers(Ubound(lstQues))
				For iCount=0 to Ubound(lstQues)
					lstAnswers(iCount)="Fail"
				Next
				If Not  VerifyCustomer.performIdentification(Null,lstQues,Null,lstAnswers,True,Null,intFailCount) then
					bManualAuthentication=false
				End If
		End If

		'Answer Authentication Questions
			If not IsNull(lstAuthQuestions) Then
				Redim lstAnswersAuth(Ubound(lstAuthQuestions))
				For iCount=0 to Ubound(lstAuthQuestions)
					lstAnswersAuth(iCount)="Fail"
				Next
					If Not  VerifyCustomer.performAuthentication(Null,lstAuthQuestions,Null,Null,Null,Null,lstAnswersAuth,True,Null,intFailCount) then
						bManualAuthentication=false
					End If
			End If
			If VerifyCustomer.btnVerifyCustomer.exist(1) Then
				VerifyCustomer.btnVerifyCustomer().click
			End If
			WaitForIcallLoading
			 strStatus=VerifyCustomer.lblVerificationStatus.GetROProperty("innertext")
			If Ucase(Trim(strStatus)) = Ucase("Verification Failed") Then
				LogMessage "RSLT","Verification","Customer Verification Status is matching with the expected value. Actual: "& strStatus&" , Expected: Verification Failed" ,True
				bManualAuthentication = True
			Else						
				LogMessage "WARN","Verification","Customer Verification Status is not matching with the expected value. Actual: "&strStatus&" , Expected:Verification Failed" ,False
				bManualAuthentication = False
			End If
		performFailedMA_AuthIde=bManualAuthentication
End Function

'[Perform MA by answering Authentication and Identification question]
Public Function performMAAuthIde(lstQues,lstAuthQuestions)
   bAppStateLogout=true
	bManualAuthentication = True
	WaitForIcallLoading
	If isNull(lstQues) And isNull(lstAuthQuestions) Then
		LogMessage "RSLT","Verification","No manual authentication required or demanded",True
		performMAAuthIde=true
		Exit Function
	End If
		VerifyCustomer.btnVerify.Click
		WaitForIcallLoading
			   If Not VerifyCustomer.pageExists() Then
					LogMessage "WARN","Verification.","Manual Authentication  does not displayed ",false
					performManualAuthentication=False
					Exit Function
				 Else
						LogMessage "RSLT","Verification.","Manual Authentication page displayed successfully",true
				End If

		'Answer Identification Questions
		intFailCount=0
		If not IsNull(lstQues) Then
				Redim lstAnswers(Ubound(lstQues))
				For iCount=0 to Ubound(lstQues)
					lstAnswers(iCount)="Pass"
				Next
				If Not  VerifyCustomer.performIdentification(Null,lstQues,Null,lstAnswers,False,Null,0) then
					bManualAuthentication=false
				End If
		End If

		'Answer Authentication Questions
			If not IsNull(lstAuthQuestions) Then
					Redim lstAnswersAuth(Ubound(lstAuthQuestions))
					For iCount=0 to Ubound(lstAuthQuestions)
						lstAnswersAuth(iCount)="Pass"
					Next
					If Not  VerifyCustomer.performAuthentication(Null,lstAuthQuestions,Null,Null,Null,Null,lstAnswersAuth,False,Null,0) then
						bManualAuthentication=false
					End If
			End If
	
			VerifyCustomer.btnVerifyCustomer().click
			WaitForIcallLoading
			 strStatus=VerifyCustomer.lblVerificationStatus.GetROProperty("innertext")
			'If Ucase(Trim(strStatus)) = Ucase("Verification Completed") Then '***** New Changes in MA on 14 Jan 2015 
			If Ucase(Trim(strStatus)) = Ucase("High Risk Verified") or Ucase(Trim(strStatus)) = Ucase("Low Risk Verified") or Ucase(Trim(strStatus)) = Ucase("High Risk with TPIN") Then
				LogMessage "RSLT","Verification","Customer Verification Status is matching with the expected value. Actual: "& strStatus&" , Expected: High Risk Verified" ,True
				bManualAuthentication = True
			Else						
				LogMessage "WARN","Verification","Customer Verification Status is not matching with the expected value. Actual: "&strStatus&" , Expected: High Risk Verified" ,False
				bManualAuthentication = False
			End If
		performMAAuthIde=bManualAuthentication
End Function

'[Perform MA as Incomplete Verification]
Public Function performIncompleteMA(lstQues,lstAuthQuestions)
   bAppStateLogout=true
	bManualAuthentication = True
	waitForIcallLoading
		VerifyCustomer.btnVerify.Click
		WaitForIcallLoading
			   If Not VerifyCustomer.pageExists() Then
					LogMessage "WARN","Verification.","Manual Authentication  does not displayed ",false
					performManualAuthentication=False
					Exit Function
				 Else
						LogMessage "RSLT","Verification.","Manual Authentication page displayed successfully",true
				End If

		'Answer Identification Questions
		intFailCount=0
		If not IsNull(lstQues) Then
				Redim lstAnswers(Ubound(lstQues))
				For iCount=0 to Ubound(lstQues)
					lstAnswers(iCount)="Pass"
				Next
				If Not  VerifyCustomer.performIdentification(Null,lstQues,Null,lstAnswers,False,Null,0) then
					bManualAuthentication=false
				End If
		End If

		'Answer Authentication Questions
			If not IsNull(lstAuthQuestions) Then
					Redim lstAnswersAuth(Ubound(lstAuthQuestions))
					For iCount=0 to Ubound(lstAuthQuestions)
						lstAnswersAuth(iCount)="Pass"
					Next
					If Not  VerifyCustomer.performAuthentication(Null,lstAuthQuestions,Null,Null,Null,Null,lstAnswersAuth,False,Null,0) then
						bManualAuthentication=false
					End If
			End If
	
			VerifyCustomer.btnVerifyCustomer().click
			WaitForIcallLoading
			Wait 1
			If VerifyCustomer.popMessage.exist(2) then
				VerifyCustomer.btnYes.click
				WaitForIcallLoading
			End If
			 strStatus=VerifyCustomer.lblVerificationStatus.GetROProperty("innertext")
			If Ucase(Trim(strStatus)) = Ucase("Verification Incomplete") Then
				LogMessage "RSLT","Verification","Customer Verification Status is matching with the expected value. Actual: "& strStatus&" , Expected: Verification Incomplete" ,True
				bManualAuthentication = True
			Else						
				LogMessage "WARN","Verification","Customer Verification Status is not matching with the expected value. Actual: "&strStatus&" , Expected:Verification Incomplete" ,False
				bManualAuthentication = False
			End If
		performIncompleteMA=bManualAuthentication
End Function

'[Perform MA by answering Authentication and Identification And Custom question]
Public Function performMAAuthIde_Cust(lstQues,lstAuthQuestions,strCustomQuestion)
   bAppStateLogout=true
	bManualAuthentication = True
	waitForIcallLoading
		VerifyCustomer.btnVerify.Click
		WaitForIcallLoading
			   If Not VerifyCustomer.pageExists() Then
					LogMessage "WARN","Verification.","Manual Authentication  does not displayed ",false
					performManualAuthentication=False
					Exit Function
				 Else
						LogMessage "RSLT","Verification.","Manual Authentication page displayed successfully",true
				End If

		'Answer Identification Questions
		intFailCount=0
		If not IsNull(lstQues) Then
				Redim lstAnswers(Ubound(lstQues))
				For iCount=0 to Ubound(lstQues)
					lstAnswers(iCount)="Pass"
				Next
				If Not  VerifyCustomer.performIdentification(Null,lstQues,Null,lstAnswers,False,Null,0) then
					bManualAuthentication=false
				End If
		End If

		'Answer Authentication Questions
			If not IsNull(lstAuthQuestions) Then
					Redim lstAnswersAuth(Ubound(lstAuthQuestions))
					For iCount=0 to Ubound(lstAuthQuestions)
						lstAnswersAuth(iCount)="Pass"
					Next
					If Not  VerifyCustomer.performAuthentication(Null,lstAuthQuestions,Null,Null,Null,Null,lstAnswersAuth,False,Null,0) then
						bManualAuthentication=false
					End If
			End If
	'	Answer Custom Question
		If not IsNull(strCustomQuestion) Then		
			If Not  VerifyCustomer. answerCustomQuestion(strCustomQuestion,"Pass",False,0,NULL)then
				bManualAuthentication=false
			End If
		End If

			VerifyCustomer.btnVerifyCustomer().click
			WaitForIcallLoading
			 strStatus=VerifyCustomer.lblVerificationStatus.GetROProperty("innertext")
			If Ucase(Trim(strStatus)) = Ucase("High Risk Verified") Then
				LogMessage "RSLT","Verification","Customer Verification Status is matching with the expected value. Actual: "& strStatus&" , Expected: Verification Completed" ,True
				bManualAuthentication = True
			Else						
				LogMessage "WARN","Verification","Customer Verification Status is not matching with the expected value. Actual: "&strStatus&" , Expected:Verification Completed" ,False
				bManualAuthentication = False
			End If
		performMAAuthIde_Cust=bManualAuthentication
End Function

'[Trigger CTI call for TPIN verified customer]
Public Function triggerCTI_TIPIN(strCIN,strCustName)
   bAppStateLogout=True	
	triggerCTI_TIPIN= bcTriggerCTI.TriggerCTI("Yes", strCIN, "00", "", "", "", "", strCustName, "TPIN Verified", Null, Null)
End Function

'[Trigger CTI call for NRIC Identified customer]
Public Function triggerCTI_NRICIdentified(strCIN,strCustName)
   bAppStateLogout=True	
	'triggerCTI_NRICIdentified= bcTriggerCTI.TriggerCTI("No", strCIN, "00", "", "", "", "", strCustName, "Not Verified", "Unidentified Customer", "Unauthenticated Customer")
	triggerCTI_NRICIdentified= bcTriggerCTI.TriggerCTI("No", strCIN, "00", "", "", "", "", strCustName, "Verification Incomplete", "Unidentified Customer", "Unauthenticated Customer")
End Function

'[Verify Field Account Block Code1 on Key Info Page displayed as]
Public Function verifyAccount_BlockCode1(strAccount_BlockCode1)
   Dim bVerifyKeyInfo:bVerifyKeyInfo=true
	If Not IsNull(strAccount_BlockCode1) Then
		If Not verifyInnerText(bcKeyInfo.lblAccount_BlockCode1() , strAccount_BlockCode1, "Account - Block Code 1")Then
				bVerifyKeyInfo = False
		End If
	End If
	verifyAccount_BlockCode1=bVerifyKeyInfo
End Function

'[Verify Field Account Block Code2 on Key Info Page displayed as]
Public Function verifyAccount_BlockCode2(strAccount_BlockCode2)
   Dim bVerifyKeyInfo:bVerifyKeyInfo=true
	If Not IsNull(strAccount_BlockCode2) Then
		If Not verifyInnerText(bcKeyInfo.lblAccount_BlockCode2() , strAccount_BlockCode2, "Account - Block Code 2")Then
				bVerifyKeyInfo = False
		End If
	End If
	verifyAccount_BlockCode2=bVerifyKeyInfo
End Function

'[Verify Field Account Block Code1 Date on Key Info Page displayed as]
Public Function verifyAccount_BlockCode1Date(strAccount_BlockCode1_Date)
Dim bVerifyKeyInfo:bVerifyKeyInfo=true

    	If Not IsNull(strAccount_BlockCode1_Date) Then
			strActualDateTime=bcKeyInfo.lblCard_BlockDate.GetROProperty("innertext")
		If Ucase(strAccount_BlockCode1_Date)="TODAY" Then
			If len(Day(CDate(Now)))=1 Then
				strDay="0"&Day(CDate(Now))
			else
				strDay=""&Day(CDate(Now))
			End If
			strCreatedDatePattern=""&strDay & " "&monthName(Month(CDate(Now)),true) &" " &Year(CDate(Now))&" ([0-2][0-9]:[0-9][0-9])"
		elseif 	Ucase(strAccount_BlockCode1_Date)="VPLUS DATE TIME" Then
				strCreatedDatePattern=fetchFromDataStore("Verify Block Code And Reason Code From VPlus OFSA Screen","BLANK","DateAndTime_VPlus")(0) 'TODO To be updated with actual 
		else
			strCreatedDatePattern=strSummary_DateTime &" ([0-2][0-9]:[0-9][0-9])"
		End If
		If Matchstr(strCreatedDatePattern,strActualDateTime) Then
			'If Ucase(Trim(strActualDateTime)) = UCase(Trim(strSummary_DateTime)) Then
				LogMessage "RSLT","Verification","Date matching with the expected value. Expected: "& strCreatedDatePattern &" , Actual: "& strActualDateTime ,True
			Else
				bVerifyKeyInfo = False
				LogMessage "WARN","Verification","Date matching with the expected value. Expected: "& strCreatedDatePattern &" , Actual: "&strActualDateTime ,False
			End If
	End If
	verifyAccount_BlockCode1Date=bVerifyKeyInfo
End Function
'[Verify Field Card Block Code on Key Info Page displayed as]
Public Function verifyCardBlockCode(strCard_BlockCode)
	Dim bVerifyKeyInfo:bVerifyKeyInfo=true
	If Not IsNull(strCard_BlockCode) Then
			If Not verifyInnerText(bcKeyInfo.lblCard_BlockCode() , strCard_BlockCode, "Card - Block Code")Then
					bVerifyKeyInfo = False
			End If
	End If
	verifyCardBlockCode=bVerifyKeyInfo
End Function
'[Verify Field Card Block Code Date on Key Info Page displayed as]
Public Function verifyCard_BlockDate(strCard_BlockDate)
	Dim bVerifyKeyInfo:bVerifyKeyInfo=true

    	If Not IsNull(strCard_BlockDate) Then
			strActualDateTime=bcKeyInfo.lblCard_BlockDate.GetROProperty("innertext")
		If Ucase(strCard_BlockDate)="TODAY" Then
			If len(Day(CDate(Now)))=1 Then
				strDay="0"&Day(CDate(Now))
			else
				strDay=""&Day(CDate(Now))
			End If
			strCreatedDatePattern=""&strDay & " "&monthName(Month(CDate(Now)),true) &" " &Year(CDate(Now))&" ([0-2][0-9]:[0-9][0-9])"
		elseif 	Ucase(strCard_BlockDate)="VPLUS DATE TIME" Then
				strCreatedDatePattern=fetchFromDataStore("Verify Block Code And Reason Code From VPlus OFSA Screen","BLANK","DateAndTime_VPlus")(0) 'TODO To be updated with actual 
		
		elseif 	Ucase(strCard_BlockDate)="KR DATE TIME" Then
				strCreatedDatePattern=fetchFromDataStore("Verify Card Status and Reason Code in KRSP Screen ABIQ","BLANK","DateAndTime_KR")(0) 'TODO To be updated with actual 
		else
			strCreatedDatePattern=strSummary_DateTime &" ([0-2][0-9]:[0-9][0-9])"
		End If
		If Matchstr(strCreatedDatePattern,strActualDateTime) Then
			'If Ucase(Trim(strActualDateTime)) = UCase(Trim(strSummary_DateTime)) Then
				LogMessage "RSLT","Verification","Date matching with the expected value. Expected: "& strCreatedDatePattern &" , Actual: "& strActualDateTime ,True
			Else
				bVerifyKeyInfo = False
				LogMessage "WARN","Verification","Date matching with the expected value. Expected: "& strCreatedDatePattern &" , Actual: "&strActualDateTime ,False
			End If
	End If
	verifyCard_BlockDate=bVerifyKeyInfo
End Function

'[Verify Block Code in Account Summary table on Relationship Details Page]
Public Function verifyBlockCode_AccountSummary_Relationship(strCardNumber,strBlockCode)
    lstRowData=CheckNull("Account No.:"&strCardNumber&"|")
	intRow=getRowForColumn_Pagination(Relationship_Details.tblAccountSummaryHeader,Relationship_Details.tblAccountSummary,lstRowData,"Account Summary",True,Relationship_Details.lnkNext,Relationship_Details.lnkNext1,Relationship_Details.lnkPrevious)

		strBlockCode1=getCellTextFor (Relationship_Details.tblAccountSummaryHeader,Relationship_Details.tblAccountSummary,intRow,"Block Code 1")
		If strBlockCode1=strBlockCode Then
			LogMessage "RSLT","Verification","Block Code for Account Number "&strCardNumber&" matched with expected Block Code1 " &strBlockCode,true
			verifyBlockCode_AccountSummary_Relationship=true
		else
			LogMessage "WARN","Verification","Block Code for Account Number "&strCardNumber&" does not matched with expected Block Code1 " &strBlockCode& ", Actual BlockCode1 is "&strBlockCode1,false
			verifyBlockCode_AccountSummary_Relationship=false
		End If

End Function

'[Verify CSO Home Page is Displayed]
Public Function VerifyCSOHomePageisDisplayed()
   Dim bVerifyCSOHomePageisDisplayed:bVerifyCSOHomePageisDisplayed=true


  WaitForICallLoading
  If (bcCustomerSearch.btnSearchByCustomer.Exist(2)) Then
	LogMessage "RSLT","Verification","User able to login successfully.",true
	bVerifyCSOHomePageisDisplayed=true
  Else
	LogMessage "WARN","Verification","Unable to login successfully",false
	bVerifyCSOHomePageisDisplayed=false
  End If
  
  VerifyCSOHomePageisDisplayed=bVerifyCSOHomePageisDisplayed
End Function

'[Verify Block Code in Card Summary table on Relationship Details Page]
Public Function verifyBlockCode_CardSummary_Relationship(strAccountNumber,strCardNumber,strBlockCode)
    lstRowData=CheckNull("Account No.:"&strAccountNumber&"|")
	intRow=getRowForColumn_Pagination(Relationship_Details.tblAccountSummaryHeader,Relationship_Details.tblAccountSummary,lstRowData,"Account Summary",True,Relationship_Details.lnkNext,Relationship_Details.lnkNext1,Relationship_Details.lnkPrevious)
	clickVaddinLink_tblCell Relationship_Details.tblAccountSummaryHeader,Relationship_Details.tblAccountSummary,intRow, "Linked Card"
	WaitForIcallLoading

	 lstRowData=CheckNull("Card No.:"&strCardNumber&"|")
	intRowCard=getRowForColumn_Pagination(Relationship_Details.tblCardSummaryHeader,Relationship_Details.tblCardSummary,lstRowData,"Card Summary",false,Null,Null,Null)

		strBlockCodeCard=getCellTextFor (Relationship_Details.tblCardSummaryHeader,Relationship_Details.tblCardSummary,intRowCard,"Block Code")
		If strBlockCodeCard=strBlockCode Then
			LogMessage "RSLT","Verification","Block Code for Card Number "&strCardNumber&" matched with expected Block Code1 " &strBlockCode,true
			verifyBlockCode_CardSummary_Relationship=true
		else
			LogMessage "WARN","Verification","Block Code for Card Number "&strCardNumber&" does not matched with expected Block Code1 " &strBlockCode& ", Actual BlockCode1 is "&strBlockCodeCard,false
			verifyBlockCode_CardSummary_Relationship=false
		End If' 
End Function

'[Get New Card Number from Key Info Page]
Public Function getNewCardNumber()
	getNewCardNumber=clickLefmenuLink("Key Info")
	strRunTimeNewCardNumber_RC=bcKeyInfo.lblCard_Previous_NewCardNumber.GetROProperty("innertext")
	getNewCardNumber=true
End Function

'[Verify New Card Number from Card and PIN Info Page]
Public Function verifyNewCardNumber(strNewCardNumber)
	bverifyNewCardNumber=true
	If Not IsNull(strNewCardNumber) Then
	   If Not VerifyInnerText(bcKeyInfo.lblCard_Previous_NewCardNumber(),strNewCardNumber,"New Card Number") Then
		bverifyNewCardNumber = False
	   End If
	End If
	verifyNewCardNumber=bverifyNewCardNumber	
End Function

Public Function verifyAFW_Relationship(strAFWScore)
   Dim bRelationshipDetails
   bRelationshipDetails=true
 If Not IsNull(strAFWScore) Then
	   If Not VerifyInnerText(Relationship_Details.lblAFWScore(),strAFWScore,"AFW Score") Then
		bRelationshipDetails = False
	   End If
	End If
   verifyAFW_Relationship=bRelationshipDetails
End Function

'[Verify New Card Number and New Emboss Name in Card Summary table on Relationship Details Page]
Public Function verifyCardAndEmboss_CardSummary_Relationship(strAccountNumber,strNewEmbossName)
    lstRowData=CheckNull("Account No.:"&strAccountNumber&"|")
	intRow=getRowForColumn_Pagination(Relationship_Details.tblAccountSummaryHeader,Relationship_Details.tblAccountSummary,lstRowData,"Account Summary",True,Relationship_Details.lnkNext,Relationship_Details.lnkNext1,Relationship_Details.lnkPrevious)
	clickVaddinLink_tblCell Relationship_Details.tblAccountSummaryHeader,Relationship_Details.tblAccountSummary,intRow, "Linked Card"
	WaitForIcallLoading

	 lstRowData=CheckNull("Card No.:"&strRunTimeNewCardNumber_RC&"|")
	intRowCard=getRowForColumn_Pagination(Relationship_Details.tblCardSummaryHeader,Relationship_Details.tblCardSummary,lstRowData,"Card Summary",false,Null,Null,Null)

		strEmbossedName=getCellTextFor (Relationship_Details.tblCardSummaryHeader,Relationship_Details.tblCardSummary,intRowCard,"Embossed Name")
		If strEmbossedName=strNewEmbossName Then
			LogMessage "RSLT","Verification","New Embossed Name for Card Number "&strRunTimeNewCardNumber_RC&" matched with expected Name " &strNewEmbossName,true
			verifyCardAndEmboss_CardSummary_Relationship=true
		else
			LogMessage "WARN","Verification","New Embossed Name for Card Number "&strRunTimeNewCardNumber_RC&" does not matched with expected Embossed Name " &strNewEmbossName& ", Actual Name is "&strEmbossedName,false
			verifyCardAndEmboss_CardSummary_Relationship=false
		End If' 
End Function

'[Verify Card Status in CardlList Table for New Card]
Public Function verifyCardStatusCardList(strNewCardNumber_RC,strStatus)
   'This Function Selects Single Card
   lstCardData= Array("Card Number:"&strNewCardNumber_RC,"Card Status:"&strStatus)
   bDevPending=False
   verifyCardStatusCardList=verifySingleRowDataInTable(bcCardList.tblCardListHeader,bcCardList.tblCardListContent,lstCardData,"Card List",True,bcCardList.lnkNext,bcCardList.lnkNext1,bcCardList.lnkPrevious)
  
End Function

'[Verify Field Card Status on Card and PIN Info page displayed as]
Public Function verifyCardStatus_CardPinInfo(strSummary_CardStatus)
   bVerifyCardAndPINInfo=true
	  If Not IsNull(strSummary_CardStatus) Then
	  			strActualStatus=bcCardAndInfo.lblSummary_CardStatus.GetROProperty("innertext")
				If Ucase(Trim(strActualStatus)) = UCase(Trim(strSummary_CardStatus)) Then
					LogMessage "RSLT","Verification","Card Status matching with the expected value. Expected: "& strSummary_CardStatus &" , Actual: "& strActualStatus ,True
				Else
					bVerifyCardAndPINInfo = False
					LogMessage "WARN","Verification","Card Status not matching with the expected value. Expected: "& strSummary_CardStatus &" , Actual: "& strActualStatus ,False
				End If
		End If
		verifyCardStatus_CardPinInfo=bVerifyCardAndPINInfo
End Function
'[Verify Field Reason on Card and PIN Info page displayed as]
Public Function verifyCardReason_CardPinInfo(strSummary_Reason)
   bVerifyCardAndPINInfo=true
	If Not IsNull(strSummary_Reason) Then
		strActualReason=bcCardAndInfo.lblSummary_Reason.GetROProperty("innertext")
			If Ucase(Trim(strActualReason)) = UCase(Trim(strSummary_Reason)) Then
				LogMessage "RSLT","Verification","Reason matching with the expected value. Expected: "& strSummary_Reason &" , Actual: "& strActualReason ,True
			Else
				bVerifyCardAndPINInfo = False
				LogMessage "WARN","Verification","Reason not matching with the expected value. Expected: "& strSummary_Reason &" , Actual: "&strActualReason ,False
			End If
	End If
	verifyCardReason_CardPinInfo=bVerifyCardAndPINInfo
End Function

'[Verify Field Date Time on Card and PIN Info page displayed as]
Public Function verifyDateTime_CardPinInfo(strSummary_DateTime)
	bVerifyCardAndPINInfo=true
	If Not IsNull(strSummary_DateTime) Then
			strActualDateTime=bcCardAndInfo.lblSummary_DateTime.GetROProperty("innertext")
		If Ucase(strSummary_DateTime)="TODAY" Then
			If len(Day(CDate(Now)))=1 Then
				strDay="0"&Day(CDate(Now))
			else
				strDay=""&Day(CDate(Now))
			End If
			strCreatedDatePattern=""&strDay & " "&monthName(Month(CDate(Now)),true) &" " &Year(CDate(Now))&" ([0-2][0-9]:[0-9][0-9])"
		elseif 	Ucase(strSummary_DateTime)="KR DATE TIME" Then
				strCreatedDatePattern=fetchFromDataStore("Verify Card Status and Reason Code in KRSP Screen ABIQ","BLANK","DateAndTime_KR")(0) 'TODO To be updated with actual 
		else
			strCreatedDatePattern=strSummary_DateTime &" ([0-2][0-9]:[0-9][0-9])"
		End If
		If Matchstr(strActualDateTime,strCreatedDatePattern) Then
			'If Ucase(Trim(strActualDateTime)) = UCase(Trim(strSummary_DateTime)) Then
				LogMessage "RSLT","Verification","Date and Time matching with the expected value. Expected: "& strCreatedDatePattern &" , Actual: "& strActualDateTime ,True
			Else
				bVerifyCardAndPINInfo = False
				LogMessage "WARN","Verification","Date and Time not matching with the expected value. Expected: "& strCreatedDatePattern &" , Actual: "&strActualDateTime ,False
			End If
	End If
	verifyDateTime_CardPinInfo=bVerifyCardAndPINInfo
End Function

'[Select Tab Customer Overview]
Public Function SelectTabCustomerOverview()
   	SelectTabCustomerOverview=selectTab("Overview")
End Function

'[If Alert Page Is Displayed Handle Alert]
Public Function IfAlertPageIsDisplayedHandleAlert()
	Dim bIfAlertPageIsDisplayedHandleAlert:bIfAlertPageIsDisplayedHandleAlert=true
	If  bcCustomerOverview.rdbtnActive().exist(2) OR (bcCustomerOverview.popupAlert().exist(2)) Then
		bcCustomerOverview.btnOK_Alert.click
		LogMessage "RSLT", "Verification","Alert window appeared and handled successfully.", True
		bIfAlertPageIsDisplayedHandleAlert=true
	ElseIf (bcActivities.tabActivities.Exist(2)) Then
		LogMessage "RSLT", "Verification","Customer Overview page displayed successfully without alert.", True
		bIfAlertPageIsDisplayedHandleAlert=true
	Else
		LogMessage "WARN", "Verification","Getting error. Unable to view Customer Overview Page or Alert Window.", false
		bIfAlertPageIsDisplayedHandleAlert=False
	End If
	IfAlertPageIsDisplayedHandleAlert=bIfAlertPageIsDisplayedHandleAlert
End Function

'[If Highlight Page Is Displayed Handle Highlight]
Public Function IfHighlightPageDisplayedHandleHighlight()
	Dim bIfHighlightPageDisplayedHandleHighlight:bIfHighlightPageDisplayedHandleHighlight=true
	If  bcCustomerOverview.popupHighlights().exist(1) Then
		bcCustomerOverview.btnOK_Highlights.click
		LogMessage "RSLT", "Verification","Highlight window appeared and handled successfully.", True
		bIfHighlightPageDisplayedHandleHighlight=true
	ElseIf (bcActivities.tabActivities.Exist(1)) Then
		LogMessage "RSLT", "Verification","Customer Overview page displayed successfully without Highlight.", True
		bIfHighlightPageDisplayedHandleHighlight=true
	Else
		LogMessage "WARN", "Verification","Getting error. Unable to view Customer Overview Page or Highlight Window.", false
		bIfHighlightPageDisplayedHandleHighlight=False
	End If
	IfHighlightPageDisplayedHandleHighlight=bIfHighlightPageDisplayedHandleHighlight
End Function

'[Click Alert Button on Customer Overview Page]
Public Function clickAlert_custOverview()
   bClickAlert=false
   	bAlertButton = Browser("Browser_iCall_Home").Page("iCall_Customer_Alert").WebElement("btnAlerts").GetROProperty("disabled")

	For iCount=0 to 10
			bAlertButton = Browser("Browser_iCall_Home").Page("iCall_Customer_Alert").WebElement("btnAlerts").GetROProperty("disabled")
			If (bAlertButton = False) then
					bcCustomerOverview.btnAlerts().Click
					WaitForICallLoading
					LogMessage "RSLT","Verification","Alert button is enabled as expected",True
				  Exit for
			Else    
					wait 4
					bClickAlert=false
			End If
	Next
	 If Not bcCustomerOverview.alertWindowExists() then
		LogMessage "WARN","Verification","Verification failed. Expected Alert window should available on screen, Actual Alert screen is not available on screen",TRUE
		bClickAlert=false
	  else
		bClickAlert=true
	  End If
	clickAlert_custOverview=bClickAlert
End Function

'[Click Linked Card link in Table Account Summary for Relationship Details]
Public Function clickLinkedCard_AccountSummary_RelationshipDetails(lstAccountSummaryData)
   bDevPending=false
   clickLinkedCard_AccountSummary_RelationshipDetails=selectTableLink(Relationship_Details.tblAccountSummaryHeader,Relationship_Details.tblAccountSummary,lstAccountSummaryData,"AccountSummary_RelationshipDetails" ,"Linked Card",bPagination,Relationship_Details.lnkNext ,Relationship_Details.lnkNext1 ,Relationship_Details.lnkPrevious)
End Function


'[Verify Card Summary table is displayed in Relationship Details Page]
Public Function verifyCardSummary_RelationshipDetails()
	bDevPending=false
    If Not (Relationship_Details.tblCardSummaryHeader.Exist(0)) Then
        LogMessage "WARN","Verification","Card Summary  table is not displaying",False
		verifyCardSummary_RelationshipDetails= False
	Else
        LogMessage "RSLT","Verification","Card Summary table is displaying",True
		verifyCardSummary_RelationshipDetails= True	
	End If
End Function

'[Click More Info Link in Card Summary for Relationship Details]
Public Function clickMoreInfo_RelationshipDetails(lstCardSummaryData)
	bDevPending=false
	clickMoreInfo_RelationshipDetails=selectTableLink(Relationship_Details.tblCardSummaryHeader,Relationship_Details.tblCardSummary,lstCardSummaryData,"CardSummary_RelationshipDetails" ,"More Info",bPagination,Relationship_Details.lnkNext ,Relationship_Details.lnkNext1 ,Relationship_Details.lnkPrevious)
End Function

'[Verify Status on Pink Panel on Card Account Summary]
Public Function verifyStatusPinkPanel(strStatusonSummary)
   bverifyStatusPinkPanel=true
   If not Isnull (strStatusonSummary) Then
	   If Not VerifyInnerText(BlockCancelCards.lblStatus(), strStatusonSummary, "Status") Then
		bverifyStatusPinkPanel=false	
	   End If
   End If
	verifyStatusPinkPanel=bverifyStatusPinkPanel
End Function

'[Verify Account on Customer Overview Page]
Public Function verifyClosedAccounts(strAccountStatus, strProductType, lstLstAccounts)
verifyClosedAccounts=bcCustomerOverview.VerifyCustomerOverviewAccounts(strAccountStatus, strProductType, lstLstAccounts)
End Function

'[User click Unknown SR Number form Service Request Tab]
Public Function clickUnknownSRNumber(strAssignTo,strSubType,strCIN)
	'As per new requirement SR number will not come on Request Submit pop up.
	' User will not know SR number. Selecting one specific SR. As first SR will be latest one.
	'*********** By Manish on 11 March 2015
	'strRunTimeSRNumber_SRTable=ServiceRequest.tblServiceRequestContent.ChildItem(strSRCount,1,"WebElement", 0).GetROProperty("innertext")
	'clickVaddinLink_tblCell ServiceRequest.tblServiceRequestHeader,ServiceRequest.tblServiceRequestContent,strSRCount,"Service Request No"
	strSubType=trim(strSubType)
	wait 2
	'strQueryJob_ID="select JOB_ID from orchsvc_job ORDER BY start_datetime DESC"
	'strQuery_JobID=getDBValForColumn_OL(strQueryJob_ID)(0)	
	strQuery="select c3_sr_id from orchsvc_sr where assigned_to='"&strAssignTo&"' and sub_type='"&strSubType&"' and contact_cin='"&strCIN&"' order by created_datetime desc"
	strQuery_SRNumber=getDBValForColumn_OL(strQuery)(0)
	'strQuery_SRNumber=getDBValForColumn_NZD(strQuery)(0)	
	wait 2
	UserclickServiceRequestLink=selectTableLink(ServiceRequest.tblServiceRequestHeader, ServiceRequest.tblServiceRequestContent,_
	Array("SR No.:"&strQuery_SRNumber),"Service Requests","SR No.",true,null,null,null)	
	WaitForIcallLoading
	If strQuery_SRNumber<>"" Then
		insertDataStore "SelectedSRLink", strQuery_SRNumber   		
	End If
	clickUnknownSRNumber=true
End Function

'************* For Icomm Added by  on 29th April **************************'
'[User click Unknown SR Number form Service Request Tab for Send SMS]
Public Function ClickUnknownSRNumber_SendSMS(strAssignTo,strSubType,strCIN)
	strSubType=trim(strSubType)
	wait 2
	strQuery="select c3_sr_id from orchsvc_sr where assigned_to='"&strAssignTo&"' and sub_type='"&strSubType&"' and contact_cin='"&strCIN&"' order by created_datetime desc"
	strQuery_SRNumber=getDBValForColumn_OL_CS(strQuery)(0)
	wait 2
	UserclickServiceRequestLink=selectTableLink(ServiceRequest.tblServiceRequestHeader, ServiceRequest.tblServiceRequestContent,_
	Array("SR No.:"&strQuery_SRNumber),"Service Requests","SR No/ Case No",true,null,null,null)	
	WaitForIcallLoading
	ClickUnknownSRNumber_SendSMS=strQuery_SRNumber
End Function


'[Click unknown SR Number for Capture at Source]
Public Function ClickUnknownSRNumber_CS(strSubType,strCIN)
	strSubType=trim(strSubType)
	wait 2
	strQuery="select c3_sr_id from orchsvc_sr where sub_type='"&strSubType&"' and contact_cin='"&strCIN&"' order by created_datetime desc"
	strQuery_SRNumber=getDBValForColumn_OL_CS(strQuery)(0)
	wait 2
	UserclickServiceRequestLink=selectTableLink(ServiceRequest.tblServiceRequestHeader, ServiceRequest.tblServiceRequestContent,_
	Array("SR No.:"&strQuery_SRNumber),"Service Requests","SR No.",true,null,null,null)	
	WaitForIcallLoading
	
'	If strQuery_SRNumber<>"" Then
'		insertDataStore "SelectedSRLink", strQuery_SRNumber   		
'	End If
	ClickUnknownSRNumber_CS=strQuery_SRNumber
End Function

'[User click Service Request Link from Service Request Tab]
Public Function clickSRLink(strSRNumber)
   bDevPending=false
   'strQuery_SRNumber="SELECT sr_num FROM orchsvc_job order by start_datetime DESC"
	'strSRNumber=getDBValForColumn(strQuery_SRNumber)(0)
	
   If Ucase(strSRNumber="DATASTORE_MULTIPLE_SR") Then
	strSRNumber=strRunTimeSRNumber
   End If
   If Ucase(strSRNumber="DATASTORE_SINGLE_SR") Then
	strSRNumber=fetchFromDataStore("Verify Field SR Number displayed as Link","BLANK","SingleSRNumber")(0) 'TODO To be updated with actual 
   End If
   
   If not isNull(strSRNumber) Then
		'UserclickServiceRequestLink=selectTableLink(ServiceRequest.tblServiceRequestHeader, ServiceRequest.tblServiceRequestContent,_
	'Array("Service Request No:"&strSRNumber),"Service Requests","Service Request No",true,ServiceRequest.lnkNext,ServiceRequest.lnkNext1,ServiceRequest.lnkPrevious)
   UserclickServiceRequestLink=selectTableLink(ServiceRequest.tblServiceRequestHeader, ServiceRequest.tblServiceRequestContent,_
Array("SR No.:"&strSRNumber),"Service Requests","SR No.",true,null,null,null)
   else
		clickSRLink=False
		Exit Function
	End If
	clickSRLink=true
End Function

'[User click Service Request Link from Service Request Tab For Child SR]
Public Function clickSRLink_ChildSR(strAssignTo,strSubType,strCIN)
   bDevPending=false

   strQuery="select c3_sr_id from orchsvc_sr where assigned_to='"&strAssignTo&"' and sub_type='"&strSubType&"' and contact_cin='"&strCIN&"' order by created_datetime desc"
	strSRNumber=getDBValForColumn_OL(strQuery)(0)
	'strSRNumber=""&Split(strQuery_SRNumber,"-")(0)&"-"&(Split(strQuery_SRNumber,"-")(1))+10
	'strSRNumber=""&Split(strQuery_SRNumber,"-")(0)&"-"&Split(strQuery_SRNumber,"-")(1)&"-"&Split(strQuery_SRNumber,"-")(2)&"-"&(Split(strQuery_SRNumber,"-")(3))+10
   If not isNull(strSRNumber) Then
		UserclickServiceRequestLink=selectTableLink(ServiceRequest.tblServiceRequestHeader, ServiceRequest.tblServiceRequestContent,_
	Array("SR No.:"&strSRNumber),"Service Requests","SR No.",true,ServiceRequest.lnkNext,ServiceRequest.lnkNext1,ServiceRequest.lnkPrevious)
   else
		clickSRLink_ChildSR=False
		Exit Function
	End If
	clickSRLink_ChildSR=true
End Function

'[User click Service Request tab]
Public Function clickServiceRequesttab()
	Wait 30
	ServiceRequest.tabServiceRequest().click()
	WaitForIcallLoading
	wait 2
	clickServiceRequesttab=true
End Function

'Added by kalyan as part of 1603 changes dated 12-07-2016

'[Verify Pink Panel displayed in NewSR Page]
Public Function verifyPinkPanel_NewSR(strName,StrCIN,StrSegment)
bverifyPinkPanel_NewSR=true
	
	If Not IsNull(strName) Then
		If Not VerifyInnerText(ServiceRequest.lblName(),strName,"Name") Then
	bverifyPinkPanel_NewSR = False
	End If
End If

	If Not IsNull(StrCIN) Then
		If Not VerifyInnerText(ServiceRequest.lblCIN(),StrCIN,"CIN") Then
bverifyPinkPanel_NewSR = False
	End If
End If
	
	If Not IsNull(StrSegment) Then
		If Not VerifyInnerText(ServiceRequest.lblSegment(),StrSegment,"Segment") Then
bverifyPinkPanel_NewSR = False
	End If
End If
verifyPinkPanel_NewSR=bverifyPinkPanel_NewSR
End Function

'[Verify Archeive Indicator for Service Request]
Public Function verifyArcheiveIndServiceReq(strArcheiveInd)
   bverifyArcheiveIndServiceReq=true
   'intImgIndIcon =InStr(ViewSR.ImgServiceRequestArcheiveInd.GetROProperty("outerhtml"),"info-icon")
   intImgIndIcon =ViewSR.ImgServiceRequestArcheiveInd.GetROProperty("visible")
   intlblIndIcon =ViewSR.lblServiceRequestArcheiveInd.GetROProperty("visible")
   If intImgIndIcon="True" Then
		'LogMessage "RSLT","Verification","Archive Indicator is displayed as expected.",True
		LogMessage "RSLT","Verification","Archive Indicator is displayed as expected.",True
		bverifyArcheiveIndServiceReq=true
	Else
		'LogMessage "WARN","Verification","Archive Indicator not displayed:Expected to be displayed",false
		'LogMessage "RSLT", "Verification","Highlight window appeared and handled successfully.", True
		bverifyArcheiveIndServiceReq=false
		LogMessage "WARN","Verification","Archieve Indicator not displayed. Expected to be displayed.",false
		
	End If
	
   If intlblIndIcon="True" Then
   	If not Isnull (strArcheiveInd) Then
	   If Not VerifyInnerText(ViewSR.lblServiceRequestArcheiveInd(), strArcheiveInd, "Archeive Indicator") Then
		bverifyArcheiveIndServiceReq=false	
	   End If
   End If
   End If
   
	verifyArcheiveIndServiceReq=bverifyArcheiveIndServiceReq
End Function

'[Verify Archeive Indicator not displaying for Service Request]
Public Function verifyArcheiveIndServiceReq1()
   bverifyArcheiveIndServiceReq1=true
   'intImgIndIcon1 =InStr(ViewSR.ImgServiceRequestArcheiveInd.GetROProperty("outerhtml"),"info-icon")
   intImgIndIcon1=ViewSR.ImgActivityArcheiveInd.GetROProperty("visible")
   If intImgIndIcon1="False" Then
		LogMessage "RSLT","Verification","Archieve Indicator not displayed as expected.",True
		bverifyArcheiveIndServiceReq1=true
	Else
		LogMessage "WARN","Verification","Archieve Indicator displayed. Expected not to be displayed.",false
		bverifyArcheiveIndServiceReq1=false
	End If
	verifyArcheiveIndServiceReq1=bverifyArcheiveIndServiceReq1
End Function

'[Verify Archeive Indicator for Activities]
Public Function verifyArcheiveIndActivities(strArcheiveInd)
   bverifyArcheiveIndActivities=true
   'intImgIndIconIA =InStr(ViewIA.ImgActivityArcheiveInd.GetROProperty("outerhtml"),"info-icon")
   intImgIndIconIA =ViewIA.ImgActivityArcheiveInd.GetROProperty("visible")
   intlblIndIconIA =ViewIA.lblActivityArcheiveInd.GetROProperty("visible")
   If intImgIndIcon="True" Then
		LogMessage "RSLT","Verification","Archieve Indicator is displayed as expected.",True
		bverifyArcheiveIndServiceReq=true
	Else
		LogMessage "WARN","Verification","Archieve Indicator not displayed. Expected to be displayed.",false
		bverifyArcheiveIndServiceReq=false
	End If
	If intlblIndIconIA="True" Then
		If not Isnull (strArcheiveInd) Then
	     If Not VerifyInnerText(ViewIA.lblActivityArcheiveInd(), strArcheiveInd, "Archeive Indicator") Then
		 bverifyArcheiveIndActivities=false	
	     End If
       End If
	End If
   
	verifyArcheiveIndActivities=bverifyArcheiveIndActivities
End Function

'[Verify Archeive Indicator not displaying for Activities]
Public Function verifyArcheiveIndActivities1()
   bverifyArcheiveIndActivities1=true
   'intImgIndIconIA1 =InStr(ViewIA.ImgActivityArcheiveInd.GetROProperty("outerhtml"),"info-icon")
   intImgIndIconIA1 =ViewIA.ImgActivityArcheiveInd.GetROProperty("visible")
   If intImgIndIconIA1="False" Then
		LogMessage "RSLT","Verification","Archieve Indicator not displayed as expected.",True
		bverifyArcheiveIndActivities1=true
	Else
		LogMessage "WARN","Verification","Archieve Indicator displayed. Expected not to be displayed.",false
		bverifyArcheiveIndActivities1=false
	End If
	verifyArcheiveIndActivities1=bverifyArcheiveIndActivities1
End Function

'[Verify row Data in Table ActivityTab_Records]
Public Function verifytbl_ActivityTab_Records_RowData(arrRowDataList)
   bDevPending=false
   verifytbl_ActivityTab_Records_RowData=verifyTableContentList(ServiceRequest.tblActivityListHeader,ServiceRequest.tblActivityListContent,arrRowDataList,"ActivityTab_Records" ,True,ServiceRequest.lnkNext ,ServiceRequest.lnkNext1,ServiceRequest.lnkPrevious)
End Function


'Added by Kalyan for 1603 dated: 20-07-2016

'[Verify row Data in Table ServiceRequestTab_Records]
Public Function verifytbl_ServiceReqTab_Records_RowData(arrRowDataList)
   bDevPending=false
   verifytbl_ServiceReqTab_Records_RowData=verifyTableContentList(ServiceRequest.tblServiceRequestHeader,ServiceRequest.tblServiceRequestContent,arrRowDataList,"ServiceRequestTab_Records" ,True,ServiceRequest.lnkNext ,ServiceRequest.lnkNext1,ServiceRequest.lnkPrevious)
End Function

'[Verify row Data in Table PendingSRTab_Records]
Public Function verifytbl_PendingSRTab_Records_RowData(arrRowDataList)
   bDevPending=false
   verifytbl_PendingSRTab_Records_RowData=verifyTableContentList(ServiceRequest.tblPendingSRHeader,ServiceRequest.tblPendingSRContent,arrRowDataList,"PendingSRTab_Records" ,True,ServiceRequest.lnkNext ,ServiceRequest.lnkNext1,ServiceRequest.lnkPrevious)
End Function

'[Verify Pagination for the ServiceRequest table displayed]
Public Function ValidatePagination_ServiceRequest(strTtlRecords)
bValidatePagination_ServiceRequest=true
bNextPageExist = True
totalRecords=0
If not Isnull (strTtlRecords) Then
While bNextPageExist = True
intRecordCount = getRecordsCountForColumn(ServiceRequest.tblServiceRequestHeader,ServiceRequest.tblServiceRequestContent,"ServiceReq No.") 
iCheck = 5
If intRecordCount <=iCheck Then
LogMessage "RSLT","Verification","Number of records displayed per page matched with expected. Expected Count is less than or equal to "&iCheck, true 
'msgbox intRecordCount
bValidatePagination_ServiceRequest=true
If intRecordCount < iCheck Then
bNextPageExist =matchStr(ServiceRequest.lnkNext.GetROProperty("class"),"enabled")
If bNextPageExist Then
LogMessage "WARN","Verification","Next link expected to be disabled if record is less than "&iCheck&". Currently it is enabled.",false
bValidatePagination_ServiceRequest=false
Else
LogMessage "RSLT","Verification","Next link is disabled as per expectation.",true
End If
ElseIf intRecordCount = iCheck Then
bNextPageExist = matchStr(ServiceRequest.lnkNext.GetROProperty("class"),"enabled")
If bNextPageExist Then
ServiceRequest.lnkNext.Click
End If
End If
Else 
LogMessage "RSLT","Verification","Number of records displayed per page not matched with expected. Expected Count is less than or equal to 5", false 
bNextPageExist = False
End If
totalRecords=totalRecords+intRecordCount
Wend
If totalRecords= cInt(strTtlRecords) Then
	LogMessage "RSLT","Verification","Records matched as per expectation.",true
	Else
	LogMessage "WARN","Verification","Records not matched as per expectation.Expected "&strTtlRecords&".Actual "&totalRecords&".",false
End If
End If
End Function

'[Verify Pagination for the Home Page ServiceRequest table displayed]
Public Function ValidatePagination_ServiceRequestHP(strTtlRecords)
bValidatePagination_ServiceRequestHP=true
bNextPageExist = True
totalRecords=0
If not Isnull (strTtlRecords) Then
While bNextPageExist = True
intRecordCount = getRecordsCountForColumn(CSO_TM_Home.tblSRActivityHeader,CSO_TM_Home.tblSRActivityContent,"Created Date") 
iCheck = 10
If intRecordCount <=iCheck Then
LogMessage "RSLT","Verification","Number of records displayed per page matched with expected. Expected Count is less than or equal to "&iCheck, true 
'msgbox intRecordCount
bValidatePagination_ServiceRequestHP=true
If intRecordCount < iCheck Then
bNextPageExist =matchStr(CSO_TM_Home.lnkNext.GetROProperty("class"),"enabled")
If bNextPageExist Then
LogMessage "WARN","Verification","Next link expected to be disabled if record is less than "&iCheck&". Currently it is enabled.",false
bValidatePagination_ServiceRequestHP=false
Else
LogMessage "RSLT","Verification","Next link is disabled as per expectation.",true
End If
ElseIf intRecordCount = iCheck Then
bNextPageExist = matchStr(CSO_TM_Home.lnkNext.GetROProperty("class"),"enabled")
If bNextPageExist Then
CSO_TM_Home.lnkNext.Click
End If
End If
Else 
LogMessage "RSLT","Verification","Number of records displayed per page not matched with expected. Expected Count is less than or equal to 10", false 
bNextPageExist = False
End If
totalRecords=totalRecords+intRecordCount
Wend
If totalRecords= cInt(strTtlRecords) Then
	LogMessage "RSLT","Verification","Records matched as per expectation.",true
	Else
	LogMessage "WARN","Verification","Records not matched as per expectation.Expected "&strTtlRecords&".Actual "&totalRecords&".",false
End If
End If
End Function

'[Verify Pagination for the Activities table displayed]
Public Function ValidatePagination_Activities(strTtlRecords)
bValidatePagination_Activities=true
bNextPageExist = True
totalRecords=0
If not Isnull (strTtlRecords) Then
While bNextPageExist = True
intRecordCount = getRecordsCountForColumn(ServiceRequest.tblActivityListHeader,ServiceRequest.tblActivityListContent,"Activity No.") 
iCheck = 5
If intRecordCount <=iCheck Then
LogMessage "RSLT","Verification","Number of records displayed per page matched with expected. Expected Count is less than or equal to "&iCheck, true 
'msgbox intRecordCount
bValidatePagination_Activities=true
If intRecordCount < iCheck Then
bNextPageExist =matchStr(ServiceRequest.lnkNext.GetROProperty("class"),"enabled")
If bNextPageExist Then
LogMessage "WARN","Verification","Next link expected to be disabled if record is less than "&iCheck&". Currently it is enabled.",false
bValidatePagination_Activities=false
Else
LogMessage "RSLT","Verification","Next link is disabled as per expectation.",true
End If
ElseIf intRecordCount = iCheck Then
bNextPageExist = matchStr(ServiceRequest.lnkNext.GetROProperty("class"),"enabled")
If bNextPageExist Then
ServiceRequest.lnkNext.Click
End If
End If
Else 
LogMessage "RSLT","Verification","Number of records displayed per page not matched with expected. Expected Count is less than or equal to 5", false 
bNextPageExist = False
End If
totalRecords=totalRecords+intRecordCount
Wend
If totalRecords= cInt(strTtlRecords) Then
	LogMessage "RSLT","Verification","Records matched as per expectation.",true
	Else
	LogMessage "WARN","Verification","Records not matched as per expectation.",false
End If
End If
End Function

'[User click Info Warn button]
Public Function clickInfoWarnimg()
	'Wait 30
	bInfoWarnExist=True
	'bInfoWarnExist =matchStr(bcInfoWarning.btn_InfoWarn_Page.GetROProperty("class"),"enabled")
	'If bInfoWarnExist Then
		bcInfoWarning.btn_InfoWarn_Page().click()
	'End If
	WaitForIcallLoading
	wait 2
	clickInfoWarnimg=true
End Function

'[Verify Info Warn popup msg]
Public Function verifyInfoWarnPopupMsg(strInfoWarnMsg)
   bverifyInfoWarnPopupMsg=true
   If not Isnull (strInfoWarnMsg) Then
	   If Not VerifyInnerText(bcInfoWarning.lblMessage_InfoWarn(), strInfoWarnMsg, "InfoWarn Msg") Then
		bverifyInfoWarnPopupMsg=false	
	   End If
   End If
   bcInfoWarning.btn_InfoWarn_Page_OK().click()
	verifyInfoWarnPopupMsg=bverifyInfoWarnPopupMsg
End Function


'Added by  as part of Icomm design = dated 22Apr]
'[User click Contact details tab in Customer Overview Page]
Public Function clickContactDetailstab()
	wait 05
	bcCustomerOverview.weTabContactDetails().click()
	WaitForIcallLoading
	'wait 2
	clickContactDetailstab=true
End Function

'[User click Pending SR tab]
Public Function clickPendingSRtab()
	Wait 2
	ServiceRequest.tabPendingSR().click()
	WaitForIcallLoading
	wait 2
	clickPendingSRtab=true
End Function

'[Close All Tab Except Overview Tab]
Public Function closeAllTabExceptOverview()
   closeAllTabExceptOverview=closeAllTab("Overview")
End Function


'[Verify Relationship Summary and Account Details table on Rewards]
Public Function verifyRelationshipSummary(lstlstRewardsSummary,strCardNumber,lstYesterdaysBalance,lstRedeemedToday,lstCurrentBalance)
	bverifyRelationshipSummary=true
	If not  (Rewards.verifyTableContentList( Rewards.tblRelationshipSummaryHeader, Rewards.tblRelationshipSummaryContent,lstlstRewardsSummary,"Relationsihp Summary",false,Null,Null,Null))Then
		bverifyRelationshipSummary=false
	End If
	If Not (Rewards.verifyRewards_AccountDetails(null,strCardNumber,lstYesterdaysBalance,lstRedeemedToday,lstCurrentBalance,null,null))Then
		bverifyRelationshipSummary=false
	End If
	verifyRelationshipSummary=bverifyRelationshipSummary
End Function

'[Verify Rebates]
Public Function verifyRebates(strRewardsShow,lstRebateSummary,lstlstRebateBreakdown)
	bverifyRebates=true
	Rewards.selectRadioGroup rbtnRewardsummary, strRewardsShow, array("DBS Points","Rebates")
	If Not verifyCashRebet(lstRebateSummary,lstlstRebateBreakdown,null,null) Then
		bverifyRebates=false
	End If
End Function

'[Verify Tab Credit Card displayed]
Public Function verifyTabCreditCardexist()
   bDevPending=false
   verifyTabCreditCardexist=verifyTabExists("Credit Card-.*")
End Function

'[Click SR Shortcut Button]
Public Function clickSRShortcutButton(strButtonToClick)
	Set oDesc=Description.Create
		oDesc("micclass").Value = "WebElement"
		'oDesc("class").Value = "content-sheet-footer"
		oDesc("xpath").Value = "//*[contains(@class,'md-tab-content') and contains(@class,'md-active') and contains(@class,'has-is-footer')]"
		Set obj= Browser("Browser_iCall_Home").Page("iCall_ServiceRequest").ChildObjects(oDesc)
		
		Set oDescFooter=Description.Create
		oDescFooter("micclass").Value = "WebElement"
		oDescFooter("class").Value = "isFooter layout"
		Set objFooter= obj(0).ChildObjects(oDescFooter)
		
		Set oDescBtn=Description.Create
		oDescBtn("micclass").Value = "WebElement"
		'oDescBtn("class").Value = "v-button-caption"
		oDescBtn("class").Value = "ng-binding ng-scope"

		set objBtnSet=objFooter(0).ChildObjects(oDescBtn)
		intBtnCount=objBtnSet.Count
		
    	Set oDescBtnToClick=Description.Create
		oDescBtnToClick("micclass").Value = "WebElement"
		oDescBtnToClick("class").Value = "ng-binding ng-scope"
		oDescBtnToClick("innertext").Value =""&strButtonToClick
		set objBtnToClick=objFooter(0).ChildObjects(oDescBtnToClick)
		intBtnCount=objBtnToClick.Count
		If intBtnCount=0 Then
			LogMessage "RSLT","Verification","SR Shortcut Button "&strButtonToClick&" not found on "&strLeftMenuName&" page.",false
			verifyShortcutButtons=false
			Exit Function
		else
			objBtnToClick(0).Click
			WaitForIcallLoading
			verifyShortcutButtons=true
			LogMessage "RSLT","Verification","SR Shortcut Button "&strButtonToClick&" clicked from "&strLeftMenuName&" page.",true
		End If
	clickSRShortcutButton=verifyShortcutButtons
End Function

'[Click on Back to Home Page]
Public Function clickBacktoHomePage()
	If bcCustomerOverview.btnBackToHomepage.Exist(1) Then
		bcCustomerOverview.btnBackToHomepage.click
		If Err.Number<>0 Then
			clickBacktoHomePage=false
			LogMessage "WARN","Verification","Failed to Click Button : BacktoHomePage" ,false
			Exit Function
		End If
		WaitForICallLoading
		clickBacktoHomePage=true
	End If
End Function

'[Verify SR Shortcut Button displayed]
Public Function verifyShortcutButton(strButtonToClick)
	Set oDesc=Description.Create
		oDesc("micclass").Value = "WebElement"
		'oDesc("class").Value = "content-sheet-footer"
		oDesc("xpath").Value = "//*[contains(@class,'md-tab-content') and contains(@class,'md-active') and contains(@class,'has-is-footer')]"
		Set obj= Browser("Browser_iCall_Home").Page("iCall_ServiceRequest").ChildObjects(oDesc)
		Set oDescFooter=Description.Create
		oDescFooter("micclass").Value = "WebElement"
		oDescFooter("class").Value = "isFooter layout"
		Set objFooter= obj(0).ChildObjects(oDescFooter)
		
		Set oDescBtn=Description.Create
		oDescBtn("micclass").Value = "WebElement"
		'oDescBtn("class").Value = "v-button-caption"
		oDescBtn("class").Value = "ng-binding ng-scope"

		set objBtnSet=objFooter(0).ChildObjects(oDescBtn)
		intBtnCount=objBtnSet.Count
    	Set oDescBtnToClick=Description.Create
		oDescBtnToClick("micclass").Value = "WebElement"
		'oDescBtnToClick("class").Value = "v-button-caption"
		oDescBtnToClick("class").Value = "ng-binding ng-scope"
		oDescBtnToClick("innertext").Value =""&strButtonToClick
		set objBtnToClick=objFooter(0).ChildObjects(oDescBtnToClick)
		intBtnCount=objBtnToClick.Count
		If intBtnCount=0 Then
			LogMessage "RSLT","Verification","SR Shortcut Button "&strButtonToClick&" not found on "&strLeftMenuName&" page.",false
			verifyShortcutButtons=false
			Exit Function
		else
			verifyShortcutButtons=true
			LogMessage "RSLT","Verification","SR Shortcut Button "&strButtonToClick&" displayed on "&strLeftMenuName&" page.",true
		End If
	verifyShortcutButton=verifyShortcutButtons
End Function

'[Verify Tab]
Public Function verifyTab(strTabName)
   bDevPending=False
   verifyTab=verifyTabExist(strTabName)
End Function

'[Select Tab]
Public Function setectTab(strTabName)
   bDevPending=false
   setectTab=selectTab(strTabName)
End Function

'[Close Tab]
Public Function closeTab_SR(strTabName)
   bDevPending=false
   closeTab_SR=closeTab(strTabName)
   WaitForICallLoading
End Function

'[Refresh CardList]
Public Function refreshCardList()
	brefreshCardList=true
	BlockCancelCards.btnRefreshCard.click
	WaitForICallLoading
   If Err.Number<>0 Then
       brefreshCardList=false
            LogMessage "WARN","Verification","Failed to Click Button : Refresh CardList" ,false
       Exit Function
   End If
   WaitForICallLoading
	refreshCardList=brefreshCardList
End Function

'[Verify Field Card Status From Card and PIN Info Screen]
Public Function CardStatus_CardPinInfo(strSummary_CardStatus)
	Dim bVerifyCardAndPINInfo:bVerifyCardAndPINInfo=true
	 If Not IsNull(strSummary_CardStatus) Then
		If Ucase(Trim(cCardAndInfo.lblSummary_CardStatus.GetROProperty("innertext"))) = UCase(Trim(strSummary_CardStatus)) Then
			LogMessage "RSLT","Verification","Card Status matching with the expected value. Expected: "& strSummary_CardStatus &" , Actual: "& cCardAndInfo.lblSummary_CardStatus.GetROProperty("innertext") ,True
			bVerifyCardAndPINInfo=true
		Else
			bVerifyCardAndPINInfo = False
			LogMessage "WARN","Verification","Card Status not matching with the expected value. Expected: "& strSummary_CardStatus &" , Actual: "& cCardAndInfo.lblSummary_CardStatus.GetROProperty("innertext") ,False
		End If
	End If
	CardStatus_CardPinInfo=bVerifyCardAndPINInfo
End Function
'[Verify  Field PIN Issued From Card and PIN Info Screen]
Public Function PinIssued_CardPinInfo(strSummary_PINIssued)
	Dim bVerifyCardAndPINInfo:bVerifyCardAndPINInfo=true
	 If Not IsNull(strSummary_PINIssued) Then
        If Ucase(Trim(bcCardAndInfo.lblSummary_PINIssued.GetROProperty("innertext"))) = UCase(Trim(strSummary_PINIssued)) Then
			LogMessage "RSLT","Verification","PIN Issued matching with the expected value. Expected: "& strSummary_PINIssued &" , Actual: "&cCardAndInfo.lblSummary_PINIssued.GetROProperty("innertext") ,True
		Else
			bVerifyCardAndPINInfo = False
			LogMessage "WARN","Verification","PIN Issued not matching with the expected value. Expected: "& strSummary_PINIssued &" , Actual: "& cCardAndInfo.lblSummary_PINIssued.GetROProperty("innertext") ,False
		End If
    End If
	PinIssued_CardPinInfo=bVerifyCardAndPINInfo
End Function
'[Verify Field PIN Gen Date From Card and PIN Info Screen]
Public Function PinGenDate_CardPinInfo(strDetails_PINGenDate)
	Dim bVerifyCardAndPINInfo:bVerifyCardAndPINInfo=true
	 If Not IsNull(strDetails_PINGenDate) Then
		strActualPINGen= bcCardAndInfo.lblDetails_PINGenDate.GetROProperty("innertext")
		If Ucase(strDetails_PINGenDate)="TODAY" Then
			If len(Day(CDate(Now)))=1 Then
				strDay="0"&Day(CDate(Now))
			else
				strDay=""&Day(CDate(Now))
			End If
			strDetails_PINGenDate=""&strDay & " "&monthName(Month(CDate(Now)),true) &" " &Year(CDate(Now))
		End If
		If Ucase(strDetails_PINGenDate)="NOT BLANK" Then
			If Ucase(Trim(strActualPINGen)) <>"" Then
				LogMessage "RSLT","Verification","PIN Gen date Not Blank As Expected" ,True
				PinGenDate_CardPinInfo=true
			Else
				PinGenDate_CardPinInfo = False
				LogMessage "WARN","Verification","Pin  Gen date is BLANK, it should not be BLANK as expected" ,False
			End If
			Exit Function
		End If
		If Ucase(Trim(strActualPINGen)) = UCase(Trim(strDetails_PINGenDate)) Then
			LogMessage "RSLT","Verification","PIN Gen date matching with the expected value. Expected: "& strDetails_PINGenDate &" , Actual: "& strActualPINGen ,True
		Else
			bVerifyCardAndPINInfo = False
			LogMessage "WARN","Verification","PIN Gen date not matching with the expected value. Expected: "& strDetails_PINGenDate &" , Actual: "& strActualPINGen ,False
		End If
	End If
	PinGenDate_CardPinInfo=bVerifyCardAndPINInfo
End Function
'[Verify Field Activation Date From Card and PIN Info Screen]
Public Function ActivationDate_CardPinInfo(strDetails_ActivationDate)
	Dim bVerifyCardAndPINInfo:bVerifyCardAndPINInfo=true
	 If Not IsNull(strDetails_ActivationDate) Then
		 strActualActivation=bcCardAndInfo.lblDetails_ActivationDate.GetROProperty("innertext")
		If Ucase(strDetails_ActivationDate)="TODAY" Then
			If len(Day(CDate(Now)))=1 Then
				strDay="0"&Day(CDate(Now))
			else
				strDay=""&Day(CDate(Now))
			End If
            strDetails_ActivationDate=""&strDay & " "&monthName(Month(CDate(Now)),true) &" " &Year(CDate(Now))
		End If
		If Ucase(strDetails_ActivationDate)="NOT BLANK" Then
			If Ucase(Trim(strActualActivation)) <>"" Then
				LogMessage "RSLT","Verification","Activation date Not Blank As Expected" ,True
				ActivationDate_CardPinInfo=true
			Else
				ActivationDate_CardPinInfo = False
				LogMessage "WARN","Verification","Activation date is BLANK, it should not be BLANK as expected" ,False
			End If
			Exit Function
		End If
		If Ucase(Trim(strActualActivation)) = UCase(Trim(strDetails_ActivationDate)) Then
			LogMessage "RSLT","Verification","Activation date matching with the expected value. Expected: "& strDetails_ActivationDate &" , Actual: "& strActualActivation ,True
		Else
			bVerifyCardAndPINInfo = False
			LogMessage "WARN","Verification","Activation date not matching with the expected value. Expected: "& strDetails_ActivationDate &" , Actual: "&strActualActivation ,False
		End If
	End If
	ActivationDate_CardPinInfo=bVerifyCardAndPINInfo
End Function
'[Verify Field Last Pin Issued Date From Card and PIN Info Screen]
Public Function LastPinIssued_CardPinInfo(strSummary_LastPINIssuedDate)
   Dim bVerifyCardAndPINInfo:bVerifyCardAndPINInfo=true
	 If Not IsNull(strSummary_LastPINIssuedDate) Then
		If Ucase(strSummary_LastPINIssuedDate)="TODAY" Then
			If len(Day(CDate(Now)))=1 Then
				strDay="0"&Day(CDate(Now))
			else
				strDay=""&Day(CDate(Now))
			End If
			strSummary_LastPINIssuedDate=""&strDay & " "&monthName(Month(CDate(Now)),true) &" " &Year(CDate(Now))
		End If
		If Ucase(Trim(bcCardAndInfo.lblSummary_LastPINIssuedDate.GetROProperty("innertext"))) = UCase(Trim(strSummary_LastPINIssuedDate)) Then
			LogMessage "RSLT","Verification","Last PIN Issued date matching with the expected value. Expected: "& strSummary_LastPINIssuedDate &" , Actual: "& cCardAndInfo.lblSummary_LastPINIssuedDate.GetROProperty("innertext") ,True
		Else
			bVerifyCardAndPINInfo = False
			LogMessage "WARN","Verification","Last PIN Issued date not matching with the expected value. Expected: "& strSummary_LastPINIssuedDate &" , Actual: "& cCardAndInfo.lblSummary_LastPINIssuedDate.GetROProperty("innertext") ,False
		End If
	End If
	LastPinIssued_CardPinInfo=bVerifyCardAndPINInfo
End Function

'[Verify Field Cashline and Account From Card and PIN Info Screen]
Public Function verifyCashLineLink_Account_CardPinInfo(strDetails_CashLineLink,strDetails_AccountNo)
Dim bVerifyCardAndPINInfo:bVerifyCardAndPINInfo=true
  If Not IsNull(strDetails_CashLineLink) Then
			If Ucase(Trim(bcCardAndInfo.lblDetails_CashLineLink.GetROProperty("innertext"))) = UCase(Trim(strDetails_CashLineLink)) Then
				LogMessage "RSLT","Verification","CashLine Link matching with the expected value. Expected: "& strDetails_CashLineLink &" , Actual: "& cCardAndInfo.lblDetails_CashLineLink.GetROProperty("innertext") ,True
			Else
				bVerifyCardAndPINInfo = False
				LogMessage "WARN","Verification","CashLine Link not matching with the expected value. Expected: "& strDetails_CashLineLink &" , Actual: "& cCardAndInfo.lblDetails_CashLineLink.GetROProperty("innertext") ,False
			End If
	End If


	If Not IsNull(strDetails_AccountNo) Then
			If Ucase(Trim(bcCardAndInfo.lblDetails_AccountNo.GetROProperty("innertext"))) = UCase(Trim(strDetails_AccountNo)) Then
				LogMessage "RSLT","Verification","Account Number matching with the expected value. Expected: "& strDetails_AccountNo &" , Actual: "& cCardAndInfo.lblDetails_AccountNo.GetROProperty("innertext") ,True
			Else
				bVerifyCardAndPINInfo = False
				LogMessage "WARN","Verification","Account No not matching with the expected value. Expected: "& strDetails_AccountNo &" , Actual: "& cCardAndInfo.lblDetails_AccountNo.GetROProperty("innertext") ,False
			End If
	End If
		verifyCashLineLink_Account_CardPinInfo=bVerifyCardAndPINInfo
End Function
'[Verify Fields ADD LINE123 or BLKNO or LVL/UNIT or POST CODE not blank From Address and Account Linkage Screen]
Public Function verifyAdd_BLK_UNIT_Postal_AddAccLinkage()

   Dim bVerifyAccountAndAddress,bAddressBlank,bBlockBlank
   bVerifyAccountAndAddress=true
	strAddline1=bcVerify_AccountAndAddress.lblAddressLine1.getRoProperty("innertext")
	strAddline2=bcVerify_AccountAndAddress.lblAddressLine2.getRoProperty("innertext")
	strAddline3=bcVerify_AccountAndAddress.lblAddressLine3.getRoProperty("innertext")
	bAddressBlank=true
	bBlockBlank=true
	  If  strAddline1="" And strAddline2="" And strAddline3<>""Then
		  LogMessage "WARN","Verification","Address Line 123 are blank",True
		   bAddressBlank = false
	  End If

	strBlock=bcVerify_AccountAndAddress.lblBlock.GetRoProperty("innerText")
	strLevelUnit=bcVerify_AccountAndAddress.lblLevelUnit.GetRoProperty("innerText")
	strPostalCode=bcVerify_AccountAndAddress.lblPostalCode.GetRoProperty("innerText")		
    If  strBlock="" And strLevelUnit="" And strPostalCode<>""Then
		  LogMessage "WARN","Verification","BLOCK, LVL/UNIT, POSTAL Code  are blank",True
		   bBlockBlank = false
	 End If

	If bAddressBlank or bBlockBlank Then
		LogMessage "RSLT","Verification","Either of Address Line 123,BLOCK, LVL/UNIT, POSTAL Code  are not blank as expected",True
		verifyAdd_BLK_UNIT_Postal_AddAccLinkage=true
	else
		LogMessage "RSLT","Verification","All Fields Address Line 123,BLOCK, LVL/UNIT, POSTAL Code  are blank",False
		verifyAdd_BLK_UNIT_Postal_AddAccLinkage=false
	End If

End Function

'[Verify Address Line123 and Postal Code not Blank in Relationship Details Screen]
Public Function verifyNotBlank_AddLine123_PostalCode_Relationship()
   Dim bBlankFields,strAddressLine1,strAddressLine2,strAddressLine3,strPostalCode
   bBlankFields=true

	strAddressLine1=Relationship_Details.lblAddressLine1.GetRoProperty("innerText")
	strAddressLine2=Relationship_Details.lblAddressLine2.GetRoProperty("innerText")
	strAddressLine3=Relationship_Details.lblAddressLine3.GetRoProperty("innerText")
	strPostalCode=Relationship_Details.lblPostalCode.GetRoProperty("innerText")

    If strAddressLine1="" AND strAddressLine2="" And strAddressLine3="" And strPostalCode="" Then
		LogMessage "RSLT","Verification","All the fields AddressLine123 and Postal Code are blank",False
		verifyNotBlank_AddLine123_PostalCode_Relationship=false				
	else
		LogMessage "RSLT","Verification","Either of  fields AddressLine123 and Postal Code are not blank as expected",True
		verifyNotBlank_AddLine123_PostalCode_Relationship=true		
    End If

End Function

'[Verify Relationship Block Code in Relationship Details Screen]
Public Function verifyRelationshipBlockCode_Relationship(strRelationBLKCD)
   Dim bRelationshipDetails
   bRelationshipDetails=true
 If Not IsNull(strRelationBLKCD) Then
	   If Not VerifyInnerText(Relationship_Details.lblRelationshipBlockCode(),strRelationBLKCD,"Relationship block Code") Then
		bRelationshipDetails = False
	   End If
	End If
   verifyRelationshipBlockCode_Relationship=bRelationshipDetails
End Function

'[Verify AFW Score in Relationship Details Screen]
Public Function verifyAFW_Relationship(strAFWScore)
   Dim bRelationshipDetails
   bRelationshipDetails=true
 If Not IsNull(strAFWScore) Then
	   If Not VerifyInnerText(Relationship_Details.lblAFWScore(),strAFWScore,"AFW Score") Then
		bRelationshipDetails = False
	   End If
	End If
   verifyAFW_Relationship=bRelationshipDetails
End Function

'[Verify Field Need to Activate on Key Info Page displayed as]
Public Function verifyCardNeedToActivate(strNeedActivate)
	Dim bVerifyKeyInfo:bVerifyKeyInfo=true
	If Not IsNull(strNeedActivate) Then
			If Not verifyInnerText(bcKeyInfo.lblCard_NeedToActivate() , strNeedActivate, "Card - Need To Activate")Then
					bVerifyKeyInfo = False
			End If
	End If
	verifyCardNeedToActivate=bVerifyKeyInfo
End Function

'[Select Statement from Statement Screen]
Public Function selectStatement(strStatementDate)
	bSelectStatement=true
   If not isNull(strStatementDate) Then
		bSelectStatement=bcStatements.SelectStatement(strStatementDate)
   End If
   selectStatement=bSelectStatement
End Function

'[Click on Service request Tab from Customer Overview page]
Public Function clickServiceRequestTab_1()
	Wait (5)
   clickServiceRequestTab_1=ServiceRequest.tabServiceRequest.click
   WaitForIcallLoading
End Function
'Added by Kalyan for 1603 dated 20/07/2016

'[Click on Pending SR Tab from Customer Overview page]
Public Function clickPendingSRTab_1()
	Wait (5)
   clickPendingSRTab_1=ServiceRequest.tabPendingSR.click
   WaitForIcallLoading
End Function

'[Click on ActivityTab from Customer Overview page]
Public Function clickActivityTab()   
   clickActivityTab=bcActivities.tabActivities.Click
   WaitForIcallLoading
End Function

'[Select SR from Customer Overview Page]
Public Function selectSR_CustOverview(strStatus,strCreatedOn)
   Dim bSelectPendingSR:bSelectPendingSR=true

		strSRNumber=fetchFromDataStore("Verify Link SRNumber available on Request Submitted popup for TM Approval Screen","BLANK","SelectedSRLink")(0)
		With ServiceRequest
		selectSR_CustOverview=selectTableLink(.tblActivityListHeader,.tblActivityListContent,Array("Service Request No:"&strSRNumber),"Service Requests" ,"Service Request No",true,.lnkNext ,.lnkNext1 ,.lnkPrevious)
		End With
	selectPendingSR_TMHome=selectSR_CustOverview
End Function

'[Select Open Activity from Customer Overview Page]
Public Function selectOpenIA_Overview(strCSO,strActivityType)
  bselectOpenIA_CSOHome=true
  Dim lstSRActivityData
    strCreatedBy_LAN_Id=readFromINIFile(gstrCurrentProjectDir + "\"+gstrProjectName+ "\Config\SR_Screen_Map.ini",  "LAN ID" , strCSO)
	strQuery_Activity="select to_char(duedatetime) from orchsvc_ia where created_datetime = (select Max(created_datetime) FROM orchsvc_ia where created_by='"&strCreatedBy_LAN_Id&"')"
    strTST=getDBValForColumn(strQuery_Activity)(0)                  
	strTempDate=Left(strTST,15)
			strTime=FormatDateTime(Left(strTST,15) &" "&Right(strTST,2),4)
			strTime=Replace(strTime,":",".?")
			If len(Day(CDate(strTempDate)))=1 Then
				strDay="0"&Day(CDate(strTempDate))
			else
				strDay=""&Day(CDate(strTempDate))
			End If
			strCreatedDatePattern=""&strDay & " "&monthName(Month(CDate(strTempDate)),true) &" " &Year(CDate(strTempDate))&" " &strTime
			insertDataStore "Due Date", strCreatedDatePattern

		ReDim lstSRActivityData(2)
		lstSRActivityData(0)="Type:"&strActivityType
		lstSRActivityData(1)="Assigned To:"&strCreatedBy_LAN_Id
		lstSRActivityData(2)="Due Date:"&strCreatedDatePattern

		bselectOpenIA_CSOHome=clickCreatedOn_Activity_Overview(lstSRActivityData)
        selectOpenIA_Overview=bselectOpenIA_CSOHome
End Function

'[Click Created On link in Table Open Activity Records form Customer Overview Page]
Public Function clickCreatedOn_Activity_Overview(strType, strComments, strCreatedBy)
   bDevPending=false
   strCreatedByLcase=LCase(strCreatedBy)
          strMonth=Month(strSubmitTime)
         strYear=Year(strSubmitTime)
         strDay=Day(strSubmitTime)
         If strDay<10 Then
         	strDay=0&strDay
         End If
         strHour=Hour(strSubmitTime)
         'If strHour=-1 Then
         '	strHour=23
         'End If
         If strHour<10 Then
         	strHour=0&strHour
         End If
         strMin=Minute(strSubmitTime)
         If strMin<10 Then
         	strMin=0&strMin
         End If
         strMonthName=MonthName(strMonth, True)         
         
          lstSRActivityData = checknull("Created On:"&strDay&" "&strMonthName&" "&strYear&" "&strHour&""&strMin&"|Type:"&strType&"")
         ' lstSRActivityData = checknull("Assigned To:CRMSIT2|Type:"&strType&"")
   
	   clickCreatedOn_Activity_Overview=selectTableLink(CSO_TM_Home.tblSRActivityHeader,CSO_TM_Home.tblSRActivityContent,lstSRActivityData,"SRActivityRecords" ,"Created On",true,CSO_TM_Home.lnkNext ,CSO_TM_Home.lnkNext1,CSO_TM_Home.lnkPrevious)
   
End Function

'[Select Notes from Account Overview Page]
Public Function selectNotes_AcctOverview(strTimeStamp)
   Dim bselectNotes_AcctOverview:bselectNotes_AcctOverview=true
		Wait 4
		If strTimeStamp="RUN TIME" Then			
			strTimeStamp=fetchFromDataStore(strRunTimeTimeStamp,"BLANK","TimeStamp")(0)
			
			With bcVerify_Notes
			bselectNotes_AcctOverview=selectTableLink(.tblMemoDetailHeader,.tblMemoDetailTable,Array("Created Date/Time:"&strTimeStamp),"Notes" ,"Memo Details",true,.lnkNext ,.lnkNext1 ,.lnkPrevious)
			End With
		Else
			
			With bcVerify_Notes
			bselectNotes_AcctOverview=selectTableLink(.tblMemoDetailHeader,.tblMemoDetailTable,Array("Created Date/Time:"&strTimeStamp),"Notes" ,"Memo Details",true,.lnkNext ,.lnkNext1 ,.lnkPrevious)
			End With
		
		End IF
			
			
'		ReDim lstNotesData(1)
'		lstNotesData(0)="Created By:"&strCreatedBy
'		lstNotesData(1)="Created Date/Time:"&strTimeStamp		
	selectNotes_AcctOverview=bselectNotes_AcctOverview
End Function

'[Verify text for Memo Details on Notes Screen]
Public Function verifyMemo(strCreatedBy,strCardNumber,strComment)
   Dim bverifyMemo:bverifyMemo=true

    MessageDetailsText=bcVerify_Notes.lblMemoDetailsText.GetROProperty("innertext")
   If Not IsNull(strCreatedBy) Then
	   If Not matchStr(MessageDetailsText,strCreatedBy) Then
		bverifyMemo = False
	   End If
	End If
	
	If Not IsNull(strCardNumber) Then
		strCardNumber=replace(strCardNumber,"-","")
	   If Not matchStr(MessageDetailsText,strCardNumber) Then
		bverifyMemo = False
	   End If
	End If

	If Not IsNull(strComment) Then
	   If Not matchStr(MessageDetailsText,strComment) Then
		bverifyMemo = False
	   End If
	End If
	
	bcVerify_Notes.btnOKMessageDetails.Click
	
	verifyMemo=bverifyMemo
End Function

'[Verify Field 60 Days Past Due on Key Info Page displayed as]
Public Function verify60DPD(str60DPD)
   Dim bverify60DPD:bverify60DPD=true
	If Not IsNull(str60DPD) Then
		If Not verifyInnerText(bcKeyInfo.lbl60DPD(), str60DPD, "60 Days Past Due")Then
			bverify60DPD = False
		End If
	End If
	verify60DPD=bverify60DPD
End Function

'[Verify Field Balance to Income on Key Info Page displayed as]
Public Function verifyBTI(strBTI)
   Dim bverifyBTI:bverifyBTI=true
	If Not IsNull(strBTI) Then
		If Not verifyInnerText(bcKeyInfo.lblBTI(), strBTI, "Balance to Income")Then
			bverifyBTI = False
		End If
	End If
	verifyBTI=bverifyBTI
End Function

'[Verify Field AI Indicator on Suspension Details Page displayed as]
Public Function verifyAI(strAI)
   Dim bverifyAI:bverifyAI=true
	If Not IsNull(strAI) Then
		If Not verifyInnerText(bcKeyInfo.lblAI(), strAI, "Accredited Investor")Then
			bverifyAI = False
		End If
	End If
	verifyAI=bverifyAI
End Function

'[Open Branch url to validate Statement]
Public Function openBranch(strBranchUrl)
	bopenBranch=true
	strBranchUrl=Replace(strBranchUrl,"@","=")
	Browser("creationtime:=0").Navigate(strBranchUrl)
    waitForIcallLoading
    openBranch=true
End Function

'[User logged in as CSO in Branch]
Public Function UserloggedinasCSO_Branch(strUserName,strPassword)
	Window("BrowserWin").Maximize
	If Not IsNull(strUserName) Then
       bcLoginICALLScreen.txtUserId().set strUserName
    End If
    If Not IsNull(strPassword) Then
       bcLoginICALLScreen.txtPassword().set strPassword
    End If
	bcLoginICALLScreen.clickLogin()
	waitForIcallLoading
	bcLoginICALLScreen.btnContinue.Click
	waitForIcallLoading
	If (Browser("Browser_iCall_Home").Page("iCall_HomePage").WebElement("weWelcome").WaitProperty("innertext","Welcome",30000)) Then
	    LogMessage "RSLT","Verification","User " &strUserName& "Successfully able to login into Application.",True
		UserloggedinasCSO_Branch = True
	Else
 		LogMessage "WARN","Verification","Not Successful Logon or Loading for more than 30 seconds",False
		UserloggedinasCSO_Branch = False  
	End If
End Function

'[Click on Continue button to Login into Branch]
Public Function clickContinueBtn()
	iCallLogin.btnContinue.Click
	 If Err.Number<>0 Then
       clickContinueBtn=false
            LogMessage "WARN","Verification","Failed to Click Button : Continue" ,false
       Exit Function
   End If
   waitForIcallLoading
   clickContinueBtn=true
End Function

'[Verify Audit Log for Customer Center]
Public Function verifyAuditLog_CC(strUser,strCardAccNo,strEventSubType)
	bverifyAuditLog=true
	strQuery_CreatedOn="select card_acc_no, event_sub_type from cca_audit_log where timestamp = (select Max(timestamp) FROM cca_audit_log where USER1BANKID='"&strUser&"')"
	strTST=getDBValForColumn_CC(strQuery_CreatedOn)
	strCard=strTST(0,0)
	If not strCard=strCardAccNo Then
		LogMessage "WARN","Verification","Card Account Number not matched with expected value" ,False
		bverifyAuditLog=False
	End If
	strSubType=strTST(0,1)
	If not strSubType=strEventSubType Then
		LogMessage "WARN","Verification","Event Sub Type not matched with expected value" ,False
		bverifyAuditLog=False
	End If
	verifyAuditLog_CC=bverifyAuditLog
End Function

'[Verify Audit Log for Branch]
Public Function verifyAuditLog_Branch(strUser,strCardAccNo,strEventSubType)
	bverifyAuditLog=true
	strQuery_CreatedOn="select card_acc_no, event_sub_type from cca_audit_log where timestamp = (select Max(timestamp) FROM cca_audit_log where USER1BANKID='"&strUser&"')"
	strTST=getDBValForColumn_Branch(strQuery_CreatedOn)
	strCard=strTST(0,0)
	If not strCard=strCardAccNo Then
		LogMessage "WARN","Verification","Card Account Number not matched with expected value" ,False
		bverifyAuditLog=False
	End If
	strSubType=strTST(0,1)
	If not strSubType=strEventSubType Then
		LogMessage "WARN","Verification","Event Sub Type not matched with expected value" ,False
		bverifyAuditLog=False
	End If
	verifyAuditLog_Branch=bverifyAuditLog
End Function

'[Verify Address on Relationship detail page]
Public Function verifyAddress_RelDetl(lstAddressDetails)

bverifyAddress_RelDetl=true

If not IsNull (lstAddressDetails) Then
	For iCount =0 to Ubound(lstAddressDetails)
        strLabel=Split (lstAddressDetails(iCount),":")(0)
        strDetail=Split (lstAddressDetails(iCount),":")(1)
     
	Select Case strLabel     
	
	Case "Address Line 1"	
	    If Not VerifyInnerText(Relationship_Details.lblAddressLine1(),strDetail,"Relationship Details-AddressLine1") Then
			bverifyAddress_RelDetl = False	
		End If
	
	Case "Address Line 2"
	    If Not VerifyInnerText(Relationship_Details.lblAddressLine2(),strDetail,"Relationship Details-AddressLine2") Then
			bverifyAddress_RelDetl = False
		End If
	
	Case "Address Line 3"		
	    If Not VerifyInnerText(Relationship_Details.lblAddressLine3(),strDetail,"Relationship Details-AddressLine3") Then
			bverifyAddress_RelDetl = False
		End If
	
	Case "Address Line 4"
	    If Not VerifyInnerText(Relationship_Details.lblAddressLine4(),strDetail,"Relationship Details-AddressLine4") Then
			bverifyAddress_RelDetl = False
		End If
	
	Case "Address Line 5"	
	    If Not VerifyInnerText(Relationship_Details.lblAddressLine5(),strDetail,"Relationship Details-AddressLine5") Then
			bverifyAddress_RelDetl = False
		End If
	
	Case "Postal Code"	
	    If Not VerifyInnerText(Relationship_Details.lblPostalCode(),strDetail,"Relationship Details-PostalCode") Then
			bverifyAddress_RelDetl = False
		End If

	Case "Country"		
	    If Not VerifyInnerText(Relationship_Details.lblCountry(),strDetail,"Relationship Details-Country") Then
			bverifyAddress_RelDetl = False
		End If	
	End Select	
	Next	
End If
verifyAddress_RelDetl=bverifyAddress_RelDetl                
End Function

'[Verify Card Account Summary]
Public Function verifyCardAccountSummary(strProduct,strSubProduct,strAccountNumber,strAccountName,strStatus,strCurrency,strType,strOpenDate)
	bverifyCardAccountSummary=true
	bverifyCardAccountSummary=bcCardAccountSummary.VerifyCardAccountSummary(strProduct,strSubProduct,strAccountNumber,strAccountName,strStatus,strCurrency,strType,strOpenDate)
	verifyCardAccountSummary=bverifyCardAccountSummary
End Function

'[Validate Tool Tip Message in Logout Icon]
Public Function verifyLogoutToolTip()
	bverifyLogoutToolTip=true
	'setting.WebPackage("ReplayType")=2
	Set obj=Browser("Browser_iCall_Home").Page("iCall_Logout").WebElement("lnkLogout")	
	obj.FireEvent"onmouseover"
	Wait 2	
	txt=Window("nativeclass:=tooltips_class32").GetROProperty("text")
	Print txt
	msgbox txt
	'print obj.Object.title
	'bcverify_Logout.lnkLogout.FireEvent
	Wait 1
	'txt = bcverify_Logout.lnkLogout.Object.title 
	'txt=Window("nativeclass:=tooltips_class32").GetROProperty("text")
	msgbox txt
End Function

'[Verify Phone Banking in Other Popup]
Public Function verifyPhoneBanking()
	bverifyPhoneBanking=true
	bcCustomerOverview.lnkOthers.click
	Wait 1
	If (bcCustomerOverview.lnkPhoneBanking().exist(0)) Then
	  bverifyPhoneBanking = true
	else
	  bverifyPhoneBanking = false
	  LogMessage "WARN","Verification","Phone Banking link not available in Other Popup" ,False
	End If
	verifyPhoneBanking=bverifyPhoneBanking
End Function

'[Select Account Type from Customer Overview Page]
Public Function selectAccountType(strAccountType)	
	If Not IsNull(strAccountType) Then	
		Select Case strAccountType
			Case "Open"
				bcCustomerOverview.rbtnOpenAccounts.Click
				If Err.Number<>0 Then
       			selectAccountType=false
       			LogMessage "WARN","Verification","Failed to Click Open radio button from Overview page." ,false
       			Exit Function
  				 End If
			Case "Closed"
				bcCustomerOverview.rbtnClosedAccounts.Click
				If Err.Number<>0 Then
       			selectAccountType=false
       			LogMessage "WARN","Verification","Failed to Click Closed radio button from Overview page." ,false
       			Exit Function
  				 End If
		End Select
		'arrayOptions = split("Open|Closed","|")
        'selectRadioGroup bcCustomerOverview.rdg_OpenClosedAccounts, strAccountType, arrayOptions
		Wait 2
		selectAccountType = True
    End If
    waitForIcallLoading
End Function

'[Click on ATM CAM Transaction link for Customer Overview Page]
Public Function clickATMCAMTransaction()
	clickATMCAMTransaction=true
	bcCustomerOverview.lnkATMCAMTransaction.click	
	If Err.Number<>0 Then
       clickATMCAMTransaction=false
       LogMessage "WARN","Verification","Failed to Click Link  : ATM CAM Transaction" ,false
       Exit Function
	End If
	Wait 1
	waitForIcallLoading	
End Function

'[Click on ATM CAM Claim Status link for Customer Overview Page]
Public Function clickATMCAMClaimStatus()
	clickATMCAMClaimStatus=true
	bcCustomerOverview.lnkATMCAMClaimStatus.click	
	If Err.Number<>0 Then
       clickATMCAMClaimStatus=false
       LogMessage "WARN","Verification","Failed to Click Link  : ATM CAM Claim Status" ,false
       Exit Function
	End If
	Wait 1
	waitForIcallLoading	
End Function

'[Click on GIRO link from Customer Overview Page]
Public Function clickGIRO()
	clickGIRO=true
	bcCustomerOverview.lnkGIRO.click	
	If Err.Number<>0 Then
       clickGIRO=false
       LogMessage "WARN","Verification","Failed to Click Link  : GIRO" ,false
       Exit Function
	End If
	Wait 1
	waitForIcallLoading	
End Function

'[Verify Balance and Limit Page opened Successfully]
Public Function verifyBalanceAndLimit()
	bverifyBalanceAndLimit=true	
	If Not VerifyInnerText(BalancesAndLimits.lblBalanceLimits_CurrentBalance_Label(),"Current Balance","Current Balance") Then
		bverifyBalanceAndLimit = False
	End If
	verifyBalanceAndLimit=bverifyBalanceAndLimit
End Function

'[Verify Account and Address Linkage Page opened Successfully]
Public Function verifyAccountAndAddressLinkage()
	bverifyAccountAndAddress=true	
	If Not VerifyInnerText(bcVerify_AccountAndAddress.lblAddressLine1_Label(),"Address Line 1","Address Line 1") Then
		bverifyAccountAndAddress = False
	End If
	verifyAccountAndAddressLinkage=bverifyAccountAndAddress
End Function

'[Fill Data in Generic SR Page]
Public Function fillData_GenericSR(strRelatedTo,strType,strSubType)
	bfillData_GenericSR=true
	If not isNull(strRelatedTo) Then
	If instr(1,strRelatedTo,"Debit")<>0 Then
		'it contains the Debit card, so use combo box
		If not (selectItem_Combobox(ServiceRequest.lstRelatedTo,strRelatedTo))Then
			LogMessage "WARN","Verification","Failed to select :"&strRelatedTo&" From Related To drop down list",false
			bfillData_GenericSR=false
		End If
	else
		ServiceRequest.txtRelatedToCS().Set strRelatedTo
	End If
	
	End If
	
	WaitForICallLoading
	If not isNull(strType) Then
'		If not (selectItem_Combobox(ServiceRequest.lstType,strType))Then
'		   LogMessage "WARN","Verification","Failed to select :"&strType&" From Type drop down list",false
'			bfillData_GenericSR=false
'		End If
		ServiceRequest.txtTypeCS().set strType
	End If
	WaitForICallLoading

	If not isNull(strSubType) Then
'		If not (selectItem_Combobox(ServiceRequest.lstSubType,strSubType))Then
'		   LogMessage "WARN","Verification","Failed to select :"&strSubType&" From Sub Type drop down list",false
'			bfillData_GenericSR=false
'		End If
		If (instr(1,strType,"Update Status")<>0) or (instr(1,strType,"GIRO / SI")<>0) or (instr(1,strType,"Fund Transfer")<>0) Then
			'it contains the Update Status (as the sub type has common values), so use combo box
			If not (selectItem_Combobox(ServiceRequest.lstSubType,strSubType))Then
				LogMessage "WARN","Verification","Failed to select :"&strSubType&" From Sub Type drop down list",false
				bfillData_GenericSR=false
			End If
		else
			ServiceRequest.txtSubTypeCS().Set strSubType
		End if
	End If
	
	WaitForICallLoading
	ServiceRequest.clickGo()
	WaitForICallLoading
	fillData_GenericSR=bfillData_GenericSR
End Function

'[Click on the Offers Link to view the Offers]
Public Function ClickOffer()
	ClickOffer=true
	Offers.specialOffer.click	
	If Err.Number<>0 Then
       ClickOffer=false
       LogMessage "WARN","Verification","Failed to Click Link  : Offer" ,false
       Exit Function
	End If
	Wait 1
	waitForIcallLoading	
End Function

'[Click on Info Warn Icon from screen]
Public Function clickInfoWarn()
	bclickInfoWarn=true
	bcInfoWarning.img_InfoWarn.click
   If Err.Number<>0 Then
       clickInfoWarn=false
            LogMessage "WARN","Verification","Failed to Click Button : Info Warn" ,false
       Exit Function
   End If
   WaitForICallLoading
End Function

'[Verify Info Warn message on screen]
Public Function verifyInfoWarn_popup(strInfoWarn)
	bverifyInfoWarn=true
	If not (bcInfoWarning.Popup.Exist()) Then
		LogMessage "WARN","Verification","Failed to open Info Warn popup." ,false
		verifyInfoWarn=false
		Exit Function
	End If
	If Not VerifyInnerText(bcInfoWarning.lblMessage_InfoWarn(),strInfoWarn,"Info Warn Message") Then
		bverifyInfoWarn = False
	End If
	bcInfoWarning.btn_InfoWarn_Popup.click
	verifyInfoWarn_popup=bverifyInfoWarn
End Function

'[Select Failed SR from Pending SR Tab]
Public Function selectFailedSR_OverviewPage(strCSO,strCIN,strType,strAccount,strCreatedOn)
 	bDevPending=false
   Dim bSelectPendingSR:bSelectPendingSR=true
	Dim lstSRActivityData
	If not isnull(strCreatedOn) Then
		If strCreatedOn="SR CREATED ON" Then			
			strQuery_CreatedOn="select to_char(created_datetime) from orchsvc_sr where contact_cin ='"&strCIN&"' and sr_type='"&strType&"' order by created_datetime desc"
			strTST=getDBValForColumn_OL(strQuery_CreatedOn)(0)
			'strTST=getDBValForColumn_UAT(strQuery_CreatedOn)(0)					
			strTempDate=Left(strTST,15)
			strTime=FormatDateTime(Left(strTST,15) &" "&Right(strTST,2),4)
			strTime=Replace(strTime,":",".?")
			If len(Day(CDate(strTempDate)))=1 Then			
				strDay="0"&Day(CDate(strTempDate))
			else
				strDay=""&Day(CDate(strTempDate))
			End If
			strCreatedDatePattern=""&strDay & " "&monthName(Month(CDate(strTempDate)),true) &" " &Year(CDate(strTempDate))&" " &strTime
			insertDataStore "CreatedOn", strCreatedDatePattern
		End If
		ReDim lstSRActivityData(2)
		lstSRActivityData(0)="Type:"&strType
		lstSRActivityData(1)="Account / Card No.:"&strAccount
		lstSRActivityData(2)="Created Date:"&strCreatedDatePattern
	else
		ReDim lstSRActivityData(1)
		lstSRActivityData(0)="Type:"&strType
		lstSRActivityData(1)="Account / Card No.:"&strAccount		
    End If
	bSelectPendingSR=clickType_FailedSR_Overview(lstSRActivityData)
	selectFailedSR_OverviewPage=bSelectPendingSR
End Function

'[Click Type link in Table SR_Activity Records form Customer Overview Page]
Public Function clickType_FailedSR_Overview(lstSRActivityData)
   bDevPending=false
   With ServiceRequest
	   clickType_FailedSR_Overview=selectTableLink(.tblServiceRequestHeader,.tblServiceRequestContent,lstSRActivityData,"Pending SR" ,"Type",true,.lnkNext ,.lnkNext1 ,.lnkPrevious)
   End With
End Function

'[Click on Standing Instruction link for Customer Overview Page]
Public Function clickStandingInstruction()
	clickStandingInstruction=true
	bcCustomerOverview.lnkStandingInstruction.click	
	If Err.Number<>0 Then
       clickStandingInstruction=false
       LogMessage "WARN","Verification","Failed to Click Link  : Standing Instruction" ,false
       Exit Function
	End If
	Wait 1
	waitForIcallLoading	
End Function

'[Click on Recent Application link for Customer Overview Page]
Public Function clickRecentApplication()
	clickRecentApplication=true
	bcCustomerOverview.lnkRecentApplication.click	
	If Err.Number<>0 Then
       clickRecentApplication=false
       LogMessage "WARN","Verification","Failed to Click Link  : Recent Application" ,false
       Exit Function
	End If
	Wait 1
	waitForIcallLoading	
End Function

'[Click on Token Management link for Customer Overview Page]
Public Function clickTokenManagement()
	clickTokenManagement=true
	bcCustomerOverview.lnkTokenMgt.click	
	If Err.Number<>0 Then
       clickTokenManagement=false
       LogMessage "WARN","Verification","Failed to Click Link  : Token Management" ,false
       Exit Function
	End If
	Wait 1
	waitForIcallLoading	
End Function

'[Verify Token Management is disable in Customer Overview Page]
Public Function verifyTokenManagement_Disable()
	bverifyTokenManagement_Disable=true	
	intTokenManagement =InStr(bcCustomerOverview.lnkTokenMgt.GetROProperty("class"),"disabled-area")
	If not intTokenManagement=0 Then
		LogMessage "RSLT","Verification","Token Management link is disable as expected.",True
		bverifyTokenManagement_Disable=true
	Else
		LogMessage "WARN","Verifiation","Token Management link is enable. Expected to be disable.",false
		bverifyTokenManagement_Disable=false
	End If
	verifyTokenManagement_Disable=bverifyTokenManagement_Disable
End Function

'***/ This function is used to convert the date format from dd/mm/yyyy to dd mon yyyy/***
Public Function fConvertDate(StrDate)
  StrReceivedDate = IsDate(StrDate)
	If StrReceivedDate = True Then
		If len(Day(CDate(strDate)))=1 Then
			strDay="0"&Day(CDate(strDate))
	    else
			strDay=""&Day(CDate(strDate))
	   	End If
	   strExpDate=""&strDay & " "&monthName(Month(CDate(strDate)),true) &" " &Year(CDate(strDate))
	   strDate=replace(strExpDate,"/"," ")
	 Else 
	   strDate ="" 
	 End If
  fConvertDate = strDate
End Function

'[Verify Details of Direct Debit Arrangement Screen]
Public Function verifyDirectDebit(strBankCode,strBankAccountNo,strPaymentIndicator)
	bverifyDirectDebit=true
	If Not IsNull(strBankCode) Then
       If Not VerifyInnerText (bcDirectDebit_Arrangement.lblBankCode(), strBankCode, "Bank Code")Then
           bverifyDirectDebit=false
       End If
   End If
   If Not IsNull(strBankAccountNo) Then
       If Not VerifyInnerText (bcDirectDebit_Arrangement.lblBankAccountNo(), strBankAccountNo, "Bank Account No.")Then
           bverifyDirectDebit=false
       End If
   End If
   If Not IsNull(strPaymentIndicator) Then
       If Not VerifyInnerText (bcDirectDebit_Arrangement.lblPaymentIndicator(), strPaymentIndicator, "Payment Indicator")Then
           bverifyDirectDebit=false
       End If
   End If
   verifyDirectDebit=bverifyDirectDebit
End Function

'[Verify Audit Log captured for Page Navigated]
Public Function VerifyAuditLog(strDBServer,strQuery, arrExpectedData)
'	bVerifyAuditLog = True  
	strQuery= Replace(strQuery,"@","=")
	verifyDB = CompareDBValue_icall(strDBServer,strQuery, arrExpectedData)
	VerifyAuditLog=verifyDB
End Function

'[Verify InfoWarn]
Public Function verifyInfoWarn(strInfoMsg)
bverifyInfoWarn = true
	If Not IsNull(strInfoMsg) Then
 		If Not verifyFieldValue(ReferralRequest.txtInfoWarn(), strInfoMsg, "InfoWarnMsg")Then
			   bverifyInfoWarn = false
		End If
	End If
	verifyInfoWarn = bverifyInfoWarn
End Function

'[Verify Pink Panel details having Product Account and status Information]
Public Function VerifyPinkPanel(strProduct, strSubProduct, strAccountNumber, strAccountName, strStatus, strCurrency, strType, strOpenDate)
    VerifyPinkPanel = VerifyCardAccountSummary(strProduct, strSubProduct, strAccountNumber, strAccountName, strStatus, strCurrency, strType, strOpenDate)
End Function 

'[Verify Field Main/Supplementary Indicator on Key Info Page displayed as]
Public Function verifyCardIndicator(strCardIndicator)
   Dim bVerifyKeyInfo:bVerifyKeyInfo=true
	If Not IsNull(strCardIndicator) Then
		If Not verifyInnerText(bcKeyInfo.lblCard_MainSupplementaryIndicator(), strCardIndicator, "Main/Supplementary Indicator")Then
				bVerifyKeyInfo = False
		End If
	End If
	verifyCardIndicator=bVerifyKeyInfo
End Function

'[Verify MA Popup message displayed before verify Customer]
Public Function verifyMA_PopUpMessage(strExpectedText)
   bDevPending=False
   bverifyMA_PopUpMessage=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (VerifyCustomer.lblValidationMsg(), strExpectedText, "Verification Message")Then
           bverifyMA_PopUpMessage=false
       End If
   End If
   VerifyCustomer.btnOK_VerifyMA.Click
   'WaitForICallLoading
   verifyMA_PopUpMessage=bverifyMA_PopUpMessage
End Function

'[Upload the File using attachments]
Public Function uploadFiles(fileName1, fileName2, fileName3, fileName4, fileName5)
	'set the variable 
	strFolderPath = gstrAttachmentsPath
	'Set the first attachment
	
	wait 2
	If fileName1 <> "" Then
		filePath1 = strFolderPath + "\" + fileName1
		Set webFile1 = Browser("Browser_iCall_BlockCancelCard").Page("iCall_ViewSR_Common").WebFile("fileUpload1")
		webFile1.Click
		webFile1.Set filePath1
		If err.number <> 0 Then
			'error occurred; file upload unsuccessful
			LogMessage "WARN","Verification.","Unable to upload the First attachment. ",false
		End If
	End If
		
	wait 2
	'Set the second attachment
	If fileName2<>"" Then
		filePath2 = strFolderPath + "\" + fileName2
		Set webFile2 = Browser("Browser_iCall_BlockCancelCard").Page("iCall_ViewSR_Common").WebFile("fileUpload2")
		webFile2.Click
		webFile2.Set filePath2
		If err.number <> 0 Then
			'error occurred; file upload unsuccessful
			LogMessage "WARN","Verification.","Unable to upload the Second attachment. ",false
		End If
	End If
		
	wait 2
	'Set the third attachment
	If fileName3<>"" Then
		filePath3 = strFolderPath + "\" + fileName3
		Set webFile3 = Browser("Browser_iCall_BlockCancelCard").Page("iCall_ViewSR_Common").WebFile("fileUpload3")
		webFile3.Click
		webFile3.Set filePath3
		If err.number <> 0 Then
			'error occurred; file upload unsuccessful
			LogMessage "WARN","Verification.","Unable to upload the third attachment. ",false
		End If
	End If
		
	wait 2
	'Set the fourth attachment
	If fileName4<>"" Then
		filePath4 = strFolderPath + "\" + fileName4
		Set webFile4 = Browser("Browser_iCall_BlockCancelCard").Page("iCall_ViewSR_Common").WebFile("fileUpload4")
		webFile4.Click
		webFile4.Set filePath4
		If err.number <> 0 Then
			'error occurred; file upload unsuccessful
			LogMessage "WARN","Verification.","Unable to upload the fourth attachment. ",false
		End If
	End If
	
	wait 2
	'Set the fifth attachment
	If fileName5 <> "" Then
		filePath5 = strFolderPath + "\" + fileName5
		Set webFile5 = Browser("Browser_iCall_BlockCancelCard").Page("iCall_ViewSR_Common").WebFile("fileUpload5")
		webFile5.Click
		webFile5.Set filePath5
		If err.number <> 0 Then
			'error occurred; file upload unsuccessful
			LogMessage "WARN","Verification.","Unable to upload the fifth attachment. ",false
		End If
	End If
		
End Function

'[Verify list of values displayed in Application show dropdown]
Public Function verifyApplicationShow(lstShow)
   bDevPending=false
   bverifyApplicationShow=true
   If Not IsNull(lstShow) Then
       If Not verifyComboboxItems(CASAOnboarding.ApplicationShowDropdown(),lstShow,"ApplicationShow")Then
           bverifyApplicationShow=false
       End If
   End If
   verifyApplicationShow=bverifyApplicationShow
End Function

'[Select value from Application show combobox as]
Public Function selectApplicationShowComboBox(strShow)
   bDevPending=false
   bselectApplicationShowComboBox=true
   If Not IsNull(strShow) Then
       If Not (selectItem_Combobox(CASAOnboarding.ApplicationShowDropdown(), strShow))Then
            LogMessage "WARN","Verification","Failed to select :"&strControlName&" From Show drop down list" ,false
           bselectApplicationShowComboBox=false
       End If
   End If
   WaitForICallLoading
   selectApplicationShowComboBox=bselectApplicationShowComboBox
End Function

'[Click Button Filter on CASA Home Page]
Public Function clickCASAButtonFilter()
   bDevPending=true
   Wait 5
   CASAOnboarding.ButtonFilter.click 10,10,0 
   If Err.Number<>0 Then
       clickCASAButtonFilter=false
            LogMessage "WARN","Verification","Failed to Click Button : Filter" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickCASAButtonFilter=true
End Function


