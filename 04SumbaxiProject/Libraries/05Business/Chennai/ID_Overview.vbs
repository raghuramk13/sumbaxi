'[Click Menu List Button from Customer Overview Page]
Public Function clickMenuList_Overview()
WaitForIServeLoading
If coOverview_Page.lstMenu.Exist(1) Then
	coOverview_Page.lstMenu.click
	If Err.Number <> 0 Then
		clickMenuList_Overview = False
		LogMessage "WARN","Verification","Failed to Click Menu List in Overview Page." ,False
		Exit Function
	End If
	WaitForIServeLoading
	clickMenuList_Overview = True
End If
End Function

'[Click link New Interaction Activity from MenuList]
Public Function clickNewIAfromMenulist_Overview()
	If coOverview_Page.lnkNewIA.Exist(1) Then
		   coOverview_Page.lnkNewIA.click
		   If Err.Number <> 0 Then
				clickNewIAfromMenulist_Overview = False
				LogMessage "WARN","Verification","Failed to Click Menu List New Interaction Activity in Overview Page." ,False
				Exit Function
			Else
				LogMessage "RSLT","Verification","Clicked Link :New Interaction Activity: from menu options.", True
				clickNewIAfromMenulist_Overview = True
		   End If
		   WaitForIServeLoading
		   
	Else
			coOverview_Page.lstMenu.click
			WaitForIServeLoading
			coOverview_Page.lnkNewIA.click
			If Err.Number <> 0 Then
				clickNewIAfromMenulist_Overview = False
				LogMessage "WARN","Verification","Failed to Click Menu List New Interaction Activity in Overview Page." ,False
				Exit Function
			Else
				LogMessage "RSLT","Verification","Clicked Link :New Interaction Activity: from menu options.", True
				clickNewIAfromMenulist_Overview = True
		   End If
		    WaitForIServeLoading
	End If
	
End Function

'[Click link New Service Request from MenuList]
Public Function clickNewSRfromMenulist_Overview()
If coOverview_Page.lnkNewSR.Exist(1) Then
   coOverview_Page.lnkNewSR.click
   If Err.Number <> 0 Then
	clickNewSRfromMenulist_Overview = False
	LogMessage "WARN","Verification","Failed to Click Menu List New Service Request in Overview Page." ,False
	Exit Function
   Else
   	LogMessage "RSLT","Verification","Clicked Link :New Service Request: from menu options.", True
   End If
   WaitForIServeLoading
   clickNewSRfromMenulist_Overview = True
End If
End Function

'[Click link Current Interaction Activity from MenuList]
Public Function clickNewSRfromMenulist_Overview()
If coOverview_Page.lnkNewSR.Exist(1) Then
   coOverview_Page.lnkNewSR.click
   If Err.Number <> 0 Then
	clickNewSRfromMenulist_Overview = False
	LogMessage "WARN","Verification","Failed to Click Menu List Current Interaction Activity in Overview Page." ,False
	Exit Function
   End If
   WaitForIServeLoading
   clickNewSRfromMenulist_Overview = True
End If
End Function

'[Click link View Profile from MenuList]
Public Function clickViewProfilefromMenulist_Overview()
If coOverview_Page.lnkViewProfile.Exist(1) Then
   coOverview_Page.lnkViewProfile.click
   If Err.Number <> 0 Then
	clickViewProfilefromMenulist_Overview = False
	LogMessage "WARN","Verification","Failed to Click Menu List View Profile in Overview Page." ,False
	Exit Function
   End If
   WaitForIServeLoading
   clickViewProfilefromMenulist_Overview = True
End If
End Function

'[Click button View All displayed in grey panel]
Public Function clickViewAllButton_Overview()
If coOverview_Page.btnViewAll.Exist(1) Then
   coOverview_Page.btnViewAll.click
   If Err.Number <> 0 Then
	clickViewAllButton_Overview = False
	LogMessage "WARN","Verification","Failed to Click View All Button in Overview Page." ,False
	Exit Function
   End If
   WaitForIServeLoading
   clickViewAllButton_Overview = True
End If
End Function

'[Select value from list box displayed in grey Panel]
Public Function Selectlistbox_Overview(strItem)
Selectlistbox_Overview = SelectComboBoxItem(coOverview_Page.listbox,strItem,"Overview Listbox")
WaitForIServeLoading
End Function

