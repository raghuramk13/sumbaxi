Dim SourceCapture
Set SourceCapture = cSourceCapture()
On Error Resume Next

Dim myxl, FilePath,WorkBookName, mysheet, WorkBook

Dim strRunTimeRelatedTo:strRunTimeRelatedTo=""
Dim strRunTimeType:strRunTimeType=""
Dim strRunTimeSubType:strRunTimeSubType=""
Dim FieldValue:FieldValue=""
Dim strFieldAttributes:strFieldAttributes="" 
Dim strRunTimeRouteTo:strRunTimeRouteTo=""
Dim sheetTMApproval:sheetTMApproval=""
Dim strExpectedSRNo:strExpectedSRNo=""
Dim numMaxLt:numMaxLt=""
Dim strDateValidation:strDateValidation=""
Dim intCounter:intCounter=""
Dim arrRunTimeValues(20)

Dim strRunTimeComment:strRunTimeComment="Comment for Capture Source"
Dim strComment

Public Function cSourceCapture()
    Set cSourceCapture = New clsSourceCapture
End Function

Class clsSourceCapture
        Private Sub Class_Initialize()
        End Sub
        Private Sub Class_Terminate()
        End Sub
End Class

'[Run the Capture Source Triplet]
Public Function runCaptureSource(strRelatedTo, strType, strSubType, strRouteTo, TM_Approval, Field_Attributes, fileAttachments, lstFiles)
    brunCaptureSource = true
	strRunTimeRelatedTo = strRelatedTo
	strRunTimeType = strType
	strRunTimeSubType = strSubType
	strRunTimeRouteTo = strRouteTo
	sheetTMApproval = TM_Approval
	strFieldAttributes = Field_Attributes
	
	'******* Open the Excel Sheet
	Call OpenExcelSheet()
	'***************** Navigate to the C@S Page
	Call NavigateToCS()
	'************** Fill the above fields in the iServe; click on Go
	btest=fillData_GenericSR(strRunTimeRelatedTo,strRunTimeType,strRunTimeSubType)
	'************* Check the attachments and if applicable, upload the files
	If fileAttachments = "Y" Then
		'now upload the files
		'Call uploadFiles_CS(lstFiles)
		Call uploadFilesUsingBrowse(lstFileNames, "|")
		
	End If
	
	'************ compare the dynamic fields now *******************
   	'initialize the counter
	intCounter = 0		
	'******** To identify Field name from SR Field (this could be multiple)
	Set rsAddin = CreateObject("ADODB.Recordset")
	call GetContentsFromDB(WorkBook, "Select Field_Name from [SR_Field_Required$] where SR_Ref='"&strFieldAttributes&"'",rsAddin)
	For i = 1 To rsAddin.RecordCount
    	For k= 0 To rsAddin.Fields.Count -1
    	    FieldName = rsAddin.Fields(k).Name
    	    If isnull(rsAddin.Fields(k).Value) = false Then
    	        FieldValue = rsAddin.Fields(k).Value
    	    else
    	        FieldValue = ""
    	    End If
    	    Print "field Name >> " & FieldName & " is having Field value >> " &  FieldValue
    	    '*********** Get the corresponding values
    	    'Value = GetCorrvalues()			
			'************** Get the Corresponding DataType also
			DataType = GetCorrDataType()
			'********* Get the max length
			numMaxLt = GetMaxLt()			
			'***** check if the field exists			
			Set bfield=objFieldName()	
			If (bfield.exist) Then
				'LogMessage "RSLT","Verification","Related To: " &strRunTimeRelatedTo& " Type: " &strRunTimeType& "Sub Type: " &strRunTimeSubType& " Field Attributes " &strFieldAttributes& " Field Name "&FieldValue&"  exist in Capture @ Source screen",True				
				LogMessage "RSLT","Verification","Field Name "&FieldValue&"  exist in Capture @ Source screen",True				
				'************ Write into the Result column of the excel sheet
				Call FieldExistStatus("Object Exist")
				'********* enter value function
				Call EnterValues(bfield, Value, DataType)
				'increase the counter
				intCounter = intCounter + 1	
          else
               	'************ Write into the Result column of the excel sheet
				Call FieldExistStatus("Object Does Not Exist")
               	LogMessage "WARN","Verification","Related To: " &strRunTimeRelatedTo& " Type: " &strRunTimeType& "Sub Type: " &strRunTimeSubType& " Field Attributes " &strFieldAttributes& " Field Name "&FieldValue&" does not exist in Capture @ Source screen",false
               	brunCaptureSource = false
			End If				
   		Next
    rsAddin.MoveNext
    
	Next
	
	Set rsAddin.ActiveConnection = Nothing  
	'check if the submit button is enabled or not
	intBtnSubmit=Instr(ServiceRequest.btnSubmit.Object.GetAttribute("disabled"),("disabled"))
	   If  intBtnSubmit<>0 Then
			LogMessage "WARN","Verification","Submit button is disabled. Expected enable.",False
			brunCaptureSource = false
			'exit the function
			Exit function
		else
			'go forward to the submission and other steps
			Call clickSubmit_CaptureSource
			waitForIcallLoading
			'check if the error occurs after submission
			if(ServiceRequest.lblErrorMessageCS().Exist) then
				ServiceRequest.btnErrorMsgCS().Click
				LogMessage "WARN","Verification","Related To: " &strRunTimeRelatedTo& " Type: " &strRunTimeType& "Sub Type: " &strRunTimeSubType& " Error Occured on Submission",false
				brunCaptureSource = false
				Exit Function
			else
				Call checkTMApproval()
			End if	
	   End If	    	    	
	   runCaptureSource = brunCaptureSource
	'myxl.ActiveWorkbook.Save	
End Function

