' this File contains the Common GUI Functions for Keywords

'***********************************************************Common  GUI Functions**************************************************************************************************
Public Function  verifyField(objField, strExpectedValue, strFieldName)
Dim strObservedValue
strObservedValue = objField.getROProperty("value")

If  Ucase(Trim(strObservedValue)) = UCase(Trim(strExpectedValue)) Then
LogMessage "RSLT", "Verification","Field " + strFieldName + " matching with the expected value. Expected: "+ strExpectedValue &" , Actual: "& strObservedValue, True
verifyField = True
else
LogMessage "WARN", "Verification","Field " + strFieldName + " is showing Value as "+ strObservedValue+ " but the  Expected Value is "+strExpectedValue, False
verifyField = False
End If

End Function

Public Sub  verifyFieldWithProperty(objField, strExpectedValue, strProperty)

Dim strObservedValue
strObservedValue = objField.getROProperty(strProperty)

If  (Cstr(strObservedValue) = strExpectedValue ) Then
LogMessage "RSLT", "Verification","Field " + strFieldName + " Contains the Expected Value "+ strExpectedValue, True
else
LogMessage "RSLT", "Verification","Field " + strFieldName + " is showing Value as "+ strObservedValue+ " but the  Expected Value is "+strExpectedValue, False
End If

End Sub

Public Function  verifyValue(strObservedValue, strExpectedValue, strFieldName)

If  (Trim(strObservedValue) = Trim(strExpectedValue) ) Then
LogMessage "RSLT", "Verification","Field " + strFieldName + " Contains the Expected Value "+ strExpectedValue, True
verifyValue=true
else
LogMessage "WARN", "Verification","Field " + strFieldName + " is showing Value as "+ strObservedValue+ " but the  Expected Value is "+strExpectedValue, False
verifyValue=false
End If

End Function

Public sub waitForPageLoad(wndScreenControl, strScreenName)
WaitForBrowserReady
Dim bLoaded
bLoaded = wndScreenControl.WaitProperty ("visible", True)

If  Not (bLoaded) Then
Err.Raise vbObjectError + 101,"Page Load", strScreenName + " Page Was not Loaded"
'LogMessage "RSLT", "Page Load", strScreenName + " Page Was not Loaded" , False
End If

End Sub

Public sub killBrowsers()
SystemUtil.CloseProcessByName "iexplore.exe"
'Dim intIndex
'Set oDesc=Description.Create
'oDesc("micclass").Value="Browser"
'intIndex=0
'While Browser("micclass:=Browser","index:="&intIndex).exist(0) and intIndex<Desktop.ChildObjects(oDesc).count
'	If instr(1, Browser("micclass:=Browser","index:="&intIndex).getRoProperty("name"),"HP Quality Center 10.00") = 0 Then
'	Browser("micclass:=Browser","index:="&intIndex).Close
'	'SystemUtil.CloseProcessByHwnd( Browser("micclass:=Browser","index:="&intIndex).getRoProperty("hwnd"))
'	else
'	intIndex=intIndex+1
'	End if
'wend
End Sub

Public sub acceptWarningBrowser()
If  Browser("Browser").Window("regexpwndtitle:=.*Web Page Dialog").Exist(2) Then
Browser("Browser").Window("regexpwndtitle:=.*Web Page Dialog").Activate
Browser("Browser").Window("regexpwndtitle:=.*Web Page Dialog").WebButton("name:=Ok").Click			
End If
End Sub

Public sub acceptGenericDialogBox()
If  (Browser("Browser").Dialog("Microsoft Internet Explorer").Exist(2)) Then
'dialogBoxGeneric.Activate
Browser("Browser").Dialog("Microsoft Internet Explorer").Activate
Browser("Browser").Dialog("Microsoft Internet Explorer").WinButton("OK").Click
'dialogBoxGeneric.WinButton("text:=OK").Click
End If
End Sub


Public sub verifyDialogMessage(strExpectedWarningMessage, bDialogDispose)

Dim strObservedErrorMessage

if dialogBoxGeneric.Exist(2) Then
dialogBoxGeneric.Activate			
strObservedErrorMessage  = dialogBoxGeneric.GetVisibleText()
LogMessage "RSLT", "Verification", "Message Box  Text " + strObservedErrorMessage + " Matched", True

If  matchStr(strObservedErrorMessage, strExpectedWarningMessage ) Then
LogMessage "RSLT", "Verification", "Message Box  Text " + strExpectedWarningMessage + " Matched", True
If  (bDialogDispose) Then
Browser("Browser").Dialog("Microsoft Internet Explorer").WinButton("OK").Click
WaitForReady
End If
else
LogMessage "RSLT", "Verification", "Expected Message Box Text Pattern was " + strExpectedWarningMessage + " but Observed Message was "+ strObservedErrorMessage, False
End If

End if

End Sub

' Public Function FindColumn(objTableHeader, strColName)
'	Dim iColNumber
'	iColNumber = 0
'	If ObjTableHeader.Exist(0) Then
'		'	If ObjTableHeader.GetRowWithCellText(strColName) = 1Then
'				For i = 1 to ObjTableHeader.ColumnCount(1) Step 1
'					If Ucase(Trim(strColName)) = Ucase(Trim(ObjTableHeader.GetCellData(1,i))) Then
'						iColNumber = i
'						Exit For
'					End If			
'				Next
'		'	End If
'			FindColumn = iColNumber
'	Else
'			FindColumn = iColNumber '0
'	End If
'
' End Function

'Public Function verifyTableColumnHasData(ObjTableContent,ColNumber,strToSearch,Match)
'			RowCount = ObjTableContent.RowCount
'			
'			'if the string to search is an array. Then  check the indivudual array item exists in the table
'			If IsArray(strToSearch) Then
'				arrSearchStr = strToSearch
'				ReDim Preserve arrSearchStr(UBound(strToSearch))
'			Else
'				ReDim Preserve arrSearchStr(0)
'				arrSearchStr(0) = strToSearch
'			End If
'			
'			If RowCount = 0 Then
'				If TRIM(arrSearchStr(0)) = "" Then
'					LogMessage "RSLT","Verification","As Expected table has zero records",True
'					verifyTableColumnHasData = True
'					Exit Function
'				Else
'					LogMessage "WARN","Verification","Expected records, but table has no records",False
'					verifyTableColumnHasData = False	
'					Exit Function
'				End If
'			ElseIf RowCount > 0 Then
'	
'				Dim blnFound
'				verifyTableColumnHasData = True
'
'				For  i = 0 to Ubound(arrSearchStr) Step 1
'					blnFound = False					
'					For j = 1 to RowCount Step 1
'						strCurCellData = ObjTableContent.GetCellData(j,ColNumber)
'							If Match = "FULL" Then
'									If UCase(Trim(arrSearchStr(i))) = UCase(Trim(strCurCellData)) Then
'											LogMessage "RSLT","Verification","Search data  : - "& arrSearchStr(i) & " displayed in row "&j,True
'											blnFound = True
'											Exit For
'									End If
'							ElseIf Match = "PARTIAL" Then
'									If  InStr(1, UCase(Trim(strCurCellData)), UCase(Trim(arrSearchStr(i))),1)  > 0  Then
'											LogMessage "RSLT","Verification","Search data  : - "& arrSearchStr(i) & " displayed in row "&j,True
'											blnFound = True
'											Exit For
'									End If  
'							End If					
'					Next
'						If blnFound = False Then
'							LogMessage "WARN","Verification","Search data  : - "& arrSearchStr(i) & " not displayed in table",False
'							verifyTableColumnHasData = False
'						End If
'				Next
'			End If
'End Function


'SearchAndOperateInsideTableCell . input parameters should be  FieldObj = Obj of the Table, SearchColumnNumber = column to search for unique value
'SearchValue = value to search, TargetColumnNumber = Target column number, ObjType = Object inside the cell , ActionORValue = Value to search

