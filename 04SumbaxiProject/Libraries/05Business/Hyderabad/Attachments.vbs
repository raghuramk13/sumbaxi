Dim StrActCreatedDateTime

'[User Click on Attachment Icon in overview page]
Public Function ClickAttachments()
	Wait 1
	Attachments.btnAttachments.Click		
		If Err.Number<>0 Then
		ClickAttachments=false
		    LogMessage "WARN","Verification","Failed to Click Icon : Attachments in Overview Page" ,false
		Exit Function
		End If
		WaitForICallLoading
   ClickAttachments= True
End Function

'******************Added by kalyan dated 9122016 1701 Changes**************************
'[Check Button Attachment Enabled Disabled]
Public Function verifyButtonAttachment(strStatus)
   bDevPending=true
   bverifyButtonAttachment=true
   bverifyButtonAttachment=CheckVaadinObject_Disabled1(Attachments.btnAttachments(), strStatus)
   verifyButtonAttachment=bverifyButtonAttachment
End Function

'[Verify Pink Panel displayed in Attachments Page]
Public Function verifyPinkPanel_Atachments(strName,StrCIN,StrSegment)
 bverifyPinkPanel_Atachments=true
	If Not IsNull(strName) Then
		If Not VerifyInnerText(Attachments.lblName(),strName,"Name") Then
			bverifyPinkPanel_Atachments = False
		End If
    End If
    If Not IsNull(StrCIN) Then
		If Not VerifyInnerText(Attachments.lblCIN(),StrCIN,"CIN") Then
			bverifyPinkPanel_Atachments = False
		End If
    End If
    If Not IsNull(StrSegment) Then
		If Not VerifyInnerText(Attachments.lblSegment(),StrSegment,"Segment") Then
			bverifyPinkPanel_Atachments = False
		End If
    End If
verifyPinkPanel_Atachments=bverifyPinkPanel_Atachments
End Function

'[Verify table header name for files uploaded]
Public Function verifytableheader_filesupload(strIserveFilestableheader,strCRMFilestableheader )
  bverifytableheader_filesupload = True	
 	  If Not VerifyInnerText (Attachments.lblIserveHeadertext(), strIserveFilestableheader, "Iserve table HeaderName")Then
 	     bverifytableheader_filesupload=false
      End If
      
      If Not VerifyInnerText (Attachments.lblCRMHeadertext(), strCRMFilestableheader, "CRM table HeaderName")Then
 	     bverifytableheader_filesupload=false
      End If
	verifytableheader_filesupload = bverifytableheader_filesupload
End Function

'[Click on Add Attachments button displayed in Attachments Page]
Public Function ClickButton_AddAttachment()
	bClickButton_AddAttachment = true
	Attachments.btnAddAttachments().Click
	If err.number <> 0 Then
		'error occurred on clicking attachments
		LogMessage "WARN","Verification","Failed to Click Button : Add Attachments." ,false
		bClickButton_AddAttachment = false
	else
		LogMessage "RSLT","Verification","Button Clicked : Add Attachments." ,true
	End If
	ClickButton_AddAttachment = bClickButton_AddAttachment
End Function

'[Verify the Add Attachments Popup Exists]
Public Function verifyAddAttachmentsExists()
	verifyAddAttachmentsExists = true
	If Attachments.dlgAttachments().Exist Then
		LogMessage "RSLT","Verification","Add Attachments Dialog box exists." ,true
	else
		LogMessage "RSLT","Verification","Add Attachments Dialog box does not exist." ,False
	End If
End Function