'[Run the Capture Source Triplet test1]
Public Function runCaptureSource1(strRelatedTo, strType, strSubType, strRouteTo, TM_Approval, Field_Attributes)
    brunCaptureSource1 = true
	strRunTimeRelatedTo = strRelatedTo
	strRunTimeType = strType
	strRunTimeSubType = strSubType
	strRunTimeRouteTo = strRouteTo
	sheetTMApproval = TM_Approval
	strFieldAttributes = Field_Attributes
	
	'******* Open the Excel Sheet
	Call OpenExcelSheet()
	'***************** Navigate to the C@S Page
	Call NavigateToCS()
	'************** Fill the above fields in the iServe; click on Go
	btest=fillData_GenericSR(strRunTimeRelatedTo,strRunTimeType,strRunTimeSubType)
	'************* Check the attachments and if applicable, upload the files
	
	'************ compare the dynamic fields now *******************
   	'initialize the counter
	intCounter = 0		
	'******** To identify Field name from SR Field (this could be multiple)
	Set rsAddin = CreateObject("ADODB.Recordset")
	call GetContentsFromDB(WorkBook, "Select Field_Name from [SR_Field_Required$] where SR_Ref='"&strFieldAttributes&"'",rsAddin)
	For i = 1 To rsAddin.RecordCount
    	For k= 0 To rsAddin.Fields.Count -1
    	    FieldName = rsAddin.Fields(k).Name
    	    If isnull(rsAddin.Fields(k).Value) = false Then
    	        FieldValue = rsAddin.Fields(k).Value
    	    else
    	        FieldValue = ""
    	    End If
    	    Print "field Name >> " & FieldName & " is having Field value >> " &  FieldValue
    	    '*********** Get the corresponding values
    	    'Value = GetCorrvalues()
			'************** Get the Corresponding DataType also
			DataType = GetCorrDataType()
			'********* Get the max length
			numMaxLt = GetMaxLt()			
			'***** check if the field exists			
			Set bfield=objFieldName()	
			If (bfield.exist) Then
				'LogMessage "RSLT","Verification","Related To: " &strRunTimeRelatedTo& " Type: " &strRunTimeType& "Sub Type: " &strRunTimeSubType& " Field Attributes " &strFieldAttributes& " Field Name "&FieldValue&"  exist in Capture @ Source screen",True				
				LogMessage "RSLT","Verification","Field Name "&FieldValue&"  exist in Capture @ Source screen",True				
				'************ Write into the Result column of the excel sheet
				Call FieldExistStatus("Object Exist")
				'********* enter value function
				Call EnterValues(bfield, Value, DataType)
				'increase the counter
				intCounter = intCounter + 1	
          else
               	'************ Write into the Result column of the excel sheet
				Call FieldExistStatus("Object Does Not Exist")
               	LogMessage "WARN","Verification","Related To: " &strRunTimeRelatedTo& " Type: " &strRunTimeType& "Sub Type: " &strRunTimeSubType& " Field Attributes " &strFieldAttributes& " Field Name "&FieldValue&" does not exist in Capture @ Source screen",false
               	brunCaptureSource1 = false
			End If				
   		Next
    rsAddin.MoveNext
    
	Next
	Set rsAddin.ActiveConnection = Nothing  
	'check if the submit button is enabled or not
	intBtnSubmit=Instr(ServiceRequest.btnSubmit.Object.GetAttribute("disabled"),("disabled"))
	   If  intBtnSubmit<>0 Then
			LogMessage "WARN","Verification","Submit button is disabled. Expected enable.",False
			brunCaptureSource1 = false
			'exit the function
			Exit function
		else
			'go forward to the submission and other steps
			Call clickSubmit_CaptureSource
			waitForIcallLoading
			'check if the error occurs after submission
			if(ServiceRequest.lblErrorMessageCS().Exist) then
				ServiceRequest.btnErrorMsgCS().Click
				LogMessage "WARN","Verification","Related To: " &strRunTimeRelatedTo& " Type: " &strRunTimeType& "Sub Type: " &strRunTimeSubType& " Error Occured on Submission",false
				brunCaptureSource1 = false
				Exit Function
			else
				Call checkTMApproval()
			End if	
	   End If	    	    	
	   runCaptureSource1 = brunCaptureSource1
	'myxl.ActiveWorkbook.Save	
End Function


Public Function OpenExcelSheet()
	Set myxl = createobject("excel.application")
	'Added by kalyan
	'myxl.Application.Visible = true 
	'FilePath = "D:\OBTAF_QTP\Feature\Release1603_TestSuite\CaptureAtSource\"
	FilePath = "D:\iserve_testing\Automation\Feature\Release1603_TestSuite\CaptureAtSource\"
	WorkBookName = "CS_SR_Template"
	WorkBook = FilePath & WorkBookName &".xlsx"
	Dim objAdCon
	'Initialize excel from which data have to read
	myxl.Workbooks.Open WorkBook
	myxl.Application.Visible = false
	set mysheet = myxl.ActiveWorkbook.Worksheets("SR_Field_Required")
End Function

'************ Check the TM Approval and do the according
Public Function checkTMApproval()
	If sheetTMApproval= "Y" Then
		'*********** To verify TM Approval Message
		'Call verifyTMApprovalMessage_CaptureSource()
		TMMessage = verifyTMApprovalMessage_CaptureSource()
		If Not TMMessage Then
			LogMessage "WARN","Verification","Expected TM Approval Pop up does not displayed.",false
		Else
			'********* Logout and Login as TM				
			bTM=Logout_TMLogin("CRMUAT2","Password1")
			'********** Search and Open Created SR for Approval
			Call selectPendingSR_TMHome_CS("CCACSO2-ccacso2",strRunTimeType,"SR CREATED ON")
			WaitForICallLoading
			'*********** Click on Approve button
			Call clickButtonApprove_TM
			'********** Verify Popup Comment(notes in case of C@S) on TM Approval Screen exist
			Call verifyPopupCommentexist_TM("True")
			'********* Set TextBox Comment(notes in case of C@S) onTM Comment Popup on TM Approval Screen to
			Call setComment_TMTextbox("Comments TM CS")
			'*********** Click Button OK on TM Comment Popup on TM Approval Screen
			Call clickButtonOK_TMCommentPopup()
			'check if the error occurs after submission
			if(ServiceRequest.lblErrorMessageCS().Exist) then
				ServiceRequest.btnErrorMsgCS().Click
				LogMessage "WARN","Verification","Related To: " &strRunTimeRelatedTo& " Type: " &strRunTimeType& "Sub Type: " &strRunTimeSubType& " Error Occured on TM Approval",false
				Exit Function
			End If
			'************* Verify Popup RequestSubmitted on TM Approval Screen exist
			Call verifyPopupRequestSubmittedexist_TM("True")
			'************* Click button Close on Request Submitted Popup
			Call clickButtonClose_RequestSubmitted()
			'************ Perform Logout and Login again as CSO "$CSO" "Password1"
			Call Logout_CSOLogin("ccacso2", "Password1")
			'************ Search Customer with CIN "$CIN", Name "$Name", DOB "$DOB"
			Call SearchCustomerwithCIN("M8970010","ICALL FAMILY5 USER1 PB ICALL FAMILY5 USERNAME2","24 Mar 1983")
			'*********** Click Link Name "$CINSuffix" in Search table
			Call ClickLinkNameInSearchTable("M8970010 00")
			'************ If Highlight Page Is Displayed Handle Highlight
			Call IfHighlightPageDisplayedHandleHighlight()
			'************* Select Tab Customer Overview
			Call SelectTabCustomerOverview()
			'*********** Call the function to verity the SR along with Additional SR info
			Call verifyServiceRequestSR()
			'********** Perform MA by answering Authentication and Identification question
			'Call performMAAuthIde(CheckNull("May I have your NRIC or Passport Number?|May I have your Date of Birth?"),CheckNull("How many Main / Supplementary credit cards do you have with Bank?|How many ATM / Debit cards do you have with us?"))
						
		End If				
	Else
		'Call verifyStatus_CaptureSource
		bStatus = verifyStatus_CaptureSource()
		bPopUp = verifyPopUp_CaptureSource()
		'if either verifyStatus_CaptureSource or verifyPopUp_CaptureSource exists, then it is successful
			If bStatus or bPopUp Then
				LogMessage "RSLT","Verification","Popup Exists and hence submitted successfully",True
			Else
				LogMessage "WARN","Verification","Popup does not exist. Not submitted successfully",false
			End If
		Call clickClose_CaptureSource
		waitForIcallLoading
		'******* Now go to SR tab and verify SR
		'Select Tab Customer Overview
		Call SelectTabCustomerOverview()
		Call verifyServiceRequestSR()
				
	End If
