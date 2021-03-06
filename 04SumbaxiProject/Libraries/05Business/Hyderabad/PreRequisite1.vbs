Dim strRunTimeSRNumber_SRTable:strRunTimeSRNumber_SRTable=""  'This Variable is used to get SR number from SR Table

'[Verify Login page is Displayed]
Public Function  VerifyLoginPageDisplayed()
VerifyLoginPageDisplayed=Browser("Browser_iCall_Login").Page("iCall_Login").Exist(2)
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

'Added by kalyan 03112016*******************
'[Perform Logout]
Public Function Logout_User()
bcverify_Logout.lnkLogout().Click
WaitForICallLoading
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
	bCloseBrowsers = True '[New Coded Added to handle Closing the Existing Open Browser]
	bReLaunchBrowser = True '[New Code Added to handle Multiple Login Logout for Single Scenario]
	Environment.Value("intBrowserLaunchCounter") = 0 '[Added to Closing All Browsers and relaunch If it is reached max timeout limit]
	WaitForICallLoading
	bcBrowserApplication.relaunchAppURL
	WaitForICallLoading
	Logout_TMLogin=login_iCall("MANAGER", strUserName, strPassword,"SUCCESS",NULL )
End Function

'[Perform Logout and Login again as CSO]
Public Function Logout_CSOLogin(strUserName,strPassword)
WaitForICallLoading
	bcverify_Logout.lnkLogout().Click
	WaitForICallLoading
	bLogOff = True
	bCloseBrowsers = True '[New Coded Added to handle Closing the Existing Open Browser]
	bReLaunchBrowser = True '[New Code Added to handle Multiple Login Logout for Single Scenario]
	Environment.Value("intBrowserLaunchCounter") = 0 '[Added to Closing All Browsers and relaunch If it is reached max timeout limit]
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
	For iCounterii = 1 To 60 Step 1
	If Not cCustomerOverview.pageExists Then
		Wait(0.5)
		VerifyCustomerOverviewPageDisplayed = False
	else
		VerifyCustomerOverviewPageDisplayed = True
		Exit for
	End if
Next
	'VerifyCustomerOverviewPageDisplayed=cCustomerOverview.pageExists
End Function

'[Customer Overview Page is displayed]
Public Function CustomerOverviewpageisdisplayed()
CustomerOverviewpageisdisplayed=cCustomerOverview.pageExists
End Function

'[User Click Link for Account from Accounts Table]
Public Function UserClicksLinkforCreditCardAccount(strProduct,strAccount)
WaitForIcallLoading
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
 WaitForIcallLoading
 WaitForIcallLoading ' To be Removed Once App performance improved
 UserClicksLeftMenuLink=clickLefmenuLink(strLeftMenuName)
 WaitForIcallLoading
 Wait 20
End Function

'[User Click Card List Link]
Public Function UserClicksLinkCardList()
WaitForIcallLoading
 bcCustomerOverview.clickCardList()
 WaitForIcallLoading
 UserClicksLinkCardList=true
 WaitForIcallLoading
End Function

'******************Added by kalyan dated 9122016 1701 changes**************************
'[Check link Card List Enabled Disabled]
Public Function verifyLnkCardLst(strStatus)
   bDevPending=true
   bverifyLnkCardLst=true
   bverifyLnkCardLst=CheckVaadinObject_Disabled2(bcCustomerOverview.lnkCardList(), strStatus)
   verifyLnkCardLst=bverifyLnkCardLst
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
	WaitForICallLoading
	SelectAccountOnCardListPage= bcCardList.SelectCardNumber(strCardNumber)
	WaitForICallLoading
End Function

'[Verify the table content for Card list is displayed as]
Public Function verifyrowdata_CardList(arrRowDataList)
	bverifyrowdata_CardList = true
	verifyrowdata_CardList = verifyTableContentList(bcCardList.tblCardListHeader,bcCardList.tblCardListContent,arrRowDataList,"Card List",false,null,null,null)
	verifyrowdata_CardList = bverifyrowdata_CardList
End Function

'[Perform Manual Authentication 2Authentication 2Identification]
Public Function performMA2Auth2Ide(RequiredIDVerificationLevel,RequiredAUVerificationLevel)
	bAppStateLogout = True
	bperformMA2Auth2Ide = True
	Wait(5)
	WaitForIcallLoading
	' Check if the Manual Identification and Authentican required
	If RequiredIDVerificationLevel = "0" And RequiredAUVerificationLevel = "0" Then
		LogMessage "RSLT","Verification","No manual Identification and authentication required or demanded",True
		bperformMA2Auth2Ide = True
		Exit Function
	End If	
	' Click on Verify Button
	For iCounter = 1 To 180 Step 1
		If Not VerifyCustomer.btnVerify.Exist(0.5) Then
			Wait(0.5)
		else
			VerifyCustomer.btnVerify.Click
			Exit for
		End if
	Next	
	If Err.Number<>0 Then
		performMA2Auth2Ide=false
		LogMessage "WARN","Verification","Failed to Click Button : MA Verify" ,false
		Exit Function
	End If
	Wait(30)
	WaitForIcallLoading
	
	' verify if the verify customer page displayed as expected 
	If Not VerifyCustomer.pageExists() Then
		LogMessage "WARN","Verification.","Verify customer Page not displayed as expected",False
		bperformMA2Auth2Ide=False
		Exit Function
	Else
		LogMessage "RSLT","Verification.","Verify Customer Page displayed successfully",True
	End If
	
	'Checking the MA status if High Rish Verified then skip answering Identification and  Authentication questions
	strStatus=VerifyCustomer.lblVerificationStatus.GetROProperty("innertext")
	If Ucase(Trim(strStatus)) = Ucase("High Risk Verified") Then
		VerifyCustomer.btnVerifyCustomer().click
		bperformMA2Auth2Ide = True		 
	else	
		' Answer the Idendification questions if the required Idendification is greater than zero
		If RequiredIDVerificationLevel <> "0" Then
			Set objtableIdentification= VerifyCustomer.tblIdentificationQuiz
			Set oDesc = Description.Create()
			oDesc("html id").Value = "vrfyCustIdenQ_div.*"
			Set questionCollection = objtableIdentification.ChildObjects(oDesc)
			NumberOfQues = questionCollection.Count
			If NumberOfQues <> "0" Then
				For i  = 0 To RequiredIDVerificationLevel - 1 Step 1
					ObjRowClassname = Trim(questionCollection(i).getroproperty("class"))
					If Not (instr(ObjRowClassname,"disabled")) > 0 Then
						Set objQuesRow=questionCollection(i)        
						Set oDescRadio = Description.Create()
						oDescRadio("class").value="md-label.*"
						Set RadioCollection = objQuesRow.ChildObjects(oDescRadio)
						selectRadioGroup RadioCollection,"Pass",Array("Pass","Fail")
						LogMessage "RSLT","Verification","Radio Button Pass Selected for Customer Identification Question",True
					End IF
				Next
			End If
		End If
		
		' Answer the Authentication questions if the required Authentication is greater than zero
		If RequiredAUVerificationLevel <> "0" Then		
		' Answer the TPIN Related questions if the Authentication required	  
		Set objtableAuthenticationCPQ= VerifyCustomer.tblAuthenticationQuiz
		Set oDesc = Description.Create()
		oDesc("micclass").Value="WebElement"
		oDesc("html tag").Value="MD-RADIO-GROUP"
		Set questionCollection1 = objtableAuthenticationCPQ.ChildObjects(oDesc)                
		NumberOfQues = questionCollection1.Count
		If NumberOfQues <> "0" Then
			NoofQuestionsAnswered = 0
			For i  = 0 To NumberOfQues - 1 Step 1
				ObjRowClassname = Trim(questionCollection1(i).getroproperty("class"))
				If Not (instr(ObjRowClassname,"disabled")) > 0 Then
					Set objQuesRow = questionCollection1(i)        
					Set oDescRadio = Description.Create()
					oDescRadio("class").value="md-label.*"
					Set RadioCollection =objQuesRow.ChildObjects(oDescRadio)
					selectRadioGroup RadioCollection,"Pass",Array("Pass","Fail")
					NoofQuestionsAnswered = NoofQuestionsAnswered+1
					LogMessage "RSLT","Verification","Radio Button Pass Selected for Customer Portfolio Question",True
				End If 
			Next
		End If
	End IF	
	VerifyCustomer.btnVerifyCustomer().click
	Wait(10)
	WaitForIcallLoading
	strStatus=VerifyCustomer.lblVerificationStatus.GetROProperty("innertext")
	If Ucase(Trim(strStatus)) = Ucase("Low Risk Verified")Then 
		LogMessage "RSLT","Verification","Customer Verification Status is matching with the expected value. Actual: "& strStatus&", Expected: High or Low Risk Verified" ,True
		bperformMA2Auth2Ide = True
	Else
		LogMessage "WARN","Verification","Customer Verification Status is not matching with the expected value. Actual: "&strStatus&", Expected: High or Low Risk Verified" ,False
		bperformMA2Auth2Ide = False    
	End IF
End if
 performMA2Auth2Ide = bperformMA2Auth2Ide
End Function

'[Perform MA with Failed answer Authentication and Identification question]
Public Function performFailedMA_AuthIde(RequiredIDVerificationLevel,RequiredAUVerificationLevel)
bAppStateLogout = True
	bperformFailedMA_AuthIde = True
	Wait(5)
	WaitForIcallLoading
	' Check if the Manual Identification and Authentican required
	If RequiredIDVerificationLevel = "0" And RequiredAUVerificationLevel = "0" Then
		LogMessage "RSLT","Verification","No manual Identification and authentication required or demanded",True
		bperformFailedMA_AuthIde = True
		Exit Function
	End If	
	' Click on Verify Button
	For iCounter = 1 To 180 Step 1
		If Not VerifyCustomer.btnVerify.Exist(0.5) Then
			Wait(0.5)
		else
			VerifyCustomer.btnVerify.Click
			Exit for
		End if
	Next	
	If Err.Number<>0 Then
		performFailedMA_AuthIde=false
		LogMessage "WARN","Verification","Failed to Click Button : MA Verify" ,false
		Exit Function
	End If
	Wait(30)
	WaitForIcallLoading
	
	' verify if the verify customer page displayed as expected 
	If Not VerifyCustomer.pageExists() Then
		LogMessage "WARN","Verification.","Verify customer Page not displayed as expected",False
		bperformFailedMA_AuthIde=False
		Exit Function
	Else
		LogMessage "RSLT","Verification.","Verify Customer Page displayed successfully",True
	End If
	
	'Checking the MA status if High Rish Verified then skip answering Identification and  Authentication questions
	strStatus=VerifyCustomer.lblVerificationStatus.GetROProperty("innertext")
	If Ucase(Trim(strStatus)) = Ucase("High Risk Verified") Then
		VerifyCustomer.btnVerifyCustomer().click
		bperformFailedMA_AuthIde = True		 
	else	
		' Answer the Idendification questions if the required Idendification is greater than zero
		If RequiredIDVerificationLevel <> "0" Then
			Set objtableIdentification= VerifyCustomer.tblIdentificationQuiz
			Set oDesc = Description.Create()
			oDesc("html id").Value = "vrfyCustIdenQ_div.*"
			Set questionCollection = objtableIdentification.ChildObjects(oDesc)
			NumberOfQues = questionCollection.Count
			If NumberOfQues <> "0" Then
				For i  = 0 To RequiredIDVerificationLevel - 1 Step 1
					ObjRowClassname = Trim(questionCollection(i).getroproperty("class"))
					If Not (instr(ObjRowClassname,"disabled")) > 0 Then
						Set objQuesRow=questionCollection(i)        
						Set oDescRadio = Description.Create()
						oDescRadio("class").value="md-label.*"
						Set RadioCollection = objQuesRow.ChildObjects(oDescRadio)
						selectRadioGroup RadioCollection,"Fail",Array("Pass","Fail")
						LogMessage "RSLT","Verification","Radio Button Pass Selected for Customer Identification Question",True
					End IF
				Next
			End If
		End If
		
		' Answer the Authentication questions if the required Authentication is greater than zero
		If RequiredAUVerificationLevel <> "0" Then		
		' Answer the TPIN Related questions if the Authentication required	  
		Set objtableAuthenticationCPQ= VerifyCustomer.tblAuthenticationQuiz
		Set oDesc = Description.Create()
		oDesc("micclass").Value="WebElement"
		oDesc("html tag").Value="MD-RADIO-GROUP"
		Set questionCollection1 = objtableAuthenticationCPQ.ChildObjects(oDesc)                
		NumberOfQues = questionCollection1.Count
		If NumberOfQues <> "0" Then
			NoofQuestionsAnswered = 0
			For i  = 0 To NumberOfQues - 1 Step 1
				ObjRowClassname = Trim(questionCollection1(i).getroproperty("class"))
				If Not (instr(ObjRowClassname,"disabled")) > 0 Then
					Set objQuesRow = questionCollection1(i)        
					Set oDescRadio = Description.Create()
					oDescRadio("class").value="md-label.*"
					Set RadioCollection =objQuesRow.ChildObjects(oDescRadio)
					selectRadioGroup RadioCollection,"Fail",Array("Pass","Fail")
					NoofQuestionsAnswered = NoofQuestionsAnswered+1
					LogMessage "RSLT","Verification","Radio Button Pass Selected for Customer Portfolio Question",True
				End If 
			Next
		End If
	End IF

	If VerifyCustomer.popupErrorMessage.exist(1) Then
		VerifyCustomer.btnOK_popupErrMesg.click
	End If
	WaitForIcallLoading
	strStatus=VerifyCustomer.lblVerificationStatus.GetROProperty("innertext")
	If Ucase(Trim(strStatus)) = Ucase("Verification Failed")Then 
		LogMessage "RSLT","Verification","Customer Verification Status is matching with the expected value. Actual: "& strStatus&", Expected: High or Low Risk Verified" ,True
		bperformFailedMA_AuthIde = True
	Else
		LogMessage "WARN","Verification","Customer Verification Status is not matching with the expected value. Actual: "&strStatus&", Expected: High or Low Risk Verified" ,False
		bperformFailedMA_AuthIde = False    
	End IF
