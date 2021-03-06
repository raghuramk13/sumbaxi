
'[Verify Address Details in the page displayed as]
Public Function VerifyAddressDetails_RD(strTitle,strName,strAddressLine1,strAddressLine2,strAddressLine3,strAddressLine4,strAddressLine5,strPostalCode,strCountry)
 bAddressDetails = True    
	If Not IsNull(strTitle) Then
	    If Not VerifyInnerText(Relationship_Details.lblTitle(),strTitle,"Relationship Details-Title") Then
		bAddressDetails = False
		End If
	End If	
	If Not IsNull(strName) Then
	    If Not VerifyInnerText(Relationship_Details.lblName(),strName,"Relationship Details-Name") Then
		bAddressDetails = False
		End If
	End If	
	If Not IsNull(strAddressLine1) Then
	    If Not VerifyInnerText(Relationship_Details.lblAddressLine1(),strAddressLine1,"Relationship Details-AddressLine1") Then
		bAddressDetails = False
		End If
	End If	
	If Not IsNull(strAddressLine2) Then
	    If Not VerifyInnerText(Relationship_Details.lblAddressLine2(),strAddressLine2,"Relationship Details-AddressLine2") Then
		bAddressDetails = False
		End If
	End If	
	If Not IsNull(strAddressLine3) Then
	    If Not VerifyInnerText(Relationship_Details.lblAddressLine3(),strAddressLine3,"Relationship Details-AddressLine3") Then
		bAddressDetails = False
		End If
	End If	
	If Not IsNull(strAddressLine4) Then
	    If Not VerifyInnerText(Relationship_Details.lblAddressLine4(),strAddressLine4,"Relationship Details-AddressLine4") Then
		bAddressDetails = False
		End If
	End If	
	If Not IsNull(strAddressLine5) Then
	    If Not VerifyInnerText(Relationship_Details.lblAddressLine5(),strAddressLine5,"Relationship Details-AddressLine5") Then
		bAddressDetails = False
		End If
	End If	
	If Not IsNull(strPostalCode) Then
	    If Not VerifyInnerText(Relationship_Details.lblPostalCode(),strPostalCode,"Relationship Details-PostalCode") Then
		bAddressDetails = False
		End If
	End If	
	If Not IsNull(strCountry) Then
	    If Not VerifyInnerText(Relationship_Details.lblCountry(),strCountry,"Relationship Details-Country") Then
		bAddressDetails = False
		End If
	End If
   VerifyAddressDetails_RD = bAddressDetails
End Function

'[Verify Account Summary table details in Relationship details Page]
Public Function VerifyAccountSummary_RD(lstlstAccountData) 
If Not IsNull(lstlstAccountData) Then
	bVerifyAccountSummary= verifyTableContentList(Relationship_Details.tblAccountSummaryHeader,Relationship_Details.tblAccountSummaryContent,lstlstAccountData,"Account summary",false,null ,null,null)
End If
VerifyAccountSummary_RD = bVerifyAccountSummary
End Function

'[Click on Linked card view Link in Account summary table in Relationship details Page]
Public Function ClickLinkedCardAccountSummary_RD(lstAccountData) 
If Not IsNull(lstAccountData) Then
	bClickLinkedCard = selectTableLink(Relationship_Details.tblAccountSummaryHeader,Relationship_Details.tblAccountSummaryContent, lstAccountData, "Account summary","Linked Card", false, null, null, null)  
End If
ClickLinkedCardAccountSummary_RD = bClickLinkedCard
End Function

'[Verify card Summary table details in Relationship details Page]
Public Function VerifyCardSummary_RD(lstlstAccountData) 
If Not IsNull(lstlstAccountData) Then
	WaitForICallLoading
	bVerifyCardSummary = verifyTableContentList(Relationship_Details.tblCardSummaryHeader,Relationship_Details.tblCardSummaryContent,lstlstAccountData,"Card summary",false,null ,null,null)
End If
VerifyCardSummary_RD = bVerifyCardSummary
End Function

'[Click on More Info view link in Card Summary table in Relationship details Page]
Public Function ClickViewCardSummary_RD(lstAccountData) 
	If Not IsNull(lstAccountData) Then
		bClickViewCardSummary = selectTableLink(Relationship_Details.tblCardSummaryHeader,Relationship_Details.tblCardSummaryContent,lstAccountData, "Card summary","More Info", false, null, null, null)   
	End If
	WaitForIcallLoading
	ClickViewCardSummary_RD = bClickViewCardSummary
End Function

