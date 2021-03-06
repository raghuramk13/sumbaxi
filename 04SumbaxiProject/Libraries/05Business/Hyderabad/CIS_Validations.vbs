'Account Balance
Dim strRunTimeAvailableBalance:strRunTimeAvailableBalance=""
Dim strRunTimeLedgerBalance:strRunTimeLedgerBalance=""
Dim strRunTimeEarmarkBalance:strRunTimeEarmarkBalance=""
Dim strRunTimeSignalsBalance:strRunTimeSignalsBalance=""

'Earmark Details
Dim strRunTimeOfficerID:strRunTimeOfficerID=""
Dim strRunTimeStatus:strRunTimeStatus=""
Dim strRunTimeCISDate:strRunTimeCISDate=""
Dim strRunTimeAmount:strRunTimeAmount=""
Dim strRunTimeBOT:strRunTimeBOT=""
Dim strRunTimeExpiryDate:strRunTimeExpiryDate=""
Dim strRunTimeReferenceNumber:strRunTimeReferenceNumber=""

'Singals Details
Dim strRunTimeDBSSignal:strRunTimeDBSSignal=""
Dim strRunTimePOSBSignal:strRunTimePOSBSignal=""
Dim strRunTimePOSBRC:strRunTimePOSBRC=""
Dim strRunTimeDespatchDate:strRunTimeDespatchDate=""
Dim strRunTimeFileOffDate:strRunTimeFileOffDate=""

'Hold Balance
Dim strRunTimeHalfDayAmount:strRunTimeHalfDayAmount=""
Dim strRunTimeOneDayAmount:strRunTimeOneDayAmount=""
Dim strRunTimeTwoDayAmount:strRunTimeTwoDayAmount=""
Dim strRunTimeLessTwoDayAmount:strRunTimeLessTwoDayAmount=""

'Account Information on Key Info
Dim strRunTimeAccountType:strRunTimeAccountType="" 
Dim strRunTimeAccountStatus:strRunTimeAccountStatus=""

'Return Cheque
Dim strRunTimeCurrentMonth:strRunTimeCurrentMonth=""
Dim strRunTimeLastMonth:strRunTimeLastMonth=""
Dim strRunTimeLastTwoMonth:strRunTimeLastTwoMonth=""

'Limit
Dim strRunTimeOverdraftLimit:strRunTimeOverdraftLimit=""
Dim strRunTimeAccruedOverdraft:strRunTimeAccruedOverdraft=""

'Account Holder
Dim strRunTimeAccountHolderName:strRunTimeAccountHolderName=""
Dim strRunTimeCIN:strRunTimeCIN=""
Dim strRunTimeShortName:strRunTimeShortName=""
Dim strRunTimeOpeningDate:strRunTimeOpeningDate=""
Dim strRunTimeClosingDate:strRunTimeClosingDate=""
Dim strRunTimeAddressType:strRunTimeAddressType=""
Dim strRunTimeBlock:strRunTimeBlock=""
Dim strRunTimeLevel:strRunTimeLevel=""
Dim strRunTimeUnit:strRunTimeUnit=""
Dim strRunTimeAddressLine1:strRunTimeAddressLine1=""
Dim strRunTimeAddressLine2:strRunTimeAddressLine2=""
Dim strRunTimeAddressLine3:strRunTimeAddressLine3=""
Dim strRunTimeAddressLine4:strRunTimeAddressLine4=""
Dim strRunTimePostalCode:strRunTimePostalCode=""
Dim strRunTimeLastUpdatedInfo:strRunTimeLastUpdatedInfo=""

'Product And Services
Dim strRunTimeAddressCIN:strRunTimeAddressCIN=""

'Linked SA
Dim strRunTimeLinkedSA:strRunTimeLinkedSA=""

'EStatement
Dim strRunTimeEmail:strRunTimeEmail=""
Dim strRunTimeEnrolmentChannel:strRunTimeEnrolmentChannel=""
Dim strRunTimeEnrolledBy:strRunTimeEnrolledBy=""
Dim strRunTimeEnrolledDateTime:strRunTimeEnrolledDateTime=""
Dim strRunTimeTerminatedBy:strRunTimeTerminatedBy=""
Dim strRunTimeTerminatedDateTime:strRunTimeTerminatedDateTime=""
Dim strTerminationReason:strTerminationReason=""

'Cheque Info
Dim strRunTimeTapeNo:strRunTimeTapeNo=""
Dim strRunTimeChequeRange:strRunTimeChequeRange=""
Dim strRunTimeActivationDate:strRunTimeActivationDate=""
Dim strRunTimeChequeUsage:strRunTimeChequeUsage=""
Dim strRunTimeIssueDate:strRunTimeIssueDate=""
Dim strRunTimePaidCheque:strRunTimePaidCheque=""
Dim strRunTimeTotalCheque:strRunTimeTotalCheque=""

'[Login to CIS]
Public Function CISLogin(strRegion,strUserId,strPassword)
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
	'fSendKeys "E020"
	'fSendKeys "C004"
	fSendKeys strRegion	
	fSendKeys "[enter]" 
	fWaitForAppAvailable (strSession)
	fWaitForInputReady (strSession) 
	wait 1
	fSendKeys "[clear]" 
	fWaitForInputReady (strSession) 
	wait 1
	'*End of Region
	
	'*CIS Login
	fSendKeys "cesn" 
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	wait 1
	fSetCursorPosition 10,026 'UserId Location
	fSendKeys strUserId 'Enter UserID
	'fSendKeys "[tab]"
	'fSendKeys "[tab]"
	'**** the below line added to adjust the username as ft04
	fSetCursorPosition 11,026 'Password Location
	fSendKeys strPassword 'Enter Password
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	'Confirm Sign On successfull
	strActualStatus = fGetText(strSession, "1", "011", "19")
	If instr(strActualStatus,"Sign-on is complete")=0 Then
		LogMessage "WARN","Verification","Login to CIS failed",false
		CISLogin=false
	 else
	LogMessage "RSLT","Verification","Login to CIS Successfull",True
		CISLogin=true
	End If

End Function
'*End of Login

'[Get Available Balance from ANQ1 Screen]
Public Function AvailableBalance_ANQ1(strCardNumber)
	CISLogin gstrRegion_CIS,gstrUser_CIS,gstrPassword_CIS
	strCardNumber=Replace(strCardNumber,"-","")
    fSendKeys "[clear]" 
	fWaitForInputReady (strSession)	
	fSendKeys "ANQ1"
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)	
	fSetCursorPosition 04,13    ' Position for card number
	fSendKeys strCardNumber 'Enter Account Number
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)	
	strRunTimeAvailableBalance = fGetText(strSession, "15", "020", "16")
	strRunTimeLedgerBalance = fGetText(strSession, "13", "020", "16")
	strRunTimeEarmarkBalance = fGetText(strSession, "09", "016", "16")
	strRunTimeHalfDayAmount = fGetText(strSession, "18", "010", "08")
	strRunTimeOneDayAmount = fGetText(strSession, "18", "024", "12")
	strRunTimeTwoDayAmount = fGetText(strSession, "18", "040", "14")
	strRunTimeLessTwoDayAmount = fGetText(strSession, "18", "064", "08")
	strRunTimeCurrentMonth = fGetText(strSession, "19", "021", "03")
	strRunTimeLastMonth = fGetText(strSession, "19", "046", "03")
	strRunTimeLastTwoMonth = fGetText(strSession, "19", "071", "03") 'Wrong position. have to change.
	strRunTimeOverdraftLimit = fGetText(strSession, "11", "022", "10")
	strRunTimeAccruedOverdraft = fGetText(strSession, "10", "065", "10")	
End Function

'[Login to FTSP]
Public Function FTSPLogin(strRegion,strUserId,strPassword)
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
    'fSendKeys "E020"
    'fSendKeys "C004"
    fSendKeys strRegion    
    fSendKeys "[enter]" 
    fWaitForAppAvailable (strSession)
    fWaitForInputReady (strSession) 
    wait 1
    fSendKeys "[clear]" 
    fWaitForInputReady (strSession) 
    wait 1
    '*End of Region
    
    '*CIS Login
    fSendKeys "cesn" 
    fSendKeys "[enter]"
    fWaitForInputReady (strSession)
    wait 1
    fSetCursorPosition 10,026 'UserId Location
    fSendKeys strUserId 'Enter UserID
    'fSendKeys "[tab]"
    'fSendKeys "[tab]"
    '**** the below line added to adjust the username as ft04
    fSetCursorPosition 11,026 'Password Location
    fSendKeys strPassword 'Enter Password
    fSendKeys "[enter]"
    fWaitForInputReady (strSession)    
    'Confirm Sign On successfull
    strActualStatus = fGetText(strSession, "1", "011", "19")
    If instr(strActualStatus,"Sign-on is complete")=0 Then
        LogMessage "WARN","Verification","Login to FTSP failed",false
        FTSPLogin=false
     else
    LogMessage "RSLT","Verification","Login to FTSP Successfull",True
        FTSPLogin=true
    End If