'Public Function SearchAndOperateInsideTableCell(FieldObj, SearchColumnNumber, SearchValue, TargetColumnNumber, ObjType, ActionORValue)
'	Dim bSearchAndOperateInsideTableCell:bSearchAndOperateInsideTableCell = True
'	Dim tableCellObj, totalRowFound, counter
'	'ReDim totalRowFound(FieldObj.RowCount)
'	totalRowFound = Array()
'	
'	counter = 0
'	
'	'First get all the parameters
'	searchColNumber = SearchColumnNumber
'	searchValue = SearchValue
'	targetCol = TargetColumnNUmber
'	targetObjType = ObjType
'	dataset = ActionORValue
'	
'	'If Column Index is Found, then proceed with searching the search value in the found column
'	For i=1 To FieldObj.RowCount
'		actualValueFoundInTableCell = FieldObj.GetCellData(i,searchColNumber)
'		If Not ( IsNumeric(searchValue) And IsNumeric(actualValueFoundInTableCell)) Then
'			If UCase(Trim(actualValueFoundInTableCell)) = UCase(Trim(searchValue)) Then
'				ReDim totalRowFound(counter): totalRowFound(counter) = i
'				counter=counter+1
'			End If
'		Else
'			If CDbl(Trim(actualValueFoundInTableCell)) = CDbl(Trim(searchValue)) Then
'				ReDim totalRowFound(counter): totalRowFound(counter) = i
'				counter=counter+1
'			End If
'		End If		
'	Next  'Having a array with list of row number has the matching records
'	
'	'If Target Row was not found, then print error and exit
'	If Ubound(totalRowFound) = "-1" Then
'		LogMessage "RSLT","Verification","Search value not found in the table "&searchValue,False
'		SearchAndOperateInsideTableCell = False
'		Exit Function
'	End If
'
'	targetColNumber = CInt(targetCol)
'
'	'If Column Index is Found, then proceed with input, based on the type of the Input Object
'    For i = 0 To Ubound(totalRowFound)
'		Select Case UCase(targetObjType)
'			Case "TEXTBOX"
'				Set tableCellObj = FieldObj.ChildItem(totalRowFound(i),targetColNumber,"WebEdit",0)
'				tableCellObj.Set dataSet
'			Case "BUTTON"
'				Set tableCellObj = FieldObj.ChildItem(totalRowFound(i),targetColNumber,"WebButton",0)
'				tableCellObj.Click
'			Case "WEBLIST"
'				Set tableCellObj = FieldObj.ChildItem(totalRowFound(i),targetColNumber,"WebList",0)
'				tableCellObj.Select dataSet
'			Case "WEBCHECKBOX"
'				Set tableCellObj = FieldObj.ChildItem(totalRowFound(i),targetColNumber,"WebCheckBox",0)
'				tableCellObj.Set UCase(Trim(dataSet))
'			Case "HYPERLINK"
'				Set tableCellObj = FieldObj.ChildItem(totalRowFound(i),targetColNumber,"Link",0)
'				tableCellObj.Click
'			Case "WEBRADIOGROUP"
'				Set tableCellObj = FieldObj.ChildItem(totalRowFound(i),targetColNumber,"WebRadioGroup",0)
'				tableCellObj.Select dataSet
'			Case "IMAGE"
'				Set tableCellObj = FieldObj.ChildItem(totalRowFound(i),targetColNumber,"Image",0)
'				tableCellObj.Click
'			Case "VAADINLINK" 'Custom control, pass the class property
'				Num = FieldObj.ChildItemCount (totalRowFound(i),targetColNumber,"WebElement") 
'					For j = 0 to Num - 1
'						strClassName=FieldObj.ChildItem(totalRowFound(i),targetColNumber, "WebElement", j).getRoProperty("class")
'						If instr (1,strClassName,"v-button-link",0) or instr (1,strClassName,"v-button-text-link",0)Then
'							If (FieldObj.ChildItem (totalRowFound(i),targetColNumber, "WebElement", j).getRoProperty("innertext") =  FieldObj.GetCellData(totalRowFound(i),targetColNumber)) Then
'								FieldObj.ChildItem (totalRowFound(i),targetColNumber, "WebElement", j).click
'								LogMessage "RSLT","Verification","Clicked the Link with value "& FieldObj.GetCellData(totalRowFound(i),targetColNumber) & " in row number :- "& totalRowFound(i) & ", column number :- "&targetColNumber,True
'								Exit For
'							End If
'						End If
'				Next
'					Exit For  'link navigates to next page
'             Case Else
'				 		LogMessage "WARN","Verification","Input parameter: - Object Type name not available. Please check the Called function.. Target Object Type: - "&targetObjType,False
'						SearchAndOperateInsideTableCell = False
'						Exit Function
'		End Select
'	Next	
'	SearchAndOperateInsideTableCell = bSearchAndOperateInsideTableCell
'End Function


Public Function  verifyInnerText(objField, strExpectedValue, strFieldName)
Dim strObservedValue
strObservedValue = objField.GetROProperty("innertext")
'strObservedValue = Replace(strObservedValue,",","")

If  Ucase(Trim(strObservedValue)) = UCase(Trim(strExpectedValue)) Then
LogMessage "RSLT", "Verification","Field " & strFieldName & " matching with the expected value. Expected: "& strExpectedValue &" , Actual: "& strObservedValue, True
verifyInnerText = True
else
LogMessage "WARN", "Verification","Field " & strFieldName & " not matching with the expected value. Expected: "& strExpectedValue &" , Actual: "& strObservedValue, False
verifyInnerText = False
End If
End Function

Public Function  verifyFieldValue(objField, strExpectedValue, strFieldName)
Dim strObservedValue
strObservedValue = objField.GetROProperty("value")

If  Ucase(Trim(strObservedValue)) = UCase(Trim(strExpectedValue)) Then
LogMessage "RSLT", "Verification","Field " & strFieldName & " matching with the expected value. Expected: "& strExpectedValue &" , Actual: "& strObservedValue, True
verifyFieldValue = True
else
LogMessage "WARN", "Verification","Field " & strFieldName & " not matching with the expected value. Expected: "& strExpectedValue &" , Actual: "& strObservedValue, False
verifyFieldValue = False
End If
End Function

Public Function  verifyInnerText_Pattern(objField, strExpectedPattern, strFieldName)
Dim strObservedValue
strObservedValue = objField.GetROProperty("innertext")

If  matchstr(Trim(strObservedValue),strExpectedPattern) Then
LogMessage "RSLT", "Verification","Field " & strFieldName & " matching with the expected value. Expected Pattern: "& strExpectedPattern &" , Actual Value: "& strObservedValue, True
verifyInnerText_Pattern = True
else
LogMessage "WARN", "Verification","Field " & strFieldName & " not matching with the expected value. Expected Pattern: "& strExpectedPattern &" , Actual Value: "& strObservedValue, False
verifyInnerText_Pattern = False
End If
End Function
'SearchColumnNumber is mentioned then code searches for the matching "SearchValue" 
'If the SearchColumnNumber is NULL then Search value must be 1D array of all the data in the column. Irrelevant data column should be provides as NULL

Public Function GetRowNumberArrayFromTable(FieldObj, SearchColumnNumber, SearchValue) 
Dim tableCellObj, totalRowFound, counter, arrRowData

totalRowFound = Array()	
counter = 0

'First get all the parameters
searchColNumber = SearchColumnNumber
searchValue = SearchValue

'If Column Index is Found, then proceed with searching the search value in the found column
If searchColNumber <> NULL Then
If IsArray(searchValue) = False Then
For i=1 To FieldObj.RowCount
actualValueFoundInTableCell = FieldObj.GetCellData(i,searchColNumber)
If Not ( IsNumeric(searchValue) And IsNumeric(actualValueFoundInTableCell)) Then
If UCase(Trim(actualValueFoundInTableCell)) = UCase(Trim(searchValue)) Then
ReDim totalRowFound(counter): totalRowFound(counter) = i
counter=counter+1
End If
Else
If CDbl(Trim(actualValueFoundInTableCell)) = CDbl(Trim(searchValue)) Then
ReDim totalRowFound(counter): totalRowFound(counter) = i
counter=counter+1
End If
End If		
Next  'Having a array with list of row number has the matching records
Else
LogMessage "RSLT","Verification","Search value cannot be array if a specific column to search in mentioend. Verify the screen level functions",False
GetRowNumberArrayFromTable = totalRowFound
Exit Function
End If
Else
'No search column number
If IsArray(searchValue) = True Then
itblRowCount = FieldObj.RowCount
itblColCount = FieldObj.ColumnCount(1)
For i=1 To itblRowCount
arrActRowData = Get1DArrayFromTableRow(FieldObj, i)
strActualRow = ArrayToString(arrActRowData,"|")
strExpectedRow = ArrayToString(searchValue,"|")
If  ArrayCompare(arrActRowData, searchValue)  Then
LogMessage "RSLT","Verification","Search value row found : Expected Account:="& strExpectedRow &" , Actual data:= "&strActualRow&" matched in Row "& i ,True
ReDim totalRowFound(counter): totalRowFound(counter) = i
counter=counter+1
End If		
Next
Else
LogMessage "RSLT","Verification","Search value should be in list of array format as search column number is specified. Verify the screen level functions",False
GetRowNumberArrayFromTable = totalRowFound
Exit Function
End If

End If

'If Target Row was not found, then print error and exit
strExpectedRow = ArrayToString(searchValue,"|")
If Ubound(totalRowFound) = "-1" Then
LogMessage "RSLT","Verification","Search value not found in the table "& strExpectedRow ,False
GetRowNumberArrayFromTable = totalRowFound
Exit Function
End If

GetRowNumberArrayFromTable = totalRowFound