'[Verify the submit button is enabled]
Public Function verifySubmit_Attachments(strEnabled)
	verifySubmit_Attachments = true
	btnDisabled = Attachments.btnSubmit().getroproperty("disabled")
	'btnDisabled = 0 (if it is enabled); = 1 (if it is disabled)
	If btnDisabled = 1 Then
		'it is disabled
		If strEnabled = "False" Then
			LogMessage "RSLT","Verification","Submit Button is disabled as expected." ,true
		else
			LogMessage "WARN","Verification","Submit Button is enabled but was expected to be disabled." ,False
			verifySubmit_Attachments = false
		End If
	else
		'the button is enabled
		If strEnabled = "True" Then
			LogMessage "RSLT","Verification","Submit Button is enabled as expected." ,true
		else
			LogMessage "WARN","Verification","Submit Button is disabled but was expected to be enabled." ,False
			verifySubmit_Attachments = false
		End If
	End If
End Function

'[Verify the Cancel button is enabled]
Public Function verifyCancel_Attachments(strEnabled)
	verifyCancel_Attachments = true
	btnDisabled = Attachments.btnCancel().getroproperty("disabled")
	'btnDisabled = 0 (if it is enabled); = 1 (if it is disabled)
	If btnDisabled = 1 Then
		'it is disabled
		If strEnabled = "False" Then
			LogMessage "RSLT","Verification","Cancel Button is disabled as expected." ,true
		else
			LogMessage "WARN","Verification","Cancel Button is enabled but was expected to be disabled." ,False
			verifyCancel_Attachments = false
		End If
	else
		'the button is enabled
		If strEnabled = "True" Then
			LogMessage "RSLT","Verification","Cancel Button is enabled as expected." ,true
		else
			LogMessage "WARN","Verification","Cancel Button is disabled but was expected to be enabled." ,False
			verifyCancel_Attachments = false
		End If
	End If
End Function

'*****************Updated by Kalyan 23022017***********************************

'[Verify text list of document types accepted for uploading files]
Public Function verifytextlistOfFiles(strLOFLabelNameFileFromat)
  bverifytextlistOfFiles = True	
 	  If Not VerifyInnerText (Attachments.LOFLabelName(), strLOFLabelNameFileFromat, "Label Name and file formats displayed for List of files")Then
 	     bverifytextlistOfFiles=false
      End If
	verifytextlistOfFiles = bverifytextlistOfFiles
End Function

'[Verify Information Message text displayed in popup Upload new files]
Public Function verifytextInfoMsg(strDialogName,strMaxSizetext, strMaxFile)
  bverifytextInfoMsg = True	
 	  If Not VerifyInnerText (Attachments.lbllLabelname(), strDialogName, "Popup Dialog name")Then
 	     bverifytextInfoMsg=false
      End If
      
      If Not VerifyInnerText (Attachments.lblMaxSizetext(), strMaxSizetext, "Text displayed Max file size allowed")Then
 	     bverifytextInfoMsg=false
      End If
      
      If Not VerifyInnerText (Attachments.lblMaxFilesAllowed(), strMaxFile, "Text displayed Max Files allowed to upload")Then
 	     bverifytextInfoMsg=false
      End If
	verifytextInfoMsg = bverifytextInfoMsg
End Function

