Public Function executeRuntimeNavigationKey(strRuntimeNaviganion)
	Set oBDT=cBDTEngine
	oBDT. ExecuteNavigationSteps strRuntimeNaviganion
End Function


'@Function : To Close Tab 
	Public Function closeTab(strTabName)
		Set oDesc=Description.Create
	   'oDesc("class").Value="v-tabsheet-tabs v-tabsheet-tabs-customer-details-tab-sheet"
	   oDesc("class").Value="md-tabs-canvas"
	   oDesc("micClass").Value="WebElement"
		Set objTab=Browser("micclass:=Browser").Page("micclass:=Page").ChildObjects(oDesc)
       
	  	Set oDescTab=Description.Create
	   oDescTab("class").Value="md-tab.*"
	   oDescTab("micClass").Value="WebElement"
		Set objTabList=objTab(0).ChildObjects(oDescTab)
		intTabCount=objTabList.count
		For iCount=0 to intTabCount - 1
			Set oDescTabCaption=Description.Create
			   oDescTabCaption("class").Value="ng-binding ng-scope"
			   oDescTabCaption("micClass").value="WebElement"
				set objTabCaption=objTabList(iCount).ChildObjects(oDescTabCaption)
				strTabCaption=objTabCaption(0).GetRoProperty("innerText")
				'If Ucase(strTabCaption)=Ucase(strTabName) Then
                If MatchStr(strTabCaption,strTabName&".*") Then
					Set oDescTabClose=Description.Create
					oDescTabClose("class").value=".*tab-close-icon.*"
					oDescTabClose("micClass").value="WebElement"
					set objTabClose=objTabList(iCount).ChildObjects(oDescTabClose)
					If objTabClose.count<>0 Then
						objTabClose(0).click
						closeTab=true
						Exit Function
					End If

				End If
		Next
		closeTab=false
	End Function
	'@Function Close All tabs except 
	Public Function closeAllTab(strExceptTabName)
		Set oDesc=Description.Create
	   'oDesc("class").Value="v-tabsheet-tabs v-tabsheet-tabs-customer-details-tab-sheet"
	   oDesc("class").Value="md-tabs-canvas"
	   oDesc("micClass").Value="WebElement"
		Set objTab=Browser("micclass:=Browser").Page("micclass:=Page").ChildObjects(oDesc)
       
	  	Set oDescTab=Description.Create
	   'oDescTab("class").Value="v-tabsheet-tabitem.*"
	   oDescTab("class").Value="md-tab.*"
	   oDescTab("micClass").Value="WebElement"
		Set objTabList=objTab(0).ChildObjects(oDescTab)
		intTabCount=objTabList.count
		For iCount=0 to intTabCount-1 
			Set oDescTabCaption=Description.Create
			   'oDescTabCaption("class").Value="v-captiontext*"
			   oDescTabCaption("class").Value="ng-binding ng-scope"
			   oDescTabCaption("micClass").value="WebElement"
				set objTabCaption=objTabList(iCount).ChildObjects(oDescTabCaption)
				strTabCaption=objTabCaption(0).GetRoProperty("innerText")
				'strTabCaption=objTabCaption(iCount).GetRoProperty("innerText")
				'If Ucase(strTabCaption)=Ucase(strTabName) Then
                If Not MatchStr(strTabCaption,strExceptTabName&".*") Then
					Set oDescTabClose=Description.Create
					'oDescTabClose("class").value="v-tabsheet-caption-close"
					'oDescTabClose("class").value="tab-close-icon.*"
					oDescTabClose("class").value=".*tab-close-icon.*"
					oDescTabClose("micClass").value="WebElement"
					set objTabClose=objTabList(iCount).ChildObjects(oDescTabClose)
					If objTabClose.count<>0 Then
						objTabClose(0).click						
						closeAllTab=true
						'Exit Function
					End If

				End If
		Next
		closeAllTab=true
	End Function
	'@Function : To Select Tab with given name.
	Public Function selectTab(strTabName)
	   	Set oDesc=Description.Create
	   'oDesc("class").Value="v-tabsheet-tabs v-tabsheet-tabs-customer-details-tab-sheet"
	   oDesc("class").Value="md-tabs-canvas"
	   oDesc("micClass").Value="WebElement"
		Set objTab=Browser("micclass:=Browser").Page("micclass:=Page").ChildObjects(oDesc)

	  	Set oDescTab=Description.Create
	   'oDescTab("class").Value="v-tabsheet-tabitem.*"
	   oDescTab("micClass").Value="WebElement"
		Set objTabList=objTab(0).ChildObjects(oDescTab)
		intTabCount=objTabList.count
		For iCount=0 to intTabCount 
			Set oDescTabCaption=Description.Create
			   'oDescTabCaption("class").Value="v-captiontext*"
			   oDescTabCaption("class").Value="ng-binding ng-scope"
			   oDescTabCaption("micClass").value="WebElement"
				set objTabCaption=objTabList(iCount).ChildObjects(oDescTabCaption)
				strTabCaption=objTabCaption(0).GetRoProperty("innerText")
				If Ucase(strTabCaption)=Ucase(strTabName) Then
					objTabCaption(0).click
					WaitForIcallLoading
					selectTab = True
					Exit Function
                End If
				If MatchStr(strTabCaption,strTabName&".*") Then
					objTabCaption(0).click
					WaitForIcallLoading
					selectTab=true
					Exit Function
                End If
		Next
		selectTab=false
	End Function
'@Function : Verify Tab exist.
	Public Function verifyTabExist(strTabName)
	   	Set oDesc=Description.Create
	   'oDesc("class").Value="v-tabsheet-tabs v-tabsheet-tabs-customer-details-tab-sheet"
	   oDesc("class").Value="md-tabs-canvas"
	   oDesc("micClass").Value="WebElement"
		Set objTab=Browser("micclass:=Browser").Page("micclass:=Page").ChildObjects(oDesc)

	  	Set oDescTab=Description.Create
	   'oDescTab("class").Value="v-tabsheet-tabitem.*"
	   oDescTab("micClass").Value="WebElement"
		'oDescTab("class").Value="md-tab ng-scope ng-isolate-scope md-ink-ripple"
		oDescTab("class").Value="md-tab.*"		
		Set objTabList=objTab(0).ChildObjects(oDescTab)
		intTabCount=objTabList.count
		'For iCount=0 to intTabCount-1
		For iCount=0 to intTabCount+1
			Set oDescTabCaption=Description.Create
			   'oDescTabCaption("class").Value="v-captiontext*"
			   oDescTabCaption("class").Value="ng-binding ng-scope"
			   oDescTabCaption("micClass").value="WebElement"
				set objTabCaption=objTabList(iCount).ChildObjects(oDescTabCaption)
				strTabCaption=objTabCaption(0).GetRoProperty("innerText")
				If Ucase(strTabCaption)=Ucase(strTabName) Then
					verifyTabExist = True
					Exit Function
                End If
				If MatchStr(strTabCaption,strTabName&".*") Then
					verifyTabExist=true
					LogMessage "RSLT","Verification","Expected Tab : "&strTabName&" displayed successfully", true
					Exit Function
                End If
		Next
		LogMessage "WARN","Verification","Expected Tab : "&strTabName&" does not displayed", false
		verifyTabExist=false
	End Function
'@Function : To click left menu from Account details page
	Public Function clickLefmenuLink(strLeftMenuName)
		Set oDesc=Description.Create
		  oDesc("micclass").Value = "WebElement"
		  oDesc("class").Value = "menu-list"
		  'Adding visible property as when there is 2 tabs opened, doesnt identify the object listed in the Active page - 
		  oDesc("Visible").Value = "True"
		 Set objLeftPannel= Browser("micclass:=Browser").Page("micclass:=Page").ChildObjects(oDesc)
		Set oDescBtn=Description.Create
		oDescBtn("micclass").Value = "WebElement"
		'oDescBtn("class").Value = "ng-binding" ' commented to reuse with the html class, as the ng binding is not working in config forms'- 
		oDescBtn("html tag").Value = "A"
		'oDescBtn("innertext").Value = strLeftMenuName ' commented this by  and added outertext as there was change in innertext value after 1602 release
		oDescBtn("outertext").Value = strLeftMenuName
		set objLeftMenuSet=objLeftPannel(0).ChildObjects(oDescBtn)
		intBtnCount=objLeftMenuSet.Count
		If intbtnCount=0 Then
			clickLefmenuLink=false
			LogMessage "RSLT","Verification","Expected Link "&strLeftMenuName&" does not displayed in Left menu",false
         else
			objLeftMenuSet(0).click
			WaitForICallLoading
			LogMessage "RSLT","Verification","Expected Link "&strLeftMenuName&" clicked successfully from Left menu",true
			clickLefmenuLink=true
		End If
	End Function

'@Function: To select Combo box Item
	Public function selectItem_Combobox(objComboBox,strItem)

      Set oDesc=Description.Create
	  oDesc("micclass").Value = "WebElement" 
	  oDesc("class").Value = "md-autocomplete-icon.*"
		set lstObj=objComboBox.ChildObjects(oDesc)
		lstObj(0).Click
		wait 1
		lstObj(0).Click
		
		'To get unique id for Inpur text field.
		Set oDesc1=Description.Create  	
	  	'Modified by  due to UFT Xpath Issue
	  	oDesc1("xpath").value=".//*[contains(@class,'autocompleteInput')]"
	  	Wait 1
		strID=objComboBox.ChildObjects(oDesc1)(0).getroproperty("html id")
		'Wait 1
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
	
		intItems=lstCombo.Count
		For iCount=0 to intItems-1
			Dim strTemp1:strTemp1=""
			strTemp1=lstCombo(iCount).GetRoProperty("text")
			If trim(strTemp1)=trim(strItem) Then
				lstCombo(iCount).click
				LogMessage "RSLT","Verification","Item "&strItem&" selected from combobox sucessfully. Item Index is "& intItemIndex,true
				selectItem_Combobox=true
				Exit Function
			End If
			intItemIndex=intItemIndex+1
		Next
			LogMessage "WARN","Verification","Item "&strItem&" Not found in combobox",false
			selectItem_Combobox=false
		'Get Count of Combo Items
		If strTotalItems=strCurrentItems Then
			set lstCombo=Browser("micclass:=Browser").Page("micclass:=Page").ChildObjects(oDescCombo)
			intItems=lstCombo.Count
			For iCount=0 to intItems-1
				Dim strTemp:strTemp=""
				strTemp=lstCombo(iCount).GetRoProperty("text")
				If trim(strTemp)=trim(strItem) Then
						lstCombo(iCount).click
						LogMessage "RSLT","Verification","Item "&strItem&" selected from combobox sucessfully. Item Index is "& intItemIndex,true
						selectItem_Combobox=true
						Exit Function
				End If
				intItemIndex=intItemIndex+1
			Next
			selectItem_Combobox=false
			Exit Function
		End If
		Dim intItemIndex
		intItemIndex=0
		While strTotalItems<>strCurrentItems
			set lstCombo=Browser("micclass:=Browser").Page("micclass:=Page").ChildObjects(oDescCombo)
			intItems=lstCombo.Count
			For iCount=0 to intItems-1
				strTemp=""
				strTemp=lstCombo(iCount).GetRoProperty("text")
				If strTemp=strItem Then
						lstCombo(iCount).click
						LogMessage "RSLT","Verification","Item "&strItem&" selected from combobox sucessfully. Item Index is "& intItemIndex,true
						selectItem_Combobox=true
						Exit Function
				End If
				intItemIndex=intItemIndex+1
			Next
			strItemCount=Browser("micclass:=Browser").Page("micclass:=Page").WebElement("class:=v-filterselect-status").getROProperty("innertext")
			strCurrentItems=Split(split(strItemCount,"/")(0),"-")(1)
			Browser("micclass:=Browser").Page("micclass:=Page").WebElement("html tag:=SPAN","innertext:=Next").Click
			wait 1
		Wend	
		selectItem_Combobox=false
	End Function
	
		'Added by Kalyan 21022017
	Public function selectItem_Combobox1(objComboBox,objComboBox2,strItem)

      Set oDesc=Description.Create
	  oDesc("micclass").Value = "WebElement"
	  oDesc("class").Value = "md-autocomplete-icon.*"
		set lstObj=objComboBox.ChildObjects(oDesc)
		lstObj(0).Click
		wait 1
		lstObj(0).Click
		
		objComboBox2.SetToProperty "Focus",True
		objComboBox2.set strItem
		
		
		'To get unique id for Inpur text field.
		Set oDesc1=Description.Create
	  	'oDesc1("xpath").value="//*[contains(@class,'autocompleteInput')]"
	  	oDesc1("class").Value = "autocompleteInput.*"
	  	Wait 1
		strID=objComboBox.ChildObjects(oDesc1)(0).getroproperty("html id")
		'strID=lstObj(0).ChildObjects(oDesc1)(0).getroproperty("html id")
		'Wait 1
		strID1=Replace(strID,"input","ul")
		
		'Create object with list of content for combo box
		Set oDesc2=Description.Create	  	
	  	oDesc2("html id").value=strID1	  
		set lstComboItems=Browser("micclass:=Browser").Page("micclass:=Page").ChildObjects(oDesc2)
		
		'get Combo box content list
		Set oDescCombo=Description.Create
		oDescCombo("micclass").Value = "WebElement"
		'oDescCombo("class").Value = "md-autocomplete-suggestions.*"
		oDescCombo("class").Value = "suggestion-item.*"		
		'set lstCombo=Browser("micclass:=Browser").Page("micclass:=Page").ChildObjects(oDescCombo)
		set lstCombo=lstComboItems(0).ChildObjects(oDescCombo)
	
		intItems=lstCombo.Count
		For iCount=0 to intItems-1
			Dim strTemp1:strTemp1=""
			strTemp1=lstCombo(iCount).GetRoProperty("text")
			If trim(strTemp1)=trim(strItem) Then
				lstCombo(iCount).click
				LogMessage "RSLT","Verification","Item "&strItem&" selected from combobox sucessfully",true
				selectItem_Combobox1=true
				Exit Function
			End If
			'intItemIndex=intItemIndex+1
		Next
			LogMessage "WARN","Verification","Item "&strItem&" Not found in combobox",false
			selectItem_Combobox1=false
	End Function