End Function

'[Get Half Day Amount from ANQ1 Screen]
Public Function HalfDayAmount_ANQ1(strCardNumber)
	'CISLogin gstrRegion_CIS,gstrUser_CIS,gstrPassword_CIS
	strCardNumber=Replace(strCardNumber,"-","")
    fSendKeys "[clear]" 
	fWaitForInputReady (strSession)	
	fSendKeys "ANQ1"
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)	
	fSetCursorPosition 04,13    ' Position for card number
	fSendKeys strCardNumber 'Enter Account Number
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)	
	strRunTimeHalfDayAmount = fGetText(strSession, "18", "010", "08")
	strRunTimeOneDayAmount = fGetText(strSession, "18", "028", "08")
	strRunTimeTwoDayAmount = fGetText(strSession, "18", "046", "08")
	strRunTimeLessTwoDayAmount = fGetText(strSession, "18", "064", "08")
	'AvailableBalance_ANQ1=true
End Function

'[Get Current Month from ANQ1 Screen]
Public Function CurrentMonth_ANQ1(strCardNumber)
	'CISLogin gstrRegion_CIS,gstrUser_CIS,gstrPassword_CIS
	strCardNumber=Replace(strCardNumber,"-","")
    fSendKeys "[clear]" 
	fWaitForInputReady (strSession)	
	fSendKeys "ANQ1"
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)	
	fSetCursorPosition 04,13    ' Position for card number
	fSendKeys strCardNumber 'Enter Account Number
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)	
	strRunTimeCurrentMonth = fGetText(strSession, "19", "021", "03")
	strRunTimeLastMonth = fGetText(strSession, "19", "046", "03")
	strRunTimeLastTwoMonth = fGetText(strSession, "19", "046", "03") 'Wrong position. have to change.
	'AvailableBalance_ANQ1=true
End Function

'[Get Overdraft Limit from ANQ1 Screen]
Public Function Overdraft_ANQ1(strCardNumber)
	'CISLogin gstrRegion_CIS,gstrUser_CIS,gstrPassword_CIS
	strCardNumber=Replace(strCardNumber,"-","")
    fSendKeys "[clear]" 
	fWaitForInputReady (strSession)	
	fSendKeys "ANQ1"
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)	
	fSetCursorPosition 04,13    ' Position for card number
	fSendKeys strCardNumber 'Enter Account Number
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)	
	strRunTimeOverdraftLimit = fGetText(strSession, "11", "022", "10")
	strRunTimeAccruedOverdraft = fGetText(strSession, "10", "065", "10")	
End Function

'[Get Available Balance for CA from DCBX]
Public Function getAvailableBal_CA(strCardNumber)
	CISLogin gstrRegion_DCBX,gstrUser_DCBX,gstrPassword_DCBX
	strFormatCardNumber=Replace(strCardNumber,"-","")
	fSendKeys "[clear]" 
	fWaitForInputReady (strSession)
	Wait 1
	fSendKeys "DCBX"
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	Wait 1
	strBranchCode=fGetText(strSession, "09", "023", "4")
	If strBranchCode="    "  Then
		fSetCursorPosition 09,023
		fSendKeys "0352"
		fSendKeys "[pf7]"
		fSendKeys "[pf7]"
		fWaitForInputReady (strSession)		
	ElseIf strBranchCode=0352 Then
		fSendKeys "[pf7]"
		fWaitForInputReady (strSession)
	Else
		fSetCursorPosition 09,023
		fSendKeys "0352"
		fSendKeys "[pf7]"
		fSendKeys "[pf7]"
		fWaitForInputReady (strSession)
	End If	
	fWaitForInputReady (strSession)
	fSetCursorPosition 18,044	'To Select option from main menu
	fSendKeys "1"
	fSendKeys "[pf7]"
	fWaitForInputReady (strSession)
	fSetCursorPosition 20,031
	fSendKeys "13"
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	fSetCursorPosition 04,022
	lenCardNumber=len(strFormatCardNumber)
	If lenCardNumber="10" Then
		fSendKeys strFormatCardNumber
	Else
		strFormatCardNumber=Replace(strCardNumber,"-"," ",1,1)
		strFormatCardNumber=Replace(strFormatCardNumber,"-","")
		fSendKeys strFormatCardNumber
		fSetCursorPosition 05,022
		fSendKeys "P"
	End If
	'fSendKeys strCardNumber
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	strRunTimeAvailableBalance = fGetText(strSession, "09", "024", "16")
	strRunTimeLedgerBalance = fGetText(strSession, "08", "024", "16")
	strRunTimeEarmarkBalance = fGetText(strSession, "15", "030", "10")
	strRunTimeSignalsBalance = fGetText(strSession, "19", "030", "10")
	strRunTimeHalfDayAmount = fGetText(strSession, "12", "030", "10")
	strRunTimeOneDayAmount = fGetText(strSession, "13", "030", "10")
	strRunTimeTwoDayAmount = fGetText(strSession, "14", "030", "10")
	strRunTimeOverdraftLimit = fGetText(strSession, "16", "030", "10")
	strRunTimeAccruedOverdraft = fGetText(strSession, "15", "0067", "10")	
End Function

'[Get Ledger Balance for SA from DFFM]
Public Function getLedgerBalance_SA(strCardNumber)
	bgetLedgerBalance_SA=true
	CISLogin gstrRegion_DCBX,gstrUser_DCBX,gstrPassword_DCBX
	strFormatCardNumber=Replace(strCardNumber,"-","")
	fSendKeys "[clear]" 
	fWaitForInputReady (strSession)
	Wait 1
	fSendKeys "DFFM"
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	Wait 1
	fSetCursorPosition 21,020 'For Selection of Unposted Transaction
	fSendKeys "31"
	fSendKeys "[enter]"	
	fWaitForInputReady (strSession)
	strUnpostEnquiryScreen=fGetText(strSession, "02", "023", "22")	
	If InStr(strUnpostEnquiryScreen,"ENQUIRY OF UNPOST ITEM")<>0 Then
		LogMessage "INFO","Verification","ENQUIRY OF UNPOST ITEM screen open successfully.",True
		bgetLedgerBalance_SA=true		
	End If
	fSetCursorPosition 04,017		
	lenCardNumber=len(strFormatCardNumber)
	If lenCardNumber="10" Then
		fSendKeys "D"
		fSetCursorPosition 05,017
		fSendKeys strFormatCardNumber
	Else
		'strFormatCardNumber=Replace(strCardNumber,"-"," ",1,1)
		'strFormatCardNumber=Replace(strFormatCardNumber,"-","")
		fSendKeys "P"
		fSetCursorPosition 05,017
		fSendKeys strFormatCardNumber		
	End If
	'fSendKeys strCardNumber
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	fSendKeys "[pf7]"
	
	strRunTimeLedgerBalance = fGetText(strSession, "04", "060", "16")
	
	getLedgerBalance_SA=bgetLedgerBalance_SA
End Function

'[Get Earmark Details from SAX2]
Public Function getEarmarkDetails_SA(strCardNumber)
	bgetEarmarkDetails_SA=true
	CISLogin gstrRegion_DCBX,gstrUser_DCBX,gstrPassword_DCBX
	strFormatCardNumber=Replace(strCardNumber,"-","")
	fSendKeys "[clear]" 
	fWaitForInputReady (strSession)
	Wait 1
	fSendKeys "SAX2"
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	Wait 1
	strBranchCode=fGetText(strSession, "09", "023", "4")
	If strBranchCode="    "  Then
		fSetCursorPosition 09,023
		fSendKeys "0352"
		fSendKeys "[pf7]"
		fSendKeys "[pf7]"
		fWaitForInputReady (strSession)		
	ElseIf strBranchCode=0352 Then
		fSendKeys "[pf7]"
		fWaitForInputReady (strSession)
	Else
		fSetCursorPosition 09,023
		fSendKeys "0352"
		fSendKeys "[pf7]"
		fSendKeys "[pf7]"
		fWaitForInputReady (strSession)
	End If
	fWaitForInputReady (strSession)
	Wait 1
	fSetCursorPosition 14,032 'For Selection from Earmark Menu
	fSendKeys "2"
	fSendKeys "[enter]"	
	fWaitForInputReady (strSession)
	strEarmarkEnquiryScreen=fGetText(strSession, "02", "023", "26")	
	If InStr(strEarmarkEnquiryScreen,"ENQUIRY OF EARMARK HISTORY")<>0 Then
		LogMessage "INFO","Verification","ENQUIRY OF EARMARK HISTORY screen open successfully.",True
		bgetEarmarkDetails_SA=true		
	End If
	fSetCursorPosition 04,017		
	lenCardNumber=len(strFormatCardNumber)
	If lenCardNumber="10" Then
		fSendKeys "D"
		fSetCursorPosition 05,017
		fSendKeys strFormatCardNumber
	Else
		'strFormatCardNumber=Replace(strCardNumber,"-"," ",1,1)
		'strFormatCardNumber=Replace(strFormatCardNumber,"-","")
		fSendKeys "P"
		fSetCursorPosition 05,017
		fSendKeys strFormatCardNumber		
	End If
	'fSendKeys "[enter]"	
	fSendKeys "[pf7]"
	fWaitForInputReady (strSession)
	strRunTimeOfficerID = trim(fGetText(strSession, "11", "001", "9"))
	strRunTimeStatus = trim(fGetText(strSession, "11", "011", "3"))
	strRunTimeCISDate = trim(fGetText(strSession, "11", "015", "10"))
	strRunTimeAmount = trim(fGetText(strSession, "11", "026", "15"))
	strRunTimeBOT = trim(fGetText(strSession, "11", "042", "4"))
	strRunTimeExpiryDate = trim(fGetText(strSession, "11", "047", "10"))
	strRunTimeReferenceNumber = trim(fGetText(strSession, "11", "058", "11"))	
	getEarmarkDetails_SA=bgetEarmarkDetails_SA
