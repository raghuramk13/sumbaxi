'#######################################################################################################################################################
'# 		Name: Runtime Component Loader
'# 		Description:This file will load OR, Env.xml and .vbs files during runtime into script
'# 		Author: 
'# 		Date: 12-Oct-2016
'#######################################################################################################################################################
Dim intLibCount
Dim intOptionCounter

Dim objQTP
Dim strLibDir
Dim WshShl

Dim strProjectRoot
Dim strProjectName
Dim strTestRootDir

Const INFO = "INFO:"
Const SERROR = "ERROR:"

intLibCount = 0
intOptionCounter = 0

Set WshShl = CreateObject("WScript.Shell").Environment("User")

strTestRootDir = WshShl("OBTAFProjectRoot")
strProjectName = WshShl("OBTAFProjectName")

Set WshShl = Nothing

strLibDir =  strTestRootDir & "\" & strProjectName & "\Libraries"

Set objQTP = GetObject("","QuickTest.Application") '[Get object of Current UFT Instance]

RuntimeComponentLoader			'[Call to Runtime Component loader Sub]

AddFoldersPathToFolderOptions 	'[Adds Folder Paths to UFT>>Tools>>Options>>GUI Testing>>Folders]

Public Sub RuntimeComponentLoader()

	strTransStartTime = Now
	
	Print ""
	Print INFO & "RUNTIME LOADING OF FRAMEWORK CORE COMPONENTS STARTED AT : "& strTransStartTime
	Print ""
	Print "==============="
	
	'[ATTENTION : Do not change the below 6 lines lib loading order]
	
	LoadEnvironmentVariableFile
	LoadObjectRepositories
	LoadBDTEngineLibrary
	LoadKeywordEngineLibraries
	LoadFunctionalLibraries
	LoadFrameworkConfig
	
	strTransEndTime = Now
	
	Print ""
	Print INFO &"RUNTIME LOADING OF FRAMEWORK CORE COMPONENTS ENDED AT: "& strTransEndTime
	Print ""
	Print INFO &"TOTAL TIME CONSUMED FOR LOADING ENVIRONMENT VARIABLE XML, OBJECT REPOSITORIES & FUNCTION LIBRARIES : [" & DateDiff("s",strTransStartTime,strTransEndTime) & "] seconds."
	Print ""
	Print INFO &"TOTAL [" & intLibCount & "] [.vbs] LIBRARIES CURRENTLY ASSOCIATED TO TEST SCRIPT"
	Print "====================="
End Sub

Private Sub LoadEnvironmentVariableFile()
	On Error Resume Next
	Environment.LoadFromFile "..\..\" & strProjectName & "\Config\Env.xml"
	If Err.Number = 0 Then
		Print INFO &"ENVIRONMENT VARIABLE : [Env.xml] Environment Variable XML file loaded successfully from folder: "& strTestRootDir & "\" & strProjectName & "\Config"
		Print "=========================="
	Else
		Print SERROR & "[" & Err.Description & "] Environment Variable : [Env.xml] Environment Variable XML file is not loaded successfully from folder: "& strTestRootDir & "\" & strProjectName & "\Config"
		Print "=============================="
	End If
	On Error GoTo 0
End Sub

Private Sub LoadObjectRepositories()

		Dim objFso, objRepositoryFolder, objQtpRepositories, objFile
		Dim strTemp,strFileName
		
		strTemp = strTestRootDir & "\" & strProjectName & "\Repository\"
		
		Set objFso = CreateObject("Scripting.FileSystemObject")
		Set objRepositoryFolder = objFso.GetFolder(strTemp)
		
		RepositoriesCollection.RemoveAll()
		
		For each objFile in objRepositoryFolder.Files
			If Right(Ucase(objFile.Path), Len("TSR")+1) = ".TSR" Then
				strFileName = objFile.Name
				Select Case UCase(Environment.Value("Region"))
					Case "MUMBAI"
						If Instr(1,strFileName,"mumbai") > 0 Then
							RepositoriesCollection.Add strTemp & strFileName
							Print INFO & "OBJECT REPOSITORY : [ " & strFileName & " ] Object Repository loaded successfully.."
							Exit For
						End If
					Case "CHENNAI"
						If Instr(1,strFileName,"chennai") > 0 Then
							RepositoriesCollection.Add strTemp & strFileName
							Print INFO & "OBJECT REPOSITORY : [ " & strFileName & " ] Object Repository loaded successfully.."
							Exit For
						End If
					Case "HYDERABAD"
						'[Code Commented by : OR should be associated for ID Script developement]