'[Attach the files using Select Files button]
Public Function uploadFilesUsingBrowse(lstFileNames, lstComments)
	uploadFilesUsingBrowse = true
	'Get the folder path from the OBTAF_Config
	strFolderPath = gstrAttachmentsPath
	'Split the lists of the filenames
	lstCount = Ubound(lstFileNames)
	For it = 0 To lstCount Step 1
			filePath=strFolderPath + "\" + lstFileNames(it)
			title =Browser("Browser_iCall_Home").GetROProperty("title")
			Window("micclass:=Window", "text:=" & title & ".*").Activate
			'Library "Mercury.DeviceReplay" and Left Click of a mouse 
			Set DeviceReplay = CreateObject("Mercury.DeviceReplay")
			'I get my Webelement
			Set MyWebelement = Attachments.btnSelectFiles()
			'Found the position X and Y for my element i want to select
			GetX = MyWebelement.GetROProperty("abs_x") 
			GetY = MyWebelement.GetROProperty("abs_y")
			DropAreaWidth=MyWebelement.GetROProperty("width")
			DropAreaHeight=MyWebelement.GetROProperty("height")
			x=(GetX+(DropAreaWidth/2))
			y=(GetY+(DropAreaHeight/2))
			'Simulate de left click on this position (= mywebElement position)
			DeviceReplay.MouseClick x,y, LEFT_MOUSE_BUTTON
			wait 1
			Set DeviceReplay = Nothing
			Attachments.webFileChooseFiles().Set filePath
			'create a filename path on runtime 		
			wait 2
			If err.number <> 0 Then
				'error occurred; file upload unsuccessful
				LogMessage "WARN","Verification.","Unable to upload the First attachment. ",false
				uploadFilesUsingBrowse = false
			else
				'successful; put the comments also
				LogMessage "RSLT","Verification.","Able to upload the First attachment. ",True
				If lstComments(it) <> "" Then
					'Attachments.txtComments().Set lstComments(it)
					'Create the comments object on run time
					Set attachmentPage = Browser("Browser_iCall_Home").Page("iCall_Attachments")
					Set txtCommentDesc = Description.Create
					txtCommentDesc("xpath").value = "//*[@id='attachment_comment_"&it&"']"
					Set txtComment = attachmentPage.ChildObjects(txtCommentDesc)
					txtComment(0).set lstComments(it)
				End If
			End If
	Next
	waitForIcallLoading
End Function

'[Click on Ok button of the Upload dialog box in New SR Page]
Public Function clickOk_NewSR()
	clickOk_NewSR = true
	Attachments.btnOk_UploadDialog_NewSR().Click
	If err.number <> 0 Then
		'error occurred
		LogMessage "WARN","Verification.","Unable to Click Ok button of the Upload Dialog Box. ",false
		clickOk_NewSR = false
	else
		LogMessage "WARN","Verification.","Ok button of the Upload Dialog Box clicked successfully. ",True
	End If
	
End Function

'[Click on Cancel button of the Upload dialog box in New SR Page]
Public Function clickCancel_NewSR()
	clickCancel_NewSR = true
	Attachments.btnCancel().Click
	If err.number <> 0 Then
		'error occurred
		LogMessage "WARN","Verification.","Unable to Click Cancel button of the Upload Dialog Box. ",false
		clickCancel_NewSR = false
	else
		LogMessage "WARN","Verification.","Cancel button of the Upload Dialog Box clicked successfully. ",True
	End If
	
End Function

'[Verify the error message in Upload Attachments Screen]
Public Function verifyErrorMsg(strErrMsg)
	verifyErrorMsg = true
	strActualMsg = Attachments.errFileMsg().GetRoProperty("innertext")
	If strErrMsg = strActualMsg Then
		LogMessage "RSLT","Verification.","Error Msg matching.Actual: " &strActualMsg& " Expected: "&strErrMsg,True
	else
		LogMessage "RSLT","Verification.","Error Msg not matching.Actual: " &strActualMsg& " Expected: "&strErrMsg,False
		verifyErrorMsg = false
	End If
End Function

'[Submit the uploaded Files in Attachment Page]
Public Function clickSubmitUpload()
	clickSubmitUpload = true
	'Insert the TimeStamp in the datastore
	'strTimeStamp = ""&now
	SetcreatedDate = Date()
	SetcreatedTime = Time()
	SetcreatedDate = FormatDateTime(SetcreatedDate,2)
	SetcreatedTime =  FormatDateTime(SetcreatedTime,4)
	StrCreatedDateTime = SetcreatedDate & " " & SetcreatedTime
	Environment.Value("StrCreatedDateTime") = StrCreatedDateTime
