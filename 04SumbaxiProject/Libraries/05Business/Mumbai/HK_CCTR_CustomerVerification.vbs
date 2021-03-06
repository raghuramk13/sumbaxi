'[Click Verify hyperlink on Search Customer page]
Public Function VerifyHyperlinkInSearchPage(strlstCIFdetails)
	Dim blnviewCIFDetails:blnviewCIFDetails = True
	Set objBranchNavigation=gObjIServePage.WebElement("xpath:=//*[@id='navBarBranch_span']")
		
	If Not(objBranchNavigation.Exist(10)) Then
		blnviewCIFDetails=selectTableLink(HK_PB_CreateProfile_Page.tblHearder(),HK_PB_CreateProfile_Page.tblcontent(),strlstCIFdetails,"CIFSearch" ,"Verify",false,NULL,NULL,NULL)
		If blnviewCIFDetails Then
			LogMessage "RSLT","Verification","As expected, Verify Hyerplink is displayed in Customer serach page",True
		Else
			LogMessage "WARN","Verification","Failed Verify Hyerplink is not displayed in Customer serach page",False	
		End If
	Else
		Set tblHearderBrnch=gObjIServePage.WebElement("html id:=branchSearchRsltName_table_header")
		Set tblcontentBrnch=gObjIServePage.WebElement("xpath:=//*[@id='branchSearchRsltName_table_content']")
		blnviewCIFDetails=selectTableLink(tblHearderBrnch,tblcontentBrnch,strlstCIFdetails,"CIF Search","Name in English",false,NULL,NULL,NULL)
	End If
	WaitForICallLoading
	WaitForICallLoading
	VerifyHyperlinkInSearchPage=blnviewCIFDetails
End Function

'[Verify Existence of Verify Customer Tab after clicking Verify Hyerplink]
Public Function VerifyCustomerTabByClickingLink(strTabName)
	bVerifyTab = False
	bVerifyTab = verifyTabExist(strTabName)
	If bVerifyTab Then
		LogMessage "RSLT","Verification","As expected, On Clicking Verify Hyerplink,Verify Customer page is displayed",True
	Else
		LogMessage "WARN","Verification","Failed to display Verify Customer page,On Clicking Verify Hyerplink ",False	
	End If
	closeTab strTabName
	VerifyCustomerTabByClickingLink = bVerifyTab
End Function

'[Verify Not Verified button in Overview page]
Public Function VerifyNotVerifiedButton()
	bVerifyBtn = False
	bVerifyBtn = VerifyFieldExistenceInPage(HK_CCTR_CustomerVerification_Page.btnNotVerified(),"Customer Overview Page","Not Verified Button")
	VerifyNotVerifiedButton = bVerifyBtn
End Function



'[Verify Status of verification in Customer Overview page]
Public Function VerifyCustomerVerificationStatusText(strVerificationStatus)
	blnVerifyCustomerIdenStatusText = true
	If Not IsNull(strIdentificationStatus) Then
		If Not VerifyInnerText (HK_CCTR_CustomerVerification_Page.btnNotVerified(), strVerificationStatus, "Customer Verification Status") Then
			blnVerifyCustomerIdenStatusText = false
		End If
	End If
	VerifyCustomerVerificationStatusText = blnVerifyCustomerIdenStatusText
End Function


'[Verify Existence of Verify Customer Tab after clicking Not Verified Button]
Public Function VerifyCustomerTabByClickingButton(strTabName)
	bVerifyTab = False
	bVerifyTab = verifyTabExist(strTabName)
	If bVerifyTab Then
		LogMessage "RSLT","Verification","As expected, On Clicking Not Verified Button,Verify Customer page is displayed",True
	Else
		LogMessage "WARN","Verification","Failed to display Verify Customer page,On Clicking Not Verified Button.",False	
	End If
	VerifyCustomerTabByClickingButton = bVerifyTab
End Function

'[Verify Identification Section Existence]
Public Function VerifyIdentificationExistence()
	bVerifysec = False
	bVerifysec = VerifyFieldExistenceInPage(HK_CCTR_CustomerVerification_Page.eleIdentificationSection(),"Overview Page","Identification Section")
	VerifyIdentificationExistence = bVerifysec
End Function


'[Verify Authentification Section Existence]
Public Function VerifyAuthentificationExistence()
	bVerifysec = False
	bVerifysec = VerifyFieldExistenceInPage(HK_CCTR_CustomerVerification_Page.eleAuthenticationSection(),"Overview Page","Authentification Section")
	VerifyAuthentificationExistence = bVerifysec
End Function


