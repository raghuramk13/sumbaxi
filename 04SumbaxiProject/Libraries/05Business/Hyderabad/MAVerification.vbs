
'Update by kalyan on 21/03/2017
'[Verify customer Identification smart questions]
Public Function VerifyIdentificationQuestions(strDBServer)
	bVerifyIdentificationQuestions = True
	strQuery="select CODE_VAL from iserve_code_table where code_id = 'DISPLAY_QUESTIONS' and CODE_KEY='Identification Questions'"
	intSmartIdenQstnsDB=getDBValForColumn_MARIADB_FE(strQuery, strDBServer)
	Set objtableIdentification= VerifyCustomer.tblIdentificationQuiz
	Set oDesc = Description.Create()
	oDesc("html id").Value = "vrfyCustIdenQ_div.*"
	'oDesc("outerhtml").Value = "*.idenQuestion.*"
	Set questionCollection = objtableIdentification.ChildObjects(oDesc)
	NumberOfQues = questionCollection.Count
	intSmartQustnsFE=0
	For inQuestCount=0 to NumberOfQues - 1
		status=Instr(questionCollection(inQuestCount).GetROproperty("outerhtml"),("idenQuestion"))
		If status<>0 Then
			intSmartQustnsFE=intSmartQustnsFE + 1
		End If
	Next
	If Cint(intSmartIdenQstnsDB(0))=intSmartQustnsFE Then	
		LogMessage "RSLT","Verification","Identification Smart Questions Displayed Correctly as per Iserve_Code_Table Code Value",True
	Else
		LogMessage "WARN","Verification.","Identification Smart Questions Not Displayed Correctly as per Iserve_Code_Table Code Value",False
	End If
End Function

'[Verify customer Identification Randamization Logic]
Public Function VerifyIdentificationRandamizationLogic(strDBServer, strCustCIN)
	bVerifyIdentificationRandamizationLogic = True
	strQuery1="select distinct(cca_cust_ma_rec.QUESTION) from cca_cust_ma_rec inner join cca_ma_questions on  cca_cust_ma_rec.QUESTION_ID=cca_ma_questions.QUESTION_ID inner join cca_cust_verification on cca_cust_ma_rec.VERIFICATION_REC_ID=cca_cust_verification.REC_ID where cca_ma_questions.QUESTION_CAT='IDENTIFICATION' and cca_ma_questions.SMART_ANSWER='Yes' and cca_cust_verification.CUST_CIN='"&strCustCIN&"' and (MA_VERIFICATION_STATUS='High Risk Verified' or MA_VERIFICATION_STATUS='Low Risk Verified' or MA_VERIFICATION_STATUS='TPIN Verified' or MA_VERIFICATION_STATUS='High Risk with TPIN') order by cca_cust_verification.CREATED_DATE desc Limit 5"
	intPastVerQstnsDB=getDBValForColumn_MARIADB_FE(strQuery1, strDBServer)
	strQuery3="select count(distinct(cca_cust_ma_rec.QUESTION)) from cca_cust_ma_rec inner join cca_ma_questions on  cca_cust_ma_rec.QUESTION_ID=cca_ma_questions.QUESTION_ID inner join cca_cust_verification on cca_cust_ma_rec.VERIFICATION_REC_ID=cca_cust_verification.REC_ID where cca_ma_questions.QUESTION_CAT='IDENTIFICATION' and cca_ma_questions.SMART_ANSWER='Yes' and cca_cust_verification.CUST_CIN='"&strCustCIN&"' and (MA_VERIFICATION_STATUS='High Risk Verified' or MA_VERIFICATION_STATUS='Low Risk Verified' or MA_VERIFICATION_STATUS='TPIN Verified' or MA_VERIFICATION_STATUS='High Risk with TPIN') order by cca_cust_verification.CREATED_DATE desc Limit 5"
	intPastVerCnt=getDBValForColumn_MARIADB_FE(strQuery3, strDBServer)
	'intPastVerCnt= intPastVerQstnsDB
	strQuery2="select CODE_VAL from iserve_code_table where code_id = 'DISPLAY_QUESTIONS' and CODE_KEY='Identification Questions'"
	intSmartIdenQstnsDB=getDBValForColumn_MARIADB_FE(strQuery2, strDBServer)
	Set objtableIdentificationQstns= VerifyCustomer.tblIdentificationQuiz
	Set oDesc = Description.Create()
	oDesc("html id").Value = "vrfyCustIdenQ_span.*"
	'vrfyCustIdenQ_span_0
	'oDesc("outerhtml").Value = "*.idenQuestion.*"
	Set questionCollections = objtableIdentificationQstns.ChildObjects(oDesc)
	NumberOfQues = questionCollections.Count
	intPastVerSmartQustnsCntFE=0
	'msgbox questionCollection1(0).GetROproperty("innertext")
	If Cint(intPastVerCnt(0))=0 Then
		LogMessage "RSLT","Verification","No Past Verification Questions to Validate",True
		bVerifyIdentificationRandamizationLogic=True
		Exit Function
	End If
	For intPastQstnsCnt = 0 To Cint(intPastVerCnt(0)) - 1
		For inQuestCount=0 To Cint(intSmartIdenQstnsDB(0)) - 1
		status=matchStr(questionCollections(inQuestCount).GetROproperty("innertext"),intPastVerQstnsDB(intPastQstnsCnt))
		If status<>0 Then
			intPastVerSmartQustnsCntFE=intPastVerSmartQustnsCntFE + 1
		End If
	Next
	Next
	
	If intPastVerSmartQustnsCntFE >= (Cint(intSmartIdenQstnsDB(0))/2) Then	
		LogMessage "RSLT","Verification","Past Verification Questions Displayed as Expected",True
		bVerifyIdentificationRandamizationLogic=True
	Else
		LogMessage "WARN","Verification.","Past Verification Questions Not Displayed as Expected",False
		bVerifyIdentificationRandamizationLogic=False
	End If
