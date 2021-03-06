'Keyword Generation
Class KW_CardList
    Public Function runKey (strKeyArgument)
		Dim bCardList
	bAppStateLogout=True 'Added for New Approach Recovery -Subhash 09-10-2013
	   Select Case gstrAction
		
		   Case "VerifyCardList":
				 Dim cVerifyCardList
				Set cVerifyCardList = New KW_VerifyCardList
				 bCardList =	cVerifyCardList.runKey(strKeyArgument)

		   Case "SelectCardNumber":
				 Dim cSelectCardNumber
				Set cSelectCardNumber = New KW_SelectCardNumber
				 bCardList =	cSelectCardNumber.runKey(strKeyArgument)

			Case Else  LogMessage "RSLT", "Verification", "Action " +gstrAction + " is not valid for the Keyword CardList ", False

	   End Select

       If  bCardList Then
            LogMessage "RSLT", "Verification", "Keyword CardList  with Action " + gstrAction + " executed successfully", True
			runKey =True
        else
            LogMessage "RSLT", "Verification", "Keyword CardList  with Action " + gstrAction + " failed during execution", False
            runKey =False
        End If

    End Function

End Class


Class KW_VerifyCardList
   Public Function runKey(strKeyArgument)

		Dim lstLstCardList   'strCardNumber, strProductCode, strProductDesc, strCardStatus, strCardType

        lstLstCardList  = checkNull(strKeyArgument(0))

        Dim bVerifyCardList
        bVerifyCardList  = VerifyCardList(lstLstCardList )

		If  bVerifyCardList Then
            runKey =True
        else
            runKey =False
        End If		
   End Function
End Class

'strCardListLinkStatus	lstLstCardList			


Class KW_SelectCardNumber
   Public Function runKey(strKeyArgument)

	    Dim strCardNumber, strProductCode
		strCardNumber  = checkNull(strKeyArgument(0))
		insertDataStore "Card_Number", strCardNumber

        Dim bSelectCardNumber
        bSelectCardNumber  = SelectCardNumber(strCardNumber )

		If  bSelectCardNumber Then
            runKey =True
        else
            runKey =False
        End If		
   End Function
End Class