End Function

'[Get Signal Details from DFFM]
Public Function getSignalDetails_SA(strCardNumber)
	bgetSignalDetails_SA=true
	CISLogin gstrRegion_DCBX,gstrUser_DCBX,gstrPassword_DCBX
	strFormatCardNumber=Replace(strCardNumber,"-","")
	fSendKeys "[clear]" 
	fWaitForInputReady (strSession)
	Wait 1
	fSendKeys "DFFM"
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	Wait 1
	fSetCursorPosition 21,020 'For Selection of Unposted Transaction
	fSendKeys "33"
	fSendKeys "[enter]"	
	fWaitForInputReady (strSession)
	strUnpostEnquiryScreen=fGetText(strSession, "02", "023", "22")	
	If InStr(strUnpostEnquiryScreen,"ENQUIRY OF SIGNAL HISTORY")<>0 Then
		LogMessage "INFO","Verification","ENQUIRY OF SIGNAL HISTORY screen open successfully.",True
		bgetSignalDetails_SA=true		
	End If
	fSetCursorPosition 04,017		
	lenCardNumber=len(strFormatCardNumber)
	If lenCardNumber="10" Then
		fSendKeys "D"
		fSetCursorPosition 05,017
		fSendKeys strFormatCardNumber
	Else
		'strFormatCardNumber=Replace(strCardNumber,"-"," ",1,1)
		'strFormatCardNumber=Replace(strFormatCardNumber,"-","")
		fSendKeys "P"
		fSetCursorPosition 05,017
		fSendKeys strFormatCardNumber		
	End If
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)	
	fSendKeys "[pf7]"
	fWaitForInputReady (strSession)
	strRunTimeOfficerID = trim(fGetText(strSession, "12", "001", "9"))
	strRunTimeStatus = trim(fGetText(strSession, "12", "011", "5"))
	strRunTimeCISDate = trim(fGetText(strSession, "12", "017", "8"))
	strRunTimeDBSSignal = trim(fGetText(strSession, "12", "026", "3"))
	strRunTimePOSBSignal = trim(fGetText(strSession, "12", "030", "4"))
	strRunTimePOSBRC = trim(fGetText(strSession, "12", "035", "4"))
	strRunTimeDespatchDate = trim(fGetText(strSession, "12", "056", "8"))
	strRunTimeFileOffDate = trim(fGetText(strSession, "12", "066", "8"))
	getSignalDetails_SA=bgetSignalDetails_SA
End Function

'[Get Half Day Balance for CA from DCBX]
Public Function getHalfDayAmount_CA(strCardNumber)
	'CISLogin gstrRegion_DCBX,gstrUser_DCBX,gstrPassword_DCBX
	strCardNumber=Replace(strCardNumber,"-"," ")
	fSendKeys "[clear]" 
	fWaitForInputReady (strSession)
	fSendKeys "DCBX"
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	fSendKeys "[pf7]"
	fWaitForInputReady (strSession)
	fSetCursorPosition 18,044	'To Select option from main menu
	fSendKeys "1"
	fSendKeys "[pf7]"
	fWaitForInputReady (strSession)
	fSetCursorPosition 20,031
	fSendKeys "13"
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	fSetCursorPosition 04,022
	fSendKeys strCardNumber
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	strRunTimeHalfDayAmount = fGetText(strSession, "12", "030", "10")
	strRunTimeOneDayAmount = fGetText(strSession, "13", "030", "10")
	strRunTimeTwoDayAmount = fGetText(strSession, "14", "030", "10")
End Function

'[Get Overdraft Limit for CA from DCBX]
Public Function getOverdraftLimit_CA(strCardNumber)
	CISLogin gstrRegion_DCBX,gstrUser_DCBX,gstrPassword_DCBX
	strCardNumber=Replace(strCardNumber,"-"," ")
	fSendKeys "[clear]" 
	fWaitForInputReady (strSession)
	fSendKeys "DCBX"
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	fSendKeys "[pf7]"
	fWaitForInputReady (strSession)
	fSetCursorPosition 18,044	'To Select option from main menu
	fSendKeys "1"
	fSendKeys "[pf7]"
	fWaitForInputReady (strSession)
	fSetCursorPosition 20,031
	fSendKeys "13"
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	fSetCursorPosition 04,022
	fSendKeys strCardNumber
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	strRunTimeOverdraftLimit = fGetText(strSession, "16", "030", "10")
	strRunTimeAccruedOverdraft = fGetText(strSession, "15", "0067", "10")	
End Function

'[Get Account Information for Product Address from DFDO]
Public Function getAccountInfo_CA(strProductCode,strCardNumber)
	CISLogin gstrRegion_DCBX,gstrUser_DCBX,gstrPassword_DCBX
	strCardNumber=Replace(strCardNumber,"-","")
	fSendKeys "[clear]" 
	fWaitForInputReady (strSession)
	Wait 1
	fSendKeys "DFDO"
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	Wait 1
	strBranchCode=fGetText(strSession, "09", "023", "4")
	If strBranchCode="    "  Then
		fSetCursorPosition 09,023
		fSendKeys "0352"
		fSendKeys "[pf7]"
		fSendKeys "[pf7]"
		fWaitForInputReady (strSession)		
	ElseIf strBranchCode=0352 Then
		fSendKeys "[pf7]"
		fWaitForInputReady (strSession)
	Else
		fSetCursorPosition 09,023
		fSendKeys "0352"
		fSendKeys "[pf7]"
		fSendKeys "[pf7]"	
	End If	
	fWaitForInputReady (strSession)
	fSetCursorPosition 18,049	'To Select option from enquiry menu
	fSendKeys "E"
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	Wait 1
	fSetCursorPosition 04,024	
	fSendKeys strProductCode
	fSetCursorPosition 05,024
	fSendKeys strCardNumber	
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	Wait 1
	strRunTimeAccountHolderName=fGetText(strSession, "06", "051", "28")
	strRunTimeCIN=fGetText(strSession, "06", "027", "10")
	strRunTimeShortName=fGetText(strSession, "13", "017", "26")
	strRunTimeOpeningDate=fGetText(strSession, "13", "068", "10")
	strRunTimeClosingDate=fGetText(strSession, "14", "068", "10")
	strRunTimeAddressType=fGetText(strSession, "18", "009", "03")
	strRunTimeBlock=fGetText(strSession, "16", "023", "03")
	strRunTimeLevel=fGetText(strSession, "16", "035", "03")
	strRunTimeUnit=fGetText(strSession, "16", "044", "05")
	strRunTimeAddressLine1=fGetText(strSession, "17", "017", "50")
	strRunTimeAddressLine2=fGetText(strSession, "18", "017", "50")
	strRunTimeAddressLine3=fGetText(strSession, "19", "017", "50")
	strRunTimeAddressLine4=fGetText(strSession, "20", "017", "30")
	strRunTimePostalCode=fGetText(strSession, "20", "072", "08")
	strRunTimeLastUpdatedInfo=fGetText(strSession, "21", "002", "100")
End Function

'[Get Account Information for Product and Services from DFDO]
Public Function getProductInfo_CA(strCIN)
	CISLogin gstrRegion_DCBX,gstrUser_DCBX,gstrPassword_DCBX
	'strCardNumber=Replace(strCardNumber,"-","")
	fSendKeys "[clear]" 
	fWaitForInputReady (strSession)
	Wait 1
	fSendKeys "DFDO"
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	Wait 1
	strBranchCode=fGetText(strSession, "09", "023", "4")
	If strBranchCode="    "  Then
		fSetCursorPosition 09,023
		fSendKeys "0352"
		fSendKeys "[pf7]"
		fSendKeys "[pf7]"
		fWaitForInputReady (strSession)		
	ElseIf strBranchCode=0352 Then
		fSendKeys "[pf7]"
		fWaitForInputReady (strSession)
	Else
		fSetCursorPosition 09,023
		fSendKeys "0352"
		fSendKeys "[pf7]"
		fSendKeys "[pf7]"	
	End If	
	fWaitForInputReady (strSession)
	fSetCursorPosition 18,049	'To Select option from enquiry menu
	fSendKeys "D"
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	Wait 1	
	fSetCursorPosition 05,019
	fSendKeys strCIN	
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	Wait 1	
	strRunTimeAddressCIN=fGetText(strSession, "11", "030", "10")	
