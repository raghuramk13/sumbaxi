
'[Verify Button SMS Registration Code Exist]
Public Function verifyButtonSMSRegCode()
   bDevPending=false
   bverifyButtonSMSRegCode=true
	If not (TM.btnSMSRegCode.exist(0)) Then
		bverifyButtonSMSRegCode=false
	End If
	WaitForICallLoading
    verifyButtonSMSRegCode=bverifyButtonSMSRegCode
End Function

'[Verify Field Location on Token Management displayed as]
Public Function verifyLocation_TM(strLocation)
   bverifyLocation_TM=true
   If Not IsNull(strLocation) Then
       If Not VerifyInnerText (TM.lblLocation(), strLocation, "Location")Then
           bverifyLocation_TM=false
       End If
   End If
   verifyLocation_TM=bverifyLocation_TM
End Function

'[Verify Field Status on Token Management displayed as]
Public Function verifyStatus_TM(strStatus)
   bverifyStatus_TM=true
   If Not IsNull(strStatus) Then
       If Not VerifyInnerText (TM.lblStatus(), strStatus, "Status")Then
           bverifyStatus_TM=false
       End If
   End If
   verifyStatus_TM=bverifyStatus_TM
End Function

'[Verify Field Application Type on Token Management displayed as]
Public Function verifyApplicationType_TM(strApplicationType)
   bverifyApplicationType_TM=true
   If Not IsNull(strApplicationType) Then
       If Not VerifyInnerText (TM.lblApplicationType(), strApplicationType, "Application Type")Then
           bverifyApplicationType_TM=false
       End If
   End If
   verifyApplicationType_TM=bverifyApplicationType_TM
End Function

'[Verify Field Registration Failure Count on Token Management displayed as]
Public Function verifyRegistrationFailureCount_TM(strRegistrationFailureCount)
   bverifyRegistrationFailureCount_TM=true
   If Not IsNull(strRegistrationFailureCount) Then
       If Not VerifyInnerText (TM.lblRegistrationFailureCount(), strRegistrationFailureCount, "Registration Failure Count")Then
           bverifyRegistrationFailureCount_TM=false
       End If
   End If
   verifyRegistrationFailureCount_TM=bverifyRegistrationFailureCount_TM
End Function

'[Verify Field Registration Failure Reason on Token Management displayed as]
Public Function verifyRegistrationFailureReason_TM(strRegistrationFailureReason)
   bverifyRegistrationFailureReason_TM=true
   If Not IsNull(strRegistrationFailureReason) Then
       If Not VerifyInnerText (TM.lblRegistrationFailureReason(), strRegistrationFailureReason, "Registration Failure Reason")Then
           bverifyRegistrationFailureReason_TM=false
       End If
   End If
   verifyRegistrationFailureReason_TM=bverifyRegistrationFailureReason_TM
End Function

'[Verify Field Replace Count on Token Management displayed as]
Public Function verifyReplaceCount_TM(strReplaceCount)
   bverifyReplaceCount_TM=true
   If Not IsNull(strReplaceCount) Then
       If Not VerifyInnerText (TM.lblReplaceReissuanceCount(), strReplaceCount, "Replace Count")Then
           bverifyReplaceCount_TM=false
       End If
   End If
   verifyReplaceCount_TM=bverifyReplaceCount_TM
End Function

'[Verify Radio Button Show on Token Management Screen Selected as]
Public Function verifyDefaultShowRadioSelection(strSelectedradioButton)	
	bverifyDefaultShowRadioSelection=true
	bverifyDefaultShowRadioSelection=VerifyRadioButtonGrpSelection(strSelectedradioButton,TM.rbtnGroup_Show, Array("Customer CIN","Token Serial Number"))
	If bverifyDefaultShowRadioSelection Then
		LogMessage "RSLT","Verification","Radio Button :Show selected as ecxpected. Selected value is "&strSelectedradioButton ,true
	else
		LogMessage "RSLT","Verification","Radio Button :Show is not selected as ecxpected. Selected value is "&strSelectedradioButton ,false
	End If
    If Err.Number<>0 Then
       bverifyDefaultShowRadioSelection=false
       LogMessage "WARN","Verification","Failed to Verify Radio Button :Show" ,false
       Exit Function
   End If
   verifyDefaultShowRadioSelection=bverifyDefaultShowRadioSelection
End Function

'[Verify row Data in Table Token Details]
Public Function verifyTokenDetails_TM(arrRowDataList)
   verifyTokenDetails_TM=verifyTableContentList(TM.tblTokenDetailsHeader,TM.tblTokenDetailsContent,arrRowDataList,"Token Details", false, null, null, null)
End Function

'[Click on Serial Number from Token Details Table on Token Management Screen]
Public Function clickSerialNumber_TM(lstTokenDetails)	
	clickSerialNumber_TM = selectTableLink(TM.tblTokenDetailsHeader,TM.tblTokenDetailsContent, lstTokenDetails, "Token Details", "Serial Number", false, null, null, null)
End Function

'[Verify Field Token Model on Individual Token Details displayed as]
Public Function verifyTokenModel_TM(strTokenModel)
   bverifyTokenModel_TM=true
   If Not IsNull(strTokenModel) Then
       If Not VerifyInnerText (TM.lblTokenModel(), strTokenModel, "Token Model")Then
           bverifyTokenModel_TM=false
       End If
   End If
   verifyTokenModel_TM=bverifyTokenModel_TM
End Function

'[Verify Field Status on Individual Token Details displayed as]
Public Function verifyStatusTokenDetails_TM(strStatus)
   bverifyStatusTokenDetails_TM=true
   If Not IsNull(strStatus) Then
       If Not VerifyInnerText (TM.lblStatus_TokenDetails(), strStatus, "Status")Then
           bverifyStatusTokenDetails_TM=false
       End If
   End If
   verifyStatusTokenDetails_TM=bverifyStatusTokenDetails_TM
End Function

'[Verify Field Replacement Reason on Individual Token Details displayed as]
Public Function verifyReplacementReason_TM(strReplacementReason)
   bverifyReplacementReason_TM=true
   If Not IsNull(strReplacementReason) Then
       If Not VerifyInnerText (TM.lblReplacementReason(), strReplacementReason, "Replacement Reason")Then
           bverifyReplacementReason_TM=false
       End If
   End If
   verifyReplacementReason_TM=bverifyReplacementReason_TM
End Function

'[Verify Field Registration Date on Individual Token Details displayed as]
Public Function verifyRegistrationDate_TM(strRegistrationDate)
   bverifyRegistrationDate_TM=true
   If Not IsNull(strRegistrationDate) Then
       If Not VerifyInnerText (TM.lblRegistrationDate(), strRegistrationDate, "Registration Date")Then
           bverifyRegistrationDate_TM=false
       End If
   End If
   verifyRegistrationDate_TM=bverifyRegistrationDate_TM
End Function

'[Click on Button SMS Registeration Code in Token Management Page]
Public Function clickBtnSMSRegisterCode()	
	IComm.btnSMSRegCode.Click
	If Err.Number<>0 Then
       clicklnkTokenMgt=false
       LogMessage "WARN","Verification","Failed to Click Button : Token Management" ,false
       Exit Function
   End If
    clickBtnSMSRegisterCode=true
	WaitForICallLoading
End Function

'[Verify Field Registration By CIN on Individual Token Details displayed as]
Public Function verifyRegistrationBy_TM(strRegistrationBy)
   bverifyRegistrationBy_TM=true
   If Not IsNull(strRegistrationBy) Then
       If Not VerifyInnerText (TM.lblRegistrationBy(), strRegistrationBy, "Registration By")Then
           bverifyRegistrationBy_TM=false
       End If
   End If
   verifyRegistrationBy_TM=bverifyRegistrationBy_TM
End Function

'[Verify Field Last Updated Date on Individual Token Details displayed as]
Public Function verifyLastUpdatedDate_TM(strLastUpdatedDate)
   bverifyLastUpdatedDate_TM=true
   If Not IsNull(strLastUpdatedDate) Then
       If Not VerifyInnerText (TM.lblLastUpdatedDate(), strLastUpdatedDate, "Last Updated Date")Then
           bverifyLastUpdatedDate_TM=false
       End If
   End If
   verifyLastUpdatedDate_TM=bverifyLastUpdatedDate_TM
End Function

'[Verify Field Last Updated By on Individual Token Details displayed as]
Public Function verifyLastUpdatedBy_TM(strLastUpdatedBy)
   bverifyLastUpdatedBy_TM=true
   If Not IsNull(strLastUpdatedBy) Then
       If Not VerifyInnerText (TM.lblLastUpdatedBy(), strLastUpdatedBy, "Last Updated By")Then
           bverifyLastUpdatedBy_TM=false
       End If
   End If
   verifyLastUpdatedBy_TM=bverifyLastUpdatedBy_TM
