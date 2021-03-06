
''//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
' Script Name:  BDD_Driver
' Author:       
'
' Description:  This is the main script of QTP-BDD Framework. This drives the execution of features and steps
'               Script first reads Step Definition File and creates a dictionary of available steps and functions.
'
'               For executing a Feature file it refer the dictionary matching steps from feature file and calling the respective function
'               While calling the step function it passes the test data embedded in Feature file or from test data sheet in steps to the function
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  Option Explicit

Public function cBDTEngine
		 set cBDTEngine=new clsBDTEngine
		 err.clear
	End Function

 Class clsBDTEngine

 Public Function ExecuteBDTest (strFeatureSheetName, strFeatureSheet,bExecKeywords)
		Dim arrTestData
		'// Logging the Testcase Start
		
			If  bExecKeywords Then
				err.clear
				logmessage"INFO","TESTSETSTART","Starting Execution of Scenarios for Feature Set :"&strFeatureSheetName,True
			End If
		'Retrive  Test  data 
		arrTestData=startBDTDataEngine (strFeatureSheetName,strFeatureSheet)
	
		'set objShell = CreateObject("Shell.Application")
		'objShell.ShellExecute "chrome.exe", "http://10.92.132.225:17055/icall?close=false", "", "", 1
		'wait 5
		setBaseAppState()
			
		Dim iTest,intScenarios
			intScenarios = 0
		For iTest=0 to UBound(arrTestData)	
			'Write to File
			Set objFileToWrite = CreateObject("Scripting.FileSystemObject").OpenTextFile("D:\OBTAF_QTP\Feature\TempFeature.Feature",2,true) 'TODO Configure Relative Path
			objFileToWrite.WriteLine("Feature:"&arrTestData(iTest,0))
			objFileToWrite.WriteLine("")
			objFileToWrite.WriteLine("Scenario:"&arrTestData(iTest,1))
			objFileToWrite.WriteLine(""&arrTestData(iTest,3))
			objFileToWrite.Close
			Set objFileToWrite = Nothing
			'Add Step Arguments to Dictionary		
			Set objArgDict=CreateObject("Scripting.Dictionary")
			Dim arrArguments: arrArguments=arrTestData(iTest,5)
			If not isEmpty(arrArguments) Then
				For iArgCount=0 to UBound(arrArguments)
					strTempArgName=Split(arrArguments(iArgCount),"=")(0)
					strTempArgValue=Split(arrArguments(iArgCount),"=")(1)
					objArgDict.Add strTempArgName, strTempArgValue
				Next
			End If
			gstrTestCase=Trim(arrTestData(iTest,1))
			If arrTestData(iTest,2)<>"" Then
				gstrDataSet="DD_"&gstrTestCase&"|"&arrTestData(iTest,2)
			 else
				gstrChild="NA"
			End If
	
			logmessage"INFO","DATASETSTART","Starting Execution of Scenario"&arrTestData(iTest,1),True
			Dim arrStepDefs, objStepDict, intLineIdx, strLine, strNextLine, arrFeatureFile,  strArgs, varResult
			Dim strKey, arrArgs, strTestStep, strStepStatus, intCnt
		 
			'Open the Test Application, by directly providing URL, QTP will launch the Browser and navigate to the specified URL
		   ' SystemUtil.Run "http://dl.dropbox.com/u/55228056/fundTransfer.html"
		 
			'Go through the Step Definition file and create dictionary of step definition and corresponding functions
			Dim strStepLibrary,strTempStepLibrary: strTempStepLibrary=arrTestData(iTest,4)
			Dim iLibCount,arrStepLibs
			arrStepLibs=Split(strTempStepLibrary,",")
			Set objStepDict = CreateObject("Scripting.Dictionary")
			For iLibCount=0 to UBound(arrStepLibs)
				strStepLibrary=arrStepLibs(iLibCount)
				arrStepDefs = Split(DotNetFactory.CreateInstance("System.IO.File").ReadAllText(PathFinder.Locate(strStepLibrary&".vbs")),vbCrLf)
				
				For intLineIdx = 0 To UBound(arrStepDefs)
					strLine = arrStepDefs(intLineIdx)
					If strLine <> "" Then
						If Left(strLine,2) = "'[" And Right(strLine,1) = "]" Then
							strLine = Replace(Replace(strLine,"'[",""),"]","")
							'Remove Given, When Then, And  Words 
							strTempLine=Trim(Replace(strLine, Split(strLine, " ")(0), ""))
							strTempLine = ParseLine("Step", strTempLine)
							strNextLine = Trim(arrStepDefs(intLineIdx+1))
							strNextLine = Replace(Replace(strNextLine,"Public Function",""),"Public Sub","")
							strNextLine = Mid(strNextLine,1,InStr(strNextLine,"(")-1)
							objStepDict.Add strTempLine, strNextLine
						End If
					End If
				Next
			Next
		 Dim bResult:bResult=true
			'Read Feature file and match step definitions in objStepDict
			arrFeatureFile = Split(DotNetFactory.CreateInstance("System.IO.File").ReadAllText(PathFinder.Locate("TempFeature.feature")),vbLf)
			For intLineIdx = 0 To UBound(arrFeatureFile)
				If InStr(arrFeatureFile(intLineIdx),"Feature:") <> 0 Then
					PrintLog "Feature: " & Trim(Replace(arrFeatureFile(intLineIdx),"Feature:",""))
				
				ElseIf InStr(arrFeatureFile(intLineIdx),"Scenario:") <> 0 Then
					intScenarios = intScenarios + 1
				
					PrintLog vbTab & "Scenario: " & Trim(Replace(arrFeatureFile(intLineIdx),"Scenario:",""))
				Else
					strArgs = ""
					varResult = ""
					strLine = Replace(Trim(arrFeatureFile(intLineIdx)),vbTab,"")
					If strLine <> "" Then
						strTempLine=Trim(Replace(strLine, Split(strLine, " ")(0), ""))
						strKey = Trim(ParseLine("Step",strTempLine))
						'After a step is found in dictionary generate the function call using the test data embedded in step from feature file
						If objStepDict.Exists(strKey) Then
							'Get Test Data Values from Feature File Steps and create an Argument Array
		'                    If ParseLine("Args",strLine) <> "" Then
		'                        arrArgs = Split(ParseLine("Args",strLine),";")
								Dim ArgTemp:ArgTemp=""
							  If FormStepArgument("Args",strLine,objArgDict) <> "" Then
							   arrArgs = Split(FormStepArgument("Args",strLine,objArgDict),";")	
								For intCnt = 0 to UBound(arrArgs)
									ArgTemp=ArgTemp &Chr(34) &arrArgs(intCnt)& Chr(34)
									arrArgs(intCnt)=CheckNull(arrArgs(intCnt))
									
									strArgs = strArgs & "arrArgs(" & intCnt & "),"
								Next
								strArgs = Mid(strArgs,1,Len(strArgs)-1)
								strTestStep = "varResult = " & objStepDict(strKey) & "(" & strArgs & ")"
							Else
								strTestStep = "varResult = " & objStepDict(strKey)
							End If
							strStepStatus=""
							'Execute the function call
							On Error Resume Next
							Execute(strTestStep)

							'Handle Error if Error comes
							  If err.number<>0 Then
								  LogMessage "RSLT","Initial Exception", "Intial Error Reported in the Execution of the Keyword:  " & strKeyword & " is  " & Err.Number & " " & Err.description & " " & Err.Source &  " " & Err.HelpContext , false
								  Print ( "Intial Error Reported in the Execution of the Keyword:  " & strKeyword & " is " & Err.Number & " " & Err.description & " " & Err.Source &  " " & Err.HelpContext )
								  err.clear		  
								  bResult=False
								  strStepStatus = " [FAIL]"
							  End If
            

							If varResult <> "" Then
								If varResult Then
									strStepStatus = " [PASS]"
								Else
									strStepStatus = " [FAIL]"
									bResult=False
								End If
							End If
							PrintLog vbTab & vbTab & strKey &" " &ArgTemp& " " & strStepStatus
						Else
							If InStr(strLine,"Given") <> 0 Or InStr(strLine,"When") <> 0 Or InStr(strLine,"Then") <> 0 Or InStr(strLine,"And") <> 0  Then
								PrintLog vbTab & vbTab & strLine & " [PENDING]"
								bResult=False
							Else
								PrintLog vbTab & vbTab & strLine
							End If
						End If
					End If
				End If
		Next
		logmessage"INFO","DATASETEND","Ending Execution of Scenario "&arrTestData(iTest,1),bResult
		
		
	 Next
		LogOff()
		DisconnectAll()
	 	logmessage"INFO","TESTSETEND","Ending Execution of Scenarios for Feature Set :"&strFeatureSheetName,True
		PrintLog vbCrLf & "Total " & intScenarios & " Scenarios Executed!!"
 End Function
	Private Function ParseLine(ByVal strWhatToParse, ByVal strLine)
        Dim objRegEx, objMatches, objMatch, strResult
        Set objRegEx = New RegExp
        objRegEx.Pattern = "\""(.*?)\"""
        objRegEx.IgnoreCase = True
        objRegEx.Global = True
        Set objMatches = objRegEx.Execute(strLine)
        For Each objMatch in objMatches
            If strWhatToParse = "Step" Then
                strLine = Replace(strLine, objMatch, vbNullString)
                strResult = Replace(strLine, "  ", " ")
               ' strResult = strResult & Replace(strLine,objMatch,vbNullString)
            ElseIf strWhatToParse = "Args" Then
                strResult = strResult & Replace(objMatch,"""","") & ";"
            End If
        Next
        If strResult <> "" Then
            If strWhatToParse = "Step" Then ParseLine = strResult
            If strWhatToParse = "Args" Then ParseLine = Mid(strResult,1,Len(strResult)-1)
        Else
            If strWhatToParse = "Step" Then ParseLine = strLine
            If strWhatToParse = "Args" Then ParseLine = ""
        End If
    End Function

 Private Function FormStepArgument(ByVal strWhatToParse, ByVal strLine, ByVal objArgumentDict)
        Dim objRegEx, objMatches, objMatch, strResult,strTempResult
        Set objRegEx = New RegExp
        objRegEx.Pattern = "\""(.*?)\"""
        objRegEx.IgnoreCase = True
        objRegEx.Global = True
        Set objMatches = objRegEx.Execute(strLine)
        For Each objMatch in objMatches
           If strWhatToParse = "Args" Then
			 
                strTempResult =  Replace(objMatch,"""","") 
				If InStr(1,strTempResult,"$")=1 Then
					'get key value for this variable from dicArgument
					strResult=strResult & objArgumentDict(strTempResult)& ";"
					else
						strResult=strResult & strTempResult& ";"
				End If
            End If
        Next
        If strResult <> "" Then
          
            If strWhatToParse = "Args" Then 
				
				FormStepArgument = Mid(strResult,1,Len(strResult)-1)
			  End If
        Else
            If strWhatToParse = "Step" Then FormStepArgument = strLine
            If strWhatToParse = "Args" Then FormStepArgument = ""
        End If
    End Function