'@Function: Get Items List from ComboBox.
	Public Function getItemsList_ComboBox(objComboBox)
		'Content creation to click on drop arrow
		Set oDesc=Description.Create
	  	oDesc("micclass").Value = "WebElement"
	  	oDesc("class").Value = "md-autocomplete-icon.*"
		set lstObj=objComboBox.ChildObjects(oDesc)	
		lstObj(0).Click
		wait 1
		'lstObj(0).Click
		
		'To get unique id for Inpur text field.
		Set oDesc1=Description.Create
	  	
	  	'Modified by  due to UFT Xpath Issue
	  	oDesc1("xpath").value=".//*[contains(@class,'autocompleteInput')]"
	  	Wait 1
	  	
		set lstObj1=objComboBox.ChildObjects(oDesc1)			
		'lstObj1.click
		strID=lstObj1(0).getroproperty("html id")
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
		
		intItems=lstCombo.Count		
		'Get Count of Combo Items
		ReDim arrComboItems(Cint(strTotalItems)-1)
		Dim intItemIndex
		intItemIndex=0
		If strTotalItems=strCurrentItems Then
			ReDim arrComboItems(Cint(intItems)-1)
			For iCount=0 to intItems-1
				strTemp=lstCombo(iCount).GetRoProperty("text")
				arrComboItems(intItemIndex)=strTemp	
				intItemIndex=intItemIndex+1
			Next
		End If
		lstObj(0).Click
		getItemsList_ComboBox=arrComboItems
	End Function
	
	'@Function : Verify Combobox Items
Public function verifyComboboxItems(objComboBox,lstItems,strComboboxName)
   Dim bVerifyDropDownListItems:bVerifyDropDownListItems=true
	arrListItems= getItemsList_ComboBox(objComboBox)

	If not Ubound(arrListItems)=Ubound(lstItems) Then
		LogMessage "RSLT","Verification","Number of Items displayed in drop down list does not matched with expected"
		verifyDropDownListItems=false
		Exit function
	End If
   For iCount=0 to UBound(lstItems)
		strItem=lstItems(iCount)
		If not ArrayFind(arrListItems,strItem) Then
				bVerifyDropDownListItems=false
				LogMessage "RSLT","Verification","Item "&strItem&" does not displayed in Combobox "&strComboboxName,False
		End If
   Next
	verifyComboboxItems=bVerifyDropDownListItems
End Function

	'@Function: Get Selected Item From Combo box
Public Function getVadinCombo_SelectedItem(objVadinCombo)
	If len(objVadinCombo.WebEdit("micclass:=WebEdit").GetRoProperty("value")) = 0 and Not IsNull (objVadinCombo.WebEdit("micclass:=WebEdit").object.getAttribute("placeholder"))  Then
		getVadinCombo_SelectedItem=objVadinCombo.WebEdit("micclass:=WebEdit").object.getAttribute("placeholder")
	Else
		getVadinCombo_SelectedItem=objVadinCombo.WebEdit("micclass:=WebEdit").GetRoProperty("value")
	End If		
   '//*[@id="customer.serviceRequestDetails.assignedToField"]/input
End Function

'@Function : To Verify Selected Item from Combobox
	Public Function  verifyComboSelectItem(objField, strExpectedValue, strFieldName)
	   Dim strObservedValue
	   strObservedValue = getVadinCombo_SelectedItem(objField)
		If  Ucase(Trim(strObservedValue)) = UCase(Trim(strExpectedValue)) Then
			LogMessage "RSLT", "Verification","Field " + strFieldName + " matching with the expected value. Expected: "+ strExpectedValue &" , Actual: "& strObservedValue, True
			verifyComboSelectItem = True
		else
			LogMessage "WARN", "Verification","Field " + strFieldName + " not matching with the expected value. Expected: "+ strExpectedValue &" , Actual: "& strObservedValue, False
			verifyComboSelectItem = False
		End If
	End Function

'@Function : Select Link from Table <Updated By >
Public function selectTableLink(tblHeader,tblContent,lstRowData,strTableName,strColumnName,bPagination,objNext,objNext1,objPrevious)
   Dim bVerifyData,arrColumns,arrValues,intSize
	intSize=Ubound(lstRowData)
	'arrTemp=arrPlanData(iRowCount)
	ReDim arrColumns(intSize)
	ReDim arrValues(intSize)
	For iCount=0 to intSize
		If Instr(lstRowData(iCount),"Time")<>0 or Instr(lstRowData(iCount),"Created On")<>0 or Instr(lstRowData(iCount),"Due Date")<>0 or Instr(lstRowData(iCount),"Created Date")<>0 or Instr(lstRowData(iCount),"Survey Response Date")<>0 or Instr(lstRowData(iCount),"Survey Listing")<>0 or Instr(lstRowData(iCount),"Date and Time")<>0 Then
			strTemp=""
			If lstRowData(iCount)="" Then
				Exit For
			End If
			arrTemp=Split(lstRowData(iCount),":")
			arrColumns(iCount)=arrTemp(0)
			For iTemp=0 to Ubound(arrTemp)
				If arrTemp(iTemp)="Completed Date/Time" or arrTemp(iTemp)="Created Date/Time"  or arrTemp(iTemp)="Created On" or arrTemp(iTemp)="Due Date" or arrTemp(iTemp)="Created Date" or arrTemp(iTemp)="Survey Response Date" or arrTemp(iTemp)="Survey Listing"  or arrTemp(iTemp)="Date and Time" Then
					arrTemp(iTemp)=checkNull(replace(arrTemp(1),"-",":"))
					If strTemp="" Then
						strTemp= checkNull(arrTemp(iTemp))
					else
						strTemp=strTemp &":"& checkNull(arrTemp(iTemp))
					End If
				End If
			Next
				arrValues(iCount)=strTemp
		else
			arrTemp=Split(lstRowData(iCount),":")
			arrColumns(iCount)=arrTemp(0)
			arrValues(iCount)=checkNull(arrTemp(1))
		End If				
	Next
	If bPagination Then
		Do 
			tblContent.RefreshObject
			intRow=getRowForColumns (tblHeader,tblContent,arrColumns, arrValues)
			If not intRow=-1 Then
				Exit Do
			End If
			bNextEnabled =matchStr(objNext1.GetROProperty("class"),"disabled")
			If Not bNextEnabled Then
				objNext.Click
				intTablePage=intTablePage+1
				WaitForICallLoading
			End If
		Loop while Not  bNextEnabled
	else
		intRow=getRowForColumns (tblHeader,tblContent,arrColumns, arrValues)
	End If
	If intRow =-1  Then
		LogMessage "WARN","Verification","Expected "& strTableName &" Data "&ArrayToString(arrValues,",")&" for respective column Names "&ArrayToString(arrColumns,",")&" not found in  "& strTableName &" table",false
		selectTableLink= False
		Exit Function
	else
		LogMessage "RSLT","Verification","Expected  "& strTableName &" Data "&ArrayToString(arrValues,",")&" for respective column Names "&ArrayToString(arrColumns,",")&" found in "& strTableName &" table at Row "&intRow&" on table page number"&intTablePage,true
		bVerifyData= True
	End If
	clickVaddinLink_tblCell tblHeader,tblContent,intRow, strColumnName
	WaitForICallLoading		
	selectTableLink=bVerifyData
End Function

'Added by Kalyan 1701 date 26102016 when column having multiple links
'@Function : Select Link from Table1
		Public function selectTableLinkWithLinkName(tblHeader,tblContent,lstRowData,strTableName,strColumnName,strlnkname,bPagination,objNext,objNext1,objPrevious)
		   Dim bVerifyData,arrColumns,arrValues,intSize
			intSize=Ubound(lstRowData)
			'arrTemp=arrPlanData(iRowCount)
			ReDim arrColumns(intSize)
			ReDim arrValues(intSize)
			For iCount=0 to intSize
				If Instr(lstRowData(iCount),"Time1")<>0 Then
					strTemp=""
					If lstRowData(iCount)="" Then
						Exit For
					End If
					
					arrTemp=Split(lstRowData(iCount),":")
					arrColumns(iCount)=arrTemp(0)
					For iTemp=0 to Ubound(arrTemp)
						If arrTemp(iTemp)="Completed Date/Time" or arrTemp(iTemp)="Created Date/Time" Then
							arrTemp(iTemp)=checkNull(replace(arrTemp(1),"-",":"))
							If strTemp="" Then
								strTemp= checkNull(arrTemp(iTemp))
							else
								strTemp=strTemp &":"& checkNull(arrTemp(iTemp))
							End If
						End If
					Next
						arrValues(iCount)=strTemp
				else
					arrTemp=Split(lstRowData(iCount),":")
					arrColumns(iCount)=arrTemp(0)
					arrValues(iCount)=checkNull(arrTemp(1))
				End If				
			Next
			If bPagination Then
				Do 
					tblContent.RefreshObject
					intRow=getRowForColumns (tblHeader,tblContent,arrColumns, arrValues)
					If not intRow=-1 Then
						Exit Do
					End If
					bNextEnabled =matchStr(objNext1.GetROProperty("class"),"disabled")
					If Not bNextEnabled Then
						objNext.Click
						intTablePage=intTablePage+1
						WaitForICallLoading
					End If
				Loop while Not  bNextEnabled
			else
				intRow=getRowForColumns (tblHeader,tblContent,arrColumns, arrValues)
			End If
			If intRow =-1  Then
				LogMessage "WARN","Verification","Expected "& strTableName &" Data "&ArrayToString(arrValues,",")&" for respective column Names "&ArrayToString(arrColumns,",")&" not found in  "& strTableName &" table",false
				selectTableLink= False
				Exit Function
			else
				LogMessage "RSLT","Verification","Expected  "& strTableName &" Data "&ArrayToString(arrValues,",")&" for respective column Names "&ArrayToString(arrColumns,",")&" found in "& strTableName &" table at Row "&intRow&" on table page number"&intTablePage,true
				bVerifyData= True
			End If
			clickVaddinLink_tblCellLnkName tblHeader,tblContent,intRow, strColumnName, strlnkname
			WaitForICallLoading		
			selectTableLinkWithLinkName=bVerifyData
		End Function