End Function

'[Verify Field Upload Date on Individual Token Details displayed as]
Public Function verifyUploadDate_TM(strUploadDate)
   bverifyUploadDate_TM=true
   If Not IsNull(strUploadDate) Then
       If Not VerifyInnerText (TM.lblUploadDate(), strUploadDate, "Upload Date")Then
           bverifyUploadDate_TM=false
       End If
   End If
   verifyUploadDate_TM=bverifyUploadDate_TM
End Function

'[Verify Field Issued Date on Individual Token Details displayed as]
Public Function verifyIssuedDate_TM(strIssuedDate)
   bverifyIssuedDate_TM=true
   If Not IsNull(strIssuedDate) Then
       If Not VerifyInnerText (TM.lblIssuedDate(), strIssuedDate, "Issued Date")Then
           bverifyIssuedDate_TM=false
       End If
   End If
   verifyIssuedDate_TM=bverifyIssuedDate_TM
End Function

'[Verify Field Deactivation Date on Individual Token Details displayed as]
Public Function verifyDeactivationDate_TM(strDeactivationDate)
   bverifyDeactivationDate_TM=true
   If Not IsNull(strDeactivationDate) Then
       If Not VerifyInnerText (TM.lblDeactivationDate(), strDeactivationDate, "Deactivation Date")Then
           bverifyDeactivationDate_TM=false
       End If
   End If
   verifyDeactivationDate_TM=bverifyDeactivationDate_TM
End Function

'[Verify Field Disposal Date on Individual Token Details displayed as]
Public Function verifyDisposalDate_TM(strDisposalDate)
   bverifyDisposalDate_TM=true
   If Not IsNull(strDisposalDate) Then
       If Not VerifyInnerText (TM.lblDisposalDate(), strDisposalDate, "Disposal Date")Then
           bverifyDisposalDate_TM=false
       End If
   End If
   verifyDisposalDate_TM=bverifyDisposalDate_TM
End Function

'[Click on OK button on Individual Token Details]
Public Function clickBtnOKTokenDetails_TM()	
	TM.btnOK().Click
	If Err.Number<>0 Then
       clickBtnOKTokenDetails_TM=false
            LogMessage "WARN","Verification","Failed to Click OK button." ,false
       Exit Function
   End If
   clickBtnOKTokenDetails_TM = true
End Function

'[Verify row Data in Table Notification Details]
Public Function verifyNotificationDetails_TM(arrRowDataList)
   verifyNotificationDetails_TM=verifyTableContentList(TM.tblNotificationDetailsHeader,TM.tblNotificationDetailsContent,arrRowDataList,"Notification Details" , false, null, null, null)
End Function

'[Verify Show Combobox has Items in TMS Page displayed]
Public Function verifyShowComboboxItems_TMS(lstItems)   
   bverifyShowComboboxItems=true
   If Not IsNull(lstItems) Then
       If Not verifyComboboxItems (TM.lstShow(), lstItems, "Show")Then
           bverifyShowComboboxItems=false
       End If
   End If
   verifyShowComboboxItems_TMS=bverifyShowComboboxItems
End Function

'[Select Combobox Show in TMS Page]
Public Function selectShowComboBox_TMS(strShow)
   bselectShowComboBox=true
   waitForIcallLoading
   If Not IsNull(strShow) Then
       If Not (selectItem_Combobox (TM.lstShow(), strShow))Then
            LogMessage "WARN","Verification","Failed to select :"&strShow&" From Show drop down list" ,false
           bselectShowComboBox=false
       End If
   End If
   waitForIcallLoading
   selectShowComboBox_TMS=bselectShowComboBox
End Function

'[Verify row Data in Table Customer History]
Public Function verifyCustomerHistory_TM(arrRowDataList)
   If Not IsNull(arrRowDataList) Then
   verifyCustomerHistory_TM=verifyTableContentList(TM.tblShowHeader,TM.tblShowContent,arrRowDataList,"Customer History" , false, null, null, null)
   End IF 
End Function

'[Click on More Info from Customer History Table on Token Management Screen]
Public Function clickMoreInfoCustHistory_TM(lstCustomerHistory)	
	clickMoreInfoCustHistory_TM = selectTableLink(TM.tblShowHeader,TM.tblShowContent, lstCustomerHistory, "Customer History", "More Info", false, null, null, null)
End Function

'[Verify Field Courier Charges on Customer History Details displayed as]
Public Function VerifyCourierCharges_TM(strCourierCharge)
   bVerifyCourierCharges=true
   If Not IsNull(strCourierCharge) Then
       If Not VerifyInnerText (TM.lblCourierCharges(), strCourierCharge, "Courier Charges")Then
           bVerifyCourierCharges=false
       End If
   End If
   VerifyCourierCharges_TM = bVerifyCourierCharges
End Function

'[Verify Field Waive Replacement Charges on Customer History Details displayed as]
Public Function VerifyWaiveReplacementCharge_TM(strWaiveReplacementCharge)
   bVerifyReplacementCharge=true
   If Not IsNull(strWaiveReplacementCharge) Then
       If Not VerifyInnerText (TM.lblWaiveReplacementCharges(), strWaiveReplacementCharge, "Waive Replacement Charge")Then
           bVerifyReplacementCharge=false
       End If
   End If
   VerifyWaiveReplacementCharge_TM = bVerifyReplacementCharge
End Function

'[Verify Field Total Charges on Customer History Details displayed as]
Public Function VerifyTotalCharges_TM(strCourierCharge)
   bVerifyTotalCharges=true
   If Not IsNull(strCourierCharge) Then
       If Not VerifyInnerText (TM.lblTotalCharges(), strCourierCharge, "Total Charges")Then
           bVerifyTotalCharges=false
       End If
   End If
   VerifyTotalCharges_TM = bVerifyTotalCharges
End Function

'[Verify Field Replacement Charges on Customer History Details displayed as]
Public Function VerifyReplacementCharge_TM(strReplacementCharge)
   bVerifyReplacementCharge=true
   If Not IsNull(strReplacementCharge) Then
       If Not VerifyInnerText (TM.lblReplacementCharges(), strReplacementCharge, "Replacement Charge (Subject to GST)")Then
           bVerifyReplacementCharge=false
       End If
   End If
   VerifyReplacementCharge_TM = bVerifyReplacementCharge
End Function

'[Verify Field Reason on Customer History Details displayed as]
Public Function VerifyReason_TM(strReason,strType)
   bVerifyReason=true
   If Not IsNull(strReason) Then
	  If strType = "TRP" Then
	   	   If Not VerifyInnerText (TM.lblReason_TRP(), strReason, "Token Serial Number")Then
	           bVerifyReason=false
	       End If  
	  ElseIf (strType = "ULT") OR (strType = "LKT")  OR (strType = "TRS") OR (strType = "RST") Then
	       If Not VerifyInnerText (TM.lblReason(), strReason, "Token Serial Number") Then
	           bVerifyReason=false
	       End If   	
   	  End If   	
	End If 
   VerifyReason_TM = bVerifyReason
End Function

'[Verify Field Token Serial Number on Customer History Details displayed as]
Public Function VerifyTokenSerialNumber_TM(strTokenNumber,ShowType)
   bVerifySerialNum=true
   If Not IsNull(strTokenNumber) Then
	  If ShowType = "RST" Then
	   	   If Not VerifyInnerText (TM.lblTokenSerialNumber_RST(), strTokenNumber, "Token Serial Number")Then
	           bVerifySerialNum = false
	       End If  
	  ElseIf ShowType = "TRP" Then
	   	   If Not VerifyInnerText (TM.lblTokenSerialNumber_TRP(), strTokenNumber, "Token Serial Number")Then
	           bVerifySerialNum = false
	       End If  
	  ElseIf (ShowType = "ULT") OR (ShowType = "LKT")  OR (ShowType = "TRS") Then
	       If Not VerifyInnerText (TM.lblTokenSerialNumber(), strTokenNumber, "Token Serial Number")Then
	           bVerifySerialNum = false
	       End If   
   	   End IF
   End If
   VerifyTokenSerialNumber_TM = bVerifySerialNum
End Function

'[Verify Field Registration Date on Customer History Details displayed as]
Public Function VerifyRegistrationDate_TM(strRegistrationDate)
   bVerifyRegistrationDate=true
   If Not IsNull(strRegistrationDate) Then
       If Not VerifyInnerText (TM.lblRegistrationDate(), strRegistrationDate, "Registration Date")Then
           bVerifyRegistrationDate=false
       End If
   End If
   VerifyRegistrationDate_TM = bVerifyRegistrationDate