'[Verify Account Summary table details in the page displayed as]
Public Function verifyAccountdetailedSummary_RD(strAccountCount,lstlstAccountData)
bVerifyAccountSumary=true
bExists=tblAccountSummaryHeader.Exist(0)
If Not bExists Then
   bVerifyAccountSumary= False
   LogMessage "WARN","Verification","Relationship Details  table is not displaying",False
Else
   bVerifyAccountSumary= True	
   LogMessage "RSLT","Verification","Relationship Details table is displaying",True
End If

If Not IsNull(lstlstAccountData) Then
	If Not (verifyTableContentList(Relationship_Details.tblAccountSummaryHeader,Relationship_Details.tblAccountSummary,lstlstAccountData,"Relationship Account Summary",true)) Then
		bVerifyAccountSumary=False
		Exit Function 
	End If
End If

If Not IsNull(strAccountCount) Then
	If not (verifySummaryCount(Relationship_Details.tblAccountSummaryHeader,Relationship_Details.tblAccountSummary,"Account No.",strAccountCount,"Account Summary",true)) Then
		bVerifyAccountSumary=false
	End If
	
	intRowTemp=getRecordsCountForColumn (Relationship_Details.tblAccountSummaryHeader,Relationship_Details.tblAccountSummary,"Account No.")
	'********* To validate total number of record per page.
	If intRowTemp <= 5 Then
		LogMessage "RSLT","Verification","Number of records displayed per page matched with expected. Expected Count is less than or equal to 5", true
		bVerifyAccountSumary=true
	Else
		LogMessage "WARN","Verification","Number of records displayed per page is more than 5 record. Expected Count is less than or equal to 5", false
		bVerifyAccountSumary=false
	End If

	'********* To validate next link should not enable if record is less than specified number
	If intRowTemp < 5 Then
		bNextPageExist =matchStr(Relationship_Details.lnkNext1().GetROProperty("class"),"disabled")
		If Not bNextPageExist Then
			LogMessage "WARN","Verification","Next link expected to be disable if record is less than 5. Currently it is enable.",false
			bVerifyAccountSumary=false
		Else
			LogMessage "RSLT","Verification","Next link is disabled as per expectation.",true
			bVerifyAccountSumary=true
		End If
	End If
End If
verifyAccountdetailedSummary_RD = bVerifyAccountSumary
End Function

'[Verify Contact details displayed in Relationship enquiry page]
Public Function VerifyContactDetails_RD(strHomePhone,strMobilePhone,strEmail) 
bContactDetails_RD = True 
If Not IsNull(strHomePhone) Then
    If Not VerifyInnerText(Relationship_Details.lblHomePhone(),strHomePhone,"Contact Details-Home Phone") Then
	bContactDetails_RD = False
	End If
End If	
If Not IsNull(strMobilePhone) Then
    If Not VerifyInnerText(Relationship_Details.lblMobilePhone(),strMobilePhone,"Contact Details-Mobile Phone") Then
	bContactDetails_RD = False
	End If
End If	
If Not IsNull(strEmail) Then
    If Not VerifyInnerText(Relationship_Details.lblEmail(),strEmail,"Contact Details- Email") Then
	bContactDetails_RD = False
	End If
End If
VerifyContactDetails_RD = bContactDetails_RD
End Function