End Function


Public Function Get1DArrayFromTableRow(objWebTable, iRowNum)

Dim iTableRow, iTableColCount, arrRowData
Dim arrTemp()

If objWebTable.Exist(0) Then
iTableRow  = iRowNum

If iTableRow > 0 Then
iTableColCount = objWebTable.ColumnCount(1)
Else
iTableColCount = 0
End If

If (iTableRow) > 0 And (iTableColCount > 0) Then
Redim arrRowData(iTableColCount - 1)
For i = 1 to iTableColCount
ReDim Preserve arrRowData(i - 1)
arrRowData(i - 1) = objWebTable.GetCellData(iTableRow, i)
Next				
Else
LogMessage "INFO", "Table does not have data","Table does not not have any data", True
Get1DArrayFromTableRow = arrTemp  'Blank Array ' No Rows
Exit Function
End If
Else
	LogMessage "RSLT", "Verification","Table object is not available. Error description :- " &  err.description, False
	Exit Function
End If

Get1DArrayFromTableRow = arrRowData
End Function


'******Additional
'//*********** Commented by Manish on 7Dec15 as table functionality changed
'Public function getRecordsCountForColumn(objTableHeader,objTable,strColumnName)
'	intRow=objTable.RowCount
'	'print ("Row"+intRow)
'	intCount=0
'	iBlankRows=0
''	print ("Col " +intColCount)
'	Dim arrColIndex, arrCellVal
'	ReDim arrCellVal (intRow)
''	ReDim arrColIndex(intColCount)
'	For i=1 to intRow
'		'For j=0 to intColCount
'			Dim strColName, strCellVal
'			'strColName=arrColumnName(j)
'			
'				strCellVal=getCellTextFor (objTableHeader,objTable,i,strColumnName)
'				Print "strCellVal: "&strCellVal
'				If isNull(strCellVal) OR strCellVal="" Then
'					iBlankRows=iBlankRows+1
'				else
'				'strCellVal=replace(strCellVal, ",","")
'					intCount=intCount+1
'			'	strCellVal=replace(strCellVal, ",","")
'				print (strCellVal)
'				'arrCellVal(i)=strCellVal
'				End If
'		Print("*******")
'		'Print (arrCellVal(0))
'		'Print (arrValue(0))
'		
'	Next
'	'iRecordCount=UBound(arrCellVal)
'getRecordsCountForColumn=intCount
'End Function
'
'//*********** Commented by Manish on 7Dec15 as table functionality changed
'Public Function getRowForColumns(objTableHeader,objTable,arrColumnName, arrValue)
'	intRow=objTable.RowCount
'	'print ("Row"+intRow)
'	intColCount =UBound(arrColumnName)
''	print ("Col " +intColCount)
'	Dim arrColIndex, arrCellVal
'	ReDim arrCellVal (intColCount)
'	ReDim arrColIndex(intColCount)
'	For i=1 to intRow
'		For j=0 to intColCount
'			Dim strColName, strCellVal
'			strColName=arrColumnName(j)
'			If not isEmpty(strColName) Then
'					strCellVal=getCellTextFor (objTableHeader,objTable,i,strColName)
'					If isNull(arrValue(j)) Then
'					strCellVal=Null
'					else
'					'strCellVal=replace(strCellVal, ",","")
'					End If
'				'	strCellVal=replace(strCellVal, ",","")
'					print (strCellVal)
'					strCellVal=Replace(strCellVal,"(","")
'					strCellVal=Replace(strCellVal,")","")
'					arrCellVal(j)=strCellVal
'					'********
'					If (strCellVal="undefined") OR isnull(strCellVal) Then
'						getRowForColumns=-1
'						Exit Function
'					End If
'					'**********
'			End If
'		Next
'		Print("*******")
'		Print (arrCellVal(0))
'		Print (arrValue(0))
'		If compareArray(arrValue,arrCellVal) Then
'			getRowForColumns=i
'			Exit Function
'		End If
'	Next
'	getRowForColumns=-1
'End Function
'//*********** Commented by Manish on 7Dec15 as table functionality changed
'Public Function getCellObject(objTableHeader,objTable,intRow, strColName, strMicclass)
'	Dim intCol
'	intCol=getColIndex (objTableHeader ,strColName)
'	set getCellObject=objTable.ChildItem(intRow,intCol,strMicclass,0)
'
'End Function
'
'//*********** Commented by Manish on 7Dec15 as table functionality changed
'Public Function getCellTextFor(objTableHeader,objTable,intRow, strColName)
'	Dim intCol
'	intCol=getColIndex (objTableHeader ,strColName)
'	 getCellTextFor=objTable.GetCellData(intRow,intCol)
'
'End Function
'
'//*********** Commented by Manish on 7Dec15 as table functionality changed
'Public Function getColIndex(objTable,strColName)
'		Dim intCol
'		Dim arrCols
'		intCol=objTable.ColumnCount(1)
'		ReDim arrCols(intCol)
'		For i=1 to intCol
'			Dim strColHeader
'			
'			strColHeader=objTable.GetCellData(1,i)
'			If Trim(strColHeader)=Trim(strColName) Then
'				getColIndex=i
'				Exit Function
'			end if 
'		Next
'
'End Function

'//*********** Commented by Manish on 7Dec15 as table functionality changed
'Public Function getRowForColumns_tblwithScroll(objTableHeader,objTable,arrColumnName, arrValue,iMaxReload)
'	intRow=objTable.RowCount
'	'print ("Row"+intRow)
'	intColCount =UBound(arrColumnName)
''	print ("Col " +intColCount)
'	iReload=0
'	Dim arrColIndex, arrCellVal,arrTempCellVal
'	ReDim arrCellVal (intColCount)
'	ReDim arrColIndex(intColCount)
'	ReDim arrTempCellVal (intColCount)
'	For i=1 to intRow
'		'******************
'			If i=intRow Then
'				If iReload=iMaxReload Then
'					getRowForColumns_tblwithScroll=-1
'					Exit function
'                    'LogMessage "WARN","Verification","Expected data "&ArrayToString(arrValue)& " for repective columns "&ArrayToString(arrColumnName)&" not found in table",False
'				End If
'				For iTemp=0 to intColCount
'
'					Set tempCell=objTable.ChildItem(i,0,"WebElement",0)
'					strColName=arrColumnName(iTemp)
'					strtempCellVal=getCellTextFor (objTableHeader,objTable,i,strColName)
'						If isNull(arrValue(iTemp)) Then
'						strtempCellVal=Null
'						else
'						strtempCellVal=replace(strtempCellVal, ",","")
'						End If
'					'	strCellVal=replace(strCellVal, ",","")
'						print ("Row is "&i& " val is "&strtempCellVal)
'						If  strtempCellVal=""Then
'								strtempCellVal="NULL"
'						End If
'						arrTempCellVal(iTemp)=strtempCellVal
'				Next
'				If compareArray(arrValue,arrTempCellVal) Then
'					getRowForColumns_tblwithScroll=i
'					Exit Function
'				else
'					tempCell.Click
'					wait 1
'					intRow=objTable.RowCount
'					print ("New Row Count is "&intRow)
'					i=1
'				End If
'				iReload=iReload+1
'			End If
'			'***********************
'		For j=0 to intColCount
'			Dim strColName, strCellVal
'			strColName=arrColumnName(j)
'			
'				strCellVal=getCellTextFor (objTableHeader,objTable,i,strColName)
'				If isNull(arrValue(j)) Then
'				strCellVal=Null
'				else
'				strCellVal=replace(strCellVal, ",","")
'				End If
'			'	strCellVal=replace(strCellVal, ",","")
'				print (strCellVal)
'				If  strCellVal=""Then
'						strCellVal="NULL"
'				End If
'				arrCellVal(j)=strCellVal
'				'********
'					
'				'************
'				If (strCellVal="undefined") OR isnull(strCellVal) Then
'					getRowForColumns=-1
'					Exit Function
'				End If
'				'**********
'		Next
'		Print("*******")
'		Print (arrCellVal(0))
'		Print (arrValue(0))
'	
'		If compareArray(arrValue,arrCellVal) Then
'			getRowForColumns_tblwithScroll=i
'			Exit Function
'		End If
'	Next
'	getRowForColumns_tblwithScroll=-1
'End Function
'

