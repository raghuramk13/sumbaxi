'Keyword Generation
Class KW_verifyLogout
    Public Function runKey (strKeyArgument)
         Dim strLogoutScenario,strUrl, strExpectedError,strUserName,strPassword,strExpectedMessage

		 strLogoutScenario  = checkNull(strKeyArgument(0))
		 strUrl  = checkNull(strKeyArgument(1))
		 strExpectedError  = checkNull(strKeyArgument(2))
		 strUserName  = checkNull(strKeyArgument(3))
		 strPassword  = checkNull(strKeyArgument(4))
		 strExpectedMessage  = checkNull(strKeyArgument(5))

      
        Dim bverifyLogout
        bverifyLogout  = verifyLogout(strLogoutScenario,strUrl, strExpectedError,strUserName,strPassword,strExpectedMessage)

        If  bverifyLogout Then
            LogMessage "RSLT", "Verification", "Keyword verifyLogout executed successfully", True
            runKey =True
        else
			 LogMessage "WARN", "Verification", "Keyword VerifyLogout failed during execution", False
            runKey =False
        End If

    End Function


End Class

'					
