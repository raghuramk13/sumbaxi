Dim iPageWaitTime
iPageWaitTime = 10

Public Sub WaitForBrowserReady
	SyncBrowser
	Wait(iPageWaitTime)
End Sub

Public Sub SyncBrowser
   	Browser("index:=0").Sync
   	
   	Wait(iPageWaitTime)
   	'On Error Resume Next
	For i = 1 To 50
		If Not IsProcessRunning("chrome.exe") Then 
			Wait(1)
		Else
			If Browser("index:=0").Page("title:=M.*").Object.ReadyState <> "complete" Then
				Wait(1)
			Else
				Exit For
			End If
		End If
	Next
End Sub

Public Sub WaitForReady
	SyncBrowser
	wait iPageWaitTime
	SyncBrowser		
End Sub

Public Sub WaitForICallLoading
	MercuryTimers.Timer(Load).Reset 
	MercuryTimers("Load").Start
	On Error Resume Next
	
	Dim strOuterHtml
	Dim iMaxTimeOut, iCounter
	
	Wait iPageWaitTime
	iMaxTimeOut = 180
	iCounter = 0
	
	SyncBrowser
	
	For iCount = 1 To iMaxTimeOut Step 1
		bWait = Browser("ICall").Page("ICall").WebElement("weLoadingInd").Exist(0.5)
		If bWait Then
			Wait(0.5)
			iCounter = iCounter + 1
		Else
			Print VbTab & VbTab &"IServe page loading completed"
			Exit For
		End if
	Next
	
	If  iCounter = iMaxTimeOut Then
		Print   VbTab & VbTab &"Max Time out reached for Synchronization - "& iMaxTimeOut + iPageWaitTime
		Exit Sub
	Else
		Print VbTab & VbTab &"Successfully Handled Synchronization"
	End If
	MercuryTimers("Load").Stop
End Sub

' Written by  on 12 Sep 2017: For Indonesia IServe Synchronization
Public Sub WaitForIServeLoading
	MercuryTimers.Timer(Load).Reset 
	MercuryTimers("Load").Start
	On Error Resume Next
	
	Dim strOuterHtml
	Dim iMaxTimeOut, iCounter
	
	Wait iPageWaitTime
	iMaxTimeOut = 180
	iCounter = 0
	
	Browser("index:=0").Sync
	
	For iCount = 1 To iMaxTimeOut Step 1
		' Code commented by  on 30th oct 2017
		'bWait = gObjIServePage.WebElement("xpath:=//md-spinner[@id='progress_bar']").Exist(0.5)
		
		'Code added by  on 30th oct 2017 . to handle both multi and single spinner
		bWait = gObjIServePage.WebElement("xpath:=//div[@class='isrv-loader-container']").Exist(0.5)
		
		If bWait Then
			Wait(1)
			iCounter = iCounter + 1
		Else
			Print VbTab & VbTab &"IServe page loading completed"
			Exit For
		End if
	Next
	
	If  iCounter = iMaxTimeOut Then
		Print   VbTab & VbTab &"Max Time out reached for Synchronization - "& iMaxTimeOut + iPageWaitTime
		Exit Sub
	Else
		Print VbTab & VbTab &"Successfully Handled Synchronization : " & "IServe page loading completed in : " & iCounter &" seconds"
	End If
	MercuryTimers("Load").Stop
End Sub
