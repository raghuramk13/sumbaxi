'*****This is auto generated code using code generator please Re-validate ****************
Dim prospectID
prospectID = ""

'[Verify row Data in Table for Prospects with pagination]
Public Function verifytblSelectedContent_Prospects(arrRowDataList)
   bDevPending=false 
	   verifytblSelectedContent_Prospects=verifyTableContentList(Prospects.tblProspectsHeader,Prospects.tblProspectsContent,arrRowDataList,"SelectedProspectsContent",true,Prospects.lnkNext,Prospects.lnkNext1,Prospects.lnkPrevious)
End Function

'[Verify row Data in Table for Prospects without pagination]
Public Function verifytblSelectedContent_Prospects1(arrRowDataList)
   bDevPending=false 
   verifytblSelectedContent_Prospects1=verifyTableContentList(Prospects.tblProspectsHeader,Prospects.tblProspectsContent,arrRowDataList,"SelectedProspectsContent",false,NULL,NULL,NULL)
End Function

'[Verify SR radio button  is default selected]
Public Function verifyRbntSR_Enable()
	bverifyRbntSR_Enable=true	
	intRbtnSR =InStr(Prospects.rbtnProspectsSR.GetROProperty("class"),"aria-checked")
	If not intRbtnSR=1 Then
		LogMessage "RSLT","Verification","SR radio button is selected as expected.",True
		bverifyRbntSR_Enable=true
	Else
		LogMessage "WARN","Verifiation","SR radio button not selected.",false
		bverifyRbntSR_Enable=false
	End If
	verifyRbntSR_Enable=bverifyRbntSR_Enable
End Function

'[Verify AddSR button  is enabled]
Public Function verifyAddSRbtn_Enable()
	bverifyAddSRbtn_Enable=true	
	intbtnAddSR =InStr(Prospects.btnAddSR.GetROProperty("class"),"aria-disabled")
	If not intbtnAddSR=0 Then
		LogMessage "RSLT","Verification","AddSR button is enabled as expected.",True
		bverifyAddSRbtn_Enable=true
	Else
		LogMessage "WARN","Verifiation","AddSR button is disabled. Expected enabled.",false
		bverifyAddSRbtn_Enable=false
	End If
	verifyAddSRbtn_Enable=bverifyAddSRbtn_Enable
End Function

'[Click Button AddSR on Prospects Home Page]
Public Function clickButtonAddSRProspects()
   bDevPending=true
   Prospects.btnAddSR.click
   WaitForICallLoading
   If Err.Number<>0 Then
       clickButtonAddSRProspects=false
            LogMessage "WARN","Verification","Failed to Click Button : AddSR from Prospects" ,false
       Exit Function
   End If
   WaitForICallLoading
   clickButtonAddSRProspects=true
End Function

'[Verify AddIA button  is enabled]
Public Function verifyAddIAbtn_Enable()
	bverifyAddIAbtn_Enable=true	
	intbtnAddIA =InStr(Prospects.btnAddIA.GetROProperty("disabled"),"0")
	If not intbtnAddIA=0 Then
		LogMessage "RSLT","Verification","AddIA button is enabled as expected.",True
		bverifyAddIAbtn_Enable=true
	Else
		LogMessage "WARN","Verifiation","AddIA button is disabled. Expected enabled.",false
		bverifyAddIAbtn_Enable=false
	End If
	verifyAddIAbtn_Enable=bverifyAddIAbtn_Enable
End Function

'[Click Button AddIA on Prospects Home Page]
Public Function clickButtonAddIAProspects()
   bDevPending=true
   Prospects.btnAddIA.click
   WaitForICallLoading
   If Err.Number<>0 Then
       clickButtonAddIAProspects=false
            LogMessage "WARN","Verification","Failed to Click Button : AddIA from Prospects" ,false
       Exit Function
   End If
   clickButtonAddIAProspects=true
End Function

