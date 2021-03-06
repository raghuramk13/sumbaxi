'[Verify Home Page default options in Show dropdown displayed as]
Public Function VrfyDefValShowDropdownEQ(strDefValShowDropdownEQ)
   VrfyDefValShowDropdownEQ = true
   If Not IsNull(strDefValShowDropdownEQ) Then
       If Not verifyComboSelectItem (CSAT.lstsearchTabShowcomboBox(),strDefValShowDropdownEQ, "Show")Then
    	  LogMessage "WARN","Verification","Expected Default Show type:"&strDefValShowDropdownEQ&" not displayed in the Show field" ,false
          VrfyDefValShowDropdownEQ = false
       End If
   End If
End Function

'[Verify list of values displayed in Show dropdown]
Public Function VerifylistShowDrpDwn(lstShowDrpDwn) 
	VerifylistShowDrpDwn = True 
	If Not IsNull(lstShowDrpDwn) Then
       If Not verifyComboboxItems(CSAT.lstsearchTabShowcomboBox(),lstShowDrpDwn, "Show")Then
       	   LogMessage "WARN","Verification","List of Show displayed in the combox box is not as expected" ,false
           VerifylistShowDrpDwn = false
       End If
   End If
End Function

'[Select Home Page Show combox box as]
Public Function SelectHomePageShowCmb(strCSATSurvey)
	SelectHomePageShowCmb = true
	If Not IsNull(strCSATSurvey) Then
       If Not (selectItem_Combobox (CSAT.lstsearchTabShowcomboBox(), strCSATSurvey))Then
           LogMessage "WARN","Verification","Failed to select :"&strCSATSurvey&" From Show dropdown list" ,false
           SelectHomePageShowCmb = false
       End If
   End If
   WaitForICallLoading
End Function

'[Verify Home Page default options in Group dropdown displayed as]
Public Function VrfyDefValGroupDropdownEQ(strDefValGroupDropdownEQ)
   VrfyDefValGroupDropdownEQ = true
   If Not IsNull(strDefValGroupDropdownEQ) Then
       If Not verifyComboSelectItem (CSAT.lstsearchTabGroup_comboBox(),strDefValGroupDropdownEQ, "Group")Then
    	  LogMessage "WARN","Verification","Expected Default Group type:"&strDefValGroupDropdownEQ&" not displayed in the Group field" ,false
          VrfyDefValGroupDropdownEQ = false
       End If
   End If
End Function

'[Verify list of values displayed in Group dropdown]
Public Function VerifylistGroupDrpDwn(lstGroupDrpDwn) 
	VerifylistGroupDrpDwn = True 
	If Not IsNull(lstGroupDrpDwn) Then
       If Not verifyComboboxItems(CSAT.lstsearchTabGroup_comboBox(),lstGroupDrpDwn, "Group")Then
       	   LogMessage "WARN","Verification","List of Group displayed in the combox box is not as expected" ,false
           VerifylistGroupDrpDwn = false
       End If
   End If
End Function

'[Select Home Page Group combox box as]
Public Function SelectHomePageGroupCmb(strGroupVal)
	SelectHomePageGroupCmb = true
	If Not IsNull(strGroupVal) Then
       If Not (selectItem_Combobox (CSAT.lstsearchTabGroup_comboBox(), strGroupVal))Then
           LogMessage "WARN","Verification","Failed to select :"&strGroupVal&" From Group dropdown list" ,false
           SelectHomePageGroupCmb = false
       End If
   End If
   WaitForICallLoading
End Function

'[Verify Home Page default options in Select dropdown displayed as]
Public Function VrfyDefValSelectDropdown(strDefValSelectDropdownEQ)
   VrfyDefValSelectDropdown = true
   If Not IsNull(strDefValSelectDropdownEQ) Then
       If Not verifyComboSelectItem (CSAT.lstsearchTabSelect_comboBox(),strDefValSelectDropdownEQ, "Select")Then
    	  LogMessage "WARN","Verification","Expected Default Select type:"&strDefValSelectDropdownEQ&" not displayed in the Select field" ,false
          VrfyDefValSelectDropdown = false
       End If
   End If
End Function

'[Verify Home Page default options in Staff dropdown displayed as]
Public Function VrfyDefValStaffDropdown(strDefValStaffDropdownEQ)
   VrfyDefValStaffDropdown = true
   If Not IsNull(strDefValStaffDropdownEQ) Then
       If Not verifyComboSelectItem (CSAT.lstsearchTabCSO_comboBox(),strDefValStaffDropdownEQ, "Staff")Then
    	  LogMessage "WARN","Verification","Expected Default Staff type:"&strDefValStaffDropdownEQ&" not displayed in the Staff field" ,false
          VrfyDefValStaffDropdown = false
       End If
   End If