'[Verify customer identification status in Verify Customer page]
Public Function VerifyCustomerIdenStatusText(strIdentificationStatus)
	blnVerifyCustomerIdenStatusText = true
	If Not IsNull(strIdentificationStatus) Then
		If Not VerifyInnerText (HK_CCTR_CustomerVerification_Page.weleCustIdentificationStatus(), strIdentificationStatus, "Customer Identification Status") Then
			blnVerifyCustomerIdenStatusText = false
		End If
	End If
	VerifyCustomerIdenStatusText = blnVerifyCustomerIdenStatusText
End Function


'[Verify customer authentication status in Verify Customer page]
Public Function VerifyCustomerAuthenticationStatusText(strAuthenticationStatus)
	blnVerifyCustomerAuthenticationStatusText = true
	If Not IsNull(strIdentificationStatus) Then
		If Not VerifyInnerText (HK_CCTR_CustomerVerification_Page.weleCustAuthenticationStatus(), strAuthenticationStatus, "Customer Authentication Status") Then
			blnVerifyCustomerAuthenticationStatusText = false
		End If
	End If
	VerifyCustomerAuthenticationStatusText=blnVerifyCustomerAuthenticationStatusText
End Function


Public Function VerifyIdentificationQuestions(arrQuestionsSet)

For i = 0 To Ubound(arrQuestionsSet) Step 1
		

	Set objIdenQues=Description.Create
	objIdenQues("html id").Value="vrfyCustIdenQ_div.*"
	
	Set questionCollection = gObjIServePage.ChildObjects(objIdenQues)
    NumberOfQues = questionCollection.Count
    
    For Iterator = 0 To NumberOfQues-1 Step 1
    	strQuestionAnswer = questionCollection(Iterator).GetROProperty("innertext")
		If instr(strQuestionAnswer,arrQuestionsSet(i))>0 Then	
			blnQuestFound=True
			Exit For 
		Else
			blnQuestFound=False
			
		End If
    Next
    
    If blnQuestFound Then
    	
    	LogMessage "RSLT","Verification","Found Question in Customer Identification Section " & arrQuestionsSet(i),True

	Else 
		
		LogMessage "RSLT","Verification",arrQuestionsSet(i) & " Question Not Found in Customer Identification Section" ,False
    End If
    
Next	


VerifyIdentificationQuestions=blnQuestFound

End Function
Public Function VerifyAutoPassIdentificationQuestions(arrQuestionsSet)

For i = 0 To Ubound(arrQuestionsSet) Step 1
		

	Set objIdenQues=Description.Create
	objIdenQues("html id").Value="vrfyCustAutoPassQ_div.*"
	
	Set questionCollection = gObjIServePage.ChildObjects(objIdenQues)
    NumberOfQues = questionCollection.Count
    
    For Iterator = 0 To NumberOfQues-1 Step 1
    	strQuestionAnswer = questionCollection(Iterator).GetROProperty("innertext")
		If instr(strQuestionAnswer,arrQuestionsSet(i))>0 Then	
			blnQuestFound=True
			Exit For 
		Else
			blnQuestFound=False
			
		End If
    Next
    
    If blnQuestFound Then
    	
    	LogMessage "RSLT","Verification","Found Auto Pass Question in Customer Identification Section " & arrQuestionsSet(i),True

	Else 
		
		LogMessage "RSLT","Verification",arrQuestionsSet(i) & " Auto Pass Question Not Found in Customer Identification Section" ,False
    End If
    
Next	


VerifyAutoPassIdentificationQuestions=blnQuestFound

End Function

Public Function VerifyCallerIdQuestions(arrQuestionsSet)

For i = 0 To Ubound(arrQuestionsSet) Step 1
		

	Set objIdenQues=Description.Create
	objIdenQues("html id").Value="vrfyCustCallerIdQ_div.*"
	
	Set questionCollection = gObjIServePage.ChildObjects(objIdenQues)
    NumberOfQues = questionCollection.Count
    
    For Iterator = 0 To NumberOfQues-1 Step 1
    	strQuestionAnswer = questionCollection(Iterator).GetROProperty("innertext")
		If instr(strQuestionAnswer,arrQuestionsSet(i))>0 Then	
			blnQuestFound=True
			Exit For 
		Else
			blnQuestFound=False
			
		End If
    Next
    
    If blnQuestFound Then
    	
    	LogMessage "RSLT","Verification","Found Caller Id Question in Customer Authentication Section " & arrQuestionsSet(i),True

	Else 
		
		LogMessage "RSLT","Verification",arrQuestionsSet(i) & " Caller Id Question Not Found in Customer Authentication Section" ,False
    End If
    
Next	


VerifyCallerIdQuestions=blnQuestFound

End Function

