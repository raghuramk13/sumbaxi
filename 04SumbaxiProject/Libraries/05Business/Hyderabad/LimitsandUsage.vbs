'[Verify the row data for Limits and Usage table]
Public Function verifyrowdata_LimitsandUsage(arrRowDataList)
	bverifyrowdata_LimitsandUsage = true
	verifyrowdata_LimitsandUsage = verifyTableContentList(LimitsandUsage.tblLimitsUsageHeader,LimitsandUsage.tblLimitsUsageContent,arrRowDataList,"Limits and Usage",false,null,null,null)
	verifyrowdata_LimitsandUsage = bverifyrowdata_LimitsandUsage
End Function

'[Verify the shortcut buttons on the Limits and Usage page]
Public Function verifyshortcutbutton_LimitsandUsage()
	bverifyshortcutbutton_LimitsandUsage = true
	
	If LimitsandUsage.btnActivation.exist Then
		LogMessage "RSLT","Verification","Shortcut Button:Activation exist" ,true
		else
		LogMessage "RSLT","Verification","Shortcut Button:Activation does not Exists As Expected" ,False
		bverifyshortcutbutton_LimitsandUsage = false
	End If
	If LimitsandUsage.btnBlockCard.exist Then
		LogMessage "RSLT","Verification","Shortcut Button:Block Card exist" ,true
		else
		LogMessage "RSLT","Verification","Shortcut Button:Block Card does not Exists As Expected" ,False
		bverifyshortcutbutton_LimitsandUsage = false
	End If
	If LimitsandUsage.btnCardReplacement.exist Then
		LogMessage "RSLT","Verification","Shortcut Button:Card Replacement exist" ,true
		else
		LogMessage "RSLT","Verification","Shortcut Button:Card Replacement does not Exists As Expected" ,False
		bverifyshortcutbutton_LimitsandUsage = false
	End If
	
	If LimitsandUsage.btnChangeofSpendingLimit.exist Then
		LogMessage "RSLT","Verification","Shortcut Button:Amendment of Limits exist" ,true
		else
		LogMessage "RSLT","Verification","Shortcut Button:Amendment of Limits does not Exists As Expected" ,False
		bverifyshortcutbutton_LimitsandUsage = false
	End If
	
	If LimitsandUsage.btnMoreServices.exist Then
		LogMessage "RSLT","Verification","Shortcut Button:More Services exist" ,true
		else
		LogMessage "RSLT","Verification","Shortcut Button:More Services does not Exists As Expected" ,False
		bverifyshortcutbutton_LimitsandUsage = false
	End If
	
	If LimitsandUsage.btnNewPin.exist Then
		LogMessage "RSLT","Verification","Shortcut Button:New Pin exist" ,true
		else
		LogMessage "RSLT","Verification","Shortcut Button:New Pin does not Exists As Expected" ,False
		bverifyshortcutbutton_LimitsandUsage = false
	End If
	
	If LimitsandUsage.btnServiceActivation.exist Then
		LogMessage "RSLT","Verification","Shortcut Button:Service Activation exist" ,true
		else
		LogMessage "RSLT","Verification","Shortcut Button:Service Activation does not Exists As Expected" ,False
		bverifyshortcutbutton_LimitsandUsage = false
	End If
	verifyshortcutbutton_LimitsandUsage = bverifyshortcutbutton_LimitsandUsage
End Function