End Function

'[Verify Field Token Status on Customer History Details displayed as]
Public Function VerifyTokenStatus_TM(strTokenStatus)
   bVerifyTokenStatus=true
   If Not IsNull(strTokenStatus) Then
       If Not VerifyInnerText (TM.lblTokenStatus(), strTokenStatus, "Token Status")Then
           bVerifyTokenStatus=false
       End If
   End If
   VerifyTokenStatus_TM = bVerifyTokenStatus
End Function

'[Verify Field Remarks on Customer History Details displayed as]
Public Function VerifyRemarks_TM(strRemarks,ShowType)
   bVerifyRemarks=true
   If Not IsNull(strRemarks) Then
	  If ShowType = "TIF" OR ShowType = "CAC" Then
	   	   If Not VerifyInnerText (TM.lblRemarks(), strRemarks, "Remarks")Then
	           bVerifyRemarks = false
	       End If  
	  ElseIf ShowType = "TNG" Then
	   	   If Not VerifyInnerText (TM.lblRemarks_TNG(), strRemarks, "Remarks")Then
	           bVerifyRemarks = false
	       End If  
	  ElseIf ShowType = "CRC" Then
	   	   If Not VerifyInnerText (TM.lblRemarks_CRC(), strRemarks, "Remarks")Then
	           bVerifyRemarks = false
	       End If  
	  ElseIf ShowType = "NMC" Then
	       If Not VerifyInnerText (TM.lblRemarks_NMC(), strRemarks, "Remarks")Then
	           bVerifyRemarks = false
	       End If   
	   End If 
   End If
   TM.btnOK_CustomerHistoryDetails.Click
   VerifyRemarks_TM = bVerifyRemarks
End Function

'[Verify Field Collection Date on Customer History Details displayed as]
Public Function VerifyCollectionDate_TM(strCollectionDate)
   bVerifyCollectionDate=true
   If Not IsNull(strCollectionDate) Then
       If Not VerifyInnerText (TM.lblCollectionDate(), strCollectionDate, "Collection Date")Then
           bVerifyCollectionDate=false
       End If
   End If
   VerifyCollectionDate_TM = bVerifyCollectionDate
End Function

'[Verify Field Collection ID on Customer History Details displayed as]
Public Function VerifyCollectionID_TM(strCollectionID)
   bVerifyCollectionID=true
   If Not IsNull(strCollectionID) Then
       If Not VerifyInnerText (TM.lblCollectorID(), strCollectionID, "Collection ID")Then
           bVerifyCollectionID=false
       End If
   End If
   VerifyCollectionID_TM = bVerifyCollectionID
End Function

'[Verify Field Collection ID Type on Customer History Details displayed as]
Public Function VerifyCollectionIDType_TM(strCollectionIDType)
   bVerifyCollectionIDType=true
   If Not IsNull(strCollectionIDType) Then
       If Not VerifyInnerText (TM.lblCollectorIDType(), strCollectionIDType, "Collection ID Type")Then
           bVerifyCollectionIDType=false
       End If
   End If
   VerifyCollectionIDType_TM = bVerifyCollectionIDType
End Function

'[Verify Field Collection Name on Customer History Details displayed as]
Public Function VerifyCollectionName_TM(strCollectionName)
   bVerifyCollectionName=true
   If Not IsNull(strCollectionName) Then
       If Not VerifyInnerText (TM.lblCollectorName(), strCollectionName, "Collection Name")Then
           bVerifyCollectionName=false
       End If
   End If
   VerifyCollectionName_TM = bVerifyCollectionName
End Function

'[Verify Field Self Allocation on Customer History Details displayed as]
Public Function VerifySelfCollection_TM(strSelfCollection)
   bVerifySelfCollection=true
   If Not IsNull(strSelfCollection) Then
       If Not VerifyInnerText (TM.lblSelfCollection(), strSelfCollection, "Self Allocation")Then
           bVerifySelfCollection=false
       End If
   End If
   VerifySelfCollection_TM = bVerifySelfCollection
End Function

'[Verify Field Address on Customer History Details displayed as]
Public Function verifyAddress_TM(strAddress)
   bverifyAddress_TM=true
   If Not IsNull(strAddress) Then
       If Not VerifyInnerText (TM.lblAddress(), strAddress, "Address")Then
           bverifyAddress_TM=false
       End If
   End If
   verifyAddress_TM=bverifyAddress_TM
End Function

'[Verify Field Notification Code on Customer History Details displayed as]
Public Function verifyNotificationCode_TM(strNotificationCode,ShowType)
   bverifyNotificationCode_TM=true
   If Not IsNull(strNotificationCode) Then
	  If (ShowType = "TIF" OR ShowType = "TNG"  OR ShowType = "NMC") Then
	       If Not VerifyInnerText (TM.lblNotificationCode(), strNotificationCode, "Notification Code")Then
	           bverifyNotificationCode_TM = false
	       End If  
	  ElseIf ShowType = "TIS" Then
	   	   If Not VerifyInnerText (TM.lblNotificationCode_TIS(), strNotificationCode, "Notification Code")Then
	           bverifyNotificationCode_TM = false
	       End If  
	   End If 
   End If
   verifyNotificationCode_TM=bverifyNotificationCode_TM
End Function

'[Verify Field Notification Mode on Customer History Details displayed as]
Public Function verifyNotificationMode_TM(strNotificationMode,ShowType)
   bverifyNotificationMode=true
   If Not IsNull(strNotificationMode) Then
	  If (ShowType = "TIF") OR (ShowType = "TNG")  OR (ShowType = "NMC") Then
	       If Not VerifyInnerText (TM.lblNotificationMode(), strNotificationMode, "Notification Mode")Then
	           bverifyNotificationMode = false
	       End If  
	  ElseIf ShowType = "TIS" Then
	   	   If Not VerifyInnerText (TM.lblNotificationMode_TIS(), strNotificationMode, "Notification Mode")Then
	           bverifyNotificationMode = false
	       End If  
	   End If 
   End If
   verifyNotificationMode_TM=bverifyNotificationMode
End Function

'[Verify Field Notification Status on Customer History Details displayed as]
Public Function verifyNotificationStatus_TM(strNotificationStatus)
   bverifyNotificationStatus=true
   If Not IsNull(strNotificationStatus) Then
       If Not VerifyInnerText (TM.lblNOtificationStatus(), strNotificationStatus, "Notification Status")Then
           bverifyNotificationStatus=false
       End If
   End If
   verifyNotificationStatus_TM=bverifyNotificationStatus
End Function

'[Verify Field Priority on Customer History Details displayed as]
Public Function verifyPriority_TM(strPriority)
   bverifyPriority=true
   If Not IsNull(strPriority) Then
       If Not VerifyInnerText (TM.lblPriority(), strPriority, "Priority")Then
           bverifyPriority=false
       End If
   End If
   verifyPriority_TM=bverifyPriority
End Function

'[Verify Field Channel Type on Customer History Details displayed as]
Public Function verifyChannelType_TM(strChannelType)
   bverifyChannelType=true
   If Not IsNull(strChannelType) Then
       If Not VerifyInnerText (TM.lblChannelType(), strChannelType, "Channel Type")Then
           bverifyChannelType=false
       End If
   End If
   verifyChannelType_TM=bverifyChannelType
End Function

'[Verify Field IB on Customer History Details displayed as]
Public Function verifyIBUserid_TM(strIBUserId)
   bverifyIB=true
   If Not IsNull(strIBUserId) Then
       If Not VerifyInnerText (TM.lblIBUserID(), strIBUserId, "IB User ID")Then
           bverifyIB=false
       End If
   End If
   verifyIBUserid_TM=bverifyIB
End Function

'[Verify row Data in Table Channel Account]
Public Function verifyChannelAccount_TM(arrRowDataList)
   verifyChannelAccount_TM=verifyTableContentList(TM.tblShowHeader,TM.tblShowContent,arrRowDataList,"Channel Account" , false, null, null, null)
End Function

'[Verify Field No of Extension on Grace Period displayed as]
Public Function verifyNoofExtension_TM(strNoofExtension)
   bverifyNoofExtension_TM=true
   If Not IsNull(strNoofExtension) Then
       If Not VerifyInnerText (TM.lblNoofExtension(), strNoofExtension, "No of Extension")Then
           bverifyNoofExtension_TM=false
       End If
   End If
   verifyNoofExtension_TM=bverifyNoofExtension_TM
End Function

