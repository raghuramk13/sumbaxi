'[Verify Cust Profile Main Header Name Segment Customer]
Public Function VerifyMainHeader_CustProfile(strCustName,strCustSegment)
	bVerify=True
	
	If Not IsNull(strCustName) Then
	
		If Not verifyInnerText(coCustProfile_Page.lblCustProfCustName(),strCustName,"Main HDR Customer Name")Then
				bVerify = False
			End If
	End If
	
	If Not IsNull(strCustSegment) Then
		If Not verifyInnerText(coCustProfile_Page.lblCustProfCustSegment(),strCustSegment,"Main HDR Customer Segment")Then
				bVerify = False
			End If
	End If
	
	If Not verifyInnerText(coCustProfile_Page.lblCustProfCustomerLbl(),"Customer","Main HDR Customer Lable")Then
				bVerify = False
			End If
			
	VerifyMainHeader_CustProfile=bVerify
	
End Function

'[Verify Cust Profile Header Name]
Public Function VerifyProfileHeader_CustProfile(strCustName)
	bVerify=True
	
	If Not IsNull(strCustName) Then
	
		If Not verifyInnerText(coCustProfile_Page.lblViewProfileHdr(),strCustName+"'S PROFILE","Customer Profile Header Name")Then
				bVerify = False
			End If
	End If
				
	VerifyProfileHeader_CustProfile=bVerify
	
End Function

'[Verify Cust Profile Header Segment]
Public Function VerifyProfileHeaderSegment_CustProfile(strSegName)
	bVerify=True
	
	If Not IsNull(strSegName) Then
	
		If Not verifyInnerText(coCustProfile_Page.lblViewProfileHdrSgmt(),strSegName,"Customer Profile Header Segment")Then
				bVerify = False
			End If
	End If
				
	VerifyProfileHeaderSegment_CustProfile=bVerify
	
End Function

'[Verify Cust Profile Staff or Non-Staff And Residnent or Non-Resindent]
Public Function VerifyProfileAcctType_CustProfile(strAcctType)
	bVerify=True
	
	If Not IsNull(strAcctType) Then
		strAcctType = Trim(Replace(strAcctType,"#","|"))
		If Not verifyInnerText(coCustProfile_Page.lblViewProfileAcctType(),strAcctType,"Customer Profile Account Type and ResidentType")Then
				bVerify = False
			End If
	End If
				
	VerifyProfileAcctType_CustProfile=bVerify
	
End Function

'[Verify fields displayed in Customer Profile Primary Info]
Public Function VerifyPrimaryInfo_CustProfile(arrLblValPairs)
	VerifyPrimaryInfo_CustProfile = VerifyIDLabelValuePairsRandom(coCustProfile_Page.lblCustProfilePrimInfo,arrLblValPairs,"Customer Profile","Primary Info")
End Function

'[Verify fields displayed in Customer Profile Personal Info]
Public Function VerifyPersonalInfo_CustProfile(arrLblValPairs,strTabName)
	ClickTab strTabName
	VerifyPersonalInfo_CustProfile = VerifyIDLabelValuePairsRandom(coCustProfile_Page.objProfileBodyForAllInfoTabs,arrLblValPairs,"Customer Profile","Personal Information")
End Function

'[Verify fields displayed in Customer Profile Employment Info]
Public Function VerifyEmploymentInfo_CustProfile(arrLblValPairs,strTabName)
	ClickTab strTabName
	VerifyEmploymentInfo_CustProfile = VerifyIDLabelValuePairsRandom(coCustProfile_Page.objProfileBodyForAllInfoTabs,arrLblValPairs,"Customer Profile","Employment Information")
End Function

'[Verify fields displayed in Customer Profile Address Info]
Public Function VerifyAddressInfo_CustProfile(arrLblValPairs,strTabName)
	ClickTab strTabName
	VerifyAddressInfo_CustProfile = VerifyIDLabelValuePairsRandom(coCustProfile_Page.objProfileBodyForAllInfoTabs,arrLblValPairs,"Customer Profile","Address Information")
End Function

'[Verify fields displayed in Customer Profile Document Details]
Public Function VerifyDocumentInfo_CustProfile(arrLblValPairs,strTabName)
	ClickTab strTabName
	VerifyDocumentInfo_CustProfile = VerifyIDLabelValuePairsRandom(coCustProfile_Page.objProfileBodyForAllInfoTabs,arrLblValPairs,"Customer Profile","Document Details")
End Function

'[Verify fields displayed in Customer Profile Contact Info]
Public Function VerifyContactInfo_CustProfile(arrLblValPairs,strTabName)
	ClickTab strTabName
	VerifyContactInfo_CustProfile = VerifyIDLabelValuePairsRandom(coCustProfile_Page.objProfileBodyForAllInfoTabs,arrLblValPairs,"Customer Profile","Contact Information")
End Function

'[Verify fields displayed in Customer Profile Key Info]
Public Function VerifyKeyInfo_CustProfile(arrLblValPairs,strTabName)
	ClickTab strTabName
	VerifyKeyInfo_CustProfile = VerifyIDLabelValuePairsRandom(coCustProfile_Page.objProfileBodyForAllInfoTabs,arrLblValPairs,"Customer Profile","Key Information")
End Function

