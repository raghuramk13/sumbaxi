'@Connects to the data base with given connection string using ODBC. 
'ODBC drivers for relevent database must be installed on machine
Public Function dbConnect(strConnString)
	Dim myConnection, myRecord
	Set myConnection = CreateObject("ADODB.Connection")
	myConnection.Open strConnString
	'set myRecord=CreateObject("ADODB.recordset")
	'sql = "SELECT * FROM jbpm_variableinstance"
	'myRecord.Open sql, myConnection

	If Err <> 0 Then
		Reporter.ReportEvent micFail,"Create Connection", "[Connection] Error has occured. Error : " & Err
		 Set dbConnection = Nothing
		Exit Function
	End If

	set dbConnect=myConnection
End Function

Public Function executeQuery (strConnString,strQuery)
	Dim objRs, objConn, lstMyResult
	
	'set objConn=dbConnect (strConnString)
	Dim myConnection, myRecord
	Set myConnection = CreateObject("ADODB.Connection")
	Set objRs = CreateObject("ADODB.recordset")
	
	'objRs.CursorType=aduseClient
	myConnection.Open strConnString
	'set myRecord=CreateObject("ADODB.recordset")
	'sql = "SELECT * FROM jbpm_variableinstance"
	'myRecord.Open sql, myConnection

	If Err <> 0 Then
		Reporter.ReportEvent micFail,"Create Connection", "[Connection] Error has occured. Error : " & Err
		 Set dbConnection = Nothing
		Exit Function
	End If

	objRs.CursorLocation = 3
	objRs.CursorType = 3
	
	objRs.Open strQuery,myConnection
	
	Dim iColCount,iRowCount, i
				iColCount=objRs.fields.count ' Get max number of columns 
             

		''Get max number of Rows
			iRowCount=objRs.RecordCount
					'msgbox iRowCount
					'Dim MyRowData()
				ReDim MyRowData (0,0)
					ReDim MyRowData (cInt(iRowCount)-1,  cInt(iColCount)-1) 'change dimension of array
				'   objRs.MoveFirst
					iRowCount=0
					
			   ' MsgBox iColName
					While objRs.EOF=false
                        'MsgBox(objAdRs.GetRows ())
							 For i=0 to iColCount-1
									'msgbox objAdRs.fields(i)
									If isNull(objRs.fields(i).value) Then
										MyRowData(iRowCount,i)=""
									else
										MyRowData(iRowCount,i)=( Cstr((objRs.fields(i).value)))
										'MyRowData(iRowCount,i).Charset = "utf-8"
									End If 
							Next   
							iRowCount=iRowCount+1
							objRs.moveNext   	
					Wend


'While Not objRs.EOF
'msgbox objRs.Fields(0).Value
'objRs.MoveNext
'Wend

'objRs.close
myConnection.Close
Set objRs = Nothing
Set myConnection = Nothing
executeQuery=MyRowData
End Function



Public Function executeSQLFile (strConnString, strSQLFile)
		Dim objAdsRs, objCon, lstMyResult
		objCon=dbConnect (strConnString)

		' reading a file line by line
		Const ForReading = 1
' create file system object
		Set objFS = CreateObject("Scripting.FileSystemObject")
		set myRecord=CreateObject("ADODB.recordset")
' first check that the file exists
	If objFS.FileExists(strSQLFile) Then
	
		' open the text file for reading
		Set objFile = objFS.OpenTextFile(strSQLFile, ForReading, False)
	
		' do until at end of file
		Do Until objFile.AtEndOfStream
	
			' store the value of the current line in the file
			strLine = objFile.ReadLine
			If (strLine<>" ")  AND  (strLine<>"")Then
			
			' show the line from the file
			'MsgBox strLine
			'obRecset=objCon.Execute (strLine,arrtest ,adCmdText)
			myRecord.Open strLine,objCon
'			for each r in myRecord.fields
'				 msgbox r.name
'			next
			End If
		Loop ' next line
	
		' close the file
		objFile.Close
	
		Set objFile = Nothing

		else
'			set objFS=nothing
'
'			 objCon.close
'			 Set objCon = Nothing
			executeSQLFile=false
	end If

	set objFS=nothing

	' Set objAdRs.ActiveConnection = Nothing   		
					 'msgbox MyRowData(1,3)
					 'myRecord.Close
					 'objCon.close
					 Set objCon = Nothing  	
	executeSQLFile=true
End Function

