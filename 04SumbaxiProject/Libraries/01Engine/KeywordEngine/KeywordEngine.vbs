'''+++++++++++++++++++++++++++++++++++ File Header Information ++++++++++++++++++++++++++++++++++++++++++++++
	'<summary>  This file contains all the class declarations and 
								'functions for the  framework Engine. 
								'It has two class defined i.e. DataEngine and Keyword Engine 
								'DataEngine : reads the data from Test data sheet and 
								'Keyword Engine: executes all the keywords one by one as per sequence
								'</summary>


  ''''++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


Option Explicit


Class clsGlobalVariable
  Dim strFileName
End Class

'TO DO ++++++++++++
' 

''*****************************************************************************************************************************************************
	'<summary>The abstract class for Data Engine. this class provides 
	'all the required methods to read the TestData and arrange it for execution </summary>
''*****************************************************************************************************************************************************
'
	Public Function cKeywordEngine
	  Set cKeywordEngine=New clsKeywordEngine
	End Function



''*******************************************************************************************************************************************************************************

'<summary>The class for KeywordEngine. This class provides 
	'all the required methods to execute the Keywords as per the testdata arrangement</summary>

''*********************************************************************************************************************************************************************************
Class clsKeywordEngine

    Private Sub Class_Initialize()
	 'set  mExcelDataEngine=cDataEngine()

   End Sub

   Private Sub Class_Terminate()
	  'set mExcelDataEngine=nothing
   End Sub

   Public Function startKeywordEngine (arrlstAnyDataSets,bExecute)
		  If bExecute Then
			  driveKeywords arrlstAnyDataSets 
		 Else
			print("Execution of keywords is not demanded")
		  End If

   End Function

   Public Function executeKeyword (strKeyword, arrlstAnyArgs)
	   '//////////This function executes individual keyword as per implementation //////////
	 '////////// Takes input from fetchClassofKeyword and  arglstForKeyword /////////
		Dim cKeywordClass
		cKeywordClass=fetchClassofKeyword (strKeyword,gstrKeywordClassMap)

		Dim bStatus
		strClassName = "" & cKeywordClass
'		  msgbox "I am in Executer " & strClassName
		strStatement = "Set clsObject = New  " &   strClassName
		Execute strStatement

	    On Error Resume Next
	    bStatus= clsObject.runKey(arrlstAnyArgs)		

	   If checkIfNull (bStatus) Then
		   'Print("bStatus is : " & bStatus)		  
            executeKeyword =False
	  Else
			  executeKeyword=bStatus
	   End If

	  If err.number<>0 Then
		  LogMessage "RSLT","Initial Exception", "Intial Error Reported in the Execution of the Keyword:  " & strKeyword & " is  " & Err.Number & " " & Err.description & " " & Err.Source &  " " & Err.HelpContext , false
		  Print ( "Intial Error Reported in the Execution of the Keyword:  " & strKeyword & " is " & Err.Number & " " & Err.description & " " & Err.Source &  " " & Err.HelpContext )		  
		  executeKeyword=False
	  End If
            

   End Function

   Public Function executeRuntimeClass(strClass, arrlstArgs)
	  Dim bStatus
		strClassName = "" & strClass
'		  msgbox "I am in Executer " & strClassName
		strStatement = "Set clsObject = New  " &   strClassName
		Execute strStatement
	    bStatus= clsObject.runKey(arrlstArgs)
	   
	   executeRuntimeClass = bStatus
	   'msgbox err.Number

	
	   If err.number <>0 Then
		   	'raise err.number
			executeRuntimeClass=False
	   End If
		


   End Function

   Public Function driveKeywords(arrlstAnyDataSets)
	  Dim strDS, strDSONOFF,strTempDS
	  ReDim arrlstFailedDS (1)
	  Dim iFailed 
	  iFailed=0

	  For iRowCount=0 To UBound(arrlstAnyDataSets)-1

		  strDS=arrlstAnyDataSets(iRowCount,iDataSet)
		  strDSONOFF=arrlstAnyDataSets(iRowCount,iDataSetONOFF)

          ' *****Log the Starting of the Dataset
		  If ( StrComp(strTempDS, strDS) <> 0 ) And ( StrComp(UCase(strDSONOFF), "ON") = 0 )  Then
               err.clear
              strTempDS = strDS
			  gstrDataset = strTempDS

			  Print gstrDataset

			  Dim strTempTestName

              If (Instr(1, gstrDataset, "|") > 0) Then
				  Dim arrSplit
				  arrSplit = Split(gstrDataset, "|")
				  strTempTestName = arrSplit(0)
              else
			      strTempTestName = gstrDataset
			  End If 

			 Dim dateTimeNow
			 dateTimeNow = DotNetFactory.CreateInstance( "System.DateTime" ).Now.ToString( "ddMMyyHHmmss" )

              setMachineEnviromentalVariable "User", "testcasename", gstrTestCase & "##" & strTempTestName & "##" & dateTimeNow

			   If  (bDemo) Then
				   	' Display a message for 2 seconds
				Set objShell = CreateObject("Wscript.Shell")
				objShell.Popup "**************I am Executing the Test  "+gstrDataset+"**************************************", 3, "Automation Test Execution Details "
				set objShell = Nothing

			   End If
			   
			   