'[Verify Maximum no of Rows displayed on selecting lists from Overview Page]
Public Function VerifyNoOfPanelRows_Overview(strNoOfRows)
bVerifyPanelRow = False
Set TotalRowsPanel = SetObjPanelRow(coOverview_Page.elePanelHeader)	
	ActualNoOfRows = TotalRowsPanel.Count
	If ActualNoOfRows <> 0 Then
		If Trim(ActualNoOfRows) <= Trim(strNoOfRows) Then
		   LogMessage "RSLT","Verification","Maximum No of Rows displayed in the panel is less than or equal to "&strNoOfRows&"",True
		   bVerifyPanelRow = True 
		Else
		   LogMessage "WARN","Verification","Maximum No of Rows displayed in the panel is greater than or not equal to "&strNoOfRows&"",False
		   bVerifyPanelRow = False 
		End If
	Else
	LogMessage "WARN","Verification","No Records found for Service Requests/Interaction Activities panel to verify" ,False
 	End If
VerifyNoOfPanelRows_Overview = bVerifyPanelRow
Set TotalRowsPanel = Nothing
End Function

'[Verify IA or SR related Additional Information in Customer Overview page]
Public Function VerifyAdditionalInfo_Overview(strNumber, strStatus, strSubstatus, strTriplets, strCreatedDate)
bVerifyAdditionalInfo = False
Set ObjPanelHeader = coOverview_Page.elePanelHeader
Set TotalRowsPanel = SetObjPanelRow(ObjPanelHeader)	
	ActualNoOfRows = TotalRowsPanel.Count

 If ActualNoOfRows <> 0 Then	 
	 Set ObjNumber = SetObjNumber(ObjPanelHeader)
	 Set ObjStatus = SetObjStatus(ObjPanelHeader)
	 Set ObjSubStatus = SetObjSubStatus(ObjPanelHeader)
	 Set ObjTriplets = SetObjTriplets(ObjPanelHeader)
	 Set ObjCreatedDate = SetObjCreatedDate(ObjPanelHeader)
	 
	 For i  = 0 To ActualNoOfRows-1 Step 1			 
		 ActualNumber = ObjNumber(i).GetRoProperty("innertext")		 
		 If Ucase(Trim(ActualNumber)) =  Ucase(Trim(strNumber)) Then
		 	LogMessage "RSLT","Verification","IA or SR Number "&strNumber&" found in the table panel displayed",True
			bVerifyAdditionalInfo = True	
			
		 	If Not IsNull(strStatus)  Then
		 	   ActualStatus = ObjStatus(i).GetRoProperty("innertext")
		 	   If Ucase(Trim(ActualStatus)) =  Ucase(Trim(strStatus)) Then
		 	   	  LogMessage "RSLT","Verification","Status found in table : "&strStatus&" displayed as expected",True
		 	   	  bVerifyAdditionalInfo = True
		 	   Else 
		 	   	  LogMessage "RSLT","Verification","Status found in table : "&strStatus&" are not displayed as expected",False
		 	   	  bVerifyAdditionalInfo = False
		 	   	  Exit For
		 	   End IF
		 	End IF    
		 	
		 	If Not IsNull(strSubstatus)  Then
		 	   ActualSubStatus = ObjSubStatus(i).GetRoProperty("innertext")
		 	   If Ucase(Trim(ActualSubStatus)) =  Ucase(Trim(strSubstatus)) Then
		 	   	  LogMessage "RSLT","Verification","Substatus found in table : "&strSubstatus&" displayed as expected",True
		 	   	  bVerifyAdditionalInfo = True
		 	   Else 
		 	   	  LogMessage "RSLT","Verification","Substatus found in table : "&strSubstatus&" are not displayed as expected",False
		 	   	  bVerifyAdditionalInfo = False
		 	   	  Exit For
		 	   End IF
		 	End IF   		 	   
		 	   
		 	If Not IsNull(strTriplets)  Then
		 		'[ Raguram : 12/01/2018 - reunioning the strTriplets which are split when data is passed by "|" delimiter ]
		 		If IsArray(strTriplets) Then
		 			strTriplet = Join(strTriplets,"|")
				Else
					strTriplet = Trim(strTriplets)
		 		End If
		 		
		 	   ActualTriplet = ObjTriplets(i).GetRoProperty("innertext")
		 	   If Ucase(Trim(ActualTriplet)) =  Ucase(Trim(strTriplet)) Then
		 	   	  LogMessage "RSLT","Verification","Triplets found in table : "&strTriplet&" displayed as expected",True
		 	   	  bVerifyAdditionalInfo = True
		 	   Else 
		 	   	  LogMessage "WARN","Verification","Triplets found in table : "&strTriplet&" are not displayed as expected",False
		 	   	  bVerifyAdditionalInfo = False
		 	   	  Exit For
		 	   End IF
		 	End IF    
		 	
		 	If Not IsNull(strCreatedDate)  Then
		 	   ActualCreatedDate = ObjCreatedDate(i).GetRoProperty("innertext")	
		 	   If Ucase(Trim(ActualCreatedDate)) =  Ucase(Trim(strCreatedDate)) Then
		 	   	  LogMessage "RSLT","Verification","Created Date: "&strCreatedDate&" displayed in table as expected",True
		 	   	  bVerifyAdditionalInfo = True
		 	   Else 
		 	   	  LogMessage "WARN","Verification","Created Date: "&strCreatedDate&" not displayed in table as expected",False
		 	   	  bVerifyAdditionalInfo = False
		 	   	  Exit For
		 	   End IF
		 	End IF
		 	Exit For
		 End If 	
	 Next
	  If Not bVerifyAdditionalInfo Then
	  	LogMessage "WARN","Verification","IA OR SR Number "&strNumber&" not found in the table panel displayed",False	 
	  End If
  End If	