End Function

'[Verify list of values displayed in Staff dropdown]
Public Function VerifylistStaffDrpDwn(lstStaffDrpDwn) 
	VerifylistStaffDrpDwn = True 
	If Not IsNull(lstStaffDrpDwn) Then
       If Not verifyComboboxItems(CSAT.lstsearchTabCSO_comboBox(),lstStaffDrpDwn, "Staff")Then
       	   LogMessage "WARN","Verification","List of Staff displayed in the combox box is not as expected" ,false
           VerifylistStaffDrpDwn = false
       End If
   End If
End Function

'[Select Home Page Staff combox box as]
Public Function SelectHomePageStaffCmb(strStaffValSet)
	SelectHomePageStaffCmb = true
	If Not IsNull(strStaffValSet) Then
		CSAT.txtSearchTabCSO_ComboBox().Set strStaffValSet
       If Not (selectItem_Combobox (CSAT.lstsearchTabCSO_comboBox(), strStaffValSet))Then
           LogMessage "WARN","Verification","Failed to select :"&strStaffValSet&" From Staff dropdown list" ,false
           SelectHomePageStaffCmb = false
       End If
   End If
   WaitForICallLoading
End Function

'[Verify Default CSAT Survey Date]
Public Function verifyDefaultCSATsurveyDate()
  verifyDefaultCSATsurveyDate = true
  strCSATSurveyDateFrom = CSAT.txtCSATsrveyFromDate.GetROProperty("value")
  strCSATSurveyDateTo = CSAT.txtCSATsrveyToDate.GetROProperty("value")
  DaysRange = DateDiff("d", strCSATSurveyDateFrom, strCSATSurveyDateTo)
  If DaysRange = 31  Then
     LogMessage "RSLT","Verification","From Date:"+ trim(strCSATSurveyDateFrom) +"and To Dates:"+ trim(strCSATSurveyDateTo) +" are displayed diff by 31 days default range",True
  Else 
     LogMessage "WARN", "Verification","From Date:"+ trim(strCSATSurveyDateFrom) +"and To Dates:"+ trim(strCSATSurveyDateTo) +" are not displayed diff by 31 days default range", False
     verifyDefaultCSATsurveyDate = False 
  End If
End Function

'[Select CSAT Survey Feedback Show All CheckBox]
Public Function selectCSATSurveyShowAllCheckBox()
    selectCSATSurveyShowAllCheckBox = True    
    CSAT.rbtShowAllCheckBox.Click
    If Err.Number<>0 Then
       selectCSATSurveyShowAllCheckBox = false
       LogMessage "WARN","Verification","Failed to Click Button : Show All" ,false
    else
       LogMessage "RSLT","Verification","Successfuly Clicked on Show All CheckBox", true   
    End If
End Function

'[Click On the CSAT Survey Enquiry Screen Filter Button]
Public Function ClickOnFilterButtonFromCSATPage()    
    ClickOnFilterButtonFromCSATPage = true
    CSAT.btnFilterButtonCSATPage.Click
    If Err.Number<>0 Then
       ClickOnFilterButtonFromCSATPage = false
       LogMessage "WARN","Verification","Failed to Click Button : Filter" ,false
    else
       LogMessage "RSLT","Verification","Successfuly Clicked on Filter Button", true   
    End If
WaitForICallLoading
End Function

'[Verify CSO Home Page row Data in Table CSAT Survey Records]
Public Function verifytblCSOHomeCSATSurveyRec(arrRowDataList)
   verifytblCSOHomeCSATSurveyRec = verifyTableContentList(CSAT.lblCSATSurveyDetailsTableHeader,CSAT.lblCSATSurveyDetailsTableContent,arrRowDataList,"CSAT Survey" ,True,CSO_TM_Home.lnkNext ,CSO_TM_Home.lnkNext1,CSO_TM_Home.lnkPrevious)
End Function

'[Click on Created On hyperlink from CSAT Survey Table]
Public Function ClickOnSurveyRefNoHyperlink(lstCreatedOn)
	ClickOnSurveyRefNoHyperlink = selectTableLink(CSAT.lblCSATSurveyDetailsTableHeader, CSAT.lblCSATSurveyDetailsTableContent, lstCreatedOn, "CSAT Survey", "Survey Ref. No", True, CSO_TM_Home.lnkNext ,CSO_TM_Home.lnkNext1, CSO_TM_Home.lnkPrevious)
	WaitForICallLoading
End Function