'Rohit - for individual KW execution 
'			  ''' TO DO **** Uncomment below line after implmenting BaseAppState-----
'              'Initialize Application
'			  setBaseAppState()
'			  '_________________________________
              
              logmessage "INFO", "DATASETSTART", "Starting DataSet " & gstrDataset, True

              

			
		  End If

		  'If Keyword Executed Successfully. Do logging accordingly
		  If Not ArrayFind(arrlstFailedDS, gstrDataset) And  (StrComp(UCase(strDSONOFF), "ON") = 0)   Then

			  strKeyword= arrlstAnyDataSets (iRowCount,iKeyword)
			  lstAnyArgs= arrlstAnyDataSets (iRowCount,iArguments) 
			  gstrDataset = strTempDS
			  gstrKeyword = strKeyword
			  gstrMachine = arrlstAnyDataSets (iRowCount,iMachine)
			 gstrKeyword = strKeyword

			 If  iMachine <>0 Then
				 gstrMachine = checknull( arrlstAnyDataSets (iRowCount,iMachine))
			 End If
			
			 gstrAction =checknull( arrlstAnyDataSets (iRowCount,iAction))

			  If  iStartPage <> 0Then
				  gstrStartPage = checknull(arrlstAnyDataSets (iRowCount,iStartPage))
			 End If

			  If  iEndPage <> 0Then
				  gstrEndPage = checknull(arrlstAnyDataSets (iRowCount,iEndPage))
			 End If

			  If  iBrowser <> 0Then
				  gstrBrowser = checknull(arrlstAnyDataSets (iRowCount,iBrowser))
			 End If


			 If  iExceptionType <> 0Then
				  gstrExceptionType = checknull(arrlstAnyDataSets (iRowCount,iExceptionType))
			 End If

			  If  iExpDetails <> 0Then
				  gstrExpDetails = checknull( arrlstAnyDataSets (iRowCount,iExpDetails))
			 End If

			  If  iExpAction <> 0Then
				  gstrExpAction = checknull( arrlstAnyDataSets (iRowCount,iExpAction))
			 End If
			
			 If (Not IsNull(bLogging)) And bLogging Then
                 logmessage "INFO","KWEXECUTIONSTART","Starting Execution of  Keyword " & strKeyword & " with Action " & gstrAction,True
			 End If

			 Dim bKeywordSuccess
			 On Error Resume Next

'<>
'	Dim strCurrDataSet, strMsg
'	Dim objPopup
'	
'	If strCurrDataSet<>gstrDataset Then
'		arrDataSet = Trim(Split(gstrDataset,"|"))
'		strMsg = "Entering TestCase - DataSet - " + arrDataSet(1)
'		strDatasetStatus = getDatasetStatusInfo(gstrTestCase,gstrKWSheetPath,arrDataSet(1))
'		Set objPopup = CreateObject("WScript.Shell")
'		objPopup.Popup strMsg, 3, "Starting New DataSet"
'		strCurrDataSet = gstrDataset
'	End If
'	