Public function queryDB(strDBType, strDBServer, strDBName, strUser, strPassword,strQuery)
	if UCase(strDBType)="ORACLE" then
		Select Case strDBServer
		'Oracle in OraClient11g_home1
		Case "DB_ICALL"
			strConnString="Driver={Microsoft ODBC for Oracle};" & _
		"CONNECTSTRING=(DESCRIPTION=" & _
		"(ADDRESS=(PROTOCOL=TCP)" & _
		"(HOST="&strDBName&")(PORT=1521))" & _
		"(CONNECT_DATA=(SERVICE_NAME=BPMSIT))); uid="&strUser&" ;pwd="&strPassword&";"

		Case "IServe_CCDev"
			strConnString="Driver={Microsoft ODBC for Oracle};" & _
		"CONNECTSTRING=(DESCRIPTION=" & _
		"(ADDRESS=(PROTOCOL=TCP)" & _
		"(HOST="&strDBName&")(PORT=1521))" & _
		"(CONNECT_DATA=(SERVICE_NAME="&gstrSID_CC&"))); uid="&strUser&";pwd="&strPassword&";"
		
		Case "ULSTP-DEV"
			strConnString="Driver={Microsoft ODBC for Oracle};" & _
		"CONNECTSTRING=(DESCRIPTION=" & _
		"(ADDRESS=(PROTOCOL=TCP)" & _
		"(HOST="&strDBName&")(PORT=1521))" & _
		"(CONNECT_DATA=(SERVICE_NAME="&gstrICallDBBranch_SID&"))); uid="&strUser&";pwd="&strPassword&";"
		
		Case "DB_ICALL_SIT_FE"
			strConnString="Driver={Microsoft ODBC for Oracle};" & _
		"CONNECTSTRING=(DESCRIPTION=" & _
		"(ADDRESS=(PROTOCOL=TCP)" & _
		"(HOST=10.91.35.175)(PORT=1521))" & _
		"(CONNECT_DATA=(SERVICE_NAME=BPMSIT))); uid=ISERVEUR1; pwd=ISERVEUR1_123;"
		
		'Added the below case for testing R1602 
		Case "DB_ICALL_SIT_FE_1602"
        	strConnString="Driver={Microsoft ODBC for Oracle};" & _
        "CONNECTSTRING=(DESCRIPTION=" & _
        "(ADDRESS=(PROTOCOL=TCP)" & _
        "(HOST=10.91.35.175)(PORT=1521))" & _
        "(CONNECT_DATA=(SERVICE_NAME=BPMSIT))); uid=ISERVEUR; pwd=ISERVEUR123;"
        
        Case "DB_ICALL_SIT_OL_1602"
        	strConnString="Driver={Microsoft ODBC for Oracle};" & _
        "CONNECTSTRING=(DESCRIPTION=" & _
        "(ADDRESS=(PROTOCOL=TCP)" & _
        "(HOST=10.91.35.176)(PORT=1521))" & _
        "(CONNECT_DATA=(SERVICE_NAME=BPMSIT))); uid=CCADB; pwd=password;"

		Case "DB_ICALL_SIT_OL"
			strConnString="Driver={Microsoft ODBC for Oracle};" & _
		"CONNECTSTRING=(DESCRIPTION=" & _
		"(ADDRESS=(PROTOCOL=TCP)" & _
		"(HOST=10.91.35.176)(PORT=1521))" & _
		"(CONNECT_DATA=(SERVICE_NAME=BPMSIT))); uid=CCADB; pwd=password;"
		
		Case "DB_SG_CS_SIT"
			strConnString="Driver={Microsoft ODBC for Oracle};" & _
		"CONNECTSTRING=(DESCRIPTION=" & _
		"(ADDRESS=(PROTOCOL=TCP)" & _
		"(HOST=10.91.37.210)(PORT=1521))" & _
		"(CONNECT_DATA=(SERVICE_NAME=WISAPP))); uid=iserveccrel; pwd=welcome123;"
		
		Case "DB_ICALL_OL_CS_SIT"
			strConnString="Driver={Microsoft ODBC for Oracle};" & _
		"CONNECTSTRING=(DESCRIPTION=" & _
		"(ADDRESS=(PROTOCOL=TCP)" & _
		"(HOST=10.91.37.210)(PORT=1521))" & _
		"(CONNECT_DATA=(SERVICE_NAME=WISAPP))); uid=icall_user; pwd=icall_user456;"
		
		'this is for C@S UAT OL (added by Sunil)
		Case "DB_ICALL_OL_CS_UAT"
			strConnString="Driver={Microsoft ODBC for Oracle};" & _
		"CONNECTSTRING=(DESCRIPTION=" & _
		"(ADDRESS=(PROTOCOL=TCP)" & _
		"(HOST=10.91.37.210)(PORT=1521))" & _
		"(CONNECT_DATA=(SERVICE_NAME=WISAPP))); uid=icall_user; pwd=Password1;"
		
		'this is for C@S UAT FE (added by Sunil)
		Case "DB_SG_CS_UAT"
			strConnString="Driver={Microsoft ODBC for Oracle};" & _
		"CONNECTSTRING=(DESCRIPTION=" & _
		"(ADDRESS=(PROTOCOL=TCP)" & _
		"(HOST=10.91.37.210)(PORT=1521))" & _
		"(CONNECT_DATA=(SERVICE_NAME=WISAPP))); uid=icall_user; pwd=Password1;"
		
		Case "DB_ICALL_UAT_FE"
            strConnString="Driver={Microsoft ODBC for Oracle};" & _
        "CONNECTSTRING=(DESCRIPTION=" & _
        "(ADDRESS=(PROTOCOL=TCP)" & _
        "(HOST=10.91.37.210)(PORT=1521))" & _
        "(CONNECT_DATA=(SERVICE_NAME=WISAPP))); uid=icall_user; pwd=icall_user456;"
        
        Case "DB_ICALL_UAT_OL"
            strConnString="Driver={Microsoft ODBC for Oracle};" & _
        "CONNECTSTRING=(DESCRIPTION=" & _
        "(ADDRESS=(PROTOCOL=TCP)" & _
        "(HOST=10.91.37.210)(PORT=1521))" & _
        "(CONNECT_DATA=(SERVICE_NAME=WISAPP))); uid=icall_user; pwd=icall_user456;"
		
		Case "DB_ICALL_SIT"
			strConnString="Driver={Microsoft ODBC for Oracle};" & _
		"CONNECTSTRING=(DESCRIPTION=" & _
		"(ADDRESS=(PROTOCOL=TCP)" & _
		"(HOST=10.92.127.60)(PORT=1522))" & _
		"(CONNECT_DATA=(SERVICE_NAME=ISERVECC))); uid=iserveccrel; pwd=iserveccrel123$;"
		
		Case "DB_SG_CRM"
			strConnString="Driver={Microsoft ODBC for Oracle};" & _
		"CONNECTSTRING=(DESCRIPTION=" & _
		"(ADDRESS=(PROTOCOL=TCP)" & _
		"(HOST=10.92.127.60)(PORT=1522))" & _
		"(CONNECT_DATA=(SERVICE_NAME=ISERVECC))); uid=ISERVEUR; pwd=ISERVEUR123;"
		
		Case "DB_ICALL_UAT"
			strConnString="Driver={Microsoft ODBC for Oracle};" & _
		"CONNECTSTRING=(DESCRIPTION=" & _
		"(ADDRESS=(PROTOCOL=TCP)" & _
		"(HOST="&strDBName&")(PORT=1521))" & _
		"(CONNECT_DATA=(SERVICE_NAME=TIBREPO.DBS.COM.SG))); uid="&strUser&";pwd="&strPassword&";"

		Case "DB_ICALL_UAT1"
			strConnString="Driver={Microsoft ODBC for Oracle};" & _
		"CONNECTSTRING=(DESCRIPTION=" & _
		"(ADDRESS=(PROTOCOL=TCP)" & _
		"(HOST="&strDBName&")(PORT=1521))" & _
		"(CONNECT_DATA=(SERVICE_NAME=wisapp))); uid="&strUser&";pwd="&strPassword&";"

		Case "EXCEL"
			strConnString="DRIVER={Microsoft Excel Driver (*.xls, *.xlsx, *.xlsm, *.xlsb)};DBQ="&strDBName & ";Readonly=False"
	End Select
			
	ElseIf UCase(strDBType)= "MARIADB" Then
		'check the strDBServer
		Select Case strDBServer
			Case "DB_ICALL_SIT_FE_1603"
				'Connect to Maria DB
				'strConnString = "Driver={MariaDB ODBC 2.0 Driver};Server=10.92.145.67;UID=iservesgdev;PWD=Iservesgdev_123;DB=iservesgdev;Port=6603"
				
				'Use MySQL ODBC Connector
				strConnString = "DRIVER={MySQL ODBC 5.3 Unicode Driver};SERVER=10.92.145.67;DATABASE=iservesgsit;USER=iservesgsit;PASSWORD=Iservesgsit@123;Port=6603;OPTION=3;"
				
			Case "DB_ICALL_LISA_FE" 'Connect to Maria DB
				'Use MySQL ODBC Connector
				strConnString = "DRIVER={MySQL ODBC 5.3 Unicode Driver};SERVER="&strDBName&";DATABASE="&gstrICallDbName_CC&";USER="&strUser&";PASSWORD="&strPassword&";Port="&gstrICallDBPort&";OPTION=3;"
			Case "DB_ICALL_DEV_FE_1701"
				'Use MySQL ODBC Connector
				strConnString = "DRIVER={MySQL ODBC 5.3 Unicode Driver};SERVER=10.92.145.84;DATABASE=iservesgr1;USER=iservesgr1;PASSWORD=Test_123_$;Port=4006;OPTION=3;"			
			Case "DB_ICALL_DEV_FE_1702"
				'Use MySQL ODBC Connector
				strConnString = "DRIVER={MySQL ODBC 5.3 Unicode Driver};SERVER=10.92.145.85;DATABASE=iservesgr1;USER=iservesgr1;PASSWORD=Iservesgr1#12;Port=6603;OPTION=3;"							
		End Select
	End If