'						If Instr(1,strFileName,"ID") > 0 Then
'							RepositoriesCollection.Add strTemp & strFileName
'							Print INFO & "OBJECT REPOSITORY : [ " & strFileName & " ] Object Repository loaded successfully.."
'							Exit For
'						End If
				End Select
			End If
		Next
		
		Print "========================"
		
		Set objFile = Nothing
		Set objRepositoryFolder = Nothing
		Set objFso = Nothing
	End Sub

Private Sub LoadBDTEngineLibrary()
	On Error Resume Next
	LoadFunctionLibrary strLibDir & "\01Engine\BDTEngine\BDTEngine.vbs"
	If Err.Number = 0 Then
		Print INFO & "BDT ENGINE : Engine Library [BDTEngine.vbs] loaded successfully.."
		Print "================="
		intLibCount = intLibCount + 1
	Else
		Print SERROR & "[" & Err.Description & "] BDT : Engine Library [BDTEngine.vbs] is not loaded successfully.."
		Print "============================"
	End If
	On Error GoTo 0
End Sub

Private Sub LoadKeywordEngineLibraries()
	LoadLibrariesFromFolder strLibDir & "\01Engine\KeywordEngine","KEYWORD ENGINE"
End Sub

Private Sub LoadFrameworkConfig()
	On Error Resume Next
	LoadFunctionLibrary strLibDir & "\02Utility\OBTAF_Config.vbs"
	If Err.Number = 0 Then
		intLibCount = intLibCount + 1
		Print INFO & "OBTAF CONFIG : [OBTAF_Config.vbs] Config library loaded successfully from folder: "& strLibDir & "\02Utility"
		Print "==================="
	Else
		Print SERROR & "[" & Err.Description &"] OBTAF CONFIG : [OBTAF_Config.vbs] Config library is not loaded successfully from folder: "& strLibDir & "\02Utility"
		Print "=============================="
	End If
	On Error GoTo 0
End Sub

Private Sub LoadFunctionalLibraries()
	
	'[ATTENTION : Do not change the below 3 lines lib loading order]
	
	LoadLibrariesFromFolder strLibDir & "\03Common","COMMON"
	LoadLibrariesFromFolder strLibDir & "\02Utility","UTILITY"
	LoadLibrariesFromFolder strLibDir & "\02Utility\Reporting","REPORTING"
	
	Select Case UCase(Environment.Value("Region"))
		Case "MUMBAI"
			LoadLibrariesFromFolder strLibDir & "\04Pagination\Mumbai","MUMBAI-PAGE"
		Case "CHENNAI"
			LoadLibrariesFromFolder strLibDir & "\04Pagination\Chennai","CHENNAI-PAGE"
		Case "HYDERABAD"
			LoadLibrariesFromFolder strLibDir & "\04Pagination\Hyderabad","HYDERABAD-PAGE"
	End Select
		
End Sub

Private Sub LoadLibrariesFromFolder(strFolderName,strLibraryType)
	On Error Resume Next
	Dim objFso, objLibraryFolder, objFile
	
	Set objFso = CreateObject("Scripting.FileSystemObject")
	
	Set objLibraryFolder = objFso.GetFolder(strFolderName)
	Print INFO & strLibraryType &  " : Associated " & LCase(strLibraryType) & " libraries from folder: " & strFolderName
	PrintChar(strLibraryType)
	intCountInFolder = 0
	For Each objFile in objLibraryFolder.Files
		
		If Right(Ucase(objFile.Path), Len("VBS") + 1) = ".VBS" Then
			
			LoadFunctionLibrary strFolderName & "\" & objFile.Name
			
			If Err.Number = 0 Then
				intCountInFolder = intCountInFolder + 1
				intLibCount = intLibCount + 1
				Print VbTab & VbTab & intCountInFolder & ". "& strFolderName & "\" & objFile.Name
			Else
				Print VbTab & VbTab & "[ERROR: " & Err.Description & "] : " & strLibraryType & " Library : [" & objFile.Name &  "] is not loaded successfully from folder: " & strFolderName
			End If
			
		End If
	Next
	Print "================="
		
	Set objFile = Nothing
	Set objLibraryFolder = Nothing
	Set objFso = Nothing
	On Error GoTo 0
End Sub

Public Sub PrintChar(strPrintString)
 cChar = ""
 strLength = Len(strPrintString)+Len(INFO)+1
 For i = 1 To strLength Step 1
 	cChar = cChar & "="
 Next
 Print cChar
End Sub