'[Verify AddOppurtunity button  is disabled]
Public Function verifyAddOprtuntybtn_Enable()
	bverifyAddOprtuntybtn_Enable=true	
	intbtnAddOprtunty =InStr(Prospects.btnAddOpportunity.GetROProperty("outerhtml"),"disableOppButton")
	If not intbtnAddOprtunty=0 Then
		LogMessage "RSLT","Verification","AddOppurtunity button is disabled as expected.",True
		bverifyAddOprtuntybtn_Enable=true
	Else
		LogMessage "WARN","Verifiation","AddOppurtunity button is enabled. Expected disabled.",false
		bverifyAddOprtuntybtn_Enable=false
	End If
	verifyAddOprtuntybtn_Enable=bverifyAddOprtuntybtn_Enable
End Function

'[Verify txt NRIC for Prospects]
Public Function verifyNRICText(strNRICText)
	bverifyNRICText=true
	If Not verifyFieldValue(Prospects.txtNRIC(), strNRICText, "Prospects NRIC Text") Then
		bverifyNRICText=false
	End If
	verifyNRICText=bverifyNRICText
End Function

'[Verify txt Mobile for Prospects]
Public Function verifyMobileText(strMobileText)
	bverifyMobileText=true
	If Not verifyFieldValue(Prospects.txtMobile(), strMobileText, "Prospects Mobile Text") Then
		bverifyNRICText=false
	End If
	verifyNRICText=bverifyNRICText
End Function

'[Verify txt EmailID for Prospects]
Public Function verifyEmailIDText(strEmailIDText)
	bverifyEmailIDText=true
	If Not verifyFieldValue(Prospects.txtEmailID(), strEmailIDText, "Prospects EmailID Text") Then
		bverifyEmailIDText=false
	End If
	verifyEmailIDText=bverifyEmailIDText
End Function

'[Verify txt FirstName for Prospects]
Public Function verifyFirstNameText(strFirstNameText)
	bverifyFirstNameText=true
	If Not verifyFieldValue(Prospects.txtFirstName(), strFirstNameText, "Prospects FirstName Text") Then
		bverifyFirstNameText=false
	End If
	verifyFirstNameText=bverifyFirstNameText
End Function

'[Verify txt LastName for Prospects]
Public Function verifyLastNameText(strLastNameText)
	bverifyLastNameText=true
	If Not verifyFieldValue(Prospects.txtLastName(), strLastNameText, "Prospects LastName Text") Then
		bverifyLastNameText=false
	End If
	verifyLastNameText=bverifyLastNameText
End Function

'[Set text on NRIC textfield for Prospects]
Public Function setNRIC_Prospects(strNRICTxt)
	bsetNRIC_Prospects=true
	If Not IsNull(strNRICTxt) Then
		Prospects.txtNRIC().set strNRICTxt
	End If
	WaitForICallLoading
	setNRIC_Prospects=bsetNRIC_Prospects
End Function

'[Set text on Mobile textfield for Prospects]
Public Function setMobile_Prospects(strMobileTxt)
	bsetMobile_Prospects=true
	If Not IsNull(strMobileTxt) Then
		Prospects.txtMobile().set strMobileTxt
	End If
	WaitForICallLoading
	setMobile_Prospects=bsetMobile_Prospects
End Function

'[Set text on EmailID textfield for Prospects]
Public Function setEmailID_Prospects(strEmailIDTxt)
	bsetEmailID_Prospects=true
	If Not IsNull(strEmailIDTxt) Then
		Prospects.txtEmailID().set strEmailIDTxt
	End If
	WaitForICallLoading
	setEmailID_Prospects=bsetEmailID_Prospects
End Function

'[Set text on FirstName textfield for Prospects]
Public Function setFirstName_Prospects(strFirstNameTxt)
	bsetFirstName_Prospects=true
	If Not IsNull(strFirstNameTxt) Then
		Prospects.txtFirstName().set strFirstNameTxt
	End If
	WaitForICallLoading
	setFirstName_Prospects=bsetFirstName_Prospects
End Function

'[Set text on LastName textfield for Prospects]
Public Function setLastName_Prospects(strLastNameTxt)
	bsetLastName_Prospects=true
	If Not IsNull(strLastNameTxt) Then
		Prospects.txtLastName().set strLastNameTxt
	End If
	WaitForICallLoading
	setLastName_Prospects=bsetLastName_Prospects
