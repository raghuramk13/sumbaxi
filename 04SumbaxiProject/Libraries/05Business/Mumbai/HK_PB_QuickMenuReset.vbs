'[Verify row Data in Table for Quick Menu in Phone Banking Page]
Public Function verifytblContentQuickMenuPhoneBanking(arrQuickMenuRowDataList)

   verifytblContentQuickMenuPhoneBanking=verifyTableContentList(HK_PB_QuickMenuReset_Page.tblPBQuickMenuHeader(),HK_PB_QuickMenuReset_Page.tblPBQuickMenuContent(),arrQuickMenuRowDataList,"Quick Menu - Phone Banking",false,NULL,NULL,NULL)
End Function
'[Verify row Data in Table for Quick Menu in Quick Menu Reset Page]
Public Function verifytblContentQuickMenuQuickMenuReset(arrQuickMenuRowDataList)

   verifytblContentQuickMenuQuickMenuReset=verifyTableContentList(HK_PB_QuickMenuReset_Page.tblQMHQuickMenuHeader(),HK_PB_QuickMenuReset_Page.tblQMHQuickMenuContent(),arrQuickMenuRowDataList,"Quick Menu - Quick Menu Reset Page",false,NULL,NULL,NULL)
End Function
'[Verify txt CIFNo for Quick Menu Reset]
Public Function verifyQuickMenuResetCIFNoText(strCIFNoText)
	blnverifyQuickMenuResetCIFNoText=true
	If Not verifyInnerText_Pattern(HK_PB_QuickMenuReset_Page.weleQuickMenuResetCifValue(), strCIFNoText, "Quick Menu Reset CIFNo Text") Then
		blnverifyQuickMenuResetCIFNoText=false
	End If
	verifyQuickMenuResetCIFNoText=blnverifyQuickMenuResetCIFNoText
End Function
'[Verify txt Description for Quick Menu Reset]
Public Function verifyQuickMenuResetDescriptionText(strDescriptionText)
	blnverifyQuickMenuResetDescriptionText=true
	If Not verifyInnerText_Pattern(HK_PB_QuickMenuReset_Page.weleQuickMenuResetDescription(),strDescriptionText,"Quick Menu Reset Description Text") Then
		blnverifyQuickMenuResetDescriptionText=false
	End If
	verifyQuickMenuResetDescriptionText=blnverifyQuickMenuResetDescriptionText
End Function
'[Verify txt Phone Banking Number for Quick Menu Reset]
Public Function verifyQuickMenuResetPhoneBankingNumberText(strPBNumberText)
	blnverifyQuickMenuResetPhoneBankingNumberText=true
	If Not verifyInnerText_Pattern(HK_PB_QuickMenuReset_Page.weleQuickMenuResetPBNumber(), strPBNumberText, "Quick Menu Reset Phone Banking Text") Then
		blnverifyQuickMenuResetPhoneBankingNumberText=false
	End If
	verifyQuickMenuResetPhoneBankingNumberText=blnverifyQuickMenuResetPhoneBankingNumberText
End Function
'[Set comments in Quick Menu Reset comments box]
Public Function QuickMenuReset_setComments(strComments)
	blnQuickMenuReset_setComments=true
	HK_PB_CreateProfile_Page.txtDeleteProfileComments().Set strComments
	If Err.Number<>0 Then
		blnQuickMenuReset_setComments=false
		LogMessage "WARN","Verification","Failed to set comments" ,false
	Else
		LogMessage "RSLT","Verification","set the comments as expected",True
		blnQuickMenuReset_setComments=true
	End If
	QuickMenuReset_setComments= blnQuickMenuReset_setComments
End function
'[Verify Confirmation message is displayed Upon Quick Menu Reset Request Submission]
Public Function verifyConfirmationMessageQuickMenuReset()
	blnverifyConfirmationMessageQuickMenuReset = true
	If Not IsNull(strErrorMessage) Then
		If Not VerifyInnerText (HK_PB_CreateProfile_Page.welestpTMApproveCntspan(),"This SR will be routed to Team Manager for following reason(s): Quick Menu Reset.", "Confirmation  message Create PBS") Then
			blnverifyConfirmationMessageQuickMenuReset = false
		End If
	End If
	verifyConfirmationMessageQuickMenuReset = blnverifyConfirmationMessageQuickMenuReset
End Function
