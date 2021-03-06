'[Verify fields displayed in Other Details section]
Public Function VerifyOtherDetailsFields_OD(lstOtherDetails,strProductType)
bIDLabelValuePairs1 = False

strExpLbl = Split(lstOtherDetails, ":")(0)
strExpVal = Split(lstOtherDetails, ":")(1)	

strActLbl = coOtherDetails_Page.lblAccountName.GetROProperty("innertext")
strActVal = coOtherDetails_Page.lblAccountNameVal.GetROProperty("innertext")

If (Instr(Trim(strActLbl),Trim(strExpLbl)) > 0) And (Instr(Trim(strActVal),Trim(strExpVal)) > 0) Then
	LogMessage "RSLT","Verification","Label and Value Verification for - Product Type : |" & strProductType &"| - Section Name: | Other Details | - Label Name and Value : |"& strActLbl &_
	"| is displayed as expected",True
	bIDLabelValuePairs1 = True
Else
	LogMessage "WARN","Verification","Label and Value Verification for - Product Type : |" & strProductType &"| - Section Name: | Other Details | - Label Name and Value : |" & strExpVal &_
	"| is not displayed as expected, Actual: |" & strActVal  & "|",False
End If	

VerifyOtherDetailsFields_OD = bIDLabelValuePairs1
End Function
