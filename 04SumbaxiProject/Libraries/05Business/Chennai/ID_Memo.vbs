'[Verify fields displayed in Memo section for Cards and Cashline Products]
Public Function VerifyMemoDetails(arrLblValPairs,strProductType)
	bverifyfieldvalues = VerifyIDLabelValuePairs(coMemo_Page.lblAccordionMemo,arrLblValPairs,strProductType,"Memo Details")
	VerifyMemoDetails = bverifyfieldvalues
End Function

'[Verify lines of memo text displayed in Memo section]
Public Function VerifyMemoLines(lstMemolines)
	bverifytext = False
	bverifytext1 = True
	
	Set objWebkitBox = coMemo_Page.lstMemoLines
	Set oDiv = Description.Create
	oDiv("Class").Value = "slider-list-item"
	
	Set oDivChild = objWebkitBox.ChildObjects(oDiv)
	
	For i = 0 To Ubound(lstMemolines)
		strExpMemotext = Trim(lstMemolines(i))
		
		For j = 0 To oDivChild.Count-1	
			strActMemotext = oDivChild(j).GetRoProperty("innertext")			
			If Instr(Trim(strActMemotext),Trim(strExpMemotext)) > 0 Then	
			   LogMessage "RSLT","Verification","Memo line text "&strExpMemotext&" displayed as expected",True
			   bverifytext = True
			   Exit For
			Else
			   bverifytext = False 
			End IF					
		Next 
		
		If Not bverifytext Then
		   LogMessage "WARN","Verification","Memo line text "&strExpMemotext&" not displayed as expected",False
		   bverifytext1 = False
		End If		
	Next
	
	If bverifytext AND bverifytext1 Then
	   VerifyMemoLines = True
	Else 
	   VerifyMemoLines = False
	End If
	
	Set oDiv = Nothing 
	Set oDivChild = Nothing
	Set objWebkitBox = Nothing
End Function