'[Verify Caller Id Questions in Customer Authentication section]
Public Function VerifyCallerIdCustomerAuthenticationQuestionsInVerifyCustomer(strCallerIdCustAuthenticationQuestions)
	blnVerifyCallerIdCustomerAuthenticationQuestionsInVerifyCustomer=True
	
	blnVerifyCallerIdCustomerAuthenticationQuestionsInVerifyCustomer=VerifyCallerIdQuestions(strCallerIdCustAuthenticationQuestions)
	
	  If blnVerifyCallerIdCustomerAuthenticationQuestionsInVerifyCustomer Then
    	
    	LogMessage "RSLT","Verification","Caller Id Questions Validation in Customer Authentication section is succesful",True

	Else 
		
		LogMessage "RSLT","Verification","Caller Id Questions Validation in Customer Authentication section is failed" ,False
    End If
  	blnVerifyCallerIdCustomerAuthenticationQuestionsInVerifyCustomer=VerifyCallerIdCustomerAuthenticationQuestionsInVerifyCustomer
	
End Function


'[Verify Questions in Customer Identification section]
Public Function VerifyCustomerIdentificationQuestionsInVerifyCustomer(strCustIdentificationQuestions)
	blnVerifyCustomerIdentificationQuestionsInVerifyCustomer=True
	
	blnVerifyCustomerIdentificationQuestionsInVerifyCustomer=VerifyIdentificationQuestions(strCustIdentificationQuestions)
	
	  If blnVerifyCustomerIdentificationQuestionsInVerifyCustomer Then
    	
    	LogMessage "RSLT","Verification","Questions Validation in Customer Identification section is succesful",True

	Else 
		
		LogMessage "RSLT","Verification","Questions Validation in Customer Identification section is failed" ,False
    End If
  	blnVerifyCustomerIdentificationQuestionsInVerifyCustomer=VerifyCustomerIdentificationQuestionsInVerifyCustomer
	
End Function
'[Verify Auto Pass Questions in Customer Identification section]
Public Function VerifyCustomerIdentificationAutoPassQuestionsInVerifyCustomer(strCustIdentificationAutoPassQuestions)
	blnVerifyCustomerIdentificationAutoPassQuestionsInVerifyCustomer=True
	
	blnVerifyCustomerIdentificationAutoPassQuestionsInVerifyCustomer=VerifyAutoPassIdentificationQuestions(strCustIdentificationAutoPassQuestions)
	
	  If blnVerifyCustomerIdentificationAutoPassQuestionsInVerifyCustomer Then
    	
    	LogMessage "RSLT","Verification","Questions Validation in Customer Identification section is succesful",True

	Else 
		
		LogMessage "RSLT","Verification","Questions Validation in Customer Identification section is failed" ,False
    End If
  	blnVerifyCustomerIdentificationAutoPassQuestionsInVerifyCustomer=VerifyCustomerIdentificationAutoPassQuestionsInVerifyCustomer
	
End Function
Public Function VerifyCustomerPortfolioQuestions(arrQuestionsSet)

For i = 0 To Ubound(arrQuestionsSet) Step 1
		

	Set objIdenQues=Description.Create
	objIdenQues("html id").Value="vrfyCustCustPortQ_div.*"
	
	Set questionCollection = gObjIServePage.ChildObjects(objIdenQues)
    NumberOfQues = questionCollection.Count
    
    For Iterator = 0 To NumberOfQues-1 Step 1
    	strQuestionAnswer = questionCollection(Iterator).GetROProperty("innertext")
		If instr(strQuestionAnswer,arrQuestionsSet(i))>0 Then	
			blnQuestFound=True
			Exit For 
		Else
			blnQuestFound=False
			
		End If
    Next
    
    If blnQuestFound Then
    	
    	LogMessage "RSLT","Verification","Found Customer Portfolio Question in Customer Authentication Section " & arrQuestionsSet(i),True

	Else 
		
		LogMessage "RSLT","Verification",arrQuestionsSet(i) & " Customer Portfolio Question Not Found in Customer Authentication Section" ,False
    End If
    
Next	


VerifyCustomerPortfolioQuestions=blnQuestFound

End Function

'[Verify Customer Portfolio Questions in Customer Authentication section]
Public Function VerifyCustomerPortfolioQuestionsInAuthentication(strCustPortfolioQuestions)
	blnVerifyCustomerPortfolioQuestionsInAuthentication=True
	
	blnVerifyCustomerPortfolioQuestionsInAuthentication=VerifyCustomerPortfolioQuestions(strCustPortfolioQuestions)
	
	  If blnVerifyCustomerPortfolioQuestionsInAuthentication Then
    	
    	LogMessage "RSLT","Verification","Questions Validation in Customer Portfolio section is succesful",True

	Else 
		
		LogMessage "RSLT","Verification","Questions Validation in Customer Portfolio section is failed" ,False
    End If
  	blnVerifyCustomerPortfolioQuestionsInAuthentication=VerifyCustomerPortfolioQuestionsInAuthentication
	