End Function

'******* As the below function is common for both TM approval yes or No
Public Function verifyServiceRequestSR()
		
		wait 200
		'************* User click Service Request tab
		Call clickServiceRequesttab()
		wait 2
		'User click Unknown SR Number form Service Request Tab "$AssignTo" "$SubType" "$CIN"
		strExpectedSRNo = ClickUnknownSRNumber_CS(strRunTimeSubType,"M8970010")
		
		'Verify Tab ViewSR displayed "View SR -.*"
		verifyTabViewSRexist("View SR -.*")

		'Verify Field RelatedTo displayed as "Cashline"
		verifyRelatedToText(strRunTimeRelatedTo)
		
		'Verify Field Type displayed as "Credit Balance Refund"
		verifyTypeText(strRunTimeType)
		
		'Verify Field SubType displayed as "To Deposit Account / By Cheque"
		verifySubTypeText(strRunTimeSubType)

		'Verify Field Status on ViewSR Screen displayed as "Open"
		verifyStatus_ViewSRText("Open")
		
		'Verify Field SubStatus displayed as "Assigned"
		verifySubStatusText("Assigned")
		
		'************** Assigned to is Runtime (not fixed); need to check with CRM/SOI
		'Verify Field AssignedTo displayed as "T&O CrOps Cashline & Loan Svs"
		'verifyAssignedToText("assigned to")
		
		'Verify OnceAndDone Checkbox Checked on View SR Screen "False"
		verifyOnceAndDone("False")
		wait 2
		'check for the Additional SR Info
		Call verifyAdditionalSRInfo()
		
		'verify either the case number(if routed to IWF) and both service request no and Case number (if to CRM) exists
		Call verifySRnCaseNo()
		
End Function

'******** Verify the additional SR Info
Public Function verifyAdditionalSRInfo()
	'Set the intCounter back to zero
	intCounter = 0
	bverifyAdditionalSRInfo=true
	Set rsAddinSR = CreateObject("ADODB.Recordset")
 	call GetContentsFromDB(WorkBook, "Select Field_Name from [SR_Field_Required$] where SR_Ref='"&strFieldAttributes&"'",rsAddinSR)
	For i = 1 To rsAddinSR.RecordCount
    	For k= 0 To rsAddinSR.Fields.Count -1
    	    FieldName = rsAddinSR.Fields(k).Name
    	    If isnull(rsAddinSR.Fields(k).Value) = false Then
    	        FieldValue = rsAddinSR.Fields(k).Value
    	    else
    	        FieldValue = ""
    	    End If
    	    Print "field Name >> " & FieldName & " is having Field value >> " &  FieldValue
    	    '*********** Get the corresponding values from the array
    	    strExpectedVal = arrRunTimeValues(intCounter)
			intCounter = intCounter + 1    	    
			'***** check if the field exists			
			Set bfield=objFieldName()	
			If (bfield.exist) Then
				LogMessage "RSLT","Verification","The field name: "&FieldValue& " exists in Additional SR Info",True				
					'compare the value of GetRopropery with that of the excel sheet
					strActualVal = bfield.GetRoProperty("innertext")
					If (strActualVal = strExpectedVal) Then
						LogMessage "RSLT","Verification","The field name: "&FieldValue& " Expected: "&strExpectedVal&" Actual: "&strActualVal,True
					else
						LogMessage "WARN","Verification","The field name: "&FieldValue& " Expected: "&strExpectedVal&" Actual: "&strActualVal,False
					End If
          else
               	'************ Write into the Result column of the excel sheet
				Call FieldExistStatus("Object Does Not Exist")
               	LogMessage "WARN","Verification","Related To: " &strRunTimeRelatedTo& " Type: " &strRunTimeType& "Sub Type: " &strRunTimeSubType& " Field Attributes " &strFieldAttributes& " Field Name "&FieldValue&" does not exist in Capture @ Source screen",false
			End If				
   		Next
    rsAddinSR.MoveNext	
	Next
	Set rsAddinSR.ActiveConnection = Nothing		
End Function