Public Sub LoadScenarioBusinessLibraries(arrStepLibs)
	Dim objLib,intBLibCount
	On Error Resume Next
	Set objLib = objQTP.Test.Settings.Resources.Libraries
	For intBLibCount = 0 To UBound(arrStepLibs)
		If arrStepLibs(intBLibCount) <> "" Then
			If objLib.Find(arrStepLibs(intBLibCount)&".vbs") = -1 Then '[If library is not already added]
				LoadFunctionLibrary PathFinder.Locate(arrStepLibs(intBLibCount)&".vbs")
				If Err.Number = 0 Then
					Print VbTab & VbTab & INFO & "BUSINESS LIBRARY : file [" & arrStepLibs(intBLibCount)&".vbs" & "] loaded successfully.."
				Else
					Print VbTab & VbTab & SERROR & "[" & Err.Description & "] BUSINESS LIBRARY : Function library file [" & arrStepLibs(intBLibCount)&".vbs" & "] is not loaded successfully.."
				End If
			End If
		End If
	Next
	Set objLib = Nothing
	On Error GoTo 0
End Sub

Private Sub AddFoldersPathToFolderOptions()

	'[ATTENTION : While adding or deleteing folders, rename the folder numbers in ascending order in oDict Object]
	
	Dim oDict,strItem,i

	Set oDict = CreateObject("Scripting.Dictionary")
	oDict.Add "Folder1",strTestRootDir
	oDict.Add "Folder2",strTestRootDir & "\03DriverScript\ISERVETAFEngine"
	oDict.Add "Folder3",strLibDir
	oDict.Add "Folder4",strLibDir & "\05Business\" & Environment.Value("Region")
	oDict.Add "Folder5",strTestRootDir & "\06Temp"
	oDict.Add "Folder6",strTestRootDir & "\07BatchFiles"
	
	Print ""
	Print INFO & "ASSOCIATED FOLDER PATHS"
	Print "=============================="
	
	On Error Resume Next
	For i = 1 To oDict.Count
		strItem = oDict.Item("Folder" & i)
		If (objQTP.Folders.Find(strItem) = -1) And (strItem <> "") Then
			objQTP.Folders.Add(strItem)
			If Err.Number = 0 Then
				Print VbTab & VbTab &"["& strItem & "] added successfully into [UFT>>Tools>>Options>>GUI Testing>>Folders]"
			Else
				Print VbTab & VbTab & "[ERROR : " & Err.Description & "] : FOLDER PATH : ["& strItem & "] not added into [UFT>>Tools>>Options>>GUI Testing>>Folders]"
			End If
		Else
			Print VbTab & VbTab & "["& strItem & "] is already exist in [UFT>>Tools>>Options>>GUI Testing>>Folders]"		
		End If
	Next
	
    On Error Goto 0
    Set oDict = Nothing
End Sub

Public Sub UnloadScenarioBusinessLibraries(arrStepLibs)
	Set objLib = objQTP.Test.Settings.Resources.Libraries
	For intLibCount = 0 To UBound(arrStepLibs)
		If objLib.Find(arrStepLibs(intLibCount)&".vbs") = 1 Then ' If library is Added
			objLib.Remove PathFinder.Locate(arrStepLibs(intLibCount)&".vbs"), 1 ' deassociate the library from the test case
		End If
		Print "Business Library : Function library file [" & arrStepLibs(intLibCount)&".vbs" & "] unloaded successfully.."
	Next
	objQTP.Test.Save
	Set objLib = Nothing
End Sub

Function FindOptionExplict()
	strMyTemp = strTestRootDir & "\" & strProjectName & "\Libraries\"
	FindOptionExplictInFiles strMyTemp & "01Engine\BDTEngine"
	FindOptionExplictInFiles strMyTemp & "01Engine\KeywordEngine"
	FindOptionExplictInFiles strMyTemp & "02Utility\Reporting\Logging"
	FindOptionExplictInFiles strMyTemp & "02Utility"
	FindOptionExplictInFiles strMyTemp & "03Common"
	FindOptionExplictInFiles strMyTemp & "04Pagination\Hongkong"
	FindOptionExplictInFiles strMyTemp & "05Business\Hongkong"
End Function

Function FindOptionExplictInFiles(strFolderName)
	Dim objFso, objLibraryFolder, objSubFolder, objFile
	Set objFso = CreateObject("Scripting.FileSystemObject")
	Set objLibraryFolder = objFso.GetFolder(strFolderName)
	For Each objFile in objLibraryFolder.Files
		If Right(Ucase(objFile.Path), Len("VBS") + 1) = ".VBS" Then
			arrStepDefs = DotNetFactory.CreateInstance("System.IO.File").ReadAllText(strFolderName & "\" & objFile.Name)
			If Instr(UCase(arrStepDefs),"OPTION EXPLICIT") <> 0  Then '[if Option Explicit found inside the file]
				intOptionCounter = intOptionCounter + 1
				Print VbTab & VbTab & intOptionCounter & "." & strFolderName & "\" & objFile.Name
				Print "============================================================"
				
			End If
		End If
	Next
	Set objFile = Nothing
	Set objLibraryFolder = Nothing
	Set objFso = Nothing	
End Function
