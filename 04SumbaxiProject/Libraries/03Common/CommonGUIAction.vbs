'%%%%%%%%%%% Common GUI Action Functions %%%%%%%%%%%%%%%%%%%%%
Public Function LaunchBrowser ( val)
   'Initializes framework and launches the application 
'
  CloseBrowsers
  wait(2)
	   Set IE = CreateObject("InternetExplorer.Application")
	   ' Set IE = CreateObject("MozillaFirefox.Application")
		IE.visible = true
		IE.Maximize
		IE.Navigate val
		While IE.Busy
			wait 1
		Wend
    
	LaunchBrowser = true
   ' msgbox level
	'msgbox objectDescription
End Function


Function activate(strObjectName)
strObjDecs = myObject(""& strObjectName)' &"", "name:=", strObjName)
   'print "colour :  " & strObjDecs
 Execute  strObjDecs & "Activate"
 
End Function


Function SetText (strObjectName,strText)

'set strObjDecs = myObjectCreater(""& strObjectName)' &"", "name:=", strObjName)
'strObjDecs.Set(strText)
    strObjDecs = myObject(""& strObjectName)'
   'print "colour :  " & strObjDecs
  'Execute strObjDecs & "WaitProperty(""disabled", 0")"
 Execute  strObjDecs & "Set (" & Quote(strText) & ")"
 
  End Function

Function selectWebList(strObjectName,strItemSelect)

'    Dim strObjDecs
'    strObjDecs = myObject("wlstSelectCountry")' &"", "name:=", strObjName)
'strText="U.S.A."
'	 'Execute strObjDecs & "WaitProperty("disabled", 0)"
' Execute  strObjDecs & "Select (" & Quote(strText) & ")"
 
		set strObjDecs = myObjectCreater(""& strObjectName)' &"", "name:=", strObjName)
		strObjDecs.WaitProperty "disabled", 0
		strObjDecs.Click()
		strObjDecs.Select strItemSelect
	 
 End Function

	Function GetVisibleText (strObjectName)
	
		strObjDecs = myObject(""& strObjectName)' &"", "name:=", strObjName)
	 Execute  "mytext=" & strObjDecs & "GetVisibleText"
	 GetVisibleText=mytext
	  End Function

Function selectWebList(strWebListName,strListText)
print "test started"
    strObjDecs = myObject(""& strWebListName)' &"", "name:=", strObjName)
 Execute  strObjDecs & "Select (" & Quote(strListText) & ")"
 
End Function

Function clickLink(strLinkName)

  strObjDecs = myObject(""& strLinkName)' &"", "name:=", strObjName)
 'msgbox strObjDecs
 Execute  strObjDecs & "Click()"
End Function


Function clickLinkImage(strLinkImageName)

  strObjDecs = myObject(""& strLinkImageName)' &"", "name:=", strObjName)
' msgbox strObjDecs
 Execute  strObjDecs & "Click()"
'  set strObjDecs = myObjectCreater(""& strLinkImageName)' &"", "name:=", strObjName)
'	   ' strObjDecs.WaitProperty "disabled", 0
'		strObjDecs.Click()
	  '  strObjDecs.Select strItemSelect
End Function


Function clickButton(strButtonName)

set  strObjDecs = myObjectCreater(""& strButtonName)
 'msgbox strObjDecs
 'Execute  strObjDecs & "Click()"
 strObjDecs.Click()
End Function


Function clickWebArea(strLinkName)
   '  Browse (strLinkName)
  strObjDecs = myObject(""& strLinkName)' &"", "name:=", strObjName)
 msgbox strObjDecs
 Execute  strObjDecs & "Click"
End Function


Function readImage(strImageName)
 strObjDecs = myObject(""& strImageName)' &"", "name:=", strObjName)
 msgbox strObjDecs
 Execute "text=" & strObjDecs & "Contains()"
 msgbox text
End Function

Function  VerifyPage(strPageName)
Dim strPage,bResult
trPage=Browser("micClass:=Browser").Page("micClass:=Page").CheckProperty("name",strPageName)
End Function

'*****Verify object displayed on web page
Function verifyFieldsDisplayed(strobjectList)
   Dim  arrFieldsToVerify,i,bverifyField
   bverifyField=True
   'ReDim arrFieldsToVerify(1)
     arrFieldsToVerify = split(strobjectList, ",")
	 For i=0 to ubound(arrFieldsToVerify)-1