End Function

'[Get Account Type from SA02 for SA]
Public Function getAccountType_SA(strCardNumber)
	bgetAccountType_SA=true
	CISLogin gstrRegion_DCBX,gstrUser_DCBX,gstrPassword_DCBX
	strFormatCardNumber=Replace(strCardNumber,"-","")
	fSendKeys "[clear]" 
	fWaitForInputReady (strSession)
	Wait 1
	fSendKeys "SA02"
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	fSetCursorPosition 18,032
	fSendKeys "6"
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	fSetCursorPosition 04,017		
	lenCardNumber=len(strFormatCardNumber)
	If lenCardNumber="10" Then
		fSendKeys "D"
		fSetCursorPosition 05,017
		fSendKeys strFormatCardNumber
	Else
		fSendKeys "P"
		fSetCursorPosition 05,017
		fSendKeys strFormatCardNumber		
	End If
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)	
	fSendKeys "[pf7]"
	fWaitForInputReady (strSession)	
	strRunTimeAccountType = trim(fGetText(strSession, "06", "060", "2"))
	strRunTimeAccountStatus = trim(fGetText(strSession, "09", "017", "2"))
End Function

'[Get Linked SA for POSB CA from DFFM]
Public Function getLinkedAccountInfo_CA(strCardNumber)
	'CISLogin gstrRegion_DCBX,gstrUser_DCBX,gstrPassword_DCBX
	strCardNumber=Replace(strCardNumber,"-","")
	fSendKeys "[clear]" 
	fWaitForInputReady (strSession)
	Wait 1
	fSendKeys "DFFM"
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	Wait 1
	fSetCursorPosition 21,020
	fSendKeys "21"
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	Wait 1
	strBranchCode=fGetText(strSession, "09", "023", "4")
	If strBranchCode="    "  Then
		fSetCursorPosition 09,023
		fSendKeys "0352"
		fSendKeys "[pf7]"
		fSendKeys "[pf7]"
		fWaitForInputReady (strSession)		
	ElseIf strBranchCode=0352 Then
		fSendKeys "[pf7]"
		fWaitForInputReady (strSession)
	Else
		fSetCursorPosition 09,023
		fSendKeys "0352"
		fSendKeys "[pf7]"
		fSendKeys "[pf7]"	
	End If	
	fWaitForInputReady (strSession)
	fSetCursorPosition 18,049	'To Select option from enquiry menu
	fSendKeys "5"
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	Wait 1	
	fSetCursorPosition 11,045
	fSendKeys strCardNumber	
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	Wait 1	
	strRunTimeLinkedSA=fGetText(strSession, "07", "022", "15")	
End Function

'[Get Signals Details for SA from DFFM]
Public Function getSignalsDetails_SA(strCardNumber)
	CISLogin gstrRegion_DCBX,gstrUser_DCBX,gstrPassword_DCBX	
	strFormatCardNumber=Replace(strCardNumber,"-","")
	fSendKeys "[clear]" 
	fWaitForInputReady (strSession)
	Wait 1
	fSendKeys "DFFM"
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	Wait 1
	fSetCursorPosition 21,020
	fSendKeys "32"
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	Wait 1
	lenCardNumber=len(strFormatCardNumber)
	If lenCardNumber="10" Then
		fSetCursorPosition 04,017
		fSendKeys "D"
		fSetCursorPosition 05,017
		fSendKeys strFormatCardNumber
	Else
		fSetCursorPosition 04,017
		fSendKeys "P"
		fSetCursorPosition 05,017
		fSendKeys strFormatCardNumber
	End If
	'fSendKeys strCardNumber
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	Wait 1
	strRunTimeAvailableBalance = fGetText(strSession, "09", "024", "16")
End Function

'[Get eStatement details from DFF2]
Public Function getEstatementDetails(strCIN)
	bgetEstatementDetails=true
	CISLogin gstrRegion_DCBX,gstrUser_DCBX,gstrPassword_DCBX
	fSendKeys "[clear]" 
	fWaitForInputReady (strSession)
	Wait 1
	fSendKeys "DFF2"
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	Wait 1
	strBranchCode=fGetText(strSession, "09", "023", "4")
	If strBranchCode="    "  Then
		fSetCursorPosition 09,023
		fSendKeys "0352"
		fSendKeys "[pf7]"
		fSendKeys "[pf7]"
		fWaitForInputReady (strSession)		
	ElseIf strBranchCode=0352 Then
		fSendKeys "[pf7]"
		fWaitForInputReady (strSession)
	Else
		fSetCursorPosition 09,023
		fSendKeys "0352"
		fSendKeys "[pf7]"
		fSendKeys "[pf7]"	
	End If
	fWaitForInputReady (strSession)
	Wait 1
	fSetCursorPosition 06,023
	fSendKeys strCIN
	fSetCursorPosition 16,031
	fSendKeys "A"
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	Wait 1
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	strRunTimeEmail=fGetText(strSession, "09", "021", "50")
	strRunTimeEnrolmentChannel=fGetText(strSession, "12", "050", "08")
	strRunTimeEnrolledBy=fGetText(strSession, "15", "013", "08")
	strEnrolledDate=fGetText(strSession, "15", "024", "10")
	strEnrolledTime=fGetText(strSession, "15", "037", "08")
	'strRunTimeEnrolledDateTime=strEnrolledDate& strEnrolledTime
	strRunTimeEnrolledDateTime=fGetText(strSession, "15", "024", "21")
	strRunTimeTerminatedBy=fGetText(strSession, "18", "013", "08")
	strTerminatedDate=fGetText(strSession, "18", "024", "10")
	strTerminatedTime=fGetText(strSession, "18", "037", "08")
	'strRunTimeTerminatedDateTime=strTerminatedDate& strTerminatedTime
	strRunTimeTerminatedDateTime=fGetText(strSession, "18", "024", "21")
	strTerminationReason=fGetText(strSession, "19", "021", "60")
End Function

'[Get Cheque Info Detail from DACB]
Public Function getChequeInfoDetails_DACB(strCardNumber)
	bgetChequeInfoDetails_DACB=true
	CISLogin gstrRegion_DCBX,gstrUser_DCBX,gstrPassword_DCBX
	strFormatCardNumber=Replace(strCardNumber,"-","")
	fSendKeys "[clear]" 
	fWaitForInputReady (strSession)
	Wait 1
	fSendKeys "DACB"
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	Wait 1
	strBranchCode=fGetText(strSession, "09", "023", "4")
	If strBranchCode="    "  Then
		fSetCursorPosition 09,023
		fSendKeys "0352"
		fSendKeys "[pf7]"
		fSendKeys "[pf7]"
		fWaitForInputReady (strSession)		
	ElseIf strBranchCode=0352 Then
		fSendKeys "[pf7]"
		fWaitForInputReady (strSession)
	Else
		fSetCursorPosition 09,023
		fSendKeys "0352"
		fSendKeys "[pf7]"
		fSendKeys "[pf7]"	
	End If
	fWaitForInputReady (strSession)
	fSetCursorPosition 22,052
	fSendKeys "5"
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	fSetCursorPosition 18,047
	fSendKeys "1"
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	fSetCursorPosition 18,046
	fSendKeys "1"
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	fSetCursorPosition 08,042
	fSendKeys strFormatCardNumber
	fSetCursorPosition 10,042
	fSendKeys "D"
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	Wait 1
	strRunTimeTapeNo=fGetText(strSession, "09", "002", "11")
	strRunTimeChequeRange=fGetText(strSession, "09", "016", "13")
	strRunTimeActivationDate=fGetText(strSession, "09", "036", "08")
	strRunTimeChequeUsage=fGetText(strSession, "09", "057", "02")
End Function

'[Get Cheque Details from DCNS]
Public Function getChequeDetails_DCNS(strCardNumber,strChequeNo)
	bgetChequeDetails_DCNS=true
	CISLogin gstrRegion_DCBX,gstrUser_DCBX,gstrPassword_DCBX
	strFormatCardNumber=Replace(strCardNumber,"-","")
	strCardNumber=Replace(strCardNumber,"-"," ")
	fSendKeys "[clear]" 
	fWaitForInputReady (strSession)
	Wait 1
	fSendKeys "DCNS"
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	Wait 1
	lenCardNumber=len(strFormatCardNumber)
	If lenCardNumber="10" Then
		fSetCursorPosition 04,024
		fSendKeys strFormatCardNumber
		fSetCursorPosition 05,024
		fSendKeys "D"		
	Else
		fSetCursorPosition 04,024
		fSendKeys strCardNumber
		fSetCursorPosition 05,024
		fSendKeys "P"	
	End If	
	fSetCursorPosition 06,024
	fSendKeys strChequeNo
	fSendKeys "[enter]"
	Wait 1
	fSendKeys "[pf7]"
	fWaitForInputReady (strSession)
	Wait 1
	strRunTimeIssueDate=fGetText(strSession, "04", "056", "10")
	strRunTimePaidCheque=fGetText(strSession, "06", "056", "03")
	strRunTimeTotalCheque=fGetText(strSession, "06", "075", "03")	