Private Function startBDTDataEngine(strTestcaseName, strKWsheetPath) '
	  Dim arrRawListData
	  Dim arrArgListData
	  Dim arrONDataSet
	  Dim arrKeywordSequence
	  Dim argDDAddedData
	 ' msgbox "data Engine"
	 strSQLStatement="Select  *  from ["& strTestcaseName &"$] where  ["& strTestcaseName &"$].ONOFF = 'ON' "
	 arrRawListData=cExcelDataEngine.FetchExcelValue(strSQLStatement,strKWsheetPath)
	 'Add Data Driven Data
	argDDAddedData = addDataDriven(arrRawListData)
	startBDTDataEngine=argDDAddedData			
End Function

Private Function addDataDriven(arrRawListData)
   ReDim array2D2(0,1)
	 iTotalRows = Ubound(arrRawListData)
	 iTotalCols = Ubound(arrRawListData, 2)

	  Dim  strTempArg,iTotalTestCount
	  'ReDim Preserve arrData(cint(iTotalRows),cint(iArguments))
	  'ReDim lstStrings(0)
	  ReDim arrayDDTest(0)
	  Dim arrMergedData
	
	iTotalTestCount=0
	For iCount=0 to iTotalRows
		Dim strDataDriven, strFeature, strScenario,strSteps
		strFeature=arrRawListData(iCount,giBDFeature)
		strScenario=arrRawListData(iCount,giBDScenario)
		strDataDriven=arrRawListData(iCount,giBDDataDriven)
		strSteps=arrRawListData(iCount,giBDSteps)
		strStepLibrary=arrRawListData(iCount,giBDStepLibrary)
		If InStr(1,Ucase(strDataDriven),"YES")=1 Then
			Dim strDataSheetName,strDataFileName
			strDataSheetName=Split(Mid(Split(strDataDriven,"[")(1),1,Len(Split(strDataDriven,"[")(1))-1),"@")(0)
			strDataFileName=Split(Mid(Split(strDataDriven,"[")(1),1,Len(Split(strDataDriven,"[")(1))-1),"@")(1)
			'Identify Data Driven Data
			'Assuming all test data sheets will be stored  in Test data/Feature folder
			strDatasheetPath="D:\OBTAF_QTP\QTPCode\POC_BDD_Framework.xls"
			strSQLStatement="Select  *  from ["& strDataSheetName &"$] where  ["& strDataSheetName &"$].Scenario ='"&strScenario&"' AND  ["& strDataSheetName &"$].ONOFF= 'ON' "
			arrRawDDData=cExcelDataEngine.FetchExcelValue(strSQLStatement,strDatasheetPath)
			 iTotalDDRows=Ubound(arrRawDDData,1)
			 iTotalDDCol=Ubound(arrRawDDData,2)
			 ReDim arrArguments(iTotalDDRows-1)
			 ReDim arrMergedDD(iTotalDDRows-1,5)
			'	Arrange Raw Data Row wise
			For iRow=0 to iTotalDDRows
				
				
				 Dim arrRawRowData
				 arrRawRowData = returnColumnValuesForARow (arrRawDDData, iRow)
				
				 Dim strDataSet
				 strDataSet = arrRawRowData(giBDDData_DS)

				  Dim strDatasetONOFF
				 strDatasetONOFF = arrRawRowData(giBDDData_ONOFF)

				Dim strRecordType
				 strRecordType = arrRawRowData(giBDDData_RecordType)
				
				'Create Dictionary object to store Argument Information and Values

				Dim objDictionary
					Set objDictionary = CreateObject("Scripting.Dictionary")

				 'Filter if  OFF Data set if entire scenario is not to be executed. This is additional check and same can be done from Feature sheet
				If iRow=0 and Not isNumeric(strDataSet) Then
					PrintLog "This Data set is OFF"
					Exit For
				End If

				If  Trim(Ucase(strRecordType)) = "KWI" Then
					'Collect Argument Information
					
					For iArgInfo = giBDDData_Arguments to Ubound(arrRawRowData)
						Dim strTemp:strTemp=arrRawRowData(iArgInfo)
						If Not (isNull(strTemp ) OR isEmpty(strTemp))Then
							ReDim  Preserve arrayArgInfo(iArgInfo-giBDDData_Arguments)		
							arrayArgInfo(iArgInfo-giBDDData_Arguments)=strTemp
						Else
							Exit For 
						End If
					Next
					
				End If
				If  (Trim(Ucase(strRecordType)) = "KWD" And Trim(Ucase(strDatasetONOFF)) = "ON" )Then
					Dim intKey:intKey=0
					'Collect Argument  Data for each row
					For iArgValue = giBDDData_Arguments to Ubound(arrRawRowData)
						Dim strTempValue:strTempValue=arrRawRowData(iArgValue)
						
						If Not (isNull(strTempValue ) OR isEmpty(strTempValue))Then

							objDictionary.Add arrayArgInfo(intKey), strTempValue
						
							ReDim  Preserve arrayArgInfoValue(iArgValue-giBDDData_Arguments)		
							arrayArgInfoValue(iArgValue-giBDDData_Arguments)=arrayArgInfo(intKey) &"="&strTempValue
							intKey=intKey+1
						Else
							Exit For 
						End If
					Next
					arrMergedDD(iRow-1,0)=strFeature
					arrMergedDD(iRow-1,1)=strScenario
					arrMergedDD(iRow-1,2)=strDataSet
					arrMergedDD(iRow-1,3)=strSteps
					arrMergedDD(iRow-1,5)=arrayArgInfoValue
					arrMergedDD(iRow-1,4)=strStepLibrary