End Function

'[Select GetMoreQuestions link VerifyCustomer Identification Section]
Public Function clicklink_IdenGetMreQstns()
bDevPending=false
VerifyCustomer.lnkIdenGetMoreQstns.click
If Err.Number<>0 Then
clicklink_IdenGetMreQstns=false
LogMessage "WARN","Verification","Failed to Click Identification Link : GetMoreQuestions" ,false
Exit Function
End If
WaitForICallLoading
clicklink_IdenGetMreQstns=true
End Function

'[Verify Total Smart Questions for Identification Section using GetMoreQuestions]
Public Function verifySmartQstns_IdenSec(strErrMsg, strDBServer)
bDevPending=false
Do
clicklink_IdenGetMreQstns()
bIdenGetMreQstns = matchStr(VerifyCustomer.lnkDisableIdenGetMoreQstns.GetROProperty("outerhtml"),"true")
Loop while Not  bIdenGetMreQstns
'********Verify Identification Error Msg displayed*****************
bIdenErrMsg = matchStr(VerifyCustomer.lblIdenErrMsg.GetROProperty("innertext"),strErrMsg)
If Err.Number<>0 Then
	verifySmartQstns_IdenSec=false
	LogMessage "WARN","Verification","Error Message Not Displayed When No More Questions to Display" ,false
Else
	LogMessage "RSLT","Verification","Error Message Displayed as Expected When No More Questions to Display",True
	verifySmartQstns_IdenSec=True
End If
'********Verify total Randomized questions displayed*****************
	strQuery1="select count(*) from cca_ma_questions where QUESTION_CAT='IDENTIFICATION' and SMART_ANSWER='Yes' and QUESTION_SUB_CAT != 'PRODUCT'"
	intSmartQstnsCnt=getDBValForColumn_MARIADB_FE(strQuery1, strDBServer)
	Set objtableIdentificationttlQstns= VerifyCustomer.tblIdentificationQuiz
	Set oDesc = Description.Create()
	oDesc("html id").Value = "vrfyCustIdenQ_span.*"
	'vrfyCustIdenQ_span_0
	'oDesc("outerhtml").Value = "*.idenQuestion.*"
	Set ttlquestionCollections = objtableIdentificationttlQstns.ChildObjects(oDesc)
	ttlNumberOfQues = ttlquestionCollections.Count
	intTtlSmartQustnsFE=0
	For intTtlQuestCount=0 to ttlNumberOfQues - 1
		status=Instr(ttlquestionCollections(intTtlQuestCount).GetROproperty("outerhtml"),("idenQuestion"))
		If status<>0 Then
			intTtlSmartQustnsFE=intTtlSmartQustnsFE + 1
		End If
	Next
	If Cint(intSmartQstnsCnt(0))=intTtlSmartQustnsFE Then	
		LogMessage "RSLT","Verification","Total Identification Smart Questions Displayed Correctly",True
	Else
		LogMessage "WARN","Verification.","Total Identification Smart Questions Not Displayed Correctly",False
	End If

