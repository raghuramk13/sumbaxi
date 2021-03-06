'###############################################################################################################################################
'# Name: Logger
'# Description: File Header Information
'#			1.This file contains all the class declarations and functions for the for the logging framework. 
'#			2.It uses the declarations from the OBTAF_config file.
'# Author:
'# Date: 20th Jan 2009
'################################################################################################################################################

Public objLogger
Dim  objAllLoggers

Public Function cExcellogger
	Set cExcellogger= new clsExcelLogger
End Function

Public Function cQTPlogger
	Set cQTPlogger= new clsQTPLogger
End Function

Public Function cWordFileLogger
	Set cWordFileLogger= new clsWordFileLogger
End Function

Public Function cLogger
	Set cLogger= new clsResultLogger
End Function

Public Function initializeLoggers()
	set objAllLoggers=CreateObject ("Scripting.Dictionary")
	objAllLoggers.Add "Excel","clsExcelLogger"
	objAllLoggers.Add "ExcelLogger","clsQTPLogger"
	objAllLoggers.Add "QTPLogger", "xmlLogger"
	initializeLoggers=objAllLoggers
End Function

Class clsExcelLogger

	Dim mExcelLoger
	Private Sub Class_Initialize
		Set mExcelLoger = cLogger()
	End Sub 

	Public Function removequotes(strMessage)
		Dim strSpecialChar,arrSpecialStrings
		strSpecialChar="'"+","+"[,"+"]"
		arrSpecialStrings= split(strSpecialChar,",")
		For i=0 to UBound (arrSpecialStrings)
			strMessage= replace( strMessage,arrSpecialStrings(i),"")
		Next
		removequotes=strMessage
	End Function
	
	Public Sub logToExcel (strConnectionString,gstrLogPath,strSQLStatement)
		'This function adds records to the excel database
		bFunction = false
		Dim objAdCon, objAdRs, strConnectionStr
		Set objAdCon = CreateObject("ADODB.Connection")
		
		objAdCon.Open  "DRIVER={Microsoft Excel Driver (*.xls, *.xlsx, *.xlsm, *.xlsb)};DBQ="& gstrLogPath & ";Readonly=True"
		
		If Err <> 0 Then
			Reporter.ReportEvent micFail,"Create Connection", "[Connection] Error has occured. Error : " & Err
			Exit sub
		End If
		
		Set objAdRs = CreateObject("ADODB.Recordset")
		objAdRs.CursorLocation=3                     ' set the cursor to use adUseClient - disconnected recordset
		objAdRs.Open strSQLStatement, objAdCon, 1, 3
		Set objAdRs.ActiveConnection = Nothing
		objAdCon.Close
		Set objAdCon = Nothing
		
		Set Readexcel = objAdRs
		
		bFunction = True
		If bFunction Then
			'Report  0, micDone, "Logresult", " Loggin in the excel file successful"
		else
			Report  0, micWarning, "Logresult", " Loggin in the excel file Failed"
			'reporter.ReportEvent 
		End If
	End sub

	Public Sub LogMessage(strLogType,strMessage, strDescription,strStatus)
		Dim iType, strResult
		strDescription= removequotes(strDescription)
		set dic =cLogger().LogLevels
		iType =dic(strLogType)
		
		If not gstrLogLevel>= iType Then
			' msgbox "loglevel exceeded"
			Exit sub
		End If
		
		
		Dim bResult
		'bResult=true
		If isnull(strStatus) Then
			bResult=true
		else
			bResult=Cbool(strStatus)
		End If
		
		Dim  strTimeStamp,strMachineName,strBuild, strProcess , strFeature, strTestCaseName,strBrowser,strDataset, strType
		strTimeStamp = "" &date &","&time
		'msgbox "$$$$$$$$"&strTimeStamp
		If isnull(gstrMachine) Then
			strMachineName="Not Specified"
		else
			strMachineName=gstrMachine
		End If
		
		If  isnull(gstrBuild)  Then
			strBuild="Not Specified"
		else
			strBuild=gstrBuild
		End If
		
		If isnull(gstrProcess) Then
			strProcess="Not Specified"
		else
			strProcess =gstrProcess
		End If
		
		If isnull(gstrFeature) Then
			strFeature="Not Specified"
		else
			strFeature=gstrFeature
		End If
		
		If isnull(gstrBrowser) Then
			strBrowser="NA"
		else
			strBrowser=gstrBrowser
		End If
		
		If isnull(gstrTestCase) Then
			strTestCaseName="NA"
		else
			strTestCaseName=gstrTestCase
		End If
		
		Dim strChild
		
		If isnull(gstrDataset) Then
			strDataSetName="NA"
			strChild="NA"
		Else
			If Not (InStr(1, gstrDataset,"DD_", 1) = 1) Then
				strDataSetName=gstrDataset
				strChild=gstrDataset
			Else
				Dim arrayTest
				arrayTest = Split(gstrDataset,"|")
				strDataSetName=arrayTest(0)
				strChild=arrayTest(1)
			End If
		End If
		strType=strLogType
		strSQLStatement= "Insert Into [Log$] (ExecutionTimeStamp, Machine, Build,Process,Feature, Browser, Sheet,Type,Testcase,Dataset, Message, Description, Result ) Values ('"& strTimeStamp &"', '"& gstrMachine&"', '"&gstrBuild&"','"& gstrProcess &"' ,'"& gstrFeature &"' ,'"& strBrowser &"','"& strTestCaseName &"','"& strType &"', ' " & strDataSetName & "','" & strChild  &" ','"& strMessage & "', ' "& strDescription &" ', '"& bResult &"') "
		
		logToExcel gstrConnectionString,gstrLogPath,strSQLStatement
	End Sub