'Public Function getRowForColumn_Pagination(tblHeader,tblContent,lstRowData,strTableName,bPagination,objNext,objNext1,objPrevious)
'	Dim bVerifyData,arrColumns,arrValues,intSize
'	intSize=Ubound(lstRowData)
'	'arrTemp=arrPlanData(iRowCount)
'	ReDim arrColumns(intSize)
'	ReDim arrValues(intSize)
'	For iCount=0 to intSize
'		If not lstRowData(iCount)="" Then
'				arrTemp=Split(lstRowData(iCount),":")
'				arrColumns(iCount)=arrTemp(0)
'				strTemp=checkNull(arrTemp(1))
'	'					strTemp=Replace(strTemp,"(","")
'	'					strTemp=Replace(strTemp,")","")
'			arrValues(iCount)=strTemp
'		End If
'	Next
'	If bPagination Then
'		Do 
'				tblContent.RefreshObject
'				intRow=	getRowForColumns (tblHeader,tblContent,arrColumns, arrValues)
'			If not intRow=-1 Then
'				Exit Do
'			End If
'			bNextEnabled =matchStr(objNext1.GetROProperty("outerhtml"),"v-disabled")
'
'					If Not bNextEnabled Then
'						objNext.Click
'						intTablePage=intTablePage+1
'						WaitForICallLoading
'					End If
'			Loop while Not  bNextEnabled
'	else
'			intRow=	getRowForColumns (tblHeader,tblContent,arrColumns, arrValues)
'	End If
'
'
'	If intRow =-1  Then
'			LogMessage "WARN","Verification","Expected "& strTableName &" Data "&ArrayToString(arrValues,",")&" for respective column Names "&ArrayToString(arrColumns,",")&" not found in  "& strTableName &" table",false				
'		else
'				LogMessage "RSLT","Verification","Expected  "& strTableName &" Data "&ArrayToString(arrValues,",")&" for respective column Names "&ArrayToString(arrColumns,",")&" found in "& strTableName &" table at Row "&intRow&" on table page number"&intTablePage,true					
'	End If
'	getRowForColumn_Pagination=intRow
'
'	   If bPagination Then
'		 For i=0 to intTablePage
'				objPrevious.Click
'				WaitForIcallLoading
'		 Next
'	End If
'End Function


'Public Function clickVaddinLink_tblCell(objTableHeader,objTable,intRow, strColName)
'	Dim intCol
'	intCol=getColIndex (objTableHeader ,strColName)
'	'Set objCellItems=objTable.ChildItem(intRow,intCol,"WebElement")
'	iObjCount=objTable.ChildItemCount(intRow,intCol,"WebElement")
'	For j = 0 to iObjCount - 1
'		strClassName=objTable.ChildItem(intRow,intCol, "WebElement", j).getRoProperty("class")
'		If instr (1,strClassName,"v-button-link",0) or instr (1,strClassName,"v-button-text-link",0)Then
'			If (objTable.ChildItem(intRow,intCol, "WebElement", j).getRoProperty("innertext") =  objTable.GetCellData(intRow,intCol)) Then
'				'Check the link enabled or disabled
'				bDisabled =matchStr(objTable.ChildItem(intRow,intCol, "WebElement", j).GetROProperty("outerhtml"),"v-disabled")
'
'				If bDisabled Then
'					LogMessage "WARN","Verification","Link is disabled.",True
'				Else
'					LogMessage "INFO","Verification","Link is enabled.",True	
'					objTable.ChildItem(intRow,intCol, "WebElement", j).click
'					LogMessage "RSLT","Verification","Clicked the Link with value "& objTable.GetCellData(intRow,intCol) & " in row number :- "& intRow & ", column number :- "&intCol,True
'				End If
'				Exit For
'			End If
'		End If
'	Next
'End Function

Public Function getVaddinLink_tblCell(objTableHeader,objTable,intRow, strColName)
Dim intCol
intCol=getColIndex (objTableHeader ,strColName)
'Set objCellItems=objTable.ChildItem(intRow,intCol,"WebElement")
iObjCount=objTable.ChildItemCount(intRow,intCol,"WebElement")
For j = 0 to iObjCount - 1
strClassName=objTable.ChildItem(intRow,intCol, "WebElement", j).getRoProperty("class")
If instr (1,strClassName,"v-button-link",0) or instr (1,strClassName,"v-button-text-link",0)Then
	If (objTable.ChildItem(intRow,intCol, "WebElement", j).getRoProperty("innertext") =  objTable.GetCellData(intRow,intCol)) Then
	'Check the link enabled or disabled
	getVaddinLink_tblCell=objTable.GetCellData(intRow,intCol)
	Exit Function
	End If
End If
Next
getVaddinLink_tblCell=null
End Function
'Check Checbox in table Cell
Public Function clickVaddinCheckBox_tblCell(objTableHeader,objTable,intRow, strColName)
Dim intCol
intCol=getColIndex (objTableHeader ,strColName)
'Set objCellItems=objTable.ChildItem(intRow,intCol,"WebElement")
iObjCount=objTable.ChildItemCount(intRow,intCol,"WebElement")
	For j = 0 to iObjCount - 1
	strClassName=objTable.ChildItem(intRow,intCol, "WebElement", j).getRoProperty("class")
		If instr (1,strClassName,"v-checkbox v-widget",0) Then
	'
		'Check the link enabled or disabled
		bDisabled =matchStr(objTable.ChildItem(intRow,intCol, "WebElement", j).GetROProperty("outerhtml"),"disabled")
		
			If bDisabled Then
			LogMessage "WARN","Verification","CheckBox is disabled in Row Number "&intRow,True
			Else
			LogMessage "INFO","Verification","CheckBox is enabled in Row Number"&intRow,True
			Set oDesc=Description.Create
			oDesc("micclass").Value = "WebCheckBox"
			'oDesc("class").Value = "v-filterselect-button"
			set chkObj=objTable.ChildItem(intRow,intCol, "WebElement", j).ChildObjects(oDesc)	
			chkObj(0).click
			set oDesc=nothing
			LogMessage "RSLT","Verification","Clicked the Check box  in row number :- "& intRow & ", column number :- "&intCol,True
			End If
	Exit For
	
		End If
	Next
End Function
''Get Checbox in table Cell enabled or disabled
'Public Function getCheckBoxStatusEnabled_tblCell(objTableHeader,objTable,intRow, strColName)
'	Dim intCol, strChkStatus
'	strChkStatus="ENABLED"
'	intCol=getColIndex (objTableHeader ,strColName)
'	'Set objCellItems=objTable.ChildItem(intRow,intCol,"WebElement")
'	iObjCount=objTable.ChildItemCount(intRow,intCol,"WebElement")
'	For j = 0 to iObjCount - 1
'		strClassName=objTable.ChildItem(intRow,intCol, "WebElement", j).getRoProperty("class")
'		If instr (1,strClassName,"v-checkbox v-widget",0) or  instr (1,strClassName,"v-checkbox-disabled v-widget",0)Then
'			'
'				'Check the link enabled or disabled
'				bDisabled =matchStr(objTable.ChildItem(intRow,intCol, "WebElement", j).GetROProperty("outerhtml"),"disabled")
'
'				If bDisabled Then
'					LogMessage "WARN","Verification","CheckBox is disabled in Row Number "&intRow,True
'					strChkStatus="DISABLED"
'				Else
'					LogMessage "INFO","Verification","CheckBox is enabled in Row Number"&intRow,True	
'					strChkStatus="ENABLED"
'				End If
'				Exit For
'			
'		End If
'	Next
'
'	getCheckBoxStatusEnabled_tblCell=strChkStatus
'End Function

Public Function CheckVaadinLink_Disabled(objLink, strLinkStatus)
bDisabled =matchStr(objLink.GetROProperty("outerhtml"),"v-disabled")
If Ucase(Trim(strLinkStatus)) = "ENABLED" Then
If bDisabled Then
'Fail
LogMessage "WARN","Verification","Link is disabled. Expected should be enabled",False
CheckVaadinLink_Disabled = False
Else
'Pass
LogMessage "RSLT","Verification","Llink is enabled as expected",True
CheckVaadinLink_Disabled = True						
End If
ElseIf Ucase(Trim(strLinkStatus)) = "DISABLED" Then
If bDisabled Then
'Pass
LogMessage "RSLT","Verification","Link is disabled as expected",True
CheckVaadinLink_Disabled = True
Else
'Fail
LogMessage "WARN","Verification","Link is enabled. Expected should be disabeld",False
CheckVaadinLink_Disabled = False
End If	
End If
End Function

Public Function CheckVaadinObject_Disabled(objObject, strObjectStatus)
bDisabled =matchStr(objObject.GetROProperty("outerhtml"),"v-disabled")
If Ucase(Trim(strObjectStatus)) = "ENABLED" Then
If bDisabled Then
'Fail
LogMessage "WARN","Verification","Object is disabled. Expected should be enabled",False
CheckVaadinObject_Disabled = False
Else
'Pass
LogMessage "RSLT","Verification","Object is enabled as expected",True
CheckVaadinObject_Disabled = True						
End If
ElseIf Ucase(Trim(strObjectStatus)) = "DISABLED" Then
If bDisabled Then
'Pass
LogMessage "RSLT","Verification","Object is disabled as expected",True
CheckVaadinObject_Disabled = True
Else
'Fail
LogMessage "WARN","Verification","Object is enabled. Expected should be disabeld",False
CheckVaadinObject_Disabled = False
End If	
End If
End Function