arrDBData=executeQuery (strConnString, strQuery)
queryDB=arrDBData
		
End Function
Public Function ExecuteDBQuery(strDBType, strDBServer, strDBName, strUser, strPassword,strQuery)
		if UCase(strDBType)="ORACLE" then
		Select Case strDBServer
		'Oracle in OraClient11g_home1
		Case "DB_ICALL"
			strConnString="Driver={Microsoft ODBC for Oracle};" & _
		"CONNECTSTRING=(DESCRIPTION=" & _
		"(ADDRESS=(PROTOCOL=TCP)" & _
		"(HOST="&strDBName&")(PORT=1521))" & _
		"(CONNECT_DATA=(SERVICE_NAME=BPMSIT))); uid="&strUser&";pwd="&strPassword&";"

		Case "DB_ICALL_UAT"
			strConnString="Driver={Microsoft ODBC for Oracle};" & _
		"CONNECTSTRING=(DESCRIPTION=" & _
		"(ADDRESS=(PROTOCOL=TCP)" & _
		"(HOST="&strDBName&")(PORT=1521))" & _
		"(CONNECT_DATA=(SERVICE_NAME=wisapp))); uid="&strUser&";pwd="&strPassword&";"

		Case "EXCEL"
			strConnString="DRIVER={Microsoft Excel Driver (*.xls, *.xlsx, *.xlsm, *.xlsb)};DBQ="&strDBName & ";Readonly=False"
	End Select
	
	ElseIf UCase(strDBType)= "MARIADB" Then
			'check the strDBServer
			Select Case strDBServer				
				Case "DB_ICALL_DEV_FE_1701"
					'Use MySQL ODBC Connector
					strConnString = "DRIVER={MySQL ODBC 5.3 Unicode Driver};SERVER=10.92.145.67;DATABASE=iservesgr2;USER=iservesgr2;PASSWORD=Iservesgr2#12;Port=6603;OPTION=3;"			
			End Select
			
	
	End If

	Dim objRs, objConn, lstMyResult
	
	'set objConn=dbConnect (strConnString)
	Dim myConnection, myRecord
	Set myConnection = CreateObject("ADODB.Connection")
	Set objRs = CreateObject("ADODB.recordset")
	'objRs.CursorType=aduseClient
	myConnection.Open strConnString
	'set myRecord=CreateObject("ADODB.recordset")
	'sql = "SELECT * FROM jbpm_variableinstance"
	'myRecord.Open sql, myConnection

	If Err <> 0 Then
		Reporter.ReportEvent micFail,"Create Connection", "[Connection] Error has occured. Error : " & Err
		 Set dbConnection = Nothing
		Exit Function
	End If

	objRs.CursorLocation = 3
	objRs.CursorType = 3
	
	objRs.Open strQuery,myConnection
	If Err<>0  Then
		Reporter.ReportEvent micFail,"Failed to execute Query. Error : " & Err
		myConnection.Close
		Set objRs = Nothing
		Set myConnection = Nothing
		ExecuteDBQuery=false
		Exit Function
	End If
	myConnection.Close
	Set objRs = Nothing
	Set myConnection = Nothing
	ExecuteDBQuery=true