'[Verify Field Last Extension Date on Grace Period displayed as]
Public Function verifyLastExtensionDate_TM(strLastExtensionDate)
   bverifyLastExtensionDate_TM=true
   If Not IsNull(strLastExtensionDate) Then
       If Not VerifyInnerText (TM.lblLastExtensionDate(), strLastExtensionDate, "Last Extension Date")Then
           bverifyLastExtensionDate_TM=false
       End If
   End If
   verifyLastExtensionDate_TM=bverifyLastExtensionDate_TM
End Function

'[Verify Field Last Extension Period on Grace Period displayed as]
Public Function verifyLastExtensionPeriod_TM(strLastExtensionPeriod)
   bverifyLastExtensionPeriod_TM=true
   If Not IsNull(strLastExtensionPeriod) Then
       If Not VerifyInnerText (TM.lblLastExtensionPeriod(), strLastExtensionPeriod, "Last Extension Period")Then
           bverifyLastExtensionPeriod_TM=false
       End If
   End If
   verifyLastExtensionPeriod_TM=bverifyLastExtensionPeriod_TM
End Function

'[Verify Field Grace Period Assigned on Grace Period displayed as]
Public Function verifyGracePeriodAssigned_TM(strGracePeriodAssigned)
   bverifyGracePeriodAssigned_TM=true
   If Not IsNull(strGracePeriodAssigned) Then
       If Not VerifyInnerText (TM.lblGracePeriodAssigned(), strGracePeriodAssigned, "Grace Period Assigned")Then
           bverifyGracePeriodAssigned_TM=false
       End If
   End If
   verifyGracePeriodAssigned_TM=bverifyGracePeriodAssigned_TM
End Function

'[Verify Field Grace Period Left on Grace Period displayed as]
Public Function verifyGracePeriodLeft_TM(strGracePeriodLeft)
   bverifyGracePeriodLeft_TM=true
   If Not IsNull(strGracePeriodLeft) Then
       If Not VerifyInnerText (TM.lblGracePeriodLeft(), strGracePeriodLeft, "Grace Period Left")Then
           bverifyGracePeriodLeft_TM=false
       End If
   End If
   verifyGracePeriodLeft_TM=bverifyGracePeriodLeft_TM
End Function

'[Verify Field Expiry Date on Grace Period displayed as]
Public Function verifyExpiryDate_TM(strExpiryDate)
   bverifyExpiryDate_TM=true
   If Not IsNull(strExpiryDate) Then
       If Not VerifyInnerText (TM.lblExpiryDate(), strExpiryDate, "Expiry Date")Then
           bverifyExpiryDate_TM=false
       End If
   End If
   verifyExpiryDate_TM=bverifyExpiryDate_TM
End Function

'[Select Radio button in Show for Token Management]
Public Function selectRadioButton_TM(strShow)
	selectRadioButton_TM=true
	selectRadioButton_TM=SelectRadioButtonGrp(strShow,TM.rbtnGroup_Show, Array("Customer CIN","Token Serial Number"))   
	If Err.Number<>0 Then
       selectRadioButton_TM=false
       LogMessage "WARN","Verification","Failed to Click Radio Button : Show" ,false
       Exit Function
   End If   
End Function

'[Set TextBox Token Serial Number on Token Management System to]
Public Function setTokenSerialNumber_TM(strTokenSerialNumber)
  If Not IsNull(strTokenSerialNumber) Then
	TM.txtTokenSerialNumber.Set(strTokenSerialNumber)
	If Err.Number<>0 Then
       setTokenSerialNumber_TM=false
       LogMessage "WARN","Verification","Failed to Set Text Box :Token Serial Number" ,false
       Exit Function
    End If
  End If
   setTokenSerialNumber_TM=true
End Function

'[Click on GO button on Individual Token Details]
Public Function clickBtnGOTokenDetails_TM()	
	TM.btnGO().Click
	If Err.Number<>0 Then
       clickBtnGOTokenDetails_TM=false
            LogMessage "WARN","Verification","Failed to Click GO button." ,false
       Exit Function
   End If
   WaitForICallLoading
   clickBtnGOTokenDetails_TM = true
End Function

'[Verify Field Error Message on Invalid Token Number displayed as]
Public Function verifyErrorMessage_TM(strErrorMessage)
   bverifyErrorMessage_TM=true
   If Not IsNull(strErrorMessage) Then
       If Not VerifyInnerText (TM.lblErrorMessage(), strErrorMessage, "Token Number")Then
           bverifyErrorMessage_TM=false
       End If
   End If
   verifyErrorMessage_TM=bverifyErrorMessage_TM
End Function

'[Verify list of submenus displayed for the status displayed in Individual token details screen]
Public Function VerifyIndividualTokenSubMenu_TM(lstSubmenulinks)
	bverifystatusSubmenu = True 
	intSize = Ubound(lstSubmenulinks)
	For Iterator = 0 To intSize Step 1
		arrLinkName = trim(Split(lstSubmenulinks(Iterator),":")(0))
		arrdisplay  = trim(Split(lstSubmenulinks(Iterator),":")(1))
		TM.StatusIcon.Click
	 Select Case (arrLinkName)
			Case "Activate"
			   lnkActivate = TM.lnkActivate.GetRoProperty("text")
			   If arrLinkName = lnkActivate Then
		    	   bDisabled =InStr(TM.lnkActivate.GetROProperty("class"),"disabled-area")		
					If arrdisplay = "Disabled" Then 
			    		If bDisabled <>0 Then
						   LogMessage "RSLT","Verification","Sub Menu Icon is "&arrdisplay&" as expected",True
						   bverifystatusSubmenu = True 
 					    Else
							LogMessage "WARN","Verification","Sub Menu Icon "&arrLinkName&" is not "&arrdisplay&" as expected ",False
							bverifystatusSubmenu = False 
							Exit Function
					    End If 
					ElseIf arrdisplay = "Enabled" Then
				    	If bDisabled = 0 Then
						   LogMessage "RSLT","Verification","Sub Menu Icon is "&arrdisplay&" as expected",True
						   bverifystatusSubmenu = True 
 					    Else
							LogMessage "WARN","Verification","Sub Menu Icon "&arrLinkName&" is not "&arrdisplay&" as expected ",False
							bverifystatusSubmenu = False 
							Exit Function
					    End If 					
					End If 
				End If
			Case "Lock"
			   lnkLock = TM.lnkLock.GetRoProperty("text")			   
			   If arrLinkName = lnkLock Then
		    	   bDisabled =InStr(TM.lnkLock.GetROProperty("class"),"disabled-area")		
					If arrdisplay = "Disabled" Then 
			    		If bDisabled <>0 Then
						   LogMessage "RSLT","Verification","Sub Menu Icon is "&arrdisplay&" as expected",True
						   bverifystatusSubmenu = True 
 					    Else
							LogMessage "WARN","Verification","Sub Menu Icon "&arrLinkName&" is not "&arrdisplay&" as expected ",False
							bverifystatusSubmenu = False 
							Exit Function
					    End If 
					ElseIf arrdisplay = "Enabled" Then
				    	If bDisabled = 0 Then
						   LogMessage "RSLT","Verification","Sub Menu Icon is "&arrdisplay&" as expected",True
						   bverifystatusSubmenu = True 
 					    Else
							LogMessage "WARN","Verification","Sub Menu Icon "&arrLinkName&" is not "&arrdisplay&" as expected ",False
							bverifystatusSubmenu = False 
							Exit Function
					    End If 
					End If 
			 End If		
			Case "Replacement"
			   lnkReplacement = TM.lnkReplacement.GetRoProperty("text")			   
			   If arrLinkName = lnkReplacement Then
		    	   bDisabled =InStr(TM.lnkReplacement.GetROProperty("class"),"disabled-area")		
					If arrdisplay = "Disabled" Then 
			    		If bDisabled <>0 Then
						   LogMessage "RSLT","Verification","Sub Menu Icon is "&arrdisplay&" as expected",True
						   bverifystatusSubmenu = True 
 					    Else
							LogMessage "WARN","Verification","Sub Menu Icon "&arrLinkName&" is not "&arrdisplay&" as expected ",False
							bverifystatusSubmenu = False 
							Exit Function
					    End If 
					ElseIf arrdisplay = "Enabled" Then
				    	If bDisabled = 0 Then
						   LogMessage "RSLT","Verification","Sub Menu Icon is "&arrdisplay&" as expected",True
						   bverifystatusSubmenu = True 
 					    Else
							LogMessage "WARN","Verification","Sub Menu Icon "&arrLinkName&" is not "&arrdisplay&" as expected ",False
							bverifystatusSubmenu = False 
							Exit Function
					    End If 
					End If 
			 End If	
			Case "Resync"
			   lnkResync = TM.lnkResync.GetRoProperty("text")			   
			   If arrLinkName = lnkResync Then
		    	   bDisabled =InStr(TM.lnkResync.GetROProperty("class"),"disabled-area")		
					If arrdisplay = "Disabled" Then 
			    		If bDisabled <>0 Then
						   LogMessage "RSLT","Verification","Sub Menu Icon is "&arrdisplay&" as expected",True
						   bverifystatusSubmenu = True 
 					    Else
							LogMessage "WARN","Verification","Sub Menu Icon "&arrLinkName&" is not "&arrdisplay&" as expected ",False
							bverifystatusSubmenu = False 
							Exit Function
					    End If 
					ElseIf arrdisplay = "Enabled" Then
				    	If bDisabled = 0 Then
						   LogMessage "RSLT","Verification","Sub Menu Icon is "&arrdisplay&" as expected",True
						   bverifystatusSubmenu = True 
 					    Else
							LogMessage "WARN","Verification","Sub Menu Icon "&arrLinkName&" is not "&arrdisplay&" as expected ",False
							bverifystatusSubmenu = False 
							Exit Function
					    End If 
					End If 
			 End If	
			 Case "Unlock"
			   lnkUnlock = TM.lnkUnlock.GetRoProperty("text")			   
			   If arrLinkName = lnkUnlock Then
		    	   bDisabled =InStr(TM.lnkUnlock.GetROProperty("class"),"disabled-area")		
					If arrdisplay = "Disabled" Then 
			    		If bDisabled <>0 Then
						   LogMessage "RSLT","Verification","Sub Menu Icon is "&arrdisplay&" as expected",True
						   bverifystatusSubmenu = True 
 					    Else
							LogMessage "WARN","Verification","Sub Menu Icon "&arrLinkName&" is not "&arrdisplay&" as expected ",False
							bverifystatusSubmenu = False 
							Exit Function
					    End If 
					ElseIf arrdisplay = "Enabled" Then
				    	If bDisabled = 0 Then
						   LogMessage "RSLT","Verification","Sub Menu Icon is "&arrdisplay&" as expected",True
						   bverifystatusSubmenu = True 
 					    Else
							LogMessage "WARN","Verification","Sub Menu Icon "&arrLinkName&" is not "&arrdisplay&" as expected ",False
							bverifystatusSubmenu = False 
							Exit Function
					    End If 
					End If 
			 End If	
	 End Select
	Next	
