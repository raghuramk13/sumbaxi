'+++++++++++++++++++++++++++++++++++ File Header Information ++++++++++++++++++++++++++++++++++++++++++++++
	'<Summary>  This file contains all the class declarations and 
								'functions for the  Driving the Test cases
                                '</summary>

	

   '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Option Explicit
	Public function cDriveEngine
		 set cDriveEngine=new clsDriveEngines
		 err.clear
	End Function

 Class clsDriveEngines


		 Private sub Class_Initialize()
			 'set  mExcelDataEngine=cDataEngine()
		 End Sub
	
		Private sub Class_Terminate()
			  'set mExcelDataEngine=nothing
		 End Sub

		Public Function ExecuteKWDrivenTest (strTestcaseName,strKWSheetPath,bExecKeywords,strDataSetFilter)
		Set oDataEngine=cDataEngine()
		Set oKeywordEngine=cKeywordEngine()
		Dim lstLstAnyData
		'// Logging the Testcase Start
		
			If  bExecKeywords Then
				err.clear
				logmessage"INFO","TESTCASESTART","Starting testcase "&gstrTestcaseName,True
			End If

		'Start DataEngine
		lstLstAnyData=oDataEngine.startDataEngine (strTestcaseName,strKWSheetPath, strDataSetFilter) '$Satheesh
	   
		
		'Start Keyword Engine
		oKeywordEngine.startKeywordEngine lstLstAnyData, bExecKeywords
		
			If  bExecKeywords Then
				If err.number<>0 Then
					logmessage"WARN","TESTCASEEND","End of Test case "&gstrTestcaseName,False
				else

					logmessage"INFO","TESTCASEEND","End of Test case "&gstrTestcaseName,True

				End If

'Rohit 
'		 LogOff()
'		DisconnectAll()		
			End If
		
		
		
		End Function

		Public Function ExecuteBDTest (strTestcaseName,strKWSheetPath,bExecKeywords,strDataSetFilter)
		Set oDataEngine=cDataEngine()
		Set oKeywordEngine=cKeywordEngine()
		Dim lstLstAnyData
		'// Logging the Testcase Start
		
			If  bExecKeywords Then
				err.clear
				logmessage"INFO","TESTCASESTART","Starting testcase "&gstrTestcaseName,True
			End If

		'Start DataEngine
		lstLstAnyData=oDataEngine.startDataEngine (strTestcaseName,strKWSheetPath, strDataSetFilter) '$Satheesh
	   
		
		'Start Keyword Engine
		oKeywordEngine.startKeywordEngine lstLstAnyData, bExecKeywords
		
			If  bExecKeywords Then
				If err.number<>0 Then
					logmessage"WARN","TESTCASEEND","End of Test case "&gstrTestcaseName,False
				else

					logmessage"INFO","TESTCASEEND","End of Test case "&gstrTestcaseName,True

				End If

		 LogOff()
		DisconnectAll()		
			End If
		
		
		
		End Function
 End Class