strobjectName=arrFieldsToVerify(i)

	
  strObjDecs = myObject(""& strobjectName)' &"", "name:=", strObjName)
 'msgbox strObjDecs
 Execute "bExists=" & strObjDecs & "Exist(2)"
 If  bExists Then
	 LogMessage "RSLT","Verification", "Object: "&strobjectName& "  is displayed on web page as expected", true
	 'verifyField=True
else
		LogMessage "RSLT","Verification", "Object: "&strobjectName& " is not displayed on web page as expected" , false
		verifyFieldsDisplayed=False
		Exit Function
End If
 Next
 verifyFieldsDisplayed=true
End Function

'%%%%%%%%%%Common Browser Functions %%%%%%%%%%%%%%%%
' navigate to a site if the browser is already opened, otherwise run initialization
Public Function Browse (url)
	thirdlevel = ""
	LogMessage "RSLT", "Navigate to URL", "Navigating to URL: " & Quote(url), true
	If initialized Then
		Execute GenerateDescription("Browser") & "Navigate " & Quote(url)
	Else
		Launch "website", url
	End If
	Reporter.Filter = rfDisableAll
End Function

'Function SetText (strObjectName,strText)
''Function SetText (strClass,strObjName,strText)
'	strObjDecs = myObject(""& strObjectName)' &"", "name:=", strObjName)
'  ' strObjDecs = myObject(""& strClass &"", "name:=", strObjName)
' Execute  strObjDecs & "Set (" & Quote(strText) & ")"
'
'' On error resume next
''	err.Raise 424
' 
''		If Err <> 0 Then
''				  Dim strErrorMessage
''				  MsgBox "Error # " & CStr(Err.Number) & " " & Err.Description
''		
''				  strErrorMessage="Error #" & cStr(err.number) & "," & err.Description 
''				 LogMessage micFailed, "Keyword",""&strErrorMessage
''			   ' SetText =False
''		else
''		 
''			 LogMessage  micDone,"Set Text", "Successful"
''		
''		end if
'End Function

Function verifyText(strObjectName,strText)
  strObjDecs = myObject(""& strObjectName)
  Execute "text  = " & strObjDecs & "GetROProperty (" & Quote("value") & ")"
 
   If strText= text Then
				LogMessage "RSLT", "Verification","Text Verified successfully",true
				verifyText=true
	else
 		LogMessage "RSLT", "Verification","Text not Verified successfully" , false
				  'RaiseError "Verification Failed"
				  On Error Resume Next
					Err.Raise 8  
					Err.Description = "Verification Failed"
					Err.Source = "txtVerify for object " &strObjectName
		   
				  msgbox err
					verifyText=False
	 End If

End function


Function Getcolour(strObjectName)
   Dim  objWebEl,strObjDecs,ctrlWebEl,sColor,sBackgrColor
  strObjDecs = myObject(""& strObjectName)
   Execute "text  = " & strObjDecs & "GetROProperty (" & Quote("color") & ")"
   msgbox text
   Print text
   msgbox strObjDecs
 Execute   "Set objWebEl  = " &strObjDecs & "Object"' (" & Quote(strListText) & ")"
 
  ' Set objWebEl = ctrlWebEl
'set objWebEl=Browser ("micclass:=Browser").Page("micclass:=Page").WebLink("micclass:=WebLink", "name:=REGISTER").Object 
'Set objWebEl=ctrlWebEl.Object
'objWebEl.document.all(backgroundColor)
'document.all(WebEdit name property)
sColor = objWebEl.currentStyle.color
sBackgrColor = objWebEl.currentStyle.backgroundColor
'sFontSize = objWebEl.currentStyle.fontSize
'sFontStyle = objWebEl.currentStyle.fontStyle
'sFontFamily = objWebEl.currentStyle.fontFamily
'sFontWeight = objWebEl.currentStyle.fontWeight
msgbox "colour :  " & sColor & " Background : " & sBackgrColor
print "colour :  " & sColor
End Function


'*******************************************************************