End Function

''[Set text on DOB textfield for New IA Prospects]
'Public Function setDOB_IAProspects(strDOB)
'	bsetDOB_IAProspects=true
'	If Not IsNull(strDOB) Then
'		Activities.txtProspectsDateofBirth().set strDOB
'	End If
'	WaitForICallLoading
'	setDOB_IAProspects=bsetDOB_IAProspects
'End Function
'

'[Select Radio Button Type for Prospects]
Public Function selectTypeRadioProspects(strType)
	bDevPending=False
	bselectTypeRadioProspects=true
	bselectTypeRadioProspects=SelectRadioButtonGrp(strType, Prospects.rbtnProspectsType, Array("SR","IA","Opportunity"))
   WaitForICallLoading
	If Err.Number<>0 Then
       selectTypeRadioProspects=false
          LogMessage "WARN","Verification","Failed to click radio button : Type on Prospects" ,false
       Exit Function
   End If
   selectTypeRadioProspects=bselectTypeRadioProspects
End Function

'[Click on Type hyperlink on Prospects Page]
Public Function viewProspectDetails(lstProspectDetails)
          Dim bviewProspectDetails:	viewProspectDetails = True
          bviewProspectDetails=selectTableLink(Prospects.tblProspectsHeader,Prospects.tblProspectsContent,lstProspectDetails,"Prospects" ,"Type",false,null ,null ,null)
          WaitForICallLoading
		  viewProspectDetails=bviewProspectDetails
End Function

'[Click ProspectId hyperlink on Prospects page1]
Public Function viewProspectDetails1(strRelatedTo, strType, strSubtype, strComments, strCreatedBy)
          Dim bviewProspectDetails1:	viewProspectDetails1 = True
          'msgbox strDueDateComments
          strCreatedByLcase=LCase(strCreatedBy)
          'strDueDateTime=strDueDateComments
          
         'strcomments01= DateAdd("h", -1, strcomments01)
         'strtime=TimeValue(strcomments01)
         'StrDateTimefrmat01=FromatDateTime(strtime, 4)
         'strMonth=Month(strDueDateTime)
         'strYear=Year(strDueDateTime)
         'strDay=Day(strDueDateTime)
         'strHour=Hour(strDueDateTime)-1
         'If strHour=-1 Then
         '	strHour=23
         'End If
         'strMin=Minute(strDueDateTime)
         'strMonthName=MonthName(strMonth, True)
         
         strMonth=Month(strSubmitTime)
         strYear=Year(strSubmitTime)
         strDay=Day(strSubmitTime)
         If strDay>=0 and strDay<10 Then
         	strDay=0&strDay
         End If
         strHour=Hour(strSubmitTime)
         'If strHour=-1 Then
         '	strHour=23
         'End If
         If strHour>=0 and strHour<10 Then
         	strHour=0&strHour
         End If
         strMin=Minute(strSubmitTime)
         If strMin>=0 and strMin<10 Then
         	strMin=0&strMin
         End If
         strMonthName=MonthName(strMonth, True)
         
          'DateSub
         lstProspectDetails = checknull("Type:"&strType&"|SubType:"&strSubtype&"|Related To:"&strRelatedTo&"|Comments:Created by "&strCreatedByLcase&" Date and Time "&strDay&" "&strMonthName&" "&strYear&" "&strHour&""&strMin&" "&strComments&"")
         'lstProspectDetails = checknull("Type:"&strType&"|Comments:Created by "&strCreatedByLcase&" Date and Time "&strDay&" "&strMonthName&" "&strYear&" "&strHour&""&strMin&" "&strComments&"")
          bviewProspectDetails1=selectTableLink(Prospects.tblProspectsHeader,Prospects.tblProspectsContent,lstProspectDetails,"Prospects" ,"Type",true,Prospects.lnkNext,Prospects.lnkNext1,Prospects.lnkPrevious)
          WaitForICallLoading
		  viewProspectDetails1=bviewProspectDetails1
