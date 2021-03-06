'[Verify the Customer behavior and overdue details displayed as]
Public Function verifyCustBehav_Deliquency(lstCustBehav)
	bverifyCustBehav_Deliquency = true
	intSize = Ubound(lstCustBehav)
	For Iterator = 0 To intSize Step 1
		arrLabel = trim(Split(lstCustBehav(Iterator),":")(0))
		arrValue = trim(Split(lstCustBehav(Iterator),":")(1))
		
	Select Case (arrLabel)
		Case "Behavior Score"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (Deliquency.lblBehaviorScore(), arrValue, "Behavior Score")Then
				LogMessage "RSLT","Verification","Customer Behavior - Behavior Score:"&arrValue&" is not displayed as expected",false
				bverifyCustBehav_Deliquency=false
			End If
		End If
		
		Case "Credit Class"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (Deliquency.lblCrediClass(), arrValue, "Credit Class")Then
				LogMessage "RSLT","Verification","Customer Behavior - Credit Class:"&arrValue&" is not displayed as expected",false
				bverifyCustBehav_Deliquency=false
			End If
		End If
		
		Case "Risk Grade"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (Deliquency.lblRiskGrade(), arrValue, "Risk Grade")Then
				LogMessage "RSLT","Verification","Customer Behavior - Risk Grade:"&arrValue&" is not displayed as expected",false
				bverifyCustBehav_Deliquency=false
			End If
		End If
		
		Case "Scoring Date"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (Deliquency.lblScoringDate(), arrValue, "Scoring Date")Then
				LogMessage "RSLT","Verification","Customer Behavior - Scoring Date:"&arrValue&" is not displayed as expected",false
				bverifyCustBehav_Deliquency=false
			End If
		End If
		
		Case "Behavior Indicator"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (Deliquency.lblBehaviorIndicator(), arrValue, "Behavior Indicator")Then
				LogMessage "RSLT","Verification","Customer Behavior - Behavior Indicator:"&arrValue&" is not displayed as expected",false
				bverifyCustBehav_Deliquency=false
			End If
		End If
		
		Case "Previous Credit Class"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (Deliquency.lblPreviousCreditClass(), arrValue, "Previous Credit Class")Then
				LogMessage "RSLT","Verification","Customer Behavior - Previous Credit Class:"&arrValue&" is not displayed as expected",false
				bverifyCustBehav_Deliquency=false
			End If
		End If
		
		Case "Miscellaneous Score"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (Deliquency.lblMescScore(), arrValue, "Miscellaneous Score")Then
				LogMessage "RSLT","Verification","Customer Behavior - Miscellaneous Score:"&arrValue&" is not displayed as expected",false
				bverifyCustBehav_Deliquency=false
			End If
		End If
		
		Case "C/B"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (Deliquency.lblCbValue(), arrValue, "C/B")Then
				LogMessage "RSLT","Verification","Customer Behavior - C/B:"&arrValue&" is not displayed as expected",false
				bverifyCustBehav_Deliquency=false
			End If
		End If
		
		Case "Pricing Counter"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (Deliquency.lblPricingCounter(), arrValue, "Pricing Counter")Then
				LogMessage "RSLT","Verification","Customer Behavior - Pricing Counter:"&arrValue&" is not displayed as expected",false
				bverifyCustBehav_Deliquency=false
			End If
		End If
		
		Case "Unconditional Delinquency"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (Deliquency.lblUnconditionalDel(), arrValue, "Unconditional Delinquency")Then
				LogMessage "RSLT","Verification","Customer Behavior - Unconditional Delinquency:"&arrValue&" is not displayed as expected",false
				bverifyCustBehav_Deliquency=false
			End If
		End If
		
		Case "Past Due"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (Deliquency.lblPastDue(), arrValue, "Past Due")Then
				LogMessage "RSLT","Verification","Overdue Details - Past Due:"&arrValue&" is not displayed as expected",false
				bverifyCustBehav_Deliquency=false
			End If
		End If
		
		Case "Current Due"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (Deliquency.lblCurrentDue(), arrValue, "Current Due")Then
				LogMessage "RSLT","Verification","Overdue Details - Current Due:"&arrValue&" is not displayed as expected",false
				bverifyCustBehav_Deliquency=false
			End If
		End If
		
		Case "Total Due"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (Deliquency.lblTotalDue(), arrValue, "Total Due")Then
				LogMessage "RSLT","Verification","Overdue Details - Total Due:"&arrValue&" is not displayed as expected",false
				bverifyCustBehav_Deliquency=false
			End If
		End If
		End Select
		Next
		verifyCustBehav_Deliquency = bverifyCustBehav_Deliquency
End Function

'[Verify the row data for overdue details table displayed as]
Public Function verifyrowdata_OverdueDeliquency(arrRowDataList)
	bverifyrowdata_OverdueDeliquency= true
	verifyrowdata_OverdueDeliquency = verifyTableContentList(Deliquency.tblOverdueDetailsHeader,Deliquency.tblOverdueDetailsContent,arrRowDataList,"Overdue Details",false,null,null,null)
	verifyrowdata_OverdueDeliquency = bverifyrowdata_OverdueDeliquency
End Function

'[Verify the row data for deliquency history details table displayed as]
Public Function verifyrowdata_DeliquencyHistdetails(arrRowDataList)
	bverifyrowdata_DeliquencyHistdetails= true
	verifyrowdata_DeliquencyHistdetails = bverifyrowdata_DeliquencyHistdetails
End Function