verifySmartQstns_IdenSec=true
End Function

'[Verify Refresh Button for Identification Section Enable Disable]
Public Function verifyRefreshBtn_IdenSec(strErrMsg, strDBServer)
bDevPending=false
Do
VerifyCustomer.lblIdenRefresh.click
bRefreshBtnSts = matchStr(VerifyCustomer.lblIdenRefresh.GetROProperty("outerhtml"),"fa fa-refresh refresh md-padding-left disabled-area")
Loop while not bRefreshBtnSts
'********Verify Identification Error Msg displayed*****************
bIdenErrMsg = matchStr(VerifyCustomer.lblIdenErrMsg.GetROProperty("innertext"),strErrMsg)
If Err.Number<>0 Then
	verifyRefreshBtn_IdenSec=false
	LogMessage "WARN","Verification","Error Message Not Displayed When No More Questions to Display" ,false
Else
	LogMessage "RSLT","Verification","Error Message Displayed as Expected When No More Questions to Display",True
	verifyRefreshBtn_IdenSec=True
End If
verifyRefreshBtn_IdenSec=true
End Function

'[Verify customer Identification non smart questions]
Public Function VerifyIdentificationNonSmartQuestions(strDBServer)
	bVerifyIdentificationNonSmartQuestions = True
	strQuery="select count(*) from cca_ma_questions where QUESTION_CAT='IDENTIFICATION' and SMART_ANSWER='No' and AUTOPASS_IND='No' order by CREATED_DATE desc"
	intNonSmartIdenQstnsDBCnt=getDBValForColumn_MARIADB_FE(strQuery, strDBServer)
	strQuery1="select QUESTION from cca_ma_questions where QUESTION_CAT='IDENTIFICATION' and SMART_ANSWER='No' and AUTOPASS_IND='No' order by CREATED_DATE asc"
	intNonSmartIdenQstnsDB=getDBValForColumn_MARIADB_FE(strQuery1, strDBServer)
	Set objtableIdentificationNonSmart= VerifyCustomer.tblIdentificationQuiz
	Set nonSmartoDesc = Description.Create()
	nonSmartoDesc("html id").Value = "vrfyCustIdenQ_span.*"
	'oDesc("outerhtml").Value = "*.idenQuestion.*"
	Set questionCollectionNonSmart = objtableIdentificationNonSmart.ChildObjects(nonSmartoDesc)
	
	NumberOfQuesNonSmart = questionCollectionNonSmart.Count
	
	intNonSmartQustnsFE = 0
	For intQuestCount=0 to NumberOfQuesNonSmart - 1
		status = Instr(questionCollectionNonSmart(intQuestCount).GetROproperty("outerhtml"),("idenNonSmartQuestion"))
		If status<>0 Then
			ReDim Preserve lstIdenNotSmartQstnsFE(intNonSmartQustnsFE)
			lstIdenNotSmartQstnsFE(intNonSmartQustnsFE) = questionCollectionNonSmart(intQuestCount).GetROproperty("innertext")
			intNonSmartQustnsFE = intNonSmartQustnsFE + 1
		End If
	Next
			
	If Cint(intNonSmartIdenQstnsDBCnt(0))=intNonSmartQustnsFE Then	
		LogMessage "RSLT","Verification","Identification Non Smart Questions Displayed Correctly as Expected",True
		
		For inNSQuestCount=0 To Cint(intNonSmartIdenQstnsDBCnt(0)) - 1
			status=matchStr(lstIdenNotSmartQstnsFE(inNSQuestCount),intNonSmartIdenQstnsDB(inNSQuestCount))
				If status=True Then
				bVerifyIdentificationNonSmartQuestions=True
				LogMessage "RSLT","Verification","Non Smart Question Matched as Expected",True
			Else
				LogMessage "WARN","Verification.","Non Smart Question Not Matched",False
				bVerifyIdentificationNonSmartQuestions=False
			End If	
		Next
	Else
		LogMessage "WARN","Verification.","Identification Non Smart Questions Not Displayed Correctly",False
		bVerifyIdentificationNonSmartQuestions=False
	End If
