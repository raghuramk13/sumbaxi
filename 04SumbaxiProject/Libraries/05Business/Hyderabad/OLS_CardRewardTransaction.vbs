'[Select value for Transaction Type from the combolist]
Public Function SelectTransactionType_RewardTransactions(strTransactionType)
   bSelectTransactionType_RewardTransactions=true
   CardRewardsTransaction.txtTransactionType.Set strTransactionType
   WaitForIcallLoading
   SelectTransactionType_RewardTransactions=bSelectTransactionType_RewardTransactions
End Function

'[Select value for Card Type from the combolist]
Public Function SelectCardType_RewardTransactions(strCardType)
   bSelectCardType_RewardTransactions=true
   If Not IsNull(strCardType) Then
       If Not (selectItem_Combobox (CardRewardsTransaction.lstSelectCard(), strCardType))Then
            LogMessage "WARN","Verification","Failed to select :"&strCardType&" From Show drop down list" ,false
           bSelectCardType_RewardTransactions=false
       End If
   End If
   SelectCardType_RewardTransactions=bSelectCardType_RewardTransactions
End Function

'[Select value for From Date from the combolist]
Public Function SelectFromDate_RewardTransactions(strFromDate)
   'bDevPending=false
   bSelectFromDate_RewardTransactions=true
    CardRewardsTransaction.txtFromDate.Set strFromDate
   WaitForIcallLoading
   SelectFromDate_RewardTransactions=bSelectFromDate_RewardTransactions
End Function

'[Select Past value for From Date from the combolist]
Public Function SelectPastFromDate_RewardTransactions(strFromDate)
	SelectPastFromDate_RewardTransactions = true
	strFromDate = CardRewardsTransaction.txtToDate.GetRoProperty("value")
   FromDate = cstr (dateAdd("d",-31,cdate(strFromDate))) 
   CardRewardsTransaction.txtFromDate.Set FromDate
   If Err.Number<>0 Then
       SelectPastFromDate_RewardTransactions=false
       LogMessage "WARN","Verification","Failed to Set Date" ,false
       Exit Function
   Else 
       LogMessage "RSLT","Verification","Past From Date Set successfully",true
   End If   
   WaitForIcallLoading
End Function

'[Select value for To Date from the combolist]
Public Function SelectToDate(strToDate)
   'bDevPending=false
   bSelectToDate=true
   CardRewardsTransaction.txtToDate.Set strToDate
   WaitForIcallLoading
   SelectToDate=bSelectToDate
End Function

'[Click on Button Go on Card Rewards Transaction Page]
Public Function clickbtnGo_RewardsTransaction()
   bDevPending=true
   CardRewardsTransaction.btnGo.click
   If Err.Number<>0 Then
       clickbtnGo_RewardsTransaction=false
            LogMessage "WARN","Verification","Failed to Click button Go" ,false
       Exit Function
       Else 
       LogMessage "RSLT","Verification","The button Go is clicked successfully",true
   End If
   WaitForIcallLoading
   clickbtnGo_RewardsTransaction=true
End Function

''[Verify Table Earned Points has following Columns]
'Public Function verifyEarnedPointsTableColumns(arrColumnNameList)
'   bverifyEarnedPointsTableColumns= true
'   	verifyEarnedPointsTableColumns=verifyTableColumns(CardRewardsTransaction.tblEarnedPointsHeader,arrColumnNameList)
'   	verifyEarnedPointsTableColumns=bverifyEarnedPointsTableColumns
'End Function

'[Verify row Data for Earned Points Table]
Public Function verifyEarnedPoints_RowData(arrRowDataList)
   bverifyEarnedPoints_RowData= true
   verifyEarnedPoints_RowData=verifyTableContentList(CardRewardsTransaction.tblEarnedPointsHeader,CardRewardsTransaction.tblEarnedPointsContent,arrRowDataList,"Earned Points-Rebates" ,  false,null ,null,null)
   verifyEarnedPoints_RowData = bverifyEarnedPoints_RowData
End Function

''[Verify Table Redeemed Points has following Columns]
'Public Function verifyRedeemedPointsTableColumns(arrColumnNameList)
'   bDevPending=true
'   bverifyRedeemedPointsTableColumns= true
'   	verifyRedeemedPointsTableColumns=verifyTableColumns(CardRewardsTransaction.tblRedeemedPointsHeader,arrColumnNameList)
'   	verifyRedeemedPointsTableColumns=bverifyRedeemedPointsTableColumns
'End Function