'	gstrRuntimeCommentStep="Submit the uploaded Files in Attachment Page"
'	insertDataStore "Timestamp", strTimeStamp	
	Attachments.btnSubmit().Click
	If err.number <> 0 Then
		'error occurred; file upload unsuccessful
		LogMessage "WARN","Verification.","Not able to submit successfully. ",false
		clickSubmitUpload = false
	else
		LogMessage "RSLT","Verification.","Uploaded files submitted successfully. ",True
	End If
End Function

'[Verify status value displayed in the Request Submitted Popup]
Public Function verifyAttachmentStatus_RequestSubmittedPopup(strStatus)
	bverifyAttachmentStatus_RequestSubmittedPopup = true
	If Attachments.popUpSubmission().Exist Then
		LogMessage "RSLT","Verification.","Submission Dialog Box exists. ",True
	else
		LogMessage "WARN","Verification.","Submission Dialog Box Does not exist. ",false
		bverifyAttachmentStatus_RequestSubmittedPopup = false
	End If	
	'Verify the status as well
	strActualStatus = Attachments.btnStatus().GetRoProperty("innertext")
	If Trim(Ucase(strActualStatus))<> Trim(Ucase(strStatus)) Then
		LogMessage "WARN","Verification.","Status not matching.Actual: " &strActualStatus& " Expected: "&strStatus,false
		bverifyAttachmentStatus_RequestSubmittedPopup = false
	else
		LogMessage "RSLT","Verification.","Status matching.Actual: " &strActualStatus& " Expected: "&strStatus,true
	End If
	verifyAttachmentStatus_RequestSubmittedPopup = bverifyAttachmentStatus_RequestSubmittedPopup
End Function

'[Click Button OK on Request submitted popup]
Public Function ClickButtonOK_RequestSubmittedPopup()
	ClickButtonOK_RequestSubmittedPopup = true
	Wait(2)
	SetcreatedDate = Date()
	SetcreatedTime = Time()
	SetcreatedDate = FormatDateTime(SetcreatedDate,2)
	SetcreatedTime =  FormatDateTime(SetcreatedTime,4)
	StrCreatedDateTime = SetcreatedDate & " " & SetcreatedTime
	Environment.Value("StrCreatedDateTime") = StrCreatedDateTime
	Attachments.btnOkSubPopUp().Click
	If err.number <> 0 Then
		'error occurred; file upload unsuccessful
		LogMessage "WARN","Verification.","Not able to click on OK Button. ",false
		ClickButtonOK_RequestSubmittedPopup = false
	else
		LogMessage "RSLT","Verification.","OK button clicked successfully. ",True
	End If
	
End Function

'[Verify the files exist on the I.Serve table of Attachments Screen]
Public Function verifyFileExists_IServe(lstFiles,strCreatedBy,StrComments)
	'verifyFileExists_IServe(lstFiles, strCreatedOn)
	Dim lstlstFileDetails
	' Click on Refresh Button before checking for the data added in the Attachments table 
	Attachments.RefreshIcon().Click
	wait(1)
	'lstlstFileDetails = createListOfListFiles(lstFiles, strCreatedOn)
	StrActCreatedDateTime = Environment.Value("StrCreatedDateTime")
	lstlstFileDetails = createListOfListFiles(lstFiles,strCreatedBy,StrActCreatedDateTime,StrComments)
	verifyFileExists_IServe = verifyTableContentList(Attachments.tblIserveFileHeader,Attachments.tblIserveFileContent,lstlstFileDetails,"Files Uploaded through I.Serve",false,null,null,null)
End Function

'[Verify the files exist on the CRM table of Attachments Screen]
Public Function verifyFileExists_CRM(lstFiles, strCreatedOn)
	lstlstFileDetails = createListOfListFiles(lstFiles, strCreatedOn)
	verifyFileExists_CRM = verifyTableContentList(Attachments.tblCRMFileHeader,Attachments.tblCRMFileContent,lstlstFileDetails,"Files Uploaded through SGCRM",false,null,null,null)
End Function

