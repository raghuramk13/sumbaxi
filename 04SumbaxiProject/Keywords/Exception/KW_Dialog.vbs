Class clsDialogBox
	Public Function runKey(arrExcptArg)
		strExpType=arrExcptArg(0)
		strExpMessage =arrExcptArg(1)
		strExpAction =arrExcptArg(2)

		Dim strObservedMessage
		If   (Browser("HLAUPAY - Help").Page("Work Item: 17564995 -").WebElement("Record Not Found").Exist )Then

			strObservedMessage = Browser("HLAUPAY - Help").Page("Work Item: 17564995 -").WebElement("Record Not Found").GetROProperty("innertext")
			   Browser("HLAUPAY - Help").Page("Work Item: 17564995 -").WebElement("Ok").Click
	

			 If Not (Trim(strObservedMessage) =  Trim(strExpMessage)) Then
			   LogMessage "RSLT","Verification","Expected Dialog Message Text was "+ strExpMessage +" but Observed was "+ strObservedMessage ,False
			   runKey = False

			   Exit Function
			else
					LogMessage "RSLT","Verification","Expected Dialog Message Text "+ strExpMessage +" was shown correctly" ,True
					runKey = True
					Exit Function
		
			End If

		End If		
		
	End Function

End Class