End Function

'[Change Customer Segment in DFFA]
Public Function changeCustomerSegment(strCIN,strSegment)
	bchangeCustomerSegment=true
	CISLogin gstrRegion_DCBX,gstrUser_DCBX,gstrPassword_DCBX
	fSendKeys "[clear]" 
	fWaitForInputReady (strSession)
	Wait 1
	fSendKeys "DFFA"
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	Wait 1
	strBranchCode=fGetText(strSession, "09", "023", "4")
	If strBranchCode="    "  Then
		fSetCursorPosition 09,023
		fSendKeys "0352"
		fSendKeys "[pf7]"
		fSendKeys "[pf7]"
		fWaitForInputReady (strSession)		
	ElseIf strBranchCode=0352 Then
		fSendKeys "[pf7]"
		fWaitForInputReady (strSession)
	Else
		fSetCursorPosition 09,023
		fSendKeys "0352"
		fSendKeys "[pf7]"
		fSendKeys "[pf7]"	
	End If
	fWaitForInputReady (strSession)
	fSetCursorPosition 15,044
	fSendKeys "A"
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	fSetCursorPosition 17,049
	fSendKeys "A"
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	Wait 1
	fSetCursorPosition 04,019
	fSendKeys strCIN
	fSendKeys "[pf9]"
	fWaitForInputReady (strSession)
	Wait 1
	fSetCursorPosition 20,025
	fSendKeys strSegment
	fSendKeys "[pf7]"
	fWaitForInputReady (strSession)
	Wait 1
	strUpdateMessage=fGetText(strSession, "21", "002", "35")
	strUpdateMessage=trim(strUpdateMessage)
	If (InStr(strUpdateMessage,"TRANSACTION COMPLETED SUCCESSFULLY.")<>0) or (InStr(strUpdateMessage,"NO UPDATES DONE.")<>0) Then
		LogMessage "RSLT","Verification","Segment successfully Updated.",True
		bchangeCustomerSegment=true
	Else
		LogMessage "WARN","Verification","Unable to update Segment. Failure Message contains"& strUpdateMessage,false
		bchangeCustomerSegment=false
	End If
	changeCustomerSegment=bchangeCustomerSegment
End Function

'[Delete Adhoc Cheque Request from DACB Screen]
Public Function deleteChequeRequest(strCardNumber)
	bdeleteChequeRequest=true
	CISLogin gstrRegion_DACB,gstrUser_DACB,gstrPassword_DACB
	strFormatCardNumber=Replace(strCardNumber,"-","")
	strCardNumber_POSB=Replace(strCardNumber,"-"," ",1,1)
	strCardNumber_POSB=Replace(strCardNumber_POSB,"-","")
	
	fSendKeys "[clear]" 
	fWaitForInputReady (strSession)
	Wait 1
	fSendKeys "DACB"
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	Wait 1
	fSetCursorPosition 09,023
	fSendKeys "0001"
	fSendKeys "[pf7]"
	fSendKeys "[pf7]"
	fWaitForInputReady (strSession)
	fSetCursorPosition 22,052
	fSendKeys "12"
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	fSetCursorPosition 18,046
	fSendKeys "2"
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)	
	lenCardNumber=len(strFormatCardNumber)
	If lenCardNumber="10" Then
		fSetCursorPosition 10,042
		fSendKeys strFormatCardNumber
		fSetCursorPosition 12,042
		fSendKeys "D"		
	Else
		fSetCursorPosition 10,042
		fSendKeys strCardNumber_POSB
		fSetCursorPosition 12,042
		fSendKeys "P"	
	End If
	fSetCursorPosition 19,046
	fSendKeys "Y"
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	Wait 1
	strConfirmationMessage = fGetText(strSession, "21", "006", "43")
	If InStr(strConfirmationMessage,"RECORD DELETED")<>0 or InStr(strConfirmationMessage,"RECORD NOT FOUND IN ADHOC REQUEST LOG FILE")<>0 Then
		LogMessage "INFO","Verification","Cheque Book Request Deleted Successfully.",True
		bdeleteChequeRequest=true
	Else
		LogMessage "WARN","Verification","Need to validate Cheque Book Request for Specified Card.",false
		bdeleteChequeRequest=true	
	End If
	deleteChequeRequest=bdeleteChequeRequest
End Function

'[Verify Cheque Request submitted Successfully from DACB Screen]
Public Function verifyChequeRequest(strCardNumber)
	bverifyChequeRequest=true
	CISLogin gstrRegion_DACB,gstrUser_DACB,gstrPassword_DACB
	strFormatCardNumber=Replace(strCardNumber,"-","")
	strCardNumber_POSB=Replace(strCardNumber,"-"," ",1,1)
	strCardNumber_POSB=Replace(strCardNumber_POSB,"-","")
	
	fSendKeys "[clear]" 
	fWaitForInputReady (strSession)
	Wait 1
	fSendKeys "DACB"
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	Wait 1
	fSetCursorPosition 09,023
	fSendKeys "0001"
	fSendKeys "[pf7]"
	fSendKeys "[pf7]"
	fWaitForInputReady (strSession)
	fSetCursorPosition 22,052
	fSendKeys "2"
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)			
	lenCardNumber=len(strFormatCardNumber)
	If lenCardNumber="10" Then
		fSetCursorPosition 10,042
		fSendKeys strFormatCardNumber
		fSetCursorPosition 12,042
		fSendKeys "D"		
	Else
		fSetCursorPosition 10,042
		fSendKeys strCardNumber_POSB
		fSetCursorPosition 12,042
		fSendKeys "P"	
	End If	
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	Wait 1
	strConfirmationMessage = fGetText(strSession, "21", "006", "21")
	If InStr(strConfirmationMessage,"RECORD DELETED")<>0 or InStr(strConfirmationMessage,"RECORD ALREADY EXISTS")<>0 Then
		LogMessage "INFO","Verification","Cheque Book Request Created Successfully.",True
		bverifyChequeRequest=true
	Else
		LogMessage "WARN","Verification","Need to validate Cheque Book Request for Specified Card.",false
		bverifyChequeRequest=true	
	End If
	verifyChequeRequest=bverifyChequeRequest
End Function

'[Navigate to FTTR 10]
Public Function navigateFTTR10()
    navigateFTTR10 = true
    FTSPLogin gstrRegion_FTSP,gstrUser_FTSP,gstrPassword_FTSP
    fSendKeys "[clear]" 
    fSendKeys "FTSN 10"
    fSendKeys "[enter]"
    fWaitForInputReady (strSession)
    wait 1
    strOpenBranch = fGetText(strSession, "24", "002", "15")
    If instr(strOpenBranch,"OPEN BRANCH") = 0 Then
        'Then the branch is not opened
        LogMessage "WARN","Verification","Unable to open the Branch.",false
        navigateFTTR10 = false
        Exit Function
    Else
        LogMessage "INFO","Verification","Able to open the branch.",True
    End If
    fSendKeys "[enter]"
    fSetCursorPosition 20,037 'sign off
    fSendKeys "08"
    fSendKeys "[enter]"
    
    'Login again
    FTSPLogin gstrRegion_FTSP,gstrUser_FTSP,gstrPassword_FTSP
    fSendKeys "[clear]" 
    fSendKeys "FTTR 10"
    fSendKeys "[enter]"
    fWaitForInputReady (strSession)
    wait 1
    'Check if the login is successful
    strCheckPt = fGetText(strSession, "02", "002", "7")
    If instr(strCheckPt,"FT01M03") = 0 Then
        'Then the Login is not succesful
        LogMessage "WARN","Verification","Unable to Login to FTTR 10.",false
        navigateFTTR10 = false
        Exit Function
    Else
        LogMessage "INFO","Verification","Able to Login to FTTR 10.",True
    End If
    navigateFTTR10 = true
End Function

