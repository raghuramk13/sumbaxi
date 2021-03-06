'[Select value for Program for bank and earn transaction History]
Public Function SelectProgram_RewardTransactionHistory(strProgram)
   SelectProgram_RewardTransactionHistory = true
   bc_BankEarnTransactionHistory.txtProgram_TranHist.Set strProgram
   WaitForIcallLoading
	If Err.Number<>0 Then
		SelectProgram_RewardTransactionHistory = false
		LogMessage "WARN","Verification","Failed to Set Program" ,false
		Exit Function
	Else 
		LogMessage "RSLT","Verification","Set Program value is Programsfully",true
	End If
End Function

'[Select value for Transaction Category for bank and earn transaction History]
Public Function SelectCategory_RewardTransactionHistory(strCategory)
   bDevPending=false
   bSelectCategory_RewardTransactionHistory=true
   bc_BankEarnTransactionHistory.txtTransactionCategory.Set strCategory
   WaitForIcallLoading
   SelectCategory_RewardTransactionHistory = bSelectCategory_RewardTransactionHistory
End Function

'[Select value for Accountno for bank and earn transaction History]
Public Function SelectAccount_RewardTransactionHistory(strAccNo)
   bDevPending=false
   bSelectAccount_RewardTransactionHistory=true
   bc_BankEarnTransactionHistory.txtAccountCardNo.Set strAccNo
   WaitForIcallLoading
   SelectAccount_RewardTransactionHistory = bSelectAccount_RewardTransactionHistory
End Function

'[Select value for Transaction Period for bank and earn transaction History]
Public Function SelectTransactionPeriod_RewardTransactionHistory(strTranPeriod)
   bDevPending=false
   bSelectTransactionPeriod_RewardTransactionHistory=true
   bc_BankEarnTransactionHistory.txtTransactionPeriod.Set strTranPeriod
   WaitForIcallLoading
   SelectTransactionPeriod_RewardTransactionHistory = bSelectTransactionPeriod_RewardTransactionHistory
End Function

'[Select value for From Date for bank and earn transaction History]
Public Function SelectFromDate_RewardTransactionHistory(strFromDate)
	SelectFromDate_RewardTransactionHistory = selectDateFromCalendar(Rewards.imgFromDatePicker(),strFromDate)
	WaitForIcallLoading
End Function

'[Select value for To Date for bank and earn transaction History]
Public Function SelectToDate_RewardTransactionHistory(strToDate)
   SelectToDate_RewardTransactionHistory = selectDateFromCalendar(Rewards.imgToDatePicker(),strToDate)
   WaitForIcallLoading
End Function

'[Click on Button Go for Bank Earn Transaction History]
Public Function clickbtnGo_RewardsTransactionHistory()
   bDevPending=true
   bc_BankEarnTransactionHistory.btnOK_TransHistory.click
   If Err.Number<>0 Then
       clickbtnGo_RewardsTransactionHistory=false
            LogMessage "WARN","Verification","Failed to Click button Go" ,false
       Exit Function
       Else 
       LogMessage "RSLT","Verification","The button Go is clicked successfully",true
   End If
   clickbtnGo_RewardsTransactionHistory=true
End Function

'[Verify the row data for Transaction History on Bank Earn Transaction History Page]
Public Function verifyrowdata_RewardsTransactionHistory(arrRowDataList)
	bverifyrowdata_RewardsTransactionHistory = true
	verifyrowdata_RewardsTransactionHistory = verifyTableContentList(bc_BankEarnTransactionHistory.tblTransactionHistoryHeader,bc_BankEarnTransactionHistory.tblTransactionHistoryContent,arrRowDataList,"Transaction History",false,null,null,null)
	verifyrowdata_RewardsTransactionHistory = bverifyrowdata_RewardsTransactionHistory
End Function

'[Select the radiobutton by month or by date]
Public Function selectRadioButton_MonthDate(strMonthDate)
	bselectRadioButton_MonthDate = False
	intRadio_Rewards=Instr(Rewards.rbgShow.GetROproperty("class"),"disabled-area")
	If intRadio_Rewards = 0 Then
		bselectRadioButton_MonthDate = SelectRadioButtonGrp(strMonthDate, Rewards.rbgShow, Array("By Month","By Date"))
	Else
		LogMessage "RSLT","Verifiation","Radio button is disabled by default.",True
	End If
	If Err.Number<>0 Then
       bselectRadioButton_MonthDate = false
          LogMessage "WARN","Verification","Failed to select radiobutton or radiobutton is disabled" ,True
       Exit Function
   End If
   selectRadioButton_MonthDate = bselectRadioButton_MonthDate
End Function

'[Verify inline error message displayed on bank earn transaction history page]
Public Function verifyInlineMessage_Transactionhist(strErrorMsg)
	bverifyInlineMessage_Transactionhist=true
	If not VerifyInnerText(bc_BankEarnTransactionHistory.lblInlineMessage_TransHist(), strErrorMsg, "Inline Date Error") Then
       bverifyInlineMessage_Transactionhist=false
	End If
	verifyInlineMessage_Transactionhist=bverifyInlineMessage_Transactionhist
End Function