'Function :To Verify Items From Table  <Updated By >
Public function verifyTableContentList(tblHeader,tblContent,lstlstAccountData,strTableName,bPagination,objNext,objNext1,objPrevious)
Dim bVerifyData,arrColumns,arrValues,intSize
intTablePage=0
bVerifyData= True
For iRowCount=0 to Ubound(lstlstAccountData,1)
	intSize=Ubound(lstlstAccountData,2)
	'arrTemp=arrPlanData(iRowCount)
	ReDim arrColumns(intSize)
	ReDim arrValues(intSize)			
	
	For iCount=0 to intSize
	
	If Instr(lstlstAccountData(iRowCount,iCount),"Time")<>0 or Instr(lstlstAccountData(iRowCount,iCount),"Created On")<>0 or Instr(lstlstAccountData(iRowCount,iCount),"Due Date")<>0 or Instr(lstlstAccountData(iRowCount,iCount),"Created Date")<>0 or Instr(lstlstAccountData(iRowCount,iCount),"Survey Response Date")<>0  or Instr(lstlstAccountData(iRowCount,iCount),"Survey Listing")<>0 or Instr(lstlstAccountData(iRowCount,iCount),"Date & Time")<>0 or Instr(lstlstAccountData(iRowCount,iCount),"Date and Time")<>0 or Instr(lstlstAccountData(iRowCount,iCount),"Sent Date")<>0 or Instr(lstlstAccountData(iRowCount,iCount),"Template Id")<>0 or Instr(lstlstAccountData(iRowCount,iCount),"Memo Details")<>0 or Instr(lstlstAccountData(iRowCount,iCount),"Created Date & Time")<>0 or Instr(lstlstAccountData(iRowCount,iCount),"Entered Date & Time")<>0 or Instr(lstlstAccountData(iRowCount,iCount),"Exit Date & Time")<>0 or Instr(lstlstAccountData(iRowCount,iCount),"Survey Listing")<>0 or Instr(lstlstAccountData(iRowCount,iCount),"Created Date/Time")<>0 or Instr(lstlstAccountData(iRowCount,iCount),"Event Date")<>0 or Instr(lstlstAccountData(iRowCount,iCount),"Event Description")<>0 Then
	strTemp=""
	If lstlstAccountData(iRowCount,iCount)="" Then
		Exit For
	End If
	arrTemp=Split(lstlstAccountData(iRowCount,iCount),":")
	arrColumns(iCount)=arrTemp(0)
	For iTemp=0 to Ubound(arrTemp)
		If arrTemp(iTemp)="Completed Date/Time" or arrTemp(iTemp)="Created Date/Time" or arrTemp(iTemp)="Created On" or arrTemp(iTemp)="Due Date" or arrTemp(iTemp)="Created Date" or arrTemp(iTemp)="Survey Response Date" or arrTemp(iTemp)="Survey Listing" or arrTemp(iTemp)="Date and Time" or arrTemp(iTemp)= "Date & Time" or arrTemp(iTemp)= "Payment Due Date" or arrTemp(iTemp)= "Sent Date" or arrTemp(iTemp)= "Template Id" or arrTemp(iTemp)= "Memo Details" or arrTemp(iTemp)= "Created Date & Time" or arrTemp(iTemp)= "Entered Date & Time" or arrTemp(iTemp)= "Exit Date & Time" or arrTemp(iTemp)= "Survey Listing" or arrTemp(iTemp)= "Event Date" or arrTemp(iTemp)= "Event Description" Then
			arrTemp(iTemp)=checkNull(replace(arrTemp(1),"-",":"))
			If strTemp="" Then
				strTemp= checkNull(arrTemp(iTemp))
			else
				strTemp=strTemp &":"& checkNull(arrTemp(iTemp))
			End If
		End If
	Next
		arrValues(iCount)=strTemp
else
		arrTemp=Split(lstlstAccountData(iRowCount,iCount),":")
		arrColumns(iCount)=arrTemp(0)
		arrValues(iCount)=checkNull(arrTemp(1))
	End If
	Next
	If bPagination Then
		Do 
			tblContent.RefreshObject
			intRow=	getRowForColumns (tblHeader,tblContent,arrColumns, arrValues)
			If not intRow=-1 Then
				Exit Do
			End If
			bNextEnabled =matchStr(objNext1.GetROProperty("class"),"disabled")
			If Not bNextEnabled Then
				objNext.Click
				intTablePage=intTablePage+1
				WaitForICallLoading	
			End If
		Loop while Not  bNextEnabled
	else
		intRow=	getRowForColumns(tblHeader,tblContent,arrColumns, arrValues)
	End If
	If intRow =-1  Then
		LogMessage "WARN","Verification","Expected "& strTableName &" Data "&ArrayToString(arrValues,",")&" for respective column Names "&ArrayToString(arrColumns,",")&" not found in  "& strTableName &" table",false
		bVerifyData= False
	else
		LogMessage "RSLT","Verification","Expected  "& strTableName &" Data "&ArrayToString(arrValues,",")&" for respective column Names "&ArrayToString(arrColumns,",")&" found in "& strTableName &" table at Row "&intRow&" on table page number"&intTablePage,true
		'bVerifyData= True
	End If
	If bPagination Then
		For i=0 to intTablePage
			objPrevious.Click
			WaitForIcallLoading
		Next
	End If
Next
verifyTableContentList=bVerifyData
	End Function
	
'Function :To Verify SingleRow data From Table <Updated By >

Public function verifySingleRowDataInTable(tblHeader,tblContent,lstAccountData,strTableName,bPagination,objNext,objNext1,objPrevious)
		Dim bVerifyData,arrColumns,arrValues,intSize
		intTablePage=0
		
			intSize=Ubound(lstAccountData)
			'arrTemp=arrPlanData(iRowCount)
			ReDim arrColumns(intSize)
			ReDim arrValues(intSize)
			For iCount=0 to intSize
			
				If Instr(lstAccountData(iCount),"Time")<>0 or Instr(lstAccountData(iCount),"Created On")<>0 or Instr(lstAccountData(iCount),"Due Date")<>0 or Instr(lstAccountData(iCount),"Created Date")<>0 or Instr(lstAccountData(iCount),"Survey Response Date")<>0 Then
			strTemp=""
			If lstAccountData(iCount)="" Then
				Exit For
			End If
			arrTemp=Split(lstAccountData(iCount),":")
			arrColumns(iCount)=arrTemp(0)
			For iTemp=0 to Ubound(arrTemp)
				If arrTemp(iTemp)="Completed Date/Time" or arrTemp(iTemp)="Created Date/Time" or arrTemp(iTemp)="Created On" or arrTemp(iTemp)="Due Date" or arrTemp(iTemp)="Created Date" or arrTemp(iTemp)="Survey Response Date" Then
					arrTemp(iTemp)=checkNull(replace(arrTemp(1),"-",":"))
					If strTemp="" Then
						strTemp= checkNull(arrTemp(iTemp))
					else
						strTemp=strTemp &":"& checkNull(arrTemp(iTemp))
					End If
				End If
			Next
				arrValues(iCount)=strTemp
		else
			
				arrTemp=Split(lstAccountData(iCount),":")
				arrColumns(iCount)=arrTemp(0)
				arrValues(iCount)=checkNull(arrTemp(1))
				
		End If
			Next
			If bPagination Then
				Do 
					tblContent.RefreshObject
					intRow=	getRowForColumns (tblHeader,tblContent,arrColumns, arrValues)
					If not intRow=-1 Then
						Exit Do
					End If
					bNextEnabled =matchStr(objNext1.GetROProperty("class"),"disabled")
					If Not bNextEnabled Then
						objNext.Click
						intTablePage=intTablePage+1
						WaitForICallLoading
					End If
				Loop while Not  bNextEnabled
			else
				intRow=	getRowForColumns (tblHeader,tblContent,arrColumns, arrValues)
			End If
			If intRow =-1  Then
				LogMessage "WARN","Verification","Expected "& strTableName &" Data "&ArrayToString(arrValues,",")&" for respective column Names "&ArrayToString(arrColumns,",")&" not found in  "& strTableName &" table",false
				bVerifyData= False
			else
				LogMessage "RSLT","Verification","Expected  "& strTableName &" Data "&ArrayToString(arrValues,",")&" for respective column Names "&ArrayToString(arrColumns,",")&" found in "& strTableName &" table at Row "&intRow&" on table page number"&intTablePage,true
				bVerifyData= True
			End If
			If bPagination Then
				For i=0 to intTablePage
					objPrevious.Click
					WaitForIcallLoading
				Next
			End If
	
		verifySingleRowDataInTable=bVerifyData
	End Function

	'@Function : To verify column headers in table
	Public Function verifyTableColumns(objTable,arrColumns)
		Dim intCol,bVerify:bVerify=true
		Dim arrCols
		objTable.RefreshObject
		intCol=objTable.ColumnCount(1)
		ReDim arrCols(intCol)
		For i=1 to intCol
			Dim strColHeader
			
			strColHeader=objTable.GetCellData(1,i)
			arrCols(i)=strColHeader
          Next
		  For iCount=0 to Ubound(arrColumns)
        	 If Not ArrayFind(arrCols,Trim(arrColumns(iCount)) )Then
				bVerify=False
            End if 
		  Next
		  If bVerify Then
			LogMessage "RSLT","Verification","Expected Columns "& ArrayToString(arrColumns,",") &" found in table",true
			verifyTableColumns=true
		  else
			LogMessage "WARN","Verification","Expected Columns "& ArrayToString(arrColumns,",") &" not matched with Actual Columns displayed "&ArrayToString(arrCols,","), false
			verifyTableColumns=False
		  End If
	End Function
	'@Function : To Verify  table cell has link object
	Public Function verifyTableCellHasLink(objTableHeader, objTable,strTableName,strColName,intRow)
		Dim intCol,bVerify:bVerify=False
		intCol=getColIndex (objTableHeader ,strColName)
		'Set objCellItems=objTable.ChildItem(intRow,intCol,"WebElement")
		iObjCount=objTable.ChildItemCount(intRow,intCol,"WebElement")
		For j = 0 to iObjCount - 1
			strClassName=objTable.ChildItem(intRow,intCol, "WebElement", j).getRoProperty("class")
			If instr (1,strClassName,"v-button-link",0) or instr (1,strClassName,"v-button-text-link",0)Then
				If (objTable.ChildItem(intRow,intCol, "WebElement", j).getRoProperty("innertext") =  objTable.GetCellData(intRow,intCol)) Then
                	LogMessage "RSLT","Verification","Text in "&strTableName&" Table Cell for Row "&intRow&" and Column "&strColName&" displayed as Hyper link",true
					bVerify=True
					Exit For
				End If
			End If
		Next
	verifyTableCellHasLink=bVerify
	End Function
	'@Function : To Verify  table cell is disable
	Public Function verifyTableCellDisable(objTableHeader, objTable,strTableName,strColName,intRow)
		Dim intCol,bVerify:bVerify=False
		intCol=getColIndex (objTableHeader ,strColName)
		'Set objCellItems=objTable.ChildItem(intRow,intCol,"WebElement")
		iObjCount=objTable.ChildItemCount(intRow,intCol,"WebElement")
		For j = 0 to iObjCount - 1
			strClassName=objTable.ChildItem(intRow,intCol, "WebElement", j).getRoProperty("class")
			If instr (1,strClassName,"disabled",0) Then
				If (objTable.ChildItem(intRow,intCol, "WebElement", j).getRoProperty("innertext") =  objTable.GetCellData(intRow,intCol)) Then
                	LogMessage "RSLT","Verification","Text in "&strTableName&" Table Cell for Row "&intRow&" and Column "&strColName&" displayed as Hyper link",true
					bVerify=True
					Exit For
				End If
			End If
		Next
	verifyTableCellDisable=bVerify
	End Function
	'@Function : To Verify  table cell has CheckBox object
	Public Function verifyTableCellHasCheckBox(objTableHeader, objTable,strTableName,strColName,intRow)
		Dim intCol,bVerify:bVerify=False
		intCol=getColIndex (objTableHeader ,strColName)
		'Set objCellItems=objTable.ChildItem(intRow,intCol,"WebElement")
		iObjCount=objTable.ChildItemCount(intRow,intCol,"WebElement")
		For j = 0 to iObjCount - 1
			strClassName=objTable.ChildItem(intRow,intCol, "WebElement", j).getRoProperty("class")
			If instr (1,strClassName,"v-checkbox",0) or instr (1,strClassName,"v-checkbox v-widget",0)Then
				If (objTable.ChildItem(intRow,intCol, "WebElement", j).getRoProperty("innertext") =  objTable.GetCellData(intRow,intCol)) Then
                	LogMessage "RSLT","Verification","Text in "&strTableName&" Table Cell for Row "&intRow&" and Column "&strColName&" displayed Check Box",true
					bVerify=True
					Exit For
				End If
			End If
		Next
	verifyTableCellHasCheckBox=bVerify
	End Function
	'@ Function : To Verify Row Count per table page
	Public Function verifyTablePaginationRowCount(objTableHeader,objTableContent,strColumnName,intMaxRowCount)
	   	intRowTemp=getRecordsCountForColumn (objTableHeader,objTableContent,strColumnName)
					'********* To validate total number of record per page.
					If intRowTemp <= intMaxRowCount Then
						LogMessage "RSLT","Verification","Number of records displayed per page matched with expected. Expected Count is less than or equal to "&intMaxRowCount, true
						verifyTablePaginationRowCount=true
					Else
						LogMessage "WARN","Verification","Number of records displayed per page is more than max count "&verifyTablePaginationRowCount&"per page", false
						verifyTablePaginationRowCount=false
					End If