'function to create the list of list for checking the files on the table
Public Function createListOfListFiles(lstFiles,strCreatedBy,strCreatedOn,StrComments)
'	If strCreatedOn = "RunTime" Then
'		'fetch from dataStore
'		strCreatedOn = fetchFromDataStore(gstrRuntimeCommentStep,"BLANK","Timestamp")(0)
'	End If
	'Create the list of list for checking on the table
	lstContents = ""
	ctFiles = ubound(lstFiles)
	For it = 0 To ctFiles Step 1
		If lstFiles(it) <> "" Then
			lstContents = lstContents & "(File Name:"&lstFiles(it)&"|Created On:"&strCreatedOn&")|"
		End If
	Next
	createListOfListFiles = checknull(lstContents)
End Function

''[Delete the uploaded files]
'Public Function deleteFiles(lstFile)
'	deleteFiles = true
'	Set oDesc = Description.Create
'	oDesc("xpath").value = "//*[contains(@class,'files')]"
'	Set ulList = Attachments.divFileContents().childobjects(oDesc)
'
'	'read the list of files
'	ctList = ubound(lstFile)
'	For i = 0 To ctList Step 1
'		If lstFile(i) <> "" Then
'			'then delete the files
'			'Get the child object of the list now
'			Set liListDesc = Description.Create
'			liListDesc("xpath").value = "//div[contains(@class,'layout-row')]"
'			Set liList = ulList(0).childObjects(liListDesc)
'			countLi = liList.Count
'			For it = 0 To countLi - 1 Step 1
'			'Create the Desc for the filename
'			Set fileNameDesc = Description.Create
'			fileNameDesc("xpath").value = "//*[contains(@class,'filename')]"
'			Set fileNameObj = liList(it).childObjects(fileNameDesc)
'			fileName = fileNameObj(0).GetRoProperty("innertext")
'			If fileName = lstFile(i) Then
'				'Then click on delete
'				Set delFileDesc = Description.Create
'				delFileDesc("xpath").value = "//*[contains(@id,'delete_FileName')]"
'				Set delFile = liList(it).childObjects(delFileDesc)
'				delFile(0).Click
'				wait 1
'				If err.number = 0 Then
'					'Clicked successfullly
'					LogMessage "RSLT","Verification.","File "&lstFile(i)& " deleted successfully. ",True
'				else
'					LogMessage "WARN","Verification.","File "&lstFile(i)& " not deleted successfully. ",false
'					deleteFiles = false
'				End If
'				Exit for
'			End If
'		Next	
'		End If
'	Next
'End Function

'[Delete the uploaded files]
Public Function deleteFiles(lstFile)
    deleteFiles = true
    'read the list of files
    ctList = ubound(lstFile)
    For i = 0 To ctList Step 1
        If lstFile(i) <> "" Then
            'then delete the files
            'Get the child object of the list now
            Set liListDesc = Description.Create
            liListDesc("class").value = "md-padding-top ng-scope"
            Set ulList = Attachments.divFileContents().childobjects(liListDesc)
            countLi = ulList.Count
            For it = 0 To countLi - 1 Step 1
            strFilename= ulList(it).getROProperty("innertext")
            'strInputFileName=lstFile(i)
            If instr(Ucase(strFilename),Ucase(lstFile(i))) Then
                'Then click on delete
                Set delFileDesc = Description.Create
                delFileDesc("xpath").value = "//*[contains(@id,'delete_FileName')]"
                'delFileDesc("file name").value = "dalete_cross.png"
                Set delFile = ulList(it).childObjects(delFileDesc)
                delFile(0).Click
                wait 1
                If err.number = 0 Then
                    'Clicked successfullly
                    LogMessage "RSLT","Verification.","File "&lstFile(i)& " deleted successfully. ",True
                else
                    LogMessage "WARN","Verification.","File "&lstFile(i)& " not deleted successfully. ",false
                    deleteFiles = false
                End If
                Exit for
            End If
        Next    
        End If
    Next
