'###############################################################################################################################################
'# Name: BDD_Driver
'# Description: 
'#			1.This is the main script of QTP-BDD Framework. 
'#			2.This drives the execution of features and steps.
'#  		3.Script first reads Step Definition File and creates a dictionary of available steps and functions.
'#  		4.For executing a Feature file it refer the dictionary matching steps from feature file and calling the respective function
'#  		5.While calling the step function it passes the test data embedded in Feature file or from test data sheet in steps to the function
'# Date: 
'################################################################################################################################################

Option Explicit

Public Function cBDTEngine
	 Set cBDTEngine = New clsBDTEngine
	 Err.clear
End Function

Class clsBDTEngine

	Public Function ExecuteBDTest (strFeatureSheetName, strFeatureSheet,bExecKeywords)
	
		Dim arrTestData
		Dim iTest
		Dim intScenarios
		Dim strNavigationKey
		Dim strCurrentScenario
		Dim strPreviousScenario
		Dim bNewTestSet
		Dim strRecoveryOption
		Dim intPassed
		Dim intFailed
		Dim strDataSetStartTime
		Dim strDataSetEndTime
		Dim strTimeDiff
		Dim strTestSetStartTime
		Dim strTestSetEndTime
		
		'// Logging the Testcase Start
		
		'[Added By  - For Test Set level time capture]
		strTestSetStartTime = Now
		Print ""
		Print "Test Set Enter : " & strTestSetStartTime
		Print ""
		'==============================
		
		gstrTestSheetName = strFeatureSheetName
		
		If  bExecKeywords Then
			err.clear
			logmessage"INFO","TESTSETSTART","Starting Execution of Scenarios for Feature Set :"&strFeatureSheetName,True
		End If

		arrTestData = startBDTDataEngine (strFeatureSheetName,strFeatureSheet)
		
		intScenarios = 0
		intPassed=0
		intFailed=0
		strPreviousScenario=""
		strCurrentScenario=""		
		Dim objFileToWrite
		Dim strCurrentScenarios
		
		For iTest = 0 to UBound(arrTestData)		
			'[Added by  to Capture Dataset level execution time]
			
			strDataSetStartTime = Now
			Print "Data Set: [" & iTest+1 &"]"
			Print "================="
			Print VbTab & VbTab & "Data Set Enter : " & strDataSetStartTime
			
			'Write to File
			Set objFileToWrite = CreateObject("Scripting.FileSystemObject").OpenTextFile(gstrFeatureFile,2,true) 'TODO Configure Relative Path
			'Set objFileToWrite = CreateObject("Scripting.FileSystemObject").OpenTextFile("D:\OBTAF_QTP\Feature\TempFeature.Feature",2,true) 'TODO Configure Relative Path
			objFileToWrite.WriteLine("Feature:"&arrTestData(iTest,0))
			objFileToWrite.WriteLine("")
			objFileToWrite.WriteLine("Scenario:"&arrTestData(iTest,1))
			strCurrentScenarios = arrTestData(iTest,1)
			
			If strCurrentScenarios = strPreviousScenario Then
				bNewTestSet = false
			Else
				bNewTestSet = true
			End If
			
			strNavigationKey = CheckNull(arrTestData(iTest,4))
			strRecoveryOption = arrTestData(iTest,3)
			setRecoveryOption(strRecoveryOption)
			
			If (bDemo) Then
				'Display a message for 2 seconds
				Set objShell = CreateObject("Wscript.Shell")
				objShell.Popup "******Initializing BDT Framework********", 3, "BDT Execution Alert "
				set objShell = Nothing
			End If
	
	        If IsNull(strNavigationKey)  Then
				setBaseAppStateBDT()
			End If
			
			If not isNull(strNavigationKey) And bExecuteNavigation Then
				
				setBaseAppStateBDT()
				
				Dim arrNavigationSteps
				Dim iNavStep
				Dim strNavSteps
				arrNavigationSteps= getNavigationSteps(strNavigationKey)		'get navigation key steps
				strNavSteps=""
				
				For iNavStep=0 to Ubound(arrNavigationSteps)
					strNavSteps=strNavSteps& arrNavigationSteps(iNavStep) & VbLf
				Next
				objFileToWrite.WriteLine(""&strNavSteps)
			End If
			
	        objFileToWrite.WriteLine(""&arrTestData(iTest,5)&""&vbLf)
			objFileToWrite.Close
	
			Set objFileToWrite = Nothing
			
			'Add Step Arguments to Dictionary		
 			Dim objArgDict
			Dim arrArguments
			Dim iArgCount
			Dim strTempArgName
			Dim strTempArgValue
			Set objArgDict=CreateObject("Scripting.Dictionary")
			arrArguments=arrTestData(iTest,7)
			
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
		 	Else
				gstrChild="NA"
			End If
	
			logmessage"INFO","DATASETSTART","Starting Execution of Scenario"&arrTestData(iTest,1),True
			
			Dim arrStepDefs
			Dim objStepDict
			Dim intLineIdx
			Dim strLine
			Dim strNextLine
			Dim arrFeatureFile
			Dim strArgs
			Dim varResult
			Dim strKey
			Dim arrArgs
			Dim strTestStep
			Dim strStepStatus
			Dim intCnt
			Dim strStepLibrary
			Dim strTempStepLibrary
			Dim iLibCount
			Dim arrStepLibs 
			Dim strTempLine 
			Dim strFirstWord
	
			If (bDemo) Then
				'Display a message for 2 seconds
				Dim objShell
				Set objShell = CreateObject("Wscript.Shell")
				objShell.Popup "*************Executing the Test  ******************** "+vblf + gstrDataset+"", 3, "BDT Execution Alert "
				set objShell = Nothing
			End If
	                  
			'Go through the Step Definition file and create dictionary of step definition and corresponding functions
			
			strTempStepLibrary=arrTestData(iTest,6)

			arrStepLibs=Split(strTempStepLibrary,",")
			
			LoadScenarioBusinessLibraries arrStepLibs
			
			Set objStepDict = CreateObject("Scripting.Dictionary")
	
			bAppStateLogout = False 'Set App State Logout False before test starts. If required to Logoff Step function will make it True
	
			For iLibCount = 0 To UBound (arrStepLibs)
				
				strStepLibrary=arrStepLibs(iLibCount)
				
				arrStepDefs = Split(DotNetFactory.CreateInstance("System.IO.File").ReadAllText(PathFinder.Locate(strStepLibrary&".vbs")),vbCrLf)
			
				For intLineIdx = 0 To UBound(arrStepDefs)
				
					strLine = arrStepDefs(intLineIdx)
					
					If strLine <> "" Then
					
						If Left(strLine,2) = "'[" And Right(strLine,1) = "]" Then
						
							strLine = Replace(Replace(strLine,"'[",""),"]","")
							'Remove Given, When Then, And  Words 
							strTempLine=Trim(strLine)
							'Handle User as generic - 04-02-2014
							strFirstWord=Split(strTempLine," ")(0)
							
							If UCase(strFirstWord)="USER" OR  Ucase( strFirstWord)="CSO" OR  Ucase(strFirstWord)="TM" Then
								 strTempLine= Trim(Right(strTempLine,Len(strTempLine)-Len(Split(strTempLine, " ")(0))))
							End If
	
							strTempLine = ParseLine("Step", strTempLine)
							strNextLine = Trim(arrStepDefs(intLineIdx+1))
							strNextLine = Replace(Replace(strNextLine,"Public Function",""),"Public Sub","") ''**** --17-03-2014 --Case Sensitivity needs to be handled
							strNextLine = Mid(strNextLine,1,InStr(strNextLine,"(")-1)
							objStepDict.Add strTempLine, strNextLine
						End If
					End If
				Next
			Next
			
			
			Dim bResult
			bResult=true
			
			'Read Feature file and match step definitions in objStepDict
			
			arrFeatureFile = Split(DotNetFactory.CreateInstance("System.IO.File").ReadAllText(PathFinder.Locate("TempFeature.Feature")),vbLf)
			
			For intLineIdx = 0 To UBound(arrFeatureFile)
				
				'[Added By  to Capture execution time for each step]
				Dim strStepStartTime
				Dim strStepEndTime
				Dim strTemp
				Dim strKeyActual
				strStepStartTime = Now
				'========================================
				
				If InStr(arrFeatureFile(intLineIdx),"Feature:") <> 0 Then
					PrintLog( "")
					PrintLog "Feature: " & Trim(Replace(arrFeatureFile(intLineIdx),"Feature:",""))
					
				ElseIf InStr(arrFeatureFile(intLineIdx),"Scenario:") <> 0 Then
					intScenarios = intScenarios + 1
					PrintLog vbTab & "Scenario: " & Trim(Replace(arrFeatureFile(intLineIdx),"Scenario:",""))
					PrintLog vbTab & vbTab &"DataSet:"& gstrDataSet & vbCR
				Else
					strArgs = ""
					varResult = ""
					strLine = Replace(Trim(arrFeatureFile(intLineIdx)),vbTab,"")
					
					If strLine <> "" AND strLine <> vbLf AND strLine <> vbCr And  Left(strLine,2) <> "[" Then
					
						strTemp=Trim(Split(strLine, " ")(0))
						
						If  Ucase(strTemp)="GIVEN" OR  Ucase(strTemp)="WHEN" OR  Ucase(strTemp)="THEN" OR  Ucase(strTemp)="AND" Then
							 strTempLine= Trim(Right(strLine,Len(strLine)-Len(Split(strLine, " ")(0))))
						Else
							 strTempLine= Trim(strLine)
						End If
	                   
						strKeyActual = Trim(ParseLine("Step",strTempLine))
						gstrKeyword=strKeyActual
						gstrAction="BLANK"
						
						'Handle User as generic - 04-02-2014
						
	                    strFirstWord=Split(strTempLine," ")(0)
						If UCase(strFirstWord)="USER" OR  Ucase( strFirstWord)="CSO" OR  Ucase(strFirstWord)="TM" Then
							 strTempLine= Trim(Right(strTempLine,Len(strTempLine)-Len(Split(strTempLine, " ")(0))))
						End If
						
						Set gstrRuntimeStepKeys=objStepDict
						strKey = Trim(ParseLine("Step",strTempLine))
						
						'Store StepDic and Arg ument Dic for  runtime nave key execution
						Set gstrRuntimeArgDict = objArgDict
						
						'gstrKeyword=strKey
						'After a step is found in dictionary generate the function call using the test data embedded in step from feature file
						
						If objStepDict.Exists(strKey) Then
						
							'Get Test Data Values from Feature File Steps and create an Argument Array
							'                    If ParseLine("Args",strLine) <> "" Then
							'                        arrArgs = Split(ParseLine("Args",strLine),";")
							
							Dim ArgTemp
							ArgTemp=""
							
							If FormStepArgument("Args",strLine,objArgDict) <> "" Then
								arrArgs = Split(FormStepArgument("Args",strLine,objArgDict),";")	
								
								For intCnt = 0 to UBound(arrArgs)
									ArgTemp=ArgTemp &Chr(34) &arrArgs(intCnt)& Chr(34)
									arrArgs(intCnt) = CheckNull(arrArgs(intCnt))
									strArgs = strArgs & "arrArgs(" & intCnt & "),"
								Next
								
								strArgs = Mid(strArgs,1,Len(strArgs)-1)
								strTestStep = "varResult = " & objStepDict(strKey) & "(" & strArgs & ")"
							Else
								strTestStep = "varResult = " & objStepDict(strKey)
							End If
							
							strStepStatus=""
							
							'Execute the function call
							bDevPending=False
							
							On Error Resume Next
							
							Execute(strTestStep)
							
							'Handle Error if Error comes
							
							If err.number<>0 Then
								LogMessage "RSLT","Step Failure", "Error Reported in the Execution of the Step:  " & strKey & " is  " & Err.Number & ": " & Err.description  , false
								Print ( "Intial Error Reported in the Execution of the Keyword:  " & strKey & " is " & Err.Number & " " & Err.description & " " & Err.Source &  " " & Err.HelpContext )
								err.clear		  
								bResult=False
								If not bDevPending Then
									strStepStatus = " [FAIL]"
								else
									strStepStatus = "[PENDING DEVELOPMENT]"
								End If	
							End If
							
							
							If varResult <> "" Then
								If varResult Then
									strStepStatus = " [PASS]"
								Else
									If not bDevPending Then
										strStepStatus = " [FAIL]"
									Else
										strStepStatus ="[PENDING DEVELOPMENT]"
									End If
									bResult=False
								End If
							End If
							
							PrintLog vbTab & vbTab & strKeyActual &" " &ArgTemp& " " & strStepStatus
							
						Else
							If InStr(strLine,"[") <>1 Or InStr(strLine,"]") = 0  Then
								PrintLog vbTab & vbTab & Replace(strLine,VbCr,"") & " [PENDING AUTOMATION]"
								bResult=False
							Else
								PrintLog vbTab & vbTab & strLine
							End If
							
						End If
						
					'[Added By  to Capture execution time for each step]
					strStepEndTime = Now
					Print VbTab & VbTab & "Total [" & DateDiff("s",strStepStartTime,strStepEndTime) & "] seconds taken to execute the STEP : ["& strKey & "]"
					'===============================
					End If
				End If
			Next
		
			logmessage"INFO","DATASETEND","Ending Execution of Scenario "&arrTestData(iTest,1),bResult
			
			strPreviousScenario = arrTestData(iTest,1)
			
			If bResult Then
				intPassed=intPassed + 1
			else
				intFailed=intFailed + 1
			End If
			
			'Recover All the blocked cards ***Below Function is ICall Specific -  18-03-2013
			If bRecoverData Then
				'ActivateMultipleBlockedCards()
				'recoverCardsUsed()
			End If
			
			'[This loop will applicable for Normal Run , Not for Batch Run , Changed it (Not bAppState) to  bAppState]
			If bAppState Then
				LogOff()
				CloseBrowsers()
			End If
								
			'===============================================
			'[Added By  on 06 Oct 2016]
			'[Reason : For Batch Run total time capture for each DataSet]
			strDataSetEndTime = Now
			Print VbTab & VbTab & "Data Set Exit : " & strDataSetEndTime
			strTimeDiff = DateDiff("s",strDataSetStartTime,strDataSetEndTime)
			Print VbTab & VbTab & "Total [" & strTimeDiff & "] seconds taken to execute the Current DATASET"
			Print "============================================================="
			Environment.Value("intTotalExecutionTime") = Environment.Value("intTotalExecutionTime") + strTimeDiff
			'=======================================
		Next
		
		'[Added By ]
		strTestSetEndTime = Now
		Print "Test Set Exit : " & strTestSetEndTime
		Print ""
		Print "Total [" & DateDiff("s",strTestSetStartTime,strTestSetEndTime) & "] seconds taken to execute TESTSET : " & Environment.Value("KWSheetPath")
		'===================================
		
		logmessage "INFO","TESTSETEND","Ending Execution of Scenarios for Feature Set :"&strFeatureSheetName,True
		
		PrintLog vbCrLf & "Total " & intScenarios & " Scenarios Executed!!"
		PrintLog vbCrLf & "Total " & intPassed & " Scenarios Passed!!"
		PrintLog vbCrLf & "Total " & intFailed & " Scenarios Failed!!"
		
		'[Added By  : Logoff and close all browsers once one Test Set execution completed]
		If Not bAppState Then
			bLogOff = True
			bCloseBrowsers = True
			LogOff()
			CloseBrowsers()
		End If
		
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
				strResult = Replace(Trim(strLine), "  ", " ")
				strResult=Trim(strResult)
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
		Dim objRegEx
		Dim objMatches
		Dim objMatch
		Dim strResult
		Dim strTempResult
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
				Else
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
		Dim strDataSheetDir
		Dim argDDAddedData
		Dim strSQLStatement
		
		strSQLStatement="Select  *  from ["& strTestcaseName &"$] where  ["& strTestcaseName &"$].ONOFF = 'ON' "
		
		arrRawListData = cExcelDataEngine.FetchExcelValue(strSQLStatement,strKWsheetPath)
		
		'Add Data Driven Data
		
		argDDAddedData = addDataDriven(arrRawListData,strKWsheetPath)
		
		startBDTDataEngine = argDDAddedData			
	End Function
	
	Private Function addDataDriven(arrRawListData,strDatasheetPath)
	
		ReDim array2D2(0,1)
		Dim iTotalRows
		Dim iTotalCols
		iTotalRows = Ubound(arrRawListData)
		iTotalCols = Ubound(arrRawListData, 2)
		
		Dim  strTempArg,iTotalTestCount,iCount
		
		'ReDim Preserve arrData(cint(iTotalRows),cint(iArguments))
		'ReDim lstStrings(0)
		
		ReDim arrayDDTest(0)
		Dim arrMergedData
		
		iTotalTestCount=0
		
		For iCount = 0 to iTotalRows
		
			Dim strDataDriven
			Dim strFeature
			Dim strScenario
			Dim strSteps
			Dim strNavigationKey
			Dim strRecoveryOption
			Dim strStepLibrary
			
			strFeature=arrRawListData(iCount,giBDFeature)
			strScenario=arrRawListData(iCount,giBDScenario)
			strDataDriven=arrRawListData(iCount,giBDDataDriven)
			strRecoveryOption=arrRawListData(iCount,giBDRecoveryOption)
			strNavigationKey=arrRawListData(iCount,giBDNavigationKey)
			strSteps=arrRawListData(iCount,giBDSteps)
			strStepLibrary=arrRawListData(iCount,giBDStepLibrary)
			
			If InStr(1,Ucase(strDataDriven),"YES") = 1 Then
			
				Dim strDataSheetName
				Dim strDataFileName
				strDataSheetName=Split(Mid(Split(strDataDriven,"[")(1),1,Len(Split(strDataDriven,"[")(1))-1),"@")(0)
				strDataFileName=Split(Mid(Split(strDataDriven,"[")(1),1,Len(Split(strDataDriven,"[")(1))-1),"@")(1)
				
				'Identify Data Driven Data
				'Assuming all test data sheets will be stored  in Test data/Feature folder
				'	strDatasheetPath="D:\OBTAF_QTP\QTPCode\POC_BDD_Framework.xls"
				Dim strSQLStatement
				strSQLStatement="Select  *  from ["& strDataSheetName &"$] where  ["& strDataSheetName &"$].Scenario ='"&strScenario&"' AND  ["& strDataSheetName &"$].ONOFF= 'ON' "
				
				Dim arrRawDDData
				arrRawDDData = cExcelDataEngine.FetchExcelValue(strSQLStatement,strDatasheetPath)
				
				Dim iTotalDDRows
				Dim iTotalDDCol
				Dim iRow
				
				iTotalDDRows=Ubound(arrRawDDData,1)
				iTotalDDCol=Ubound(arrRawDDData,2)
				
				ReDim arrArguments(iTotalDDRows-1)
				ReDim arrMergedDD(iTotalDDRows-1,7)
				
				'Arrange Raw Data Row wise
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
					
					If Trim(Ucase(strRecordType)) = "KWI" Then
						Dim iArgInfo
						'Collect Argument Information
						For iArgInfo = giBDDData_Arguments to Ubound(arrRawRowData)
							Dim strTemp
							strTemp=arrRawRowData(iArgInfo)
							If Not (isNull(strTemp ) OR isEmpty(strTemp))Then
								ReDim  Preserve arrayArgInfo(iArgInfo-giBDDData_Arguments)		
								arrayArgInfo(iArgInfo-giBDDData_Arguments)=strTemp
							Else
								Exit For 
							End If
						Next
					End If
					
					If  (Trim(Ucase(strRecordType)) = "KWD" And Trim(Ucase(strDatasetONOFF)) = "ON" )Then
					
						Dim intKey
						intKey=0
						Dim iArgValue
						'Collect Argument  Data for each row
						For iArgValue = giBDDData_Arguments to Ubound(arrRawRowData)
							Dim strTempValue
							strTempValue=arrRawRowData(iArgValue)
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
						arrMergedDD(iRow-1,3)=strRecoveryOption
						arrMergedDD(iRow-1,4)=strNavigationKey
						arrMergedDD(iRow-1,5)=strSteps
						arrMergedDD(iRow-1,6)=strStepLibrary
						arrMergedDD(iRow-1,7)=arrayArgInfoValue
						
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
				
				If iTotalTestCount = 0 Then
					arrMergedData = mergeTwoDimensionalArrays (array2D2, arrMergedDD )
				else
					arrMergedData = mergeTwoDimensionalArrays (arrMergedData, arrMergedDD )
				End If
				
				iTotalTestCount = iTotalTestCount + 1
			Else
				ReDim arrMergedDD(0,7)
				arrMergedDD(0,0)=strFeature
				arrMergedDD(0,1)=strScenario
				arrMergedDD(0,2)="NA"
				arrMergedDD(0,3)=strRecoveryOption
				arrMergedDD(0,4)=strNavigationKey
				arrMergedDD(0,5)=strSteps
				arrMergedDD(0,6)=strStepLibrary
			
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
	End Function
	
	Private Function formArgumentList(arrRawListData)
	
		Dim iTotalRows
		Dim iTotalCols
		
		iTotalRows = Ubound(arrRawListData)
		iTotalCols = Ubound(arrRawListData,2)
		
		Dim strTempArg
		ReDim arrArgListedData(cint(iTotalRows),cint(giBDDData_Arguments))
		ReDim lstStrings(0)
		
		For iCount=0 to iTotalRows
			For iArg = giBDDData_Arguments to iTotalCols-1
				strTempArg=null
				strTempArg=arrRawListData(iCount,iArg)
				If (isNull(strTempArg) or (strTempArg =null)) Then
					Exit for
				Else
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
		formArgumentList = arrArgListedData
	End Function
	
	Public Function PrintLog(strLog)
	
		'************************Updated -24-02-2014 -**************************************************************
		
		'Create log file test sheetwise. To limit 
		Dim FSO
		Dim SasPth
		Dim objFile
		Dim objFileToWritePrint
		
		Set FSO= CreateObject("Scripting.FileSystemObject")
		If not FSO.fileExists(gstrTextLog+"\"+ gstrTestSheetName + ".log") Then
			Set SasPth = FSO.GetFolder(gstrTextLog)
			Set objFileToWritePrint = SasPth.CreateTextFile(gstrTestSheetName + ".log")
		Else
			Set objFile = FSO.getFile(gstrTextLog+"\" + gstrTestSheetName + ".log")
			Set objFileToWritePrint = objFile.OpenAsTextStream(8)
		End If
		
		'**************************************************************************************
		objFileToWritePrint.WriteLine(""&strLog)
		objFileToWritePrint.Close
		Set objFileToWritePrint = Nothing
		Set SasPth= Nothing
		Set FSO=Nothing
	End Function
	
	Private Function getNavigationSteps(strNavigationKey)
		Dim arrRawListData
		Dim strSQLStatement
		Dim strStepKeySheet
		strStepKeySheet="StepKeys"
		Dim arrKeywordSequence
		Dim strDataSheetDir
		Dim arrSteps
		strSQLStatement="Select  [" & strStepKeySheet & "$].KeySteps  from ["& strStepKeySheet &"$] where  ["& strStepKeySheet &"$].NavigationKey = '"&strNavigationKey&"' "
		arrRawListData=cExcelDataEngine.FetchExcelValue(strSQLStatement,gstrNavigationKeyStore)
		arrSteps=Split(arrRawListData(0,0),VbLf)
		getNavigationSteps=arrSteps
	End Function
	
	Public Function setRecoveryOption(strRecoveryOption)
	   Select Case Ucase(strRecoveryOption)
		   Case "ICALL LOGIN"
				bAppStateLogout=True
			Case "CSO HOME"
				bAppStateLogout=false
			Case "CUSTOMER OVERVIEW"
				bAppStateLogout=false	 
				'Close All tabs
	   End Select
	End Function
	
	Public Function ExecuteNavigationSteps (strRuntimeNaviganion)
		
		Dim arrTestData
		Dim iTest
		Dim intScenarios
		Dim strNavigationKey
		Dim strCurrentScenario
		Dim strPreviousScenario
		Dim bNewTestSet
		Dim strRecoveryOption
		Dim bNavResult
		Dim arrNavigationSteps
		Dim intPassed
		Dim intFailed
		Dim intLineIdx
		
		bNavResult=true
		
		strNavigationKey = strRuntimeNaviganion
		arrNavigationSteps = getNavigationSteps(strNavigationKey)
		
		intScenarios = 0
		intPassed=0
		intFailed=0
		strPreviousScenario=""
		strCurrentScenario=""
		
		'Read Feature file and match step definitions in objStepDict
		
		For intLineIdx = 0 To UBound(arrNavigationSteps)
				strArgs = ""
				varResult = ""
				strNavLine = Replace(Trim(arrNavigationSteps(intLineIdx)),vbTab,"")
				
				If strNavLine <> "" AND strNavLine <> vbLf AND strNavLine <> vbCr And  Left(strNavLine,2) <> "["Then
					
					strTempNav=Trim(Split(strNavLine, " ")(0))
					If  Ucase(strTempNav)="GIVEN" OR  Ucase(strTempNav)="WHEN" OR  Ucase(strTempNav)="THEN" OR  Ucase(strTempNav)="AND" Then
						 strTempNavLine= Trim(Right(strNavLine,Len(strNavLine)-Len(Split(strNavLine, " ")(0))))
					else
							 strTempNavLine= Trim(strNavLine)
					End If
		           
				
					strKeyActual = Trim(ParseLine("Step",strTempNavLine))
					gstrKeyword=strKeyActual
						'Handle User as generic - 04-02-2014
		            strFirstWord=Split(strTempNavLine," ")(0)
					If UCase(strFirstWord)="USER" OR  Ucase( strFirstWord)="CSO" OR  Ucase(strFirstWord)="TM" Then
						 strTempNavLine= Trim(Right(strTempNavLine,Len(strTempNavLine)-Len(Split(strTempNavLine, " ")(0))))
					End If
		
					strNavKey = Trim(ParseLine("Step",strTempNavLine))
					'gstrKeyword=strKey
					'After a step is found in dictionary generate the function call using the test data embedded in step from feature file
					If gstrRuntimeStepKeys.Exists(strNavKey) Then
						'Get Test Data Values from Feature File Steps and create an Argument Array
		'                    If ParseLine("Args",strNavLine) <> "" Then
		'                        arrNavArgs = Split(ParseLine("Args",strNavLine),";")
							
							ArgTemp=""
						  If FormStepArgument("Args",strNavLine,gstrRuntimeArgDict) <> "" Then
						   arrNavArgs = Split(FormStepArgument("Args",strNavLine,gstrRuntimeArgDict),";")	
							For intCnt = 0 to UBound(arrNavArgs)
								ArgTemp=ArgTemp &Chr(34) &arrNavArgs(intCnt)& Chr(34)
								arrNavArgs(intCnt)=CheckNull(arrNavArgs(intCnt))
								
								strArgs = strArgs & "arrNavArgs(" & intCnt & "),"
							Next
							strArgs = Mid(strArgs,1,Len(strArgs)-1)
							strTestStep = "varResult = " & gstrRuntimeStepKeys(strNavKey) & "(" & strArgs & ")"
						Else
							strTestStep = "varResult = " & gstrRuntimeStepKeys(strNavKey)
						End If
						strStepStatus=""
						'Execute the function call
						bDevPending=False
						'On Error Resume Next
						Execute(strTestStep)
		
						'Handle Error if Error comes
						  If err.number<>0 Then
							  LogMessage "RSLT","Initial Exception", "Intial Error Reported in the Execution of the Keyword:  " & strKeyword & " is  " & Err.Number & " " & Err.description & " " & Err.Source &  " " & Err.HelpContext , false
							  Print ( "Intial Error Reported in the Execution of the Keyword:  " & strKeyword & " is " & Err.Number & " " & Err.description & " " & Err.Source &  " " & Err.HelpContext )
							  err.clear		  
							  bResult=False
							  If not bDevPending Then
								  strStepStatus = " [FAIL]"
								  bNavResult= " [FAIL]"
							  else
									 strStepStatus = "[PENDING DEVELOPMENT]"
		
							  End If
						  End If
		
		
						If varResult <> "" Then
							If varResult Then
								strStepStatus = " [PASS]"
							Else
								If not bDevPending Then
									strStepStatus = " [FAIL]"
									  bNavResult= " [FAIL]"
								Else
									strStepStatus ="[PENDING DEVELOPMENT]"
								End If
								bResult=False
							End If
						End If
						PrintLog vbTab & vbTab & strKeyActual &" " &ArgTemp& " " & strStepStatus
						
					Else
						'If InStr(strLine,"Given") <> 0 Or InStr(strLine,"When") <> 0 Or InStr(strLine,"Then") <> 0 Or InStr(strLine,"And") <> 0  Then
						If InStr(strLine,"[") <>1 Or InStr(strLine,"]") = 0  Then
							PrintLog vbTab & vbTab & Replace(strNavLine,VbCr,"") & " [PENDING AUTOMATION]"
							bResult=False
						Else
							PrintLog vbTab & vbTab & strNavLine
						End If
					End If
				End If
		Next
		ExecuteNavigationSteps=  bNavResult
	 End Function

End Class