VerifyAdditionalInfo_Overview = bVerifyAdditionalInfo

Set ObjPanelHeader = Nothing
Set TotalRowsPanel = Nothing	
Set ObjNumber = Nothing
Set ObjStatus = Nothing
Set ObjSubStatus = Nothing
Set ObjTriplets = Nothing
Set ObjCreatedDate = Nothing
End Function

'[Click on IA or SR Number displayed in grid panel overview page]
Public Function ClickNumber_Overview(strNumber)
 ClickNumber_Overview = False
 Set TotalRowsPanel = SetObjPanelRow(coOverview_Page.elePanelHeader)	
	 ActualNoOfRows = TotalRowsPanel.Count
 If ActualNoOfRows <> 0 Then	 
	 Set ObjNumber = SetObjNumber(coOverview_Page.elePanelHeader)	 
	 For i  = 0 To ActualNoOfRows-1 Step 1			 
		 ActualNumber = ObjNumber(i).GetRoProperty("innertext")		 
		 If Ucase(Trim(ActualNumber)) =  Ucase(Trim(strNumber)) Then
		 	ObjNumber(i).Click
		 	If Err.Number <> 0 Then
			   ClickNumber_Overview = False
			   LogMessage "WARN","Verification","Failed to Click IA or SR Number in Overview Page." ,False
			Else 
			   LogMessage "RSLT","Verification","Clicked on IA or SR Number: "&strNumber&" without any errors", True
	    	   ClickNumber_Overview = True
			End If
			Exit Function
		 End If
     Next 
  	 LogMessage "WARN","Verification","Matching Request Number not found in a panel" ,False
 End If  
 Set TotalRowsPanel = Nothing
 Set ObjNumber = Nothing
End Function

'[Click Column Number from Product list table in Overview Page]
Public Function SelectColumnNumberProductList_Overview(strProduct,lstProduct)
	bClickColNumber = False	
	If Not IsNull (strProduct) Then			
		Select Case strProduct
			Case "Deposits"
				Set ObjtableHeader = coOverview_Page.tblProductListDepositsHeader
				Set ObjtableContent = coOverview_Page.tblProductListDepositsContent
			Case "Credit Cards"	
				Set ObjtableHeader = coOverview_Page.tblProductListCCHeader
				Set ObjtableContent = coOverview_Page.tblProductListCCContent
			Case "Cashline"
				Set ObjtableHeader = coOverview_Page.tblProductListCLHeader
				Set ObjtableContent = coOverview_Page.tblProductListCLContent
			Case "Loans"
				Set ObjtableHeader = coOverview_Page.tblProductListLoanHeader
				Set ObjtableContent = coOverview_Page.tblProductListLoanContent
			Case "Debit/ATM Cards"
				Set ObjtableHeader = coOverview_Page.tblProductListDebitHeader
				Set ObjtableContent = coOverview_Page.tblProductListDebitContent
		End Select
	End If	
	bClickColNumber = SelectTableRow(ObjtableHeader,ObjtableContent,lstProduct ,strProduct & " Overview Product List Table","NUMBER",False,False)
	WaitForIServeLoading
	SelectColumnNumberProductList_Overview = bClickColNumber
	Set ObjtableHeader = Nothing
	Set ObjtableContent = Nothing
End Function

Public Function clickBacktoHomePage()
If coDashboard_Page.eleIServeLogo.Exist(1) Then
   coDashboard_Page.eleIServeLogo.click
   If Err.Number <> 0 Then
		clickBacktoHomePage = False
		LogMessage "WARN","Verification","Failed to Click IServe Logo for going back to Dashboard Page." ,False
		Exit Function
   End If
   WaitForIServeLoading
   clickBacktoHomePage = True