End Function

'[Verify customer Identification AutoPass questions]
Public Function VerifyIdentificationAutoPassQuestions(strDBServer)
	bVerifyIdentificationAutoPassQuestions = True
	strQuery="select COUNT(*) from cca_ma_questions where QUESTION_CAT='IDENTIFICATION' and SMART_ANSWER='No' and AUTOPASS_IND='Yes' and USER_ROLE='NA' order by CREATED_DATE desc"
	intAutoPassIdenQstnsDBCnt=getDBValForColumn_MARIADB_FE(strQuery, strDBServer)
	strQuery1="select QUESTION from cca_ma_questions where QUESTION_CAT='IDENTIFICATION' and SMART_ANSWER='No' and AUTOPASS_IND='Yes' and USER_ROLE='NA' order by CREATED_DATE desc"
	intAutoPassIdenQstnsDB=getDBValForColumn_MARIADB_FE(strQuery1, strDBServer)
	Set objtableIdentificationAutoPass= VerifyCustomer.tblIdentificationAutoPassQues
	Set autoPassDesc = Description.Create()
	autoPassDesc("html id").Value = "vrfyCustAutoPassQ_span.*"
	'oDesc("outerhtml").Value = "*.idenQuestion.*"
	Set questionCollectionAutoPass = objtableIdentificationAutoPass.ChildObjects(autoPassDesc)
	intAutoPassQustnsFECnt=0
	NumberOfQuesAutoPass = questionCollectionAutoPass.Count
	For intQuestCount=0 to Cint(intAutoPassIdenQstnsDBCnt(0)) - 1
		For intAutoPassQustnsFE=0 to NumberOfQuesAutoPass - 1
		status=matchStr(intAutoPassIdenQstnsDB(intQuestCount), questionCollectionAutoPass(intAutoPassQustnsFE).GetROproperty("innertext"))
		If status=True Then
				intAutoPassQustnsFECnt= intAutoPassQustnsFECnt + 1
		End If	
		Next
	Next
			
	If Cint(intAutoPassIdenQstnsDBCnt(0))=intAutoPassQustnsFECnt Then	
		LogMessage "RSLT","Verification","Identification Auto Pass Questions Displayed Correctly as Expected",True
		bVerifyIdentificationAutoPassQuestions = True
	Else
		LogMessage "WARN","Verification.","Identification Auto Pass Questions Not Displayed Correctly",False
		bVerifyIdentificationAutoPassQuestions =False
	End If
End Function


'[Verify customer Identification smart questions Answers]
Public Function VerifyIdentificationQuestionsAns(arrAccntInfoPopUpDataLst, strIdenQstn, strIdenAns)
	bVerifyIdentificationQuestionsAns = True
	' Click on Verify Button
	VerifyCustomer.btnVerify.Click
	WaitForICallLoading
	Set objtableIdentification= VerifyCustomer.tblIdentificationQuiz
	Set oDesc = Description.Create()
	oDesc("html id").Value = "vrfyCustIdenQ_div.*"
	'oDesc("html id").Value = "vrfyCustIdenQ_span.*"
	'oDesc("outerhtml").Value = "*.idenQuestion.*"
	Set questionCollection = objtableIdentification.ChildObjects(oDesc)
	questionCollectionCnt=questionCollection.count

 	For i  = 0 To questionCollectionCnt - 1
 	If matchStr(questionCollection(i).GetROproperty("innertext"), strIdenQstn) Then
 	
	   Set objQuesRow=questionCollection(i)		
	   Set oDescAns = Description.Create()
	   'oDescAns("xpath").value= "//*[contains(@class,'question-answer-span')]"
	   
	   oDescAns("html id").Value = "vrfyCustIdenA.*"
	   Set AnsCollection = objQuesRow.ChildObjects(oDescAns)
	   AnsCollectionCnt=AnsCollection.count
	   End If
	   Next
	   For j = 1 To AnsCollectionCnt - 1
	   		If AnsCollection(j).GetROproperty("innertext")="Show Answer" Then
		   		'If matchStr(questionCollection(i).GetROproperty("innertext"), strIdenQstn) Then
		   		 	'AnsCollection(j).FireEvent("onmouseover")
		   		 	AnsCollection(j).click
		   		 	bVerifyIdentificationQuestionsAns=verifyTableContentList(VerifyCustomer.tblHeaderAccntInfoPopUp,VerifyCustomer.tblContentAccntInfoPopUp,arrAccntInfoPopUpDataLst,"SelectedPOSBATMCCDEBIT",false,NULL,NULL,NULL)
		   		 	VerifyCustomer.btnOK_Alert.click
		   		 	Exit Function
		   		'End If
		   	'ElseIf matchStr(questionCollection(i).GetROproperty("innertext"), strIdenQstn) Then
					ElseIf AnsCollection(0).GetROproperty("innertext")=strIdenAns Then
					bVerifyIdentificationQuestionsAns=True
					LogMessage "RSLT","Verification","Question displayed as expected" ,True
					ELse
					'msgbox AnsCollection(0).GetROproperty("innertext")
					'msgbox AnsCollection(1).GetROproperty("innertext")
					LogMessage "WARN","Verification","Question and Answer not Displayed as Expected",False
					bVerifyIdentificationQuestionsAns=False
					Exit Function
					'End If		
			End If			
	Next	   
  'Next