'					'********* To validate next link should not enable if record is less than specified number
'					If intRowTemp < 5 Then
'						bNextPageExist =matchStr(lnkNext1().GetROProperty("outerhtml"),"v-disabled")
'						If Not bNextPageExist Then
'							LogMessage "WARN","Verification","Next link expected to be disable if record is less than 5. Currently it is enable.",false
'							bVerifyAccountSumary=false
'						Else
'							LogMessage "RSLT","Verification","Next link is disabled as per expectation.",true
'							bVerifyAccountSumary=true
'						End If
'					End If
	End Function
'@Function : To verify max row count in table for all pages
	Public Function verifyTableMaxRowCount(tblHeader,tblContent,strColumnName,intMaxRowCount,strTableName,bPagination,lnkNext,lnkNext1,lnkPrevious)
			Dim intRow,intRowtemp
			intRow=0
			bNextPageExist=true
			If bPagination Then
				Do 
					intRowTemp=0
					tblContent.RefreshObject
					Set newTable=tblContent
					intRowTemp=getRecordsCountForColumn (tblHeader,newTable,strColumnName)
					

					intRow=intRow+intRowTemp
					bNextPageExist =matchStr(lnkNext1.GetROProperty("class"),"disabled")
			
							If Not bNextPageExist Then
								lnkNext.Click 
								intTablePage=intTablePage+1
								WaitForICallLoading
							End If
				Loop while Not  bNextPageExist
				
			Else
					intRowTemp=0
					intRowTemp=getRecordsCountForColumn (tblHeader,tblContent,strColumnName)
					intRow=intRow+intRowTemp
			End If
			If CInt(intRow)<= CInt(intMaxRowCount)Then
				LogMessage "RSLT","Verification","Number of recodrs displayed for "&strTableName&" matched with expected, Expecetd Count is "&intMaxRowCount&" and Actual Count is "&intRow,true
				verifyTableMaxRowCount=true
			Else
				LogMessage "WARN","Verification","Number of recodrs displayed for  "&strTableName&" does not matched with expected, Expecetd Count is "&intMaxRowCount&" and Actual Count is "&intRow,false
				verifyTableMaxRowCount=false
			End If
			If bPagination Then
				 For i=0 to intTablePage
						lnkPrevious.Click
						WaitForIcallLoading
				 Next
			End If
	
	End Function
'@Function Select  Table Link and return link text
Public function selectTableLink_getText(tblHeader,tblContent,lstTableRowData,strTableName,strColumnName,bPagination,objNext,objNext1,objPrevious,strLinkClicked)

		   Dim bVerifyData,arrColumns,arrValues,intSize
			intSize=Ubound(lstTableRowData)
			'arrTemp=arrPlanData(iRowCount)
			ReDim arrColumns(intSize)
			ReDim arrValues(intSize)
			For iCount=0 to intSize
'					arrTemp=Split(lstVerificationActivities(iCount),":")
'					arrColumns(iCount)=arrTemp(0)
'					arrValues(iCount)=checkNull(arrTemp(1))

			If Instr(lstTableRowData(iCount),"Time")<>0 Then
				strTemp=""
				If lstVerificationActivities(iCount)="" Then
					Exit For
				End If
				arrTemp=Split(lstTableRowData(iCount),":")
				arrColumns(iCount)=arrTemp(0)
				For iTemp=0 to Ubound(arrTemp)
							
					If arrTemp(iTemp)<>"Completed Date/Time" Then
						If strTemp="" Then
							strTemp= checkNull(arrTemp(iTemp))
						else
							strTemp=strTemp &":"& checkNull(arrTemp(iTemp))
						End If
					End If
				Next
					arrValues(iCount)=strTemp
				else
				arrTemp=Split(lstTableRowData(iCount),":")
				arrColumns(iCount)=arrTemp(0)
				arrValues(iCount)=checkNull(arrTemp(1))
			End If
				
			Next
			If bPagination Then
				Do 
						tblContent.RefreshObject
						intRow=	getRowForColumns (tblHeader,tblContent,arrColumns, arrValues)
					If not intRow=-1 Then
						Exit Do
					End If
					bNextEnabled =matchStr(objNext1.GetROProperty("class"),"disabled")

							If Not bNextEnabled Then
								objNext.Click
								intTablePage=intTablePage+1
								WaitForICallLoading
							End If
					Loop while Not  bNextEnabled
			else
					intRow=	getRowForColumns (tblHeader,tblContent,arrColumns, arrValues)
			End If

		
			If intRow =-1  Then
					LogMessage "WARN","Verification","Expected "& strTableName &" Data "&ArrayToString(arrValues,",")&" for respective column Names "&ArrayToString(arrColumns,",")&" not found in  "& strTableName &" table",false
					bVerifyData= False
				else
						LogMessage "RSLT","Verification","Expected  "& strTableName &" Data "&ArrayToString(arrValues,",")&" for respective column Names "&ArrayToString(arrColumns,",")&" found in "& strTableName &" table at Row "&intRow&" on table page number"&intTablePage,true
					bVerifyData= True
			End If
				'strLinkClicked=getCellTextFor(tblHeader,tblContent,intRow, strColumnName) '*TODO : These two steps needs to be validated******
				strLinkClicked=	getVaddinLink_tblCell(tblHeader,tblContent,intRow, strColumnName)
			clickVaddinLink_tblCell tblHeader,tblContent,intRow,strColumnName
						WaitForICallLoading
					
			selectTableLink_getText=bVerifyData
		End Function
	'@Function : Select  Check Box from SingleTable Row (Single Row)
		Public function selectTableCheckBox(tblHeader,tblContent,lstRowData,strTableName,strColumnName,bPagination,objNext,objNext1,objPrevious)
		   Dim bVerifyData,arrColumns,arrValues,intSize
			intSize=Ubound(lstRowData)
			'arrTemp=arrPlanData(iRowCount)
			ReDim arrColumns(intSize)
			ReDim arrValues(intSize)
			For iCount=0 to intSize
				If Instr(lstRowData(iCount),"Time")<>0 Then
					strTemp=""
					If lstRowData(iCount)="" Then
						Exit For
					End If
					arrTemp=Split(lstRowData(iCount),":")
					arrColumns(iCount)=arrTemp(0)
					For iTemp=0 to Ubound(arrTemp)
						If arrTemp(iTemp)<>"Completed Date/Time" Then
							If strTemp="" Then
								strTemp= checkNull(arrTemp(iTemp))
							else
								strTemp=strTemp &":"& checkNull(arrTemp(iTemp))
							End If
						End If
					Next
						arrValues(iCount)=strTemp
				else
					arrTemp=Split(lstRowData(iCount),":")
					arrColumns(iCount)=arrTemp(0)
					arrValues(iCount)=checkNull(arrTemp(1))
				End If				
			Next
			If bPagination Then
				Do 
					tblContent.RefreshObject
					intRow=	getRowForColumns (tblHeader,tblContent,arrColumns, arrValues)
					If not intRow=-1 Then
						Exit Do
					End If
					bNextEnabled =matchStr(objNext1.GetROProperty("class"),"disabled")
					If Not bNextEnabled Then
						objNext.Click
						intTablePage=intTablePage+1
						WaitForICallLoading
					End If
				Loop while Not  bNextEnabled
			else
				intRow=	getRowForColumns (tblHeader,tblContent,arrColumns, arrValues)
			End If
			If intRow =-1  Then
				LogMessage "WARN","Verification","Expected "& strTableName &" Data "&ArrayToString(arrValues,",")&" for respective column Names "&ArrayToString(arrColumns,",")&" not found in  "& strTableName &" table",false
				selectTableCheckBox= False
				Exit Function
			else
				LogMessage "RSLT","Verification","Expected  "& strTableName &" Data "&ArrayToString(arrValues,",")&" for respective column Names "&ArrayToString(arrColumns,",")&" found in "& strTableName &" table at Row "&intRow&" on table page number"&intTablePage,true
				bVerifyData= True
			End If
			clickVaddinCheckBox_tblCell tblHeader,tblContent,intRow, strColumnName
			WaitForICallLoading		
			selectTableCheckBox=bVerifyData
		End Function


		'@Function : Verify Check Box from SingleTable Row (Single Row)
		Public function verifyCheckBoxEnabled_tblCell(tblHeader,tblContent,lstRowData,strTableName,strColumnName,bPagination,objNext,objNext1,objPrevious)
		   Dim bVerifyData,arrColumns,arrValues,intSize
			'intSize=Ubound(lstRowData)
			intSize=Ubound(lstRowData)
			'arrTemp=arrPlanData(iRowCount)
			ReDim arrColumns(intSize)
			ReDim arrValues(intSize)
			For iCount=0 to intSize
				If Instr(lstRowData(iCount),"Time")<>0 Then
					strTemp=""
					If lstRowData(iCount)="" Then
						Exit For
					End If
					arrTemp=Split(lstRowData(iCount),":")
					arrColumns(iCount)=arrTemp(0)
					For iTemp=0 to Ubound(arrTemp)
						If arrTemp(iTemp)<>"Completed Date/Time" Then
							If strTemp="" Then
								strTemp= checkNull(arrTemp(iTemp))
							else
								strTemp=strTemp &":"& checkNull(arrTemp(iTemp))
							End If
						End If
					Next
						arrValues(iCount)=strTemp
				else
					arrTemp=Split(lstRowData(iCount),":")
					arrColumns(iCount)=arrTemp(0)
					arrValues(iCount)=checkNull(arrTemp(1))
				End If				
			Next
			If bPagination Then
				Do 
					tblContent.RefreshObject
					intRow=	getRowForColumns (tblHeader,tblContent,arrColumns, arrValues)
					If not intRow=-1 Then
						Exit Do
					End If
					bNextEnabled =matchStr(objNext1.GetROProperty("class"),"disabled")
					If Not bNextEnabled Then
						objNext.Click
						intTablePage=intTablePage+1
						WaitForICallLoading
					End If
				Loop while Not  bNextEnabled
			else
				intRow=getRowForColumns (tblHeader,tblContent,arrColumns, arrValues)
			End If
			If intRow =-1  Then
				LogMessage "WARN","Verification","Expected "& strTableName &" Data "&ArrayToString(arrValues,",")&" for respective column Names "&ArrayToString(arrColumns,",")&" not found in  "& strTableName &" table",false
				selectTableLink= False
				Exit Function
			else
				LogMessage "RSLT","Verification","Expected  "& strTableName &" Data "&ArrayToString(arrValues,",")&" for respective column Names "&ArrayToString(arrColumns,",")&" found in "& strTableName &" table at Row "&intRow&" on table page number"&intTablePage,true
				bVerifyData= True
			End If
			bVerifyData=getCheckBoxStatusEnabled_tblCell (tblHeader,tblContent,intRow, strColumnName)
			WaitForICallLoading		
			verifyCheckBoxEnabled_tblCell=bVerifyData
		End Function


		'Function :Select  Check Box from MultipleTable Row 
	Public function selectTableCheckBox_MultipleRow(tblHeader,tblContent,lstlstAccountData,strTableName,strColumnName,bPagination,objNext,objNext1,objPrevious)
		Dim bVerifyData,arrColumns,arrValues,intSize
		intTablePage=0
		For iRowCount=0 to Ubound(lstlstAccountData,1)
			intSize=Ubound(lstlstAccountData,2)
			'arrTemp=arrPlanData(iRowCount)
			ReDim arrColumns(intSize)
			ReDim arrValues(intSize)
			For iCount=0 to intSize
				arrTemp=Split(lstlstAccountData(iRowCount,iCount),":")
				arrColumns(iCount)=arrTemp(0)
				arrValues(iCount)=checkNull(arrTemp(1))
			Next
			If bPagination Then
				Do 
					tblContent.RefreshObject
					intRow=	getRowForColumns (tblHeader,tblContent,arrColumns, arrValues)
					If not intRow=-1 Then
						Exit Do
					End If
					bNextEnabled =matchStr(objNext1.GetROProperty("class"),"disabled")
					If Not bNextEnabled Then
						objNext.Click
						intTablePage=intTablePage+1
						WaitForICallLoading
					End If
				Loop while Not  bNextEnabled
			else
				intRow=	getRowForColumns (tblHeader,tblContent,arrColumns, arrValues)
			End If
			If intRow =-1  Then
				LogMessage "WARN","Verification","Expected "& strTableName &" Data "&ArrayToString(arrValues,",")&" for respective column Names "&ArrayToString(arrColumns,",")&" not found in  "& strTableName &" table",false
				bVerifyData= False
			else
				LogMessage "RSLT","Verification","Expected  "& strTableName &" Data "&ArrayToString(arrValues,",")&" for respective column Names "&ArrayToString(arrColumns,",")&" found in "& strTableName &" table at Row "&intRow&" on table page number"&intTablePage,true
				bVerifyData= True
				clickVaddinCheckBox_tblCell tblHeader,tblContent,intRow, strColumnName
				WaitForICallLoading	
			End If
			If bPagination Then
				For i=0 to intTablePage
					objPrevious.Click
					WaitForIcallLoading
				Next
			End If
		Next
		selectTableCheckBox_MultipleRow=bVerifyData
	End Function