End Function


'[Download the CRM files from the Attachments Page]
Public Function downloadCRMFiles(lstCRMFile)
	downloadCRMFiles = selectTableLink(Attachments.tblCRMFileHeader, Attachments.tblCRMFileContent, lstCRMFile, "Files Uploaded through SGCRM", "File Name", false, null, null, null)
	If err.number = 0 Then
		'Clicked successfullly
		LogMessage "RSLT","Verification.","File downloaded successfully. ",True
	else
		LogMessage "WARN","Verification.","Failed to download the file. ",false
		downloadCRMFiles = false
	End If
End Function

'[Click on IServe files on the Attachments Page]
Public Function clickIServeFiles(lstIserveFile)
	clickIServeFiles = selectTableLink(Attachments.tblIserveFileHeader, Attachments.tblIserveFileContent, lstIserveFile, "Files Uploaded through I.Serve", "File Name", false, null, null, null)
	If err.number = 0 Then
		'Clicked successfullly
		LogMessage "RSLT","Verification.","File Clicked successfully. ",True
	else
		LogMessage "WARN","Verification.","Failed to click the file. ",false
		clickIServeFiles = false
	End If
End Function

'[Verify the file is downloaded in the Windows Folder]
Public Function verifyFile_Downloaded(strFolder,strFileName)
	verifyFile_Downloaded = true
	Set fileSystemObject = CreateObject("Scripting.FileSystemObject")
	strDownloadedPath = strFolder + strFileName
	If fileSystemObject.FileExists(strDownloadedPath) Then
		LogMessage "RSLT","Verification.","File " &strFileName& " exists. ",True	
	else
		LogMessage "RSLT","Verification.","File " &strFileName& " does not exist. ",False
		verifyFile_Downloaded = false
	End If

End Function

'*************************** Written by Sunil for the View Attachments of SR ************

'[Click on View Attachments Button on SR Page]
Public Function clickViewAttachments_SR()
	clickViewAttachments_SR = true
	Attachments.btnViewAttachments().Click
	WaitForICallLoading
	If err.number <> 0 Then
		'error occurred; file upload unsuccessful
		LogMessage "WARN","Verification.","Not able to click on View Attachments Button. ",false
		clickViewAttachments_SR = false
	else
		LogMessage "RSLT","Verification.","View Attachments Button clicked successfully. ",True
	End If
End Function

'[Verify the attached files exist on view attachments of SR Page]
Public Function verifyAttachments_ViewSR(lstFiles)
	'Create the list of list for checking on the table
	lstContents = ""
	ctFiles = ubound(lstFiles)
	For it = 0 To ctFiles Step 1
		If lstFiles(it) <> "" Then
			lstContents = lstContents & "(File Name:"&lstFiles(it)&")|"
		End If
	Next
	Dim createListOfListFiles
	createListOfListFiles = checknull(lstContents)
	verifyAttachments_ViewSR = verifyTableContentList(Attachments.tblIserveFileHeader,Attachments.tblIserveFileContent,createListOfListFiles,"Files Uploaded through I.Serve",false,null,null,null)
End Function



'*****************************************************************************************