'*************** Function to check the SR no and case No
Public Function verifySRnCaseNo()
	If(strRunTimeRouteTo = "IWF") then
		'check if both case number and sr number are generated
		strActualSRNo = ServiceRequest.lblServiceRequestNo().GetRoProperty("innertext")
		if(strExpectedSRNo = strActualSRNo) then
			'print "SR No: " &strActualSRNo
			LogMessage "RSLT","Verification","SR number is matching. Acutal: "&strActualSRNo & "Expected: " &strExpectedSRNo & " " ,True
		else
			LogMessage "WARN","Verification","SR number is not matching. Acutal: "&strActualSRNo & "Expected: " &strExpectedSRNo & " " ,false
		End if
		'check the Case number exists or not
		strActualCaseNo = ServiceRequest.lblCaseNumber.GetRoProperty("innertext")
		If not isnull(strActualCaseNo) Then
			LogMessage "RSLT", "Verification", "Case Number exists: "&strActualCaseNo, True   
		else
			LogMessage "WARN","Verification","Case Number does not exist." ,false
		End If
	Else
		'for CRM, only service request is present
		strActualSRNo = ServiceRequest.lblServiceRequestNo().GetRoProperty("innertext")
		if(strExpectedSRNo = strActualSRNo) then
			LogMessage "RSLT", "Verification", "SR number is not matching. Acutal: "&strActualSRNo & "Expected: " &strExpectedSRNo & " ", True   
		else
			LogMessage "WARN","Verification","SR number is not matching. Acutal: "&strActualSRNo & "Expected: " &strExpectedSRNo & " " ,false
		End if
		'check the Case number exists or not (should not exist)
		strActualCaseNo = ServiceRequest.lblCaseNumber.GetRoProperty("innertext")
		If  strActualCaseNo = "" Then
			LogMessage "RSLT", "Verification", "Case Number should not exist and it does not exist also.", True   
		else
			LogMessage "WARN","Verification","Case Number should not exist but exists." ,false
		End If
	End if
End Function

'********** Get Corresponding Data Types
Public Function GetCorrDataType()
	Set rsAddinInData = CreateObject("ADODB.Recordset")
 			call GetContentsFromDB(WorkBook, "Select Data_Type from [SR_Field_Required$] where SR_Ref='"&strFieldAttributes&"' and Field_Name = '"&FieldValue&"'",rsAddinInData)
 			For t = 1 To rsAddinInData.RecordCount
		    	For u= 0 To rsAddinInData.Fields.Count -1
		    	    FieldName = rsAddinInData.Fields(u).Name
		    	    If isnull(rsAddinInData.Fields(u).Value) = false Then
		    	        DataType = rsAddinInData.Fields(u).Value
		    	    else
		    	        DataType = ""
		    	    End If
		    	    Print "DataType >> " & FieldName & " is having the value >> " &  DataType
		    	Next
		    	rsAddinInData.MoveNext
			Next	
			GetCorrDataType = DataType
			Set rsAddinInData.ActiveConnection = Nothing
End Function

'*********** Get the maximum Length
Public Function GetMaxLt()
	Set rsAddinMaxLt = CreateObject("ADODB.Recordset")
 			call GetContentsFromDB(WorkBook, "Select Max_Length from [SR_Field_Required$] where SR_Ref='"&strFieldAttributes&"' and Field_Name = '"&FieldValue&"'",rsAddinMaxLt)
 			For t = 1 To rsAddinMaxLt.RecordCount
		    	For u= 0 To rsAddinMaxLt.Fields.Count -1
		    	    FieldName = rsAddinMaxLt.Fields(u).Name
		    	    If isnull(rsAddinMaxLt.Fields(u).Value) = false Then
		    	        numLt = rsAddinMaxLt.Fields(u).Value
		    	    else
		    	        numLt = ""
		    	    End If
		    	    Print "DataType >> " & FieldName & " is having the value >> " &numLt
		    	Next
		    	rsAddinMaxLt.MoveNext
			Next	
			GetMaxLt = numLt
End Function

'*********** Get the remarks (in case of date field)
Public Function GetValidation()
	Set rsRemarks = CreateObject("ADODB.Recordset")
	call GetContentsFromDB(WorkBook, "Select Validation from [SR_Field_Required$] where SR_Ref='"&strFieldAttributes&"' and Field_Name = '"&FieldValue&"'",rsRemarks)
	For t = 1 To rsRemarks.RecordCount
		For u= 0 To rsRemarks.Fields.Count -1
		    FieldName = rsRemarks.Fields(u).Name
		    If isnull(rsRemarks.Fields(u).Value) = false Then
		        strValidation = rsRemarks.Fields(u).Value
		    else
		        strValidation = ""
		    End If
		    Print "Remarks >> " & FieldName & " is having the value >> " &strRemarks
		Next
	rsRemarks.MoveNext
	Next	
	GetValidation = strValidation
End Function

'*****Create the runtime object and check if they exist
Public Function objFieldName()
	bobjFieldName=true
	'create objects on the runtime and check
	Set SRPage = Browser("Browser_iCall_Home").Page("iCall_ServiceRequest")
	Set odesc_FieldName=Description.Create
	odesc_FieldName ("xpath").value="//*[@id='"&FieldValue&"']"
	set oFieldName= SRPage.ChildObjects(odesc_FieldName)
	'Added by Kalyan 0903
	strdisabled=oFieldName(0).getroproperty("disabled")
	If not strdisabled=0 then
		LogMessage "WARN","Verification","Field Name "&FieldValue&" not exist in Capture @ Source screen",false
		bobjFieldName=false
	End If
	
'	If not (oFieldName(0).exist) then
'		LogMessage "WARN","Verification","Field Name "&FieldValue&" not exist in Capture @ Source screen",false
'		bobjFieldName=false
'	End If
	'objFieldName=bobjFieldName
	Set objFieldName = oFieldName(0)
End Function