End If
End Function

'[Verify list of panel displayed in Customer Overview Page]
Public Function VerifyPanellist_Overview(lstPanel)
	VerifyPanellist_Overview = VerifyAccordionHeader(coOverview_Page.ObjAccordionGroup_Overview,lstPanel)
End Function

'[Click Plus sign for Single Accordion in Customer Overview page displayed]
Public Function ClickPlusIconSingle_CustomerOverview(strAccordion)
	bverifyExpandAccordion = False		
	Select Case strAccordion
	  Case "Deposits"
		Set objAccordionPlusIcon = coOverview_Page.lblAccordionDeposits			 
	  Case "Credit Cards"	
		Set objAccordionPlusIcon = coOverview_Page.lblAccordionCC
	  Case "Cashline"
		Set objAccordionPlusIcon = coOverview_Page.lblAccordionCashline
	  Case "Loans"
		Set objAccordionPlusIcon = coOverview_Page.lblAccordionLoan
	  Case "Debit/ATM Cards"
		Set objAccordionPlusIcon = coOverview_Page.lblAccordionDCATM
	End Select
			
	bverifyExpandAccordion = ClickExpandIcon(objAccordionPlusIcon,strAccordion)		
	
	ClickPlusIconSingle_CustomerOverview = bverifyExpandAccordion
End Function

'[Click Plus sign for Multiple Accordion in Customer Overview page displayed]
Public Function ClickPlusIconMultiple_CustomerOverview(lstAccordion)	
If Not IsNull (lstAccordion) Then
	bverifyAccordion1 = False
	bverifyAccordion2 = True
	For i = 0 To Ubound(lstAccordion)
		strAccordion = Split(lstAccordion(i),"|")(0)
		
	    Select Case strAccordion
		  Case "Deposits"
			Set objAccordionPlusIcon = coOverview_Page.lblAccordionDeposits			 
		  Case "Credit Cards"	
			Set objAccordionPlusIcon = coOverview_Page.lblAccordionCC
		  Case "Cashline"
			Set objAccordionPlusIcon = coOverview_Page.lblAccordionCashline
		  Case "Loans"
			Set objAccordionPlusIcon = coOverview_Page.lblAccordionLoan
		  Case "Debit/ATM Cards"
			Set objAccordionPlusIcon = coOverview_Page.lblAccordionDCATM
		End Select
				
		bverifyExpandAccordion = ClickExpandIcon(objAccordionPlusIcon,strAccordion)	
		
		If bverifyExpandAccordion Then
			bverifyAccordion1 = True
		Else 
			bverifyAccordion2 = False 			
		End If		
		
	Next	
	
	If bverifyAccordion1 And bverifyAccordion2 Then
		ClickPlusIconMultiple_CustomerOverview = True
	Else
		ClickPlusIconMultiple_CustomerOverview = False
	End If	
Else 
	ClickPlusIconMultiple_CustomerOverview = True
End If
Set objAccordionPlusIcon = Nothing
End Function

'[Verify display below Accordions expanded in Customer Overview page]
Public Function VerifydisplayAccordions_CustomerOverview(lstAccordion)
bverifyAccordion1 = False
bverifyAccordion2 = True

If Not IsNull (lstAccordion) Then

	For i = 0 To Ubound(lstAccordion)
		strAccordion = Split(lstAccordion(i),"|")(0)
		
	    Select Case strAccordion
		  Case "Deposits"
			Set objAccordionSection = coOverview_Page.lblAccordionDeposits			 
		  Case "Credit Cards"	
			Set objAccordionSection = coOverview_Page.lblAccordionCC
		  Case "Cashline"
			Set objAccordionSection = coOverview_Page.lblAccordionCashline
		  Case "Loans"
			Set objAccordionSection = coOverview_Page.lblAccordionLoan
		  Case "Debit/ATM Cards"
			Set objAccordionSection = coOverview_Page.lblAccordionDCATM
		End Select
				
		bVerifytext = VerifyAccordiondisplay(objAccordionSection,strAccordion)
		
		ClickExpandIcon objAccordionSection,strAccordion
		
		If bVerifytext Then
			bverifyAccordion1 = True
		Else 
			bverifyAccordion2 = False 			
		End If		
		
	Next	
	
End If

If bverifyAccordion1 And bverifyAccordion2 Then
	VerifydisplayAccordions_CustomerOverview = True
Else
	VerifydisplayAccordions_CustomerOverview = False
End If

Set objAccordionSection = Nothing
End Function