WaitForICallLoading
VerifyIndividualTokenSubMenu_TM = bverifystatusSubmenu
End Function

'[Verify Action Menu from Token details table]
Public Function VerifyActionMenu_TM(strTokenStatus)
   bVerifyActionMenu_TM = True
   If strTokenStatus = "NOT REGISTERED" Or strTokenStatus = "NOTISSUED" Then       
   	  bDisabled =InStr(TM.lnkUnlock.GetROProperty("class"),"disabled-area")    
   	  bVerifyActionMenu_TM= selectTableSubMenu(TM.tblTokenDetailsHeader,TM.tblTokenDetailsContent,strTokenStatus,"GIRO Details","Actions",False,NULL,NULL,NULL,"Lock",bDisabled)
   	  	If bDisabled Then
		LogMessage "RSLT", "Verification","Lock action menu is not enabled",false
		bVerifyActionMenu_TM=false
	    End If
   End IF 
	WaitForICallLoading
	Wait 1
    VerifyActionMenu_TM = bVerifyActionMenu_TM
End Function

'[Verify Error Message displayed in the Token Management Screen]
Public Function verifyErrorMessage_TMS(strErrorMessage)
  bErrorMessage = True 
  If Not VerifyInnerText (TM.ErrorMsg(), strErrorMessage, "Error Message") Then
     bErrorMessage = false
  End If
 verifyErrorMessage_TMS = bErrorMessage
End Function

'[Verify Token Management link disabled under Banking Facilities section]
Public Function verifyLinkDisable_TMS()
	bverifylinkDisable=true	
	waitForIcallLoading	
	intTokenManagement =InStr(bcCustomerOverview.lnkTokenMgt.GetROProperty("class"),"disabled-area")
	If not intTokenManagement=0 Then
		LogMessage "RSLT","Verification","Token Management link is disabled as expected.",True
	Else
		LogMessage "WARN","Verifiation","Token Management link is enabled. Expected to be disable.",false
		bverifylinkDisable=false
	End If
	verifyLinkDisable_TMS = bverifylinkDisable
End Function

'[Verify Field Request Type on TMS displayed as]
Public Function verifyRequestType_TMS(strRequestType)
   bverifyRequestType_TM=true
   If Not IsNull(strRequestType) Then
       If Not VerifyInnerText (TM.lblRequestType(), strRequestType, "Request Type") Then
           bverifyRequestType_TM=false
       End If
   End If
   verifyRequestType_TMS=bverifyRequestType_TM
End Function

'[Verify row Data Selected Token in TMS Page]
Public Function verifySelectedToken_TMS(arrRowDataList)	
   verifySelectedToken_TMS=verifyTableContentList(TM.tblSelectedTokenHeader,TM.tblSelectedTokenContent,arrRowDataList,"Token Details" , false, null, null, null)
End Function

'[Verify row Data Selected Token status in TMS Page]
Public Function verifySelectedTokenstatus_TMS(arrRowDataList)	
   verifySelectedTokenstatus_TMS=verifyTableContentList(TM.tblSelectedTokenHeader1,TM.tblSelectedTokenContent2,arrRowDataList,"Token Details" , false, null, null, null)
End Function

'[Select Action Menu from Token details table on Token Management Screen]
Public Function SelectActionMenu_TMS(lstTokenDetails,strActionName)
   	bSelectActionMenu=true
	bSelectActionMenu= selectTableSubMenu(TM.tblTokenDetailsHeader,TM.tblTokenDetailsContent,lstTokenDetails,"Token Details","Action",False,NULL,NULL,NULL,strActionName,bDisabled)
	If bDisabled Then
		LogMessage "RSLT", "Verification","Action menu in Token details table is not enabled",false
		bSelectActionMenu=false
	End If
	WaitForICallLoading
	Wait 1
	SelectActionMenu_TMS = bSelectActionMenu
End Function

'[Click on Action Menu displayed in Status field]
Public Function SelectActionMenu_IndividiualStatus(strItem)
	bverifyselectSubMenuItem = True
	TM.StatusIcon.Click
	Set oMenuPopupDesc=Description.Create	
		oMenuPopupDesc("micclass").Value = "WebElement"
		oMenuPopupDesc("class").Value = "popupForm"
	set oSubMenupopup=Browser("micclass:=Browser").Page("micclass:=Page").ChildObjects(oMenuPopupDesc)			
		
	Set oMenuDesc=Description.Create	
		oMenuDesc("micclass").Value = "WebElement"
		oMenuDesc("class").Value = "menu-list.*"
	set oSubMenu=oSubMenupopup(0).ChildObjects(oMenuDesc)
	
	Set oMenuItem=Description.Create	
		oMenuItem("micclass").Value = "WebElement"
		oMenuItem("class").Value = ".*md-button.*"
		
	set lstSubMenu=oSubMenu(0).ChildObjects(oMenuItem)
			
	intItems=lstSubMenu.Count
	For iCount=0 to intItems-1
		Dim strTemp:strTemp=""
		strTemp=lstSubMenu(iCount).GetRoProperty("text")
		
	If strTemp=strItem Then
		'Check the link enabled or disabled
		bDisabled =InStr(lstSubMenu(iCount).GetROProperty("class"),"disabled-area")
		If bDisabled <>0Then
			LogMessage "WARN","Verification","Sub Menu Icon is disabled in Row Number ",True
			bMenuDisabled=True
			bverifyselectSubMenuItem= False
			Exit Function
		Else
			bMenuDisabled=False
			LogMessage "INFO","Verification","Sub Menu  is enabled in Row Number"&intRow,True
			lstSubMenu(iCount).click
			WaitForICallLoading
			LogMessage "RSLT","Verification","Item "&strItem&" selected from Submenu sucessfully. Item Index is "& intItemIndex,true
			bverifyselectSubMenuItem = True
			Exit Function
		 End If
	End If
	Next
SelectActionMenu_IndividiualStatus = bverifyselectSubMenuItem
End Function