'[Fill the data in the fields]
Public Function EnterValues(bfield, Value, DataType)
	'Fill the Values as well according to the data type
	Select Case (DataType)
		Case ("Drop Down Values")
			Set oDesc=Description.Create
			oDesc("micclass").Value = "WebElement"
			oDesc("class").Value = "md-autocomplete-icon.*"
			set lstObj=bfield.ChildObjects(oDesc)
			lstObj(0).Click
			wait 1
			lstObj(0).Click
			
			'To get unique id for Inpur text field.
			Set oDesc1=Description.Create
			'oDesc1("xpath").value="//*[contains(@class,'autocompleteInput')]"
			oDesc1("class").value="autocompleteInput.*"
	  		Wait 1	  		
			strID=bfield.ChildObjects(oDesc1)(0).getroproperty("html id")			
			strID1=Replace(strID,"input","ul")
	  		
	  		'Create object with list of content for combo box
			Set oDesc2=Description.Create	  	
	  		oDesc2("html id").value=strID1	  
			set lstComboItems=Browser("micclass:=Browser").Page("micclass:=Page").ChildObjects(oDesc2)
	  		
	  		'get Combo box content list
			Set oDescCombo=Description.Create
			oDescCombo("micclass").Value = "WebElement"			
			oDescCombo("class").Value = "suggestion-item.*"					
			set lstCombo=lstComboItems(0).ChildObjects(oDescCombo)
			lstCombo(0).click	' Always want to click on first element of combo box
			Wait 1
			'read the values after setting them
			arrRunTimeValues(intCounter) = bfield.ChildObjects(oDesc1)(0).getroproperty("value")	
			LogMessage "RSLT","Verification","Values set as "&arrRunTimeValues(intCounter) ,True			
		Case("Numeric")
			numvalue = extractNumericValues()
			bfield.set numvalue	
			'read the values after setting them
			arrRunTimeValues(intCounter) = bfield.getroproperty("value")	
		Case("Alphanumeric")
			alnumValue = extractAlNumericValues()
			bfield.set alnumValue	
			'read the values after setting them
			arrRunTimeValues(intCounter) = bfield.getroproperty("value")
		Case("Alpha")
			alValue = extractAlphaValues()
			bfield.set alValue
			'read the values after setting them
			arrRunTimeValues(intCounter) = bfield.getroproperty("value")
		Case "Check box", "Checkbox List" , "Check Box List" , "Check Box"
			bfield.Click
			'read the values after setting them
			arrRunTimeValues(intCounter) = bfield.getroproperty("innertext")	
			LogMessage "RSLT","Verification","Values set as "&arrRunTimeValues(intCounter) ,True						
		Case ("Date Type")
			strDateValidation = GetValidation()
			call selectdate(strDateValidation)
			
		Case ("Address")
			'set the address to "Residence Address" from drop down
			strAddressValue = "Residence Address"
			arrRunTimeValues(intCounter) = "Residence Address"
			If not (selectItem_Combobox(bfield,strAddressValue))Then
				   LogMessage "WARN","Verification","Failed to select :"&Value&" From "&FieldValue&" down list",false
				End If
			WaitForIcallLoading
			'read the values after setting them
			arrRunTimeValues(intCounter) = bfield.getroproperty("value")
			LogMessage "RSLT","Verification","Values set as "&arrRunTimeValues(intCounter) ,True			
		Case ("Time Type")
			Call SelectDateTime()
		Case("Radio Button")
			bfield.Click
			arrRunTimeValues(intCounter) = bfield.getroproperty("innertext")
			LogMessage "RSLT","Verification","Values set as "&arrRunTimeValues(intCounter) ,True			
		
	End Select	
End Function

'***************** Get the alpha values to be entered
Public Function extractAlphaValues()
	strFullValue = "alphabetsalphabetsalphabetsalphabetsalphabetsalphabets"
	'if the numMaxLt is numeric
	if IsNumeric(numMaxLt) then
		alValue = Mid(strFullValue,1,numMaxLt)
		LogMessage "RSLT","Verification","Values set as "&alValue ,True
	else
		alValue = "Alpha"
		LogMessage "RSLT","Verification","Values set as "&alValue ,True
	End if	
	extractAlphaValues = alValue	
End Function

'***************** Get the alphanumeric values to be entered
Public Function extractAlNumericValues()
	strFullValue = "12alphanumericValues1212alphanumericValues1212alphanumericValues1212alphanumericValues1212alphanumericValues1212alphanumericValues1212alphanumericValues1212alphanumericValues1212alphanumericValues1212alphanumericValues1212alphanumericValues212alphan2"
	'if the numMaxLt is numeric
	if IsNumeric(numMaxLt) then
		alNumValue = Mid(strFullValue,1,numMaxLt)
		LogMessage "RSLT","Verification","Values set as "&alNumValue ,True
	else
		alNumValue = "1AlNum3"
		LogMessage "RSLT","Verification","Values set as "&alNumValue ,True
	End if	
	extractAlNumericValues = alNumValue
End Function
'**************** Get the numeric values to be entered
Public Function extractNumericValues()
	strFullValue = "123456789101234567890123456789101234567890123456789"
	print numMaxLt
	'if the numMaxLt is numeric
	if IsNumeric(numMaxLt) then
		numValue = Mid(strFullValue,1,numMaxLt)
		LogMessage "RSLT","Verification","Values set as "&numValue ,True
	else
		numValue = "123"
		LogMessage "RSLT","Verification","Values set as "&numValue ,True
	End if	
	extractNumericValues = numValue
End Function

'[Click on Submit button on Capture Source Screen]
Public Function clickSubmit_CaptureSource(strComment) 
	'Insert comment into the datastore
	strTimeStamp = ""&now
	strComment =strComment &" "&strTimeStamp
	gstrRuntimeCommentStep="Click on Submit button on Capture Source Screen"
	insertDataStore "SRComment", strComment
	
	ServiceRequest.clickSubmit()   
   If Err.Number<>0 Then
       clickSubmit_CaptureSource=false
            LogMessage "WARN","Verification","Failed to Click Button : Submit" ,false
       Exit Function
   End If
clickSubmit_CaptureSource=true   
End Function

'[Navigate to Capture at Source Page]
	Public Function NavigateToCS()
		Browser("Browser_iCall_Home").Page("iCall_CustomerOverviewPage").WebElement("C @ S").Click		
		If Err.Number<>0 Then
	       LogMessage "WARN","Verification","Failed to Click Link  : C@S" ,false
	       Exit Function
		End If
		Wait 1
		WaitForIcallLoading
	End Function

'[Verify Field Status_RequestSubmitted on Request Submit popup displayed as]
Public Function verifyStatus_CaptureSource()
	waitForIcallLoading
	bverifyStatus_CaptureSource=true		
	if not Browser("Browser_iCall_Home").Page("iCall_ServiceRequest").WebElement("Status").GetROProperty("innertext") = "In Progress" Then
		bverifyStatus_CaptureSource = false
	End If
   verifyStatus_CaptureSource=bverifyStatus_CaptureSource
End Function

'************* To check if the pop up exists
Public Function verifyPopUp_CaptureSource()
	bverifyPopUp_CaptureSource = True
	If not Browser("Browser_iCall_Home").Page("iCall_ServiceRequest").WebElement("PopUpRqst").Exist Then
		bverifyPopUp_CaptureSource = false
	End If
	verifyPopUp_CaptureSource = bverifyPopUp_CaptureSource