End Function

Public Function verifyDBValue(strDBType, strDBServer, strDBName, strUser, strPassword,strQuery, strKeyword,strAction,arrExpectedData)
	'If Query needs to read valur from dataStore
	'	strNewQuery=updateStringFormDataStore(strQuery,strKeyword,strAction)

   Dim arrActual
   arrActual=queryDB(strDBType, strDBServer, strDBName, strUser, strPassword,strQuery)
	If isNull(arrActual) OR isEmpty(arrActual) Then
			LogMessage "RSLT","Verification","Failed to retrive values from Database: ", false
	End If
	arrTemp=returnColumnValuesForARow (arrActual,0)
	
   	If compareArray(arrTemp,arrExpectedData) Then
			LogMessage "RSLT","Verification","Expected values matched with actual values in Database", true
		else
			LogMessage "RSLT","Verification","Expected values does not  matched with actual values  in Database: ", false
		End If
verifyDBValue=true
End Function
'
'
'
Public Function compareTwoDBTables(strExcelFilePath,strExcelTable,strQuery_Excel,strQuery_DB)
	bCompare=true
	'strTableName="SRType"
	'strSQLStatement="Select  [" & strTableName & "$].Related_To,[" & strTableName & "$].Sub_Area  from [" & strTableName & "$] where [" & strTableName & "$].Related_To='Cashline' order by  [SRType$].Related_To ASC, [SRType$].Sub_Area  ASC"
	
	'strFileName="D:\OBTAF_QTP\testdata\Story 294\C3_Fields_Required_1.1.xlsx"
	'arrExcelData=cExcelDataEngine.FetchExcelValue(strSQLStatement,strFileName)
	arrExcelData= queryDB("ORACLE","EXCEL", strExcelFilePath,"","",strQuery_Excel)
	'strQuery= "select related_to, sub_status from cca_sr where related_to='Cashline' order by Related_To ASC, sub_Type ASC"
	arrDB=queryDB( "ORACLE", "DB_ICALL", gstrICALLDB, gstrICallDBUser, "password",strQuery_DB)
	
	  If  Not ( UBound(arrExcelData) = UBound(arrDB) ) Then
		LogMessage "WARN","Verification","number of rows retrived from ICall Database does not match with Excel data. Excel Rows are: "&UBound(arrExcelData)&  "And  Database rows are"& UBound(arrDB), false
		  bCompare = False
	 End If        
	
			For iRowCount = 0 to UBound(arrExcelData,1)
				bValCompare=true
				For iColCount=0 to Ubound(arrExcelData,2)
					strExcelVal=arrExcelData(iRowCount,iColCount)
					strDBVal=arrDB(iRowCount,iColCount)
					'If not strExcelVal=strDBVal Then
				   	If not ArrayFind_2D(arrExcelData,strDBVal )Then
						  bValCompare = False
					End If
				Next
				If not bValCompare Then
					bCompare=false
					'print "Data from Excel and Icall DB not matched for Row Number"&iRowCount+1&" Excel Data: "&strExcelVal&", Icall DB Data: "&strDBVal
					LogMessage "WARN","DB Verification","Data from Excel and Icall DB not matched for Row Number"&iRowCount+1&" Excel Data: "&strExcelVal&" And  iCall DB Data: "&strDBVal,false 
					LogMessage "INFO","DB Verification"," Excel Data: "&strExcelVal ,true 
					LogMessage "INFO","DB Verification"," iCall DB Data: "&strDBVal,true 
				End If			
			Next   
	compareTwoDBTables=bCompare
