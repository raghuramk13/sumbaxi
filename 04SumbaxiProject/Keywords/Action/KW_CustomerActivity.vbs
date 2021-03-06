
'Keyword Generation
Class KW_CustomerActivity
    Public Function runKey (strKeyArgument)
		bAppStateLogout=True
	   Dim bCustomerActivity

	   Select Case gstrAction				  

					Case "VerifyActivity":
						 Dim cVerifyActivity
						Set cVerifyActivity = New KW_VerifyActivity
						 bCustomerActivity =	cVerifyActivity.runKey(strKeyArgument)

					Case "CreateActivity":
						 Dim cCreateActivity
						Set cCreateActivity = New KW_CreateActivity
						 bCustomerActivity =	cCreateActivity.runKey(strKeyArgument)

					Case "editActivity":
						 Dim cEditActivity
					   	 Set cEditActivity = New KW_EditActivity
						 bCustomerActivity =	cEditActivity.runKey(strKeyArgument)


				Case Else  LogMessage "RSLT", "Verification", "Action " +gstrAction + " is not valid for the Keyword CustomerOverview ", False

	   End Select

       If  bCustomerActivity Then
            LogMessage "RSLT", "Verification", "Keyword CustomerOverview  with Action " + gstrAction + " executed successfully", True
			runKey =True
        else
            LogMessage "RSLT", "Verification", "Keyword CustomerOverview  with Action " + gstrAction + " failed during execution", False
            runKey =False
        End If

    End Function


End Class


Class KW_VerifyActivity
   Public Function runKey(strKeyArgument)

        Dim strActivityType,strActivityScreen,strCSO,strFromDate,strToDate,strErrorMessage,lstlstActivity,lstActivity,bActivityVerify,strpopupName,strCIN,strName,strSegment,strRelatedTo,strAccountNumber,strType,strSubType,strProduct,strComments,strAssignedTo,strStatus,strResolution,strActivityID,strServiceRequestNo,strChannel,strCreatedDate,strCreatedBy,strOverdue,strDuration,strClosedDate,strLastUpdatedDate,strLastUpdatedBy,bCreateActivity

		strActivityType = checkNull(strKeyArgument(0))
		strActivityScreen = checkNull(strKeyArgument(1))		
		strCSO = checkNull(strKeyArgument(2))
		strFromDate = checkNull(strKeyArgument(3))
		strToDate = checkNull(strKeyArgument(4))
		strErrorMessage = checkNull(strKeyArgument(5))
		lstlstActivity = checkNull(strKeyArgument(6))
		lstActivity = checkNull(strKeyArgument(7))
		bActivityVerify = checkNull(strKeyArgument(8))
		strpopupName = checkNull(strKeyArgument(9))
		strCIN = checkNull(strKeyArgument(10))
		strName = checkNull(strKeyArgument(11))
		strSegment = checkNull(strKeyArgument(12))
		strRelatedTo = checkNull(strKeyArgument(13))
		strAccountNumber = checkNull(strKeyArgument(14))
		strType = checkNull(strKeyArgument(15))
		strSubType = checkNull(strKeyArgument(16))
		strProduct = checkNull(strKeyArgument(17))
		strComments = checkNull(strKeyArgument(18))
		strAssignedTo = checkNull(strKeyArgument(19))
		strStatus = checkNull(strKeyArgument(20))
		strResolution = checkNull(strKeyArgument(21))
		strActivityID = checkNull(strKeyArgument(22))
		strServiceRequestNo = checkNull(strKeyArgument(23))
		strChannel = checkNull(strKeyArgument(24))
		strCreatedDate = checkNull(strKeyArgument(25))
        strCreatedBy = checkNull(strKeyArgument(26))
		strOverdue = checkNull(strKeyArgument(27))
		strDuration = checkNull(strKeyArgument(28))
		strClosedDate = checkNull(strKeyArgument(29))
		strLastUpdatedDate = checkNull(strKeyArgument(30))
        strLastUpdatedBy = checkNull(strKeyArgument(31))
		bCreateActivity = checkNull(strKeyArgument(32))
		
        
        Dim bCustomerActivity
        bCustomerActivity  = Verify_Activity(strActivityType,strActivityScreen,strCSO,strFromDate,strToDate,strErrorMessage,lstlstActivity,lstActivity,bActivityVerify,strpopupName,strCIN,strName,strSegment,strRelatedTo,strAccountNumber,strType,strSubType,strProduct,strComments,strAssignedTo,strStatus,strResolution,strActivityID,strServiceRequestNo,strChannel,strCreatedDate,strCreatedBy,strOverdue,strDuration,strClosedDate,strLastUpdatedDate,strLastUpdatedBy,bCreateActivity)

		If  bCustomerActivity Then
            runKey =True
        else
            runKey =False
        End If		
   End Function