'Function :To get Cell values from a column which matches values in other column
	Public function getCellTextForMatchingColumnValues(tblHeader,tblContent,strColumnToGetText,strColumnToMatchText,strColumnTextToMatch,bPagination,objNext,objNext1,objPrevious)
		
		intTablePage=0
		Dim strAllRowText:strAllRowText=""
		If bPagination Then
			Do 
				intTblRowCount=getRecordsCountForColumn (tblHeader,tblContent,strColumnToMatchText)
		
				For iRowCount=1 to intTblRowCount
					strColumnText=getCellTextFor(tblHeader,tblContent,iRowCount, strColumnToMatchText) 
					If Ucase(Trim(strColumnText))=Ucase(Trim(strColumnTextToMatch)) Then
						strCellTextToRead=getCellTextFor(tblHeader,tblContent,iRowCount, strColumnToGetText) 
						If iRowCount=1 Then
							strAllRowText=strCellTextToRead
						 else
								strAllRowText=strAllRowText&"|"&strCellTextToRead
						End If
					End If
				Next			
            	bNextEnabled =matchStr(objNext1.GetROProperty("class"),"disabled")
					If Not bNextEnabled Then
						objNext.Click
						intTablePage=intTablePage+1
						WaitForICallLoading
					End If
			Loop while Not  bNextEnabled
		else
				intTblRowCount=getRecordsCountForColumn (tblHeader,tblContent,strColumnToMatchText)
		
				For iRowCount=1 to intTblRowCount
					strColumnText=getCellTextFor(tblHeader,tblContent,iRowCount, strColumnToMatchText) 
					If Ucase(Trim(strColumnText))=Ucase(Trim(strColumnTextToMatch)) Then
						strCellTextToRead=getCellTextFor(tblHeader,tblContent,iRowCount, strColumnToGetText) 
						If iRowCount=1 Then
							strAllRowText=strCellTextToRead
						 else
								strAllRowText=strAllRowText&"|"&strCellTextToRead
						End If
					End If
				Next			
		End If

            If bPagination Then
				For i=0 to intTablePage
					objPrevious.Click
					WaitForIcallLoading
				Next
			End If
		
		getCellTextForMatchingColumnValues=strAllRowText
	End Function


 Public Function SelectRadioButtonGrp(strItem, objRadioButtons, arrayOptions)
 'Public Function SelectRadioButtonGrp(strItem, arrayOptions)
	Dim oDesc, oChild, allItems
	Set oDesc=Description.Create()
	oDesc("micclass").Value="WebElement"
	Set oChild=objRadioButtons.ChildObjects(oDesc)

	allItems = oChild.Count
	SelectRadioButtonGrp=false
	For i = 0 to allItems-1
		If (trim(oChild(i).getroproperty("innertext"))=trim(strItem)) Then
			oChild(i).Click
			SelectRadioButtonGrp=true
			Exit Function
		End If
	Next	
'		print oChild.Item(i).GetRoProperty("innertext")
'		print trim(oChild.Item(i).GetRoProperty("micclass"))
'		If (trim(oChild.Item(i).GetRoProperty("innertext"))=strItem) Then
'			If oChild.Item(i).GetRoProperty("class")="md-radio-button" Then
'				If (trim(oChild.Item(i+1).GetRoProperty("micclass"))="WebElement") Then
'					'Dim arrayOptions
'					'arrayOptions = array("Yes", "No")
'					' i+1 is used as we have the radiobutton grp at  +1 level
'					
'					selectRadioGroup oChild.Item(i+1), strItem, arrayOptions
'					
'
'				End If
'				If Ucase(gstrBrowser)="CHROME" Then '23-10-2013 ***Changed to handle Chrome - 
'						selectRadioGroup oChild.Item(1), strItem, arrayOptions
'				End If
'				bDisabled=true
'			End If
'		End If
'	
'	Next
	'SelectRadioButtonGrp=bDisabled
 End Function

  Public Function VerifyRadioButtonGrpSelection(strItem, objRadioButtons, arrayOptions)
 'Public Function SelectRadioButtonGrp(strItem, arrayOptions)
	Dim oDesc, oChild, allItems, iIndex, iSelectedIndex, bVerified
	Set oDesc=Description.Create()
	oDesc("micclass").Value="WebElement"
	Set oChild=objRadioButtons.ChildObjects(oDesc)

	allItems = oChild.Count
	bVerified=false
	For i = 0 to allItems-1
		If (trim(oChild(i).getroproperty("innertext"))=trim(strItem)) Then
			If matchstr(oChild(i).GetRoProperty("class"),"md-checked") Then
				bVerified=true			
			End If
		End if		
	Next	
'		print oChild.Item(i).GetRoProperty("innertext")
'		print trim(oChild.Item(i).GetRoProperty("micclass"))
'		If (oChild.Item(i).GetRoProperty("innertext")=strItem) Then
'			If matchstr(oChild.Item(i).GetRoProperty("class"),"ng-scope") Then
'				
'				If Ucase(gstrBrowser)="CHROME" Then '23-10-2013 ***Changed to handle Chrome - 
'				
'					iSelectedIndex =  oChild.Item(1).GetRoProperty("selected item index")
'					iIndex= IndexOf(arrayOptions, strItem)
'					iIndex = iIndex+1
'				else 
'					'If (trim(oChild.Item(i+1).GetRoProperty("micclass"))="WebRadioGroup") Then
'
'					iSelectedIndex =  oChild.Item(i+1).GetRoProperty("selected item index")
'					iIndex= IndexOf(arrayOptions, strItem)
'					iIndex = iIndex+1
'					
'				End If
'				If cstr(iIndex) =  cstr(iSelectedIndex) Then
'					bVerified = true
'				End If			
'			End If
'		End If
	
	'Next
	VerifyRadioButtonGrpSelection=bVerified
 End Function

