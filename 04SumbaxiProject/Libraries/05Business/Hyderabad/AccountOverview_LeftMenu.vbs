
Dim bcAccountOverview_LeftMenu
Set bcAccountOverview_LeftMenu = cAccountOverview_LeftMenu()

'This is the Screen AccountOverview_LeftMenu

Public Function cAccountOverview_LeftMenu()
    Set cAccountOverview_LeftMenu = New clsAccountOverview_LeftMenu
End Function

Class clsAccountOverview_LeftMenu

        Private Sub Class_Initialize()
        End Sub

        Private Sub Class_Terminate()
        End Sub

        '******************************** Object Initialization ******************************************************************


        Public Function pageExists()
    		   If  (btnBalanceLimits().exist(0)) Then
					LogMessage "RSLT","Verification","Accounts Overview page exists" ,True
				   pageExists = true
				else
				  LogMessage "WARN","Verification","Accounts Overview page does not exists" ,False
				  pageExists = false
			   End If

        End Function

        Public Function btnBalanceLimits()
           Set btnBalanceLimits = Browser("Browser_iCall_Home").Page("iCall_AccountOverview_LeftMenu").WebElement("btnBalanceLimits")
        End Function

        Public Function btnCustomerDetails()
           Set btnCustomerDetails = Browser("Browser_iCall_Home").Page("iCall_AccountOverview_LeftMenu").WebElement("btnCustomerDetails")
        End Function

        Public Function btnDirectDebit()
           Set btnDirectDebit = Browser("Browser_iCall_Home").Page("iCall_AccountOverview_LeftMenu").WebElement("btnDirectDebit")
        End Function

        Public Function btnInstallmentPlan()
           'Set btnInstallmentPlan = Browser("Browser_iCall_Home").Page("iCall_AccountOverview_LeftMenu").WebButton("btnInstallmentPlan")
           Set btnInstallmentPlan = Browser("Browser_iCall_Home").Page("iCall_AccountOverview_LeftMenu").WebElement("btnInstallmentPlan")
        End Function

        Public Function btnInsurance()
           Set btnInsurance = Browser("Browser_iCall_Home").Page("iCall_AccountOverview_LeftMenu").WebElement("btnInsurance")
        End Function

        Public Function btnKeyInfo()
           'Set btnKeyInfo = Browser("Browser_iCall_Home").Page("iCall_AccountOverview_LeftMenu").WebButton("btnKeyInfo")
           Set btnKeyInfo =Browser("Browser_iCall_Home").Page("iCall_AccountOverview_LeftMenu").WebElement("btnKeyInfo")

           
        End Function

        Public Function btnNotes()
           'Set btnNotes = Browser("Browser_iCall_Home").Page("iCall_AccountOverview_LeftMenu").WebButton("btnNotes")
            Set btnNotes =Browser("Browser_iCall_Home").Page("iCall_AccountOverview_LeftMenu").WebElement("btnNotes")
		End Function

        Public Function btnOtherPlans()
           'Set btnOtherPlans = Browser("Browser_iCall_Home").Page("iCall_AccountOverview_LeftMenu").WebButton("btnOtherPlans")
           Set btnOtherPlans = Browser("Browser_iCall_Home").Page("iCall_AccountOverview_LeftMenu").WebElement("btnOtherPlans")
		End Function
        

        Public Function btnPaymentHistory()
           'Set btnPaymentHistory = Browser("Browser_iCall_Home").Page("iCall_AccountOverview_LeftMenu").WebButton("btnPaymentHistory")
            Set btnPaymentHistory = Browser("Browser_iCall_Home").Page("iCall_AccountOverview_LeftMenu").WebElement("btnPaymentHistory")
		 End Function

        Public Function btnRelationshipDetails()
           'Set btnRelationshipDetails = Browser("Browser_iCall_Home").Page("iCall_AccountOverview_LeftMenu").WebButton("btnRelationshipDetails")
           Set btnRelationshipDetails = Browser("Browser_iCall_Home").Page("iCall_AccountOverview_LeftMenu").WebElement("btnRelationshipDetails")
           
        End Function

        Public Function btnRewards()
           Set btnRewards = Browser("Browser_iCall_Home").Page("iCall_AccountOverview_LeftMenu").WebElement("btnRewards")
        End Function

        Public Function btnSMSThresholds()
           Set btnSMSThresholds = Browser("Browser_iCall_Home").Page("iCall_AccountOverview_LeftMenu").WebElement("btnSMSThresholds")
        End Function

        Public Function btnStatement()
           'Set btnStatement = Browser("Browser_iCall_Home").Page("iCall_AccountOverview_LeftMenu").WebButton("btnStatement")
           Set btnStatement = Browser("Browser_iCall_Home").Page("iCall_AccountOverview_LeftMenu").WebElement("btnStatement")
        End Function

        Public Function btnTransactionHistory()
           'Set btnTransactionHistory = Browser("Browser_iCall_Home").Page("iCall_AccountOverview_LeftMenu").WebButton("btnTransactionHistory")
           Set btnTransactionHistory = Browser("Browser_iCall_Home").Page("iCall_AccountOverview_LeftMenu").WebElement("btnTransactionHistory")
        End Function

		 Public Function btnDelinquency()
           'Set btnDelinquency = Browser("Browser_iCall_Home").Page("iCall_AccountOverview_LeftMenu").WebButton("btnDelinquency")
           Set btnDelinquency = Browser("Browser_iCall_Home").Page("iCall_AccountOverview_LeftMenu").WebElement("btnDelinquency")

        End Function

		Public Function btnTopup()
           Set btnTopup = Browser("Browser_iCall_Home").Page("iCall_AccountOverview_LeftMenu").WebElement("btnTopup")
        End Function

		Public Function btnChequeInventory()
           Set btnChequeInventory = Browser("Browser_iCall_Home").Page("iCall_AccountOverview_LeftMenu").WebElement("btnChequeInventory")
        End Function

		Public Function btnRecurringArrangement()
           'Set btnRecurringArrangement = Browser("Browser_iCall_Home").Page("iCall_AccountOverview_LeftMenu").WebButton("btnRecurringArrangement")
           Set btnRecurringArrangement = Browser("Browser_iCall_Home").Page("iCall_AccountOverview_LeftMenu").WebElement("btnRecurringArrangement")
            
        End Function
		
		Public Function btnPlans()
           Set btnPlans = Browser("Browser_iCall_Home").Page("iCall_AccountOverview_LeftMenu").WebElement("btnPlans")
        End Function
        
        Public Function btnBankAndEarnEnrollment()
        	Set btnBankAndEarnEnrollment = Browser("Browser_iCall_Home").Page("iCall_AccountOverview_LeftMenu").WebElement("btnBankAndEarnEnrollment")
        End Function
        
        Public Function btnBankAndEarnSummary()
        	Set btnBankAndEarnSummary = Browser("Browser_iCall_Home").Page("iCall_AccountOverview_LeftMenu").WebElement("btnBankAndEarnSummary")
        End Function
        
        Public Function btnCardRewards()
        	Set btnCardRewards = Browser("Browser_iCall_Home").Page("iCall_AccountOverview_LeftMenu").WebElement("btnCardRewards")
        End Function
        
        Public Function btnCardRewardTransactions()
        	Set btnCardRewardTransactions = Browser("Browser_iCall_Home").Page("iCall_AccountOverview_LeftMenu").WebElement("btnCardRewardTransactions")
        End Function
        
        '******************************** End of Object Initialization ******************************************************************

        '*****************************Buttons & Link Clicks on the Page **********************************************************
        Public Sub clickBalanceLimits()
            btnBalanceLimits().Click
        End Sub

        Public Sub clickCustomerDetails()
            btnCustomerDetails().Click
        End Sub

        Public Sub clickDirectDebit()
            btnDirectDebit().Click
        End Sub

        Public Sub clickInstallmentPlan()
            btnInstallmentPlan().Click
        End Sub

        Public Sub clickInsurance()
            btnInsurance().Click
        End Sub

        Public Sub clickKeyInfo()
            btnKeyInfo().Click
        End Sub

        Public Sub clickNotes()
            btnNotes().Click
        End Sub

        Public Sub clickOtherPlans()
            btnOtherPlans().Click
        End Sub

        Public Sub clickPaymentHistory()
            btnPaymentHistory().Click
        End Sub

        Public Sub clickRelationshipDetails()
            btnRelationshipDetails().Click
        End Sub

        Public Sub clickRewards()
            btnRewards().Click
        End Sub

        Public Sub clickSMSThresholds()
            btnSMSThresholds().Click
        End Sub

        Public Sub clickStatement()
            btnStatement().Click
        End Sub

        Public Sub clickTransactionHistory()
            btnTransactionHistory().Click
        End Sub

		Public Sub clickDelinquency()
		   btnDelinquency.Click
		End Sub

		Public Sub clickTopup()
		   btnTopup.Click
		End Sub

		Public Sub clickChequeInventory()
		   btnChequeInventory.Click
		End Sub

		Public Sub clickRecurringArrangement()
		   btnRecurringArrangement.Click
		End Sub

		Public Sub clickPlans()
		   btnPlans.Click
		End Sub
		
		Public Sub clickBankandEarnEnrollment()
		   btnBankAndEarnEnrollment.Click
		End Sub
		
		Public Sub clickbtnBankAndEarnSummary()
			btnBankAndEarnSummary.Click
		End Sub
		
		Public Sub clickbtnCardRewards()
			btnCardRewards.Click
		End Sub
		
		Public Sub clickbtnCardRewardTransactions()
			btnCardRewardTransactions.Click
		End Sub
			
        '*****************************End of Buttons & Link Clicks on the Page **********************************************************

        '*****************************Function on the Screen **********************************************************


        '*****************************End of Function on the Screen **********************************************************
End Class