'[Verify field Lock date displayed as]
Public Function verifyLockDate_TMS(strLockDate)
   bverifyLockDate_TM=true
   If Not IsNull(strLockDate) Then
       If Not VerifyInnerText (TM.lblLockDate(), strLockDate, "Lock Date") Then
           bverifyLockDate_TM=false
       End If
   End If
   verifyLockDate_TMS=bverifyLockDate_TM
End Function

'[Verify field Unblock date Info message1 displayed as]
Public Function verifyUnblockDateInfoMsg1_TMS(strInfoMsg1)
   bverifyInfoMsg_TM = true
   If Not IsNull(strInfoMsg1) Then
       If Not VerifyInnerText (TM.InfoUnlocklbl1(), strInfoMsg1, "Unblock date Info message1") Then
           bverifyInfoMsg_TM = false
       End If
   End If
   verifyUnblockDateInfoMsg1_TMS = bverifyInfoMsg_TM
End Function

'[Verify field Unblock date Info message2 displayed as]
Public Function verifyUnblockDateInfoMsg2_TMS(strInfoMsg2)
   bverifyInfoMsg_TM = true
   If Not IsNull(strInfoMsg2) Then
       If Not VerifyInnerText (TM.InfoUnlocklbl2(), strInfoMsg2, "Unblock date Info message2") Then
           bverifyInfoMsg_TM = false
       End If
   End If
   verifyUnblockDateInfoMsg2_TMS = bverifyInfoMsg_TM
End Function

'[Verify Combox box Reason has list of items]
Public Function VerifylistReason_TMS(lstofReason) 
	bVerifylistReason = True 
	If Not IsNull(lstofReason) Then
       If Not verifyComboboxItems(TM.lstReason(),lstofReason,"List of Reasons") Then
       	   LogMessage "WARN","Verification","List of Reasons displayed as expected" ,false
           bVerifylistReason = False
       End If
   End If
   VerifylistReason_TMS = bVerifylistReason
End Function

'[Select Combox box Reason displayed as]
Public Function selectComboReason_TMS(strReason)
	bselectComboReason = true
	If Not IsNull(strReason) Then
       If Not (selectItem_Combobox (TM.lstReason(), strReason))Then
            LogMessage "WARN","Verification","Failed to select :"&strReason&" from Reason drop down list" ,false
           bselectComboReason=false
       End If
   End If
   selectComboReason_TMS = bselectComboReason
   WaitForICallLoading
End Function

'[Verify default Reason field in TMS Page displayed as]
Public Function VerifyFieldReason_TMS(strReason)
	bVerifyReason = true
	If Not IsNull(strReason) Then
       If Not verifyComboSelectItem (TM.lstReason(),strReason, "Reason") Then
           LogMessage "WARN","Verification","Expected Default Reason:"&strReason&" not displayed in the Reason" ,false
           bVerifyReason=false
       End If
   End If
   VerifyFieldReason_TMS = bVerifyReason
End Function

'[Verify default Delivery Mode field in TMS Page displayed as]
Public Function VerifyDeliveryMode_TMS(strDeliveryMode)
	bVerifyDeliveryMode = true
	If Not IsNull(strDeliveryMode) Then
       If Not verifyComboSelectItem (TM.lstDeliveryMode(),strDeliveryMode, "Delivery Mode") Then
           LogMessage "WARN","Verification","Expected Default Delivery Mode:"&strDeliveryMode&" not displayed in the Reason" ,false
           bVerifyDeliveryMode=false
       End If
   End If
   VerifyDeliveryMode_TMS = bVerifyDeliveryMode
End Function

'[Select SubMenu from Action Icon in Token Management Page]
Public Function selectSubMenuTokenSerialNo_TMS(strItem)
	bselectSubMenuTokenSerialNo=true
	WaitForICallLoading
	lnkActivate = TM.lnkActivate.GetRoProperty("text")
	strRunTimeAccruedOverdraftInterest=BalancesAndLimits.lblLimits_AccruedOverdraft.getroproperty("innertext")
	Set oDesc=Description.Create
	oDesc("micclass").Value = "WebElement"	
	'oDesc("class").Value = "md-no-padding"
	oDesc("class").Value = "popupForm"
	BalancesAndLimits.lblLimits_ActionIcon.click
	set lstSubMenu=Browser("micclass:=Browser").Page("micclass:=Page").ChildObjects(oDesc)
	intItems=lstSubMenu.Count	
	'intItems=BalancesAndLimits.lblLimits_ActionIcon.Count
	
	For iCount=0 to intItems
		Dim strTemp:strTemp=""
		strTemp=lstSubMenu(iCount).GetRoProperty("text")
		If strTemp=strItem Then
			'Check the link enabled or disabled
			bDisabled =InStr(lstSubMenu(iCount).GetROProperty("class"),"disabled-area")
    		If bDisabled <>0Then
				LogMessage "WARN","Verification","Sub Menu Icon is disabled in Row Number ",True
				bMenuDisabled=True
				selectSubMenu_BL=true
			Exit Function
			Else
				bMenuDisabled=False
				LogMessage "INFO","Verification","Sub Menu  is enabled in Row Number"&intRow,True
				Set oMenuItem=Description.Create	
				oMenuItem("micclass").Value = "WebElement"
	  			'oMenuItem("class").Value = ".*flex"
	  			oMenuItem("class").Value = "md-button.*"
	  			set lstSubMenu=lstSubMenu(iCount).ChildObjects(oMenuItem)
				lstSubMenu(iCount).click
				strTemp=lstSubMenu(iCount).GetRoProperty("text")
				If Not IsNUll(strTemp) Then
				   lstSubMenu(iCount).click
				End If
				WaitForICallLoading
				LogMessage "RSLT","Verification","Item "&strItem&" selected from Submenu sucessfully. Item Index is "& intItemIndex,true
				selectSubMenu_BL=true
			Exit Function
			End If
		End If
		intItemIndex=intItemIndex+1
	Next
	selectSubMenu_BL=bselectSubMenu_BL	
End Function

'[Verify Field Notification Mode on TMS Page displayed as]
Public Function VerifyFieldNotificationMode_TMS(strNotificationMode)
   bverifyNotificationMode=true
   If Not IsNull(strNotificationMode) Then
       If Not VerifyInnerText (TM.lblNotificationMode(), strNotificationMode, "Notification Mode")Then
           bverifyNotificationMode = false
       End If  
   End If
   VerifyFieldNotificationMode_TMS=bverifyNotificationMode
End Function

'[Verify Field Block displayed on TMS Page]
Public Function verifyBlockText_TMS(strExpectedText)
   bVerifyBlockText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (TM.lblBlock(), strExpectedText, "Block")Then
           bVerifyBlockText=false
       End If
   End If
   verifyBlockText_TMS=bVerifyBlockText
End Function

'[Verify Field Level displayed on TMS Page]
Public Function verifyLevelText_TMS(strExpectedText)
   bVerifyLevelText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (TM.lblLevel(), strExpectedText, "Level")Then
           bVerifyLevelText=false
       End If
   End If
   verifyLevelText_TMS=bVerifyLevelText
End Function

'[Verify Field Unit displayed on TMS Page]
Public Function verifyUnitText_TMS(strExpectedText)
   bVerifyUnitText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (TM.lblUnit(), strExpectedText, "Unit")Then
           bVerifyUnitText=false
       End If
   End If
   verifyUnitText_TMS=bVerifyUnitText
End Function

'[Verify Field Address Line1 displayed on TMS Page]
Public Function verifyAddressLine1Text_TMS(strExpectedText)
   bVerifyAddressLine1Text=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (TM.lblAddressLine1(), strExpectedText, "Address Line1")Then
           bVerifyAddressLine1Text=false
       End If
   End If
   verifyAddressLine1Text_TMS=bVerifyAddressLine1Text
End Function

'[Verify Field Address Line2 displayed on TMS Page]
Public Function verifyAddressLine2Text_TMS(strExpectedText)
   bVerifyAddressLine2Text=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (TM.lblAddressLine2(), strExpectedText, "Address Line2")Then
           bVerifyAddressLine2Text=false
       End If
   End If
   verifyAddressLine2Text_TMS=bVerifyAddressLine2Text
End Function

'[Verify Field Address Line3 displayed on TMS Page]
Public Function verifyAddressLine3Text_TMS(strExpectedText)
   bVerifyAddressLine3Text=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (TM.lblAddressLine3(), strExpectedText, "Address Line3")Then
           bVerifyAddressLine3Text=false
       End If
   End If
   verifyAddressLine3Text_TMS=bVerifyAddressLine3Text
End Function

'[Verify Field Address Line4 displayed on TMS Page]
Public Function verifyAddressLine4Text_TMS(strExpectedText)
   bVerifyAddressLine4Text=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (TM.lblAddressLine4(), strExpectedText, "Address Line4")Then
           bVerifyAddressLine4Text=false
       End If
   End If
   verifyAddressLine4Text_TMS=bVerifyAddressLine4Text