End if
 performFailedMA_AuthIde = bperformFailedMA_AuthIde
End Function

'[Perform MA with Failed Error Message and answer Authentication and Identification question]
Public Function performFailedErrMsgMA_AuthIde(lstQues,strlstQuesErrMsg,lstAuthQuestions,strlstAuthErrMsg)
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

		' Answer the questions if the required Idendification is greater than zero
    If lstQues <> "0" Then
        Set objtableIdentification= VerifyCustomer.tblIdentificationQuiz
        Set oDesc = Description.Create()
        oDesc("html id").Value = "vrfyCustIdenQ_div.*"
        Set questionCollection = objtableIdentification.ChildObjects(oDesc)
        NumberOfQues = questionCollection.Count
        If NumberOfQues <> "0" Then
            For i  = 0 To lstQues - 1 Step 1
                Set objQuesRow=questionCollection(i)        
               Set oDescRadio = Description.Create()
               'oDescRadio("xpath").value= "//*[contains(@class,'md-label')]"
               oDescRadio("class").value="md-label.*"
               Set RadioCollection = objQuesRow.ChildObjects(oDescRadio)
               selectRadioGroup RadioCollection,"Fail",Array("Pass","Fail")
               LogMessage "RSLT","Verification","Radio Button Fail Selected for Customer Identification Question",True
            Next
       End If
    End If

		 ' Answer the questions if the required Authentication Customer Portfolio questions is greater than zero
    If lstAuthQuestions <> "0" Then 
    
     Set objtableAuthenticationCPQ= VerifyCustomer.tblAuthenticationQuiz
        Set oDesc = Description.Create()
            oDesc("micclass").Value="WebElement"
            oDesc("html tag").Value="MD-RADIO-GROUP"
        Set questionCollection1 = objtableAuthenticationCPQ.ChildObjects(oDesc)                
        NumberOfQues = questionCollection1.Count
        If NumberOfQues <> "0" Then
            NoofQuestionsAnswered = 0
	        For i  = 0 To NumberOfQues - 1 Step 1
	           ObjRowClassname = Trim(questionCollection1(i).getroproperty("class"))
	      	  If Not (instr(ObjRowClassname,"disabled")) > 0 Then
	               Set objQuesRow = questionCollection1(i)        
	               Set oDescRadio = Description.Create()
	               oDescRadio("class").value="md-label.*"
	               Set RadioCollection =objQuesRow.ChildObjects(oDescRadio)
	               selectRadioGroup RadioCollection,"Fail",Array("Pass","Fail")
	               NoofQuestionsAnswered = NoofQuestionsAnswered+1
	               LogMessage "RSLT","Verification","Radio Button Pass Selected for Customer Portfolio Question",True
	          End If 
	          Next
	     End If
	'Select Custom Questions from the verify Customer Page' 
    	strQuestion = "Test Custom Questions"
        'Answer custom Questions to satisfy High risk verified     
        Set oCustomQuestions= VerifyCustomer.CustomQueRadioGroup    
            VerifyCustomer.txtCustomQuestions.Set strQuestion                
        Set oDescRadio = Description.Create()
            oDescRadio("class").value="md-label.*"
        Set RadioCollection =oCustomQuestions.ChildObjects(oDescRadio)
            NumberOfRadio=RadioCollection.Count                    
            If NumberOfRadio=0 Then
                LogMessage "WARN","Verification","Expected question: "&strQuestion&" not found in Identification Questions list",false
                Exit Function
            End If    
        selectRadioGroup RadioCollection,"Fail",Array("Pass","Fail")
        LogMessage "RSLT","Verification","Radio Button Selected for Question"&strQuestion,true    
    End If
	If VerifyCustomer.popupErrorMessage.exist(2) Then
		strErrMsgMA = Browser("micclass:=Browser").Page("miccclass:=Page").WebElement("xpath:=//*[@id='vrfyCustInfoQW_div']").GetROProperty("innertext")
		VerifyCustomer.btnOK_popupErrMesg().click
	End If
	WaitForIcallLoading
			 strStatus=VerifyCustomer.lblVerificationStatus.GetROProperty("innertext")
			If Ucase(Trim(strStatus)) = Ucase("Verification Failed") and Ucase(strErrMsgMA) = Ucase(strlstAuthErrMsg)Then
				LogMessage "RSLT","Verification","Customer Verification Status is matching with the expected value. Actual: "& strStatus&" , Expected: Verification Failed" ,True
				bManualAuthentication = True
			Else						
				LogMessage "WARN","Verification","Customer Verification Status is not matching with the expected value. Actual: "&strStatus&" , Expected:Verification Failed" ,False
				bManualAuthentication = False
			End If
		performFailedErrMsgMA_AuthIde=bManualAuthentication
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
	
	 For iCountlt = 1 To 180 Step 1
		If Not VerifyCustomer.btnVerify.Exist(0.5) Then
			Wait(0.5)
		else
			VerifyCustomer.btnVerify.Click
			Exit for
		End if
	Next   
	wait(10)
	WaitForIcallLoading
	If Err.Number<>0 Then
		performMAAuthIde = false
		LogMessage "WARN","Verification","Failed to Click Button : MA Verification" ,false
		Exit Function
	End If
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

'******************Added by kalyan dated 9122016 1701 Changes**************************
'[Check Button Not Verified Enabled Disabled]
Public Function verifyButtonNotverified(strStatus)
   bDevPending=true
   bverifyButtonNotverified=true
   bverifyButtonNotverified=CheckVaadinObject_Disabled1(VerifyCustomer.btnVerify(), strStatus)
   verifyButtonNotverified=bverifyButtonNotverified
End Function

'[Perform MA as Incomplete Verification]
Public Function performIncompleteMA(lstQues,lstAuthQuestions)
   bAppStateLogout=true
	bManualAuthentication = True
	waitForIcallLoading
	If isNull(lstQues) And isNull(lstAuthQuestions) Then
		LogMessage "RSLT","Verification","No manual authentication required or demanded",True
		performIncompleteMA=true
		Exit Function
	End If
	
	 For iCountltq = 1 To 180 Step 1
		If Not VerifyCustomer.btnVerify.Exist(0.5) Then
			Wait(0.5)
		else
			VerifyCustomer.btnVerify.Click
			Exit for
		End if
	Next   
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


'[Verify Customer MA as Incomplete Verification]
Public Function verifyIncompleteMA(RequiredIDVerificationLevel,RequiredAUVerificationLevel)
   bAppStateLogout=true
	bManualAuthentication = True
	waitForIcallLoading
	If isNull(RequiredIDVerificationLevel) And isNull(RequiredAUVerificationLevel) Then
		LogMessage "RSLT","Verification","No manual authentication required or demanded",True
		verifyIncompleteMA=true
		Exit Function
	End If
	
	 For iCountltq = 1 To 180 Step 1
		If Not VerifyCustomer.btnVerify.Exist(0.5) Then
			Wait(0.5)
		else
			VerifyCustomer.btnVerify.Click
			Exit for
		End if
	Next   
	WaitForIcallLoading
    If Not VerifyCustomer.pageExists() Then
		LogMessage "WARN","Verification.","Manual Authentication  does not displayed ",false
		performManualAuthentication=False
		Exit Function
	 Else
			LogMessage "RSLT","Verification.","Manual Authentication page displayed successfully",true
	End If
' Answer the questions if the required Idendification is greater than zero
    If RequiredIDVerificationLevel <> "0" Then
        Set objtableIdentification= VerifyCustomer.tblIdentificationQuiz
        Set oDesc = Description.Create()
        oDesc("html id").Value = "vrfyCustIdenQ_div.*"
        Set questionCollection = objtableIdentification.ChildObjects(oDesc)
        NumberOfQues = questionCollection.Count
        If NumberOfQues <> "0" Then
            For i  = 0 To RequiredIDVerificationLevel - 1 Step 1
                Set objQuesRow=questionCollection(i)        
               Set oDescRadio = Description.Create()
               'oDescRadio("xpath").value= "//*[contains(@class,'md-label')]"
               oDescRadio("class").value="md-label.*"
               Set RadioCollection = objQuesRow.ChildObjects(oDescRadio)
               selectRadioGroup RadioCollection,"Pass",Array("Pass","Fail")
               LogMessage "RSLT","Verification","Radio Button Pass Selected for Customer Identification Question",True
            Next
       End If
    End If
    ' Answer the questions if the required Authentication Customer Portfolio questions is greater than zero
    If RequiredAUVerificationLevel <> "0" Then
    'Select Custom Questions from the verify Customer Page' 
    	strQuestion = "Test Custom Questions"
        'Answer custom Questions to satisfy High risk verified     
        Set oCustomQuestions= VerifyCustomer.CustomQueRadioGroup    
            VerifyCustomer.txtCustomQuestions.Set strQuestion                
        Set oDescRadio = Description.Create()
            oDescRadio("class").value="md-label.*"
        Set RadioCollection =oCustomQuestions.ChildObjects(oDescRadio)
            NumberOfRadio=RadioCollection.Count                    
            If NumberOfRadio=0 Then
                LogMessage "WARN","Verification","Expected question: "&strQuestion&" not found in Identification Questions list",false
                Exit Function
            End If    
        selectRadioGroup RadioCollection,"Pass",Array("Pass","Fail")
        LogMessage "RSLT","Verification","Radio Button Selected for Question"&strQuestion,true    
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
	ElseIf Ucase(Trim(strStatus)) = Ucase("Low Risk Verified") Then
		LogMessage "RSLT","Verification","Customer Verification Status is matching with the expected value. Actual: "& strStatus&" , Expected: Low Risk Verified" ,True
		bManualAuthentication = True
	Else						
		LogMessage "WARN","Verification","Customer Verification Status is not matching with the expected value. Actual: "&strStatus&" , Expected:Verification Incomplete" ,False
		bManualAuthentication = False
	End If