End Function
'[Click account number in customer authentication section in Customer Verification page]
Public Function viewAccountNumberDetails(strlstAccountDetails)
	Dim blnviewAccountNumberDetails:blnviewAccountNumberDetails = True
	
	blnviewAccountNumberDetails=selectTableLink(HK_CCTR_CustomerVerification_Page.tblVerifyCustomerProductsHeader(),HK_CCTR_CustomerVerification_Page.tblVerifyCustomerProductsContent(),strlstAccountDetails,"Accounts" ,"Accounts",false,NULL,NULL,NULL)

	WaitForICallLoading
	viewAccountNumberDetails=blnviewAccountNumberDetails
End Function
Public Function VerifyCustomerProductSpecificQuestions(arrQuestionsSet)

For i = 0 To Ubound(arrQuestionsSet) Step 1
		

	Set objIdenQues=Description.Create
	objIdenQues("html id").Value="vrfyCustProdAuthQ_div.*"
	
	Set questionCollection = gObjIServePage.ChildObjects(objIdenQues)
    NumberOfQues = questionCollection.Count
    
    For Iterator = 0 To NumberOfQues-1 Step 1
    	strQuestionAnswer = questionCollection(Iterator).GetROProperty("innertext")
		If instr(strQuestionAnswer,arrQuestionsSet(i))>0 Then	
			blnQuestFound=True
			Exit For 
		Else
			blnQuestFound=False
			
		End If
    Next
    
    If blnQuestFound Then
    	
    	LogMessage "RSLT","Verification","Found Customer Portfolio Question in Customer Authentication Section " & arrQuestionsSet(i),True

	Else 
		
		LogMessage "RSLT","Verification",arrQuestionsSet(i) & " Customer Portfolio Question Not Found in Customer Authentication Section" ,False
    End If
    
Next	


VerifyCustomerProductSpecificQuestions=blnQuestFound

End Function
'[Verify Customer Product Specific Questions in Customer Authentication section]
Public Function VerifyCustomerProductQuestionsInAuthentication(strProductSpecificQuestions)
	blnVerifyCustomerProductQuestionsInAuthentication=True
	
	blnVerifyCustomerProductQuestionsInAuthentication=VerifyCustomerProductSpecificQuestions(strProductSpecificQuestions)
	
	  If blnVerifyCustomerProductQuestionsInAuthentication Then
    	
    	LogMessage "RSLT","Verification","Questions Validation in Customer Portfolio section is succesful",True

	Else 
		
		LogMessage "RSLT","Verification","Questions Validation in Customer Portfolio section is failed" ,False
    End If
  	VerifyCustomerProductQuestionsInAuthentication=blnVerifyCustomerProductQuestionsInAuthentication
	
End Function
'[Fail Verify customer by answering required level of Identification questions]
Public Function SelectManualAuthenticationQuestionsFail(intNoOfIdentificationQuestions)
    blnSelectManualAuthenticationQuestionsFail = True
   
  	
	Set objIdenQues=Description.Create
	objIdenQues("html id").Value="vrfyCustIdenQ_div.*"
	Set gObjIServePage = Browser("title:=I.*").Page("title:=I.*")
	Set objRadioGroup=Description.Create 
	objRadioGroup("html tag").Value="MD-RADIO-GROUP"
	objRadioGroup("html id").Value= "vrfyCustIdenQuest_radioGroup"
	
	Set questionCollection = gObjIServePage.ChildObjects(objIdenQues)
    NumberOfQues = questionCollection.Count
    
    For Iterator = 0 To intNoOfIdentificationQuestions-1 Step 1
   	
   			Set chilobj= questionCollection(Iterator).ChildObjects(objRadioGroup)
   			For j = 0 To chilobj.Count-1 Step 1
   				
   				chilobj(j).Click
   			Next
	
   	
   	Next
  
SelectManualAuthenticationQuestionsFail=blnSelectManualAuthenticationQuestionsFail

End Function
'[Verify customer identification failed status in error dialogue]
Public Function VerifyCustomerIdentificationFailedMsg(strFailedErrorMsg)
	blnVerifyCustomerIdentificationFailedMsg = true
	If Not IsNull(strFailedErrorMsg) Then
		If Not VerifyInnerText (HK_CCTR_CustomerVerification_Page.weleCustomerIdentFailedMsg(), strFailedErrorMsg, "Customer Identification Failed Message") Then
			blnVerifyCustomerIdentificationFailedMsg = false
		End If
	End If
	VerifyCustomerIdentificationFailedMsg = blnVerifyCustomerIdentificationFailedMsg
End Function