End Class

Class clsQTPLogger
	
	Private  mQTPLoger
	
	'***** Initialize event *******
	
	Private Sub Class_Initialize
		Set mQTPLoger = cLogger()
	End Sub

	Private Function setLoger(strMessage)
	
		If Ucase(strMessage)="DATASETSTART" Then
			divDesc = "<table align=’center’ border=’5′ cellpadding=’1′ cellspacing=’2′ width=’100%’ title=’" & fileNameStr & "' frame=’hsides’>" & _
					"<caption>" & caption & "</caption>" & _
					"<thead><tr><th>DataSet Starts</th></tr></thead>" & _
					"<tbody><tr><td> Data Set Name is : "& gstrDataSetName & "</td></tr></tbody></table>"
					
			Set dicMetaDescription = CreateObject( "Scripting.Dictionary" )
			
			dicMetaDescription( "Status" ) = micPass
			'dicMetaDescription( "PlainTextNodeName" ) = "ApplicationException"
			dicMetaDescription("NodeName")="Data Set :" & gstrDataSetName
			dicMetaDescription( "StepHtmlInfo" ) = "<DIV align=center>" & divDesc & "</DIV>"
			dicMetaDescription( "DllIconIndex" ) = 205
			dicMetaDescription( "DllIconSelIndex" ) = 205
			dicMetaDescription( "DllPAth" ) = EnVironment( "ProductDir" ) & "\bin\ContextManager.dll"
			intContext=Reporter.LogEvent( "User", dicMetaDescription, Reporter.GetContext)
			Print "intContex" &intContext
			Reporter.SetContext intContext
		End If
		
		If Ucase(strMessage)="'DATASETEND" Then
			Reporter.UnSetContext
			'Print "" &intContext
			'Reporter.SetContext intContext
		End If
	End Function

	Public sub LogMessage(strLogType,strMessage, strDescription,strStatus)
	
		Dim strType, strResult
		strType=""
		'setLoger strMessage
		set dic =cLogger().LogLevels
		strType =dic(strLogType)
		
		If  strType = "" Then
			reporter.ReportEvent micFail,"LogMessage","Wrong Argument. Please check arguments for function"
		End If
		
		'msgbox "" &strType
		Select case strType
		
			Case 0
			If UCase(strStatus)="TRUE" Then
				strResult= micPass
				else
				strResult= micFail
				End If
				
			Case 1 
				If Ucase(strStatus) = "TRUE"  Then
				strResult=micWarning
				Else
				strResult=micFail
				End If
			
			Case 2
				strResult = micDone
			
			Case 3
				strResult = micDone
				
			Case default
				strResult=""
				'msgbox "Wrong arg "
		End Select
		
		cLogger().reportfilter gstrLogLevel
		Dim arrExcludeScreenShot
		arrExcludeScreenShot=Array("KWEXECUTIONEND","DATASETEND","TESTCASEEND","Exception Handling","DB VERIFICATION","Keyword-Verification","Step Failure")
		bCaptureScreen=ArrayFind(arrExcludeScreenShot,strMessage)
		
		'	Reporter.ReportEvent strResult, strMessage, strDescription
		
		If strResult =micFail Then
			If not bCaptureScreen Then
				'cLogger().CaptureScreenshot  "", strResult, strMessage , strDescription '**** 18-03-2014 : Commented to reduce Screenshot count.
				Reporter.ReportEvent strResult, strMessage, strDescription
			else
				Reporter.ReportEvent strResult, strMessage, strDescription
			End If
			
		Else
			If UCase(strMessage) = "VERIFICATION" Then
				'					cLogger().CaptureScreenshot  "", strResult, strMessage , strDescription
				Reporter.ReportEvent strResult, strMessage, strDescription
			Else
				Reporter.ReportEvent strResult, strMessage, strDescription
				'			    cLogger().CaptureScreenshot  "", strResult, strMessage , strDescription												
			End If
		End If
	End Sub