verifyIncompleteMA=bManualAuthentication
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
	triggerCTI_TIPIN= bcTriggerCTI.TriggerCTI("Yes", strCIN, "00", "", "", "", "", strCustName, "Low Risk Verified", Null, Null)
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
		'strCreatedDatePattern=strSummary_DateTime &" ([0-2][0-9]:[0-9][0-9])"
		strCreatedDatePattern = strAccount_BlockCode1_Date
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
		'strCreatedDatePattern=strSummary_DateTime &" ([0-2][0-9]:[0-9][0-9])"
		strCreatedDatePattern = strCard_BlockDate
	End If
	If Matchstr(strCreatedDatePattern,strActualDateTime) Then
	'If Ucase(Trim(strActualDateTime)) = UCase(Trim(strCard_BlockDate)) Then
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
'	'Once vefirication is done ensure 1st table page is displayed.
'	bcAccountOverview_LeftMenu.clickRelationshipDetails()
'	WaitForICallLoading
End Function

'[Verify CSO Home Page is Displayed]
Public Function VerifyCSOHomePageisDisplayed()
   Dim bVerifyCSOHomePageisDisplayed:bVerifyCSOHomePageisDisplayed=true

  'VerifyCSOHomePageisDisplayed= bcLoginICALLScreen.clickLogin()
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
	  			strActualStatus=bcCardAndInfoold.lblSummary_CardStatus.GetROProperty("innertext")
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
		strActualReason=bcCardAndInfoold.lblSummary_Reason.GetROProperty("innertext")
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
			strActualDateTime=bcCardAndInfoold.lblSummary_DateTime.GetROProperty("innertext")
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

'******************Added by kalyan dated 9122016 1701 Changes**************************
'[Check Button Alert Enabled Disabled]
Public Function verifyButtonAlertE(strStatus)
   bDevPending=true
   bverifyButtonAlertE=true
   bverifyButtonAlertE=CheckVaadinObject_Disabled1(bcCustomerOverview.btnAlerts(), strStatus)
   If bverifyButtonAlertE=False Then		
   	LogMessage "WARN", "Verification","Issue with Function Enable Disable", false		
   End If
   verifyButtonAlertE=bverifyButtonAlertE
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
   Wait(20)
   If not isNull(strSRNumber) Then
		'UserclickServiceRequestLink=selectTableLink(ServiceRequest.tblServiceRequestHeader, ServiceRequest.tblServiceRequestContent,_
	'Array("Service Request No:"&strSRNumber),"Service Requests","Service Request No",true,ServiceRequest.lnkNext,ServiceRequest.lnkNext1,ServiceRequest.lnkPrevious)
   UserclickServiceRequestLink=selectTableLink(ServiceRequest.tblServiceRequestHeader, ServiceRequest.tblServiceRequestContent,_
Array("SR No.:"&strSRNumber),"Service Requests","SR No.",true,ServiceRequest.lnkNext,ServiceRequest.lnkNext1,ServiceRequest.lnkPrevious)

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
	Wait(20)
	WaitForIcallLoading
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
	wait 20
	clickServiceRequesttab=true
End Function

'[User click Past Verification tab]
Public Function clickPastVerification()
	Wait 10
	PastVerification.tabPastVerification().click()
	WaitForIcallLoading
	wait 2
	clickPastVerification=true
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
   If not Isnull (strArcheiveInd) Then
	   If Not VerifyInnerText(ServiceRequest.lblServiceRequestArcheiveInd(), strArcheiveInd, "Archeive Indicator") Then
		bverifyArcheiveIndServiceReq=false	
	   End If
   End If
	verifyArcheiveIndServiceReq=bverifyArcheiveIndServiceReq
End Function

'[Verify Archeive Indicator not displaying for Service Request]
Public Function verifyArcheiveIndServiceReq1(strArcheiveInd)
   bverifyArcheiveIndServiceReq1=true
   If not Isnull (strArcheiveInd) Then
	   If VerifyInnerText(ServiceRequest.lblServiceRequestArcheiveInd(), strArcheiveInd, "Archeive Indicator") Then
		bverifyArcheiveIndServiceReq1=false	
	   End If
   End If
	verifyArcheiveIndServiceReq1=bverifyArcheiveIndServiceReq1
End Function

'[Verify Archeive Indicator for Activities]
Public Function verifyArcheiveIndActivities(strArcheiveInd)
   bverifyArcheiveIndActivities=true
   If not Isnull (strArcheiveInd) Then
	   If Not VerifyInnerText(ServiceRequest.lblActivityArcheiveInd(), strArcheiveInd, "Archeive Indicator") Then
		bverifyArcheiveIndActivities=false	
	   End If
   End If
	verifyArcheiveIndActivities=bverifyArcheiveIndActivities
End Function

'[Verify Archeive Indicator not displaying for Activities]
Public Function verifyArcheiveIndActivities1(strArcheiveInd)
   bverifyArcheiveIndActivities1=true
   If not Isnull (strArcheiveInd) Then
	   If VerifyInnerText(ServiceRequest.lblActivityArcheiveInd(), strArcheiveInd, "Archeive Indicator") Then
		bverifyArcheiveIndActivities1=false	
	   End If
   End If
	verifyArcheiveIndActivities1=bverifyArcheiveIndActivities1
End Function

'[Verify More Records Available in CRM Indicator displaying for Activities]
Public Function verifyMoreRecordsAvailCRMIndActivities(strMorRecAvaiCRMIndAct)
  verifyMoreRecordsAvailCRMIndActivities = false
  If not IsNull(strMorRecAvaiCRMIndAct) Then
     If VerifyInnerText(ServiceRequest.lblactivitiesInfoWarnData(), strMorRecAvaiCRMIndAct, "CRM Indicator Activities") Then
  	    verifyMoreRecordsAvailCRMIndActivities = true
     End If  	
  End If	
End Function

'[Verify row Data in Table ActivityTab_Records]
Public Function verifytbl_ActivityTab_Records_RowData(arrRowDataList)
   bDevPending=false
   verifytbl_ActivityTab_Records_RowData=verifyTableContentList(ServiceRequest.tblActivityListHeader,ServiceRequest.tblActivityListContent,arrRowDataList,"ActivityTab_Records" ,True,ServiceRequest.lnkNext ,ServiceRequest.lnkNext1,ServiceRequest.lnkPrevious)
End Function

'[Click on Created Date hyperlink from Activities Table]
Public Function ClickOnCreatedDateHyrActivitiesTable(lstCreatedDate)
	ClickOnCreatedDateHyrActivitiesTable = false
	ClickOnCreatedDateHyrActivitiesTable = selectTableLink(ServiceRequest.tblActivityListHeader, ServiceRequest.tblActivityListContent, lstCreatedDate, "Activities Details", "Created Date", True, ServiceRequest.lnkNext ,ServiceRequest.lnkNext1, ServiceRequest.lnkPrevious)
	WaitForICallLoading
End Function

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
	LogMessage "WARN","Verification","Records not matched as per expectation.",false
End If
End If
End Function

'[Verify Pagination for the Activities table displayed]
Public Function ValidatePagination_Activities(strTtlRecords)
	bValidatePagination_Activities = False
	bNextPageExist = True
	totalRecords = 0
	'If not Isnull (strTtlRecords) Then
		While bNextPageExist = True
			intRecordCount = getRecordsCountForColumn(ServiceRequest.tblActivityListHeader,ServiceRequest.tblActivityListContent,"Activity No.") 
			iCheck = 5
			If intRecordCount <=iCheck Then
				LogMessage "RSLT","Verification","Number of records displayed per page matched with expected. Expected Count is less than or equal to "&iCheck, true 
				bValidatePagination_Activities = true
				'msgbox intRecordCount
				bValidatePagination_Activities=true
				If intRecordCount < iCheck Then
					bNextPageExist =matchStr(ServiceRequest.lnkNext.GetROProperty("class"),"enabled")
					If bNextPageExist Then
						LogMessage "WARN","Verification","Next link expected to be disabled if record is less than "&iCheck&". Currently it is enabled.",false
					Else
						LogMessage "RSLT","Verification","Next link is disabled as per expectation.",true
						bValidatePagination_Activities = true
					End If
				ElseIf intRecordCount = iCheck Then
					bNextPageExist = matchStr(ServiceRequest.lnkNext.GetROProperty("class"),"enabled")
					If bNextPageExist Then
					ServiceRequest.lnkNext.Click
					End If
				End If
			Else 
				LogMessage "RSLT","Verification","Number of records displayed per page not matched with expected. Expected Count is less than or equal to 5", false 
			End If
			'totalRecords=totalRecords+intRecordCount
		Wend
'		If totalRecords= cInt(strTtlRecords) Then
'			LogMessage "RSLT","Verification","Records matched as per expectation.",true
'		Else
'			LogMessage "WARN","Verification","Records not matched as per expectation.",false
'		End If
	'End If
End Function

'[User click Info Warn button]
Public Function clickInfoWarnimg()
	'Wait 30
	bInfoWarnExist=True
	'bInfoWarnExist =matchStr(bcInfoWarning.btn_InfoWarn_Page.GetROProperty("class"),"enabled")
	'Changed by Sunil for D2Pay
	'bInfoWarnExist =matchStr(bcInfoWarning.btn_InfoWarn_Page.GetROProperty("class"),"info-warn info-warning-enable")
	If bInfoWarnExist Then
		bcInfoWarning.btn_InfoWarn_Page().click()
	End If
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

'******************Added by kalyan dated 9122016 1701 Changes**************************
'[Check Contact Details Tab Enabled Disabled]
Public Function verifyContactDetailsTabE(strStatus)
   bDevPending=true
   bverifyContactDetailsTabE=true
   bverifyContactDetailsTabE=CheckVaadinObject_Disabled1(bcCustomerOverview.weTabContactDetails(), strStatus)
   verifyContactDetailsTabE=bverifyContactDetailsTabE
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
   WaitForIcallLoading
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
	Wait(10)
	WaitForIcallLoading
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
		    WaitForIcallLoading
			objBtnToClick(0).Click
			Wait(30)
			WaitForIcallLoading
			verifyShortcutButtons=true
			LogMessage "RSLT","Verification","SR Shortcut Button "&strButtonToClick&" clicked from "&strLeftMenuName&" page.",true
		End If
		WaitForIcallLoading
	clickSRShortcutButton=verifyShortcutButtons
	WaitForIcallLoading
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
		If Ucase(Trim(bcCardAndInfoold.lblSummary_CardStatus.GetROProperty("innertext"))) = UCase(Trim(strSummary_CardStatus)) Then
			LogMessage "RSLT","Verification","Card Status matching with the expected value. Expected: "& strSummary_CardStatus &" , Actual: "& bcCardAndInfoold.lblSummary_CardStatus.GetROProperty("innertext") ,True
			bVerifyCardAndPINInfo=true
		Else
			bVerifyCardAndPINInfo = False
			LogMessage "WARN","Verification","Card Status not matching with the expected value. Expected: "& strSummary_CardStatus &" , Actual: "& bcCardAndInfoold.lblSummary_CardStatus.GetROProperty("innertext") ,False
		End If
	End If
	CardStatus_CardPinInfo=bVerifyCardAndPINInfo
End Function

'[Verify  Field PIN Issued From Card and PIN Info Screen]
Public Function PinIssued_CardPinInfo(strSummary_PINIssued)
	Dim bVerifyCardAndPINInfo:bVerifyCardAndPINInfo=true
	 If Not IsNull(strSummary_PINIssued) Then
        If Ucase(Trim(bcCardAndInfoold.lblSummary_PINIssued.GetROProperty("innertext"))) = UCase(Trim(strSummary_PINIssued)) Then
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
		strActualPINGen= bcCardAndInfoold.lblDetails_PINGenDate.GetROProperty("innertext")
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
		 strActualActivation=bcCardAndInfoold.lblDetails_ActivationDate.GetROProperty("innertext")
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