End Function
Public Function verifyDBValue_iCall(strDBType, strDBServer, strDBName, strUser, strPassword,strQuery, arrExpectedData)
	'If Query needs to read valur from dataStore
	'	strNewQuery=updateStringFormDataStore(strQuery,strKeyword,strAction)

   Dim arrActual, arrColumns, arrValues
   arrActual=queryDB(strDBType, strDBServer, strDBName, strUser, strPassword,strQuery)
	'iSize = Ubound(arrExpectedData)

   'For iCount = 0 to iSize
           		  
		If isNull(arrActual) OR isEmpty(arrActual) Then
				LogMessage "RSLT","Verification","Failed to retrive values from Database: ", false
		End If
		arrTemp=returnColumnValuesForARow (arrActual,0)
		
		If compareArray(arrTemp,arrExpectedData) Then
				LogMessage "RSLT","Verification","Expected values matched with actual values in Database", true
			else
				LogMessage "RSLT","Verification","Expected values does not  matched with actual values  in Database: ", false
			End If
		
   'Next
verifyDBValue_iCall=true
End Function
Public Function getDBValForColumn(strQuery_DB)
	'If Query needs to read valur from dataStore
	'	strNewQuery=updateStringFormDataStore(strQuery,strKeyword,strAction)

  'arrDB=queryDB( "ORACLE", gstrICallDb_Env, gstrICALLDB, gstrICallDBUser, "iserveccrel123$",strQuery_DB)
  arrDB=queryDB( "MARIADB", gstrICallDb_Env, gstrICALLDB, gstrICallDBUser, gstrICallDBPassword,strQuery_DB) '[DB name changed to MARIADB for LISA Env Execution]
  If not isArray(arrDB) Then
	getDBValForColumn=false
	LogMessage "RSLT","Verification","DB query does not returned any data. Please check query inputs",false
  End If
  ReDim arrColsData(Cint(UBound (arrDB,1)))
	For iRowCount = 0 to UBound(arrDB,1)
		bValCompare=true
		strDBVal=arrDB(iRowCount,0)
		If isNull(strDBVal) Then
			  strDBVal = ""
		End If
		arrColsData(iRowCount)=strDBVal
	Next
	getDBValForColumn=arrColsData
End Function

Public Function getDBValForColumn_FE(strQuery_DB)
	'If Query needs to read valur from dataStore
	'	strNewQuery=updateStringFormDataStore(strQuery,strKeyword,strAction)

  'arrDB=queryDB( "ORACLE", "DB_ICALL_SIT_NZD","10.91.35.175", "ISERVEUR1", "ISERVEUR1_123",strQuery_DB)
  arrDB=queryDB( "MARIADB", gstrICallDbName_CC_FE, gstrICALLDB, gstrICallDBUser, gstrICallDBPassword,strQuery_DB) '[DB name changed to MARIADB for LISA Env Execution]
  If not isArray(arrDB) Then
	getDBValForColumn_FE=false
	LogMessage "RSLT","Verification","DB query does not returned any data. Please check query inputs",false
  End If
  ReDim arrColsData(Cint(UBound (arrDB,1)))
	For iRowCount = 0 to UBound(arrDB,1)
		bValCompare=true
		strDBVal=arrDB(iRowCount,0)
		If isNull(strDBVal) Then
			  strDBVal = ""
		End If
		arrColsData(iRowCount)=strDBVal
	Next
	getDBValForColumn_FE=arrColsData