'[Verify fields displayed in Customer Profile FATCA Info]
Public Function VerifyFATCAInfo_CustProfile(arrLblValPairs,strTabName)
	ClickTab strTabName
	VerifyFATCAInfo_CustProfile = VerifyIDLabelValuePairsRandom(coCustProfile_Page.objProfileBodyForAllInfoTabs,arrLblValPairs,"Customer Profile","FATCA Information")
End Function

'[Verify list of values in Customer Profile dropdown displayed]
Public Function VerifyCustProfileDropdown(lstdrdownVals,drdownName)
bVerifyValues = True
If Not IsNull(lstdrdownVals) Then
	If Not IsNull(drdownName) Then
		Select Case drdownName
			Case "Customer Address Type"
				ClickTab "Address Info"
				Set objField = coCustProfile_Page.lstCustProfileAdressType()
			Case "Customer Document Type"
				ClickTab "Customer Document details"
				Set objField = coCustProfile_Page.lstCustProfileDocumentType()
			Case "Customer Phone Type"
				ClickTab "Contact Info"
				Set objField = coCustProfile_Page.lstCustProfilePhoneType()
			Case "Customer Email Address Type"
				ClickTab "Contact Info"
				Set objField = coCustProfile_Page.lstCustProfileEmailAddType()
		End Select
	End If
bVerifyValues = verifyComboboxItems(objField,lstdrdownVals,drdownName)		
End If
VerifyCustProfileDropdown = bVerifyValues
End Function

'[Verify default value displayed in the Customer Profile dropdown]
Public Function VerifyDefaultValueDropdown_CP(StrDefValue,drdownName)
bVerifyDefaultvalue = False
If Not IsNull(StrDefValue) Then
	If Not IsNull(drdownName) Then
		Select Case drdownName
			Case "Customer Address Type"
				ClickTab "Address Info"
				Set objField = coCustProfile_Page.lstCustProfileAdressType()
			Case "Customer Document Type"
				ClickTab "Customer Document details"
				Set objField = coCustProfile_Page.lstCustProfileDocumentType()
			Case "Customer Phone Type"
				ClickTab "Contact Info"
				Set objField = coCustProfile_Page.lstCustProfilePhoneType()
			Case "Customer Email Address Type"
				ClickTab "Contact Info"
				Set objField = coCustProfile_Page.lstCustProfileEmailAddType()
		End Select
	End If
	If drdownName="Customer Email Address Type" Then
		bVerifyDefaultvalue = VerifyWebListDefaultValue(objField,StrDefValue,drdownName)
	Else
		bVerifyDefaultvalue = VerifyDropdownDefaultValue(objField,StrDefValue,drdownName)
	End If
End If
VerifyDefaultValueDropdown_CP = bVerifyDefaultvalue	
End Function

'[Select Combobox Value From Dropdown in Customer Profile Page]
Public Function SelectValDropdown_CP(strItem,drdownName)
bVerifyvalue = False
If Not IsNull(strItem) Then
	If Not IsNull(drdownName) Then
		Select Case drdownName
			Case "Customer Address Type"
				ClickTab "Address Info"
				Set objField = coCustProfile_Page.lstCustProfileAdressType()
			Case "Customer Document Type"
				ClickTab "Customer Document details"
				Set objField = coCustProfile_Page.lstCustProfileDocumentType()
			Case "Customer Phone Type"
				ClickTab "Contact Info"
				Set objField = coCustProfile_Page.lstCustProfilePhoneType()
			Case "Customer Email Address Type"
				ClickTab "Contact Info"
				Set objField = coCustProfile_Page.lstCustProfileEmailAddType()
		End Select
	End If
	bVerifyvalue = SelectComboBoxItem(objField,strItem,drdownName)		
End If
SelectValDropdown_CP = bVerifyvalue
End Function

'[Verify list of Accordions displayed for retail customer from customer profile]
Public Function VerifyPanellist_CP(lstAccordion)
	VerifyPanellist_CP = VerifyAccordionHeader(coCustProfile_Page.ObjCustProfileAccordianGrp,lstAccordion)
End Function

'[Verify list of Tabs displayed for retail customer from customer profile]
Public Function VerifyTablelist_CP(lstTabs)
	' Added by  : 6th June 2018 : Indo Phase 2 Relase"
	' Accordions changed to Tabs
	VerifyTablelist_CP = VerifyListOfTabs(lstTabs)
End Function

'[Click Expand or Collapse icon for Accordion displayed in Customer Profile]
Public Function ClickExpandCollapseIcon_CP(strAccordion)
	ClickExpandCollapseIcon_CP = ClickExpandIcon(coCustProfile_Page.ObjCustProfileAccordianGrp,strAccordion)
End Function

'[Click Multiple Accordion to Expand or Collapse in Customer Profile page displayed]
Public Function ClickMultipleExpandCollapseIcon_CP(lstAccordion)
bverifyExpandAccordion = True
If Not IsNull(lstAccordion) Then	
   bverifyExpandAccordion = ClickMultipleAccordions(coCustProfile_Page.ObjCustProfileAccordianGrp,lstAccordion)	
End If
ClickMultipleExpandCollapseIcon_CP = bverifyExpandAccordion
End Function

'[Click Collapse icon for Accordion displayed in Customer Profile Page]
Public Function ClickCollapseIcon_CP(strAccordion)
	ClickCollapseIcon_CP = CollapseSingleAccordion(coCustProfile_Page.ObjCustProfileAccordianGrp,strAccordion)
	wait 2
End Function