'[Click on CSAT Survey Smiley Icon from Customer Over View Page]
Public Function ClickCSATSurveySmileyIcon()
ClickCSATSurveySmileyIcon = True
CSAT.lblSmileyIcon.Click
If Err.Number<>0 Then
       ClickCSATSurveySmileyIcon = false
       LogMessage "WARN","Verification","Failed to Click Smiley Icon : Filter" ,false
    else
       LogMessage "RSLT","Verification","Successfuly Clicked on Smiley Icon", true   
    End If
WaitForICallLoading
End Function

'[Verify CSAT Details Page row Data in Table Survey Listing]
Public Function verifytblCSATSurveyRecDetailsPage(arrSurveyDataList)
   verifytblCSATSurveyRecDetailsPage = verifyTableContentList(CSAT.lblEmoticonAndDatesTableHeader,CSAT.lblEmoticonAndDatesTableContent,arrSurveyDataList,"CSAT Survey",false,null,null,null)
End Function

'[Click on row Data in CSAT Details Page Table Survey Listing]
Public Function ClickOntblCSATSurveyRecDetailsPage(lstCreatedOn)
	ClickOntblCSATSurveyRecDetailsPage = selectTableLink(CSAT.lblEmoticonAndDatesTableHeader, CSAT.lblEmoticonAndDatesTableContent, lstCreatedOn, "CSAT Survey", "BLANK",false,null,null,null)
	WaitForICallLoading
End Function

'[Verify Survey Info Section Details]
Public Function VerifySurveyInfoSectionDetails(strSurveyRefNo, strSurveyCategory, strRelatedTo, strType, strSubType, strSurveyResponseDateAndTime, strSurveyMode, strSurveyQuestions)
	VerifySurveyInfoSectionDetails = False
	If Not IsNull(strSurveyRefNo) and Not IsNull(strSurveyCategory) and Not IsNull(strRelatedTo) and Not IsNull(strType) and Not IsNull(v) and Not IsNull(strSurveyResponseDateAndTime) and Not IsNull(strSurveyMode) and Not IsNull(strSurveyQuestions) then
		If verifyInnerText (CSAT.lblSurveyRefNo(),strSurveyRefNo, "SurveyRefNo") and verifyInnerText (CSAT.lblSurveyCategory(),strSurveyCategory, "SurveyCategory") and verifyInnerText (CSAT.lblRelatedTo(),strRelatedTo, "RelatedTo") and verifyInnerText (CSAT.lblTSurInfsecType(),strType, "Type") and verifyInnerText (CSAT.lblSurInfSecSubType(),strSubType, "SubType") and verifyInnerText (CSAT.lblSurveyResponseDateandTime(),strSurveyResponseDateAndTime, "SurveyResponseDateAndTime") and verifyInnerText (CSAT.lblSurveyMode(),strSurveyMode, "SurveyMode") and verifyInnerText (CSAT.lblSurveyQuestions(),strSurveyQuestions, "SurveyQuestions")Then		
			VerifySurveyInfoSectionDetails = True
		End If
	End If
End Function

'[Verify Interaction Activity Info Details Section Display Values]
Public Function VerifyInteractionActivityInfoDetailsDisplVal(strIANO, strCreatedBy, strRequestorChannel, strCTIRefNo, strCreationDateAndTime)
	VerifyInteractionActivityInfoDetailsDisplVal = False
	If Not IsNull(strIANO) and Not IsNull(strCreatedBy) and Not IsNull(strRequestorChannel) and Not IsNull(strCreationDateAndTime) Then
		'If verifyInnerText (CSAT.lblIANo(),strIANO, "IANO") and verifyInnerText (CSAT.lblCreatedBy(),strCreatedBy, "CreatedBy") and verifyInnerText (CSAT.lblRequestorChannel(),strRequestorChannel, "RequestorChannel") and verifyInnerText (CSAT.lblCreationDateandTime(),strCreationDateAndTime, "CreationDateAndTime") Then
		If verifyInnerText (CSAT.lblIANo(),strIANO, "IANO") and verifyInnerText (CSAT.lblCreatedBy(),strCreatedBy, "CreatedBy") and verifyInnerText (CSAT.lblRequestorChannel(),strRequestorChannel, "RequestorChannel") Then
			VerifyInteractionActivityInfoDetailsDisplVal = True
		End If		
	End If	
End Function

'[Verify Survey Questions and Answer Table Display Values]
Public Function VerifySurveyQuestionsandAnswerDisplayValues(arrSurveyQuestionsAnswerList)
	VerifySurveyQuestionsandAnswerDisplayValues = verifyTableContentList(CSAT.lblSurveyQuestionsAndAnswerHeader,CSAT.lblSurveyQuestionsAndAnswerContent,arrSurveyQuestionsAnswerList,"CSAT Survey Questions and Answers",false,null,null,null)
End Function