'@Function: Select SubMenu Item from table cell  and check if sub menu is disabled
Public Function selectSubMenuItem_tblCell(objTableHeader,objTable,intRow, strColName,strItem,bMenuDisabled)
    Dim intCol
	intCol=getColIndex (objTableHeader ,strColName)
	'Set objCellItems=objTable.ChildItem(intRow,intCol,"WebElement")
	'iObjCount=objTable.ChildItemCount(intRow,intCol,"WebElement")
	'set objCountInCell=getCellObject(objTableHeader,objTable,intRow,strColName,"md-no-margin md-menu ng-scope")
	set objCountInCell=getCellObject(objTableHeader,objTable,intRow,strColName,"md-menu")
	iObjCount=objCountInCell.count
	Set oDesc=Description.Create
	oDesc("micclass").Value = "WebElement"
	'oDesc("class").Value = "v-menubar-menuitem-caption"
	'oDesc("class").Value = "v-menubar-menuitem.*"
	oDesc("class").Value = "menu-list md-margin"
	
	For j = 0 to iObjCount - 1
		'strClassName=objTable.ChildItem(intRow,intCol, "WebElement", j).getRoProperty("class")
		strClassName=objCountInCell(j).getRoProperty("class")
		'If instr (1,strClassName,"md-no-margin md-menu ng-scope",0) Then
		If instr (1,strClassName,"md-menu",0) Then
		Set oDescAction=Description.Create
		oDescAction("micclass").Value = "WebElement"
		oDescAction("class").Value = ".*md-menu-link.*"
		'changed by Sunil for temporary use
		'oDescAction("class").Value = ".*md-button"
		
		Wait 2
		Set objAction=objCountInCell(j).ChildObjects(oDescAction)
			'objTable.ChildItem(intRow,intCol, "WebElement", j).Click
			Wait 2
			objAction(0).Click
			'objCountInCell(j).click
			'set lstSubMenu=Browser("micclass:=Browser").Page("micclass:=Page").ChildObjects(oDesc)
			Set oMenuPopupDesc=Description.Create	
			oMenuPopupDesc("micclass").Value = "WebElement"
	  		oMenuPopupDesc("class").Value = "popupForm"
			set oSubMenupopup=Browser("micclass:=Browser").Page("micclass:=Page").ChildObjects(oMenuPopupDesc)			
			
			
			Set oMenuDesc=Description.Create	
			oMenuDesc("micclass").Value = "WebElement"
	  		oMenuDesc("class").Value = "menu-list.*"
			'set oSubMenu=Browser("micclass:=Browser").Page("micclass:=Page").ChildObjects(oMenuDesc)
			set oSubMenu=oSubMenupopup(0).ChildObjects(oMenuDesc)
			
			Set oMenuItem=Description.Create	
			oMenuItem("micclass").Value = "WebElement"
			
			'The below one is changed for the temporary purpose
			'oMenuItem("class").Value = ".*flex"
	  		oMenuItem("class").Value = "md-button.*"
	  		
	  	
		  	set lstSubMenu=oSubMenu(0).ChildObjects(oMenuItem)
	  		
			'set lstSubMenu=objTable.ChildObjects(oDesc)
			intItems=lstSubMenu.Count
			For iCount=0 to intItems-1
				Dim strTemp:strTemp=""
				strTemp=lstSubMenu(iCount).GetRoProperty("text")
				If strTemp=strItem Then
					'Check the link enabled or disabled
					bDisabled =InStr(lstSubMenu(iCount).GetROProperty("class"),"disabled-area")
    				If bDisabled <>0Then
						LogMessage "WARN","Verification","Sub Menu Icon is disabled in Row Number ",True
						bMenuDisabled=True
						selectSubMenuItem_tblCell=true
						Exit Function
					Else
						bMenuDisabled=False
						LogMessage "INFO","Verification","Sub Menu  is enabled in Row Number"&intRow,True
						lstSubMenu(iCount).click
						WaitForICallLoading
						LogMessage "RSLT","Verification","Item "&strItem&" selected from Submenu sucessfully. Item Index is "& intItemIndex,true
						selectSubMenuItem_tblCell=true
						Exit Function
					 End If
				End If
				intItemIndex=intItemIndex+1
			Next
    	End If
	Next
	set oDesc=nothing
	LogMessage "RSLT","Verification","Item "&strItem&" not found in  Submenu.",false
	selectSubMenuItem_tblCell=False
End Function

'@Function : Select  SubMenu Item from SingleTable Row 
Public function selectTableSubMenu(tblHeader,tblContent,lstRowData,strTableName,strColumnName,bPagination,objNext,objNext1,objPrevious,strSubMenuItem,bMenuDisabled)
   Dim bVerifyData,arrColumns,arrValues,intSize
	intSize=Ubound(lstRowData)
	'arrTemp=arrPlanData(iRowCount)
	ReDim arrColumns(intSize)
	ReDim arrValues(intSize)
	For iCount=0 to intSize
		If Instr(lstRowData(iCount),"Time")<>0 Then
			strTemp=""
			If lstRowData(iCount)="" Then
				Exit For
			End If
			arrTemp=Split(lstRowData(iCount),":")
			arrColumns(iCount)=arrTemp(0)
			For iTemp=0 to Ubound(arrTemp)
				If arrTemp(iTemp)<>"Completed Date/Time" Then
					If strTemp="" Then
						strTemp= checkNull(arrTemp(iTemp))
					else
						strTemp=strTemp &":"& checkNull(arrTemp(iTemp))
					End If
				End If
			Next
				arrValues(iCount)=strTemp
		else
			arrTemp=Split(lstRowData(iCount),":")
			arrColumns(iCount)=arrTemp(0)
			arrValues(iCount)=checkNull(arrTemp(1))
		End If				
	Next
	Dim iPageCounter:iPageCounter = 1
	If bPagination Then
		Do 
			iPageCounter = iPageCounter+1
			tblContent.RefreshObject
			intRow=	getRowForColumns (tblHeader,tblContent,arrColumns, arrValues)
			If not intRow=-1 Then
			'If intRow=-1 Then
				Exit Do
			End If
			bNextEnabled =matchStr(objNext1.GetROProperty("class"),"disabled")
			'bNextEnabled =matchStr(objNext.GetROProperty("class"),"v-disabled")
			If Not bNextEnabled Then
				objNext.Click
				intTablePage=intTablePage+1
				WaitForICallLoading
			End If
			If iPageCounter = 50 Then
				print "Exit the loop for function selectTableSubMenu after 50 attempts"
				Exit Do
			End If
		Loop while Not  bNextEnabled
	else
		intRow=	getRowForColumns (tblHeader,tblContent,arrColumns, arrValues)
	End If
	If intRow =-1  Then
		LogMessage "WARN","Verification","Expected "& strTableName &" Data "&ArrayToString(arrValues,",")&" for respective column Names "&ArrayToString(arrColumns,",")&" not found in  "& strTableName &" table",false
		selectTableSubMenu= False
		Exit Function
	else
		LogMessage "RSLT","Verification","Expected  "& strTableName &" Data "&ArrayToString(arrValues,",")&" for respective column Names "&ArrayToString(arrColumns,",")&" found in "& strTableName &" table at Row "&intRow&" on table page number"&intTablePage,true
		bVerifyData= True
	End If
	bVerifyData=selectSubMenuItem_tblCell( tblHeader,tblContent,intRow, strColumnName,strSubMenuItem,bMenuDisabled)
	WaitForICallLoading		
	selectTableSubMenu=bVerifyData
End Function
 Public Function VerifyObjectEnable(objTobeVerified, strValue)
  
   strValue = ucase(strValue)
	bVerifyObjectEnable=true
    If not IsNull (strValue) Then
		Select Case strValue
			Case "ENABLE"
				 strValue=objTobeVerified.GetROProperty("class")
				 If inStr(strValue,"disabled-area") = 0 Then
					 'LogMessage "WARN","Verification","Postal Code is enable as expected",true
					 else
					 'LogMessage "WARN","Verification","Object is not enable",false
					 bVerifyObjectEnable=false
				 End If
			Case "DISABLE"
				strValue=objTobeVerified.GetROProperty("class")
				 If inStr(strValue,"disabled-area") <> 0 Then
					 'LogMessage "WARN","Verification","Postal Code is disable as expected",true
					 else
					  'LogMessage "WARN","Verification","Object is not disable",false
					 bVerifyObjectEnable=false
				 End If
		End Select
	end if
	If Err.Number<>0 Then
       bVerifyObjectEnable=false
          LogMessage "WARN","Verification","Failed verify the object state" ,false
       Exit Function
   End If
   VerifyObjectEnable=bVerifyObjectEnable
End Function
'@Function : Verify Table Cell is disable (Single Row)
		Public function verifyCellDisable_tblCell(tblHeader,tblContent,lstRowData,strTableName,strColumnName,bPagination,objNext,objNext1,objPrevious)
		   Dim bVerifyData,arrColumns,arrValues,intSize
			intSize=Ubound(lstRowData)
			'arrTemp=arrPlanData(iRowCount)
			ReDim arrColumns(intSize)
			ReDim arrValues(intSize)
			For iCount=0 to intSize
				If Instr(lstRowData(iCount),"Time")<>0 Then
					strTemp=""
					If lstRowData(iCount)="" Then
						Exit For
					End If
					arrTemp=Split(lstRowData(iCount),":")
					arrColumns(iCount)=arrTemp(0)
					For iTemp=0 to Ubound(arrTemp)
						If arrTemp(iTemp)<>"Completed Date/Time" Then
							If strTemp="" Then
								strTemp= checkNull(arrTemp(iTemp))
							else
								strTemp=strTemp &":"& checkNull(arrTemp(iTemp))
							End If
						End If
					Next
						arrValues(iCount)=strTemp
				else
					arrTemp=Split(lstRowData(iCount),":")
					arrColumns(iCount)=arrTemp(0)
					arrValues(iCount)=checkNull(arrTemp(1))
				End If				
			Next
			If bPagination Then
				Do 
					tblContent.RefreshObject
					intRow=	getRowForColumns (tblHeader,tblContent,arrColumns, arrValues)
					If not intRow=-1 Then
						Exit Do
					End If
					bNextEnabled =matchStr(objNext1.GetROProperty("class"),"disabled")
					If Not bNextEnabled Then
						objNext.Click
						intTablePage=intTablePage+1
						WaitForICallLoading
					End If
				Loop while Not  bNextEnabled
			else
				intRow=getRowForColumns (tblHeader,tblContent,arrColumns, arrValues)
			End If
			If intRow =-1  Then
				LogMessage "WARN","Verification","Expected "& strTableName &" Data "&ArrayToString(arrValues,",")&" for respective column Names "&ArrayToString(arrColumns,",")&" not found in  "& strTableName &" table",false
				selectTableLink= False
				Exit Function
			else
				LogMessage "RSLT","Verification","Expected  "& strTableName &" Data "&ArrayToString(arrValues,",")&" for respective column Names "&ArrayToString(arrColumns,",")&" found in "& strTableName &" table at Row "&intRow&" on table page number"&intTablePage,true
				bVerifyData= True
			End If
			
			bVerifyData=verifyTableCellDisable(tblHeader,tblContent,strTableName,strColumnName,intRow)
			WaitForICallLoading		
			verifyCellDisable_tblCell=bVerifyData
		End Function
		
'@Function : Select date for Calendar Picker        
Public Function selectDateFromCalendar(objCalendar,strDate)
    selectDateFromCalendar=true
    
    arrDate = split(strDate," ")
    strDay=arrDate(0)
    strMonth=arrDate(1)
    strYear=arrDate(2)
    
    objCalendar.Click    
    
    'To get calendar on page
    Set oDesc1=Description.Create
    'oDesc1("class").Value="date-control"
    'Set objCalendar=Browser("micclass:=Browser").Page("micclass:=Page").ChildObjects(oDesc1)
    
    
    '**** changed for opportunity
    oDesc1("class").Value="date-control.*"
    Set objCalendar=Browser("micclass:=Browser").Page("micclass:=Page").ChildObjects(oDesc1)
    'Set objCalendar=Browser("Browser_iCall_Home").Page("iCall_Opportunity").ChildObjects(oDesc1)
    
    'To Change Year
    Set oDesc2=Description.Create
    oDesc2("class").Value="year-part.*"
    Set objYear=objCalendar(0).ChildObjects(oDesc2)
    objYear(0).set strYear
    
    'To Change Month
    Set oDes3=Description.Create
    oDes3("class").Value="month-part.*"
    Set objMonth=objCalendar(0).ChildObjects(oDes3)
    
    Set oDesc4=Description.Create
    oDesc4("class").Value="monthlist.*"
    Set objMonthList=objMonth(0).ChildObjects(oDesc4)
    objMonthList(0).click
    'Wait 1
    
    Set objKey = CreateObject("WScript.Shell")
    objKey.SendKeys strMonth
    'Wait 1
    objKey.SendKeys "{ENTER}"
    
    'To Create date collection
    Set oDesc=Description.Create
    oDesc("class").Value="days"
    Set objDateCollection=objCalendar(0).ChildObjects(oDesc)
    
    'To Change Day
    Set oDesc=Description.Create
    oDesc("class").Value="day-cell md-button md-ink-ripple.*"
    Set objDateCollection=objDateCollection(0).ChildObjects(oDesc)
    intTabCount=objDateCollection.count
    For iCount=0 to intTabCount-1 
        strCalendarvalue=objDateCollection(iCount).GetRoProperty("innerText")
        If strCalendarvalue=strDay Then
            objDateCollection(iCount).Click
            Exit Function
        End If
    Next
    selectDateFromCalendar=false    