'						Dim arrSplitData
'						arrSplitData = splitDDRowDataIntoKeywords(arrDDRowExtendedKWDFinal,strDDExcelPath, strDDTestSheet, strDDSheet, strTempDDTestName)
'						
'						Dim arrMergedData                     
'						
'						If  iCount =0 Then
'							arrMergedData = mergeTwoDimensionalArrays (arrayDD, arrSplitData )
'						else
'							arrMergedData = mergeTwoDimensionalArrays (arrMergedData, arrSplitData )
'						End If
'						
'						iCount = iCount + 1
					
				 End If					 

					
			Next
				If  iTotalTestCount =0 Then
					arrMergedData = mergeTwoDimensionalArrays (array2D2, arrMergedDD )
				else
					arrMergedData = mergeTwoDimensionalArrays (arrMergedData, arrMergedDD )
				End If
						
				iTotalTestCount = iTotalTestCount + 1
				 
		else
			  ReDim arrMergedDD(0,5)
				arrMergedDD(0,0)=strFeature
				arrMergedDD(0,1)=strScenario
				arrMergedDD(0,2)="NA"
				arrMergedDD(0,3)=strSteps
				arrMergedDD(0,4)=strStepLibrary
				'arrMergedDD(iRow-1,4)=""
			If  iTotalTestCount =0 Then
				arrMergedData = mergeTwoDimensionalArrays (array2D2, arrMergedDD )
			else
				arrMergedData = mergeTwoDimensionalArrays (arrMergedData, arrMergedDD )
			End If
						
			iTotalTestCount = iTotalTestCount + 1
		End If
	Next
	addDataDriven=arrMergedData
   '