'[Delete GIRO from FTSP Screen]
Public Function deleteGIRO_FTSP(strCardNumber,strAccountType)
	bdeleteGIRO_FTSP=true
	navigateFTTR10
	fSetCursorPosition 20,034
	fSendKeys "02"
    fSendKeys "[enter]"
    fWaitForInputReady (strSession)
	fSetCursorPosition 19,048
	fSendKeys "5"
    fSendKeys "[enter]"
    fWaitForInputReady (strSession)
    strFormatCardNumber=Replace(strCardNumber,"-","")
    lenCardNumber=len(strFormatCardNumber)
    fSetCursorPosition 06,026
	If lenCardNumber="10" Then		
		fSendKeys "D"		
	Else
		fSendKeys "P"
	End If
	fSetCursorPosition 07,026
	fSendKeys strAccountType
	fSetCursorPosition 08,026
	fSendKeys strFormatCardNumber	
	fSendKeys "[enter]"
	strConfirmationMessage = fGetText(strSession, "22", "001", "28")
	If strConfirmationMessage = "NO LINKAGE RECORD." Then
		LogMessage "INFO","Verification","There is no existing GIRO record.",True
		bdeleteGIRO_FTSP=true
		Exit Function
	End If	
	fSendKeys "[enter]"
	fSendKeys "[pf7]"
	fWaitForInputReady (strSession)
	strConfirmationMessage = fGetText(strSession, "22", "001", "28")
	If InStr(strConfirmationMessage,"NO LINKAGE RECORD.")<>0 or InStr(strConfirmationMessage,"DELETE LINKAGE SUCCESSFULLY.")<>0 Then
		LogMessage "INFO","Verification","GIRO Deleted Successfully.",True
		bdeleteGIRO_FTSP=true
	Else
		LogMessage "WARN","Verification","Unable to delete GIRO from FTSP.",false
		bdeleteGIRO_FTSP=true	
	End If
	deleteGIRO_FTSP=bdeleteGIRO_FTSP
End Function

'[Create GIRO from FTSP Screen]
Public Function verificationGIRO_FTSP(strCardNumber,strAccountType,strOriginatingAccountNo,strReferenceAccountNumber)
	bcreateGIRO_FTSP=true
	navigateFTTR10
	fSetCursorPosition 20,034
	fSendKeys "02"
    fSendKeys "[enter]"
    fWaitForInputReady (strSession)
	fSetCursorPosition 19,048
	fSendKeys "6"
    fSendKeys "[enter]"
    fWaitForInputReady (strSession)
    strFormatCardNumber=Replace(strCardNumber,"-","")
    lenCardNumber=len(strFormatCardNumber)
    fSetCursorPosition 06,026
	If lenCardNumber="10" Then		
		fSendKeys "D"
	Else
		fSendKeys "P"
	End If
	fSetCursorPosition 07,026
	fSendKeys strAccountType
	fSetCursorPosition 08,026
	fSendKeys strFormatCardNumber	
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	strConfirmationMessage = trim(fGetText(strSession, "22", "001", "42"))
	If InStr(strConfirmationMessage,"NO LINKAGE RECORD.")<>0 Then
		fSendKeys "[pf1]"
		bcreateGIRO_FTSP=createGIRO_FTSP(strCardNumber,strAccountType,strOriginatingAccountNo,strReferenceAccountNumber)
	ElseIf InStr(strConfirmationMessage,"PLEASE AMEND LINKAGE INFO AND PRESS ENTER.")<>0 Then
		LogMessage "INFO","Verification","GIRO setup already created.",True
		bcreateGIRO_FTSP=true
	Else
		LogMessage "WARN","Verification","Unable to navigate to GIRO Setup page.",false
		bcreateGIRO_FTSP=false
	End If
	verificationGIRO_FTSP=bcreateGIRO_FTSP
End Function

'********* GIRO Creation
Public Function createGIRO_FTSP(strCardNumber,strAccountType,strOriginatingAccountNo,strReferenceAccountNumber)
	bcreateGIRO_FTSP=true
	fSetCursorPosition 19,048
	fSendKeys "1"
    fSendKeys "[enter]"
    fWaitForInputReady (strSession)
    strFormatCardNumber=Replace(strCardNumber,"-","")
    lenCardNumber=len(strFormatCardNumber)
    fSetCursorPosition 06,044
	If lenCardNumber="10" Then		
		fSendKeys "D"
	Else
		fSendKeys "P"
	End If
	fSetCursorPosition 07,044
	fSendKeys strAccountType
	fSetCursorPosition 08,044
	fSendKeys strFormatCardNumber
	fSetCursorPosition 11,044
	fSendKeys "7171"	
	fSetCursorPosition 13,044
	fSendKeys strOriginatingAccountNo
	fSetCursorPosition 16,044
	fSendKeys strReferenceAccountNumber
	fSendKeys "[enter]"
    fWaitForInputReady (strSession)
    fSendKeys "[pf7]"
	fWaitForInputReady (strSession)
	strConfirmationMessage = fGetText(strSession, "22", "001", "28")
	If InStr(strConfirmationMessage,"CREATE LINKAGE SUCCESSFULLY.")<>0 Then
		LogMessage "INFO","Verification","GIRO Created Successfully.",True
		bcreateGIRO_FTSP=true
	else
		LogMessage "WARN","Verification","Unable to Create GIRO from FTSP.",false
		bcreateGIRO_FTSP=false
	End If
	createGIRO_FTSP=bcreateGIRO_FTSP
End Function

'[Verify Bank Account Status for GIRO Enquiry on FTSP Screen]
Public Function verifyBankAccountStatus_FTSP(strCardNumber,strAccountType,strStatus)
	bverifyBankAccountStatus_FTSP=true
	navigateFTTR10
	fSetCursorPosition 20,034
	fSendKeys "02"
    fSendKeys "[enter]"
    fWaitForInputReady (strSession)
	fSetCursorPosition 19,048
	fSendKeys "6"
    fSendKeys "[enter]"
    fWaitForInputReady (strSession)
    strFormatCardNumber=Replace(strCardNumber,"-","")
    lenCardNumber=len(strFormatCardNumber)
    fSetCursorPosition 06,026
	If lenCardNumber="10" Then		
		fSendKeys "D"
	Else
		fSendKeys "P"
	End If
	fSetCursorPosition 07,026
	fSendKeys strAccountType
	fSetCursorPosition 08,026
	fSendKeys strFormatCardNumber	
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	strStatus_FTSP = trim(fGetText(strSession, "07", "069", "10"))
	If trim(strStatus_FTSP) = trim(strStatus) Then
		LogMessage "INFO","Verification","Bank Account Actual Status:"+ strStatus_FTSP &" matching with expected Status: "+strStatus &" ",True
		bverifyBankAccountStatus_FTSP=true
	Else
		LogMessage "WARN","Verification","Bank Account Actual Status:"+ strStatus_FTSP &" does not matched with expected Status: "+strStatus &" ",fale
		bverifyBankAccountStatus_FTSP=false	
	End If	
	verifyBankAccountStatus_FTSP=bverifyBankAccountStatus_FTSP
End Function

'[Suspend GIRO from FTSP screen]
Public Function suspendGIRO_FTSP(strCardNumber,strAccountType)
	bsuspendGIRO_FTSP=true
	navigateFTTR10
	fSetCursorPosition 20,034
	fSendKeys "02"
    fSendKeys "[enter]"
    fWaitForInputReady (strSession)
	fSetCursorPosition 19,048
	fSendKeys "3"
    fSendKeys "[enter]"
    fWaitForInputReady (strSession)
    strFormatCardNumber=Replace(strCardNumber,"-","")
    lenCardNumber=len(strFormatCardNumber)
    fSetCursorPosition 06,026
	If lenCardNumber="10" Then		
		fSendKeys "D"
	Else
		fSendKeys "P"
	End If
	fSetCursorPosition 07,026
	fSendKeys strAccountType
	fSetCursorPosition 08,026
	fSendKeys strFormatCardNumber	
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	
	strFTSPDate=fGetText(strSession, "01", "071", "10") 'To get current FTSP date
	strFTSPDate=replace(strFTSPDate,"/","")
	fSetCursorPosition 17,026 ' Effective date 
	fSendKeys strFTSPDate
	fSetCursorPosition 17,069 ' Expiry date
	fSendKeys strFTSPDate
	fSendKeys "[enter]"
	fSendKeys "[pf7]"
	strConfirmationMessage = trim(fGetText(strSession, "22", "001", "29"))
	If InStr(strConfirmationMessage,"SUSPEND LINKAGE SUCCESSFULLY.")<>0 Then
		LogMessage "INFO","Verification","GIRO Suspended Successfully.",True
		bsuspendGIRO_FTSP=true
	else
		LogMessage "WARN","Verification","Unable to Suspend GIRO from FTSP.",false
		bsuspendGIRO_FTSP=false
	End If
	suspendGIRO_FTSP=bsuspendGIRO_FTSP
End Function

'[Navigate to SI Inquiry Screen in FTSP]
Public Function navigateToSIInquiry()
	navigateToSIInquiry = true
	fSetCursorPosition 20,034
	fSendKeys "01"
	fSendKeys "[enter]"
	fSetCursorPosition 16,050
	fSendKeys "5"
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	wait 1
	strCheckPt = fGetText(strSession, "02", "002", "7")
	If instr(strCheckPt,"FT116M1") = 0 Then
		'Then the Login is not succesful
		LogMessage "WARN","Verification","Unable to Enter the SI Inquiry Screen.",false
		navigateToSIInquiry = false
		Exit Function
	Else
		LogMessage "INFO","Verification","Able to Enter the SI Inquiry Screen.",True
	End If
	navigateToSIInquiry = true
End Function