'[Verify Field Last Replaced Date From Card and PIN Info Screen]
Public Function LastReplacedDate_CardPinInfo(strlastReplacedDate)
	Dim bVerifyCardAndPINInfo:bVerifyCardAndPINInfo=true
	 If Not IsNull(strlastReplacedDate) Then
		 strActualReplacedDate=bcCardAndInfoold.lblDetails_LastReplaced.GetROProperty("innertext")
		If Ucase(strlastReplacedDate)="TODAY" Then
			If len(Day(CDate(Now)))=1 Then
				strDay="0"&Day(CDate(Now))
			else
				strDay=""&Day(CDate(Now))
			End If
            strlastReplacedDate=""&strDay & " "&monthName(Month(CDate(Now)),true) &" " &Year(CDate(Now))
		End If
		If Ucase(strlastReplacedDate)="NOT BLANK" Then
			If Ucase(Trim(strActualReplacedDate)) <>"" Then
				LogMessage "RSLT","Verification","Last Replaced date Not Blank As Expected" ,True
				LastReplacedDate_CardPinInfo=true
			Else
				LastReplacedDate_CardPinInfo = False
				LogMessage "WARN","Verification","Last Replaced date is BLANK, it should not be BLANK as expected" ,False
			End If
			Exit Function
		End If
		If Ucase(Trim(strActualReplacedDate)) = UCase(Trim(strlastReplacedDate)) Then
			LogMessage "RSLT","Verification","Last Replaced date matching with the expected value. Expected: "& strlastReplacedDate &" , Actual: "& strActualReplacedDate ,True
		Else
			LastReplacedDate_CardPinInfo = False
			LogMessage "WARN","Verification","Last Replaced date not matching with the expected value. Expected: "& strlastReplacedDate &" , Actual: "&strActualReplacedDate ,False
		End If
	End If
	LastReplacedDate_CardPinInfo=LastReplacedDate_CardPinInfo
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
		If Ucase(Trim(bcCardAndInfoold.lblSummary_LastPINIssuedDate.GetROProperty("innertext"))) = UCase(Trim(strSummary_LastPINIssuedDate)) Then
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
			If Ucase(Trim(bcCardAndInfoold.lblDetails_CashLineLink.GetROProperty("innertext"))) = UCase(Trim(strDetails_CashLineLink)) Then
				LogMessage "RSLT","Verification","CashLine Link matching with the expected value. Expected: "& strDetails_CashLineLink &" , Actual: "& cCardAndInfo.lblDetails_CashLineLink.GetROProperty("innertext") ,True
			Else
				bVerifyCardAndPINInfo = False
				LogMessage "WARN","Verification","CashLine Link not matching with the expected value. Expected: "& strDetails_CashLineLink &" , Actual: "& cCardAndInfo.lblDetails_CashLineLink.GetROProperty("innertext") ,False
			End If
	End If


	If Not IsNull(strDetails_AccountNo) Then
			If Ucase(Trim(bcCardAndInfoold.lblDetails_AccountNo.GetROProperty("innertext"))) = UCase(Trim(strDetails_AccountNo)) Then
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
	Wait(20)
	WaitForIcallLoading
   If not isNull(strStatementDate) Then
		bSelectStatement=bcStatements.SelectStatement(strStatementDate)
   End If
   WaitForIcallLoading
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
   Wait(60) 'To be removed if application data retrieval interval become normal   
End Function

'******************Added by kalyan dated 9122016 1701 Changes**************************
'[Check Activities Tab Enabled Disabled]
Public Function verifyActivitiesTabE(strStatus)
   bDevPending=true
   bverifyActivitiesTabE=true
   bverifyActivitiesTabE=CheckVaadinObject_Disabled1(bcActivities.tabActivities(), strStatus)
   verifyActivitiesTabE=bverifyActivitiesTabE
End Function

'******************Added by kalyan dated 9122016 1701 Changes**************************
'[Check Service Request Tab Enabled Disabled]
Public Function verifyServiceReqTabE(strStatus)
   bDevPending=true
   bverifyServiceReqTabE=true
   bverifyServiceReqTabE=CheckVaadinObject_Disabled1(ServiceRequest.tabServiceRequest(), strStatus)
   verifyServiceReqTabE=bverifyServiceReqTabE
End Function

'******************Added by kalyan dated 9122016 1701 Changes**************************
'[Check Pending Service Request Tab Enabled Disabled]
Public Function verifyPenServiceReqTabE(strStatus)
   bDevPending=true
   bverifyPenServiceReqTabE=true
   bverifyPenServiceReqTabE=CheckVaadinObject_Disabled1(ServiceRequest.tabPendingSR(), strStatus)
   verifyPenServiceReqTabE=bverifyPenServiceReqTabE
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
Public Function clickCreatedOn_Activity_Overview(lstSRActivityData)
   bDevPending=false
   With bcActivities
	   clickCreatedOn_Activity_Overview=selectTableLink(.tblActivityListHeader,.tblActivityListContent,lstSRActivityData,"SRActivityRecords" ,"Created On",true,.lnkNext ,.lnkNext1 ,.lnkPrevious)
   End With
End Function

'[Select Notes from Account Overview Page]
Public Function selectNotes_AcctOverview(strTimeStamp)
   Dim bselectNotes_AcctOverview:bselectNotes_AcctOverview=true
		Wait 4
		If strTimeStamp="RUN TIME" Then			
			strTimeStamp=fetchFromDataStore(strRunTimeTimeStamp,"BLANK","TimeStamp")(0)
			
			With bcVerify_Memo
			bselectNotes_AcctOverview=selectTableLink(.tblMemoDetailHeader,.tblMemoDetailTable,Array("Created Date/Time:"&strTimeStamp),"Notes" ,"Memo Details",true,.lnkNext ,.lnkNext1 ,.lnkPrevious)
			End With
		Else
			
			With bcVerify_Memo
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

    MessageDetailsText=bcVerify_Memo.lblMemoDetailsText.GetROProperty("innertext")
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
	
	bcVerify_Memo.btnOKMessageDetails.Click
	
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
	'If (Browser("Browser_iCall_Home").Page("iCall_HomePage").WebElement("weWelcome").WaitProperty("innertext","Welcome",30000)) Then
	If (Browser("Browser_iCall_Home").Page("iCall_HomePage").WebElement("xpath:=//*[@id='navBarWelcome_span']").WaitProperty("innertext","Welcome",30000)) Then
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
waitForIcallLoading

For iCountOne = 1 To 180 Step 1
	If Not Relationship_Details.lblAddressLine1.Exist(0.5) Then
		Wait(0.5)
	else
		Exit for
	End if
Next
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

'******************Added by kalyan dated 9122016 1701 Changes**************************
'[Check link ATMCAM Enabled Disabled]
Public Function verifyLnkATMCAM(strStatus)
   bDevPending=true
   verifyLnkATMCAM=true
   verifyLnkATMCAM=CheckVaadinObject_Disabled2(bcCustomerOverview.lnkATMCAMTransaction(), strStatus)
   verifyLnkATMCAM=bverifyLnkATMCAM
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
	Wait(20)
	waitForIcallLoading
	If Err.Number<>0 Then
       clickGIRO=false
       LogMessage "WARN","Verification","Failed to Click Link  : GIRO" ,false
       Exit Function
	End If
	waitForIcallLoading	
End Function

'******************Added by kalyan dated 9122016 1701 Changes**************************
'[Check link GIRO Enabled Disabled]
Public Function verifyLnkGIRO(strStatus)
   bDevPending=true
   bverifyLnkGIRO=true
   bverifyLnkGIRO=CheckVaadinObject_Disabled2(bcCustomerOverview.lnkGIRO(), strStatus)
   verifyLnkGIRO=bverifyLnkGIRO
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
	clickInfoWarn=true
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
	verifyInfoWarn_popup=true
	If not (bcInfoWarning.Popup.Exist(1)) Then
		LogMessage "WARN","Verification","Failed to open Info Warn popup." ,false
		verifyInfoWarn_popup=false
		Exit Function
	End If
	If Not VerifyInnerText(bcInfoWarning.lblMessage_InfoWarn(),strInfoWarn,"Info Warn Message") Then
		verifyInfoWarn_popup = False
	End If
	bcInfoWarning.btnOK.click
	If Err.Number<>0 Then
       verifyInfoWarn_popup=false
       LogMessage "WARN","Verification","Failed to Click OK Button : Info Warn" ,false
       Exit Function
   End If
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

'******************Added by kalyan dated 9122016 1701 Changes**************************
'[Check link Standing Instruction Enabled Disabled]
Public Function verifyLnkStandingInst(strStatus)
   bDevPending=true
   bverifyLnkStandingInst=true
   bverifyLnkStandingInst=CheckVaadinObject_Disabled2(bcCustomerOverview.lnkStandingInstruction(), strStatus)
   verifyLnkStandingInst=bverifyLnkStandingInst
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

'******************Added by kalyan dated 9122016 1701 Changes**************************
'[Check link Recent Application Enabled Disabled]
Public Function verifyLnkRecentApp(strStatus)
   bDevPending=true
   bverifyLnkRecentApp=true
   bverifyLnkRecentApp=CheckVaadinObject_Disabled2(bcCustomerOverview.lnkRecentApplication(), strStatus)
   verifyLnkRecentApp=bverifyLnkRecentApp
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

'******************Added by kalyan dated 9122016 1701 Changes**************************
'[Check link Token Mangmnt Enabled Disabled]
Public Function verifyLnkTknMngmnt(strStatus)
   bDevPending=true
   bverifyLnkTknMngmnt=true
   bverifyLnkTknMngmnt=CheckVaadinObject_Disabled2(bcCustomerOverview.lnkTokenMgt(), strStatus)
   verifyLnkTknMngmnt=bverifyLnkTknMngmnt
End Function

'[Verify Standing Instruction link disabled in Customer Overview Page]
Public Function verifyTokenManagement_Disable()
	bverifyTokenManagement_Disable=true	
	intTokenManagement =InStr(bcCustomerOverview.lnkStandingInstruction.GetROProperty("class"),"disabled-area")
	If not intTokenManagement=0 Then
		LogMessage "RSLT","Verification","Token Management link is disabled as expected.",True
		bverifyTokenManagement_Disable=true
	Else
		LogMessage "WARN","Verifiation","Token Management link is enabled. Expected to be disable.",false
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

'[Verify Info Warn message on hompeage]
Public Function verifyInfoWarn_Homepage(strInfoMsg)
	bverifyInfoWarn = true
	WaitForICallLoading
	If Not IsNull(strInfoMsg) Then
 		If Not VerifyInnerText(bcInfoWarning.txtInfoWarn(), strInfoMsg, "InfoWarnMsg")Then
		   bverifyInfoWarn = false
		End If
	End If
	verifyInfoWarn_Homepage = bverifyInfoWarn
End Function

'[Verify Pink Panel details having Product Account and status Information]
Public Function VerifyPinkPanel(strProduct, strSubProduct, strAccountNumber, strAccountName, strStatus, strCurrency, strType, strOpenDate)
    VerifyPinkPanel = VerifyCardAccountSummary(strProduct, strSubProduct, strAccountNumber, strAccountName, strStatus, strCurrency, strType, strOpenDate)
End Function 

'[Verify field Special Handling Block Code1 on Key Info Page displayed as]
Public Function verifySpecialHandling_BlockCode(strSHBlockCode)
   Dim bverifySHBlockCode:bverifySHBlockCode=true
	If Not IsNull(strSHBlockCode) Then
		bcKeyInfo.lnkViewDetails.Click
		WaitForICallLoading
		If Not verifyInnerText(bcKeyInfo.lblBlockCode1_OFSA(), strSHBlockCode, "Special Handling Block Code1")Then
		   bverifySHBlockCode = False
		End If
	End If
	verifySpecialHandling_BlockCode=bverifySHBlockCode
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