End Function

'*****************************************************************************************************************************************************************************************

Public Function recoverCardsUsed()
		'Activate Blocked cards
		 ActivateMultipleBlockedCards() 'KRSP
		 ' Add for V+
		 unblockMultipleCards_VPlus()
	
		'Recover New PIN Data by removing from xped 5.1.2
		RecoverDATA_NewPIN_KRSP (null)
End Function

'************* The below function is to check Maintenance Link is disabled on SI Screen
Public function selectTableSubMenu_ForDisabled(tblHeader,tblContent,lstRowData,strTableName,strColumnName,bPagination,objNext,objNext1,objPrevious,strSubMenuItem,bMenuDisabled)
   Dim bVerifyData,arrColumns,arrValues,intSize
	intSize=Ubound(lstRowData)
	'arrTemp=arrPlanData(iRowCount)
	ReDim arrColumns(intSize)
	ReDim arrValues(intSize)
	For iCount=0 to intSize
		If Instr(lstRowData(iCount),"Time")<>0 Then
			strTemp=""
			If lstRowData(iCount)="" Then
				Exit For
			End If
			arrTemp=Split(lstRowData(iCount),":")
			arrColumns(iCount)=arrTemp(0)
			For iTemp=0 to Ubound(arrTemp)
				If arrTemp(iTemp)<>"Completed Date/Time" Then
					If strTemp="" Then
						strTemp= checkNull(arrTemp(iTemp))
					else
						strTemp=strTemp &":"& checkNull(arrTemp(iTemp))
					End If
				End If
			Next
				arrValues(iCount)=strTemp
		else
			arrTemp=Split(lstRowData(iCount),":")
			arrColumns(iCount)=arrTemp(0)
			arrValues(iCount)=checkNull(arrTemp(1))
		End If				
	Next
	Dim iPageCounter:iPageCounter = 1
	If bPagination Then
		Do 
			iPageCounter = iPageCounter+1
			tblContent.RefreshObject
			intRow=	getRowForColumns (tblHeader,tblContent,arrColumns, arrValues)
			If not intRow=-1 Then
			'If intRow=-1 Then
				Exit Do
			End If
			bNextEnabled =matchStr(objNext1.GetROProperty("class"),"disabled")
			'bNextEnabled =matchStr(objNext.GetROProperty("class"),"v-disabled")
			If Not bNextEnabled Then
				objNext.Click
				intTablePage=intTablePage+1
				WaitForICallLoading
			End If
			If iPageCounter = 50 Then
				print "Exit the loop for function selectTableSubMenu after 50 attempts"
				Exit Do
			End If
		Loop while Not  bNextEnabled
	else
		intRow=	getRowForColumns (tblHeader,tblContent,arrColumns, arrValues)
	End If
	If intRow =-1  Then
		LogMessage "WARN","Verification","Expected "& strTableName &" Data "&ArrayToString(arrValues,",")&" for respective column Names "&ArrayToString(arrColumns,",")&" not found in  "& strTableName &" table",false
		selectTableSubMenu= False
		Exit Function
	else
		LogMessage "RSLT","Verification","Expected  "& strTableName &" Data "&ArrayToString(arrValues,",")&" for respective column Names "&ArrayToString(arrColumns,",")&" found in "& strTableName &" table at Row "&intRow&" on table page number"&intTablePage,true
		bVerifyData= True
	End If
	bVerifyData=selectSubMenuItem_tblCell_ForDisabled( tblHeader,tblContent,intRow, strColumnName,strSubMenuItem,bMenuDisabled)
	WaitForICallLoading		
	selectTableSubMenu_ForDisabled=bVerifyData
End Function

'******* The sub menu function which actually checks if the sub menu is disabled or enabled (e.g. for Terminated SI)
Public Function selectSubMenuItem_tblCell_ForDisabled(objTableHeader,objTable,intRow, strColName,strItem,bMenuDisabled)
    selectSubMenuItem_tblCell_ForDisabled = True
    Dim intCol
	intCol=getColIndex (objTableHeader ,strColName)
	'Set objCellItems=objTable.ChildItem(intRow,intCol,"WebElement")
	'iObjCount=objTable.ChildItemCount(intRow,intCol,"WebElement")
	'set objCountInCell=getCellObject(objTableHeader,objTable,intRow,strColName,"md-no-margin md-menu ng-scope")
	set objCountInCell=getCellObject(objTableHeader,objTable,intRow,strColName,"md-menu")
	iObjCount=objCountInCell.count
	Set oDesc=Description.Create
	oDesc("micclass").Value = "WebElement"
	'oDesc("class").Value = "v-menubar-menuitem-caption"
	'oDesc("class").Value = "v-menubar-menuitem.*"
	oDesc("class").Value = "menu-list md-margin"
	
	For j = 0 to iObjCount - 1
		'strClassName=objTable.ChildItem(intRow,intCol, "WebElement", j).getRoProperty("class")
		strClassName=objCountInCell(j).getRoProperty("class")
		'If instr (1,strClassName,"md-no-margin md-menu ng-scope",0) Then
		If instr (1,strClassName,"md-menu",0) Then
			Set oDescAction=Description.Create
			oDescAction("micclass").Value = "WebElement"
			'updated the class.value for the menu link by  on 15th'Feb17
			'oDescAction("class").Value = "md-no-margin md-no-padding md-button"
			oDescAction("class").Value = ".*md-menu-link.*"
			Wait 2
			Set objAction=objCountInCell(j).ChildObjects(oDescAction)
				'objTable.ChildItem(intRow,intCol, "WebElement", j).Click
				objAction(0).Click
				'objCountInCell(j).click
				'set lstSubMenu=Browser("micclass:=Browser").Page("micclass:=Page").ChildObjects(oDesc)
				Set oMenuDesc=Description.Create	
				oMenuDesc("micclass").Value = "WebElement"
		  		'oMenuDesc("class").Value = "menu-list md-margin"
		  		oMenuDesc("class").Value = "menu-list.*"
				set oSubMenu=Browser("micclass:=Browser").Page("micclass:=Page").ChildObjects(oMenuDesc)
				
				'Check if the object oSubMenu has the class "disabled-area";if so then the link should be disalbed
				strClass = oSubMenu(0).GetRoProperty("class")
				If instr(strClass,"disabled-area") <> 0 Then
					'also check if the expected is disabled or not
					If not bMenuDisabled Then
						LogMessage "RSLT", "Verification","The Maintenance Link is disabled as expected",True
						selectSubMenuItem_tblCell_ForDisabled = True
					Else
						LogMessage "WARN", "Verification","The Maintenance Link is disabled but is expected to be enabled.",False
						selectSubMenuItem_tblCell_ForDisabled=False
					End If
					Exit Function
				Else
					'the link is enabled
					If bMenuDisabled Then
						LogMessage "RSLT", "Verification","The Maintenance Link is disabled as expected",True
						selectSubMenuItem_tblCell_ForDisabled = True
					Else
						LogMessage "WARN", "Verification","The Maintenance Link is enabled but is expected to be disabled.",False
						selectSubMenuItem_tblCell_ForDisabled=False
					End If
				End If
    	End If
	Next

End Function

