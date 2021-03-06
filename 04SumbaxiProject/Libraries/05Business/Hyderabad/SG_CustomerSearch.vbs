'**********************************Customer Search Enquiry*****************************************

'[Give the input for customer CIN]
Public Function inputTxt_CIN(strCIN)
	inputTxt_CIN = true
	If bcCustomerSearch.txtNRICorPassport.GetROProperty("outerhtml")=".*false" Then
		bcCustomerSearch.btnByCustomer.Click
		bcCustomerSearch.txtNRICorPassport.Set strCIN
		bcCustomerSearch.btnSearchByCustomer.Click	
		If Err.Number<>0 Then
	       inputTxt_CIN=false
	       LogMessage "WARN","Verification","Failed to Set value for field Customer CIN",false
       	   Exit Function
   	   End If
	Else
		bcCustomerSearch.txtNRICorPassport.Set strCIN
		If Err.Number<>0 Then
	       inputTxt_CIN=false
	       LogMessage "WARN","Verification","Failed to Set value for field Customer CIN",false
	       Exit Function
	   	End If
	End If
	bcCustomerSearch.btnSearchByCustomer.Click
End Function

'[Give the input for customer Name]
Public Function inputTxt_Name(strName)
	inputTxt_Name = true
	bcCustomerSearch.txtName.Set strName
	If Err.Number<>0 Then
       inputTxt_Name=false
       LogMessage "WARN","Verification","Failed to Set value for field Name",false
       Exit Function
   End If
End Function

'[Give the input for customer DOB]
Public Function inputTxt_DOB(strDOB)
	inputTxt_DOB = true
	'bcCustomerSearch.txtDateOfBirth.Set strDOB
	inputTxt_DOB = SelectDatePicker_FromDate(strDOB)
	bcCustomerSearch.btnSearchByCustomer.click	
	If Err.Number<>0 Then
       inputTxt_DOB=false
       LogMessage "WARN","Verification","Failed to Set value for field Date of Birth",false
       Exit Function
   End If
End Function

'[Give the input for customer cardnumber]
Public Function inputTxt_CardNumber(strCrdNo)
	inputTxt_CardNumber = true
	' the below steps has been added to clear the fields in Customer section before actual validation
	bcCustomerSearch.btnByCustomer.Click
	bcCustomerSearch.txtNRICorPassport.Set ""
	wait(1)
	bcCustomerSearch.btnByCard.Click
	bcCustomerSearch.txtCardNumber.Set strCrdNo
	If Err.Number<>0 Then
       inputTxt_CardNumber=false
       LogMessage "WARN","Verification","Failed to Set value for field CardNumber",false
       Exit Function
    End If
    bcCustomerSearch.btnSearchByCard.Click
    If Err.Number<>0 Then
       LogMessage "WARN","Verification","Failed to Click Search Button",false
       inputTxt_CardNumber=false
       Exit Function
    End If
End Function

'[Give the input Account type and account no for customer search]
Public Function inputAcc_CustSearch(strAccType,strAccno)
	inputAcc_CustSearch = true
	' the below steps has been added to clear the fields in Customer section before actual validation
	bcCustomerSearch.btnByCustomer.Click
	bcCustomerSearch.txtNRICorPassport.Set ""
	wait(1)
	bcCustomerSearch.btnByAccount.Click
	If not (selectItem_Combobox(bcCustomerSearch.txtAccountTypeList,strAccType)) Then
		LogMessage "WARN","Verification","Failed to select :"&strAccType&" From Account Type drop down list",false
		inputAcc_CustSearch=false
	End If
	bcCustomerSearch.txtAccountNo.set strAccno
	If Err.Number<>0 Then
       LogMessage "WARN","Verification","Failed to Set value for field Account Numnber",false
       inputAcc_CustSearch=false
       Exit Function
    End If
	bcCustomerSearch.btnSearchByAccount.click
	If Err.Number<>0 Then
       LogMessage "WARN","Verification","Failed to Click Search Button",false
       inputAcc_CustSearch=false
       Exit Function
    End If
End Function

'[Give the input Mobile Number for customer search]
Public Function InputMobileNumber_CustomerSearch(strMobileNo)
	bInputMobileNumber = true
	' the below steps has been added to clear the fields in Customer section before actual validation
	bcCustomerSearch.btnByCustomer.Click
	bcCustomerSearch.txtNRICorPassport.Set ""
	wait(1)
	bcCustomerSearch.btnByMobileNo.Click
	wait(1)
	bcCustomerSearch.txtMobileNo.set strMobileNo
	If Err.Number<>0 Then
       LogMessage "WARN","Verification","Failed to Set value for field Account Numnber",false
       bInputMobileNumber=false
       Exit Function
    End If
	bcCustomerSearch.btnSearchByMobile.click
	If Err.Number<>0 Then
       LogMessage "WARN","Verification","Failed to Click Search Button",false
       bInputMobileNumber=false
       Exit Function
    End If
    InputMobileNumber_CustomerSearch = bInputMobileNumber
End Function

'[Verify the inline message for invalid input]
Public Function verifyinlinemessage_CustSearchName(strErrorMesg)
	bverifyinlinemessage=true
	If not VerifyInnerText(bcCustomerSearch.lblErrMessage(), strErrorMesg, "Error Message") Then
       bverifyinlinemessage=false
	End If
	verifyinlinemessage_CustSearchName=bverifyinlinemessage
End Function

'[Click Search result link for name and DOB combination search]
Public Function ResultLink_searchCust(lstRowData)
	'bResultLink_searchCust = true
	bResultLink_searchCust = selectTableLink(bcCustomerSearch.tblCustSearcResultsHeader_Name,bcCustomerSearch.tblCustSearchResultsContent_Name,lstRowData,"Search Results","Name",false,null,null,null)
	ResultLink_searchCust = bResultLink_searchCust
End Function

'[Click Search result link for cardnumber search]
Public Function ResultLink_searchCustByCard(lstRowData)
	'bResultLink_searchCustByCard = true
	bResultLink_searchCustByCard = selectTableLink(bcCustomerSearch.tblCustSearcResultsHeader_Card,bcCustomerSearch.tblCustSearchResultsContent_Card,lstRowData,"Search Results","Name",false,null,null,null)
	ResultLink_searchCustByCard = bResultLink_searchCustByCard
End Function

'[Click Search result link for Account no search]
Public Function ResultLink_searchCustByAccount(lstRowData)
	'bResultLink_searchCustByAccount = true
	bResultLink_searchCustByAccount = selectTableLink(bcCustomerSearch.tblCustSearcResultsHeader_AccountNo,bcCustomerSearch.tblCustSearcResultsContent_AccountNo,lstRowData,"Search Results","Customer Name",false,null,null,null)
	ResultLink_searchCustByAccount = bResultLink_searchCustByAccount
End Function