'</>


			 bKeywordSuccess = executeKeyword(gstrKeyword, lstAnyArgs) 
			 'print("Keyword" +gstrKeyword+" Execution "& bKeywordSuccess)

			 'Exception Didn't come. Check if Exception was Expected or Not 
			  If err.number = 0 Then
			
					 Dim bKeywordException
					 Set KeywordExceptionHandling = cExceptionHandling()
					 bKeywordException = KeywordExceptionHandling.HandleExpectedException()
		
		
					 If bKeywordException Then
							 If (Not IsNull(bLogging)) And bLogging Then
								logmessage "INFO","KWEXECUTIONEND", "Keyword "  & gstrKeyword & " with Action " & gstrAction &" ran successfully",True
							End If
		
					 Else
							If (Not IsNull(bLogging)) And bLogging Then
									LogMessage "WARN", "KWEXECUTIONEND",  "Keyword " & strKeyword  & " with Action " & gstrAction & " Failed Execution" & gstrExceptionData, False
				
									'Add DataSet to list of Failed DataSets
									ReDim Preserve arrlstFailedDS(CInt(UBound(arrlstFailedDS)+1))
									arrlstFailedDS(iFailed)=gstrDataSet
									iFailed = iFailed+1

                            		LogMessage "WARN", "DATASETEND", "DataSet  "& strDS & " Failed,   " & gstrExceptionData, False				

								If not bAppState Then 'Updated by  04/10/2013 '
								   LogOff()
								  DisconnectAll()
							   End If

							End If
		
					 End If
			


			 '  Exception came. Check if Exception Was Expected or Not.  If  Yes, Execute the Exception Keywords else Raise the Exception
			 else

					 Set KeywordExceptionHandling = cExceptionHandling()					
	
					 Dim bKeywordWithException
					 bKeywordWithException = KeywordExceptionHandling.handleException()

					 If bKeywordWithException Then
	
						 LogMessage "INFO", "KWEXECUTIONEND", "Successfully Handled Execption of Keyword " & gstrKeyword & " with Action " & gstrAction , True
						 LogMessage "INFO", "DATASETEND", "DataSet  " & strDS & " Executed Successfully "  &  gstrExceptionData, True

						If not bAppState Then 'Updated by  04/10/2013 '
						   LogOff()
						  DisconnectAll()
					   End If
	
						 ''''TODO%%%%%To be modified 
						 arrlstFailedDS(iFailed)=gstrDataSet
						iFailed = iFailed+1
	
					 Else

'							If err.number <> 0 Then
'								   logMessage "WARN",  "Exception Handling",  "Exception Reported  in the Exception Handling of Keyword " & gstrKeyword & " is  " & Err.Number & " " & Err.description & " " & Err.Source &  " " & Err.HelpContext , False						
'							End If

							logMessage "WARN", "KWEXECUTIONEND", "Keyword " & gstrKeyword & " with Action " & gstrAction & " Failed Execution", False

							ReDim Preserve arrlstFailedDS(CInt(UBound(arrlstFailedDS)+1))
							arrlstFailedDS(iFailed)=gstrDataSet
							iFailed = iFailed+1
							Print("Error occured is " & gstrExceptionMessage)
							
							LogMessage "WARN", "DATASETEND", "DataSet  "& strDS & " Failed,   " & gstrExceptionData, False

						If not bAppState Then 'Updated by  04/10/2013 '
						   LogOff()
						  DisconnectAll()
					   End If
	
					 End If


			 End If

			 If iRowCount < UBound(arrlstAnyDataSets) - 1 And (ArrayFind( arrlstFailedDS,gstrDataSet) = False) Then

					 Dim strDsPlus1
					 strDsPlus1=  arrlstAnyDataSets(iRowCount+1, iDataSet)

					 If StrComp(strDS,strDsPlus1)  And (Not IsNull(bLogging)) And bLogging Then
						 logmessage"INFO","DATASETEND","Ending DataSet "& strDS, True

						If not bAppState Then 'Updated by  04/10/2013 '
						   LogOff()
						  DisconnectAll()
					   End If
				
					 End If
			 Else

					If iRowCount=UBound(arrlstAnyDataSets)-1 And (ArrayFind( arrlstFailedDS,gstrDataSet)=False) And (Not IsNull(bLogging)) And bLogging  Then
						logmessage"INFO","DATASETEND","Ending DataSet "&strDS, True
						If not bAppState Then 'Updated by  04/10/2013 '
						   LogOff()
						  DisconnectAll()
					   End If
						    	
					End If
   
			 End If

        Else
				print("It is a failed dataset so Skipping")

		End If

	  Next
   
   End Function
   

		Private Function fetchClassofKeyword (strKeyword, strClassMapFile)
			'//////// This function fetch the class of Keyword/////////////
		   '////////  Takes input as Keyword /////////
		   Dim strTable
		   strTable ="KeywordClassMap"
		   Dim strConnection,strSQLStatement,strClassName,strStatement,strData,strMyClassName
		   
				strSQLStatement="Select  *  from [KeywordClassMap$] where   Keyword ='"& strKeyword &"' "
			   'strSQLStatement="Select  Class  from ["& strTable &"$] where   Keyword =' "& strKeyword &"' "
				strClassName = "clsExcelDataEngine"
				strStatement = "Set clsObj = New  " &   strClassName
				Execute strStatement
				strData=clsObj.FetchExcelValue (strSQLStatement,strClassMapFile)
				'Print("strData:"&strData(0,1))
				strMyClassName=strData(0,1)
			   ' msgbox strData(0,3)
			  fetchClassofKeyword = strMyClassName
	   
		End Function

  

End Class


'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


'%%%%%%%%%%Common Functions %%%%%%%%%%%%%%%%
Function arrStringPos (strArrylist, strTextToFind)
	Dim iCount,strTempText
	For iCount = 0 To UBound(strArrylist)
		strTempText = strArrylist(iCount)
		If  strTextToFind = strTempText Then
			arrStringPos= iCount
			Exit Function
		End If
	Next
   
End Function

Function ArrayFind(strArrylist,strFind)
  Dim iCount,strTempText
	For iCount = 0 To (UBound(strArrylist))
		strTempText = strArrylist(iCount)
	   ' msgbox ""&strTempText & ","&strFind
		If  Trim(strTempText) = Trim(strFind) Then
			ArrayFind= True
			Exit Function
		End If
	Next
    ArrayFind= False
End Function

Function ArrayFind_2D(strArrylist,strFind)
  Dim iCount,strTempText
  int1DCount=Ubound(strArrylist,1)
  int2DCount=Ubound(strArrylist,2)
	For iCount = 0 To int1DCount
		For i=0 to int2DCount
			strTempText = strArrylist(iCount,i)			
	   ' msgbox ""&strTempText & ","&strFind
			If  strTempText = strFind Then
				ArrayFind_2D= True
				Exit Function
			End If
		Next
	Next
    ArrayFind_2D= False
End Function

Function checknull(strValue)

	   If UCase(strValue) ="BLANK" Or  strValue ="" Or IsNull(strValue) Then
		   checknull =Null
			Exit Function
		End if
	
		' Check to see if the argument contains the word "Null"
		If  Trim(UCase(strValue)) ="NULL" Then
				checknull =""
				 Exit Function
		End If

         'Check if  String has brackets only
         If  ((Instr(strValue,  "|") = 0 And  Instr(strValue,  ")") > 0 ) AND ( Instr(strValue,  "(" ) > 0 ))Then
               checknull=strValue
                Exit Function
         End If

 
		' Check to see if the argument  is  List of String Datatype
		If  Instr(strValue,  "|") > 0 And  Instr(strValue,  "(" ) <> 1 Then
			 Dim lstStr
			 lstStr = castStringToListOfString (strValue)
			 checknull = lstStr
			 Exit Function
		End If
	
		' Check to see if the argument  is List of  List of String Datatype
		If  Instr(strValue,  "(") = 1 AND Instr(strValue,  ")|") > 0 Then
			 Dim array2D
			 array2D = castStringToListOfListOfString(strValue)
			 checknull = array2D
			 Exit Function
		End If
			
		checknull = strValue
			
   
End Function

'%%%%%%%%%%Keyword Classes %%%%%%%%%%%%%%%%


'***********Read Ini file*******************************
 'Functions to read the configuration parameters from .INI file

Public Function getConfig( strSection , strKey )

	
	 On Error Resume Next  
	 'On error goto ErrTrap
	 
	 Extern.Declare micInteger,"GetPrivateProfileStringA", "kernel32.dll","GetPrivateProfileStringA", micString, micString, micString, micString+micByRef, micInteger, micString 
	
	Dim key,  key2 
	Dim strValue,i,strConfigVal
	'strSection="Config"
	'strKey="ProjectPath"
	'strValue=String(32, "-") 
	key = String(1024, "-") 
	
	i = Extern.GetPrivateProfileStringA(strSection,strKey,"NOT_FOUND", key, 1024, gstrConfigFile) 
	
	strValue = Left(key,i) 
	
	If strValue = "NOT_FOUND" Then
					LogMessage micFail, "Read Config ","An error occured: could not read Project config parameter,check config.ini file"
	End If
			 
	
				If Err.Number <> 0 Then
				   
					
				   ' Err.Raise(Err.Number, , "Error form Fucntions.GetIniSettings " & Err.Description)
					  LogMessage micFail, "Read Config ","An error occured:  " &  err.description 
				End If
				
	   getConfig = strValue
	   Exit Function
End Function





 
Function RecoveryFunction1(Object, Method, Arguments, retVal)
 
End Function 
 
'
'
'	Private Function getDatasetStatusInfo(strTestCase,strFileName,strDataset)
'		strCurrTestCase = "Data_" + strTestCase
'		strSQLStatement = "Select Dataset from ["& strCurrTestCase &"$] where ["& strCurrTestCase &"$].DataSetOnOff = 'ON' And ["& strCurrTestCase &"$].RecordType <> 'KWI' "
'		Dim objAdsRs, objCon
'		objCon=cExcelDataEngine.dbConnection (strFileName)
'		Set objAdRs = CreateObject("ADODB.Recordset") 
'		objAdRs.Open strSQLStatement, objCon
'		arrtamp = objAdRs.GetRows
'		iTemp = objAdRs.Find(strDataset)		
'		getDatasetStatusInfo = arrtamp
'	End Function