'*****************Added by Kalyan 9122016**********************************************************

Public Function CheckVaadinObject_Disabled1(objObject, strObjectStatus)
'bDisabled =matchStr(objObject.GetROProperty("outerhtml"),"v-disabled")
bDisabled =matchStr(objObject.GetROProperty("disabled"),1)
'bDisabled =instr(objObject.GetROProperty("outerhtml"),"disabled")
If Ucase(Trim(strObjectStatus)) = "ENABLED" Then
If bDisabled Then
'Fail
LogMessage "WARN","Verification","Object is disabled. Expected should be enabled",False
CheckVaadinObject_Disabled1 = False
Else
'Pass
LogMessage "RSLT","Verification","Object is enabled as expected",True
CheckVaadinObject_Disabled1 = True						
End If
ElseIf Ucase(Trim(strObjectStatus)) = "DISABLED" Then
If bDisabled Then
'Pass
LogMessage "RSLT","Verification","Object is disabled as expected",True
CheckVaadinObject_Disabled1 = True
Else
'Fail
LogMessage "WARN","Verification","Object is enabled. Expected should be disabeld",False
CheckVaadinObject_Disabled1 = False
End If	
End If
End Function

Public Function CheckVaadinObject_Disabled2(objObject, strObjectStatus)
bDisabled =matchStr(objObject.GetROProperty("outerhtml"),"disabled")
If Ucase(Trim(strObjectStatus)) = "ENABLED" Then
If bDisabled Then
'Fail
LogMessage "WARN","Verification","Object is disabled. Expected should be enabled",False
CheckVaadinObject_Disabled2 = False
Else
'Pass
LogMessage "RSLT","Verification","Object is enabled as expected",True
CheckVaadinObject_Disabled2 = True						
End If
ElseIf Ucase(Trim(strObjectStatus)) = "DISABLED" Then
If bDisabled Then
'Pass
LogMessage "RSLT","Verification","Object is disabled as expected",True
CheckVaadinObject_Disabled2 = True
Else
'Fail
LogMessage "WARN","Verification","Object is enabled. Expected should be disabeld",False
CheckVaadinObject_Disabled2 = False
End If	
End If
End Function

'********************************************************End of Common  GUI Functions '*********************************************************************************************

'**********************************************************************************************************************************************
Public Function getRowCount(objContentTbl)
'Dim getRowCount
Set odesc_AllRows=Description.Create
odesc_AllRows("xpath").value=".//div[contains(@class,'dt-row ng-scope')]"
'Modified by  due to Uft Issue
'odesc_AllRows("class").value="dt-row ng-scope.*"

set allRowList=objContentTbl.ChildObjects(odesc_AllRows)	
Set getRowCount=allRowList.Count
End Function

Public Function getRowCount_withAllCellObj(objAllRowList)
Set getRowCount_withAllCellObj=allRowList.Count
End Function

'************* Have to use this when cell class is not stable
'Public Function getAllRows(objContentTbl, strRowXpath) 'Content Table(div) obj and xpath for rows e.g.//div[contains(@class,'dt-row ng-scope dt-row-odd')]"
'	Set odesc_AllRows=Description.Create
'	odesc_AllRows("xpath").value=strRowXpath
'	Set getAllRows=objContentTbl.ChildObjects(odesc_AllRows)
'End Function

Public Function getAllRows(objContentTable) 'Content Table(div) obj and xpath for rows e.g.//div[contains(@class,'dt-row ng-scope dt-row-odd')]"
Set odesc_AllRows=Description.Create
'odesc_AllRows("xpath").value="//*[contains(@class,'dt-row ng-scope dt-row-odd')]"
'odesc_AllRows("xpath").value=".//*[contains(@class,'dt-row dt-body-row')]"
'Modified by  due to Uft Issue
odesc_AllRows("class").value = "dt-row dt-body-row.*"

Set getAllRows= objContentTable.ChildObjects(odesc_AllRows)
End Function
'Public Function getColumnCount
'	
'End Function
'
Public function getRecordsCountForColumn(objTableHeader,objContentTbl,strColumnName)
'	Public function getRecordsCountForColumn(objTableHeader,objContentTbl,strRowXpath,strColumnName) '  when class in inconsistent
'	Set objAllRows=getAllRows(objContentTbl, strRowXpath) 'use this if xpath for row varies
Set objAllRows=getAllRows(objContentTbl)

intRow=objAllRows.Count   
'print ("Row"+intRow)
intCount=0
iBlankRows=0
'	print ("Col " +intColCount)
Dim arrColIndex, arrCellVal
ReDim arrCellVal (intRow)
'	ReDim arrColIndex(intColCount)
For i=0 to intRow-1
'For j=0 to intColCount
Dim strColName, strCellVal
'strColName=arrColumnName(j)
'Commented by  26/dec/16 as the value always return the first value
'strCellVal=getCellTextFor(objTableHeader,objContentTbl,i,strColumnName)
strCellVal=getCellTextFor(objTableHeader,objAllRows(i),i,strColName)
Print "strCellVal: "&strCellVal
If isNull(strCellVal) OR strCellVal="" Then
iBlankRows=iBlankRows+1
else
'strCellVal=replace(strCellVal, ",","")
intCount=intCount+1
'	strCellVal=replace(strCellVal, ",","")
print (strCellVal)
'arrCellVal(i)=strCellVal
End If
Print("*******")
'Print (arrCellVal(0))
'Print (arrValue(0))

Next
'iRecordCount=UBound(arrCellVal)
getRecordsCountForColumn=intCount
End Function

Public Function getRowForColumns(objTableHeader,objContentTable,arrColumnName, arrValue)
Set objAllRows=getAllRows(objContentTable)
intRow=objAllRows.Count   
'print ("Row"+intRow)
'Set odesc_Cell=Description.Create
'odesc_Cell("xpath").value="//div[@class='dt-cell-content']"
'Set allCellInRow=objContentTable.childObjects(odesc_Cell)
'intRowCell=allCellInRow.Count

intColCount =UBound(arrColumnName)
'	print ("Col " +intColCount)
Dim arrColIndex, arrCellVal
ReDim arrCellVal (intColCount)
ReDim arrColIndex(intColCount)
For i=0 to intRow-1
'For i=0 to intRowCell
For j=0 to intColCount
'For j=0 to intColCount-1
Dim strColName, strCellVal
strColName=arrColumnName(j)
If not isEmpty(strColName) Then
	'strCellVal=getCellTextFor (objTableHeader,objContentTable,i,strColName)
	strCellVal=getCellTextFor (objTableHeader,objAllRows(i),i,strColName)
	If isNull(arrValue(j)) Then
	strCellVal=Null
	else
	'strCellVal=replace(strCellVal, ",","")
	End If
'	strCellVal=replace(strCellVal, ",","")
	print Vbtab & vbtab & strCellVal
	strCellVal=Replace(strCellVal,"(","")
	strCellVal=Replace(strCellVal,")","")
		'*************Added by kalyan 03112016 **********************
	'strCellVal=Replace(strCellVal,":","")
	arrCellVal(j)=strCellVal
'********
	If (strCellVal="undefined") OR isnull(strCellVal) Then
	getRowForColumns=-1
	Exit Function
	End If
'**********
End If
	Next
	Print(Vbtab & vbtab &"*******")
	Print (Vbtab & vbtab &arrCellVal(0))
	Print (Vbtab & vbtab &arrValue(0))
	If compareArray(arrValue,arrCellVal) Then
	getRowForColumns=i
	Exit Function
	End If
Next
getRowForColumns=-1
End Function

Public Function getCellObject(objTableHeader,objContentTbl,intRow, strColName, strMicclass)
Dim intCol
intCol=getColIndex(objTableHeader ,strColName)
Set allRowsObj=getAllRows(objContentTbl)
Set objRow=allRowsObj(intRow)
Set odesc_Cell=Description.Create
odesc_Cell("xpath").value=".//*[contains(@class,'dt-cell-content')]"
'Modified by  due to Uft Issue
'odesc_Cell("class").value="dt-cell-content"

'get all cell object for row
Set allCellInRow=objRow.childObjects(odesc_Cell)
'		allCellInrow get text for indexarray
Set odesc_CellObj=Description.Create
'odesc_CellObj("micclass").value=strMicclass
'odesc_CellObj("xpath").value="//*[@class='"&strMicclass&"']"
'Modified by  due to Uft Issue
odesc_CellObj("xpath").value=".//*[contains(@class,'"&strMicclass&"')]"
'odesc_Cell("class").value= "&strMicclass&"