'[Verify other Address details displayed in Relationship enquiry page]
Public Function VerifyOtherDetails_RD(lstPastAddressDetails) 
   bVerifyPastAddress_RD = True
   If Not IsNull(lstPastAddressDetails) Then
	strPastAddressLine1=lstPastAddressDetails(0)
	strPastAddressLine2=lstPastAddressDetails(1)
	strPastAddressLine3= lstPastAddressDetails(2)
	strPastAddressLine4=lstPastAddressDetails(3)
	strPastAddressLine5=lstPastAddressDetails(4)
	strLastModifiedDate=lstPastAddressDetails(5)
	strRelationshipName=lstPastAddressDetails(6)
	strRelationshipAddressLine1=lstPastAddressDetails(7)
	strRelationshipAddressLine2=lstPastAddressDetails(8)
	strRelationshipAddressLine3=lstPastAddressDetails(9)
	strRelationshipAddressLine4=lstPastAddressDetails(10)
	
	Relationship_Details.lnkViewPastAddress().Click
	
	If Not IsNull(strPastAddressLine1) Then
        If Not VerifyInnerText(Relationship_Details.lblPastAddressLine1(),strPastAddressLine1,"Past Address1") Then
		bVerifyPastAddress_RD = False
		End If
    End If
    If Not IsNull(strPastAddressLine2) Then
        If Not VerifyInnerText(Relationship_Details.lblPastAddressLine2(),strPastAddressLine2,"Past Address2") Then
		bVerifyPastAddress_RD = False
		End If
    End If
    If Not IsNull(strPastAddressLine3) Then
        If Not VerifyInnerText(Relationship_Details.lblPastAddressLine3(),strPastAddressLine3,"Past Address3") Then
		bVerifyPastAddress_RD = False
		End If
    End If
    If Not IsNull(strPastAddressLine4) Then
        If Not VerifyInnerText(Relationship_Details.lblPastAddressLine4(),strPastAddressLine4,"Past Address4") Then
		bVerifyPastAddress_RD = False
		End If
    End If    
    If Not IsNull(strPastAddressLine5) Then
        If Not VerifyInnerText(Relationship_Details.lblPastAddressLine5(),strPastAddressLine5,"Past Address5") Then
		bVerifyPastAddress_RD = False
		End If
    End If
    If Not IsNull(strLastModifiedDate) Then
        If Not VerifyInnerText(Relationship_Details.lblLastModifiedDate(),strLastModifiedDate,"Past Address - Last modified Date") Then
		bVerifyPastAddress_RD = False
		End If
    End If
   	If Not IsNull(strRelationshipName) Then
        If Not VerifyInnerText(Relationship_Details.lblRelationshipName(),strRelationshipName,"Relationship Name") Then
		bVerifyPastAddress_RD = False
		End If
    End If
   	If Not IsNull(strRelationshipAddressLine1) Then
        If Not VerifyInnerText(Relationship_Details.lblRelationshipAddressLine1(),strRelationshipAddressLine1,"Relationship Address1") Then
		bVerifyPastAddress_RD = False
		End If
    End If
    If Not IsNull(strRelationshipAddressLine2) Then
        If Not VerifyInnerText(Relationship_Details.lblRelationshipAddressLine2(),strRelationshipAddressLine2,"Relationship Address2") Then
		bVerifyPastAddress_RD = False
		End If
    End If
    If Not IsNull(strRelationshipAddressLine3) Then
        If Not VerifyInnerText(Relationship_Details.lblRelationshipAddressLine3(),strRelationshipAddressLine3,"Relationship Address3") Then
		bVerifyPastAddress_RD = False
		End If
    End If
    If Not IsNull(strRelationshipAddressLine4) Then
        If Not VerifyInnerText(Relationship_Details.lblRelationshipAddressLine4(),strRelationshipAddressLine4,"Relationship Address4") Then
		bVerifyPastAddress_RD = False
		End If
    End If
	Relationship_Details.btnOK().Click  
End IF	
VerifyOtherDetails_RD = bVerifyPastAddress_RD
End Function

