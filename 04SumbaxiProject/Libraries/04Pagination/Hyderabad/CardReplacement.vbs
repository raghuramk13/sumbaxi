Dim CardReplacement
Set CardReplacement = cCardReplacement()

'This is the Screen ReplaceCard

Public Function cCardReplacement()
    Set cCardReplacement = New clsCardReplacement
End Function

Class clsCardReplacement

        Private Sub Class_Initialize()
        End Sub

        Private Sub Class_Terminate()
        End Sub

        '******************************** Object Initialization ******************************************************************


        Public Function pageExists()

           If  (btnReplaceCard().exist) Then
               pageExists = true
            else
              pageExists = false
           End If

        End Function

        Public Function btnReplaceCard()
           Set btnReplaceCard = Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebElement("btnReplaceCard")
        End Function

        Public Function lblReplacementType()
           Set lblReplacementType = Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebElement("lblReplacementType")
        End Function

        Public Function txtNewEmbossingName()
           Set txtNewEmbossingName = Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebEdit("txtNewEmbossingName")																			
        End Function

        Public Function lblNewExpiryDate()
           Set lblNewExpiryDate = Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebElement("lblNewExpiryDate")
        End Function

        Public Function lstUrgency()
           Set lstUrgency = Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebElement("lstUrgency")
        End Function

        Public Function rbtnRedirectionRequired()
           Set rbtnRedirectionRequired = Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebElement("rbtnRedirectionRequired")
        End Function

		Public Function rbtnNewPin()
           Set rbtnNewPin = Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebElement("rbtnNewPin")
        End Function

        Public Function lblRedirectionAddress()
           Set lblRedirectionAddress = Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebElement("lblRedirectionAddress")
        End Function

        Public Function lstReasonforSpecialMailing()
           Set lstReasonforSpecialMailing = Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebElement("lstReasonforSpecialMailing")
        End Function

        Public Function lblDescription()
           Set lblDescription = Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebElement("lblDescription")
        End Function

        Public Function lnkKnowledgeBase()
           Set lnkKnowledgeBase = Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebElement("lnkKnowledgeBase")
        End Function

        Public Function btnAddNotes()
           Set btnAddNotes = Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebElement("btnAddNotes")
        End Function

        Public Function lnkNotes()
           Set lnkNotes = Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebElement("lnkNotes")
        End Function

        Public Function txtComment()
           Set txtComment =Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebEdit("txtComment")
        End Function

        Public Function btnSubmit()
           Set btnSubmit = Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebElement("btnSubmit")
        End Function
        
        'Public Function popupValidationMessage()
         '  Set popupValidationMessage = Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebElement("popupValidationMessage")
        'End Function
        
        Public Function txtComment_Notes()
           Set txtComment_Notes = Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebElement("popupValidationMessage").WebEdit("txtComment_Notes")
        End Function
        
        Public Function lblMaxAllowed()
           Set lblMaxAllowed = Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebElement("popupValidationMessage").WebElement("lblMaxAllowed")
        End Function
        
        Public Function btnOK_ValidationMsg()
           Set btnOK_ValidationMsg = Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebElement("popupValidationMessage").WebElement("btnOK_ValidationMsg")
        End Function

        Public Function btnCancel()
           Set btnCancel = Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebElement("btnCancel")
        End Function

		Public Function lblVerificationRequired_RC()
           Set lblVerificationRequired_RC = Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebElement("lblVerificationRequired_RC")
        End Function

		Public Function btnOK_VerificationRequired()
           Set btnOK_VerificationRequired = Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebElement("btnOK_VerificationRequired")
        End Function

		Public Function btnOK_VerificationFailed()
           Set btnOK_VerificationFailed = Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebElement("popupValidationMessage").WebElement("btnOK_ValidationMsg")
        End Function

		Public Function lblReplacementOption()
           Set lblReplacementOption = Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebElement("lblReplacementOption")
        End Function

		Public Function txtPostalCode()
           Set txtPostalCode = Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebEdit("txtPostalCode")
        End Function
        
		
		Public Function btnGetAddress()
           Set btnGetAddress = Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebElement("btnGetAddress")
        End Function

		Public Function txtAddressLine1()
           Set txtAddressLine1 = Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebEdit("txtAddressLine1")
        End Function

		Public Function txtAddressLine2()
           Set txtAddressLine2 =Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebEdit("txtAddressLine2")
        End Function

		Public Function txtAddressLine3()
           Set txtAddressLine3 = Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebEdit("txtAddressLine3")
        End Function

		Public Function txtAddressLine4()
           Set txtAddressLine4 = Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebEdit("txtAddressLine4")
        End Function

		Public Function txtAddressLine5()
           Set txtAddressLine5 =Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebEdit("txtAddressLine5")
        End Function

		Public Function tblSelectedCardsHeader()
           Set tblSelectedCardsHeader = Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebElement("tblSelectedCardsHeader")
        End Function

		Public Function tblSelectedCardsContent()
           Set tblSelectedCardsContent = Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebElement("tblSelectedCardsContent")
        End Function


		Public Function popupValidationMessage()
           Set popupValidationMessage = Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebElement("popupValidationMessage")
        End Function

        Public Function btnOK_ValidationPopup()
           Set btnOK_ValidationPopup = Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebElement("popupValidationMessage").WebElement("btnOK_ValidationMsg")
        End Function

        Public Function lblValidationMessage()
           Set lblValidationMessage = Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebElement("popupValidationMessage").WebElement("lblValidationMessage")
        End Function

		Public Function txtContactNumber()
           Set txtContactNumber = Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebEdit("txtContactNumber")
        End Function

	
		Public Function lstReplacementReason()
           Set lstReplacementReason = Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebElement("lstReplacementReason")
        End Function

		Public Function lstNewCardType()
           Set lstNewCardType = Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebElement("lstNewCardType")
        End Function

		Public Function rbtnWaiveReplacementFee()
           Set rbtnWaiveReplacementFee = Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebElement("rbtnWaiveReplacementFee")
        End Function		

		Public Function rbtnChargeforUrgentMailing()
           Set rbtnChargeforUrgentMailing = Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebElement("rbtnChargeforUrgentMailing")
        End Function	
        
		'******************1601 change new radio buttons added********************************
		Public Function rbtnCustomerAgreeRevealConctNo()
           Set rbtnCustomerAgreeRevealConctNo = Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebElement("rbtnCustomerAgreeRevealConctNo")
        End Function	
		'****************************************************************************************

		Public Function popupConfirmation()
           Set popupConfirmation = Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebElement("popupConfirmation")
        End Function

		Public Function btnNo_Confirmation()
           Set btnNo_Confirmation = Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebElement("popupConfirmation").WebElement("btnNo_Confirmation")
        End Function

		Public Function btnOK_Confirmation()
           Set btnOK_Confirmation = Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebElement("popupConfirmation").WebElement("btnOK_Confirmation")
        End Function

		Public Function btnYes_Confirmation()
           Set btnYes_Confirmation = Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebElement("popupConfirmation").WebElement("btnYes_Confirmation")
        End Function

		Public Function lblConfirmationMessage()
           Set lblConfirmationMessage = Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebElement("popupConfirmation").WebElement("lblConfirmationMessage")
        End Function

		Public Function popupRequestSubmitted()
           Set popupRequestSubmitted = Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebElement("popupRequestSubmitted")
        End Function
        
        Public Function btnOK_RequestSubmitted()
           Set btnOK_RequestSubmitted = Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebElement("popupRequestSubmitted").WebElement("btnOK_RequestSubmitted")
        End Function
        
        Public Function lblCardReplacementLayout()
           Set lblCardReplacementLayout = Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebElement("lblCardReplacementLayout")
        End Function

'********************************* TM flow objects added newly by Aniket **************************************
		Public Function popup_TMApproval()
			Set popup_TMApproval = Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebElement("popup_TMApproval")
		End Function

		Public Function lblValidationMessage_TMApproval()
			Set lblValidationMessage_TMApproval = Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebElement("popup_TMApproval").WebElement("lblValidationMessage_TMApproval")
		End Function
		
		Public Function btnOk_TMApproval()
			Set btnOk_TMApproval = Browser("Browser_iCall_BlockCancelCard").Page("iCall_CardReplacement").WebElement("popup_TMApproval").WebElement("btnOk_TMApproval")
		End Function

        '******************************** End of Object Initialization ******************************************************************



End Class