'Added by Kalyan dated 18/08
'Public Function DragItemFromWindowsExplorerToIe(ByVal FilePath, ByVal DropAreaObject)
'        title = Browser("Browser_iCall_Home").GetROProperty("title")
'        Window("micclass:=Window", "text:=" & title & ".*").Activate
''Creating file system object
'Set fso = CreateObject("Scripting.FileSystemObject")
'    'Checking if file exist
'    If fso.FileExists(FilePath) Then
'            'Creating device replay object
'        Set dr = CreateObject("Mercury.DeviceReplay")
'        FolderPath = fso.GetParentFolderName(FilePath)
'        FolderPathArray = Split(FolderPath, "\")
'        FolderName = FolderPathArray(UBound(FolderPathArray))
'        FileName = fso.GetFileName(FilePath)
'                
'        'Adding description for Folder Window
'        Set ExplorerWindowDesc = Description.Create
'        ExplorerWindowDesc("micclass").Value = "Window"
'        ExplorerWindowDesc("regexpwndtitle").Value = FolderName
'        ExplorerWindowDesc("text").Value = FolderName
'        ExplorerWindowdesc("Location").Value = 0
'        ExplorerWindowDesc("regexpwndclass").Value = "CabinetWClass"
'        Set ExplorerWindow = Window(ExplorerWindowDesc)
'
'        'Opening the folder path
'        SystemUtil.Run FolderPath,"","","explore"
'
'        'Resizing and moving the folder window
'        ExplorerWindow.Resize 600,700
'        ExplorerWindow.Move 0,0
'        Wait 3
'        
'        'Creating Windows forms control object
'        Set ctlr = DotNetFactory.CreateInstance("System.Windows.Forms.Control")
'        Set FileToDrag = ExplorerWindow.WinObject("nativeclass:=window", "acc_name:=Items View").WinList("nativeclass:=list", "acc_name:=Items View")
'        FileToDrag.Select FileName
'        FilePosX = ctlr.MousePosition.X
'        FilePosY = ctlr.MousePosition.Y
'        ExplorerWindow.Click
'        ExplorerWindow.Drag FilePosX, FilePosY
'        
'        'Adding description for Internet Explorer Window
'        Set IEWindowDesc = Description.Create
'        IEWindowDesc("micclass").Value = "Window"
'        IEWindowDesc("regexpwndtitle").Value = ".*chrome.*"
'        'IEWindowDesc("regexpwndclass").Value = ".*frame.*"
'        Set IEWindow = Window(IEWindowDesc)
'         
'        'Adding description for Chrome Explorer Window
'
'        'Set ChromeWindowDesc = Description.Create
'        'ChromeWindowDesc("micClass").Value="WebElement"
'        'ChromeWindowDesc("class").Value = "draganddrop-area"
'        'ChromeWindowDesc("innertext").Value = "Drag and Drop files hereor"
'        'Set IEWindow=Browser("micclass:=Browser").Page("micclass:=Page").ChildObjects(ChromeWindowDesc)
'
'        'Moving the browser window
'        'IEWindow.Restore
'        'IEWindow.Move 700, 0
'        'IEWindow.Activate
'        'IEWindow.Minimize
'    
'        'DropAreaObject.Object.scrollIntoView
'        'DropAreaObject.click
'        DropAreaX = DropAreaObject.GetROProperty("abs_x")
'        DropAreaY = DropAreaObject.GetROProperty("abs_y")
'        DropAreaWidth=DropAreaObject.GetROProperty("width")
'         DropAreaHeight=DropAreaObject.GetROProperty("height")
'         x=(DropAreaX+(DropAreaWidth/2))
'         y=(DropAreaY+(DropAreaHeight/2))
'        'dr.DragAndDrop FilePosx, FilePosY, x, y, 0
'        IEWindow.Drop x, y
'        ExplorerWindow.Close
'        
'        'dr.MouseClick DropAreaX,DropAreaY,RIGHT_MOUSE_BUTTON
'
'        Set dr = Nothing
'        Set ctlr = Nothing
'
'    End If
'
'Set fso = Nothing
'
'End Function



'*********************************** Functions for drag and drop ***********************
Public Function attachFiles()
	'stackoverflow.com/questions/23040706/vbs-file-drag-and-drop-a-folder
	Dim FolderPath, objFSO, objFolder, objFile, input, objArgs
	
	' Get the folder dropped onto our script...
	strFolder = WScript.Arguments
	
	' Recursively check each file with the folder and its subfolders...
	DoFolder strFolder

End Function