'[Click Refresh Icon in the Pink Panel]
Public Function ClickRefreshIcon_PinkPanel()
	Wait 1
	bcCardAccountSummary.IconRefresh.Click		
		If Err.Number<>0 Then
		ClickRefreshIcon_PinkPanel=false
		    LogMessage "WARN","Verification","Failed to Click Icon : Refresh Icon in Page displayed" ,false
		Exit Function
		End If
		WaitForICallLoading
   ClickRefreshIcon_PinkPanel= True
End Function

'**************************Banking Facilities rewards************************
'[Click Rewards link on Customer Overview Screen]
Public Function clicklink_Rewards()
	bDevPending=false
   bcCustomerOverview.lnkRewards.click
   If Err.Number<>0 Then
       clicklink_Rewards=false
            LogMessage "WARN","Verification","Failed to Click Link : Rewards" ,false
       Exit Function
   End If
   WaitForICallLoading
   clicklink_Rewards=true
End Function

'[Verify the pop up for alert exist on customer overview page]
Public Function verifypopup_AlertsCustOverview(bExist)
	bDevPending=false
   bActualExist=bcCustomerOverview.popupAlert.Exist(2)
   If bExist And  bActualExist  Then
       LogMessage "RSLT","Verification","Popup :Customer Alerts Exists As Expected" ,true
       verifypopup_AlertsCustOverview=True
   ElseIf not bExist And  not bActualExist  Then
       LogMessage "RSLT","Verification","Popup :Customer Alerts does not Exists As Expected" ,true
       verifypopup_AlertsCustOverview=True
   ElseIf bExist And  not bActualExist  Then
       LogMessage "WARN","Verification","Popup :Customer Alerts does not Exists As Expected" ,False
       verifypopup_AlertsCustOverview=False
   ElseIf not bExist And   bActualExist  Then
       LogMessage "WARN","Verification","Popup :Customer Alerts Still Exists" ,False
       verifypopup_AlertsCustOverview=False
   End If
End Function

'[Verify Pink Panel displayed For Banking Products]
Public Function verifyBanking_PinkPanel(strName,strCINSuffix,strSegment)
    bverifyBanking_PinkPanel=true
    If Not IsNull (strName) Then
        If Not verifyInnerText(bcCardAccountSummary.lblName(),strName, "Name") Then
            bverifyBanking_PinkPanel=false
        End If
    End If
    If Not IsNull (strCIN) Then
        If Not verifyInnerText(bcCardAccountSummary.lblCINSuffix(),strCINSuffix, "CIN") Then
            bverifyBanking_PinkPanel=false
        End If
    End If
    If Not IsNull (strSegment) Then
        If Not verifyInnerText(bcCardAccountSummary.lblSegment(),strSegment, "Segment") Then
            bverifyBanking_PinkPanel=false
        End If
    End If
    verifyBanking_PinkPanel=bverifyBanking_PinkPanel
End Function

'[Verify customer by answering required level of Identification and Authenticaion questions]
Public Function SelectManualAuthentication(RequiredIDVerificationLevel,RequiredAUVerificationLevel)
	bAppStateLogout = True
	bSelectManualAuthentication = True
	Wait(5)
	WaitForIcallLoading
	' Check if the Manual Identification and Authentican required
	If RequiredIDVerificationLevel = "0" And RequiredAUVerificationLevel = "0" Then
		LogMessage "RSLT","Verification","No manual Identification and authentication required or demanded",True
		SelectManualAuthentication = True
		Exit Function
	End If	
	' Click on Verify Button
	For iCounter = 1 To 180 Step 1
		If Not VerifyCustomer.btnVerify.Exist(0.5) Then
			Wait(0.5)
		else
			VerifyCustomer.btnVerify.Click
			Exit for
		End if
	Next	
	If Err.Number<>0 Then
		SelectManualAuthentication=false
		LogMessage "WARN","Verification","Failed to Click Button : MA Verify" ,false
		Exit Function
	End If
	Wait(30)
	WaitForIcallLoading
	
	' verify if the verify customer page displayed as expected 
	If Not VerifyCustomer.pageExists() Then
		LogMessage "WARN","Verification.","Verify customer Page not displayed as expected",False
		bSelectManualAuthentication=False
		Exit Function
	Else
		LogMessage "RSLT","Verification.","Verify Customer Page displayed successfully",True
	End If
	
	'Checking the MA status if High Rish Verified then skip answering Identification and  Authentication questions
	strStatus=VerifyCustomer.lblVerificationStatus.GetROProperty("innertext")
	If Ucase(Trim(strStatus)) = Ucase("High Risk Verified") Then
		VerifyCustomer.btnVerifyCustomer().click
		Wait(10)
		WaitForIcallLoading
		bSelectManualAuthentication = True		 
	else	
		' Answer the Idendification questions if the required Idendification is greater than zero
		If RequiredIDVerificationLevel <> "0" Then
			Set objtableIdentification= VerifyCustomer.tblIdentificationQuiz
			Set oDesc = Description.Create()
			oDesc("html id").Value = "vrfyCustIdenQ_div.*"
			Set questionCollection = objtableIdentification.ChildObjects(oDesc)
			NumberOfQues = questionCollection.Count
			If NumberOfQues <> "0" Then
				'For i  = 0 To RequiredIDVerificationLevel - 1 Step 1
				For i  = 0 To 4 Step 1
					ObjRowClassname = Trim(questionCollection(i).getroproperty("class"))
					If Not (instr(ObjRowClassname,"disabled")) > 0 Then
						Set objQuesRow=questionCollection(i)        
						Set oDescRadio = Description.Create()
						'oDescRadio("xpath").value= "//*[contains(@class,'md-label')]"
						oDescRadio("class").value="md-label.*"
						Set RadioCollection = objQuesRow.ChildObjects(oDescRadio)
						selectRadioGroup RadioCollection,"Pass",Array("Pass","Fail")
						LogMessage "RSLT","Verification","Radio Button Pass Selected for Customer Identification Question",True
					End IF
				Next
			End If
		End If
		
		' Answer the Authentication questions if the required Authentication is greater than zero
		If RequiredAUVerificationLevel <> "0" Then
		' Click link Other Authentication Questions displayed in the table 
		Call clickLnkOthrAuthQstns()
		' Select Product as Banking from the list of products displayed
		Call SelectProdLstOtherAuth("Banking")
		
		'Select link Account Number from the Accounts table displayed 
		Call clickVaddinLink_tblCell(VerifyCustomer.tblOthrAuthCustAccntHeader,VerifyCustomer.tblOthrAuthCustAccntContent,0, "Accounts")
		wait(15)
		WaitForIcallLoading
		'Answering Product Related questions 
		Set objtableAuthenticationCPQ= VerifyCustomer.tblAuthenticationProductRelated
		Set oDesc = Description.Create()
		oDesc("html id").Value = "vrfyCustProdAuthQ_div.*"
		Set questionCollection2 = objtableAuthenticationCPQ.ChildObjects(oDesc)
		NumberOfQues = questionCollection2.Count
		If NumberOfQues <> "0" Then
			For i  = 0 To NumberOfQues - 1 Step 1
				Set objQuesRow=questionCollection2(i)		
				Set oDescRadio = Description.Create()
				oDescRadio("class").value="md-radio-button"
				Set RadioCollection =objQuesRow.ChildObjects(oDescRadio)
				selectRadioGroup RadioCollection,"Pass",Array("Pass","Fail")
				LogMessage "RSLT","Verification","Radio Button Pass Selected for Customer Portfolio Question",True
			Next
		End If   
		'Answering Non-Smart questions 
		WaitForIcallLoading
		Set objtableAuthenticationNonSmart= VerifyCustomer.tblAuthenticationNonSmart
		Set oDesc = Description.Create()
		oDesc("html id").Value = "vrfyCustProdSpecAuthQ_div.*"
		Set questionCollection3 = objtableAuthenticationNonSmart.ChildObjects(oDesc)
		NumberOfQues = questionCollection3.Count
		If NumberOfQues <> "0" Then
			For i  = 0 To NumberOfQues - 1 Step 1
				Set objQuesRow=questionCollection3(i)		
				Set oDescRadio = Description.Create()
				oDescRadio("class").value="md-radio-button"
				Set RadioCollection =objQuesRow.ChildObjects(oDescRadio)
				selectRadioGroup RadioCollection,"Pass",Array("Pass","Fail")
				LogMessage "RSLT","Verification","Radio Button Pass Selected for Customer Portfolio Question",True
			Next
		End If
	
		' Answer the TPIN Related questions if the Authentication required	  
		WaitForIcallLoading
		Set objtableAuthenticationCPQ= VerifyCustomer.tblAuthenticationQuiz
		Set oDesc = Description.Create()
		oDesc("micclass").Value="WebElement"
		oDesc("html tag").Value="MD-RADIO-GROUP"
		Set questionCollection1 = objtableAuthenticationCPQ.ChildObjects(oDesc)                
		NumberOfQues = questionCollection1.Count
		If NumberOfQues <> "0" Then
			NoofQuestionsAnswered = 0
			For i  = 0 To NumberOfQues - 1 Step 1
				ObjRowClassname = Trim(questionCollection1(i).getroproperty("class"))
				If Not (instr(ObjRowClassname,"disabled")) > 0 Then
					Set objQuesRow = questionCollection1(i)        
					Set oDescRadio = Description.Create()
					oDescRadio("class").value="md-label.*"
					Set RadioCollection =objQuesRow.ChildObjects(oDescRadio)
					selectRadioGroup RadioCollection,"Pass",Array("Pass","Fail")
					NoofQuestionsAnswered = NoofQuestionsAnswered+1
					LogMessage "RSLT","Verification","Radio Button Pass Selected for Customer Portfolio Question",True
				End If 
			Next
		End If
	End IF 
	'Select Custom Questions from the verify Customer Page' 
	strQuestion = "Test Custom Questions"
	'Answer custom Questions to satisfy High risk verified     
	Set oCustomQuestions= VerifyCustomer.CustomQueRadioGroup    
	VerifyCustomer.txtCustomQuestions.Set strQuestion                
	Set oDescRadio = Description.Create()
	oDescRadio("class").value="md-label.*"
	Set RadioCollection =oCustomQuestions.ChildObjects(oDescRadio)
	NumberOfRadio=RadioCollection.Count                    
	If NumberOfRadio=0 Then
		LogMessage "WARN","Verification","Expected question: "&strQuestion&" not found in Identification Questions list",false
		Exit Function
	End If    
	selectRadioGroup RadioCollection,"Pass",Array("Pass","Fail")
	LogMessage "RSLT","Verification","Radio Button Selected for Question"&strQuestion,true
	WaitForIcallLoading
	VerifyCustomer.btnVerifyCustomer().click
	Wait(10)
	WaitForIcallLoading
	strStatus=VerifyCustomer.lblVerificationStatus.GetROProperty("innertext")
	If Ucase(Trim(strStatus)) = Ucase("Low Risk Verified") OR Ucase(Trim(strStatus)) = Ucase("High Risk Verified") Then 
		LogMessage "RSLT","Verification","Customer Verification Status is matching with the expected value. Actual: "& strStatus&", Expected: High or Low Risk Verified" ,True
		bSelectManualAuthentication = True
	Else
		LogMessage "WARN","Verification","Customer Verification Status is not matching with the expected value. Actual: "&strStatus&", Expected: High or Low Risk Verified" ,False
		bSelectManualAuthentication = False    
	End IF
End if
 SelectManualAuthentication = bSelectManualAuthentication
End Function 

