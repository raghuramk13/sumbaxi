'[Verify the row data for the recurring arrangement page]
Public Function verifyrowdata_RecurringArrangement(arrRowDataList)
	bverifyrowdata_RecurringArrangement = true
	verifyrowdata_RecurringArrangement = verifyTableContentList(bcRecurring_Arrangements.tblRecurringArrangementsHeader,bcRecurring_Arrangements.tblRecurringArrangementsContent,arrRowDataList,"Recurring Arrangment",false,null,null,null)
	verifyrowdata_RecurringArrangement = bverifyrowdata_RecurringArrangement
End Function

'[Verify the shortcut buttons on recurring arrangement page]
Public Function verifyshortcutbuttons_RecurringArrangement()
	bverifyshortcutbuttons_RecurringArrangement = true
	
	If LimitsandUsage.btnBlockCard.exist Then
		LogMessage "RSLT","Verification","Shortcut Button:Block Card exist" ,true
		else
		LogMessage "RSLT","Verification","Shortcut Button:Block Card does not Exists As Expected" ,False
		bverifyshortcutbuttons_RecurringArrangement = false
	End If
	
	If LimitsandUsage.btnCardReplacement.exist Then
		LogMessage "RSLT","Verification","Shortcut Button:Card Replacement exist" ,true
		else
		LogMessage "RSLT","Verification","Shortcut Button:Card Replacement does not Exists As Expected" ,False
		bverifyshortcutbuttons_RecurringArrangement = false
	End If
	
	If LimitsandUsage.btnMoreServices.exist Then
		LogMessage "RSLT","Verification","Shortcut Button:More Services exist" ,true
		else
		LogMessage "RSLT","Verification","Shortcut Button:More Services does not Exists As Expected" ,False
		bverifyshortcutbuttons_RecurringArrangement = false
	End If
	
	If bcRecurring_Arrangements.btnDeleteAccountLinkage.exist Then
		LogMessage "RSLT","Verification","Shortcut Button:Delete Account Linkage exist" ,true
		else
		LogMessage "RSLT","Verification","Shortcut Button:Delete Account Linkage does not Exists As Expected" ,False
		bverifyshortcutbuttons_RecurringArrangement = false
	End If
	
	If bcRecurring_Arrangements.btnEditAccountLinkage.exist Then
		LogMessage "RSLT","Verification","Shortcut Button:Edit Account Linkage exist" ,true
		else
		LogMessage "RSLT","Verification","Shortcut Button:Edit Account Linkage does not Exists As Expected" ,False
		bverifyshortcutbuttons_RecurringArrangement = false
	End If
	
End Function