'odesc_CellObj("class").value="&strMicclass&"
'odesc_CellObj("class").value=strMicclass
'odesc_CellObj("class").value="dt-link-col"
'odesc_CellObj("xpath").value="//*[contains(@class,'dt-link-col')]"		
Set getCellObject=allCellInRow(intCol).childObjects(odesc_CellObj)
End Function

Public Function getCellObject_Checkbox(objTableHeader,objContentTbl,intRow, strColName, strMicclass)
Dim intCol
intCol=getColIndex(objTableHeader ,strColName)
Set allRowsObj=getAllRows(objContentTbl)
Set objRow=allRowsObj(intRow)
Set odesc_Cell=Description.Create

'Modified by  due to Uft Issue
odesc_Cell("xpath").value=".//*[contains(@class,'dt-cell ng-scope.*')]" 
'odesc_Cell("class").value="dt-cell ng-scope.*"

Set allCellInRow1=objRow.childObjects(odesc_Cell)

'Set odesc_Cell1=Description.Create
'odesc_Cell1("xpath").value="//div[@class='dt-checkbox ng-scope']"
'get all cell object for row
'Set allCellInRow=allCellInRow1.childObjects(odesc_Cell1)

'	allCellInrow get text for indexarray
Set odesc_CellObj=Description.Create
'odesc_CellObj("micclass").value=strMicclass
'odesc_CellObj("xpath").value="//*[@class='"&strMicclass&"']"

'Modified by  due to Uft Issue
odesc_CellObj("xpath").value=".//*[contains(@class,'"&strMicclass&"')]"	
'odesc_Cell("class").value="&strMicclass&"

'odesc_CellObj("class").value=strMicclass
'odesc_CellObj("class").value="dt-link-col"
Set getCellObject_Checkbox=allCellInRow1(intCol).childObjects(odesc_CellObj)
End Function

Public Function getCellTextFor(objTableHeader,objRow,intRow, strColName)
Dim intCol
intCol=getColIndex (objTableHeader,strColName)
'Set allRowsObj=getAllRows(objRow)
'set objRow=allRowsObj(intRow)

Set odesc_Cell=Description.Create
'odesc_Cell("class").value="dt-cell-content"
odesc_Cell("xpath").value=".//*[contains(@class,'dt-cell-content')]"

'get all cell object for row
Set allCellInRow=objRow.childObjects(odesc_Cell)

'allCellInrow get text for indexarray
getCellTextFor=allCellInRow(intCol).getRoProperty("innerText")
End Function

'gets column index
Public Function getColIndex(objHeaderTable,strColName)
Dim intCol
Dim arrCols

Set odesc_colHeaderCell=Description.Create
'xpath may vary. If this varies then put it as variable

' Changing the Xpath to Class - Modified by  
odesc_colHeaderCell("xpath").value = ".//div[contains(@class,'dt-header-cell ng-scope')]" 
'odesc_colHeaderCell("class").value = "dt-header-cell-label" 

'odesc_colHeaderCell("xpath").value = "//md-tabs[contains(@md-selected,'$root.$tabs.selectedIndex')]/md-tabs-content-wrapper/md-tab-content[contains(@class,'md-active')]//div[contains(@class,'dt-header ng-scope')]"
'odesc_colHeaderCell("xpath").value = "//*[@class='dt-header-cell-label']"
'odesc_colHeaderCell("xpath").value = "//md-tabs[contains(@md-selected,'$root.$tabs.selectedIndex')]/md-tabs-content-wrapper/md-tab-content[contains(@class,'md-active')]//div[contains(@class,'dt-header-cell-label')]"	
Set tableColumnsObj = objHeaderTable.ChildObjects(odesc_colHeaderCell)	
intCol=tableColumnsObj.Count

ReDim arrCols(intCol)
For i=0 to intCol-1
Dim strColHeader
'strColHeader=tableColumnsObj.GetROProperty("innertext")
strColHeader=tableColumnsObj(i).GetROProperty("innertext")
'strColHeaderHeight=tableColumnsObj(i).GetROProperty("height")
'If strColHeaderHeight <> "0" Then
If Trim(strColHeader)=Trim(strColName) Then
getColIndex=i
Exit Function
'End if 
End If

Next
End Function

Public Function getRowForColumns_tblwithScroll(objTableHeader,objContentTable,arrColumnName, arrValue,iMaxReload)
Set objAllRows=getAllRows(objContentTable)
intRow=objAllRows.Count 
'print ("Row"+intRow)
intColCount =UBound(arrColumnName)
'	print ("Col " +intColCount)
iReload=0
Dim arrColIndex, arrCellVal,arrTempCellVal
ReDim arrCellVal (intColCount)
ReDim arrColIndex(intColCount)
ReDim arrTempCellVal (intColCount)
For i=0 to intRow
'******************
If i=intRow Then
If iReload=iMaxReload Then
getRowForColumns_tblwithScroll=-1
Exit function
'LogMessage "WARN","Verification","Expected data "&ArrayToString(arrValue)& " for repective columns "&ArrayToString(arrColumnName)&" not found in table",False
End If
For iTemp=0 to intColCount
objAllRows(i)
Set odesc_Cell=Description.Create
'Modified due to UFT Issue - 
odesc_Cell("xpath").value=".//*[contains(@class,'dt-cell-content')]"
'odesc_Cell("class").value="dt-cell-content"
'get all cell object for row
Set tempCell=objRow.childObjects(odesc_Cell)(0)
strColName=arrColumnName(iTemp)
strtempCellVal=getCellTextFor(objTableHeader,objAllRows(i),i,strColName)
If isNull(arrValue(iTemp)) Then
strtempCellVal=Null
else
strtempCellVal=replace(strtempCellVal, ",","")
End If
'	strCellVal=replace(strCellVal, ",","")
print ("Row is "&i& " val is "&strtempCellVal)
If  strtempCellVal=""Then
strtempCellVal="NULL"
End If
arrTempCellVal(iTemp)=strtempCellVal
Next
If compareArray(arrValue,arrTempCellVal) Then
getRowForColumns_tblwithScroll=i
Exit Function
else
tempCell.Click
wait 1
Set objAllRows=getAllRows(objContentTable) ''If error comes remove Set
intRow=objAllRows.RowCount
print ("New Row Count is "&intRow)
i=1
End If
iReload=iReload+1
End If
'***********************
For j=0 to intColCount
Dim strColName, strCellVal
strColName=arrColumnName(j)
'strCellVal=getCellTextFor (objTableHeader,objContentTable,i,strColName)
strCellVal=getCellTextFor (objTableHeader,objAllRows(i),i,strColName)
If isNull(arrValue(j)) Then
strCellVal=Null
else
strCellVal=replace(strCellVal, ",","")
End If
'	strCellVal=replace(strCellVal, ",","")
print (strCellVal)
If  strCellVal=""Then
strCellVal="NULL"
End If
arrCellVal(j)=strCellVal
'********

'************
If (strCellVal="undefined") OR isnull(strCellVal) Then
getRowForColumns=-1
Exit Function
End If
'**********
Next
Print("*******")
Print (arrCellVal(0))
Print (arrValue(0))

If compareArray(arrValue,arrCellVal) Then
getRowForColumns_tblwithScroll=i
Exit Function
End If
Next
getRowForColumns_tblwithScroll=-1
End Function

Public Function getRowForColumn_Pagination(tblHeader,tblContent,lstRowData,strTableName,bPagination,objNext,objNext1,objPrevious)
Dim bVerifyData,arrColumns,arrValues,intSize
intSize=Ubound(lstRowData)
'arrTemp=arrPlanData(iRowCount)
ReDim arrColumns(intSize)
ReDim arrValues(intSize)
For iCount=0 to intSize
If not lstRowData(iCount)="" Then
arrTemp=Split(lstRowData(iCount),":")
arrColumns(iCount)=arrTemp(0)
strTemp=checkNull(arrTemp(1))
'					strTemp=Replace(strTemp,"(","")
'					strTemp=Replace(strTemp,")","")
arrValues(iCount)=strTemp
End If
Next
If bPagination Then
Do 
tblContent.RefreshObject
intRow=getRowForColumns (tblHeader,tblContent,arrColumns, arrValues)
If not intRow=-1 Then
Exit Do
End If
bNextEnabled =matchStr(objNext1.GetROProperty("outerhtml"),"v-disabled")

If Not bNextEnabled Then
objNext.Click
intTablePage=intTablePage+1
WaitForICallLoading
End If
Loop while Not  bNextEnabled
else
intRow=	getRowForColumns (tblHeader,tblContent,arrColumns, arrValues)
End If


