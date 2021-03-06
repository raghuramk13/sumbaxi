'[Verify fields displayed in Key Info section for Cards and Cashline Products]
Public Function VerifyKeyInfoDetailsCC_KI(arrLblValPairs,strProductType)
	bverifyfieldvalues = VerifyIDLabelValuePairsRandom(coKeyInfo_Page.lblAccordionKeyInfoCC,arrLblValPairs,strProductType,"Key Info")
	VerifyKeyInfoDetailsCC_KI = bverifyfieldvalues
End Function 

'[Verify fields displayed in Key Info section for Debit or ATM Products]
Public Function VerifyKeyInfoDetailsDC_KI(arrLblValPairs,strProductType)
	VerifyKeyInfoDetailsDC_KI = VerifyIDLabelValuePairs(coKeyInfo_Page.lblAccordionKeyInfoDebit,arrLblValPairs,strProductType,"Key Info")
End Function

'[Verify Account Holder Information displayed in table]
Public Function VerifyAccountHolderInfo_KI(lstlstAccountData)
	bVerifyAccHolderInfo = VerifyTableSingleRowData(coKeyInfo_Page.lblKeyInfoTableHeader,coKeyInfo_Page.lblKeyInfoTableContent,lstlstAccountData,"Account Holders")
	VerifyAccountHolderInfo_KI = bVerifyAccHolderInfo
End Function

'[Click on Account Holder Information under KeyInfo Section]
Public Function ClickAccountHolderInfo_KI(lstAccountData)
	bVerifyAccHolderInfo = SelectTableRow(coKeyInfo_Page.lblKeyInfoTableHeader,coKeyInfo_Page.lblKeyInfoTableContent,lstAccountData,"Account Holders","CIF",False,False)
	WaitForIServeLoading
	ClickAccountHolderInfo_KI = bVerifyAccHolderInfo
End Function

'[Verify Account Branch code Or Account Opening information displayed under KeyInfo Section]
Public Function VerifyAccountInformation_KI(arrLblValPairs,strProductType)
bverifyAccountInfo = False 	
bIDLabelValuePairs1 = False
bIDLabelValuePairs2 = True

If Instr(Trim(coKeyInfo_Page.lblAccInfo.GetROProperty("innertext")),"Account Information") > 0 Then

	strExpLbl = Split(arrLblValPairs, ":")(0)
	strExpVal = Split(arrLblValPairs, ":")(1)	
	
	If Ucase(Trim(strProductType)) <> "TIME DEPOSIT" Then
		strActLbl = coKeyInfo_Page.lblBranchCodelbl.GetROProperty("innertext")
		strActVal = coKeyInfo_Page.lblBranchCode.GetROProperty("innertext")
	Else  
		strActLbl = coKeyInfo_Page.lblOpeningDatelbl.GetROProperty("innertext")
		strActVal = coKeyInfo_Page.lblOpeningDate.GetROProperty("innertext")	
	End If
	
	If (Instr(Trim(strActLbl),Trim(strExpLbl)) > 0) And (Instr(Trim(strActVal),Trim(strExpVal)) > 0) Then
		LogMessage "RSLT","Verification","Label and Value Verification for - Product Type : |" & strProductType &_
		"| - Section Name: | KeyInfo | - Label Name and Value : |"& strActLbl &_
		"| is displayed as expected",True
		bIDLabelValuePairs1 = True
	Else
		LogMessage "WARN","Verification","Label and Value Verification for - Product Type : |" & strProductType &_
		"| - Section Name: | KeyInfo | - Label Name and Value : |" & strExpVal &_
		"| is not displayed as expected, Actual: |" & strActVal  & "|",False
		bIDLabelValuePairs2 = False
	End If	
	
	If bIDLabelValuePairs1 And bIDLabelValuePairs2 Then
		bverifyAccountInfo = True
	Else
		bverifyAccountInfo = False
	End If	
	
End If	

VerifyAccountInformation_KI = bverifyAccountInfo
End Function

