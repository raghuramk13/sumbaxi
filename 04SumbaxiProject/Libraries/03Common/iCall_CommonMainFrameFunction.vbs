
Sub OpenPerComSession()
'Check existing connection exist
 Dim autECLOIAObj 'As Object

    Dim autECLPSObj 'As Object
    Dim autECLConnList 'As Object
    Set autECLPSObj = CreateObject("PCOMM.autECLPS")
    Set autECLConnList = CreateObject("PCOMM.autECLConnList")
	stopPerCommConnection()
		wait 1
     ' Initialize the connection
    autECLConnList.Refresh
    If autECLConnList.Count <> 0 Then
      For i = 1 To autECLConnList.Count
		strConName = autECLConnList(i).Name
		strConHandle = autECLConnList(i).Handle
		If strConName<>"A" Then
		   ClosePerComWindow(strConName)
		End If
      Next
	else
			Dim shell
		Set shell = CreateObject("WScript.Shell")
		shell.Run Chr(34) & gstrSessionFile & Chr(34), 1, false
		Set shell = Nothing
    End If
   startPerCommConnection()
End Sub


Function fWaitForAppAvailable(SessionID)

    Dim autECLOIAObj 'As Object

    Set autECLOIAObj = CreateObject("PCOMM.autECLOIA")
    autECLOIAObj.SetConnectionByName (SessionID)
    
    If (autECLOIAObj.waitforappavailable(10000)) Then
         Print "Click OK to continue."
    Else
         Print "Timeout Occured when waiting for the application to become available"
    End If
    
    Set autECLOIAObj = Nothing
    
End Function

Function fWaitForInputReady(SessionID)

    Dim autECLOIAObj 'As Object

    Set autECLOIAObj = CreateObject("PCOMM.autECLOIA")
    autECLOIAObj.SetConnectionByName (SessionID)

    If (autECLOIAObj.WaitForInputReady(10000)) Then
         Print "Ready for input"
    Else
        Print "Timeout Occurred when waiting for the application to accept input"
    End If
    
    Set autECLOIAObj = Nothing

End Function


Function fSendKeys(keyinput)

    Dim autECLPSObj 'As Object
    Dim autECLConnList 'As Object
    Set autECLPSObj = CreateObject("PCOMM.autECLPS")
    Set autECLConnList = CreateObject("PCOMM.autECLConnList")

     ' Initialize the connection
    autECLConnList.Refresh

    autECLPSObj.SetConnectionByHandle (autECLConnList(1).Handle)
    autECLPSObj.sendkeys keyinput
    
    Set autECLConnList = Nothing
    Set autECLPSObj = Nothing

End Function


Function fWaitForAttribute(SessionID, row, col, waitdata, MaskData,Plane)

    Dim autECLPSObj 'As Object

    Set autECLPSObj = CreateObject("PCOMM.autECLPS")
    autECLPSObj.SetConnectionByName (SessionID)

    If (autECLPSObj.WaitForAttrib(row, col, waitdata, MaskData, Plane, 10000)) Then
         'Print "Attribute " & waitdata & " found"
    Else
        Print "Timeout Occurred when waiting for Attribute"
    End If
    
    Set autECLPSObj = Nothing


End Function


Function fWaitForCursor(SessionID, row, col)

    Dim autECLPSObj 'As Object

    Set autECLPSObj = CreateObject("PCOMM.autECLPS")
    autECLPSObj.SetConnectionByName (SessionID)

    If (autECLPSObj.waitforcursor(row, col, 10000)) Then
         Print "Cursor is at " & row & "," & col
    Else
        Print "Timeout Occurred when waiting for cursor"
    End If
    
    Set autECLPSObj = Nothing


End Function

Function fSetCursorPosition(row, col)


    Dim autECLPSObj 'As Object
    Dim autECLConnList 'As Object
    Set autECLPSObj = CreateObject("PCOMM.autECLPS")
    Set autECLConnList = CreateObject("PCOMM.autECLConnList")

     ' Initialize the connection with the first in the list
    autECLConnList.Refresh
    autECLPSObj.SetConnectionByHandle (autECLConnList(1).Handle)
    autECLPSObj.setcursorpos row, col
    
    Set autECLConnList = Nothing
    Set autECLPSObj = Nothing    

End Function

Function fGetText(SessionID, sRow, sCol, sLen)

    Dim autECLPSObj 'As Object

    Set autECLPSObj = CreateObject("PCOMM.autECLPS")
    autECLPSObj.SetConnectionByName (SessionID)

    Print autECLPSObj.GetText(sRow,sCol,sLen)
    fGetText = autECLPSObj.GetText(sRow,sCol,sLen)
    
    Set autECLPSObj = Nothing


End Function

Function fSetText(SessionID, sRow, sCol, sText)

    Dim autECLPSObj 'As Object

    Set autECLPSObj = CreateObject("PCOMM.autECLPS")
    autECLPSObj.SetConnectionByName (SessionID)

    'Print autECLPSObj.SetText(sRow,sCol,sLen)
    Set FieldElement = autECLPSObj.autECLFieldList.FindFieldByRowCol(sRow,sCol )
	
     FieldElement.SetText(sText)
    
    Set autECLPSObj = Nothing


End Function

Function fGetTextRect(SessionID,sRow, sCol, eRrow, eCol)

    Dim autECLPSObj 'As Object

    Set autECLPSObj = CreateObject("PCOMM.autECLPS")
    autECLPSObj.SetConnectionByName (SessionID)

    Print autECLPSObj.GetTextRect(srow,scol,erow,ecol)
    fGetTextRect = autECLPSObj.GetTextRect(srow,scol,erow,ecol)
    Set autECLPSObj = Nothing


End Function


Public Sub startPerCommConnection()
	Wait 4
	Set autECLConnList = CreateObject("PCOMM.autECLConnList")
	'Start the first session
	If autECLConnList.Count<>0 Then
		autECLConnList.Refresh
		autECLConnList(1).StartCommunication
		autECLConnList.Refresh
	End If
	Set autECLConnList=nothing

End Sub
Public Function stopPerCommConnection()

	Set autECLConnList = CreateObject("PCOMM.autECLConnList")
 
	'Start the first session
	If autECLConnList.Count <>0 Then
		autECLConnList.Refresh
		autECLConnList(1).StopCommunication
		autECLConnList.Refresh
	End If
	Set autECLConnList=nothing

End Function


Public Function ClosePerComWindow(strConName)
   Dim Mgr
Dim Handle
 
Set Mgr = CreateObject("PCOMM.autECLConnMgr")
 'Handle
' Assume we've got connections open and the Hand parm was obtained earlier
'Mgr.StopConnection Hand, "saveprofile=no"
'or
Mgr.StopConnection strConName, "saveprofile=no"
Set Mgr =nothing
End Function