End Class

Class KW_CreateActivity
   Public Function runKey(strKeyArgument)

        Dim strActivityScreen,bverifyActivity,strpopupName,strName,strCIN,strSegment,bVerifyCombo,strRelatedTo,strAccount,strType,strSubType,strProduct,strExpectd_AssignTo,strAssignedTo_New,strStatus,strResolution,strDueDate,bOnceAndDone,strComment,strErrMessage
		strActivityScreen = checkNull(strKeyArgument(0))
		bverifyActivity = checkNull(strKeyArgument(1))
		strpopupName = checkNull(strKeyArgument(2))
		strName = checkNull(strKeyArgument(3))
		strCIN = checkNull(strKeyArgument(4))
		strSegment = checkNull(strKeyArgument(5))
		bVerifyCombo = checkNull(strKeyArgument(6))
		strRelatedTo = checkNull(strKeyArgument(7))
		strAccount = checkNull(strKeyArgument(8))
		strType = checkNull(strKeyArgument(9))
		strSubType = checkNull(strKeyArgument(10))
		strProduct = checkNull(strKeyArgument(11))
		strExpectd_AssignTo = checkNull(strKeyArgument(12))
		strAssignedTo_New = checkNull(strKeyArgument(13))
		strStatus = checkNull(strKeyArgument(14))
		strResolution = checkNull(strKeyArgument(15))
		strDueDate = checkNull(strKeyArgument(16))
		bOnceAndDone = checkNull(strKeyArgument(17))
		strComment = checkNull(strKeyArgument(18))
		strErrMessage = checkNull(strKeyArgument(19))		
        

        Dim bCustomerActivity
        bCustomerActivity  = Create_Activity(strActivityScreen,bverifyActivity,strpopupName,strName,strCIN,strSegment,bVerifyCombo,strRelatedTo,strAccount,strType,strSubType,strProduct,strExpectd_AssignTo,strAssignedTo_New,strStatus,strResolution,strDueDate,bOnceAndDone,strComment,strErrMessage)

		If  bCustomerActivity Then
            runKey =True
        else
            runKey =False
        End If		
   End Function
End Class

Class KW_EditActivity
   Public Function runKey(strKeyArgument)

        Dim strServiceRequestNo,strLoggedInUser,strAssignTo,strStatus, strResolution,bOnceandDone,strNewComment,strCreatedBy,strErrMessage

		strServiceRequestNo = checkNull(strKeyArgument(0))
		strLoggedInUser = checkNull(strKeyArgument(1))
		strAssignTo = checkNull(strKeyArgument(2))
		strStatus = checkNull(strKeyArgument(3))
		strResolution = checkNull(strKeyArgument(4))
		bOnceandDone = checkNull(strKeyArgument(5))
		strNewComment = checkNull(strKeyArgument(6))
		strCreatedBy = checkNull(strKeyArgument(7))
		strErrMessage = checkNull(strKeyArgument(8))
           

        Dim bCustomerActivity
        bCustomerActivity  = EditActivity(strServiceRequestNo,strLoggedInUser,strAssignTo,strStatus, strResolution,bOnceandDone,strNewComment,strCreatedBy,strErrMessage)

		If  bCustomerActivity Then
            runKey =True
        else
            runKey =False
        End If		
   End Function
End Class