End Function

'[Verify error message display for NRIC]
Public Function verifyErrorMessage_NRIC(strErrorMessage)
bverifyErrorMessage_NRIC = true
	If Not IsNull(strErrorMessage) Then
 		If Not VerifyInnerText (Prospects.lblErrMsg_NRIC(), strErrorMessage, "NRIC")Then
			   bverifyErrorMessage_NRIC = false
		End If
	End If
	verifyErrorMessage_NRIC = bverifyErrorMessage_NRIC
End Function

'[Verify error message display for Mobile]
Public Function verifyErrorMessage_Mobile(strErrorMessage)
bverifyErrorMessage_Mobile = true
	If Not IsNull(strErrorMessage) Then
 		If Not VerifyInnerText (Prospects.lblErrMsg_Mobile(), strErrorMessage, "Mobile")Then
			   bverifyErrorMessage_Mobile = false
		End If
	End If
	verifyErrorMessage_Mobile = bverifyErrorMessage_Mobile
End Function

'[Verify error message display for Email]
Public Function verifyErrorMessage_Email(strErrorMessage)
bverifyErrorMessage_Email = true
	If Not IsNull(strErrorMessage) Then
 		If Not VerifyInnerText (Prospects.lblErrMsg_Email(), strErrorMessage, "Email")Then
			   bverifyErrorMessage_Email = false
		End If
	End If
	verifyErrorMessage_Email = bverifyErrorMessage_Email
End Function

'[Verify Prospects table records displayed based on Search Criteria]
Public Function Verifytablerecords_Prospects(strCIN)
   bVerifytablerecords_Prospects = True
   intProsctectsRecordCount = getRecordsCountForColumn(Prospects.tblProspectsHeader,Prospects.tblProspectsContent,"Prospect ID")	
   For i = 0 To intProsctectsRecordCount - 1
		Set objAllRows=getAllRows(Prospects.tblProspectsContent)
		strTableCIN=getCellTextFor(Prospects.tblProspectsHeader,objAllRows(i),i,"CIN")
		If Not IsNull (strCIN) Then
			If Ucase(Trim(strTableCIN)) =  Ucase(Trim(strCIN))Then
			LogMessage "RSLT","Verification","CIN in table displayed based on the searched CIN",True
			Else
			LogMessage "WARN","Verification","CIN in table not displayed based on the searched CIN",False
				bVerifytablerecords_Prospects = False
			End IF 			
		End If
		Next 
	Verifytablerecords_Prospects=bVerifytablerecords_Prospects
 End Function

  '[Click Button Cancel on Prospects IASR Popup]
Public Function clickButtonCancelProspectsIASR()
   bDevPending=true
   Prospects.btnCancel.click
   If Err.Number<>0 Then
       clickButtonCancelProspectsIASR=false
            LogMessage "WARN","Verification","Failed to Click Button : Cancel from Prospects" ,false
       Exit Function
   End If
   clickButtonCancelProspectsIASR=true
End Function

'[Verify Audit Trial ]
Public Function verifyErrorMessage_Email(strErrorMessage)
bverifyErrorMessage_Email = true
	If Not IsNull(strErrorMessage) Then
 		If Not VerifyInnerText (Prospects.lblErrMsg_Email(), strErrorMessage, "Email")Then
			   bverifyErrorMessage_Email = false
		End If
	End If
	verifyErrorMessage_Email = bverifyErrorMessage_Email
End Function
'[Verify NewIA button  is enabled]
Public Function verifyNewIAbtn_Enable()
	bverifyNewIAbtn_Enable=true	
	intbtnNewAddIA =Prospects.btnNewIA().GetROProperty("disabled")
	If intbtnNewAddIA=0 Then
		LogMessage "RSLT","Verification","NewIA button is enabled as expected.",True
		bverifyNewIAbtn_Enable=true
	Else
		LogMessage "WARN","Verifiation","NewIA button is disabled. Expected enabled.",false
		bverifyNewIAbtn_Enable=false
	End If
	verifyNewIAbtn_Enable=bverifyNewIAbtn_Enable
