'[Verify Foreign Exchange link is enabled]
Public Function verifyDDALink_Enable()
	VerifyObjectEnabledDisabled HK_CCTR_FXRate_Page.lnkForiegnExchangeRate(),"Enable","Forigen Exchange link"
End Function
'[Verify Foreign Exchange link is disabled]
Public Function verifyDDALink_Disable()
	VerifyObjectEnabledDisabled HK_CCTR_FXRate_Page.lnkForiegnExchangeRate(),"Disable","Forigen Exchange link"
End Function
'[Click on Foreign Exchange Account link]
Public Function clickLinkForeignExchange()
	ClickOnObject HK_CCTR_FXRate_Page.lnkForiegnExchangeRate(),"Forigen Exchange link"
	WaitForICallLoading
End Function
'[Click on FX Refresh Button]
Public Function clickFXRefreshButton()
	blnclickFXRefreshButton=true
	HK_CCTR_FXRate_Page.btnFXRefresh().Click
	WaitForICallLoading
	If Err.Number<>0 Then
		blnclickFXRefreshButton=false
		LogMessage "WARN","Verification","Failed to Click Button :Refresh" ,false
	Else
		LogMessage "RSLT","Verification","Clicked on Refresh Button as expected.",True
		blnclickFXRefreshButton=true
	End If
	clickFXRefreshButton=blnclickFXRefreshButton
End Function
'[Click on FX Go Button]
Public Function clickFXGoButton()
	blnclickFXGoButton=true
	HK_CCTR_FXRate_Page.btnFXGo().Click
	WaitForICallLoading
	If Err.Number<>0 Then
		blnclickFXGoButton=false
		LogMessage "WARN","Verification","Failed to Click Button :Go" ,false
	Else
		LogMessage "RSLT","Verification","Clicked on Go Button as expected.",True
		blnclickFXGoButton=true
	End If
	clickFXGoButton=blnclickFXGoButton
End Function

'[Verify Sell Curency Combobox has Items]
Public Function verifySellCurrencyComboboxItems(lstItemsSell)
	blnverifySellCurrencyComboboxItems=true
	
	If Not IsNull(lstItemsSell) Then
		If Not verifyComboboxItems (HK_CCTR_FXRate_Page.lstSellCurrency(),lstItemsSell,"Sell Currency") Then
			blnverifySellCurrencyComboboxItems=false
		End If
	End If
	verifySellCurrencyComboboxItems=blnverifySellCurrencyComboboxItems
End Function
'[Verify Buy Curency Combobox has Items]
Public Function verifyBuyCurrencyComboboxItems(lstItemsBuy)
	blnverifyBuyCurrencyComboboxItems=true
	
	If Not IsNull(lstItemsBuy) Then
		If Not verifyComboboxItems (HK_CCTR_FXRate_Page.lstBuyCurrency(),lstItemsBuy,"Buy Currency") Then
			blnverifyBuyCurrencyComboboxItems=false
		End If
	End If
	verifyBuyCurrencyComboboxItems=blnverifyBuyCurrencyComboboxItems
End Function
'[Select Combobox Sell Currency]
Public Function selectSellCurrencyComboBox(strSellCurrency)

	blnselectSellCurrencyComboBox=true
	If Not IsNull(strSellCurrency) Then
		If Not (selectItem_Combobox (HK_CCTR_FXRate_Page.lstSellCurrency(),strSellCurrency))Then
			LogMessage "WARN","Verification","Failed to select :"&strControlName&" From Action drop down list" ,false
			blnselectSellCurrencyComboBox=false
		End If
	End If
	WaitForICallLoading
	selectSellCurrencyComboBox=blnselectSellCurrencyComboBox
End Function
'[Select Combobox Buy Currency]
Public Function selectBuyCurrencyComboBox(strBuyCurrency)

	blnselectBuyCurrencyComboBox=true
	If Not IsNull(strBuyCurrency) Then
		If Not (selectItem_Combobox (HK_CCTR_FXRate_Page.lstBuyCurrency(),strBuyCurrency))Then
			LogMessage "WARN","Verification","Failed to select :"&strControlName&" From Action drop down list" ,false
			blnselectBuyCurrencyComboBox=false
		End If
	End If
	WaitForICallLoading
	selectBuyCurrencyComboBox=blnselectBuyCurrencyComboBox
End Function
'[Verify row Data in Table for Action in Foreign Exchange Page]
Public Function verifytblContentActionFX(arrActionRowDataList)

   verifytblContentActionFX=verifyTableContentList(HK_CCTR_FXRate_Page.tblFXHeader(),HK_CCTR_FXRate_Page.tblFxContent(),arrActionRowDataList,"Foreign Exchange",false,NULL,NULL,NULL)
End Function
'[Verify message is displayed in Foreign Exchange page]
Public Function verifyFXMessage()
	blnverifyFXMessage = true
	
		If Not VerifyInnerText (HK_CCTR_FXRate_Page.weleNoteMsg(),"Note : This is solely for Hong Kong region internal reference only. Rates quoted are subjected to change without prior notice.", "FX Note") Then
			blnverifyFXMessage = false
		End If
	
	verifyFXMessage = blnverifyFXMessage
End Function
'[Verify error message is displayed in Foreign Exchange page upon clicking go button]
Public Function verifyFXErrMessage()
	blnverifyFXErrMessage = true
	
		If Not VerifyInnerText (HK_CCTR_FXRate_Page.weleFXErrMsg(),"No rate found for the currency pair. Please select another currency.", "FX Error Msg") Then
			blnverifyFXErrMessage = false
		End If
	
	verifyFXErrMessage = blnverifyFXErrMessage
End Function