'[Verify row Data for Redeemed Points Table]
Public Function verifyRedeemedPoints_RowData(arrRowDataList)
   'bDevPending=false
   bverifyRedeemedPoints_RowData= true
   verifyRedeemedPoints_RowData=verifyTableContentList(CardRewardsTransaction.tblRedeemedPointsHeader,CardRewardsTransaction.tblRedeemedPointsContent,arrRowDataList,"Redeemed Points-Rebates",false,null ,null,null)
   verifyRedeemedPoints_RowData = bverifyRedeemedPoints_RowData
End Function

'[Verify inline error message displayed]
Public Function verifyInlineMessage_RewardsTransaction(strErrorMsg)
	bverifyInlineMessage_RewardsTransaction=true
	If not VerifyInnerText(CardRewardsTransaction.lblInlineMessage(), strErrorMsg, "Inline Date Error") Then
       bverifyInlineMessage_RewardsTransaction=false
	End If
	verifyInlineMessage_RewardsTransaction=bverifyInlineMessage_RewardsTransaction
End Function

'[Verify Shortcut Button on Rewards Transaction Page]
Public Function VerifyShortcutButton_RewardsTransaction()
	 bDevPending=true
	 bVerifyShortcutButton_RewardsTransaction = true
	 
	 If (CardRewardsTransaction.btnPointsRedemption().exist) Then
	 	LogMessage "RSLT","Verification","The Shortcut button Point Redemption exist",True
	 	else
	 	LogMessage "RSLT","Verification","The Shortcut button Point Redemption does not exist",False
	 End If
	  VerifyShortcutButton_RewardsTransaction= bVerifyShortcutButton_RewardsTransaction
End Function

'[Verify the click Reference from earned points rebates table]
Public Function clickReference_CardsRewardsTransaction(lstRowData)
	bclickReference_CardsRewardsTransaction = true
	clickReference_CardsRewardsTransaction = selectTableLink(CardRewardsTransaction.tblEarnedPointsHeader,CardRewardsTransaction.tblEarnedPointsContent,lstRowData,"Earned Points-Rebates","Reference",false,null,null,null)
	clickReference_CardsRewardsTransaction = bclickReference_CardsRewardsTransaction
End Function

'[Verify the popup for Tranaction Info exist]
Public Function verifyTransactionInfo(bExist)
	bDevPending=false
   bActualExist=CardRewardsTransaction.popupTransactionInfo.Exist(2)
   If bExist And  bActualExist  Then
       LogMessage "RSLT","Verification","Popup :Transaction Info Exists As Expected" ,true
       verifyTransactionInfo=True
   ElseIf not bExist And  not bActualExist  Then
       LogMessage "RSLT","Verification","Popup :Transaction Info does not Exists As Expected" ,true
       verifyTransactionInfo=True
   ElseIf bExist And  not bActualExist  Then
       LogMessage "WARN","Verification","Popup :Transaction Info does not Exists As Expected" ,False
       verifyTransactionInfo=False
   ElseIf not bExist And   bActualExist  Then
       LogMessage "WARN","Verification","Popup :Transaction Info Still Exists" ,False
       verifyTransactionInfo=False
   End If
End Function