End Class

Class xmlLogger

	Private Sub Class_Initialize
		Set objLoggers = clsResultLogger
	End Sub
	
End Class

Class clsWordFileLogger

	Private Sub Class_Initialize
    End Sub
    
	Public Sub LogMessage(strMessage, strDescription,strFileName)		
		Dim   strTestCaseName,strBrowser,strDataset, strType
		
		If isnull(gstrTestCase) Then
			strTestCaseName="NA"
		else
			strTestCaseName=gstrTestCase
		End If
		
		Dim strChild
		
		If isnull(gstrDataset) Then
			strDataSetName="NA"
			strChild="NA"
		Else
			If Not (InStr(1, gstrDataset,"DD_", 1) = 1) Then
				strDataSetName=gstrDataset
				strChild="NA"
			else
				Dim arrayTest
				arrayTest = Split(gstrDataset,"|")
				strDataSetName=arrayTest(0)
				strChild=arrayTest(1)
			End If
		End If
		
		Const END_OF_STORY=6
		Const MOVE_SELECTION=0
		
		Set wordfile=CreateObject("Word.Application")
		
		wordfile.Visible=false
		Set wordDoc= wordfile.Documents.Open(gstrLogPath_wordfile)
		
		Set wordSelection=wordfile.Selection
		wordSelection.EndKey END_OF_STORY,MOVE_SELECTION
		
		wordSelection.TypeParagraph
		wordSelection.TypeText ("***************************************************************** ")
		wordSelection.TypeText ("TESTCASE NAME : " +strTestCaseName)
		wordSelection.TypeParagraph
		wordSelection.TypeText ("DATASET NAME : " +strDataSetName)
		wordSelection.TypeParagraph
		wordSelection.TypeText ("KEYWORD/STEP NAME: " +gstrKeyword)
		If UCase(strMessage) = "RSLT" OR UCase(strMessage) = "VERIFICATION" Then
			wordSelection.TypeParagraph
			wordSelection.TypeText ("Testcase passed : " +strMessage+ " : "+strDescription+" ")
			wordSelection.TypeParagraph
			wordSelection.TypeText ("Please refer screen shot below ")
		ElseIf UCase(strMessage) = "WARN" Then
			wordSelection.TypeParagraph
			wordSelection.TypeText ("Failure cause is : " +strMessage+ " : "+strDescription+" ")
			wordSelection.TypeParagraph
			wordSelection.TypeText ("Testcase failed. Please refer screen shot below ")
		End If
		
		wordfile.Selection.Range=wordDoc.Range(wordDoc.Range.end-1,wordDoc.Range.end)
		Set myRange=wordfile.Selection.Range
		'rang.InsertParagraphAfter
		set objShapes=myRange.InlineShapes
		objShapes.AddPicture strFileName
		
		wordSelection.TypeParagraph
		wordSelection.TypeText ("***************************************************************** ")
		wordDoc.Close 
		wordfile.Quit
		
		Set wordfile=nothing
		Set wordDoc=nothing
		Set rang=nothing
		Set wordSelection=nothing
		set objShapes=nothing
	End sub
End Class	
		
