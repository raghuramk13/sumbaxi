'[Verify IServe Login page is Displayed]
Public Function  VerifyLoginPageDisplayed()
	If coIServeLogin_Page.btnLogin.Exist(2) Then
		LogMessage "RSLT","Verification","IServe Login Page is displayed as expected..",True
		VerifyLoginPageDisplayed = True
	Else
		LogMessage "WARN","Verification","Failed : IServe Login Page is not displayed..",False
		VerifyLoginPageDisplayed = False 
	End If
End Function

'[User logged in as CSO]
Public Function GivenUserloggedinasCSO(strUserName,strPassword)	
	If strUserName = Environment.Value("strPreviousUser") Then
		strCurrentUser = Environment.Value("strPreviousUser")
	Else
		strCurrentUser = strUserName
		If Environment.Value("intLoginCounter") <> 0 Then
			LogoutIServe
		End If
	End If
	
	If coIServeLogin_Page.btnLogin.Exist(1) Then
		GivenUserloggedinasCSO = loginIServe("CSO", strCurrentUser, strPassword)
	Else
		Print Vbtab & Vbtab & "User : [" &strCurrentUser& "] is already logged into IServe Application"
	End If
	Environment.Value("strPreviousUser") = strCurrentUser
	Environment.Value("intLoginCounter") = Environment.Value("intLoginCounter") + 1
End Function


'[Login to application as different user]
Public Function LoginToAppAsDifferentUser(strUserType,strUserName,strPassword)
	LogoutIServe
	LoginToAppAsDifferentUser = LoginIServe(strUserType,strUserName,strPassword)
End Function



'###############################################################################################
'# Function Name: loginIServe
'# Description: Function to Login into IServe Indonesia application
'# Author: 
'# Date: 11-Sept-2017
'# Input Parameter(s): strUserType,strUserName,strPassword
'#		strUserType = CSO, TM etc
'#		strUserName = CCACSO2, CCACSO1 etc
'# 		strPassword = Respective user login password
'# Output Parameter(s): True or False
'###############################################################################################
Public Function LoginIServe(strUserType,strUserName,strPassword)

	Wait(2)
	
	gObjBrowserWindow.Maximize
	
	SetValue coIServeLogin_Page.txtUserID,strUserName,"User Name"
	
	SetValue coIServeLogin_Page.txtPassword,strPassword,"Password"

	If coIServeLogin_Page.btnLogin.GetROProperty("disabled") = 0 Then
		ClickOnObject coIServeLogin_Page.btnLogin,"Login Button"
	Else
		LogMessage "WARN","Verification","Login Button is disabled, Unable to perform Login action. ",False
		LoginIServe = False
	End If
	
	For i = 1 To 30 Step 1
		If coDashboard_Page.lblUserName.Exist(1) Then
			Exit For
		Else
			Wait(0.5)
		End If
	Next
	
	strApplicationUser = Trim(coDashboard_Page.lblUserName.GetROProperty("innertext"))
	
	If UCase(strApplicationUser) = UCase(strUserName) Then
		LogMessage "RSLT","Verification",strUserType & " user: " & strUserName & " logged in successfully into IServe Application.",True
		LoginIServe = True
	Else
		LogMessage "WARN","Verification",strUserType & " user: " & strUserName & " unable to login into IServe Application or Page is taking more time to login",False
		LoginIServe = False 
	End If
End Function

'###############################################################################################
'# Function Name: LogoutIServe
'# Description: Function to Logout from IServe Indonesia application
'# Author: 
'# Date: 11-Sept-2017
'# Input Parameter(s): NA
'# Output Parameter(s): True or False
'###############################################################################################
Public Function LogoutIServe()
	If coDashboard_Page.lblUserName.Exist(2) Then
		ClickOnObject coDashboard_Page.lblUserName,"User Name Label"
		Wait(2)
		ClickOnObject coDashboard_Page.btnLogout,"Logout Button"
		If coDashboard_Page.eleYes.Exist(2) Then
			ClickOnObject coDashboard_Page.eleYes,"Yes button in logout confirmation pop up"
			Wait(2)
			WaitForIServeLoading
		End If
	End If
	WaitForBrowserReady
	If coIServeLogin_Page.txtUserID.Exist(1) Then
		LogoutIServe = True
		LogMessage "RSLT","Verification","Successfully Logged out from IServe application",True
	Else
		LogoutIServe = False
		LogMessage "WARN","Verification","Unable to Log out from IServe application",False
	End If
End Function
