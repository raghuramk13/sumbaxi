'[Select the email template value from dropdown]
Public Function selectEmailTemp_Combobox(strEmailTemp)
	bDevPending=false
   bselectEmailTemp_Combobox =true
   If Not IsNull(strEmailTemp) Then
       If Not (selectItem_Combobox (bcStatements.lstStatementDate(), strEmailTemp))Then
            LogMessage "WARN","Verification","Failed to select :"&strEmailTemp&" From Select Email Template drop down list" ,false
           bselectEmailTemp_Combobox=false
       End If
   End If
   WaitForIcallLoading
   selectEmailTemp_Combobox=bselectEmailTemp_Combobox		
End Function

'[Validate the email template for email template functionality]
Public Function validateEmailTemp(strToEmailAddress)
	bvalidateEmailTemp = true
	
	If Not IsNull(strToEmailAddress) Then
	
			
		End If	
End Function