If intRow =-1  Then
LogMessage "WARN","Verification","Expected "& strTableName &" Data "&ArrayToString(arrValues,",")&" for respective column Names "&ArrayToString(arrColumns,",")&" not found in  "& strTableName &" table",false				
else
LogMessage "RSLT","Verification","Expected  "& strTableName &" Data "&ArrayToString(arrValues,",")&" for respective column Names "&ArrayToString(arrColumns,",")&" found in "& strTableName &" table at Row "&intRow&" on table page number"&intTablePage,true					
End If
getRowForColumn_Pagination=intRow

If bPagination Then
For i=0 to intTablePage
objPrevious.Click
WaitForIcallLoading
Next
End If
End Function

Public Function FindColumn(objHeaderTable,strColName)
Dim intCol
Dim arrCols		
Set odesc_colHeaderCell=Description.Create
''xpath may vary. If this varies then put it as variable
'Modified due to UFT Issue - 
odesc_colHeaderCell("xpath").value="//div[contains(@class,'dt-header-cell ng-scope')]" 
'odesc_colHeaderCell("class").value="dt-header-cell ng-scope.*"
Set tableColumnsObj=objHeaderTable.ChildObjects(odesc_colHeaderCell)
'intCol=tableColumns.Count		
intCol=tableColumnsObj.Count
ReDim arrCols(intCol)
For i=0 to intCol-1		
Dim strColHeader
'strColHeader=tableColumnsObj.GetROProperty("innertext")
strColHeader=tableColumnsObj(i).GetROProperty("innertext")
	If Trim(strColHeader)=Trim(strColName) Then
	FindColumn=i
	Exit Function
	end if 
Next
End Function

Public Function SearchAndOperateInsideTableCell(FieldObj, SearchColumnNumber, SearchValue, TargetColumnNumber, ObjType, ActionORValue)
Dim bSearchAndOperateInsideTableCell:bSearchAndOperateInsideTableCell = True
Dim tableCellObj, totalRowFound, counter
'ReDim totalRowFound(FieldObj.RowCount)
totalRowFound = Array()

counter = 0

'First get all the parameters
searchColNumber = SearchColumnNumber
searchValue = SearchValue
targetCol = TargetColumnNUmber
targetObjType = ObjType
dataset = ActionORValue

'If Column Index is Found, then proceed with searching the search value in the found column
Set objAllRows=getAllRows(FieldObj)	
intRow=objAllRows.Count 

For i=0 To objAllRows.Count 
actualValueFoundInTableCell = FieldObj.GetCellData(i,searchColNumber)
If Not ( IsNumeric(searchValue) And IsNumeric(actualValueFoundInTableCell)) Then
If UCase(Trim(actualValueFoundInTableCell)) = UCase(Trim(searchValue)) Then
ReDim totalRowFound(counter): totalRowFound(counter) = i
counter=counter+1
End If
Else
If CDbl(Trim(actualValueFoundInTableCell)) = CDbl(Trim(searchValue)) Then
ReDim totalRowFound(counter): totalRowFound(counter) = i
counter=counter+1
End If
End If		
Next  'Having a array with list of row number has the matching records

'If Target Row was not found, then print error and exit
If Ubound(totalRowFound) = "-1" Then
LogMessage "RSLT","Verification","Search value not found in the table "&searchValue,False
SearchAndOperateInsideTableCell = False
Exit Function
End If

targetColNumber = CInt(targetCol)

'If Column Index is Found, then proceed with input, based on the type of the Input Object
For i = 0 To Ubound(totalRowFound)
Select Case UCase(targetObjType)
Case "TEXTBOX"
Set tableCellObj = FieldObj.ChildItem(totalRowFound(i),targetColNumber,"WebEdit",0)
tableCellObj.Set dataSet
Case "BUTTON"
Set tableCellObj = FieldObj.ChildItem(totalRowFound(i),targetColNumber,"WebButton",0)
tableCellObj.Click
Case "WEBLIST"
Set tableCellObj = FieldObj.ChildItem(totalRowFound(i),targetColNumber,"WebList",0)
tableCellObj.Select dataSet
Case "WEBCHECKBOX"
Set tableCellObj = FieldObj.ChildItem(totalRowFound(i),targetColNumber,"WebCheckBox",0)
tableCellObj.Set UCase(Trim(dataSet))
Case "HYPERLINK"
Set tableCellObj = FieldObj.ChildItem(totalRowFound(i),targetColNumber,"Link",0)
tableCellObj.Click
Case "WEBRADIOGROUP"
Set tableCellObj = FieldObj.ChildItem(totalRowFound(i),targetColNumber,"WebRadioGroup",0)
tableCellObj.Select dataSet
Case "IMAGE"
Set tableCellObj = FieldObj.ChildItem(totalRowFound(i),targetColNumber,"Image",0)
tableCellObj.Click
Case "VAADINLINK" 'Custom control, pass the class property
Num = FieldObj.ChildItemCount (totalRowFound(i),targetColNumber,"WebElement") 
For j = 0 to Num - 1
strClassName=FieldObj.ChildItem(totalRowFound(i),targetColNumber, "WebElement", j).getRoProperty("class")
If instr (1,strClassName,"v-button-link",0) or instr (1,strClassName,"v-button-text-link",0)Then
If (FieldObj.ChildItem (totalRowFound(i),targetColNumber, "WebElement", j).getRoProperty("innertext") =  FieldObj.GetCellData(totalRowFound(i),targetColNumber)) Then
FieldObj.ChildItem (totalRowFound(i),targetColNumber, "WebElement", j).click
LogMessage "RSLT","Verification","Clicked the Link with value "& FieldObj.GetCellData(totalRowFound(i),targetColNumber) & " in row number :- "& totalRowFound(i) & ", column number :- "&targetColNumber,True
Exit For
End If
End If
Next
Exit For  'link navigates to next page
Case Else
LogMessage "WARN","Verification","Input parameter: - Object Type name not available. Please check the Called function.. Target Object Type: - "&targetObjType,False
SearchAndOperateInsideTableCell = False
Exit Function
End Select
Next	
SearchAndOperateInsideTableCell = bSearchAndOperateInsideTableCell
End Function

Public Function clickVaddinLink_tblCell(objTableHeader,objTable,intRow, strColName)
Dim intCol,objCountInCell
Set objAllRows=getAllRows(objTable)
intRowCount=objAllRows.Count   

intCol=getColIndex (objTableHeader,strColName)
'Set objCellItems=objTable.ChildItem(intRow,intCol,"WebElement")
'************ By Manish -------------class need to be changed. below step commented temporary.
'set objCountInCell=getCellObject(objTableHeader,objTable,intRow,strColName,"dt-link-col ng-binding ng-scope")

'*********** The below code has been modified by Sunil as md-button is only there ..
'set objCountInCell=getCellObject(objTableHeader,objTable,intRow,strColName,"md-button ng-scope md-ink-ripple")
set objCountInCell=getCellObject(objTableHeader,objTable,intRow,strColName,"md-button")

'set objCountInCell=getCellObject(objTableHeader,objTable,intRow,strColName,"ng-binding ng-scope")
iObjCount=objCountInCell.count
strCellValue=getCellTextFor(objTableHeader,objTable,intRow, strColName)

'iObjCount=objTable.ChildItemCount(intRow,intCol,"WebElement")
'For i=0 to intRow-1
For j = 0 to iObjCount - 1	
strClassName=objCountInCell(j).getRoProperty("class")
'strClassName=allCellInRow(j).getroproperty("class")
'If instr (1,strClassName,"dt-link-col",0) or instr (1,strClassName,"v-button-text-link",0)Then
'Added by Kalyan as part of 1701 automation 26102016 or instr (1,strClassName,"ng-scope",0)
If instr (1,strClassName,"md-button",0) or instr (1,strClassName,"v-button-text-link",0) or instr (1,strClassName,"ng-scope",0)Then
'If (objCountInCell(j).getRoProperty("innertext") =  getCellTextFor(objTableHeader,objTable,intRow, strColName)) Then
'If (objCountInCell(j).getRoProperty("innertext") =  getCellTextFor(objTableHeader,objAllRows(j),intRow, strColName)) Then
If (objCountInCell(j).getRoProperty("innertext") =  getCellTextFor(objTableHeader,objAllRows(introw),intRow, strColName)) Then
'Check the link enabled or disabled
bDisabled =matchStr(objCountInCell(j).GetROProperty("class"),"disabled")
'bDisabled =matchStr(allCellInRow(j).GetROProperty("outerhtml"),"v-disabled")
If bDisabled Then
LogMessage "WARN","Verification","Link is disabled.",True
Else
LogMessage "INFO","Verification","Link is enabled.",True	
'objTable.ChildItem(intRow,intCol, "WebElement", j).click
objCountInCell(j).click
LogMessage "RSLT","Verification","Clicked the Link with value "& strCellValue & " in row number :- "& intRow & ", column number :- "&intCol,True
End If
Exit For
End If
End If
Next
'Next
End Function

