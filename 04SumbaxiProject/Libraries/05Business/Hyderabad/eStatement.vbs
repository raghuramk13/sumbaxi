'*****This is auto generated code using code generator please Re-validate ****************

'[Verify eStatement in Other Popup]
Public Function verifyeStatement()
	bverifyeStatement=true
	bcCustomerOverview.lnkOthers.click
	Wait 1
	If (bcCustomerOverview.lnkEStatement().exist(0)) Then
	  bverifyeStatement = true
	else
	  LogMessage "WARN","Verification","eStatement link not available in Other Popup" ,False
	  bverifyeStatement = false	  
	End If
	verifyeStatement=bverifyeStatement
End Function

'[Click eStatement Link to Open]
Public Function clickEStatement()	
	bcCustomerOverview.lnkEStatement.Click
	If Err.Number<>0 Then
       clickEStatement=false
       LogMessage "WARN","Verification","Failed to Click Button : eStatement" ,false
       Exit Function
   End If
    clickEStatement=true
	WaitForICallLoading
End Function

'[Verify Pink Panel in eStatement screen]
Public Function verifyeStatementPinkPanel(strName,strCIN,strSegment)
	bverifyeStatementPinkPanel=true
	If Not IsNull (strName) Then
		If Not verifyInnerText(eStatement.lblName(),strName, "Name") Then
			bverifyeStatementPinkPanel=false
		End If
	End If
	If Not IsNull (strCIN) Then
		If Not verifyInnerText(eStatement.lblCIN(),strCIN, "CIN") Then
			bverifyeStatementPinkPanel=false
		End If
	End If
	If Not IsNull (strSegment) Then
		If Not verifyInnerText(eStatement.lblSegment(),strSegment, "Segment") Then
			bverifyeStatementPinkPanel=false
		End If
	End If
	verifyeStatementPinkPanel=bverifyeStatementPinkPanel
End Function

'[Verify Statement Table in eStatement screen]
Public Function verifyStatementTable(arrRowDataList)
	bverifyStatementTable=true
	verifyStatementTable=verifyTableContentList(eStatement.tblEStatementHeader,eStatement.tblEStatementContent,arrRowDataList,"Statement Table",false,null,null,null)
End Function

'[Click on Statement Option in Statement Table]
Public Function ClickStatementOption(arrRowDataList)
	bClickStatementOption=true
	ClickStatementOption=selectTableLink(eStatement.tblEStatementHeader,eStatement.tblEStatementContent,arrRowDataList,"Statement Table","Statement Option",false,null,null,null)
	WaitForICallLoading
	If not eStatement.lblEnrolmentDetails.Exist Then
		LogMessage "WARN","Verification","Enrolment Detail section not open successfully." ,False
		bClickStatementOption=false
	End If
	ClickStatementOption=bClickStatementOption
End Function

'[Verify Enrolment Details on EStatement Screen]
Public Function verifyEnrolmentDetails(lstEnrolmentDetails,strCIN)
	bverifyEnrolmentDetails=true
	
	If not IsNull (lstEnrolmentDetails) Then
	For iCount =0 to Ubound(lstEnrolmentDetails)
        strLabel=Split (lstEnrolmentDetails(iCount),":")(0)
        strDetail=Split (lstEnrolmentDetails(iCount),":")(1)
        Select Case strLabel
        
        Case "Email"
        If Not Isnull (strDetail) Then        
        	If strDetail="RUNTIME" Then
        		getEstatementDetails(strCIN)
        		strDetail=strRunTimeEmail
        	End If
        	If Not  verifyInnerText (eStatement.lblEmail(), strDetail, "Email") Then
        		bverifyEnrolmentDetails = false
        	End If
		End If
        Case "Enrolment Channel"
        If Not Isnull (strDetail) Then
        	If strDetail="RUNTIME" Then
        		'getEstatementDetails(strCIN)
        		strDetail=strRunTimeEnrolmentChannel
        	End If
        	If Not  verifyInnerText (eStatement.lblEnrolmentChannel(), strDetail, "Enrolment Channel") Then
        		bverifyEnrolmentDetails = false
        	End If
        End If
        Case "Enrolled By"
        If Not Isnull (strDetail) Then
        	If strDetail="RUNTIME" Then
        		'getEstatementDetails(strCIN)
        		strDetail=strRunTimeEnrolledBy
        	End If
        	If Not  verifyInnerText (eStatement.lblEnrolledBy(), strDetail, "Enrolled By") Then
        		bverifyEnrolmentDetails = false
        	End If
        End If
        Case "Enrolled Date Time"
        If Not Isnull (strDetail) Then
        	If strDetail="RUNTIME" Then
        		'getEstatementDetails(strCIN)
        		strDetail=strRunTimeEnrolledDateTime
        	End If
        	strEnrollDate = Replace((strDetail),"&",":")
        	If Not  verifyInnerText (eStatement.lblEnrolledDateTime(), strEnrollDate, "Enrolled Date Time") Then
        		bverifyEnrolmentDetails = false
        	End If
        End If
        Case "Terminated By"
         If Not Isnull (strDetail) Then
        	If strDetail="RUNTIME" Then
        		'getEstatementDetails(strCIN)
        		strDetail=strRunTimeTerminatedBy
        	End If
        	If Not  verifyInnerText (eStatement.lblTerminatedBy(), strDetail, "Terminated By") Then
        		bverifyEnrolmentDetails = false
        	End If
        End If
        Case "Terminated Date Time"
        If Not Isnull (strDetail) Then
        	If strDetail="RUNTIME" Then
        		'getEstatementDetails(strCIN)
        		strDetail=strRunTimeTerminatedDateTime
        	End If
        	strTerminatedDate = Replace((strDetail),"&",":")
        	If Not  verifyInnerText (eStatement.lblTerminatedDateTime(), strTerminatedDate, "Terminated Date Time") Then
        		bverifyEnrolmentDetails = false
        	End If
        End If
        Case "Termination Reason"
        If Not Isnull (strDetail) Then
        	If strDetail="RUNTIME" Then
        		'getEstatementDetails(strCIN)
        		strDetail=strTerminationReason
        	End If
        	If Not  verifyInnerText (eStatement.lblTerminationReason(), strDetail, "Termination Reason") Then
        		bverifyEnrolmentDetails = false
        	End If
        End If
        End Select
	Next
	End If
	verifyEnrolmentDetails=bverifyEnrolmentDetails	
End Function

'[Verify Hyperlink in Cell for Statement Table is Disable]
Public Function verifyCellDisable(lstStatementDetails,strStatus)
	bverifyCellDisable=true
	strActualStatus=verifyCellDisable_tblCell(eStatement.tblEStatementHeader,eStatement.tblEStatementContent,lstStatementDetails,"Statement Table","Statement Option",false,null,null,null)
	If UCase(strStatus)=Ucase(strActualStatus) Then
	LogMessage "RSLT","Verification","Expected Status "&strStatus&" for Celltable Matched with Actual Status",true
	bverifyCellDisable=true
  else
	LogMessage "RSLT","Verification","Expected Status "&strStatus&" for Celltable not Matched with Actual Status "&strActualStatus&" for Card Number : "&strCardNumber ,false
	bverifyCellDisable=false
  End If
  verifyCellDisable=bverifyCellDisable
End Function
