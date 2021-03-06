'[Verify fields displayed in CASA Balances and Limits section]
Public Function VerifyBalancesLimits_CASA(arrLblValPairs,strProductType)
If Not ISNUll(arrLblValPairs) Then
	VerifyBalancesLimits_CASA = VerifyIDLabelValuePairsRandom(coBalancesLimits_Page.lblBalancesLimits,arrLblValPairs,strProductType,"Balances And Limits")
Else 
	VerifyBalancesLimits_CASA = True
End If
End Function

'[Verify fields displayed in CCCL Cards Limits section]
Public Function VerifyCardLimits_CCCL(arrLblValPairs,strProductType)
If Not ISNUll(arrLblValPairs) Then
   VerifyCardLimits_CCCL = VerifyIDLabelValuePairsRandom(coBalancesLimits_Page.lblCardLimitsCCCL,arrLblValPairs,strProductType,"Card Limits")
Else 
   VerifyCardLimits_CCCL = True
End If
End Function

'[Verify fields displayed in CCCL Balances and Limits section]
Public Function VerifyBalancesLimits_CCCL(arrLblValPairs,strProductType)
If Not ISNUll(arrLblValPairs) Then
    scrollPageDown 5
	VerifyBalancesLimits_CCCL = VerifyIDLabelValuePairsRandom(coBalancesLimits_Page.lblBalancesLimitsCCCL,arrLblValPairs,strProductType,"Balances And Limits")
Else 
	VerifyBalancesLimits_CCCL = True
End If
End Function

'[Verify fields displayed in DCATM Limits section]
Public Function VerifyLimits_DCATM(arrLblValPairs,strProductType)
If Not ISNUll(arrLblValPairs) Then
	VerifyLimits_DCATM = VerifyIDLabelValuePairsRandom(coBalancesLimits_Page.lblLimitsDCATM,arrLblValPairs,strProductType,"Limits")
Else 
	VerifyLimits_DCATM = True
End If	
End Function