'[Click Link Other Authentication Questions on Verify Page]
Public Function clickLnkOthrAuthQstns()
bDevPending=false
Wait(5)
For iCounters = 1 To 180 Step 1
		If Not VerifyCustomer.lnkOtherAuthQstns.Exist(0.5) Then
			Wait(0.5)
		else
			VerifyCustomer.lnkOtherAuthQstns.click
			Exit for
		End if
	Next   

Wait(10)
If Err.Number<>0 Then
clickLnkOthrAuthQstns=false
LogMessage "WARN","Verification","Failed to Click Link : Other Authentication Questions" ,false
Exit Function
End If
waitForIcallLoading
clickLnkOthrAuthQstns=true
End Function

'[Select Product List from Other Authentication Questions]
Public Function SelectProdLstOtherAuth(strProduct)
	bSelectProdLstOtherAuth = True
	Wait(5)
	Set objtableOtherAuthProdLst= VerifyCustomer.tblProductLst
	Set OtherAuthQsntProd = Description.Create()
	OtherAuthQsntProd("micclass").Value = "WebElement"
	OtherAuthQsntProd("class").Value = "ng-binding"
	Set OtherAuthQsntProdCollectionLst = objtableOtherAuthProdLst.ChildObjects(OtherAuthQsntProd)
	NumberOfProdLst = OtherAuthQsntProdCollectionLst.Count
	For intProdLstCount=0 to NumberOfProdLst - 1
		status=matchStr(strProduct, OtherAuthQsntProdCollectionLst(intProdLstCount).GetROproperty("innertext"))
		If status=True Then
		OtherAuthQsntProdCollectionLst(intProdLstCount).click
		bSelectProdLstOtherAuth = True
		End If	
	Next
	Wait(20)
	SelectProdLstOtherAuth=bSelectProdLstOtherAuth
End Function

'[Select Account Number from Other Authentication Questions]
Public Function SelectAccntNoOtherAuth(lstAccountNo)
	bSelectAccntNoOtherAuth = True
	bSelectAccntNoOtherAuth = selectTableLink(VerifyCustomer.tblOthrAuthCustAccntHeader,VerifyCustomer.tblOthrAuthCustAccntContent,lstAccountNo,"OtherAuthAccounts" ,"Accounts",false,null,null,null)
	SelectAccntNoOtherAuth=bSelectAccntNoOtherAuth
End Function

'[Verify the click on comments link in the alerts table]
Public Function clickcomments_AlertsCustomerOverview(lstRowData)
 	bclickcomments_AlertsCustomerOverview = true
	clickcomments_AlertsCustomerOverview = selectTableLink(bcCustomerOverview.tblCommentsHeader,bcCustomerOverview.tblCommentsTable,lstRowData,"Alerts","Comments",true,bcCustomerOverview.lnkNext,bcCustomerOverview.lnkNext1,bcCustomerOverview.lnkPrevious)
	clickcomments_AlertsCustomerOverview = bclickcomments_AlertsCustomerOverview
 End Function

'[Verify the fields of alerts popup on customer overview page]
Public Function verifyfields_CustomerAlertsDetails(lstAlertsDetails)
	bverifyfields_CustomerAlertsDetails = true
	intSize = Ubound(lstAlertsDetails)
	For Iterator = 0 To intSize Step 1
		arrLabel = trim(Split(lstAlertsDetails(Iterator),":")(0))
		arrValue = trim(Split(lstAlertsDetails(Iterator),":")(1))
		
	Select Case (arrLabel)		
		Case "Created By"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText(bcCustomerOverview.lblCreatedBy(), arrValue, "Created By")Then
				LogMessage "RSLT","Verification","Alerts Details - Created By:"&arrValue&" is not displayed as expected",false
				bverifyfields_CustomerAlertsDetails=false
			End If
		End If
		
		Case "Duration"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText(bcCustomerOverview.lblDuration(), arrValue, "Duration")Then
				LogMessage "RSLT","Verification","Alerts Details - Duration:"&arrValue&" is not displayed as expected",false
				bverifyfields_CustomerAlertsDetails=false
			End If
		End If
		
		Case "Unit Type"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText(bcCustomerOverview.lblUnitType(), arrValue, "Unit Type")Then
				LogMessage "RSLT","Verification","Alerts Details - Unit Type:"&arrValue&" is not displayed as expected",false
				bverifyfields_CustomerAlertsDetails=false
			End If
		End If
		
		Case "Target Org/Division"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText(bcCustomerOverview.lblTarget(), arrValue, "Target Org/Division")Then
				LogMessage "RSLT","Verification","Alerts Details - Target Org/Division:"&arrValue&" is not displayed as expected",false
				bverifyfields_CustomerAlertsDetails=false
			End If
		End If
		
		Case "Priority"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText(bcCustomerOverview.lblPriority(), arrValue, "Priority")Then
				LogMessage "RSLT","Verification","Alerts Details - Priority:"&arrValue&" is not displayed as expected",false
				bverifyfields_CustomerAlertsDetails=false
			End If
		End If
		
		Case "Category"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText(bcCustomerOverview.lblCategory(), arrValue, "Category")Then
				LogMessage "RSLT","Verification","Alerts Details - Category:"&arrValue&" is not displayed as expected",false
				bverifyfields_CustomerAlertsDetails=false
			End If
		End If
		
		Case "Comments"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText(bcCustomerOverview.lblMessage(), arrValue, "Comments")Then
				LogMessage "RSLT","Verification","Alerts Details - Comments:"&arrValue&" is not displayed as expected",false
				bverifyfields_CustomerAlertsDetails=false
			End If
		End If	
		End select
		Next 
		verifyfields_CustomerAlertsDetails =bverifyfields_CustomerAlertsDetails
End Function

'[Verify the fields created date and expiry date for alerts details]
Public Function verifyCreatedExpiry_CustomerAlerts(strCreatedDate,strExpDate)
	bverifyCreatedExpiry_CustomerAlerts = true
	If Not IsNull(strCreatedDate) Then
			If Not VerifyInnerText(bcCustomerOverview.lblStartDate(), strCreatedDate, "Created Date/Time")Then
				LogMessage "RSLT","Verification","Alerts Details - Created Date/Time:"&strCreatedDate&" is not displayed as expected",false
				bverifyfields_CustomerAlertsDetails=false
			End If
		End If
	If Not IsNull(strExpDate) Then
			If Not VerifyInnerText(bcCustomerOverview.lblExpiryDate(), strExpDate, "Expiry Date")Then
				LogMessage "RSLT","Verification","Alerts Details - Expiry Date:"&strExpDate&" is not displayed as expected",false
				bverifyfields_CustomerAlertsDetails=false
			End If
		End If	
		bcCustomerOverview.btnOK_Alert.Click
		verifyCreatedExpiry_CustomerAlerts = bverifyCreatedExpiry_CustomerAlerts
End Function

'[Verify User navigated to Customer Profile tab on click of Name link from Pink Panel]
Public Function VerifyNavigationfromPinkPanel(strName)
    bVerifyNavigationfromPinkPanel  = True
    If Not IsNull(strName) Then
        bcCardAccountSummary.lblName().Click
        VerifyAccLabel = VerifyInnerText(cCustomerOverview.lblAccounts(), "Accounts", "Account Label")     
        If VerifyAccLabel = True  Then
            bVerifyNavigationfromPinkPanel  = True
        Else 
            bVerifyNavigationfromPinkPanel  = False
        End If
    End If
    VerifyNavigationfromPinkPanel = bVerifyNavigationfromPinkPanel
End Function

'[Verify Number of short cut buttons in the Page displayed]
Public Function VerifyButtonDisplay(lstShortCutButtons)
    'bVerifyShortCutButtons = true
    intSize = Ubound(lstShortCutButtons)
    For Iterator = 0 To intSize Step 1
        arrButtonName= trim(Split(lstShortCutButtons(Iterator),":")(1))
        Set oDesc=Description.Create
        oDesc("micclass").Value = "WebElement"
        oDesc("xpath").Value = "//*[contains(@class,'md-tab-content') and contains(@class,'md-active') and contains(@class,'has-is-footer')]"
        Set obj= Browser("micclass:=Browser").Page("miccclass:=Page").ChildObjects(oDesc)
        
        Set oDescFooter=Description.Create
        oDescFooter("micclass").Value = "WebElement"
        oDescFooter("class").Value = "isFooter layout"
        Set objFooter= obj(0).ChildObjects(oDescFooter)
        
        Set oDescBtn=Description.Create
        oDescBtn("micclass").Value = "WebElement"
        oDescBtn("class").Value = "ng-binding ng-scope"

        set objBtnSet=objFooter(0).ChildObjects(oDescBtn)
        intBtnCount=objBtnSet.Count
        
        Set oDescBtnToClick=Description.Create
        oDescBtnToClick("micclass").Value = "WebElement"
        oDescBtnToClick("class").Value = "ng-binding ng-scope"
        oDescBtnToClick("innertext").Value =""&arrButtonName
        set objBtnToClick=objFooter(0).ChildObjects(oDescBtnToClick)
        intBtnCount=objBtnToClick.Count
        If intBtnCount=0 Then
            LogMessage "RSLT","Verification","SR Shortcut Button "&arrButtonName&" not found on page.",false
            VerifyShortCutButtons=false
            Exit Function
        else
            LogMessage "RSLT","Verification","SR Shortcut Button "&arrButtonName&" found on page.",true
            WaitForIcallLoading
            VerifyShortCutButtons=true    
        End If
    NExt
VerifyButtonDisplay =VerifyShortCutButtons 
End Function

'****************************Customer profile vbs functions added by Aniket****************
'[Click on the Customer profile link on overview page]
Public Function clickCustLink_Overview()
	bclickCustLink_Overview=true
	bcCustomerOverview.lnkViewProfile.Click
	WaitForIcallLoading
	If Err.Number<>0 Then
       bclickCustLink_Overview=false
       LogMessage "WARN","Verification","Failed to Click Link  : Customer profile link" ,false
       Exit Function
	End If
	waitForIcallLoading	
clickCustLink_Overview = bclickCustLink_Overview
End Function

'[Verify the key info details on customer profile page]
Public Function verifyKeyinfo_CustProfile(lstKeyDetails)
	bveifyKeyinfo_CustProfile = true
	intSize = Ubound(lstKeyDetails)
	For Iterator = 0 To intSize Step 1
		arrLabel = trim(Split(lstKeyDetails(Iterator),":")(0))
		arrValue = trim(Split(lstKeyDetails(Iterator),":")(1))
		
	Select Case (arrLabel)
		Case "Cin"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcCustomerProfile.lblCIN(), arrValue, "Cin")Then
				LogMessage "RSLT","Verification","Key Info - Cin:"&arrValue&" is not displayed as expected",false
				bveifyKeyinfo_CustProfile=false
			End If
		End If
		
		Case "Name"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcCustomerProfile.lblName(), arrValue, "Name")Then
				LogMessage "RSLT","Verification","Key Info - Name:"&arrValue&" is not displayed as expected",false
				bveifyKeyinfo_CustProfile=false
			End If
		End If
		
		Case "Alias"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcCustomerProfile.lblAlias(), arrValue, "Alias")Then
				LogMessage "RSLT","Verification","Key Info - Alias:"&arrValue&" is not displayed as expected",false
				bveifyKeyinfo_CustProfile=false
			End If
		End If
		
		Case "Status1"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcCustomerProfile.lblStatus1(), arrValue, "Status1")Then
				LogMessage "RSLT","Verification","Key Info - Status1:"&arrValue&" is not displayed as expected",false
				bveifyKeyinfo_CustProfile=false
			End If
		End If
		
		Case "Status2"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcCustomerProfile.lblStatus2(), arrValue, "Status2")Then
				LogMessage "RSLT","Verification","Key Info - Status2:"&arrValue&" is not displayed as expected",false
				bveifyKeyinfo_CustProfile=false
			End If
		End If
		
		Case "Status3"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcCustomerProfile.lblStatus3(), arrValue, "Status3")Then
				LogMessage "RSLT","Verification","Key Info - Status3:"&arrValue&" is not displayed as expected",false
				bveifyKeyinfo_CustProfile=false
			End If
		End If
		
		Case "Status4"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcCustomerProfile.lblStatus4(), arrValue, "Status4")Then
				LogMessage "RSLT","Verification","Key Info - Status4:"&arrValue&" is not displayed as expected",false
				bveifyKeyinfo_CustProfile=false
			End If
		End If
		
		Case "Source"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcCustomerProfile.lblSource(), arrValue, "Source")Then
				LogMessage "RSLT","Verification","Key Info - Source:"&arrValue&" is not displayed as expected",false
				bveifyKeyinfo_CustProfile=false
			End If
		 End If
		End select
	Next
	verifyKeyinfo_CustProfile = bveifyKeyinfo_CustProfile