'[Fetch the SI Setup Data in FTTR Screen]
Public Function fetchDataSI_FTSP(strOriginatingBankInd,strOriginatingAcctNo,strOriginatingAcctType, strOriginatingBranchNo,strReceivingBankNo, strBeneficiaryAcctNo,strReference)
	fetchDataSI_FTSP = true
	'Set the Originating Bank Indicator (D or P); figure out D or P
	If instr(strOriginatingBankInd,"DBS")<>0  Then
		strOriginatingBankInd = "D"
	Else
		strOriginatingBankInd = "P"
	End If
	fSetCursorPosition 04,027
	fSendKeys strOriginatingBankInd
	
	'Set the Originating Branch No (to be handled later on)
	fSetCursorPosition 05,027
	fSendKeys strOriginatingBranchNo
	'Set the Originating Account No
	strOriginatingAcctNo = replace(strOriginatingAcctNo,"-","")
	fSetCursorPosition 06,027
	fSendKeys strOriginatingAcctNo
	'Set the Originating Account Type (1-SA or 2-CA)
	If instr(strOriginatingAcctType,"Checking") <> 0 Then
		strOriginatingAcctType = "2"
	Else
		strOriginatingAcctType = "1"
	End If
	fSetCursorPosition 07,027
	fSendKeys strOriginatingAcctType
	'Set the Receiving Bank No
	fSetCursorPosition 10,027
	fSendKeys strReceivingBankNo
	'Set the Receiving Account No
	fSetCursorPosition 12,027
	fSendKeys strBeneficiaryAcctNo
	'Now press enter so that the values are displayed
	fSendKeys "[enter]"
	fWaitForInputReady (strSession)
	wait 1
	'Check if the values are getting displayed
	strCheckPt = fGetText(strSession, "22", "001", "28")
	If instr(strCheckPt,"PRESS PF11 / PF12 TO BROWSE") = 0 Then
		LogMessage "WARN","Verification","Record does not exist in FTSP.",false
		fetchDataSI_FTSP = false
		Exit Function
	Else
		'Then the Records exist; search for the relevant records
		LogMessage "INFO","Verification","Record exists in FTSP.",True
		'Compare reference No;Frequency of Payment;Day of Payment;Date of Last Payment;Payment Amount
		Do
			checkReferenceNo = verifyReference_FTSP(strReference)
			'checkPaymentAmt = verifyTranAmt_FTSP(strAmount)
			'checkFrequency = verifyFreqency_FTSP(strFrequency)
			'checkDayOfPayment = verifyDayOfPayment_FTSP(strDayOfPayment)
			'checkEndOfPayment = verifyPaymentEndDate_FTSP(strEndPaymentDate)
			'If checkReferenceNo and checkPaymentAmt and checkFrequency and checkDayOfPayment and checkEndOfPayment Then
			If checkReferenceNo Then
				'Then the record matches
				LogMessage "INFO","Verification","The record matches with the records in FTSP.",True
				Exit Function
			Else
				'Navigate to the next screen
				fSendKeys "[pf12]"
			End If
		Loop While trim(fGetText(strSession, "22", "001", "15")) <> "END OF FORWARD"
	End If
	'if the control comes to this, then the record does not exists
	LogMessage "WARN","Verification","Record does not exist in FTSP.",false
	fetchDataSI_FTSP = false
End Function

'[Verify Reference of SI in FTSP displayed as]
Public Function verifyReference_FTSP(strReference)
	verifyReference_FTSP = true
	strActualRef = trim(fGetText(strSession, "17", "027", "20"))
	If trim(strReference) = trim(strActualRef) Then
		LogMessage "INFO","Verification","Reference Number matches with FTSP.Expected: "&strReference & "Actual: " &strActualRef,True
	Else
		'LogMessage "WARN","Verification","Reference Number does not match with FTSP.Expected: "&strReference & "Actual: " &strActualRef,False
		verifyReference_FTSP = false
	End If
	'verifyReference_FTSP = true
End Function

'[Verify Transaction Amount of SI in FTSP displayed as]
Public Function verifyTranAmt_FTSP(strAmount)
	verifyTranAmt_FTSP = true
	strActualAmt = trim(fGetText(strSession, "14", "027", "20"))
	If trim(strAmount) = trim(strActualAmt) Then
		LogMessage "INFO","Verification","Transaction Amount matches with FTSP.Expected: "&strAmount & "Actual: " &strActualAmt,True
	Else
		'LogMessage "WARN","Verification","Transaction Amount does not match with FTSP.Expected: "&strAmount & "Actual: " &strActualAmt,False
		verifyTranAmt_FTSP = false
	End If
	'verifyTranAmt_FTSP = true
End Function

'[Verify Transaction Amount not updated in FTSP]
Public Function verifyTranAmtNotUpdated_FTSP(strAmount)
	verifyTranAmtNotUpdated_FTSP = true
	strActualAmt = trim(fGetText(strSession, "14", "027", "20"))
	If trim(strAmount) <> trim(strActualAmt) Then
		LogMessage "INFO","Verification","Transaction Amount is not updated in FTSP.Expected: "&strAmount & "Actual: " &strActualAmt,True
	Else
		LogMessage "WARN","Verification","Transaction Amount is updated in FTSP.Expected: "&strAmount & "Actual: " &strActualAmt,False
		verifyTranAmtNotUpdated_FTSP = false
	End If
	'verifyTranAmt_FTSP = true
End Function

'[Verify Originator Name of SI in FTSP displayed as]
Public Function verifyOrigName_FTSP(strName)
	verifyOrigName_FTSP = true
	strActualAmt = trim(fGetText(strSession, "08", "027", "20"))
	If trim(strName) = trim(strActualAmt) Then
		LogMessage "INFO","Verification","Originator Name matches with FTSP.Expected: "&strName & "Actual: " &strActualAmt,True
	Else
		'LogMessage "WARN","Verification","Originator Name does not match with FTSP.Expected: "&strName & "Actual: " &strActualAmt,False
		verifyOrigName_FTSP = false
	End If
	'verifyOrigName_FTSP = true
End Function

'[Verify Frequency of SI in FTSP displayed as]
Public Function verifyFreqency_FTSP(strFrequency)
	verifyFreqency_FTSP = true
	strActualFreq = trim(fGetText(strSession, "06", "069", "3"))
	strFrequency = Mid(strFrequency,1,1)
	If trim(strFrequency) = trim(strActualFreq) Then
		LogMessage "INFO","Verification","Frequency matches with FTSP.Expected: "&strFrequency & "Actual: " &strActualFreq,True
	Else
		'LogMessage "WARN","Verification","Frequency does not match with FTSP.Expected: "&strFrequency & "Actual: " &strActualFreq,False
		verifyFreqency_FTSP = false
	End If
	'verifyFreqency_FTSP = true
End Function

'[Verify Day of Payment of SI in FTSP displayed as]
Public Function verifyDayOfPayment_FTSP(strDayOfPayment)
	verifyDayOfPayment_FTSP = true
	strActualDayOfPayment = trim(fGetText(strSession, "07", "069", "2"))
	If trim(strDayOfPayment) = trim(strActualDayOfPayment) Then
		LogMessage "INFO","Verification","Day of Payment matches with FTSP.Expected: "&strDayOfPayment & "Actual: " &strActualDayOfPayment,True
	Else
		'LogMessage "WARN","Verification","Day of Payment does not match with FTSP.Expected: "&strDayOfPayment & "Actual: " &strActualDayOfPayment,False
		verifyDayOfPayment_FTSP = false
	End If
	'verifyDayOfPayment_FTSP = true
End Function

'[Verify Transaction Particular of SI in FTSP displayed as]
Public Function verifyTranPart_FTSP(strTranPart)
	verifyTranPart_FTSP = true
	strActualTranPart = trim(fGetText(strSession, "19", "027", "2"))
	If trim(strTranPart) = trim(strActualTranPart) Then
		LogMessage "INFO","Verification","Transaction Particular matches with FTSP.Expected: "&strTranPart & "Actual: " &strActualTranPart,True
	Else
		LogMessage "WARN","Verification","Transaction Particular does not match with FTSP.Expected: "&strTranPart & "Actual: " &strActualTranPart,False
		verifyTranPart_FTSP = false
	End If
	'verifyTranPart_FTSP = true
End Function

'[Verify Transaction Code of SI in FTSP displayed as]
Public Function verifyTranCode_FTSP(strTranCode)
	verifyTranCode_FTSP = true
	strActualTranCode = trim(fGetText(strSession, "20", "027", "2"))
	If trim(strTranCode) = trim(strActualTranCode) Then
		LogMessage "INFO","Verification","Transaction Code matches with FTSP.Expected: "&strTranCode & "Actual: " &strActualTranCode,True
	Else
		LogMessage "WARN","Verification","Transaction Code does not match with FTSP.Expected: "&strTranCode & "Actual: " &strActualTranCode,False
		verifyTranCode_FTSP = false
	End If
	'verifyTranCode_FTSP = true
End Function