End Function

'*****Added by  date 15122016*********************
Public Function getDBValForColumn_MARIADB_FE(strQuery_DB, strDBServer)
	'If Query needs to read valur from dataStore
	'	strNewQuery=updateStringFormDataStore(strQuery,strKeyword,strAction)

  'arrDB=queryDB( "ORACLE", "DB_ICALL_SIT_NZD","10.91.35.175", "ISERVEUR1", "ISERVEUR1_123",strQuery_DB)
  arrDB=queryDB( "MARIADB", strDBServer, strDBName, strUser, strPassword,strQuery_DB)
  If not isArray(arrDB) Then
	getDBValForColumn_MARIADB_FE=false
	LogMessage "RSLT","Verification","DB query does not returned any data. Please check query inputs",false
  End If
  ReDim arrColsData(Cint(UBound (arrDB,1)))
	For iRowCount = 0 to UBound(arrDB,1)
		bValCompare=true
		strDBVal=arrDB(iRowCount,0)
		If isNull(strDBVal) Then
			  strDBVal = ""
		End If
		arrColsData(iRowCount)=strDBVal
	Next
	getDBValForColumn_MARIADB_FE=arrColsData
End Function

Public Function getDBValForMultipleColumn_NZD(strQuery_DB)
  arrDB=queryDB( "ORACLE", "DB_ICALL_SIT_NZD","10.91.35.175", "ISERVEUR1", "ISERVEUR1_123",strQuery_DB)
  If not isArray(arrDB) Then
	getDBValForColumn=false
	LogMessage "RSLT","Verification","DB query does not returned any data. Please check query inputs",false
  End If
  getDBValForMultipleColumn_NZD=arrDB
End Function

Public Function getDBValForColumn_UAT(strQuery_DB)
	'If Query needs to read valur from dataStore
	'	strNewQuery=updateStringFormDataStore(strQuery,strKeyword,strAction)

  arrDB=queryDB( "ORACLE", "DB_ICALL_UAT1", "10.91.37.210", "icall_user", "icall_user456",strQuery_DB)
  If not isArray(arrDB) Then
	getDBValForColumn=false
	LogMessage "RSLT","Verification","DB query does not returned any data. Please check query inputs",false
  End If
  ReDim arrColsData(Cint(UBound (arrDB,1)))
	For iRowCount = 0 to UBound(arrDB,1)
		bValCompare=true
		strDBVal=arrDB(iRowCount,0)
		If isNull(strDBVal) Then
			  strDBVal = ""
		End If
		arrColsData(iRowCount)=strDBVal
	Next
	getDBValForColumn_UAT=arrColsData
End Function

Public Function getDBValForColumn_CC(strQuery_DB)
	'If Query needs to read valur from dataStore
	'	strNewQuery=updateStringFormDataStore(strQuery,strKeyword,strAction)

  arrDB=queryDB( "MARIADB", gstrICallDbName_CC, gstrICallDB_CC, gstrICallDBUser_CC, gstrICallDBPassword_CC,strQuery_DB)
  If not isArray(arrDB) Then
	getDBValForColumn_CC=false
	LogMessage "RSLT","Verification","DB query does not returned any data. Please check query inputs",false
  End If
'  ReDim arrColsData(Cint(UBound (arrDB,1)))
'	For iRowCount = 0 to UBound(arrDB,1)
'		bValCompare=true
'		strDBVal=arrDB(iRowCount,0)
'		If isNull(strDBVal) Then
'			  strDBVal = ""
'		End If
'		arrColsData(iRowCount)=strDBVal
'	Next
	getDBValForColumn_CC=arrDB
End Function

Public Function getDBValForColumn_OL(strQuery_DB)
	'If Query needs to read valur from dataStore
	'	strNewQuery=updateStringFormDataStore(strQuery,strKeyword,strAction)

  'arrDB=queryDB( "ORACLE", "DB_ICALL_OL", gstrICallDB_CC, gstrICallDBUser_CC, gstrICallDBPassword_CC,strQuery_DB)
  arrDB=queryDB( "ORACLE", gstrICallDbName_CC_OL, gstrICallDB_CC, gstrICallDBUser_CC, gstrICallDBPassword_CC,strQuery_DB)
 If not isArray(arrDB) Then
	getDBValForColumn=false
	LogMessage "RSLT","Verification","DB query does not returned any data. Please check query inputs",false
  End If
  ReDim arrColsData(Cint(UBound (arrDB,1)))
	For iRowCount = 0 to UBound(arrDB,1)
		bValCompare=true
		strDBVal=arrDB(iRowCount,0)
		If isNull(strDBVal) Then
			  strDBVal = ""
		End If
		arrColsData(iRowCount)=strDBVal
	Next
	getDBValForColumn_OL=arrColsData