'Added by Kalyan dated 18/08
Public Function DragItemFromWindowsExplorerToIe(FilePath, DropAreaObject, lstComments)
		title = Browser("Browser_iCall_Home").GetROProperty("title")
	    Window("micclass:=Window", "text:=" & title & ".*").Activate
	    strFolderPath="D:\iserve_testing\Automation\OBTAF\Attachments"
	    lstCount = Ubound(FilePath)
	    'Step 1
	    For it = 0 To lstCount Step 1
		'Creating file system object
		Set fso = CreateObject("Scripting.FileSystemObject")
		'Checking if file exist
		FilePathlst=strFolderPath + "\" + FilePath(it)
		If fso.FileExists(FilePathlst) Then

		'Creating Windows forms control object
		Set ctlr = DotNetFactory.CreateInstance("System.Windows.Forms.Control")
		FolderPath = fso.GetParentFolderName(FilePathlst)
		FolderPathArray = Split(FolderPath, "\")
		FolderName = FolderPathArray(UBound(FolderPathArray))
		FileName = fso.GetFileName(FilePathlst)
		
		
		'Adding description for Folder Window
		Set ExplorerWindowDesc = Description.Create
		ExplorerWindowDesc("micclass").Value = "Window"
		ExplorerWindowDesc("regexpwndtitle").Value = FolderName
		ExplorerWindowDesc("text").Value = FolderName
		ExplorerWindowdesc("Location").Value = 0
		ExplorerWindowDesc("regexpwndclass").Value = "CabinetWClass"
		Set ExplorerWindow = Window(ExplorerWindowDesc)

		'Opening the folder path
		SystemUtil.Run FolderPath,"","","explore"

		'Resizing and moving the folder window
		ExplorerWindow.Resize 600,700
		ExplorerWindow.Move 0,0
		Wait 3
		
		Set FileToDrag = ExplorerWindow.WinObject("nativeclass:=window", "acc_name:=Items View").WinList("nativeclass:=list", "acc_name:=Items View")
		FileToDrag.Select FileName
		FilePosX = ctlr.MousePosition.X
		FilePosY = ctlr.MousePosition.Y
		'ExplorerWindow.Activate
		'ExplorerWindow.Click
		
		'ExplorerWindow.Drag FilePosX, FilePosY
		
		
		'ExplorerWindow.WaitProperty "Window", 30
		
		
		'Adding description for Internet Explorer Window
		Set IEWindowDesc = Description.Create
		IEWindowDesc("micclass").Value = "Window"
		IEWindowDesc("regexpwndtitle").Value = ".*chrome.*"
		'IEWindowDesc("regexpwndclass").Value = ".*frame.*"
		Set IEWindow = Window(IEWindowDesc)
		

		DropAreaX = DropAreaObject.GetROProperty("abs_x")
		DropAreaY = DropAreaObject.GetROProperty("abs_y")
		DropAreaWidth=DropAreaObject.GetROProperty("width")
 		DropAreaHeight=DropAreaObject.GetROProperty("height")
 		x=(DropAreaX+(DropAreaWidth/2))
 		y=(DropAreaY+(DropAreaHeight/2))
		'dr.DragAndDrop FilePosx, FilePosY, x, y, 0
		'ExplorerWindow.Activate
		ExplorerWindow.Click
		ExplorerWindow.Drag FilePosX, FilePosY
		IEWindow.Drop x, y
		ExplorerWindow.Close
		
		'dr.MouseClick DropAreaX,DropAreaY,RIGHT_MOUSE_BUTTON
		'Set dr = Nothing
		Set ctlr = Nothing
		wait 2
		If err.number <> 0 Then
				'error occurred; file upload unsuccessful
				LogMessage "WARN","Verification.","Unable to drag and drop the attachment. ",false
				uploadFilesUsingBrowse = false
			else
				'successful; put the comments also
				LogMessage "RSLT","Verification.","Able to drag and drop the attachment. ",True
		
			If lstComments(it) <> "" Then
				'Attachments.txtComments().Set lstComments(it)
					
				'Create the comments object on run time
				Set attachmentPage = Browser("Browser_iCall_Home").Page("iCall_Attachments")
				Set txtCommentDesc = Description.Create
				'txtCommentDesc("xpath").value = "//*[@id='Comments_textArea']"
				txtCommentDesc("xpath").value = "//*[@id='attachment_comment_"&it&"']"
				Set txtComment = attachmentPage.ChildObjects(txtCommentDesc)
				txtComment(0).set lstComments(it)
				
			End If
			End If

		End If
	Next

Set fso = Nothing

End Function

'[Verify the lists of the combo box]
Public Function verifyComboList(lstCombo, txtComboObj)
	verifyComboList = true
	ctList = ubound(lstCombo)
	For it = 0 To ctList Step 1
		
		'check if the list has a value
		If lstCombo(it) <> "" Then
			'the move forward
			'Now use the for loop to set the value and after setting get it and compare
			txtComboObj.set lstCombo(it)
			wait 1
			actComboList = txtComboObj.GetRoProperty("value")
			If lstCombo(it) = actComboList Then
				LogMessage "RSLT", "Verification","The value "&lstCombo(it)&" exists in the Combo List",True
			else
				LogMessage "WARN", "Verification","The value "&lstCombo(it)&" does not exist in the Combo List",False
				verifyComboList = false
			End If
		End If
	Next
End Function

'[Convert the date and time format according to IServe time format]
Public Function convertDateTime_WithoutSec(strTimeStamp)
	If len(Day(CDate(strTimeStamp)))=1 Then
		strDay="0"&Day(CDate(strTimeStamp))
	else
		strDay=""&Day(CDate(strTimeStamp))
	End If
	strDate = ""&strDay & " "&monthName(Month(CDate(strTimeStamp)),true) &" " &Year(CDate(strTimeStamp))&""
	strHour = Hour(strTimeStamp)
	If len(strHour) = 1 Then
		strHour = "0" &strHour
	End If
	strMin = Minute(strTimeStamp)
	If len(strMin) = 1 Then
		strMin = "0" &strMin
	End If
	strCreatedOn = strDate & " " &strHour & ":" & strMin
	convertDateTime_WithoutSec = strCreatedOn
End Function

'@Function: Verify SubMenu Item from table cell  and check if sub menu is disabled
Public Function verifySubMenuItem_tblCell(objTableHeader,objTable,intRow, strColName,strItem,bMenuDisabled)
    Dim intCol
	intCol=getColIndex (objTableHeader ,strColName)
	set objCountInCell=getCellObject(objTableHeader,objTable,intRow,strColName,"md-menu")
	iObjCount=objCountInCell.count
	Set oDesc=Description.Create
	oDesc("micclass").Value = "WebElement"
	oDesc("class").Value = "menu-list md-margin"	
	For j = 0 to iObjCount - 1
		strClassName=objCountInCell(j).getRoProperty("class")
		If instr (1,strClassName,"md-menu",0) Then
		Set oDescAction=Description.Create
		oDescAction("micclass").Value = "WebElement"
		oDescAction("class").Value = ".*md-menu-link.*"	
		Wait 2
		Set objAction=objCountInCell(j).ChildObjects(oDescAction)
			Wait 2
			objAction(0).Click
			Set oMenuPopupDesc=Description.Create	
			oMenuPopupDesc("micclass").Value = "WebElement"
	  		oMenuPopupDesc("class").Value = "popupForm"
			set oSubMenupopup=Browser("micclass:=Browser").Page("micclass:=Page").ChildObjects(oMenuPopupDesc)
			Set oMenuDesc=Description.Create	
			oMenuDesc("micclass").Value = "WebElement"
	  		oMenuDesc("class").Value = "menu-list.*"
			set oSubMenu=oSubMenupopup(0).ChildObjects(oMenuDesc)
			Set oMenuItem=Description.Create	
		    oMenuItem("micclass").Value = "WebElement"
		    'Check the link should be enabled or disabled
			If bMenuDisabled Then				
	  		   oMenuItem("class").Value = "disabled-area"
			Else
			   oMenuItem("class").Value = "md-button.*"				
			End If			
		  	set lstSubMenu=oSubMenu(0).ChildObjects(oMenuItem)
		  	
			intItems=lstSubMenu.Count
			For iCount=0 to intItems-1
				Dim strTemp:strTemp=""
				strTemp=lstSubMenu(iCount).GetRoProperty("text")
				If strTemp=strItem Then
					'Check the link enabled or disabled
					bDisabled =InStr(lstSubMenu(iCount).GetROProperty("class"),"disabled-area")
    				If bDisabled <>0 Then
						LogMessage "INFO","Verification","Sub Menu Icon is disabled in Row Number ",True
						bMenuDisabled=True
						verifySubMenuItem_tblCell=true
						Exit Function
					Else
						bMenuDisabled=False
						LogMessage "INFO","Verification","Sub Menu  is enabled in Row Number"&intRow,True
						LogMessage "RSLT","Verification","Item "&strItem&" verify submenu sucessfull. Item Index is "& intItemIndex,true
						verifySubMenuItem_tblCell=true
						Exit Function
					 End If
				End If
				intItemIndex=intItemIndex+1
			Next
    	End If
	Next
	set oDesc=nothing
	LogMessage "RSLT","Verification","Item "&strItem&" not found in  Submenu.",false
	verifySubMenuItem_tblCell=False
End Function


'@Function : verify SubMenu Item from SingleTable Row 
Public function verifyTableSubMenu(tblHeader,tblContent,lstRowData,strTableName,strColumnName,bPagination,objNext,objNext1,objPrevious,strSubMenuItem,bMenuDisabled)
   Dim bVerifyData,arrColumns,arrValues,intSize
	intSize=Ubound(lstRowData)
	ReDim arrColumns(intSize)
	ReDim arrValues(intSize)
	For iCount=0 to intSize
		If Instr(lstRowData(iCount),"Time")<>0 Then
			strTemp=""
			If lstRowData(iCount)="" Then
				Exit For
			End If
			arrTemp=Split(lstRowData(iCount),":")
			arrColumns(iCount)=arrTemp(0)
			For iTemp=0 to Ubound(arrTemp)
				If arrTemp(iTemp)<>"Completed Date/Time" Then
					If strTemp="" Then
						strTemp= checkNull(arrTemp(iTemp))
					else
						strTemp=strTemp &":"& checkNull(arrTemp(iTemp))
					End If
				End If
			Next
				arrValues(iCount)=strTemp
		else
			arrTemp=Split(lstRowData(iCount),":")
			arrColumns(iCount)=arrTemp(0)
			arrValues(iCount)=checkNull(arrTemp(1))
		End If				
	Next
	Dim iPageCounter:iPageCounter = 1
	If bPagination Then
		Do 
			iPageCounter = iPageCounter+1
			tblContent.RefreshObject
			intRow=	getRowForColumns (tblHeader,tblContent,arrColumns, arrValues)
			If not intRow=-1 Then
			'If intRow=-1 Then
				Exit Do
			End If
			bNextEnabled =matchStr(objNext1.GetROProperty("class"),"disabled")
			If Not bNextEnabled Then
				objNext.Click
				intTablePage=intTablePage+1
				WaitForICallLoading
			End If
			If iPageCounter = 50 Then
				print "Exit the loop for function selectTableSubMenu after 50 attempts"
				Exit Do
			End If
		Loop while Not  bNextEnabled
	else
		intRow=	getRowForColumns (tblHeader,tblContent,arrColumns, arrValues)
	End If
	If intRow =-1  Then
		LogMessage "WARN","Verification","Expected "& strTableName &" Data "&ArrayToString(arrValues,",")&" for respective column Names "&ArrayToString(arrColumns,",")&" not found in  "& strTableName &" table",false
		verifyTableSubMenu= False
		Exit Function
	else
		LogMessage "RSLT","Verification","Expected  "& strTableName &" Data "&ArrayToString(arrValues,",")&" for respective column Names "&ArrayToString(arrColumns,",")&" found in "& strTableName &" table at Row "&intRow&" on table page number"&intTablePage,true
		bVerifyData= True
	End If
	bVerifyData = verifySubMenuItem_tblCell( tblHeader,tblContent,intRow, strColumnName,strSubMenuItem,bMenuDisabled)
	WaitForICallLoading		
	verifyTableSubMenu=bVerifyData
End Function

'@Function: To select Combo box Item without object id 
Public function selectItemFromComboBox(ObjPage,strComboBoxClick,strItem)
	selectItemFromComboBox = True
	If Not IsNull(strItem) Then
		Wait(10)
		WaitForIcallLoading	
		Set oDesc=Description.Create
		oDesc("micclass").Value = "WebElement"
		oDesc("xpath").Value = "//*[contains(@class,'md-tab-content') and contains(@class,'ng-scope') and contains(@class,'md-active')]"
		Set obj= ObjPage.ChildObjects(oDesc)		
	
		Set oDescFooter=Description.Create
		oDescFooter("micclass").Value = "WebElement"
		oDescFooter("class").Value = "layout-column flex"
		Set objFooter= obj(0).ChildObjects(oDescFooter)
		
		Set oDescBtn=Description.Create
		oDescBtn("micclass").Value = "WebElement"
		oDescBtn("class").Value = "input-container flex"
		set objBtnSet=objFooter(0).ChildObjects(oDescBtn)
		intBtnCount=objBtnSet.Count
				
		Set oDescTwo=Description.Create
		oDescTwo("micclass").Value = "WebElement"
		oDescTwo("xpath").Value = "//*[contains(@md-selected-item,'"&strComboBoxClick&"')]"
		Set objComboBox= objBtnSet(0).ChildObjects(oDescTwo)
	
		set oDescThree=Description.Create
		oDescThree("micclass").Value = "WebButton"
		oDescThree("class").Value = "md-autocomplete-icon.*"
		set lstObj=objComboBox(0).ChildObjects(oDescThree)
		lstObj(0).Click
		wait 1
		lstObj(0).Click
	
		'To get unique id for Inpur text field.
		Set oDesc1=Description.Create  	
	  	oDesc1("xpath").value=".//*[contains(@class,'autocompleteInput')]"
	  	Wait 1
		strID=objComboBox(0).ChildObjects(oDesc1)(0).getroproperty("html id")
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
		
		intItemIndex = 0
		intItems=lstCombo.Count
		For iCount=0 to intItems-1
			Dim strTemp1:strTemp1=""
			strTemp1=lstCombo(iCount).GetRoProperty("text")
			If trim(strTemp1)=trim(strItem) Then
				lstCombo(iCount).click
				WaitForIcallLoading
				LogMessage "RSLT","Verification","Item "&strItem&" selected from combobox sucessfully. Item Index is "& intItemIndex,true
				selectItemFromComboBox=true
				WaitForIcallLoading
				Exit Function
			End If
			intItemIndex=intItemIndex+1
		Next
		LogMessage "WARN","Verification","Item "&strItem&" Not found in combobox",false
		selectItem_Combobox=false
	End If
End Function