Sub DoFolder(strFolder)
	    ' Check each file...
	    For Each objFile In objFSO.GetFolder(strFolder).Files
	        If objFile.Size >= intMinSize Then
	            WScript.Echo "Path: " & objFile.Path & vbCrLf & "Size: " & objFile.Size
	        End If
	    Next
	
	    ' Recursively check each subfolder...
	    For Each objFolder In objFSO.GetFolder(strFolder).SubFolders
	        DoFolder objFolder.Path
	    Next
	
	End Sub

Public Function ProcessFile(sFilePath)
    msgbox "Now processing file: " & sFilePath
	For each objFile in objFolder.Files
	    WScript.Echo objFile.Name, objFile.Size & "bytes" & VbCR_& "created: " & objFile.DateCreated & VbCR_& "modified: " & objFile.DateLastModified
	Next
End Function

Public Function dragNDrop()
	
Const MyDestinationFolder = "D:\OBTAF_QTP\OBTAF\Attachments\" 
Const OverwriteExisting = True 
 
Dim objFile,objFolder 
Dim Arg 
 
Set objFSO = CreateObject("Scripting.FileSystemObject") 
 
If WScript.Arguments.Count > 0 Then 
    For Each Arg in Wscript.Arguments 
        Arg =  Trim(Arg) 
    If InStr(Arg,".") Then 
    ' Assume a File 
      Set objFile = objFSO.GetFile(Arg) 
      ' Copy file to the Dest Folder using the same name 
      objFile.Copy MyDestinationFolder & objFile.Name,OverwriteExisting 
    Else 
    'Assume a Folder 
      Set objFolder = objFSO.GetFolder(Arg) 
      ' Copy Folder to the Dest Folder 
      objFolder.Copy MyDestinationFolder, OverwriteExisting 
    End If 
    Next 
End If 
End Function

'********** IA Related Attachment Functionalities added by Kalyan dated: 19/08/2016**********************************

'[Click on Add Attachments button displayed in New Edit IA]
Public Function ClickButton_AddAttachmentIA()
	bClickButton_AddAttachmentIA = true
	Attachments.btnAddAttachmentsIA().Click
	If err.number <> 0 Then
		'error occurred on clicking attachments
		LogMessage "WARN","Verification","Failed to Click Button : Add Attachments on New/Edit IA Page" ,false
		bClickButton_AddAttachmentIA = false
	else
		LogMessage "RSLT","Verification","Button Clicked : Add Attachments." ,true
	End If
	ClickButton_AddAttachmentIA = bClickButton_AddAttachmentIA
End Function

'Added by Kalyan dated 18/08

'[Attach the files using Drag and Drop option]
Public Function DragDropFile(lstFileNames, lstComments)
		'DropAreaObject=Attachments.lblDragandDropArea()
		'Set lblDragandDropArea = Browser("Browser_iCall_Home").Page("iCall_Attachments").WebElement("lblDragandDropArea")
		DragItemFromWindowsExplorerToIe lstFileNames,Attachments.lblDragandDropArea(),lstComments

End Function

''[Verify the attached files exist on view attachments of SR Page]
'Public Function verifyAttachments_ViewSR(lstFiles, lstComments)
'    'Create the list of list for checking on the table
'    lstContents = ""
'    ctFiles = ubound(lstFiles)
'    For it = 0 To ctFiles Step 1
'        If lstFiles(it) <> "" Then
'            lstContents = lstContents & "(File Name:"&lstFiles(it)&"|Description:"&lstComments(it)&")|"
'        End If
'    Next
'    Dim createListOfListFiles
'    createListOfListFiles = checknull(lstContents)
'    WaitForICallLoading
'    verifyAttachments_ViewSR = verifyTableContentList(Attachments.tblIserveFileHeader,Attachments.tblIserveFileContent,createListOfListFiles,"Files Uploaded through I.Serve",false,null,null,null)
'End Function