Class clsResultLogger

	Dim oLogLevels
	Private m_htLogLevels
	
	Private sub Class_Initialize
		initLogLevel()
	End Sub
	
	Public function initLogLevel
		LogLevels = CreateObject ("Scripting.Dictionary")
		With LogLevels
			.Add "RSLT" ,0
			.Add "WARN" ,1
			.Add "INFO" ,2
			.Add "DEBUG" ,3
		End With
		set initLogLevel=LogLevels
	End Function
	
	Property get LogLevels()
		set LogLevels=m_htLogLevels
	End Property
	
	Public property let LogLevels( byRef dic)
		set m_htLogLevels=dic
	End Property
	
	Private Sub Class_Terminate
		LogLevels=nothing
	End Sub

	Public  Function reportfilter (intFilter)
		Select Case intFilter
			Case 0
				Reporter.Filter =rfEnableErrorsOnly
				' msgbox "Reporting for Error Only enabled"
			Case 1
				Reporter.Filter =rfEnableErrorsAndWarnings
				'   msgbox "Only reporting for errors and warnings enabled"
			Case 2
				Reporter.Filter = rfEnableAll
				' msgbox "All Reports enabled"
			Case 3
				Reporter.Filter = rfEnableAll
				' msgbox "All Reports enabled"
		End Select
	End Function

	Public Sub CaptureScreenshot( ByRef Sender, ByVal micStatus, ByVal strMessage,ByVal descriptionStr )
		Dim dateTimeNow, fileNameStr, divDesc, caption
		Dim dicMetaDescription, qtp
		'Reporter.ReportPath & "\" & DotnetFactory.CreateInstance( "System.DateTime" ).Now.ToString( "ddMMyyHHmmss" ) & ".png"
		
		dateTimeNow = DotNetFactory.CreateInstance( "System.DateTime" ).Now.ToString( "ddMMyyHHmmss" )
		'fileNameStr = Reporter.ReportPath & "\" & dateTimeNow & ".png"
		
		Dim strDataSet			
		strDataSet = Replace (gstrDataset, "|", "##")
		
		'	fileNameStr = gstrCaptureScreenPath & "\" & gstrTestCase & "##" & strDataSet & "##" & dateTimeNow & ".png"
		fileNameStr=CaptureScreenshotNew			
		'			Set qtp = CreateObject( "QuickTest.Application" )
		'			qtp.Visible = False : Wait 0, 500
		'			If IsObject( Sender ) Then
		'				Sender.CaptureBitmap fileNameStr, True
		'				caption = Sender.ToString & " - Capture Bitmap"
		'			Else
		'				Desktop.CaptureBitmap fileNameStr, True
		'				caption = strMessage
		'			End If
		'qtp.Visible = True
		
		divDesc = "<table align=’center’ border=’5′ cellpadding=’1′ cellspacing=’2′ width=’100%’ title=’" & fileNameStr & "' frame=’hsides’>" & _
				"<caption>" & caption & "</caption>" & _
				"<thead><tr><th>Exception Description" & strMessage&"</th></tr></thead>" & _
				"<tfoot><tr><td align=’center’><img src='" & fileNameStr & "' /></td></tr></tfoot>" & _
				"<tbody><tr><td>" & descriptionStr & "</td></tr></tbody></table>"
		
		Set dicMetaDescription = CreateObject( "Scripting.Dictionary" )
		dicMetaDescription( "Status" ) = micStatus
		'			dicMetaDescription( "PlainTextNodeName" ) = "ApplicationException"
		dicMetaDescription("NodeName")="OBTAF : Screen Capture on Failure"
		dicMetaDescription( "StepHtmlInfo" ) = "<DIV align=center>" & divDesc & "</DIV>"
		dicMetaDescription( "DllIconIndex" ) = 205
		dicMetaDescription( "DllIconSelIndex" ) = 205
		dicMetaDescription( "DllPAth" ) = EnVironment( "ProductDir" ) & "\bin\ContextManager.dll"
		'			intContext= Reporter.LogEvent( "User", dicMetaDescription, Reporter.GetContext)
		'			Reporter.SetContext intContext
		
		Reporter.ReportEvent micStatus,strMessage,descriptionStr,fileNameStr 
		'			Reporter.UnSetContext	
	End Sub
		
	Public Function CaptureScreenshotNew()
		Dim dateTimeNow, fileNameStr, divDesc, caption
		Dim dicMetaDescription, qtp
		'Reporter.ReportPath & "\" & DotnetFactory.CreateInstance( "System.DateTime" ).Now.ToString( "ddMMyyHHmmss" ) & ".png"
		
		dateTimeNow = DotNetFactory.CreateInstance( "System.DateTime" ).Now.ToString( "ddMMyyHHmmss" )
		'fileNameStr = Reporter.ReportPath & "\" & dateTimeNow & ".png"
		
		Dim strDataSet			
		strDataSet = Replace(Replace(gstrDataset, "|", "##"),"/","")
		
		gstrTestCase = Replace(gstrTestCase,"/","")
		
		'' Added by  on 29th Nov 2016
		'' Reason to shorten the screenshot file name
		''============================================
		If strDataSet <> "" Then 
		
			fileNameStr = gstrCaptureScreenPath & "\" & gstrTestCase & "_" & Split(strDataSet,"##")(1) & "_" & dateTimeNow & ".png"
			
			'fileNameStr = gstrCaptureScreenPath & "\" & gstrTestCase & "_" & strDataSet & "_" & dateTimeNow & ".png"
			
			'Rohit - UFT screen is not enabled - ISSUE
			'			Set qtp = CreateObject( "QuickTest.Application" )
			'			qtp.Visible = False : Wait 0, 500
			
			If IsObject( Sender ) Then
				Sender.CaptureBitmap fileNameStr, True
				caption = Sender.ToString & " - Capture Bitmap"
			Else
				Desktop.CaptureBitmap fileNameStr, True
				caption = strMessage
			End If
			'qtp.Visible = True
			
			CaptureScreenshotNew=fileNameStr
		End If
	End Function		
