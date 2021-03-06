'[Verify the primary customer details displayed as]
Public Function verifyPrimaryCustDetails(lstPrimaryDetails)
	
	bverifyPrimaryCustDetails = true
	intSize = Ubound(lstPrimaryDetails)
	For Iterator = 0 To intSize Step 1
		arrLabel = trim(Split(lstPrimaryDetails(Iterator),":")(0))
		arrValue = trim(Split(lstPrimaryDetails(Iterator),":")(1))
		
	Select Case (arrLabel)
		Case "CIN"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcCustomerDetails.lblPriCust_CIN(), arrValue, "CIN")Then
				LogMessage "RSLT","Verification","Primary Details - CIN:"&arrValue&" is not displayed as expected",false
				bverifyPrimaryCustDetails=false
			End If
		End If
		
		Case "Mother's Maiden Name"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcCustomerDetails.lblPriCust_MotherName(), arrValue, "Mother's Maiden Name")Then
				LogMessage "RSLT","Verification","Primary Details - Mother's Maiden Name:"&arrValue&" is not displayed as expected",false
				bverifyPrimaryCustDetails=false
			End If
		End If
		
		Case "VIP"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcCustomerDetails.lblPriCust_VIP(), arrValue, "VIP")Then
				LogMessage "RSLT","Verification","Primary Details - VIP:"&arrValue&" is not displayed as expected",false
				bverifyPrimaryCustDetails=false
			End If
		End If
		
		Case "Employer"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcCustomerDetails.lblPriCust_Employer(), arrValue, "Employer")Then
				LogMessage "RSLT","Verification","Primary Details - Employer:"&arrValue&" is not displayed as expected",false
				bverifyPrimaryCustDetails=false
			End If
		End If
		
		Case "Annual Income"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcCustomerDetails.lblPriCust_AnnualIncome(), arrValue, "Annual Income")Then
				LogMessage "RSLT","Verification","Primary Details - Annual Income:"&arrValue&" is not displayed as expected",false
				bverifyPrimaryCustDetails=false
			End If
		End If
		
		Case "Enrollment Status"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcCustomerDetails.lblPriCust_EnrollmentStatus(), arrValue, "Enrollment Status")Then
				LogMessage "RSLT","Verification","Primary Details - Enrollment Status:"&arrValue&" is not displayed as expected",false
				bverifyPrimaryCustDetails=false
			End If
		End If
		
		Case "Enrollment Date"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcCustomerDetails.lblPriCust_EnrollmentDate(), arrValue, "Enrollment Date")Then
				LogMessage "RSLT","Verification","Primary Details - EEnrollment Date:"&arrValue&" is not displayed as expected",false
				bverifyPrimaryCustDetails=false
			End If
		End If	
	End select
	Next 
		verifyPrimaryCustDetails = bverifyPrimaryCustDetails	
End Function

'[Verify the embosser name details displayed as]
Public Function verifyEmbosserNameDetails(lstEmbDetails)
	
	bverifyEmbosserNameDetails = true
	intSize = Ubound(lstEmbDetails)
	For Iterator = 0 To intSize Step 1
		arrLabel = trim(Split(lstEmbDetails(Iterator),":")(0))
		arrValue = trim(Split(lstEmbDetails(Iterator),":")(1))
		
	Select Case (arrLabel)
		Case "Cardholder's Name"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcCustomerDetails.lblEmbossName_CardholderName(), arrValue, "Cardholder's Name")Then
				LogMessage "RSLT","Verification","Primary Details - Cardholder's Name:"&arrValue&" is not displayed as expected",false
				bverifyEmbosserNameDetails=false
			End If
		End If
		
		Case "Gender"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcCustomerDetails.lblEmbossName_Gender(), arrValue, "Gender")Then
				LogMessage "RSLT","Verification","Primary Details - Gender:"&arrValue&" is not displayed as expected",false
				bverifyEmbosserNameDetails=false
			End If
		End If
		
		Case "Date Of Birth"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcCustomerDetails.lblEmbossName_DOB(), arrValue, "Date Of Birth")Then
				LogMessage "RSLT","Verification","Primary Details - Date Of Birth:"&arrValue&" is not displayed as expected",false
				bverifyEmbosserNameDetails=false
			End If
		End If
		
		Case "CIN"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (bcCustomerDetails.lblEmbossName_CIN(), arrValue, "CIN")Then
				LogMessage "RSLT","Verification","Primary Details - CIN:"&arrValue&" is not displayed as expected",false
				bverifyEmbosserNameDetails=false
			End If
		End If	
	End select
	Next
	verifyEmbosserNameDetails = bverifyEmbosserNameDetails
End Function