End Function

'[Verify the Personal info details on customer profile page]
Public Function verifyPersinfo_CustProfile(lstPersonalDetails)
	bverifyPersinfo_CustProfile = true
	intSize = Ubound(lstPersonalDetails)
	For Iterator = 0 To intSize Step 1
		arrLabel = trim(Split(lstPersonalDetails(Iterator),":")(0))
		arrValue = trim(Split(lstPersonalDetails(Iterator),":")(1))
		
	Select Case (arrLabel)
		Case "Salutation"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcCustomerProfile.lblSalutation(), arrValue, "Salutation")Then
				LogMessage "RSLT","Verification","Key Info - Salutation:"&arrValue&" is not displayed as expected",false
				bverifyPersinfo_CustProfile=false
			End If
		End If
		
		Case "DOB"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcCustomerProfile.lblDOB(), arrValue, "DOB")Then
				LogMessage "RSLT","Verification","Key Info - DOB:"&arrValue&" is not displayed as expected",false
				bverifyPersinfo_CustProfile=false
			End If
		End If
		
		Case "Ethnic Type"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcCustomerProfile.lblEthnicType(), arrValue, "Ethnic Type")Then
				LogMessage "RSLT","Verification","Key Info - Ethnic Type:"&arrValue&" is not displayed as expected",false
				bverifyPersinfo_CustProfile=false
			End If
		End If
		
		Case "Sex"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcCustomerProfile.lblSex(), arrValue, "Sex")Then
				LogMessage "RSLT","Verification","Key Info - Sex:"&arrValue&" is not displayed as expected",false
				bverifyPersinfo_CustProfile=false
			End If
		End If
		
		Case "Marital Status"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcCustomerProfile.lblMaritalStatus(), arrValue, "Marital Status")Then
				LogMessage "RSLT","Verification","Key Info - Marital Status:"&arrValue&" is not displayed as expected",false
				bverifyPersinfo_CustProfile=false
			End If
		End If
		Case "Nationality"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcCustomerProfile.lblNationality(), arrValue, "Nationality")Then
				LogMessage "RSLT","Verification","Key Info - Nationality:"&arrValue&" is not displayed as expected",false
				bverifyPersinfo_CustProfile=false
			End If
		End If
		Case "CoRes"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcCustomerProfile.lblCountryOfRes(), arrValue, "CoRes")Then
				LogMessage "RSLT","Verification","Key Info - CoRes:"&arrValue&" is not displayed as expected",false
				bverifyPersinfo_CustProfile=false
			End If
		End If
		Case "Employer Name"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcCustomerProfile.lblEmployerName(), arrValue, "Employer Name")Then
				LogMessage "RSLT","Verification","Key Info - Employer Name:"&arrValue&" is not displayed as expected",false
				bverifyPersinfo_CustProfile=false
			End If
		End If
		Case "Occupation"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcCustomerProfile.lblOccupation(), arrValue, "Occupation")Then
				LogMessage "RSLT","Verification","Key Info - Occupation:"&arrValue&" is not displayed as expected",false
				bverifyPersinfo_CustProfile=false
			End If
		End If
		Case "Job Title"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcCustomerProfile.lblJobTitle(), arrValue, "Job Title")Then
				LogMessage "RSLT","Verification","Key Info - Job Title:"&arrValue&" is not displayed as expected",false
				bverifyPersinfo_CustProfile=false
			End If
		End If
		Case "Relationship Manager"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcCustomerProfile.lblRelManager(), arrValue, "Relationship Manager")Then
				LogMessage "RSLT","Verification","Key Info - Relationship Manager:"&arrValue&" is not displayed as expected",false
				bverifyPersinfo_CustProfile=false
			End If
		End If	
		Case "Segment"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcCustomerProfile.lblSegment(), arrValue, "Segment")Then
				LogMessage "RSLT","Verification","Key Info - Segment:"&arrValue&" is not displayed as expected",false
				bverifyPersinfo_CustProfile=false
			End If
		End If	
		Case "CDP AccountNo"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcCustomerProfile.lblCDPAccNum(), arrValue, "CDP AccountNo")Then
				LogMessage "RSLT","Verification","Key Info - CDP AccountNo:"&arrValue&" is not displayed as expected",false
				bverifyPersinfo_CustProfile=false
			End If
		End If		
	End select
	Next
	verifyPersinfo_CustProfile = bverifyPersinfo_CustProfile
End Function

'[Verify the market preferences on customer profile page]
Public Function verifyMarketPre_CustProfile(lstMarketPre)
	bverifyMarketPre_CustProfile = true
	intSize = Ubound(lstMarketPre)
	For Iterator = 0 To intSize Step 1
		arrLabel = trim(Split(lstMarketPre(Iterator),":")(0))
		arrValue = trim(Split(lstMarketPre(Iterator),":")(1))
		
	Select Case (arrLabel)
		Case "SMS/MMS"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcCustomerProfile.lblSMSMMS(), arrValue, "SMS/MMS")Then
				LogMessage "RSLT","Verification","Key Info - SMS/MMS:"&arrValue&" is not displayed as expected",false
				bverifyMarketPre_CustProfile=false
			End If
		End If
		Case "Phone/Mobile"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcCustomerProfile.lblPhoneMobile(), arrValue, "Phone/Mobile")Then
				LogMessage "RSLT","Verification","Key Info - Phone/Mobile:"&arrValue&" is not displayed as expected",false
				bverifyMarketPre_CustProfile=false
			End If
		End If
		
		Case "Fax"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcCustomerProfile.lblFax(), arrValue, "Fax")Then
				LogMessage "RSLT","Verification","Key Info -Fax:"&arrValue&" is not displayed as expected",false
				bverifyMarketPre_CustProfile=false
			End If
		End If
		Case "Email"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcCustomerProfile.lblEmail(), arrValue, "Email")Then
				LogMessage "RSLT","Verification","Key Info -Email:"&arrValue&" is not displayed as expected",false
				bverifyMarketPre_CustProfile=false
			End If
		End If
		Case "Direct Sales"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcCustomerProfile.lblDirectSales(), arrValue, "Direct Sales")Then
				LogMessage "RSLT","Verification","Key Info -Direct Sales:"&arrValue&" is not displayed as expected",false
				bverifyMarketPre_CustProfile=false
			End If
		End If
		End Select
		Next
		verifyMarketPre_CustProfile = bverifyMarketPre_CustProfile
End Function

'[Verify the additional SR info for Amendment displayed as]
Public Function verifyadditonalInfo_OLSAmendment(lstAdditonalInfo)
	bverifyadditonalInfo_OLSAmendment = true
	intSize = Ubound(lstAdditonalInfo)
	For Iterator = 0 To intSize Step 1
		arrLabel = trim(Split(lstAdditonalInfo(Iterator),":")(0))
		arrValue = trim(Split(lstAdditonalInfo(Iterator),":")(1))
		
	Select Case (arrLabel)
		Case "Bank - Earn Program"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcVerify_Insurance.lblStatusChangeDate(), arrValue, "Bank - Earn Program")Then
				LogMessage "RSLT","Verification","Insurance details - Status Change Date:"&arrValue&" is not displayed as expected",false
				bverifyfields_InsuranceDetails=false
			End If
		End If
	End Select
	Next
End Function

'[Execute DB Query To Delete Records]
Public Function ExecuteDBQueryToDeleteRecords(strDeleteQuery)
	verifyDB = true
	'strDeleteQuery= Replace(strDeleteQuery,"@","=")
	verifyDB = deleteRecordsMariyaDB(strDeleteQuery)
	ExecuteDBQueryToDeleteRecords = verifyDB
End Function

'************Commom function for created date******************************
Public Function getDateMnthYear(strtCreateDateTime)
		strMonth=Month(strtCreateDateTime)
         strYear=Year(strtCreateDateTime)
         strDay=Day(strtCreateDateTime)
         If strDay>=0 and strDay<10 Then
         	strDay=0&strDay
         End If
         strHour=Hour(strtCreateDateTime)
         'If strHour=-1 Then
         '	strHour=23
         'End If
         If strHour>=0 and strHour<10 Then
         	strHour=0&strHour
         End If
         strMin=Minute(strtCreateDateTime)
         If strMin>=0 and strMin<10 Then
         	strMin=0&strMin
         End If
         strMonthName=MonthName(strMonth, True)
End Function

'******************Added by kalyan dated 9122016 1701 Changes**************************
'[Check link BillPayment Enabled Disabled]
Public Function verifyLnkBillPayment(strStatus)
   bDevPending=true
   bverifyLnkBillPayment=true
   bverifyLnkBillPayment=CheckVaadinObject_Disabled2(bcCustomerOverview.lnkBillPayment(), strStatus)
   verifyLnkBillPayment=bverifyLnkBillPayment
End Function

'[Check link Rewards Enabled Disabled]
Public Function verifyLnkRewards(strStatus)
   bDevPending=true
   bverifyLnkRewards=true
   bverifyLnkRewards=CheckVaadinObject_Disabled2(bcCustomerOverview.lnkRewards(), strStatus)
   verifyLnkRewards=bverifyLnkRewards
End Function

'[Check link SMS Email Inquiry Enabled Disabled]
Public Function verifyLnkSMSEmailInq(strStatus)
   bDevPending=true
   bverifyLnkSMSEmailInq=true
   bverifyLnkSMSEmailInq=CheckVaadinObject_Disabled2(bcCustomerOverview.lnkEmailSMSInquiry(), strStatus)
   verifyLnkSMSEmailInq=bverifyLnkSMSEmailInq
End Function

'[Check link EStatement Enabled Disabled]
Public Function verifyLnkEStatement(strStatus)
   bDevPending=true
   bverifyLnkEStatement=true
   bverifyLnkEStatement=CheckVaadinObject_Disabled2(bcCustomerOverview.lnkEStatement(), strStatus)
   verifyLnkEStatement=bverifyLnkEStatement
End Function

'[Check link Internet Banking Enabled Disabled]
Public Function verifyLnkInternetBanking(strStatus)
   bDevPending=true
   bverifyLnkInternetBanking=true
   bverifyLnkInternetBanking=CheckVaadinObject_Disabled2(bcCustomerOverview.lnkInternetBanking(), strStatus)
   verifyLnkInternetBanking=bverifyLnkInternetBanking
End Function

'[Check link D2Pay Enabled Disabled]
Public Function verifyLnkD2Pay(strStatus)
   bDevPending=true
   bverifyLnkD2Pay=true
   bverifyLnkD2Pay=CheckVaadinObject_Disabled2(bcCustomerOverview.lnkD2Pay(), strStatus)
   verifyLnkD2Pay=bverifyLnkD2Pay
End Function

'***************************************Added by Kalyan 13122016 1701 Changes**************************************