End Function


Private Function formArgumentList(arrRawListData)
		  Dim iTotalRows, iTotalCols
	
		  iTotalRows=Ubound(arrRawListData)
		  iTotalCols=Ubound(arrRawListData,2)

		  Dim  strTempArg
		  ReDim arrArgListedData(cint(iTotalRows),cint(giBDDData_Arguments))
		  ReDim lstStrings(0)
		 For iCount=0 to iTotalRows
			 For iArg =giBDDData_Arguments to iTotalCols-1
				 strTempArg=null
				 strTempArg=arrRawListData(iCount,iArg)
				 If (isNull(strTempArg) or (strTempArg =null)) Then
					 Exit for
				else
					Redim Preserve lstStrings(iArg-giBDDData_Arguments)
					lstStrings(iArg-giBDDData_Arguments)=strTempArg
				 End If
			 Next
	
			 arrRawListData(iCount, giBDDData_Arguments)=lstStrings
	
		 Next
	
		 For iList=0 to Ubound(arrRawListData)
	
			 For iColList=0 to Ubound(arrArgListedData,2)
				 arrArgListedData(iList,iColList)=arrRawListData(iList,iColList)
			 Next
	
		 Next
	
		formArgumentList=arrArgListedData
	
	
End Function


Public Function PrintLog(strLog)
   	Set objFileToWrite = CreateObject("Scripting.FileSystemObject").OpenTextFile("D:\OBTAF_QTP\Feature\TestLog.log",8,true)
		objFileToWrite.WriteLine(""&strLog)
        objFileToWrite.Close
		Set objFileToWrite = Nothing
End Function

End Class