'[Verify the fields of the Transaction Info popup]
Public Function verifyfields_TransactionInfo(lstTransactionDetails)
	bverifyfields_TransactionInfo = true
	intSize = Ubound(lstTransactionDetails)
	For Iterator = 0 To intSize Step 1
		arrLabel = trim(Split(lstTransactionDetails(Iterator),":")(0))
		arrValue = trim(Split(lstTransactionDetails(Iterator),":")(1))
		
	Select Case (arrLabel)
		Case "Transaction Code"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (CardRewardsTransaction.lblTransactionCode(), arrValue, "Transaction Code")Then
				LogMessage "WARN","Verification","Transaction Info - Transaction Code:"&arrValue&" is not displayed as expected",false
				bverifyfields_TransactionInfo=false
			End If
		End If
		
		Case "Campaign"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (CardRewardsTransaction.lblCampaign(), arrValue, "Campaign")Then
				LogMessage "WARN","Verification","Transaction Info - Campaign:"&arrValue&" is not displayed as expected",false
				bverifyfields_TransactionInfo=false
			End If
		End If
		
		Case "Rule"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (CardRewardsTransaction.lblRule(), arrValue, "Rule")Then
				LogMessage "WARN","Verification","Transaction Info - Rule:"&arrValue&" is not displayed as expected",false
				bverifyfields_TransactionInfo=false
			End If
		End If
		
		Case "Store Name"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (CardRewardsTransaction.lblStoreName(), arrValue, "Store Name")Then
				LogMessage "WARN","Verification","Transaction Info - Store Name:"&arrValue&" is not displayed as expected",false
				bverifyfields_TransactionInfo=false
			End If
		End If
		
		Case "Reason"
		If Not IsNull(arrValue) Then
			If Not VerifyInnerText (CardRewardsTransaction.lblReason(), arrValue, "Reason")Then
				LogMessage "WARN","Verification","Transaction Info - Reason:"&arrValue&" is not displayed as expected",false
				bverifyfields_TransactionInfo=false
			End If
		End If
		End Select
	Next 
		CardRewardsTransaction.btnOk_TransInfo.click
		verifyfields_TransactionInfo =bverifyfields_TransactionInfo
End Function

'[Select card from combobox for card rewards transactions]
Public Function selectCard_RewardsTransaction(strCard)
   bDevPending=false
   bselectCard_RewardsTransaction=true
   If Not IsNull(strCard) Then
       If Not (selectItem_Combobox (CardRewardsTransaction.lstSelectCard(), strCard))Then
            LogMessage "WARN","Verification","Failed to select :"&strCard&" From Select Card drop down list" ,false
           bselectCard_RewardsTransaction=false
       End If
   End If
   WaitForIcallLoading
   selectCard_RewardsTransaction=bselectCard_RewardsTransaction
End Function

'[Verify the click Voucher Details link from redeemed points rebates table]
Public Function clickVoucher_CardsRewardsTransaction(lstRowData)
	bclickVoucher_CardsRewardsTransaction = true
	clickVoucher_CardsRewardsTransaction = selectTableLink(CardRewardsTransaction.tblRedeemedPointsHeader,CardRewardsTransaction.tblRedeemedPointsContent,lstRowData,"Redeemed Points-Rebates","Voucher Details",false,null,null,null)
	clickVoucher_CardsRewardsTransaction = bclickVoucher_CardsRewardsTransaction
End Function

'[Verify the popup for Voucher Details exist]
Public Function verifyVoucherDetail(bExist)
	bDevPending=false
   bActualExist=CardRewardsTransaction.popupVoucherDetails.Exist(2)
   If bExist And  bActualExist  Then
       LogMessage "RSLT","Verification","Popup :Voucher Details Exists As Expected" ,true
       verifyVoucherDetail=True
   ElseIf not bExist And  not bActualExist  Then
       LogMessage "RSLT","Verification","Popup :Voucher Details does not Exists As Expected" ,true
       verifyVoucherDetail=True
   ElseIf bExist And  not bActualExist  Then
       LogMessage "WARN","Verification","Popup :Voucher Details does not Exists As Expected" ,False
       verifyVoucherDetail=False
   ElseIf not bExist And   bActualExist  Then
       LogMessage "WARN","Verification","Popup :Voucher Details Still Exists" ,False
       verifyVoucherDetail=False
   End If
End Function

'[Verify row Data for Voucher details Table]
Public Function verifyVoucherDetails_RowData(arrRowDataList)
   bDevPending=false
   bverifyVoucherDetails_RowData= true
   verifyVoucherDetails_RowData=verifyTableContentList(CardRewardsTransaction.tblVoucherDetailsHeader,CardRewardsTransaction.tblVoucherDetailsContent,arrRowDataList,"Voucher Details",false,null ,null,null)
   CardRewardsTransaction.btnOK_Voucher.Click
   WaitForIcallLoading
   verifyVoucherDetails_RowData = bverifyVoucherDetails_RowData
End Function

'[Verify and Click Card Rewards Transaction Link from leftMenu]
Public Function clickLink_OlsCardRewardsTransaction()
	bclickLink_OlsCardRewardsTransaction = true
	bcAccountOverview_LeftMenu.btnCardRewardTransactions.click
	WaitForIcallLoading
	clickLink_OlsCardRewardsTransaction = bclickLink_OlsCardRewardsTransaction
End Function