'[Check Left Menu links Enabled Disabled]
Public Function CheckLeftMenu_Disabled(strLeftMenuName, strObjectStatus)
	Set oDesc=Description.Create
	oDesc("micclass").Value = "WebElement"
	oDesc("class").Value = "menu-list"
	Set objLeftPannel= Browser("micclass:=Browser").Page("micclass:=Page").ChildObjects(oDesc)
	Set oDescBtn=Description.Create
	oDescBtn("micclass").Value = "WebElement"
	oDescBtn("html tag").Value = "li" 		'oDescBtn("class").Value = "ng-binding"
	oDescBtn("innertext").Value = strLeftMenuName
	set objLeftMenuSet=objLeftPannel(0).ChildObjects(oDescBtn)
	intBtnCount=objLeftMenuSet.Count
	If intbtnCount=0 Then
	clickLefmenuLink=false
	LogMessage "RSLT","Verification","Expected Link "&strLeftMenuName&" does not displayed in Left menu",false
	else
	bDisabled =matchStr(objLeftMenuSet(0).GetROProperty("outerhtml"),"ng-scope disabled-area")
	End If
	If Ucase(Trim(strObjectStatus)) = "ENABLED" Then
	If bDisabled Then
	'Fail
	LogMessage "WARN","Verification","Object is disabled. Expected should be enabled",False
	CheckLeftMenu_Disabled = False
	Else
	'Pass
	LogMessage "RSLT","Verification","Object is enabled as expected",True
	CheckLeftMenu_Disabled = True						
	End If
	ElseIf Ucase(Trim(strObjectStatus)) = "DISABLED" Then
	If bDisabled Then
	'Pass
	LogMessage "RSLT","Verification","Object is disabled as expected",True
	CheckLeftMenu_Disabled = True
	Else
	'Fail
	LogMessage "WARN","Verification","Object is enabled. Expected should be disabeld",False
	CheckLeftMenu_Disabled = False
	End If	
	End If
End Function

'[Check Tab Enabled Disabled]
Public Function CheckTab_Disabled(strTabName, strObjectStatus)
	Set oDesc=Description.Create
	oDesc("micclass").Value = "WebElement"
	'oDesc("class").Value = "product-details-buttons"
	oDesc("html tag").Value = "MD-TAB-ITEM"
	oDesc("innertext").Value = strTabName
	'oDesc("id").Value = "items"
	Set objLeftPannel= Browser("micclass:=Browser").Page("micclass:=Page").ChildObjects(oDesc)
	
	intBtnCount=objLeftPannel.Count
	If intbtnCount=0 Then
	CheckTab_Disabled=false
	LogMessage "RSLT","Verification","Expected Tab "&strTabName&" does not displayed",false
	else
	bDisabled =matchStr(objLeftPannel(0).GetROProperty("outerhtml"),"aria-disabled=""true")
	End If
	If Ucase(Trim(strObjectStatus)) = "ENABLED" Then
	If bDisabled Then
	'Fail
	LogMessage "WARN","Verification","Object is disabled. Expected should be enabled",False
	CheckTab_Disabled = False
	Else
	'Pass
	LogMessage "RSLT","Verification","Object is enabled as expected",True
	CheckTab_Disabled = True						
	End If
	ElseIf Ucase(Trim(strObjectStatus)) = "DISABLED" Then
	If bDisabled Then
	'Pass
	LogMessage "RSLT","Verification","Object is disabled as expected",True
	CheckTab_Disabled = True
	Else
	'Fail
	LogMessage "WARN","Verification","Object is enabled. Expected should be disabeld",False
	CheckTab_Disabled = False
	End If	
	End If
End Function

'***************************MA Questions updated by Kalyan*************************

'[Verify customer by answering required level of Identification and Authenticaion questions updated]
Public Function SelectManualAuthenticationUpdated(RequiredIDVerificationLevel,RequiredAUVerificationLevel, strProduct, lstAccountNo)
	bAppStateLogout = True
	bSelectManualAuthenticationUpdated = True
	WaitForIcallLoading
	' Check if the Manual Identification and Authentican required
	If RequiredIDVerificationLevel = "0" And RequiredAUVerificationLevel = "0" Then
		LogMessage "RSLT","Verification","No manual Identification and authentication required or demanded",True
		bSelectManualAuthenticationUpdated = True
		Exit Function
	End If
	' Click on Verify Button
	VerifyCustomer.btnVerify.Click
	WaitForIcallLoading
	' verify if the verify customer page displayed as expected 
	If Not VerifyCustomer.pageExists() Then
		LogMessage "WARN","Verification.","Verify customer Page not displayed as expected",False
		bSelectManualAuthenticationUpdated=False
		Exit Function
	Else
		LogMessage "RSLT","Verification.","Verify Customer Page displayed successfully",True
	End If
	' Answer the questions if the required Idendification is greater than zero
	If RequiredIDVerificationLevel <> "0" Then
		Set objtableIdentification= VerifyCustomer.tblIdentificationQuiz
	    Set oDesc = Description.Create()
	    oDesc("html id").Value = "vrfyCustIdenQ_div.*"
	    Set questionCollection = objtableIdentification.ChildObjects(oDesc)
	    NumberOfQues = questionCollection.Count
	    If NumberOfQues <> "0" Then
		    For i  = 0 To RequiredIDVerificationLevel - 1 Step 1
		 	   Set objQuesRow=questionCollection(i)		
			   Set oDescRadio = Description.Create()
			   'oDescRadio("xpath").value= "//*[contains(@class,'md-label')]"
			   oDescRadio("class").Value = "md-radio-button"
			   Set RadioCollection = objQuesRow.ChildObjects(oDescRadio)
			   'msgbox RadioCollection(0).GetROproperty("innertext")
			   selectRadioGroup RadioCollection,"Pass",Array("Pass","Fail")
			   'Added by Kalyan 05012017
'			   bRefreshBtnSts = matchStr(VerifyCustomer.lblIdenRefresh.GetROProperty("outerhtml"),"fa fa-refresh refresh md-padding-left disabled-area")
'			   If bRefreshBtnSts=True Then
'			   	LogMessage "RSLT","Verification","Refresh Button Disbaled for Customer Identification Question as Expected",True
'			   	ELse
'			   	LogMessage "WARN","Verification.","Refresh Button Not Disbaled for Customer Identification Question",False
'			   End If
'			   LogMessage "RSLT","Verification","Radio Button Pass Selected for Customer Identification Question",True
		    Next
	   End If
	End If
	' Answer the questions if the required Authentication Customer Portfolio questions is greater than zero
	If RequiredAUVerificationLevel <> "0" Then
		' Create object for the Customer Portfolio questions table
		'Added by Kalyan
		clickLnkOthrAuthQstns()
		SelectProdLstOtherAuth(strProduct)
		SelectAccntNoOtherAuth(lstAccountNo)
		WaitForIcallLoading
		Set objtableAuthenticationCPQ= VerifyCustomer.tblAuthenticationQuizUpdated
	    Set oDesc = Description.Create()
	    oDesc("html id").Value = "vrfyCustProdAuthQ_div.*"
	    Set questionCollection = objtableAuthenticationCPQ.ChildObjects(oDesc)
	    NumberOfQues = questionCollection.Count
	    If NumberOfQues <> "0" Then
		    For i  = 0 To RequiredAUVerificationLevel - 1 Step 1
		 	   Set objQuesRow=questionCollection(i)		
			   Set oDescRadio = Description.Create()
			   'oDescRadio("xpath").value="//*[contains(@class,'md-label')]"
			   oDescRadio("class").value="md-radio-button"
			   Set RadioCollection =objQuesRow.ChildObjects(oDescRadio)
			   selectRadioGroup RadioCollection,"Pass",Array("Pass","Fail")
			   WaitForIcallLoading
			   LogMessage "RSLT","Verification","Radio Button Pass Selected for Customer Portfolio Question",True
		    Next
		    VerifyCustomer.btnVerifyCustomer().click
			WaitForIcallLoading

	   End If
	End If
SelectManualAuthenticationUpdated=bSelectManualAuthenticationUpdated
WaitForIcallLoading
End Function

'[Set FROM Date using Date picker]
Public Function SelectDatePicker_FromDate(strFromDate)
	SelectDatePicker_FromDate = True
	WaitForIcallLoading
	If Not IsNULL(strFromDate) Then
		Set objCalendar = Browser("micclass:=Browser").Page("micclass:=Page").WebButton("xpath:=(//md-icon[contains(@class,'fa-calendar')])[1]")
		If Instr(strFromDate, "TODAY")  Then
		  strTodayDate = SetDateField_Validation(strFromDate)
		  strTodayDate = Replace(strTodayDate,"-"," ")	  
		  SelectDatePicker_FromDate = selectDateFromCalendar(objCalendar,strTodayDate)
		ElseIf Not IsNull(strFromDate) Then	  
		  SelectDatePicker_FromDate = selectDateFromCalendar(objCalendar,strFromDate)
		End IF
		WaitForIcallLoading
		If Err.Number<>0 Then
		   SelectDatePicker_FromDate = False
		   LogMessage "WARN","Verification","Failed to Set Text Box :From Date" ,false
		   Exit Function
		End If   
	End If
End Function

'[Set TO Date using Date picker]
Public Function SelectDatePicker_TODate(strToDate)
	SelectDatePicker_TODate = True
	WaitForIcallLoading
	Set objCalendar = Browser("micclass:=Browser").Page("micclass:=Page").WebButton("xpath:=(//md-icon[contains(@class,'fa-calendar')])[2]")
	If Instr(strToDate, "TODAY")  Then
	  strTodayDate = SetDateField_Validation(strToDate)
	  strTodayDate = Replace(strTodayDate,"-"," ")	  
	  SelectDatePicker_TODate = selectDateFromCalendar(objCalendar,strTodayDate)
	ElseIf Not IsNull(strToDate) Then	  
	  SelectDatePicker_TODate = selectDateFromCalendar(objCalendar,strToDate)
	End IF
	WaitForIcallLoading
	If Err.Number<>0 Then
	   SelectDatePicker_TODate = False
	   LogMessage "WARN","Verification","Failed to Set Text Box :TO Date" ,false
	   Exit Function
	End If
End Function

'[Set Home Page From Date using Date picker]
Public Function SelectHomePageDatePickerFromDate(strFromDate)
	SelectHomePageDatePickerFromDate = True
	WaitForIcallLoading
	Set objCalendar = Browser("micclass:=Browser").Page("micclass:=Page").WebButton("xpath:=(//md-icon[contains(@class,'fa-calendar')])[2]")
	If Instr(strFromDate, "TODAY")  Then
	  strTodayDate = SetDateField_Validation(strFromDate)
	  strTodayDate = Replace(strTodayDate,"-"," ")	  
	  SelectHomePageDatePickerFromDate = selectDateFromCalendar(objCalendar,strTodayDate)
	ElseIf Not IsNull(strFromDate) Then	  
	  SelectHomePageDatePickerFromDate = selectDateFromCalendar(objCalendar,strFromDate)
	End IF
	WaitForIcallLoading
	If Err.Number<>0 Then
	   SelectHomePageDatePickerFromDate = False
	   LogMessage "WARN","Verification","Failed to Set Text Box :Home Page From Date" ,false
	   Exit Function
	End If
End Function

'[Set Home Page TO Date using Date picker]
Public Function SelectHomePageDatePicker_TODate(strToDate)
	SelectHomePageDatePicker_TODate = True
	WaitForIcallLoading
	Set objCalendar = Browser("micclass:=Browser").Page("micclass:=Page").WebButton("xpath:=(//md-icon[contains(@class,'fa-calendar')])[3]")
	If Instr(strToDate, "TODAY")  Then
	  strTodayDate = SetDateField_Validation(strToDate)
	  strTodayDate = Replace(strTodayDate,"-"," ")	  
	  SelectHomePageDatePicker_TODate = selectDateFromCalendar(objCalendar,strTodayDate)
	ElseIf Not IsNull(strToDate) Then	  
	  SelectHomePageDatePicker_TODate = selectDateFromCalendar(objCalendar,strToDate)
	End IF
	WaitForIcallLoading
	If Err.Number<>0 Then
	   SelectHomePageDatePicker_TODate = False
	   LogMessage "WARN","Verification","Failed to Set Text Box :TO Date" ,false
	   Exit Function
	End If
End Function