End Function

'[Verify Field Postal Code displayed on TMS Page]
Public Function verifyPostalCodeText_TMS(strExpectedText)
   bDevPending=false
   bVerifyPostalCodeText=true
   If Not IsNull(strExpectedText) Then
       If Not VerifyInnerText (TM.lblPostalCode(), strExpectedText, "Postal Code")Then
           bVerifyPostalCodeText=false
       End If
   End If
   verifyPostalCodeText_TMS=bVerifyPostalCodeText
End Function

'[Verify Delivery Mode Combobox on TMS Page has Items]
Public Function verifyDeliveryModeComboboxItems_TMS(lstItems)
   bverifyDeliveryModeComboboxItems=true
   If Not IsNull(lstItems) Then
       If Not verifyComboboxItems (TM.lstDeliveryMode(),lstItems, "Delivery Mode") Then
           bverifyDeliveryModeComboboxItems=false
       End If
   End If
   verifyDeliveryModeComboboxItems_TMS=bverifyDeliveryModeComboboxItems
End Function

'[Select Delivery Mode Combobox displayed on TMS Page]
Public Function selectDeliveryMode_TMS(strDeliveryMode)
   bselectDeliveryMode=true
   If Not IsNull(strDeliveryMode) Then
       If Not (selectItem_Combobox (TM.lstDeliveryMode(),strDeliveryMode))Then
           LogMessage "WARN","Verification","Failed to select :"&strDeliveryMode&" From Delivery Mode drop down list" ,false
           bselectDeliveryMode=false
       End If
   End If
   WaitForICallLoading
   selectDeliveryMode_TMS = bselectDeliveryMode
End Function

'[Verify default Redirection to Foreign Address Radio Button displayed on TMS Page]
Public Function verifydefaultRedirectionForeignAdd_TMS(strSelectedradioButton)	
	bverifydefaultRedirectionForeignAdd=true
	If Not IsNull(strSelectedradioButton) Then
		bverifydefaultRedirectionForeignAdd=VerifyRadioButtonGrpSelection(strSelectedradioButton,TM.rbtnForeignAddressRedirection,Array("Yes","No"))
		If bverifydefaultRedirectionForeignAdd Then
			LogMessage "RSLT","Verification","Radio Button :NO selected by default. Selected value is "&strSelectedradioButton ,true
		else
			LogMessage "RSLT","Verification","Radio Button :NO is not selected by default. Selected value is "&strSelectedradioButton ,false
		End If
	    If Err.Number<>0 Then
	       bverifydefaultRedirectionForeignAdd=false
	       LogMessage "WARN","Verification","Failed to Verify Radio Button :Show" ,false
	       Exit Function
	   End If
	End IF 
   verifydefaultRedirectionForeignAdd_TMS = bverifydefaultRedirectionForeignAdd
End Function

'[Select Radio Button of Redirection to Foreign Address on TMS Page]
Public Function selectForeignAddRedirectionRadio_TMS(strForeignAddRedirection)
	bselectForeignAddRedirectionRadio=true
	If Not IsNull(strForeignAddRedirection) Then
		bselectForeignAddRedirectionRadio=SelectRadioButtonGrp(strForeignAddRedirection,TM.rbtnForeignAddressRedirection, Array("Yes","No"))   
		If Err.Number<>0 Then
	       bselectForeignAddRedirectionRadio=false
	       LogMessage "WARN","Verification","Failed to Click Button : Redirection to Foreign Address" ,false
	       Exit Function
	   End If
   End IF
   selectForeignAddRedirectionRadio_TMS=bselectForeignAddRedirectionRadio
End Function

'[Select Radio Button of Courier Service on TMS Page]
Public Function selectCourierService_TMS(strCourierService)
	bselectselectCourierServiceRadio=true
	If Not IsNull(strCourierService) Then
		bselectselectCourierServiceRadio=SelectRadioButtonGrp(strCourierService,TM.rbtnCourierService, Array("Yes","No"))   
		If Err.Number<>0 Then
	       bselectselectCourierServiceRadio=false
	       LogMessage "WARN","Verification","Failed to Click Button : Courier Service" ,false
	       Exit Function
	   End If
   End IF
   selectCourierService_TMS=bselectselectCourierServiceRadio
End Function

'[Verify default Courier Service Radio Button displayed on TMS Page]
Public Function verifydefaultCourierService_TMS(strSelectedradioButton)	
	bverifydefaultCourierService=true
	If Not IsNull(strSelectedradioButton) Then
		bverifydefaultCourierService=VerifyRadioButtonGrpSelection(strSelectedradioButton,TM.rbtnCourierService,Array("Yes","No"))
		If bverifydefaultCourierService Then
			LogMessage "RSLT","Verification","Radio Button :NO selected by default. Selected value is "&strSelectedradioButton ,true
		else
			LogMessage "RSLT","Verification","Radio Button :NO is not selected by default. Selected value is "&strSelectedradioButton ,false
		End If
	    If Err.Number<>0 Then
	       bverifydefaultCourierService=false
	       LogMessage "WARN","Verification","Failed to Verify Radio Button :Show" ,false
	       Exit Function
	   End If
	End IF 
   verifydefaultCourierService_TMS=bverifydefaultCourierService
End Function

'[Select Radio Button of Waive Courier Fee on TMS Page]
Public Function selectRadioWaiveCourierFee_TMS(strCourierFee)
	bselectWaiveCourierFee=true
	If Not IsNull(strCourierFee) Then
		bselectselectCourierServiceRadio=SelectRadioButtonGrp(strCourierFee,TM.rbtnWaiveCourierFee, Array("Yes","No"))   
		If Err.Number<>0 Then
	       bselectWaiveCourierFee=false
	       LogMessage "WARN","Verification","Failed to Click Button : Waive Courier Fee" ,false
	       Exit Function
	   End If
   End IF
   selectRadioWaiveCourierFee_TMS=bselectWaiveCourierFee
End Function

'[Select Combobox Waive Courier fee Reason on TMS page]
Public Function selectWaiveCourierFee_TMS(strWaiveReason)
	bselectWaiveCourierFee=true
	If Not IsNull(strWaiveReason) Then
       If Not (selectItem_Combobox (TM.lstCourierFeeWaiveReason(),strWaiveReason))Then
           LogMessage "WARN","Verification","Failed to select :"&strWaiveReason&" From Waive Reason drop down list" ,false
           bselectWaiveCourierFee=false
       End If
   End If
   WaitForICallLoading
   selectWaiveCourierFee_TMS = bselectWaiveCourierFee
End Function

'[Verify default waive Replacement Fee Radio Button displayed on TMS Page]
Public Function verifydefaultWaiveReplacementFee_CBR(strSelectedradioButton)	
	bverifydefaultWaiveReplacementFee=true
	If Not IsNull(strSelectedradioButton) Then
		bverifydefaultWaiveReplacementFee=VerifyRadioButtonGrpSelection(strSelectedradioButton,TM.rbtnWaiveReplacementFee,Array("Yes","No"))
		If bverifydefaultWaiveReplacementFee Then
			LogMessage "RSLT","Verification","Radio Button :YES selected by default. Selected value is "&strSelectedradioButton ,true
		else
			LogMessage "RSLT","Verification","Radio Button :YES is not selected by default. Selected value is "&strSelectedradioButton ,false
		End If
	    If Err.Number<>0 Then
	       bverifydefaultWaiveReplacementFee=false
	       LogMessage "WARN","Verification","Failed to Verify Radio Button :Show" ,false
	       Exit Function
	   End If
	End IF 
   verifydefaultWaiveReplacementFee_CBR=bverifydefaultWaiveReplacementFee
End Function

'[Select Radio Button waive Replacement Fee displayed on TMS Page]
Public Function selectWaiveReplacementRadio_TMS(strWaiveReplacementFee)
	bselectWaiveReplacementRadio=true
	If Not IsNull(strWaiveReplacementFee) Then
		bselectWaiveReplacementRadio=SelectRadioButtonGrp(strWaiveReplacementFee,TM.rbtnWaiveReplacementFee, Array("Yes","No"))   
		If Err.Number<>0 Then
	       bselectWaiveReplacementRadio=false
	       LogMessage "WARN","Verification","Failed to Click Button : Waive Cheque Book Fee" ,false
	       Exit Function
	   End If
   End IF
   selectWaiveReplacementRadio_TMS=bselectWaiveReplacementRadio
End Function

