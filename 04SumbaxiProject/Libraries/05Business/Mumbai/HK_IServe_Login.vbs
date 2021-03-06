'[Login as OPS_Checker]
Public Function LogInAsOPSChecker(strUserName,strPassword)
	LogInAsOPSChecker = login_iCall("OPS_CHECKER", strUserName, strPassword,"SUCCESS",NULL )
End Function

'[Login as OPS_Maker]
Public Function LogInAsOPSMaker(strUserName,strPassword)
	LogInAsOPSMaker = login_iCall("OPS_MAKER", strUserName, strPassword,"SUCCESS",NULL )
End Function

'[Logout from the iserve hk application]
Public Function LogoutFromApplication()	
	bcIServeHome_Page.IServeLogout()	
End Function

'[Verify Logout button functionality]
Public Function VerifyLogOutButtonFunctionality(strPopupMessage)
	VerifyFieldExistenceInPage bcIServeHome_Page.btnLogout() ,"Customer Overview Page","Logout Button"
	
	ClickOnObject bcIServeHome_Page.btnLogout(), "Logout Button"
	
	If bcIServeHome_Page.eleLogutConfirmationMsg().Exist(3) Then
		LogMessage "RSLT","Verification","On Clicking Logout Button system displayed logout pop up message",True
		strTemMesg = Trim(bcIServeHome_Page.eleLogutConfirmationMsg().GetROProperty("innertext"))
		If  strTemMesg = strPopupMessage  Then
			LogMessage "RSLT","Verification","Logout pop up message displays as expected :"&strPopupMessage,True
		Else
			LogMessage "WARN","Verification","Logout pop up message Failed to display as Expected: "&strPopupMessage & ", Actual: "&strTemMesg,False
		End If
		
		If bcIServeHome_Page.btnConfirmationYes().Exist(1) Then
			LogMessage "RSLT","Verification","Yes button displayed in logout pop up message",True
		Else
			LogMessage "WARN","Verification","Failed to display Yes button in logout pop up message",False
		End If
		
		If bcIServeHome_Page.btnConfirmationNo().Exist(1) Then
			LogMessage "RSLT","Verification","No button displayed in logout pop up message",True
		Else
			LogMessage "WARN","Verification","Failed to display No button in logout pop up message",False
		End If
		
	Else
		LogMessage "WARN","Verification","On Clicking Logout Button system failed to display logout pop up message",False
	End If
	
	ClickOnObject bcIServeHome_Page.btnConfirmationNo(), "Logout No Button"
	
	If Not bcLoginIServe_Page.txtUserId().Exist(1) Then
		LogMessage "RSLT","Verification","On Clicking No button in logout pop up message,application stable in current page",True
	Else
		LogMessage "WARN","Verification","On Clicking No button in logout pop up message,application moved out from current page",False
	End If
	
	ClickOnObject bcIServeHome_Page.btnLogout(), "Logout Button"
	
	ClickOnObject bcIServeHome_Page.btnConfirmationYes(), "Logout Yes Button"
	
	If bcLoginIServe_Page.txtUserId().Exist(10) Then
		LogMessage "RSLT","Verification","On Clicking Yes button in logout pop up message,application displays login page",True
	Else
		LogMessage "WARN","Verification","On Clicking Yes button in logout pop up message,application failed to display login page",False
	End If
	
End Function

'[Validate Login Page user authentication]
Public Function VerifyLoginPageUserAuthentication(strDat1,strDat2,strDat3,strDat4,strDat5,strDat6)
	bVerifyLoginPageUserAuthentication = False
	arrValidationData = Array(strDat1,strDat2,strDat3,strDat4,strDat5,strDat6)
	For i = 0 To UBound(arrValidationData) Step 1
		
		strUName = Split(arrValidationData(i),":")(0)
		strPass = Split(arrValidationData(i),":")(1)
		strMsg = Split(arrValidationData(i),":")(2)
		
		SetValue bcLoginIServe_Page.txtUserId(),strUName,"User Name: "
		SetValue bcLoginIServe_Page.txtPassword(),strPass,"Password: "
		ClickOnObject bcLoginIServe_Page.btnLogin(),"Login Button"
		WaitForICallLoading
		
		If strMsg = "Success" Then
			If bcIServeHome_Page.lblWelcome().Exist(3) Then
				LogMessage "RSLT","Verification","As Expected Successfully logged into IServe Application with valid username and password.",True
				bVerifyLoginPageUserAuthentication = True
			Else
				LogMessage "WARN","Verification","Failed to log into IServe Application with valid username and password.",True
			End If
		Else
			If verifyInnerText_Pattern(bcLoginIServe_Page.eleErrorLabel(), strMsg, "Invalid Username/Password Error message") Then
				bVerifyLoginPageUserAuthentication = True
			End If
		End If
	Next
End Function