End Function

''[Verify customer Identification smart questions Answers]
'Public Function VerifyIdentificationQuestionsAns(strDBServer, arrAccntInfoPopUpDataLst, arrAccntInfoPopUpDataLst1, strQstn1, strQstn2, strQstnDOB, strQstnFN, strQstnOcptn, strQstnEmpName, strQstnNRIC, strAnsDOB, strAnsFN, strAnsOcptn, strAnsEmpName, strAnsNRIC)
'	bVerifyIdentificationQuestionsAns = True
'	' Click on Verify Button
'	VerifyCustomer.btnVerify.Click
'	Do
'		clicklink_IdenGetMreQstns()
'		bIdenGetMreQstns = matchStr(VerifyCustomer.lnkDisableIdenGetMoreQstns.GetROProperty("outerhtml"),"true")
'	Loop while Not  bIdenGetMreQstns
'	
'	Set objtableIdentification= VerifyCustomer.tblIdentificationQuiz
'	Set oDesc = Description.Create()
'	oDesc("html id").Value = "vrfyCustIdenQ_div.*"
'	'oDesc("outerhtml").Value = "*.idenQuestion.*"
'	Set questionCollection = objtableIdentification.ChildObjects(oDesc)
'	questionCollectionCnt=questionCollection.count
'
' 	For i  = 0 To questionCollectionCnt - 1
'	   Set objQuesRow=questionCollection(i)		
'	   Set oDescAns = Description.Create()
'	   'oDescAns("xpath").value= "//*[contains(@class,'question-answer-span')]"
'	   
'	   oDescAns("html id").Value = "vrfyCustIden.*"
'	   Set AnsCollection = objQuesRow.ChildObjects(oDescAns)
'	   AnsCollectionCnt=AnsCollection.count
'	   For j = 0 To AnsCollectionCnt - 1
'	   		If AnsCollection(j).GetROproperty("innertext")="Show Answer" Then
'		   		If matchStr(questionCollection(i).GetROproperty("innertext"), strQstn1) Then
'		   		 	AnsCollection(j).FireEvent("onmouseover")
'		   		 	bVerifyIdentificationQuestionsAns=verifyTableContentList(VerifyCustomer.tblHeaderAccntInfoPopUp,VerifyCustomer.tblContentAccntInfoPopUp,arrAccntInfoPopUpDataLst,"SelectedPOSBATMCCDEBIT",false,NULL,NULL,NULL)
'		   		 	VerifyCustomer.btnOK_Alert.click
'					ElseIf matchStr(questionCollection(i).GetROproperty("innertext"), strQstn2) Then
'						AnsCollection(j).FireEvent("onmouseover")
'						bVerifyIdentificationQuestionsAns=verifyTableContentList(VerifyCustomer.tblHeaderAccntInfoPopUp,VerifyCustomer.tblContentAccntInfoPopUp,arrAccntInfoPopUpDataLst1,"SelectedPOSBATMCCDEBIT",false,NULL,NULL,NULL)
'						VerifyCustomer.btnOK_Alert.click	 
'		   		End If
'			End If  
'		If matchStr(questionCollection(i).GetROproperty("innertext"), strQstnDOB) Then
'			If Not matchStr(AnsCollection(j).GetROproperty("innertext"), strAnsDOB) Then
'			bVerifyIdentificationQuestionsAns=false
'			End If
'		ElseIf matchStr(questionCollection(i).GetROproperty("innertext"), strQstnFN) Then	
'			If Not matchStr(AnsCollection(j).GetROproperty("innertext"), strAnsFN) Then
'			bVerifyIdentificationQuestionsAns=false
'			End If
'		ElseIf matchStr(questionCollection(i).GetROproperty("innertext"), strQstnOcptn) Then
'			If Not matchStr(AnsCollection(j).GetROproperty("innertext"), strAnsOcptn) Then
'			bVerifyIdentificationQuestionsAns=false
'			End If
'		ElseIf matchStr(questionCollection(i).GetROproperty("innertext"), strQstnEmpName) Then	
'			If Not matchStr(AnsCollection(j).GetROproperty("innertext"), strAnsEmpName) Then
'			bVerifyIdentificationQuestionsAns=false
'			End If
'		ElseIf matchStr(questionCollection(i).GetROproperty("innertext"), strQstnNRIC) Then	
'			If Not matchStr(AnsCollection(j).GetROproperty("innertext"), strAnsNRIC) Then
'			bVerifyIdentificationQuestionsAns=false
'			End If		
'		End If				
'	Next	   
'  Next
'End Function

