'[Login to GPSP]
Public Function GPSPLogin(strRegion,strUserId,strPassword)
   OpenPerComSession()
	Dim autECLSession 'As Object
	Set autECLSession = CreateObject("PCOMM.autECLSession")
	'Initialize the session
	strSession="A"
	autECLSession.SetConnectionByName (strSession)
	fWaitForAppAvailable(strSession)
	fWaitForInputReady(strSession)
	
	'Region
	fSetCursorPosition 20,027 'Region Location
	wait 1
	fSendKeys strRegion	
	fSendKeys "[enter]" 
	fWaitForAppAvailable (strSession)
	fWaitForInputReady (strSession) 
	wait 1
	fSendKeys "[clear]" 
	fWaitForInputReady (strSession) 
	wait 1
	'*End of Region
	
	'*GPSP Login
	fSendKeys "cesn" 
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	wait 1
	fSetCursorPosition 10,026 'UserId Location
	fSendKeys strUserId 'Enter UserID
	fSendKeys "[tab]"

	fSetCursorPosition 11,026 'Password Location
	fSendKeys strPassword 'Enter Password
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	'Confirm Sign On successfull
	strActualStatus = fGetText(strSession, "1", "011", "19")
	If instr(strActualStatus,"Sign-on is complete")=0 Then
		LogMessage "WARN","Verification","Login to GPSP failed",false
		GPSPLogin=false
	 else
	LogMessage "RSLT","Verification","Login to GPSP Successfull",True
		GPSPLogin=true
	End If

End Function
'*End of Login

'[Get Direct2Pay Information from GPEP Screen]
Public Function D2Pay_GPEP_GPSP(strCustCIN)
	Call GPSPLogin (gstrRegion_GPSP,gstrUser_GPSP,gstrPassword_GPSP)
    fSendKeys "[clear]" 
	fWaitForInputReady (strSession)	
	fSendKeys "GPEP"
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)	
	fSetCursorPosition 05,019    ' Position for Customer CIN Number 
	fSendKeys strCustCIN 'Enter CIN Number
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)	
	
	strExpDebitAccountNo = fGetText(strSession, "12", "022", "15")
	Environment.Value("strExpDebitAccountNo")=strExpDebitAccountNo
	
	strExpAccountType = fGetText(strSession, "13", "022", "03")
	Environment.Value("strExpAccountType")=strExpAccountType
	
	strExpIBstatus = fGetText(strSession, "14", "011", "01")
	Environment.Value("strExpIBstatus")=strExpIBstatus
	
	strExpReason = fGetText(strSession, "15", "011", "01")
	Environment.Value("strExpReason")=strExpReason
	
	strExpEComLimit = fGetText(strSession, "17", "034", "07")
	Environment.Value("strExpEComLimit") = strExpEComLimit
	
	strExpUsedLimit = fGetText(strSession, "18", "034", "07")
	Environment.Value("strExpUsedLimit") = strExpUsedLimit
	
	strExpRemLimit = fGetText(strSession, "18", "071", "07")
	Environment.Value("strExpRemLimit")=strExpRemLimit
	
	strExpRetryCount = fGetText(strSession, "20", "031", "02")
	Environment.Value("strExpRetryCount")=strExpRetryCount
	
End Function