End Function

'********************* Added by Sunil ****************

'[Click on button Filter of CSO Home page for Prospects]
Public Function click_Filter()
	click_Filter = true
	Prospects.btnFilter_Prospect().Click
	waitForIcallLoading
	If Err.Number<>0 Then
       click_Filter = false
            LogMessage "WARN","Verification","Failed to Click Button : Filter" ,false
    else
     	LogMessage "RSLT","Verification","Button clicked successfully: Filter" ,true
   	End If
End Function

'[Verify CreateIA button  is enabled]
Public Function verifyCreateIAbtn_Enable()
	bverifyCreateIAbtn_Enable=true	
	WaitForICallLoading
	intbtnCreateAddIA =Prospects.btnCreateIA().GetROProperty("disabled")
	If intbtnCreateAddIA=0 Then
		LogMessage "RSLT","Verification","CreateIA button is enabled as expected.",True
		bverifyCreateIAbtn_Enable=true
	Else
		LogMessage "WARN","Verifiation","CreateIA button is disabled. Expected enabled.",false
		bverifyCreateIAbtn_Enable=false
	End If
	verifyCreateIAbtn_Enable=bverifyCreateIAbtn_Enable
End Function
'[Verify CreateIA button  is disabled]
Public Function verifyCreateIAbtn_Disable()
	bverifyCreateIAbtn_Disable=true	
	WaitForICallLoading
	intbtnCreateIA =Prospects.btnCreateIA().GetROProperty("disabled")
	If  intbtnCreateIA=1 Then
		LogMessage "RSLT","Verification","CreateIA button is disabled as expected.",True
		bverifyCreateIAbtn_Disable=true
	Else
		LogMessage "WARN","Verifiation","CreateIA button is enabled. Expected disabled.",false
		bverifyCreateIAbtn_Disable=false
	End If
	verifyCreateIAbtn_Disable=bverifyCreateIAbtn_Disable
End Function

'[Click Button CreateIA on Prospects Popup]
Public Function clickButtonCreateIAProspects()
   bDevPending=true
   Prospects.btnCreateIA.click
   If Err.Number<>0 Then
       clickButtonCreateIAProspects=false
            LogMessage "WARN","Verification","Failed to Click Button : CreateIA from Prospects" ,false
       Exit Function
   End If
   clickButtonCreateIAProspects=true
End Function

'[Click on Add SR button of CSO Home Page for Prospects]
Public Function click_AddSR_Prospects()
	click_AddSR_Prospects = true
	Prospects.btnAddSR_Prospect().Click
	If Err.Number<>0 Then
       click_AddSR_Prospects = false
            LogMessage "WARN","Verification","Failed to Click Button : Add SR" ,false
     else
     	LogMessage "RSLT","Verification","Button clicked successfully: Add SR" ,true
   	End If
End Function

'[Click on the Prospect ID of Create SR]
Public Function click_ProspectID_SR()
	click_ProspectID_SR = true
	'Search for the radio group in the content table and click on it
	Set oDesc = Description.Create
	'oDesc("xpath").value = "//*[contains(@id,'pros_popup_radioGroup')]"
	oDesc("xpath").value = "//*[contains(@class,'dt-cell-content')]"
	Set rdBtnCol = Prospects.tblProspects_SRContent().childobjects(oDesc)
	'Get the Prospect ID 
	prospectID = rdBtnCol(6).GetRoProperty("innertext")
	'Now search for the class to click
	Set oRdbtn = Description.Create
	oRdbtn("xpath").value = "//*[contains(@id,'pros_popup_radioGroup')]"
	Set rdBtn = rdBtnCol(0).childObjects(oRdbtn)
	rdBtn(0).click
	If Err.Number<>0 Then
       click_ProspectID_SR = false
            LogMessage "WARN","Verification","Failed to Click the Radio button of the Prospect ID." ,false
     else
     	LogMessage "RSLT","Verification","Radio Button of the Prospect ID clicked successfully." ,true
   	End If
End Function