'[Click Link Other Authentication Questions on Verify Page MA]
Public Function clickLnkOthrAuthQstns()
bDevPending=false
VerifyCustomer.lnkOtherAuthQstns.click
If Err.Number<>0 Then
clickLnkOthrAuthQstns=false
LogMessage "WARN","Verification","Failed to Click Link : Other Authentication Questions" ,false
Exit Function
End If
waitForIcallLoading
clickLnkOthrAuthQstns=true
End Function

'[Select Product List from Other Authentication Questions MA]
Public Function SelectProdLstOtherAuth(strProduct)
	bSelectProdLstOtherAuth = True
	waitForIcallLoading
	Set objtableOtherAuthProdLst= VerifyCustomer.tblProductLst
	Set OtherAuthQsntProd = Description.Create()
	OtherAuthQsntProd("micclass").Value = "WebElement"
	OtherAuthQsntProd("class").Value = "ng-binding"
	Set OtherAuthQsntProdCollectionLst = objtableOtherAuthProdLst.ChildObjects(OtherAuthQsntProd)
	NumberOfProdLst = OtherAuthQsntProdCollectionLst.Count
	For intProdLstCount=0 to NumberOfProdLst - 1
		status=matchStr(strProduct, OtherAuthQsntProdCollectionLst(intProdLstCount).GetROproperty("innertext"))
		If status=True Then
				OtherAuthQsntProdCollectionLst(intProdLstCount).click
				bSelectProdLstOtherAuth = True
		End If	
	Next
	waitForIcallLoading
	SelectProdLstOtherAuth=bSelectProdLstOtherAuth
End Function

'[Select Account Number from Other Authentication Questions MA]
Public Function SelectAccntNoOtherAuth(lstAccountNo)
	bSelectAccntNoOtherAuth = True
	waitForIcallLoading
	bSelectAccntNoOtherAuth = selectTableLink(VerifyCustomer.tblOthrAuthCustAccntHeader,VerifyCustomer.tblOthrAuthCustAccntContent,lstAccountNo,"OtherAuthAccounts" ,"Accounts",false,null,null,null)
	waitForIcallLoading
	SelectAccntNoOtherAuth=bSelectAccntNoOtherAuth
End Function

