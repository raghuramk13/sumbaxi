'[Verify fields displayed in placement Info section for TimeDeposits]
Public Function VerifyPlacementInfoFields_PI(arrLblValPairs,strProductType)
	bverifyfieldvalues = VerifyIDLabelValuePairsRandom(coPlacementInfo_Page.lblPlacementInfo,arrLblValPairs,strProductType,"Placement Info")
	VerifyPlacementInfoFields_PI = bverifyfieldvalues
End Function 