'[Click on Create SR of Select Prospect ID Popup]
Public Function click_CreateSR_Prospect_Popup()
	click_CreateSR_Prospect_Popup = true
	Prospects.btnCreateSR().Click
	waitForIcallLoading
	If Err.Number<>0 Then
       click_CreateSR_Prospect_Popup = false
            LogMessage "WARN","Verification","Failed to Click the button: Create SR." ,false
     else
     	LogMessage "RSLT","Verification","Button clicked successfully: Create SR." ,true
   	End If
End Function


'[Click Button btnNewProspect IA on Prospects Page]
Public Function clickButtonNewIAProspects()
   bDevPending=true
   Prospects.btnNewIA.click
   If Err.Number<>0 Then
       clickButtonNewIAProspects=false
            LogMessage "WARN","Verification","Failed to Click Button : NewIA from Prospects" ,false
       Exit Function
   End If
   clickButtonNewIAProspects=true
End Function

'[Click on New SR of Select Prospect ID Popup]
Public Function click_NewSR_Prospect_PopUp()
	click_NewSR_Prospect_PopUp = true
	Prospects.btnNewSR().Click
	waitForIcallLoading
	If Err.Number<>0 Then
       click_NewSR_Prospect_PopUp = false
            LogMessage "WARN","Verification","Failed to Click the button: New SR." ,false
     else
     	LogMessage "RSLT","Verification","Button clicked successfully: New SR." ,true
   	End If
	
End Function

'[Verify row Data in Table for popup Prospects]
Public Function verifytblSelectedContent_ProspectsPopUp(arrRowDataList)
   bDevPending=false 
   verifytblSelectedContent_ProspectsPopUp=verifyTableContentList(Prospects.tblProspectIdIAHeader,Prospects.tblProspectIdIAContent,arrRowDataList,"SelectedPopUpProspectsContent",false,NULL,NULL,NULL)
End Function

'[Verify the Prospect ID in SR Page displayed as]
Public Function verifyProspectID_SR()
	verifyProspectID_SR = true
	actProspectID = Prospects.lblProspectID().GetRoProperty("innertext")
	If actProspectID =  prospectID Then
		LogMessage "RSLT","Verification","Prospect ID matches. Expected: " &prospectID &" Actual: "&actProspectID ,true
	else
		LogMessage "WARN","Verification","Prospect ID not matches. Expected: " &prospectID &" Actual: "&actProspectID ,false
		verifyProspectID_SR = false
	End If
End Function

'[Click on the last record of the Prospect Table in the CSO Home Page]
Public Function click_ProspectID_ViewSR()
	click_ProspectID_ViewSR = true
	'Count the number of records present on the last page
	intRecordCount = getRecordsCountForColumn(Prospects.tblProspectsHeader,Prospects.tblProspectsContent, "Prospect ID")
	'as the newly added recorded is the last one, directly click on the intRecordCount-th hyperlink
	'Call clickProspectID(Prospects.tblProspectsHeader,Prospects.tblProspectsContent, "Prospect ID",intRecordCount - 1)
	Set oDesc = Description.Create
	oDesc("xpath").value = "//*[contains(@class,'dt-row dt-body-row')]"
	Set eachRow = Prospects.tblProspectsContent.childObjects(oDesc)
	'the required row is eachRow(rowNum)
	'now find the required column Name in the required row object ie eachRow(rowNum)
	Set colDesc = Description.Create
	colDesc("xpath").value = "//*[contains(@class,'md-button')]"
	Set rqdCol = eachRow(intRecordCount - 1).childObjects(colDesc)
	rqdCol(0).Click
	WaitForICallLoading
	If err.number <> 0 Then
		LogMessage "WARN","Verification","Failed to click the Prospect ID" ,false
		click_ProspectID_ViewSR = false
	else
		LogMessage "RSLT","Verification","Prospect ID clicked successfully." ,true
	End If
		
End Function