'[Verify customer Authentication smart questions]
Public Function VerifyAuthenticationQuestions(strDBServer)
	bVerifyAuthenticationQuestions = True
	strQuery="select CODE_VAL from iserve_code_table where code_id = 'DISPLAY_QUESTIONS' and CODE_KEY='Authentication Questions'"
	intSmartAuthQstnsDB=getDBValForColumn_MARIADB_FE(strQuery, strDBServer)
	Set objtableAuthentication= VerifyCustomer.tblAuthenticationQuiz
	Set oDesc = Description.Create()
	oDesc("html id").Value = "vrfyCustProdAuthQ_div.*"
	Set questionAuthCollection = objtableAuthentication.ChildObjects(oDesc)
	NumberOfAuthQues = questionAuthCollection.Count
	intSmartQustnsAuthFE=0
	For inQuestCount=0 to NumberOfAuthQues - 1
		status=Instr(questionAuthCollection(inQuestCount).GetROproperty("outerhtml"),("prodSpecificAuthQuestion"))
		If status<>0 Then
			intSmartQustnsAuthFE=intSmartQustnsAuthFE + 1
		End If
	Next
	If Cint(intSmartAuthQstnsDB(0))=intSmartQustnsAuthFE Then	
		LogMessage "RSLT","Verification","Authentication Smart Questions Displayed Correctly as per Iserve_Code_Table Code Value",True
	Else
		LogMessage "WARN","Verification.","Authentication Smart Questions Not Displayed Correctly as per Iserve_Code_Table Code Value",False
		bVerifyAuthenticationQuestions = False
	End If
	VerifyAuthenticationQuestions=bVerifyAuthenticationQuestions
End Function

'[Select GetMoreQuestions link VerifyCustomer Authentication Section]
Public Function clicklink_OtherAuthenGetMreQstns()
bDevPending=false
VerifyCustomer.lnkOthrAuthGetMoreQstns.click
If Err.Number<>0 Then
clicklink_OtherAuthenGetMreQstns=false
LogMessage "WARN","Verification","Failed to Click Auithentication Link : GetMoreQuestions" ,false
Exit Function
End If
WaitForICallLoading
clicklink_OtherAuthenGetMreQstns=true
End Function

'[Verify Error Msg for Smart Questions for Authentication Section using GetMoreQuestions]
Public Function verifySmartQstns_AuthSec(strErrMsg)
bDevPending=false
Do
clicklink_OtherAuthenGetMreQstns()
bAuthGetMreQstns = matchStr(VerifyCustomer.lnkDisableAuthGetMoreQstns.GetROProperty("outerhtml"),"true")
Loop while Not  bAuthGetMreQstns
'********Verify Identification Error Msg displayed*****************
bIdenErrMsg = matchStr(VerifyCustomer.lblAuthErrMsg.GetROProperty("innertext"),strErrMsg)
If Err.Number<>0 Then
	verifySmartQstns_AuthSec=false
	LogMessage "WARN","Verification","Error Message Not Displayed When No More Questions to Display" ,false
Else
	LogMessage "RSLT","Verification","Error Message Displayed as Expected When No More Questions to Display",True
	verifySmartQstns_AuthSec=True
End If
verifySmartQstns_AuthSec=true
End Function

'[Verify Refresh Button for Authentication Section Enable Disable]
Public Function verifyRefreshBtn_AuthSec(strErrMsg)
bDevPending=false
Do
VerifyCustomer.lblAuthRefresh.click
bRefreshBtnSts = matchStr(VerifyCustomer.lblAuthRefresh.GetROProperty("class"),"disabled-area")
Loop while not bRefreshBtnSts
'********Verify Identification Error Msg displayed*****************
bIdenErrMsg = matchStr(VerifyCustomer.lblAuthErrMsg.GetROProperty("innertext"),strErrMsg)
If Err.Number<>0 Then
	verifyRefreshBtn_AuthSec=false
	LogMessage "WARN","Verification","Error Message Not Displayed When No More Questions to Display" ,false
Else
	LogMessage "RSLT","Verification","Error Message Displayed as Expected When No More Questions to Display",True
	verifyRefreshBtn_AuthSec=True
End If
verifyRefreshBtn_AuthSec=true
End Function