'Added by Kalyan 1701 26102016 when having multiple links in same column row
Public Function clickVaddinLink_tblCellLnkName(objTableHeader,objTable,intRow, strColName, strLnkName)
Dim intCol,objCountInCell
Wait(10)
Set objAllRows=getAllRows(objTable)
intRowCount=objAllRows.Count   

intCol=getColIndex (objTableHeader,strColName)
'************ By Manish -------------class need to be changed. below step commented temporary.

'*********** The below code has been modified by Sunil as md-button is only there ..
'set objCountInCell=getCellObject(objTableHeader,objTable,intRow,strColName,"md-button ng-scope md-ink-ripple")
set objCountInCell=getCellObject(objTableHeader,objTable,intRow,strColName,"md-button")

'set objCountInCell=getCellObject(objTableHeader,objTable,intRow,strColName,"ng-binding ng-scope")
iObjCount=objCountInCell.count
strCellValue=getCellTextFor(objTableHeader,objTable,intRow, strColName)

'iObjCount=objTable.ChildItemCount(intRow,intCol,"WebElement")
'For i=0 to intRow-1
For j = 0 to iObjCount - 1	
strClassName=objCountInCell(j).getRoProperty("class")
'strClassName=allCellInRow(j).getroproperty("class")
'If instr (1,strClassName,"dt-link-col",0) or instr (1,strClassName,"v-button-text-link",0)Then
'Added by Kalyan as part of 1701 automation 26102016 or instr (1,strClassName,"ng-scope",0)
If instr (1,strClassName,"md-button",0) or instr (1,strClassName,"v-button-text-link",0) or instr (1,strClassName,"ng-scope",0)Then
'If (objCountInCell(j).getRoProperty("innertext") =  getCellTextFor(objTableHeader,objTable,intRow, strColName)) Then
'If (objCountInCell(j).getRoProperty("innertext") =  getCellTextFor(objTableHeader,objAllRows(j),intRow, strColName)) Then
If (objCountInCell(j).getRoProperty("innertext") =  strLnkName) Then
'Check the link enabled or disabled
bDisabled =matchStr(objCountInCell(j).GetROProperty("outerhtml"),"disabled")
'bDisabled =matchStr(allCellInRow(j).GetROProperty("outerhtml"),"v-disabled")
If bDisabled Then
LogMessage "WARN","Verification","Link is disabled.",True
Else
LogMessage "INFO","Verification","Link is enabled.",True	
'objTable.ChildItem(intRow,intCol, "WebElement", j).click
objCountInCell(j).click
LogMessage "RSLT","Verification","Clicked the Link with value "& strCellValue & " in row number :- "& intRow & ", column number :- "&intCol,True
End If
Exit For
End If
End If
Next
'Next
End Function

Public Function verifyTableColumnHasData(objTableHeader,objContentTbl,ColNumber,strToSearch,Match,strColName)
'RowCount = ObjTableContent.RowCount
Set objAllRows=getAllRows(objContentTbl)	
RowCount=objAllRows.Count 
'if the string to search is an array. Then  check the indivudual array item exists in the table
If IsArray(strToSearch) Then
arrSearchStr = strToSearch
ReDim Preserve arrSearchStr(UBound(strToSearch))
Else
ReDim Preserve arrSearchStr(0)
arrSearchStr(0) = strToSearch
End If

If RowCount = 0 Then
If TRIM(arrSearchStr(0)) = "" Then
LogMessage "RSLT","Verification","As Expected table has zero records",True
verifyTableColumnHasData = True
Exit Function
Else
LogMessage "WARN","Verification","Expected records, but table has no records",False
verifyTableColumnHasData = False	
Exit Function
End If
ElseIf RowCount > 0 Then

Dim blnFound
verifyTableColumnHasData = True

For  i = 0 to Ubound(arrSearchStr) Step 1
blnFound = False					
For j = 0 to RowCount-1 Step 1
'strCurCellData = objContentTbl.GetCellData(j,ColNumber)
'strCurCellData=getCellTextFor(objTableHeader,objContentTbl,RowCount, strColName)
strCurCellData=getCellTextFor(objTableHeader,objAllRows(j),j, strColName)
If Match = "FULL" Then
If UCase(Trim(arrSearchStr(i))) = UCase(Trim(strCurCellData)) Then
LogMessage "RSLT","Verification","Search data  : - "& arrSearchStr(i) & " displayed in row "&j,True
blnFound = True
Exit For
End If
ElseIf Match = "PARTIAL" Then
If  InStr(1, UCase(Trim(strCurCellData)), UCase(Trim(arrSearchStr(i))),1)  > 0  Then
LogMessage "RSLT","Verification","Search data  : - "& arrSearchStr(i) & " displayed in row "&j,True
blnFound = True
Exit For
End If  
End If					
Next
If blnFound = False Then
LogMessage "WARN","Verification","Search data  : - "& arrSearchStr(i) & " not displayed in table",False
verifyTableColumnHasData = False
End If
Next
End If
End Function

'Get Checbox in table Cell enabled or disabled
Public Function getCheckBoxStatusEnabled_tblCell(objTableHeader,objTable,intRow, strColName)
Dim intCol, strChkStatus
strChkStatus="ENABLED"

intCol=getColIndex (objTableHeader ,strColName)
'Set objCellItems=objTable.ChildItem(intRow,intCol,"WebElement")
set objCountInCell=getCellObject_Checkbox(objTableHeader,objTable,intRow,strColName,"dt-checkbox ng-scope")
iObjCount=objCountInCell.count
'iObjCount=objTable.ChildItemCount(intRow,intCol,"WebElement")
For j = 0 to iObjCount - 1
'strClassName=objTable.ChildItem(intRow,intCol, "WebElement", j).getRoProperty("class")
strClassName=objCountInCell(j).getRoProperty("class")
If instr (1,strClassName,"dt-checkbox",0) or  instr (1,strClassName,"v-checkbox-disabled v-widget",0)Then
'
'Check the link enabled or disabled
'bDisabled =matchStr(objTable.ChildItem(intRow,intCol, "WebElement", j).GetROProperty("outerhtml"),"disabled")
bDisabled =matchStr(objCountInCell(j).GetROProperty("outerhtml"),"disabled")
If bDisabled Then
LogMessage "WARN","Verification","CheckBox is disabled in Row Number "&intRow,True
strChkStatus="DISABLED"
Else
LogMessage "INFO","Verification","CheckBox is enabled in Row Number"&intRow,True	
strChkStatus="ENABLED"
End If
Exit For			
End If
Next
getCheckBoxStatusEnabled_tblCell=strChkStatus
End Function

'@Function: Select Checkbox from table cell
Public Function selectCheckbox_tblCell(objTableHeader,objTable,intRow, strColName)
Dim intCol
intCol=getColIndex (objTableHeader ,strColName)
set objCountInCell=getCellObject_Checkbox(objTableHeader,objTable,intRow,strColName,"ng-binding ng-scope")
iObjCount=objCountInCell.count
Set oDesc=Description.Create
oDesc("micclass").Value = "WebElement"
oDesc("class").Value = "menu-list md-margin"

For j = 0 to iObjCount - 1
strClassName=objCountInCell(j).getRoProperty("class")
If instr (1,strClassName,"ng-binding ng-scope",0) Then
Set oDescAction=Description.Create
oDescAction("micclass").Value = "WebElement"
oDescAction("class").Value = "md-no-margin md-no-padding md-button"
Wait 2
Set objAction=objCountInCell(j).ChildObjects(oDescAction)
objAction(0).Click
Exit For
End If
Next
set oDesc=nothing
End Function

Public Function SetDateField_Validation(StrDate)
If not isNull(StrDate) Then
If Ucase(StrDate)="TODAY" Then
   strDay= Day(CDate(Now))
	'If len(Day(CDate(Now)))=1 Then
	'strDay="0"&Day(CDate(Now))
	'else
	'strDay=""&Day(CDate(Now))
	'End If
SetExpDate=""&strDay & " "&monthName(Month(CDate(Now)),true) &" " &Year(CDate(Now))&""
SetDatefield =SetExpDate 
Else  
arrDate= split(StrDate, ")")
SetDate=arrDate(0)
SetDate = Replace(SetDate, "(", "")
NoOfDays = arrDate(1)
If Ucase(SetDate)="TODAY" Then
If len(Day(CDate(Now)))=1 Then
strDay="0"&Day(CDate(Now))
else
strDay=""&Day(CDate(Now))
End If
SetExpDate=""&strDay & " "&monthName(Month(CDate(Now)),true) &" " &Year(CDate(Now))&""
End If
SetExpAlteredDate = DateAdd("d",NoOfDays,SetExpDate)
SetExpAlteredDate = Replace(SetExpAlteredDate, "#", "")
SetDatefield = SetExpAlteredDate
End IF
End If
SetDateField_Validation = SetDatefield
End Function