'[Navigate to the last page of the Prospects in CSO Home Page]
Public Function navigateToLastRecord()
	navigateToLastRecord = true
	clickNext = True
	Do
		'Click lnkNext until you get the class as disabled
		classNext = Prospects.lnkNext().GetRoProperty("class")
		If instr(classNext,"enabled") Then
			'click on Next
			Prospects.lnkNext().click
		else
			'this is the end of the record
			clickNext = false
		End If
	Loop While clickNext = True
End Function
'[Click radio button on popup Prospects]
Public Function clickRadiobtn_PopUpProspects(lstProspectsDtls)
	bDevPending=false
	
	Set oDesc=Description.Create
	oDesc("micclass").Value = "WebElement"
	'oDesc("class").Value = "dt-row dt-body-row ng-scope"
	oDesc("class").Value = "dt-row-center dt-row-block"
	Set obj=Prospects.tblProspectIdIAContent.ChildObjects(oDesc)
	strcount=obj.count
	For i = 0 To strcount - 1
		If obj(i).getroproperty("innertext")=lstProspectsDtls Then
			Set oDesc1=Description.Create
			oDesc1("micclass").Value = "WebElement"
			oDesc1("class").Value = "radio ng-scope"
			'oDesc1("class").Value = "dt-cell ng-scope"
			Set subobj=obj(i).ChildObjects(oDesc1)
			subobj(0).click
		End If	
	Next
End Function

'[Verify Pagination for Prospect Opportunity table displayed]
Public Function ValidatePaginationHomepage_Prospect()
 bValidatePagination_Prospect=true
 bNextPageExist = True
	While bNextPageExist = True
	 intRecordCount = getRecordsCountForColumn(Prospects.tblProspectsHeader,Prospects.tblProspectsContent,"Prospect ID")	
	 iCheck = 10
		If intRecordCount <=iCheck  Then
	     LogMessage "RSLT","Verification","Number of records displayed per page matched with expected. Expected Count is less than or equal to "&iCheck, true   
	     bValidatePagination_Prospect = True
		 If intRecordCount < iCheck Then
		   	bNextPageExist =matchStr(Prospects.lnkNext.GetROProperty("class"),"enabled")
			If bNextPageExist Then
			LogMessage "WARN","Verification","Next link expected to be disabled if record is less than "&iCheck&". Currently it is enabled.",false
			bValidatePagination_Prospect = False
			Else
			LogMessage "RSLT","Verification","Next link is disabled as per expectation.",true
			End If
		ElseIf intRecordCount = iCheck Then
			bNextPageExist = matchStr(Prospects.lnkNext.GetROProperty("class"),"enabled")
			If bNextPageExist Then
			   Prospects.lnkNext.Click
			End If
		End If
		Else 
			LogMessage "RSLT","Verification","Number of records displayed per page not matched with expected. Expected Count is less than or equal to 5", false   
			bNextPageExist = False
		End If
   Wend
   ValidatePaginationHomepage_Prospect = bValidatePagination_Prospect
End Function

'[Verify error message displays for Org ID]
'Public Function verifyErrorMessage_OrgID(strErrorMessage)
'bverifyErrorMessage_OrgID = true
'	If Not IsNull(strErrorMessage) Then
' 		If Not VerifyInnerText (ReferralRequest.lblErrorMessage(), strErrorMessage, "OrgID")Then
'			   bverifyErrorMessage_OrgID = false
'		End If
'	End If
'	verifyErrorMessage_OrgID = bverifyErrorMessage_OrgID
'End Function

'[Verify error message displays for Rep ID]
'Public Function verifyErrorMessage_RepID(strErrorMessage)
'bverifyErrorMessage_RepID = true
'	If Not IsNull(strErrorMessage) Then
' 		If Not VerifyInnerText (ReferralRequest.lblErrorMessage_RepID(), strErrorMessage, "RepID")Then
'			   bverifyErrorMessage_RepID = false
'		End If
'	End If
'	verifyErrorMessage_RepID = bverifyErrorMessage_RepID
'End Function


'[Select Prosects DOB as]
Public Function setProspects_DOB(txtProsDOB)
	bsetProspects_DOB=true
	Activities.txtDOB().set txtProsDOB
	WaitForICallLoading
	setProspects_DOB=bsetProspects_DOB
End Function