''[Verify customer Authentication smart questions Answers]
'Public Function VerifyAuthQuestionsAns(arrAccntInfoPopUpDataLst, strAuthQstn, strAuthAns)
'	bVerifyAuthQuestionsAns = True
'	' Click on Verify Button
'	Set objtableAuth= VerifyCustomer.tblAuthenticationQuiz
'	Set oDesc = Description.Create()
'	oDesc("html id").Value = "vrfyCustProdAuthQ_div.*"
'	'oDesc("outerhtml").Value = "*.idenQuestion.*"
'	Set questionAuthCollection = objtableAuth.ChildObjects(oDesc)
'	questionCollectionCnt=questionAuthCollection.count
'
' 	For i  = 0 To questionCollectionCnt - 1
'	   Set objQuesRow=questionAuthCollection(i)		
'	   Set oDescAns = Description.Create()
'	   'oDescAns("xpath").value= "//*[contains(@class,'question-answer-span')]"
'	   
'	   oDescAns("html id").Value = "vrfyCustProdAuthA.*"
'	   Set AnsCollection = objQuesRow.ChildObjects(oDescAns)
'	   AnsCollectionCnt=AnsCollection.count
'	   For j = 0 To AnsCollectionCnt - 1
'	   		If AnsCollection(j).GetROproperty("innertext")="Show Answer" Then
'		   		If matchStr(questionAuthCollection(i).GetROproperty("innertext"), strAuthQstn) Then
'		   		 	AnsCollection(j).FireEvent("onmouseover")
'		   		 	bVerifyAuthQuestionsAns=matchStr(VerifyCustomer.tblContentAccntInfoPopUp.GetROproperty("innertext"), strAuthAns)
'		   		 	VerifyCustomer.btnOK_Alert.click
'		   		 	Exit Function
'		   		End If
'		   	ElseIf matchStr(questionAuthCollection(i).GetROproperty("innertext"), strAuthQstn) Then
'					If Not matchStr(AnsCollection(j).GetROproperty("innertext"), strAuthAns) Then
'					bVerifyAuthQuestionsAns=false
'					LogMessage "WARN","Verification","Question not displayed as expected" ,false
'					ELse
'					LogMessage "RSLT","Verification","Question and Answer Displayed as Expected",True
'					bVerifyAuthQuestionsAns=True
'					Exit Function
'					End If	
'			End If  
'	Next	   
'  Next
'End Function

'[Verify customer Authentication smart questions Answers]
Public Function VerifyAuthQuestionsAns(strAuthQstn)
	bVerifyAuthQuestionsAns = True
	WaitForIcallLoading
	Set objtableAuth= VerifyCustomer.tblAuthenticationProductRelated
	Set oDesc = Description.Create()
	oDesc("html id").Value = "vrfyCustProdAuthQ_div.*"
	Set questionCollection = objtableAuth.ChildObjects(oDesc)
	questionCollectionCnt=questionCollection.count
 	For i  = 0 To questionCollectionCnt - 1
 	'MtchAuhQstnSts=matchStr(questionCollection(i).GetROproperty("innertext"), strAuthQstn)
 	If questionCollection(i).GetROproperty("innertext")=strAuthQstn Then
	   bVerifyAuthQuestionsAns=True
	   LogMessage "RSLT","Verification","Question Answer displayed as expected" ,True
	   Exit Function
	Else 
		bVerifyAuthQuestionsAns=False	
	 End If
	 Next
	 VerifyAuthQuestionsAns=bVerifyAuthQuestionsAns
End Function

'[Verify customer Authentication AutoPass questions]
Public Function VerifyAuthenticationAutoPassQuestions(strQuestion)
	bVerifyAuthenticationAutoPassQuestions = True
	Set objtableAuthAutoPass= VerifyCustomer.tblAuthAutoPassQues
	Set autoPassDesc = Description.Create()
	autoPassDesc("html id").Value = "vrfyCustCallerIdQ_span.*"
	'oDesc("outerhtml").Value = "*.idenQuestion.*"
	Set questionCollectionAutoPass = objtableAuthAutoPass.ChildObjects(autoPassDesc)
	NumberOfQuesAutoPass = questionCollectionAutoPass.Count
	For intAutoPassQustnsFE=0 to NumberOfQuesAutoPass - 1
		status=matchStr(strQuestion, questionCollectionAutoPass(intAutoPassQustnsFE).GetROproperty("innertext"))
		If status=True Then
			LogMessage "RSLT","Verification","Auto Pass Question Displayed as Expected",True
			bVerifyAuthenticationAutoPassQuestions=True
			Exit Function
		End If	
	Next
End Function

'[Click button Notverified from Overview Page]
Public Function clickBtnNotverified()
bclickBtnNotverified=True
WaitForIcallLoading
VerifyCustomer.btnVerify.Click
WaitForIcallLoading
WaitForIcallLoading
If Err.Number<>0 Then
	bclickBtnNotverified=false
	LogMessage "WARN","Verification","Failed to Click Button : Not Verified" ,false
	Exit Function
End If
End Function