End Function

'[Click on Close button on Capture Source Screen]
Public Function clickClose_CaptureSource()
	ServiceRequest.btnClose_Popup().click   
   If Err.Number<>0 Then
       clickClose_CaptureSource=false
            LogMessage "WARN","Verification","Failed to Click Button : Close" ,false
       Exit Function
   End If
clickClose_CaptureSource=true   
End Function

'************** Field mapping need to change
'[Verify Field TM Approval Message displayed on Captur Source as]
Public Function verifyTMApprovalMessage_CaptureSource()
   WaitForIcallLoading
   bDevPending=False
   bverifyTMApprovalMessage_CaptureSource=true
   strMsg = "The request has been routed to Team Manager for Approval."
   If Not VerifyInnerText (ServiceRequest.lblValidationMessageTM(), strMsg, "Validation Message")Then
       bverifyTMApprovalMessage_CaptureSource=false
   End If
   ServiceRequest.btnOK().Click
   WaitForIcallLoading
   verifyTMApprovalMessage_CaptureSource=bverifyTMApprovalMessage_CaptureSource
End Function

'[Set TextBox Comment on Capture Spource to]
Public Function setCommentTextbox_CaptureSource()
   bDevPending=False
   strTimeStamp = ""&now
	strComment =strRunTimeComment &" "&strTimeStamp
	gstrRuntimeCommentStep="Set TextBox Comment on Capture Spource to"
	'insertDataStore "SRComment", strComment
	
   ServiceRequest.txtComment.Set(strComment)
   If Err.Number<>0 Then
       setCommentTextbox_CaptureSource=false
            LogMessage "WARN","Verification","Failed to Set Text Box :Comment" ,false
       Exit Function
   End If
   setCommentTextbox_CaptureSource=true
End Function

'[Select Pending Approval SR from TM home Page for Capture Source]
Public Function selectPendingSR_TMHome_CS(strCSO,strType,strCreatedOn)
 	bDevPending=false
   Dim bSelectPendingSR:bSelectPendingSR=true
	selectShowComboBox("Service Requests")
	'selectTypeRadio("Pending Approval")
	'selectCSOComboBox(strCSO)
	ServiceRequest.txtCSOCS().Set strCSO
	setFromTextbox("TODAY")
	setToTextbox("TODAY")
	clickButtonFilter
	WaitForIcallLoading
	Dim lstSRActivityData
	If not isnull(strCreatedOn) Then
		If strCreatedOn="SR CREATED ON" Then
			'strComment=fetchFromDataStore(gstrRuntimeCommentStep,"BLANK","SRComment")(d)
			strQuery_CreatedOn="Select to_char(createdOn) from cca_tmapproval_sr where SRTYPE ='"&strType&"' order by createdon desc"
			'strTST=getDBValForColumn_CC(strQuery_CreatedOn)(0)
			strTST=getDBValForColumn_FE(strQuery_CreatedOn)(0)
			'strTST=getDBValForColumn_UAT(strQuery_CreatedOn)(0)					
			strTempDate=Left(strTST,15)
			strTime=FormatDateTime(Left(strTST,15) &" "&Right(strTST,2),4)
			strTime=Replace(strTime,":",".?")
			If len(Day(CDate(strTempDate)))=1 Then
			
				strDay="0"&Day(CDate(strTempDate))
			else
				strDay=""&Day(CDate(strTempDate))
			End If
			strCreatedDatePattern=""&strDay & " "&monthName(Month(CDate(strTempDate)),true) &" " &Year(CDate(strTempDate))&" " &strTime
			'insertDataStore "CreatedOn", strCreatedDatePattern
		End If
		ReDim lstSRActivityData(1)
		lstSRActivityData(0)="Type:"&strType
		'lstSRActivityData(1)="Account / Card No.:"&strAccount
		lstSRActivityData(1)="Created Date:"&strCreatedDatePattern
	else
		ReDim lstSRActivityData(0)
		lstSRActivityData(0)="Type:"&strType
		'lstSRActivityData(1)="Account / Card No.:"&strAccount
		
    End If
	bSelectPendingSR=clickType_SR_Activity_RecordsCS(lstSRActivityData)
	WaitForICallLoading
	selectPendingSR_TMHome_CS=bSelectPendingSR
End Function

'[Click Type link in Table SR_Activity Records form Home Page for Capture Source]
Public Function clickType_SR_Activity_RecordsCS(lstSRActivityData)
   bDevPending=false
   With CSO_TM_Home
	   clickType_SR_Activity_RecordsCS=selectTableLink(.tblSRActivityHeader,.tblSRActivityContent,lstSRActivityData,"SRActivityRecords" ,"Type",true,.lnkNext,.lnkNext1,.lnkPrevious)
   End With
End Function

Public Function GetContentsFromDB(strFileName, strSQLStatement,Byref objAdRs) 
	
		Dim bjAdRs
		Set objAdCon = CreateObject("ADODB.Connection")
		'objAdCon.Open "DRIVER={Microsoft Excel Driver (*.xls)};DBQ="&strFileName & ";Readonly=True"
		objAdCon.Open "Driver={Microsoft Excel Driver (*.xls, *.xlsx, *.xlsm, *.xlsb)};DBQ="& strFileName &"; ReadOnly=True;"
		If Err <> 0 Then
		      Reporter.ReportEvent micFail,"Create Connection", "[Connection] Error has occured. Error : " & Err
		      Set obj_UDF_getRecordset = Nothing
		   Exit Function
		End If
		'Set objAdRs = CreateObject("ADODB.Recordset")
		objAdRs.CursorLocation=3                        
		objAdRs.Open strSQLStatement, objAdCon, 1, 3		
		
		If Err<>0 Then
		      Reporter.ReportEvent micFail,"Open Recordset", "Error has occured.Error Code : " & Err
		      Set obj_UDF_getRecordset = Nothing
		     Exit Function
		End If 		
		Set objAdRs.ActiveConnection = Nothing 		
		objAdCon.Close
		Set objAdCon = Nothing
	End Function
	
	Public Function FieldExistStatus(status)	
	Dim cn
	'Create connection to Excel  sheet
	Set cn = CreateObject("ADODB.Connection")
	 '.ConnectionString = "Data Source="&WorkBook&";"  & _
		 ConnectionString = "Data Source=D:\iserve_testing\Automation\Feature\Release1603_TestSuite\CaptureAtSource\CS_SR_Template.xlsx;Extended Properties='Excel 12.0 xml;'"
	With cn