'Function VerifyDialog(strObjectName)
'
'
'  'strObjDecs = myObjectCreater(""& strObjectName)
'  Dim strObjDetails,strClass,strProperty,strObjectVal
'strObjDetails=getObjectDetails(strObjectName)
'strClass   =strObjDetails(0,1)
''msgbox strClass
'strProperty   =strObjDetails(0,2)
'
''msgbox strProperty
'strObjectVal = strObjDetails(0,3)
''msgbox strObjectVal
''Dialog( "micclass:=Dialog","regexpwndtitle:=Windows Internet Explorer").Activate()
'Set oDesc = Description.Create() 
'
'    oDesc("micclass").Value =strClass '"WebEdit" 
'
'   oDesc(strProperty).Value =strObjectVal
'
'  Browser("micclass:=Browser").Dialog( "micclass:=Dialog")
'  Set strObjDecs= Dialog( "micclass:=Dialog","regexpwndtitle:=Windows Internet Explorer")
'  strObjDecs.Activate()
'  
'  Execute "bVisible  = " & strObjDecs & "GetROProperty (" & Quote("visible") & ")"
'
'If bVisible=True Then
'	LogMessage micPass,"Exception Verification","Expected error dialog displayed"
'	VerifyDialog=true
'   
'else
'		LogMessage micFail,"Exception Verification","Expected error dialog does not displayed"
'		VerifyDialog=False
'	   
'End If
'End Function

Function VerifyErrorMessage(strObjectName,txtErrMessage)
  strObjDecs = myObject(""& strObjectName)
  Execute "text  = " & strObjDecs & "GetROProperty (" & Quote("value") & ")"

If txtErrMessage=text Then
	LogMessage "RSLT","Exception Verification","Expected error message displayed", true
VerifyErrorMessage=true
else
		LogMessage "RSLT","Exception Verification","Expected error message does not displayed", false
		VerifyErrorMessage=false
End If
End Function

Function DialogDispose(strObjectName)
strObjDecs = myObject(""& strObjectName)
  Execute "" & strObjDecs & "Close"
End Function




'**************Oracle connection, Read datd**********************
'Function getDataBaseVal(strTable,strField)
'Dim strCon
'strCon = "Driver={Microsoft ODBC for Oracle}; " & _
'         "CONNECTSTRING=(DESCRIPTION=" & _
'         "(ADDRESS=(PROTOCOL=TCP)" & _
'         "(HOST=mysrv)(PORT=7001))" & _
'         "(CONNECT_DATA=(SERVICE_NAME=MYDB))); uid=read;pwd=read;"
'Dim strSqlStatement
'strSqlStatament="Select" &strfield & "from" &strField
'Dim oCon: Set oCon = WScript.CreateObject("ADODB.Connection")
'Dim oRs: Set oRs = WScript.CreateObject("ADODB.Recordset")
'oCon.Open strCon
'Set oRs = oCon.Execute strSqlStatament'("SELECT myfield FROM mytable)
'While Not oRs.EOF
'    WSCript.Echo oRs.Fields(0).Value
'    oRs.MoveNext
'Wend
'oCon.Close
'Set oRs = Nothing
'Set oCon = Nothing
'End Function

Function RegexSelectQTP(Object, sPattern)
	Dim oRegExp, arrAllItems, ix
 sPattern=Replace (sPattern,":","\:")
 sPattern= Replace(sPattern,"$","\$")
	'Create RegExp Object
	Set oRegExp = New RegExp
	oRegExp.IgnoreCase = False
	oRegExp.Pattern = sPattern

	'Split Object's all_items property
	arrAllItems = Split(Object.GetROProperty("all items"), ";")
	For ix = LBound(arrAllItems) To UBound(arrAllItems)
	
		Dim strItem
		strItem=trim(arrAllItems(ix))
		'If RegExp pattern matches list item, we're done!
	
		If oRegExp.Test(strItem) Then
			
			'msgbox("#" &amp& ix)
			Object.Select "#" &amp& ix
			Set oRegExp = Nothing
			Exit Function
		End If
	Next
 
	'Select Item #1 by default
	Object.Select "#0"
End Function



Public Function selectTableWebList(strItem,objDropArrow,objListTable)
		Dim iRow

		If Not objListTable.Exist(0) Then
			objDropArrow.Click
			WaitForICallLoading
		End If

		iRow = objListTable.GetRowWithCellText  (strItem)
		If iRow > 0 Then
			Set objRowj = objListTable.ChildItem(iRow,1,"WebElement",0)			'Weblist have one colum
			objRowj.Click
			selectTableWebList = True
		Else
			selectTableWebList = False
		End If
End Function