End Class

Public Function LogMessage(strType,strMessage,strDescription,strStatus )
	
	If isnull (strStatus) Then
		strStatus=true
		Dim iErrNum, strErrDesc,strSource
		Dim bErrObj
		bErrObj=false
	End If
	
	If err.number<>0 Then
		iErrNum=err.number
		strErrDesc=err.Description
		strSource=err.Source
		err.clear
		bErrObj=true
	End If
	
	Dim arrExcludeScreenShot
	arrExcludeScreenShot = Array("KWEXECUTIONEND","DATASETEND","TESTCASEEND","Exception Handling","DB VERIFICATION","Keyword-Verification")
	bCaptureScreen = ArrayFind(arrExcludeScreenShot,strMessage)
	
	'	Modified By:  on 29th Nov 2016.
	'	Reason : To capture screen shots for both Pass & Fail Scenarios
	'	=================================================================
	
	If ((strType="RSLT") OR (strType="WARN")) AND Not bCaptureScreen Then
	'If ((strType="RSLT") OR (strType="WARN")) AND (UCase(strStatus) = "FALSE") AND Not bCaptureScreen Then
		strFileName = cLogger().CaptureScreenshotNew()
	End If
	
	cExcellogger().LogMessage strType,strMessage,strDescription,strStatus
	
	If Ucase(gstrExecutionFramework)="BDT" AND bWordLog Then
		If ((strType="RSLT") OR (strType="WARN") )AND(ucase(strStatus) ="FALSE") AND Not bCaptureScreen  Then
			cWordFileLogger.LogMessage strMessage,strDescription,strFileName
		End If
	End If
	
	cQTPlogger().LogMessage strType,strMessage,strDescription,strStatus
	
	If (strType="RSLT") AND (ucase(strStatus) ="FALSE") Then
		On Error  Resume Next
		Err.Raise vbObjectError + 100, "Verification Error ", "Verification Error : Result Logger Raised an Error on Verification"
	End If
	
	If  strType="WARN" Then
		If  bErrObj Then
			On Error  Resume Next
			Err.Raise iErrNum,strSource,strErrDesc
		end if 
	End If	
End Function

Private Function setlinkToScreenshot(strFileName)
	Set objExcel = CreateObject("Excel.Application")
	objExcel.Workbooks.Open(gstrLogPath)
	objExcel.Visible = false
	'Replace "macroname", "params1", "param2" with' the appropriate values
	'objExcel.Run "DelEmptyRows", "C:\POC\OBTAF_QTP\OBTAF\ResultLog\ScreenShots_100412140459\Demo_NegativeTest_Place new trade order Quantity field blank_100412143626.png"
	'If there is no parameter for your macro .You can leave this place blank
	objExcel.Run "ThisWorkbook.linkScreenShot",strFileName
	objExcel.Workbooks.Close
	objExcel.Quit
	Set objExcei=nothing
End Function