'[Verify Waive Replacement Fee Reason Combobox has Items]
Public Function verifyWaiveReplacementComboboxItems_TMS(lstItems)
   bverifyWaiveReplacementReason=true
   If Not IsNull(lstItems) Then
       If Not verifyComboboxItems (TM.lstReplacementFeeWaiveReason(),lstItems, "Fee Waiver Replacement Reason")Then
           bverifyWaiveReplacementReason=false
       End If
   End If
   verifyWaiveReplacementComboboxItems_TMS = bverifyWaiveReplacementReason
End Function

'[Select Combobox Waive Replacement fee Reason on TMS page]
Public Function selectWaiveReplacementFee_TMS(strWaiveReason)
	bselectWaiveReplacementFee=true
	If Not IsNull(strWaiveReason) Then
       If Not (selectItem_Combobox (TM.lstReplacementFeeWaiveReason(),strWaiveReason))Then
           LogMessage "WARN","Verification","Failed to select :"&strWaiveReason&" From Waive Reason drop down list" ,false
           bselectWaiveReplacementFee=false
       End If
   End If
   WaitForICallLoading
   selectWaiveReplacementFee_TMS = bselectWaiveReplacementFee
End Function

'[Verify field Courier Fee in TMS Page displayed as]
Public Function verifyTotalCourierFeeCharge_TMS(strCourierFee)
	bverifyTotalCourierFeeCharge=true
	If Not IsNull(strCourierFee) Then
       If Not VerifyInnerText (TM.lblTotalCourierFeeCharge(),strCourierFee, "Courier Fee Charge") Then
           bverifyTotalCourierFeeCharge=false
       End If
    End If
    verifyTotalCourierFeeCharge_TMS = bverifyTotalCourierFeeCharge
End Function

'[Verify field Replacement Fee in TMS Page displayed as]
Public Function verifyReplacementFeeCharge_TMS(strTotalRepFeeCharge)
	bverifyReplacementFeeCharge=true
	If Not IsNull(strTotalRepFeeCharge) Then
       If Not VerifyInnerText (TM.lblTotalReplacementFeeCharge(),strTotalRepFeeCharge, "Total Replacement Fee Charge") Then
           bverifyReplacementFeeCharge=false
       End If
    End If
    verifyReplacementFeeCharge_TMS = bverifyReplacementFeeCharge
End Function

'[Verify default Account to be charged in TMS Page displayed as]
Public Function VerifyAccountCharged_TMS(strAccCharged)
   bVerifyAccountCharged=true
   If Not IsNull(strAccCharged) Then
       If Not verifyComboSelectItem (TM.lstAccountCharge(),strAccCharged, "Account to be charged") Then
    	  LogMessage "WARN","Verification","Expected Default Account Number:"&strAccCharged&" not displayed in the Account to be charged" ,false
          bVerifyAccountCharged=false
       End If
   End If
   VerifyAccountCharged_TMS = bVerifyAccountCharged
End Function

'[Verify list of Account numbers displayed in Account charged dropdown in TMS Page]
Public Function VerifylistAccountsCharged_TMS(lstAccCharged) 
	bVVerifylistAccountsCharged = True 
	If Not IsNull(lstAccNo) Then
       If Not verifyComboboxItems(TM.lstAccountCharge(),lstAccCharged,"Account to be charged") Then
       	   LogMessage "WARN","Verification","List of Account to be charged displayed in the combox box is not as expected" ,false
           bVVerifylistAccountsCharged = False
       End If
   End If
   VerifylistAccountsCharged_TMS = bVVerifylistAccountsCharged
End Function

'[Select Combobox Account to be charged on TMS page]
Public Function selectAccountCharged_TMS(strAccountCharged)
	bselectAccountCharged=true
	If Not IsNull(strAccountCharged) Then
       If Not (selectItem_Combobox (TM.lstAccountCharge(),strAccountCharged))Then
           LogMessage "WARN","Verification","Failed to select :"&strAccountCharged&" From Account to be charged drop down list" ,false
           bselectAccountCharged=false
       End If
   End If
   WaitForICallLoading
   selectAccountCharged_TMS = bselectAccountCharged
End Function

'[Set TextBox Account to be charged on TMS page as]
Public Function SetAccountCharged_TM(strAccCharged)
 bSetAccountCharged = True 
 WaitForICallLoading
 If Not IsNull(strAccCharged) Then
	TM.lblAccountCharge.Set(strAccCharged)
	WaitForICallLoading
	If Err.Number<>0 Then
       bSetAccountCharged =false
       LogMessage "WARN","Verification","Failed to Set Text Box :Account to be charged" ,false
       Exit Function
    End If
  End If
   SetAccountCharged_TM = bSetAccountCharged
End Function

'[Verify Inline Info Message displayed based on the Selected Account in TMS Page]
Public Function verifyInlineInfoMessage_TMS(strInLineMessage)
	bverifyInlineInfoMessage=true
	WaitForICallLoading
	If Not IsNull(strInLineMessage) Then	   
       If Not VerifyInnerText (TM.lblAvailableBalInfo(), strInLineMessage, "Available Balance Message")Then
           bverifyInlineInfoMessage=false
       End If
   End If	
   verifyInlineInfoMessage_TMS = bverifyInlineInfoMessage
End Function

'[Verify Inline error Message displayed in TMS Page]
Public Function verifyInlineErrorMessage_TMS(strInLineMessage)
	bverifyInlineErrorMessage=true
	WaitForICallLoading
	If Not IsNull(strInLineMessage) Then
	   WaitForICallLoading
       If Not VerifyInnerText (TM.lblInlineMsg(), strInLineMessage, "Inline Error Message")Then
           bverifyInlineErrorMessage=false
       End If
   End If
   verifyInlineErrorMessage_TMS = bverifyInlineErrorMessage
End Function

'[Set Combobox Redirection Address Country on TMS page]
Public Function selectCountry_TMS(strCountry)
bselectCountry=true
If Not IsNull(strCountry) Then
	TM.lstCountry.Set(strCountry)
	If Err.Number<>0 Then
	   bselectCountry =false
	   LogMessage "WARN","Verification","Failed to Set Text Box :Redirection Address Country" ,false
	   Exit Function
	End If
End If
WaitForICallLoading
selectCountry_TMS = bselectCountry
End Function

'[Set TextBox Redirection Address Postal Code on TMS page as]
Public Function setPostalCode_TM(strPostalCode)
  If Not IsNull(strPostalCode) Then
	TM.txtPostalCode.Set(strPostalCode)
	If Err.Number<>0 Then
       setPostalCode_TM=false
       LogMessage "WARN","Verification","Failed to Set Text Box :POstal Code" ,false
       Exit Function
    End If
  End If
   setPostalCode_TM=true
End Function

'[Set TextBox Redirection Address line1 on TMS page as]
Public Function setAddress1_TM(strAddress1)
  If Not IsNull(strAddress1) Then
	TM.txtAddress1.Set(strAddress1)
	If Err.Number<>0 Then
       setAddress1_TM=false
       LogMessage "WARN","Verification","Failed to Set Text Box :Address Line1" ,false
       Exit Function
    End If
  End If
   setAddress1_TM=true
End Function

'[Set TextBox Redirection Address line2 on TMS page as]
Public Function setAddress2_TM(strAddress2)
  If Not IsNull(strAddress2) Then
	TM.txtAddress2.Set(strAddress2)
	If Err.Number<>0 Then
       setAddress2_TM=false
       LogMessage "WARN","Verification","Failed to Set Text Box :Address Line2" ,false
       Exit Function
    End If
  End If
   setAddress2_TM=true
End Function

'[Set TextBox Redirection Address line3 on TMS page as]
Public Function setAddress3_TM(strAddress3)
  If Not IsNull(strAddress3) Then
	TM.txtAddress3.Set(strAddress3)
	If Err.Number<>0 Then
       setAddress3_TM=false
       LogMessage "WARN","Verification","Failed to Set Text Box :Address Line3" ,false
       Exit Function
    End If
  End If
   setAddress3_TM=true
End Function

'[Set TextBox Comments on TMS page as]
Public Function setCommentsTextbox_PR(strComment)
   strTimeStamp = ""&now
   strComment =strComment &" "&strTimeStamp
   gstrRuntimeCommentStep="Set TextBox Comment for TOken Management"
   insertDataStore "SRComment", strComment	
   TM.txtComment.Set strComment
   WaitForIcallLoading
   If Err.Number<>0 Then
       setCommentsTextbox_PR=false
            LogMessage "WARN","Verification","Failed to Set Text Box :Comments" ,false
       Exit Function
   End If
   setCommentsTextbox_PR=true
End Function