'[Verify details displayed in Relationship enquiry page]
Public Function VerifyRelationDetails_RD(lstRelationshipDetails) 
bVerifyRelationDetails_RD = True
If Not IsNull(lstRelationshipDetails) Then
	strRelationshipNumber = trim(lstRelationshipDetails(0))
	strRMMNumber = trim(lstRelationshipDetails(1))
	strAFWScore  = trim(lstRelationshipDetails(2))
	strSecureIndicator = trim(lstRelationshipDetails(3))
	strRelationshipBlockCode = trim(lstRelationshipDetails(4))
	strRelationshipOpenDate  = trim(lstRelationshipDetails(5))
	strESSOInd  = trim(lstRelationshipDetails(6))
	strTertiarySegmtInd = trim(lstRelationshipDetails(7))
	strPrevInd = trim(lstRelationshipDetails(8))
	strEPExpiryDate = trim(lstRelationshipDetails(9))
	strLastMaintainedDate = trim(lstRelationshipDetails(10))
	
	If Not IsNull(strRelationshipNumber) Then
	   If Not VerifyInnerText(Relationship_Details.lblRelationshipNumber(),strRelationshipNumber,"Relationship Details- Relationship Number") Then
	   bVerifyRelationDetails_RD = False
	   End If
	End If	
	If Not IsNull(strRMMNumber) Then
	   If Not VerifyInnerText(Relationship_Details.lblRMMNumber(),strRMMNumber,"Relationship Details- RMM Number") Then
	   bVerifyRelationDetails_RD = False
	   End If
	End If	
	If Not IsNull(strAFWScore) Then
	   If Not VerifyInnerText(Relationship_Details.lblAFWScore(),strAFWScore,"Relationship Details- AFW Score") Then
	   bVerifyRelationDetails_RD = False
	   End If
	End If	
	If Not IsNull(strSecureIndicator) Then
	    If Not VerifyInnerText(Relationship_Details.lblSecureIndicator(),strSecureIndicator,"Relationship Details- Secure Indicator") Then
		bVerifyRelationDetails_RD = False	
		End If
	End If	
	If Not IsNull(strRelationshipBlockCode) Then
	   If Not VerifyInnerText(Relationship_Details.lblRelationshipBlockCode(),strRelationshipBlockCode,"Relationship Details-Relationship block Code") Then
		bVerifyRelationDetails_RD = False
	   End If
	End If	
	If Not IsNull(strRelationshipOpenDate) Then
	    If Not VerifyInnerText(Relationship_Details.lblRelationshipOpenDate(),strRelationshipOpenDate,"Relationship Details-Relationship open Date") Then
		bVerifyRelationDetails_RD = False
		End If
	End If	
	If Not IsNull(strESSOInd) Then
	   If Not VerifyInnerText(Relationship_Details.lblESSOInd(),strESSOInd,"Relationship Details- ESSO Ind") Then
	   bVerifyRelationDetails_RD = False
	   End If
	End If	
	If Not IsNull(strTertiarySegmtInd) Then
	   If Not VerifyInnerText(Relationship_Details.lblTertiarySegmtInd(),strTertiarySegmtInd,"Relationship Details- Tertiary Segmt Ind") Then
	   bVerifyRelationDetails_RD = False
	   End If
	End If	
	If Not IsNull(strPrevInd) Then
	   If Not VerifyInnerText(Relationship_Details.lblPrevInd(),strPrevInd,"Relationship Details- Previous Ind") Then
	   bVerifyRelationDetails_RD = False
	   End If
	End If	
	If Not IsNull(strEPExpiryDate) Then
	    If Not VerifyInnerText(Relationship_Details.lblEPExpiryDate(),strEPExpiryDate,"Relationship Details-EP Expiry Date") Then
		bVerifyRelationDetails_RD = False
		End If
	End If	
	If Not IsNull(strLastMaintainedDate) Then
	   If Not VerifyInnerText(Relationship_Details.lblLastMaintainedDate(),strLastMaintainedDate,"Relationship Details- Last Maintained Date") Then
	   bVerifyRelationDetails_RD = False
	   End If
	End If
End If
VerifyRelationDetails_RD = bVerifyRelationDetails_RD
End Function

Public Sub clickNext()
    Relationship_Details.lnkNext().Click
End Sub

Public Sub clickPrevious()
    Relationship_Details.lnkPrevious().Click
End Sub

Public Sub clickView()
    Relationship_Details.lnkView().Click
End Sub

Public Sub clickMoreInfo()
    Relationship_Details.lnkMoreInfo().Click
End Sub

Public Sub clickCardNumber()
    Relationship_Details.lnkCardNumber().Click
End Sub

'[Verify Pagination for Account Summary table details in the page displayed]
Public Function ValidatePagination_RelationDetails()
 bValidatePagination_RelationDetails=true
 bNextPageExist = True
	While bNextPageExist = True
	 intRecordCount = getRecordsCountForColumn(Relationship_Details.tblAccountSummaryHeader,Relationship_Details.tblAccountSummaryContent,"Account No.")	
	 iCheck = 5 
		If intRecordCount <=iCheck  Then
	     LogMessage "RSLT","Verification","Number of records displayed per page matched with expected. Expected Count is less than or equal to "&iCheck, true   
	     bValidatePagination_RelationDetails=true
		 If intRecordCount < iCheck Then
		   	bNextPageExist =matchStr(Relationship_Details.lnkNext.GetROProperty("class"),"enabled")
			If bNextPageExist Then
			LogMessage "WARN","Verification","Next link expected to be disabled if record is less than "&iCheck&". Currently it is enabled.",false
			bValidatePagination_RelationDetails=false
			Else
			LogMessage "RSLT","Verification","Next link is disabled as per expectation.",true
			End If
		ElseIf intRecordCount = iCheck Then
			bNextPageExist = matchStr(Relationship_Details.lnkNext.GetROProperty("class"),"enabled")
			If bNextPageExist Then
			   Relationship_Details.lnkNext.Click
			End If
		End If
		Else 
			LogMessage "RSLT","Verification","Number of records displayed per page not matched with expected. Expected Count is less than or equal to 5", false   
			bNextPageExist = False
		End If
   Wend
   ValidatePagination_RelationDetails = bValidatePagination_RelationDetails
End Function