'	    .Provider = "Microsoft.Jet.OLEDB.4.0"
'	    .ConnectionString = "D:\iserve_testing\Automation\Feature\Release1603_TestSuite\CaptureAtSource\CS_SR_Template.xlsx;" & _
'	    "Extended Properties=Excel 4.0;"
'	    .Open
	    .Provider = "Microsoft.ACE.OLEDB.12.0;Data Source=D:\iserve_testing\Automation\Feature\Release1603_TestSuite\CaptureAtSource\CS_SR_Template.xlsx;Extended Properties=""Excel 12.0 Xml;HDR=YES"""
	    .Open
	End With
	
	Set objRs = CreateObject("ADODB.recordset")
	cn.Execute("Update [SR_Field_Required$] set Result = '"&status&"' where SR_Ref='"&strFieldAttributes&"' and Field_Name = '"&FieldValue&"'")
	Print "The field exists or not is updated in the excel sheet - " &status&" .. "
	 
	'cn.Close
	Set cn = Nothing
	Set objRs.ActiveConnection = Nothing 	
	
	End Function
	
	'Public Function FlagStatus(strRunTimeRelatedTo, strRunTimeType, strRunTimeSubType)
	Public Function FlagStatus()
		strRunTimeRelatedTo = "Asia Treasures"
		strRunTimeType = "Card Replacement"
		strRunTimeSubType = "Membership Card"
		WorkBook = "C:\Users\sunilpaudel\Documents\Automation\C@S\test.xlsx"
		Set rsRecord = CreateObject("ADODB.Recordset")
		call GetContentsFromDB(WorkBook, "Select Flag from [SR_Field_Required$] where Related_To='"&strRunTimeRelatedTo&"' and Type = '"&strRunTimeType&"' and Sub_Type = '"&strRunTimeSubType&"'",rsRecord)
		flagStatus = rsRecord.Fields(0).Value
		msgbox (flagStatus)				
	End Function
	
'[Select date from Calendar Picker from Service Request page]
Public Function selectdate(strDate)
	'condition for the date
	Set oDesc=Description.Create    
    oDesc("xpath").Value="//*[@id='"&FieldValue&"']/DIV[1]/MD-ICON[1]"
    set objCalendar = Browser("Browser_iCall_Home").Page("iCall_ServiceRequest").ChildObjects(oDesc)
    'objCalendar(0).click
   	Select Case (strDate)
   		Case "<= Today date", "< today's date", "DD/MM/YYYYY format   <= Today date", "DD/MM/YYYYY format<= Today date"
   			strDate = "14 Dec 2014"
   		Case "> Today's date", ">= Today's date"
   			strDate = "14 Dec 2018"
   		Case Else
   			strDate = "14 Dec 2012"
   	End Select
   	'read the values after setting them
	arrRunTimeValues(intCounter) = strDate
	LogMessage "RSLT","Verification","Values set as "&arrRunTimeValues(intCounter) ,True			
	selectdate=selectDateFromCalendar(objCalendar(0),strDate)
End Function

'********** Function to select the date and time both
Public Function SelectDateTime()
	'Select today's date and time
	strDtForCal = Day(CDate(Now))&" "&monthName(Month(CDate(Now)),true) &" " &Year(CDate(Now))
	If len(Day(CDate(Now)))=1 Then
		strDay="0"&Day(CDate(Now))
	else
		strDay=""&Day(CDate(Now))
	End If
			
	strDate = strDay&" "&monthName(Month(CDate(Now)),true) &" " &Year(CDate(Now))
	strMin = Minute(cdate(now))
	If (len(strMin)=1) Then
		strMin = "0"&strMin
	End If
	strDateTime = strDate &" " &Hour(cdate(now)) &":"&strMin
	
	'set the value into an array
	arrRunTimeValues(intCounter) = strDateTime
	LogMessage "RSLT","Verification","Values set as "&arrRunTimeValues(intCounter) ,True			
	
	'Click on the calender
	Set oDesc=Description.Create    
    oDesc("xpath").Value="//*[@id='"&FieldValue&"']/DIV[1]/MD-ICON[1]"
    set objCalendar = Browser("Browser_iCall_Home").Page("iCall_ServiceRequest").ChildObjects(oDesc)
	SelectDateTime = selectDateFromCalendar(objCalendar(0),strDtForCal)
End Function

'[Select the Followup Required in SR Page]
Public Function selectFollowupRequired(strRqd)
	selectFollowupRequired = true
	ServiceRequest.txtFollowupRequired.Set strRqd
	If err.number <> 0 Then
		'Error occurred
		LogMessage "WARN","Verification","Not able to Set the Followup Required. " ,False
		selectFollowupRequired = false
	End If
End Function

'[Select Manager Approval in SR Page as]
Public Function selectManagerApproval(strTMApproval)
	selectManagerApproval = true
	ServiceRequest.txtManagerApproval.Set strTMApproval
	If err.number <> 0 Then
		'Error occurred
		LogMessage "WARN","Verification","Not able to Set the Manager Approval. " ,False
		selectManagerApproval = false
	End If
End Function

'[Select Account Number in SR Page as]
Public Function selectAccountNumber(strAcctNo)
	selectAccountNumber = true
	ServiceRequest.txtAccountNumber.Set strAcctNo
	If err.number <> 0 Then
		'Error occurred
		LogMessage "WARN","Verification","Not able to Set the Account Number. " ,False
		selectAccountNumber = false
	End If
End Function

'[Select Credit Card Number in SR Page as]
Public Function selectCreditCardNumber(strCreditCardNo)
	selectCreditCardNumber = true
	ServiceRequest.txtCreditCardNo.Set strCreditCardNo
	If err.number <> 0 Then
		'Error occurred
		LogMessage "WARN","Verification","Not able to Set the Credit Card Number. " ,False
		selectCreditCardNumber = false
	End If
End Function

'[Select ATM Cash Withdrawal Limit as]
Public Function selectATMCashWthdLmt(strLimit)
	selectATMCashWthdLmt = true
	ServiceRequest.txtATMCashLmt.Set strLimit
	If err.number <> 0 Then
		'Error occurred
		LogMessage "WARN","Verification","Not able to Set the ATM Cash Withdrawal Limit. " ,False
		selectCreditCardNumber = false
	End If