'[Click Action Menu for Account Number selected in Overview Page]
Public Function SelectActionMenu_Overview(strProduct,lstRowData,strItem)
	bVerifyAccountlist1 = False	
	bVerifyAccountlist2 = True
	
	If Not IsNull (strProduct) Then			
		Select Case strProduct
			Case "Credit Cards"				
				Set ObjtableHeader = coOverview_Page.tblProductListCCHeader
				Set ObjtableContent = coOverview_Page.tblProductListCCContent
			Case "Cashline"
				Set ObjtableHeader = coOverview_Page.tblProductListCLHeader
				Set ObjtableContent = coOverview_Page.tblProductListCLContent
			Case "Debit/ATM Cards"		
				Set ObjtableHeader = coOverview_Page.tblProductListDebitHeader
				Set ObjtableContent = coOverview_Page.tblProductListDebitContent
		End Select
	End If	
	
	intRecordCount = getIDRecordsCountForColumn(ObjtableHeader,ObjtableContent,"NUMBER")
			
	For i = 0 To intRecordCount - 1
		ExpAccountNumber = lstRowData(1)
		ExpAccountNumber = Replace(ExpAccountNumber,"NUMBER:","")
		
		Set objAllRows = getIDAllRows(ObjtableContent)
			strAccountNumber = getIDCellTextFor(ObjtableHeader,objAllRows(i),i,"NUMBER")		
		
		If Trim(strAccountNumber) = Trim(ExpAccountNumber) Then	
		   	bVerifyAccountlist1 = True	
		   	Set oDesc1 = Description.Create
				oDesc1("xpath").value= ".//datatable-body-row[contains(@class,'datatable-body-row')]"
			Set ObjRow = ObjtableContent.ChildObjects(oDesc1)	
		   
		 	Set oDesc2 = Description.Create
				oDesc2("xpath").value= ".//datatable-body-cell[contains(@class,'datatable-body-cell')]"
			Set ObjCell = ObjRow(i).ChildObjects(oDesc2)	  
				intcolumn = ObjCell.Count -1 
				
				Setting.WebPackage("ReplayType") = 2
				ObjCell(intcolumn).Click	
				
		   bSelectlistbox_Overview = SelectItemfromList(strItem,"Overview Listbox")
		Else
			bVerifyAccountlist2 = False 
		End IF
	Next
	
	Setting.WebPackage("ReplayType") = 1
	
	If bSelectlistbox_Overview AND bVerifyAccountlist1 Then
	   SelectActionMenu_Overview  = True 
	   LogMessage "WARN","Verification","Clicked on Action Menu from the list box"&strItem ,True
	Else If NOT bVerifyAccountlist2 Then
	   SelectActionMenu_Overview  = False 
	   LogMessage "WARN","Verification","Account Number expected not displayed below the Accordion"&strProduct ,False
	Else 
	   SelectActionMenu_Overview  = False 
	   LogMessage "WARN","Verification","Failed to click on Action Menu from the list box"&strItem ,False
	End If
	End IF
	
	Set ObjtableHeader = Nothing
	Set ObjtableContent = Nothing
	Set oDesc1 = Nothing
	Set oDesc2 = Nothing 
	Set ObjRow = Nothing
	Set ObjCell = Nothing 	
End Function

'[Navigate to Homepage from Customer Overview]
Public Function NavigateToHomepage()
	NavigateToHomepage = coOverview_Page.btnHeaderLogo.click
	wait(1)
	If VerifyTabExist("Dashboard") Then
		NavigateToHomepage = True
		LogMessage "RSLT","Verification","User navigated to Dashboard Page as expected",True
	Else
		NavigateToHomepage = False
		LogMessage "WARN","Verification","User not navigated to Dashboard Page",False
	End If
End Function

'[Click on Accordion header and select from Action list]
 Public Function SelectAccordionActionList_Overview(strProduct,strItem)
bSelectlistbox_Overview = False	

If Not IsNull (strProduct) Then	
	Setting.WebPackage("ReplayType") = 2	
	If strProduct =  "Credit Cards"	Then
		coOverview_Page.btnAllCardsCC.Click
	ElseIf strProduct =  "Cashline" Then
		coOverview_Page.btnAllCardsCL.Click
	End IF	
End If	

If Err.Number <> 0 Then
	SelectAccordionActionList_Overview = False
	LogMessage "WARN","Verification","Failed to Click Accordion Action Button from Overview Page." ,False
	Exit Function
End If			
WaitForIServeLoading
bSelectlistbox_Overview = SelectItemfromList(strItem,"Overview Listbox")

SelectAccordionActionList_Overview = bSelectlistbox_Overview
End Function