End Function

'*********** For Capture@Source OL DB
Public Function getDBValForColumn_OL_CS(strQuery_DB)
 arrDB=queryDB( "ORACLE", gstrICallDbName_CC_OL, gstrICallDB_CC, gstrICallDBUser_CC, gstrICallDBPassword_CC,strQuery_DB)
 If not isArray(arrDB) Then
	getDBValForColumn_OL_CS=false
	LogMessage "RSLT","Verification","DB query does not returned any data. Please check query inputs",false
  End If
  ReDim arrColsData(Cint(UBound (arrDB,1)))
	For iRowCount = 0 to UBound(arrDB,1)
		bValCompare=true
		strDBVal=arrDB(iRowCount,0)
		If isNull(strDBVal) Then
			  strDBVal = ""
		End If
		arrColsData(iRowCount)=strDBVal
	Next
	getDBValForColumn_OL_CS=arrColsData
End Function

Public Function getDBValForColumn_CRM(strQuery_DB)
	'If Query needs to read valur from dataStore
	'	strNewQuery=updateStringFormDataStore(strQuery,strKeyword,strAction)

  arrDB=queryDB( "ORACLE", "DB_SG_CRM", gstrICallDB_CC, gstrICallDBUser_CC, gstrICallDBPassword_CC,strQuery_DB)
 If not isArray(arrDB) Then
	getDBValForColumn=false
	LogMessage "RSLT","Verification","DB query does not returned any data. Please check query inputs",false
  End If
  ReDim arrColsData(Cint(UBound (arrDB,1)))
	For iRowCount = 0 to UBound(arrDB,1)
		bValCompare=true
		strDBVal=arrDB(iRowCount,0)
		If isNull(strDBVal) Then
			  strDBVal = ""
		End If
		arrColsData(iRowCount)=strDBVal
	Next
	getDBValForColumn_CRM=arrColsData
End Function

'***** For Capture at Source (TM Approval)
Public Function getDBValForColumn_CS(strQuery_DB)
	
  arrDB=queryDB( "ORACLE", "DB_SG_CS", gstrICallDB_CC, gstrICallDBUser_CC, gstrICallDBPassword_CC,strQuery_DB)
 If not isArray(arrDB) Then
	getDBValForColumn=false
	LogMessage "RSLT","Verification","DB query does not returned any data. Please check query inputs",false
  End If
  ReDim arrColsData(Cint(UBound (arrDB,1)))
	For iRowCount = 0 to UBound(arrDB,1)
		bValCompare=true
		strDBVal=arrDB(iRowCount,0)
		If isNull(strDBVal) Then
			  strDBVal = ""
		End If
		arrColsData(iRowCount)=strDBVal
	Next
	getDBValForColumn_CS=arrColsData
End Function

Public Function getDBValForColumn_Branch(strQuery_DB)
	'If Query needs to read valur from dataStore
	'	strNewQuery=updateStringFormDataStore(strQuery,strKeyword,strAction)

  arrDB=queryDB( "ORACLE", gstrICallDbName_Branch, gstrICallDB_Branch, gstrICallDBUser_Branch, gstrICallDBPassword_Branch,strQuery_DB)
  If not isArray(arrDB) Then
	getDBValForColumn_CC=false
	LogMessage "RSLT","Verification","DB query does not returned any data. Please check query inputs",false
  End If
'  ReDim arrColsData(Cint(UBound (arrDB,1)))
'	For iRowCount = 0 to UBound(arrDB,1)
'		bValCompare=true
'		strDBVal=arrDB(iRowCount,0)
'		If isNull(strDBVal) Then
'			  strDBVal = ""
'		End If
'		arrColsData(iRowCount)=strDBVal
'	Next
	getDBValForColumn_Branch=arrDB
End Function

Public Function updateCellValinDB(strUpdateQuery)
	Set myConnection = CreateObject("ADODB.Connection")
	Set objRS=CreateObject("ADODB.Recordset")
	myConnection.ConnectionString = "DRIVER={MySQL ODBC 5.3 Unicode Driver};SERVER="&gstrICALLDB&";DATABASE="&gstrICallDbName_CC&";USER="&gstrICallDBUser&";PASSWORD="&gstrICallDBPassword&";Port="&gstrICallDBPort&";OPTION=3;"
	myConnection.Open
	myConnection.Execute(strUpdateQuery)
	myConnection.Close
End Function