End Function

'[Select Purpose of Waiver in SR Page as]
Public Function selectPurposeOfWaiver(strPurposeOfWaiver)
	selectPurposeOfWaiver = true
	ServiceRequest.txtPurposeOfWaiver.Set strPurposeOfWaiver
	If err.number <> 0 Then
		'Error occurred
		LogMessage "WARN","Verification","Not able to Set the Purpose of Waiver. " ,False
		selectPurposeOfWaiver = false
	End If
End Function

'[Select Account Number of the dynamic field of SR Page as]
Public Function selectAcctNumberDynamicField(strAcctNo)
	selectAcctNumberDynamicField = true
	ServiceRequest.txtAcctNoDynamicField.Set strAcctNo
	If err.number <> 0 Then
		'Error occurred
		LogMessage "WARN","Verification","Not able to Set the Acct No of Dynamic Field. " ,False
		selectAcctNumberDynamicField = false
	End If
End Function

'[Select Amount in the SR Page as]
Public Function selectAmount(strAmt)
	selectAmount = true
	ServiceRequest.txtAmount.Set strAmt
	If err.number <> 0 Then
		'Error occurred
		LogMessage "WARN","Verification","Not able to Set the Amount. " ,False
		selectAmount = false
	End If
End Function

'[Verify Case Number displayed as]
Public Function verifyCaseNumber(strCaseNoExists)
	verifyCaseNumber = true
	If strCaseNoExists Then
		'Check if the Case Number exists
		strActualCaseNo = ViewSR.lblCaseNumber().GetRoProperty("innertext")
		If not isnull(strActualCaseNo) Then
			LogMessage "RSLT", "Verification", "Case Number exists: "&strActualCaseNo, True   
		else
			LogMessage "WARN","Verification","Case Number does not exist." ,false
		End If
	End If
End Function

'[Verify Additional SR Info of IWF Assigned Triplet displayed as]
Public Function verifyAdditionalSR_IWF(strCCNo, strWthdLmt)
	verifyAdditionalSR_IWF = true
	strActualCCNo = ViewSR.lblAdditionalSR_CCNo().GetRoProperty("innertext")
	If (strCCNo = strActualCCNo) Then
		LogMessage "RSLT", "Verification", "Additional SR Info Credit Card Number matches. Expected: "&strCCNo& " Actual: "&strActualCCNo, True 
	End If
	strActualWthdLmt = ViewSR.lblAdditionalSR_CashWthdLmt().GetRoProperty("innertext")
	If (strWthdLmt = strActualWthdLmt) Then
		LogMessage "RSLT", "Verification", "Additional SR Info New Daily ATM Cash Withdrawal Limit (S$) matches. Expected: "&strWthdLmt& " Actual: "&strActualWthdLmt, True 
	End If
	
End Function

'[Verify Additional SR Info of CRM Assigned Triplet displayed as]
Public Function verifyAdditionalSR_CRM(strPurposeOfWaiver, strAcctNumber, strAmt)
	verifyAdditionalSR_IWF = true
	strActualPurposeOfWaiver = ViewSR.lblAdditionalSR_PurposeOfWaiver().GetRoProperty("innertext")
	If (strPurposeOfWaiver = strActualPurposeOfWaiver) Then
		LogMessage "RSLT", "Verification", "Additional SR Info Purpose of Waiver. Expected: "&strPurposeOfWaiver& " Actual: "&strActualPurposeOfWaiver, True 
	End If
	strActualAcctNo = ViewSR.lblAdditionalSR_AcctNo().GetRoProperty("innertext")
	If (strAcctNumber = strActualAcctNo) Then
		LogMessage "RSLT", "Verification", "Additional SR Info Account Number matches. Expected: "&strAcctNumber& " Actual: "&strActualAcctNo, True 
	End If
	strActualAmt = ViewSR.lblAdditionalSR_Amt().GetRoProperty("innertext")
	If (strAmt = strActualAmt) Then
		LogMessage "RSLT", "Verification", "Additional SR Info Amount matches. Expected: "&strAmt& " Actual: "&strActualAmt, True 
	End If
	
End Function

'[Verify the visibility of the field in SR Page]
Public Function verifyFieldVisibility(strDisabled)
	verifyFieldVisibility = true
	if instr(ServiceRequest.lstAssignTo().GetRoProperty("class"),"disabled-area") <> 0 then
		'the field is disabled
		If strDisabled = "True" Then
			LogMessage "RSLT", "Verification", "Field is disabled as expected.", True 
		else
			LogMessage "RSLT", "Verification", "Field is disabled but was expected to be enabled.", False 
		End If
	else
		'the field is enabled
		If strDisabled = "False" Then
			LogMessage "RSLT", "Verification", "Field is enabled as expected.", True 
		else
			LogMessage "RSLT", "Verification", "Field is enabled but was expected to be disabled.", False 
		End If
	End if
End Function

'[Verify SR Number exists in New IA Page]
Public Function verifySRNumberNewIAPage()
	verifySRNumberNewIAPage = true
	strActualSRNo = bcActivities.lblServiceRequestNo().GetRoProperty("innertext")
	If strExpectedSRNo = strActualSRNo Then
		'SR Number matches
		LogMessage "RSLT", "Verification", "SR Number matches. Actual: "&strActualSRNo& " Expected: " &strExpectedSRNo, True 
	else
		LogMessage "WARN", "Verification", "SR Number does not match. Actual: "&strActualSRNo& " Expected: " &strExpectedSRNo, False 
	End If
End Function

'[Verify the CSO displayed in CSO Home Page as]
Public Function verifyCSO_CSOHomePage(lstCombo)
	verifyCSO_CSOHomePage = verifyComboList(lstCombo, CSO_TM_Home.txtCSO())
End Function

'[Set TextBox Testing Field on Capture Spource to]
Public Function setTestFieldTextbox_CaptureSource(strTestField)
   bDevPending=False
   ServiceRequest.txtTestingField.Set(strTestField)
   If Err.Number<>0 Then
       setTestFieldTextbox_CaptureSource=false
            LogMessage "WARN","Verification","Failed to Set Text Box :Testing Field" ,false
       Exit Function
   End If
   setTestFieldTextbox_CaptureSource=true
End Function