'[Verify Channel Indicator of SI in FTSP displayed as]
Public Function verifyChannelInd_FTSP(strChannelInd)
	verifyChannelInd_FTSP = true
	strActualChannelInd = trim(fGetText(strSession, "20", "069", "2"))
	If trim(strChannelInd) = trim(strActualChannelInd) Then
		LogMessage "INFO","Verification","Channel Indicator matches with FTSP.Expected: "&strChannelInd & "Actual: " &strActualChannelInd,True
	Else
		LogMessage "WARN","Verification","Channel Indicator does not match with FTSP.Expected: "&strChannelInd & "Actual: " &strActualChannelInd,False
		verifyChannelInd_FTSP = false
	End If
	'verifyChannelInd_FTSP = true
End Function

'[Verify Last Payment Amount of SI in FTSP displayed as]
Public Function verifyLastPaymentAmt_FTSP(strLastPaymentAmt)
	verifyLastPaymentAmt_FTSP = true
	strActualLastPaymentAmt = trim(fGetText(strSession, "09", "069", "12"))
	If trim(strLastPaymentAmt) <> trim(strActualChannelInd) Then
		'Last Payment Amount should not get reflected in FTSP as it is NSTP
		LogMessage "INFO","Verification","Last Payment Amount is not reflected in FTSP.Expected: "&strLastPaymentAmt & "Actual: " &strActualLastPaymentAmt,True
	Else
		LogMessage "WARN","Verification","Last Payment Amount is reflected in FTSP.Expected: "&strLastPaymentAmt & "Actual: " &strActualLastPaymentAmt,False
		verifyLastPaymentAmt_FTSP = false
	End If
End Function

'[Verify Status of SI in FTSP displayed as]
Public Function verifyStatus_FTSP(strStatus)
	verifyStatus_FTSP = true
	strActualStatus = trim(fGetText(strSession, "09", "069", "12"))
	If trim(strStatus) <> trim(strActualChannelInd) Then
		'Last Payment Amount should not get reflected in FTSP as it is NSTP
		LogMessage "INFO","Verification","Status is updated in FTSP.Expected: "&strStatus & "Actual: " &strActualStatus,True
	Else
		LogMessage "WARN","Verification","Status is not updated in FTSP.Expected: "&strStatus & "Actual: " &strActualStatus,False
		verifyStatus_FTSP = false
	End If
End Function

'[Verify Payment Start Date of SI in FTSP displayed as]
Public Function verifyPaymentStartDate_FTSP(strPaymentStartDate)
	verifyPaymentStartDate_FTSP = true
	strDate = trim(fGetText(strSession, "04", "069", "8"))
	strDate = Mid(strDate,1,2)+"/"+Mid(strDate,3,2)+"/"+Mid(strDate,5,4)
	If len(Day(CDate(strDate)))=1 Then
		strDay="0"&Day(CDate(strDate))
	else
	    strDay=""&Day(CDate(strDate))
	End If
	    strDate=""&strDay & " "&monthName(Month(CDate(strDate)),true) &" " &Year(CDate(strDate))
	    
	If strPaymentStartDate="RunTime" Then
		'Used for setup
		If trim(strRunTimeFirstPaymentDate) = trim(strDate) Then
			LogMessage "INFO","Verification","Payment Start Date matches with FTSP.Expected: "&strRunTimeFirstPaymentDate & "Actual: " &strDate,True
		Else
			LogMessage "WARN","Verification","Payment Start Date does not match with FTSP.Expected: "&strRunTimeFirstPaymentDate & "Actual: " &strDate,False
			verifyPaymentStartDate_FTSP = false
		End If
	Else
		'Used for Amendment (when the date is provided in the excel sheet
		If trim(strPaymentStartDate) = trim(strDate) Then
			LogMessage "INFO","Verification","Payment Start Date matches with FTSP.Expected: "&strPaymentStartDate & "Actual: " &strDate,True
		Else
			LogMessage "WARN","Verification","Payment Start Date does not match with FTSP.Expected: "&strPaymentStartDate & "Actual: " &strDate,False
			verifyPaymentStartDate_FTSP = false
		End If
	End If
	
	
	'verifyPaymentStartDate_FTSP = true
End Function

'[Verify Payment End Date of SI in FTSP displayed as]
Public Function verifyPaymentEndDate_FTSP(strEndPaymentDate)
	verifyPaymentEndDate_FTSP = true
	strDate = trim(fGetText(strSession, "05", "069", "8"))
	strDate = Mid(strDate,1,2)+"/"+Mid(strDate,3,2)+"/"+Mid(strDate,5,4)
	If len(Day(CDate(strDate)))=1 Then
		strDay="0"&Day(CDate(strDate))
	else
	    strDay=""&Day(CDate(strDate))
	End If
	    strDate=""&strDay & " "&monthName(Month(CDate(strDate)),true) &" " &Year(CDate(strDate))
	'******** If the strEndPaymentDate is RunTime, then compare it with the global variable (used only for Setup)
	If strEndPaymentDate="RunTime" Then
		'Compare with runTime variable
		If trim(strRunTimeLastPaymentDate) = trim(strDate) Then
			LogMessage "INFO","Verification","Payment End Date matches with FTSP.Expected: "&strRunTimeLastPaymentDate & "Actual: " &strDate,True
		Else
			'LogMessage "WARN","Verification","Payment End Date does not match with FTSP.Expected: "&strRunTimeLastPaymentDate & "Actual: " &strDate,False
			verifyPaymentEndDate_FTSP = false
		End If
	Else
		'compare with the variable (used for Amendment)
		'Note: End Payment date in Setup & Last Payment date in Amendment
		If trim(strEndPaymentDate) = trim(strDate) Then
			LogMessage "INFO","Verification","Payment End Date matches with FTSP.Expected: "&strEndPaymentDate & "Actual: " &strDate,True
		Else
			'LogMessage "WARN","Verification","Payment End Date does not match with FTSP.Expected: "&strEndPaymentDate & "Actual: " &strDate,False
			verifyPaymentEndDate_FTSP = false
		End If
	End If
	'verifyPaymentEndDate_FTSP = true
End Function

'[Delete the existing SI Data in FTSP Screen]
Public Function deleteExistingSI_FTSP(strOriginatingBankInd,strOriginatingAcctNo,strOriginatingAcctType, strOriginatingBranchNo,strReceivingBankNo, strBeneficiaryAcctNo)
	deleteExistingSI_FTSP = true
	fSetCursorPosition 20,034
	fSendKeys "01"
	fSendKeys "[enter]"
	fSetCursorPosition 16,050
	fSendKeys "4"
	fSendKeys "[enter]"
	'Enter the data now
	'Set the Originating Bank Indicator (D or P); figure out D or P
	If instr(strOriginatingBankInd,"DBS")<>0  Then
		strOriginatingBankInd = "D"
	Else
		strOriginatingBankInd = "P"
	End If
	fSetCursorPosition 04,027
	fSendKeys strOriginatingBankInd
	
	'Set the Originating Branch No (to be handled later on)
	fSetCursorPosition 05,027
	fSendKeys strOriginatingBranchNo
	'Set the Originating Account No
	strOriginatingAcctNo = replace(strOriginatingAcctNo,"-","")
	fSetCursorPosition 06,027
	fSendKeys strOriginatingAcctNo
	'Set the Originating Account Type (1-SA or 2-CA)
	If instr(strOriginatingAcctType,"Checking") <> 0 Then
		strOriginatingAcctType = "2"
	Else
		strOriginatingAcctType = "1"
	End If
	fSetCursorPosition 07,027
	fSendKeys strOriginatingAcctType
	'Set the Receiving Bank No
	fSetCursorPosition 10,027
	fSendKeys strReceivingBankNo
	'Set the Receiving Account No
	fSetCursorPosition 12,027
	fSendKeys strBeneficiaryAcctNo
	'Now press enter so that the values are displayed
	fSendKeys "[enter]"
	fWaitForInputReady (strSession) 
	wait 1
	'If the record does not exist, then the "STANDING INSTRUCTION DOES NOT EXIST." is displayed
	strCheckPt = fGetText(strSession, "22", "001", "38")
	If instr(strCheckPt,"STANDING INSTRUCTION DOES NOT EXIST") <> 0 Then
		'Then the record does not exist to delete
		LogMessage "INFO","Verification","SI record does not exist to delete.",True
	Else
		'Go further and delete the record
		fSendKeys "[enter]"
		fSendKeys "[pf7]"
		fWaitForInputReady (strSession)
		wait 1
		strCheckPt = fGetText(strSession, "22", "001", "52")
		If instr(strCheckPt,"SI SUCCESSFULLY DELETED") <> 0 Then
			'Then the record is deleted
			LogMessage "INFO","Verification","SI record is successfully deleted.",True
			fSendKeys "[enter]"
		Else
			LogMessage "WARN","Verification","Unable to delete the record.",False
			deleteExistingSI_FTSP = false
		End If
	End If
	'deleteExistingSI_FTSP = true
End Function