' For MariyaDB Delete Query Execution
Public Function deleteRecordsMariyaDB(strDeleteQuery)

	Set myConnection = CreateObject("ADODB.Connection")
	Set objRS=CreateObject("ADODB.Recordset")
	myConnection.ConnectionString = "DRIVER={MySQL ODBC 5.3 Unicode Driver};SERVER=10.92.145.84;DATABASE=iservesgr1;USER=iservesgr1;PASSWORD=Test_123_$;Port=4006;OPTION=3;"
	myConnection.Open
	myConnection.Execute(strDeleteQuery)
	
	If Err<>0 Then
			Reporter.ReportEvent micFail,"Failed to execute Query. Error : " & Err
			myConnection.Close
			Set objRs = Nothing
			Set myConnection = Nothing
			deleteRecordsMariyaDB=false
			Exit Function
	End If		
	myConnection.Close
	Set objRs = Nothing
	Set myConnection = Nothing
	deleteRecordsMariyaDB = True
	
End Function

Public Function updateCellValinDB_NZD(strUpdateQuery)
	Set myConnection = CreateObject("ADODB.Connection")
	Set objRS=CreateObject("ADODB.Recordset")
	myConnection.ConnectionString = "Driver={Microsoft ODBC for Oracle};" & _
		"CONNECTSTRING=(DESCRIPTION=" & _
		"(ADDRESS=(PROTOCOL=TCP)" & _
		"(HOST=10.91.35.175)(PORT=1521))" & _
		"(CONNECT_DATA=(SERVICE_NAME=BPMSIT))); uid=ISERVEUR1; pwd=ISERVEUR1_123;"
	myConnection.Open
	myConnection.Execute(strUpdateQuery)
	myConnection.Close
End Function

'********** FOR IWF DB as we need for ATM CAM 
Public Function getDBValForColumn_IWF(strQuery_DB)
 arrDB=queryDB( "ORACLE", "DB_ICALL_IWF", "10.91.35.175", "iwfdb", "Password1",strQuery_DB)
 If not isArray(arrDB) Then
	getDBValForColumn=false
	LogMessage "RSLT","Verification","DB query does not returned any data. Please check query inputs",false
  End If
  ReDim arrColsData(Cint(UBound (arrDB,1)))
	For iRowCount = 0 to UBound(arrDB,1)
		bValCompare=true
		strDBVal=arrDB(iRowCount,0)
		If isNull(strDBVal) Then
			  strDBVal = ""
		End If
		arrColsData(iRowCount)=strDBVal
	Next
	getDBValForColumn_IWF=arrColsData
End Function

Public Function CompareDBValue_icall(strDBServer,strQuery, arrExpectedData)
    bCompareDBValue_icall = True 
   Dim arrActual, arrColumns, arrValues
    'arrActual = queryDB("ORACLE", strDBServer, strDBName, strUser, strPassword,strQuery) 
	
	'Changed by Sunil as the DB has changed to Maria DB    
    arrActual = queryDB("MARIADB", strDBServer, strDBName, strUser, strPassword,strQuery)   
        If isNull(arrActual) OR isEmpty(arrActual) Then
                LogMessage "RSLT","Verification","Failed to retrive values from Database: ", false
                bCompareDBValue_icall = False
        End If
        arrTemp=returnColumnValuesForARow (arrActual,0)    
        If compareArray(arrTemp,arrExpectedData) Then
                LogMessage "RSLT","Verification","Expected values matched with actual values in Database", true
                bCompareDBValue_icall = True 
            else
                LogMessage "RSLT","Verification","Expected values does not  matched with actual values  in Database: ", false
                bCompareDBValue_icall = False
        End If
    CompareDBValue_icall=bCompareDBValue_icall
End Function

'Added by Kalyan 22122016**********************************
Public Function CompareDBMultipleRowValues_icall(strDBServer,strQuery, arrExpectedData)
    bCompareDBValue_icall = True 
   Dim arrActual, arrColumns, arrValues
    'arrActual = queryDB("ORACLE", strDBServer, strDBName, strUser, strPassword,strQuery) 
	
	'Changed by Sunil as the DB has changed to Maria DB    
    arrActual = queryDB("MARIADB", strDBServer, strDBName, strUser, strPassword,strQuery)
	strCount=Ubound(arrExpectedData)
        If isNull(arrActual) OR isEmpty(arrActual) Then
                LogMessage "RSLT","Verification","Failed to retrive values from Database: ", false
                bCompareDBMultipleRowValues_icall = False
        End If
        For strCount = 0 To strCount
        	arrTemp1=returnColumnValuesForARow (arrActual,strCount)  
			arrTemp2=returnColumnValuesForARow (arrExpectedData,strCount)        	
        	If compareArray(arrTemp1,arrTemp2) Then
                LogMessage "RSLT","Verification","Expected values matched with actual values in Database", true
                bCompareDBMultipleRowValues_icall = True 
            else
                LogMessage "RSLT","Verification","Expected values does not  matched with actual values  in Database: ", false
                bCompareDBMultipleRowValues_icall = False
        	End If
        Next
        
    CompareDBValue_icall=bCompareDBValue_icall
End Function
