'Dim bcCustomerSearch
'Dim tblCustSearchResultsContent
'Dim tblCustSearcResultsHeader
'
'Set bcCustomerSearch = cCustomerSearch()
'
''This is the Screen Customer Searc Result
'
'Public Function cCustomerSearch()
'    Set cCustomerSearch = New clsCustomerSearch
'End Function
'
'Class clsCustomerSearch
'
'        Private Sub Class_Initialize()
'        End Sub
'
'        Private Sub Class_Terminate()
'        End Sub
'
'        '******************************** Object Initialization ******************************************************************
'
'        Public Function pageExists()
'               If  (btnByCustomer().exist(5)) Then
'                   pageExists = true
'                else
'                  pageExists = false
'               End If
'        End Function
'
'        Public Function ResultTableExists()
'               If  (tblCustSearcResultsHeader.exist(0)) Then
'                   ResultTableExists = true
'                else
'                  ResultTableExists = false
'               End If
'        End Function
'
'        Public Function btnByCustomer()
'           Set btnByCustomer = Browser("Browser_iCall_Home").Page("iCall_HomePage").WebElement("By Customer")
'        End Function
'
'        Public Function btnByCard()
'           Set btnByCard = Browser("Browser_iCall_Home").Page("iCall_HomePage").WebElement("By Card")
'        End Function
'
'        Public Function btnSearchByCustomer()
'           Set btnSearchByCustomer = Browser("Browser_iCall_Home").Page("iCall_HomePage").WebButton("btnSearchByCustomer")
'        End Function
'
'        Public Function btnSearchByCard()
'           Set btnSearchByCard = Browser("Browser_iCall_Home").Page("iCall_HomePage").WebElement("btnSearchByCard")
'        End Function
'
'        Public Function txtName()
'           Set txtName = Browser("Browser_iCall_Home").Page("iCall_HomePage").WebEdit("txtName")
'        End Function
'
'        Public Function txtNRICorPassport()
'           Set txtNRICorPassport = Browser("Browser_iCall_Home").Page("iCall_HomePage").WebEdit("txtNRIC/Passport")
'        End Function
'
'        Public Function txtDateOfBirth()
'           Set txtDateOfBirth = Browser("Browser_iCall_Home").Page("iCall_HomePage").WebEdit("txtDOB")
'        End Function
'
'        Public Function txtCardNumber()
'          Set txtCardNumber =Browser("Browser_iCall_Home").Page("iCall_HomePage").WebEdit("txtCardNumber") 
'        End Function
'
'        Public Function txtDebitCard()
''           Set txtDebitCard = 
'        End Function
'
'        Public Function lblErrMessage()
'           Set lblErrMessage = Browser("Browser_iCall_Home").Page("iCall_HomePage").WebElement("lblErrMessage")
'        End Function
'
'        Public Function lblSearchResultMessage()
'           Set lblSearchResultMessage = Browser("Browser_iCall_Home").Page("iCall_CustSearchResultsPage").WebElement("lblSearchResultMessage")
'
'        End Function
'
'        Public Function btnLogout()
'           'Set btnLogout = 
'        End Function
'
'
'        Public Function tblCustSearchResultsContent_Name()
'           'Set tblCustSearchResultsContent = Browser("Browser_iCall_Home").Page("iCall_CustSearchResultsPage").WebTable("tblCustSearchResultsContent")
'           Set tblCustSearchResultsContent_Name = Browser("Browser_iCall_Home").Page("iCall_CustSearchResultsPage").WebElement("tblCustSearchResultsContent_Name")
'        End Function
'
'        Public Function tblCustSearcResultsHeader_Name()
'           'Set tblCustSearcResultsHeader = Browser("Browser_iCall_Home").Page("iCall_CustSearchResultsPage").WebTable("tblCustSearcResultsHeader")
'            Set tblCustSearcResultsHeader_Name = Browser("Browser_iCall_Home").Page("iCall_CustSearchResultsPage").WebElement("tblCustSearcResultsHeader_Name")
'        End Function
'        
'        Public Function tblCustSearchResultsContent_Card()
'           Set tblCustSearchResultsContent_Card = Browser("Browser_iCall_Home").Page("iCall_CustSearchResultsPage").WebElement("tblCustSearchResultsContent_Card")
'        End Function
'
'        Public Function tblCustSearcResultsHeader_Card()
'           Set tblCustSearcResultsHeader_Card = Browser("Browser_iCall_Home").Page("iCall_CustSearchResultsPage").WebElement("tblCustSearcResultsHeader_Card")
'        End Function
'
'        Public Function lblMessage()
'               Set lblMessage = Browser("Browser_iCall_Home").Page("iCall_CustSearchResultsPage").WebElement("lblMessage")
'        End Function
'
'
'         '******************************** End of Object Initialization ******************************************************************
'
'        '*****************************Buttons & Link Clicks on the Page **********************************************************
'        Public Sub clickByCustomer()
'            btnByCustomer().Click
'        End Sub
'
'        Public Sub clickByCard()
'            btnByCard().Click
'        End Sub
'
'        Public Sub clickSearchByCustomer()
'            btnSearchByCustomer().Click 10,10,0
'        End Sub
'
'        Public Sub clickSearchByCard()
'           'Button is same for both cases
'            btnSearchByCard().Click 10,10,0
'        End Sub
'
'        Public Sub clickLogout()
'            btnLogout().Click
'        End Sub
'
'        '*****************************End of Buttons & Link Clicks on the Page **********************************************************
'
'        '*****************************Function on the Screen **********************************************************
'
'        '    *************  Select Customer by Customer Name************************
'        Public Function SelectCustomer(strCIN ,strName, strDateOfBirth)
'                bSelectCustomer=true
'                'Dim SearchColName1, SearchColNum1, SearchValue1
'                'Dim TargetColName, TargetColNum
'
'                'TargetColName = "Name"  'Column name in the UI
'                'TargetColNum = FindColumn(tblCustSearcResultsHeader, TargetColName)
'
''                If  TargetColNum = 0 Then
''                    SelectCustomer = False
''                    LogMessage "WARN","Verification","Please check the  Target Column Header name not available"&TargetColName,False
''                    Exit Function
''                End If                                       
'
'                'If Not IsNull(strCIN) Then
'                 '  SearchColName1 = "CIN/CIN Suffix"  'Column name in the UI
'                '    SearchColNum1 = FindColumn(tblCustSearcResultsHeader, SearchColName1)
'                '    SearchVal1 = strCIN
'
'                '    If  SearchColNum1 = 0 Then
'                '        SelectCustomer = False
'                '        LogMessage "WARN","Verification","Please check, the  Search Column Header name not available"&SearchColName1,False
'                '        Exit Function
'                '    End If
'                'End If
'
'
''                If Not IsNull(strName) Then
''
''                End If
''
''                If Not IsNull(strDateOfBirth) Then
''
''                End If
'
'                'SelectCustomer = SearchAndOperateInsideTableCell(tblCustSearchResultsContent, SearchColNum1, SearchVal1, TargetColNum, "VAADINLINK", NULL)
'        
'            ReDim lstSearchCustomer(0)            
'            lstSearchCustomer(0)="CIN/CIN Suffix:"&strCIN
'            'lstSearchCustomer(1)="Name:"&strName
'            'lstSearchCustomer(2)="Date of Birth:"&strDateOfBirth
'            
'            bSelectCustomer=ClickName_CustSearch(lstSearchCustomer)
'            WaitForIcallLoading
'            SelectCustomer=bSelectCustomer
'        End Function
'                
'        Public Function ClickName_CustSearch(lstSearchCustomer)
'           bDevPending=false           
'           ClickName_CustSearch=selectTableLink(tblCustSearcResultsHeader,tblCustSearchResultsContent,lstSearchCustomer,"CustomerSearch" ,"Name",false,null,null,null)
'       End Function
'
'        '    *************  Select Customer by Verify Link ****************
'        Public Function SelectCustomer_Verify(strCIN ,strName, strDateOfBirth)
'
'                Dim SearchColName1, SearchColNum1, SearchValue1
'                Dim TargetColName, TargetColNum
'
'                TargetColName = "Verify"  'Column name in the UI
'                TargetColNum = FindColumn(tblCustSearcResultsHeader, TargetColName)
'
'                If  TargetColNum = 0 Then
'                    SelectCustomer_Verify = False
'                    LogMessage "WARN","Verification","Please check the  Target Column Header name not available"&TargetColName,False
'                    Exit Function
'                End If                                       
'
'                If Not IsNull(strCIN) Then
'                   SearchColName1 = "CIN/CIN Suffix"  'Column name in the UI
'                    SearchColNum1 = FindColumn(tblCustSearcResultsHeader, SearchColName1)
'                    SearchVal1 = strCIN
'
'                    If  SearchColNum1 = 0 Then
'                        SelectCustomer_Verify = False
'                        LogMessage "WARN","Verification","Please check, the  Search Column Header name not available"&SearchColName1,False
'                        Exit Function
'                    End If
'                End If
'
'
''                If Not IsNull(strName) Then
''
''                End If
''
''                If Not IsNull(strDateOfBirth) Then
''
''                End If
'
'                SelectCustomer_Verify = SearchAndOperateInsideTableCell(tblCustSearchResultsContent, SearchColNum1, SearchVal1, TargetColNum, "VAADINLINK", NULL)
'                
'        End Function
'
'
'
''Description:  
'        Public Function VerifyCustomerSearchResult(strSearchBy, strSearchNRICorPP, strSearchName, strSearchDOB, strCreditCardNumber, strDebitCardNumber, strName, strCINandSuffix, strDOB, strVerifyStatus, strMessage)
'
'                Dim Expected, bVerifyCustomerSearchResult
'                Dim ColName, ColNum
'
'                bVerifyCustomerSearchResult = True  'Flag for Status for each check
'                Browser("Browser_iCall_Home").Sync
'                'Clear the existing fields
'                If Not IsNull(strSearchBy) Then
'                    If TRIM(UCASE(strSearchBy)) = "CUSTOMER"  Then
'                        'clickByCustomer
'                        'Clear the fields
'                        txtNRICorPassport.set ""
'                        Wait 2
'						Set tblCustSearcResultsHeader = bcCustomerSearch.tblCustSearcResultsHeader_Name
'                        Set tblCustSearchResultsContent = bcCustomerSearch.tblCustSearchResultsContent_Name                        
'                    ElseIf TRIM(UCASE(strSearchBy)) = "CARD" Then
'                        clickByCustomer
'						Set tblCustSearcResultsHeader = bcCustomerSearch.tblCustSearcResultsHeader_Card
'                        Set tblCustSearchResultsContent = bcCustomerSearch.tblCustSearchResultsContent_Card                        
'                    Else
'                        LogMessage "WARN","InputError","Search Type Input parameter error. Should be either CUSTOMER or CARD",False
'                        VerifyCustomerSearchResult = False
'                        Exit Function
'                    End If
'                End If
'
'                If Not IsNull(strSearchName) Then
'                    txtName.Set ""
'                        Wait 1
'                    txtName().set strSearchName
'                End If
'
'                If Not IsNull(strSearchNRICorPP) Then
'                    txtNRICorPassport().set strSearchNRICorPP
'                End If
'
'                If Not IsNull(strSearchDOB) Then
'                    txtDateOfBirth().set strSearchDOB
'                End If
'
'                If Not IsNull(strCreditCardNumber) Then
'                    txtCreditCard().set strCreditCardNumber
'                End If
'
'                If Not IsNull(strDebitCardNumber) Then
'                    txtDebitCard().set strDebitCardNumber
'                End If
'                Wait 1
'                If TRIM(UCASE(strSearchBy)) = "CUSTOMER"  Then
'                    clickSearchByCustomer
'                ElseIf TRIM(UCASE(strSearchBy)) = "CARD" Then
'                    clickSearchByCard
'                End If
'
'                Wait 2
'
'                WaitForICallLoading
'
'
'                If Not IsNull(strMessage) Then
'                        If lblErrMessage.Exist(0) Then
'                                strActualMsg = lblErrMessage.GetROProperty("innertext")
'                        Else
'                                strActualMsg = lblMessage.GetROProperty("innertext")
'                        End If
'
'                            If  UCase(Trim(strMessage)) =  UCase(Trim(strActualMsg))Then
'                                    LogMessage "RSLT","Verification","The Expected Message is displayed. Expected:="&strMessage&" Actual:= "&strActualMsg,True
'                                    VerifyCustomerSearchResult = True
'                            Else                        
'                                LogMessage "WARN","Verification","The Expected Message is not displayed. Expected:="&strMessage&" Actual:= "&strActualMsg,False
'                                VerifyCustomerSearchResult = False
'                            End If
'                            Exit Function
'                End If
'                                
'                If ResultTableExists Then  ' The results table i.e header is available
'                        Expected = "Expected Value(s): Name:- " & ArrayToString(strName,"|") & ",CIN/Suffix:- " & ArrayToString(strCINandSuffix,"|") & ", DOB:- " & ArrayToString(strDOB,"|") & ", VerifyStatus:- " & ArrayToString(strVerifyStatus,"|")
'
'                        Dim ResultCount
'                        'ResultCount =    tblCustSearchResultsContent.RowCount
'                        'ResultCount =    tblCustSearchResultsContent.ChildObjects
'                        'Manually click the CIN
'
'                                    If Not IsNull(strName) Then
'    
'                                        ColName = "Name"  'Column name in the UI
'                                        ColNum = FindColumn(tblCustSearcResultsHeader, ColName)
'                    
'                                                If  ColNum => 0 Then
'                                                        If  (verifyTableColumnHasData (tblCustSearcResultsHeader,tblCustSearchResultsContent,ColNum,strName,"PARTIAL",ColName))  Then
'                                                            LogMessage "RSLT","Verification","The search results have matching expected record(s)  "&Expected,True
'                                                        Else
'                                                            LogMessage "WARN","Verification","One or more search results does not match with expected record(s)"&Expected,False
'                                                            bVerifyCustomerSearchResult = False
'                                                        End IF
'                                                Else                        
'                                                    bVerifyCustomerSearchResult = False
'                                                    LogMessage "WARN","Verification","Search Column Header name not available"&ColName,False
'                                                End If                                       
'                                    End If
'                    
'                                    If Not IsNull(strCINandSuffix) Then
'                                        ColName = "CIN/CIN Suffix"  'Column name in the UI
'                                        ColNum = FindColumn(tblCustSearcResultsHeader, ColName)
'                    
'                                                If  ColNum => 0 Then
'                                                        If  (verifyTableColumnHasData (tblCustSearcResultsHeader,tblCustSearchResultsContent,ColNum,strCINandSuffix,"PARTIAL",ColName))  Then
'                                                            LogMessage "RSLT","Verification","The search results have matching expected record(s)  "&Expected,True
'                                                        Else
'                                                            LogMessage "WARN","Verification","One or more search results does not match with expected record(s)"&Expected,False                                                            
'                                                            bVerifyCustomerSearchResult = False
'                                                        End IF
'                                                Else                        
'                                                    bVerifyCustomerSearchResult = False
'                                                    LogMessage "WARN","Verification","Search Column Header name not available"&ColName,False
'                                                End If                                       
'                                    End If
'                    
'                                    If Not IsNull(strDOB) Then
'                                        ColName = "Date of Birth"  'Column name in the UI
'                                        ColNum = FindColumn(tblCustSearcResultsHeader, ColName)
'                    
'                                                If  ColNum => 0 Then
'                                                        If  (verifyTableColumnHasData (tblCustSearcResultsHeader,tblCustSearchResultsContent,ColNum,strDOB,"PARTIAL",ColName))  Then
'                                                            LogMessage "RSLT","Verification","The search results have matching expected record(s)  "&Expected,True
'                                                        Else
'                                                            LogMessage "WARN","Verification","One or more search results does not match with expected record(s)"&Expected,False                                                    
'                                                            bVerifyCustomerSearchResult = False
'                                                        End IF
'                                                Else                        
'                                                    bVerifyCustomerSearchResult = False
'                                                    LogMessage "WARN","Verification","Search Column Header name not available"&ColName,False
'                                                End If                                       
'                                    End If
'                    
'                                    If Not IsNull(strVerifyStatus) Then
'                                        ColName = "Verify"  'Column name in the UI
'                                        ColNum = FindColumn(tblCustSearcResultsHeader, ColName)
'                    
'                                                If  ColNum => 0 Then
'                                                        If  (verifyTableColumnHasData (tblCustSearcResultsHeader,tblCustSearchResultsContent,ColNum,strVerifyStatus,"PARTIAL",ColName))  Then
'                                                            LogMessage "RSLT","Verification","The search results have matching record. "&Expected&" Actual:- "&ColName&" = "&strVerifyStatus,True
'                                                        Else
'                                                            LogMessage "WARN","Verification","One or more search results does not have matching "&Expected&" Actual:- "&ColName&" = "&strVerifyStatus,False
'                                                            bVerifyCustomerSearchResult = False
'                                                        End IF
'                                                Else                        
'                                                    bVerifyCustomerSearchResult = False
'                                                    LogMessage "WARN","Verification","Search Column Header name not available"&ColName,False
'                                                End If        
'                                    End If
'                Else
'                        LogMessage "WARN","Verification","Search Result Table does not exist. Expected search result cannot be verified"&Expected,False
'                        bVerifyCustomerSearchResult = False                    
'                End If
'
'                VerifyCustomerSearchResult = bVerifyCustomerSearchResult
'        End Function
'
'
'
''Description:  
'        Public Function searchCustomer(strSearchBy, strSearchNRICorPP, strSearchName, strSearchDOB, strCardNumber, strExpectedMsg)', strDebitCardNumber, strName, strCINandSuffix, strDOB, strVerifyStatus, strMessage)
'
'                Dim Expected, bSearchCustomer
'                Dim ColName, ColNum
'
'                bSearchCustomer = True  'Flag for Status for each check
'
'                'Clear the existing fields
'                If Not IsNull(strSearchBy) Then
'                    If TRIM(UCASE(strSearchBy)) = "CUSTOMER"  Then
'                        'clickByCustomer
'                        'Clear the fields
'                        txtNRICorPassport.set ""
'                            wait 2
'                        Set tblCustSearcResultsHeader = bcCustomerSearch.tblCustSearcResultsHeader_Name
'                        Set tblCustSearchResultsContent = bcCustomerSearch.tblCustSearchResultsContent_Name
'                        'txtName.Set ""
'                    WaitForICallLoading
'                        'txtDateOfBirth.Set ""
'                        'wait 1
'                    ElseIf TRIM(UCASE(strSearchBy)) = "CARD" Then
'                        clickByCard
'                        Wait 1
'                        Set tblCustSearcResultsHeader = bcCustomerSearch.tblCustSearcResultsHeader_Card
'                        Set tblCustSearchResultsContent = bcCustomerSearch.tblCustSearchResultsContent_Card
'                    Else
'                        LogMessage "WARN","InputError","Search Type Input parameter error. Should be either CUSTOMER or CARD",False
'                        searchCustomer = False
'                        Exit Function
'                    End If
'                End If
'
'                If Not IsNull(strSearchNRICorPP) Then
'                    'txtNRICorPassport.set ""
'                    txtNRICorPassport().set strSearchNRICorPP
'                End If
'
'
'                If Not IsNull(strSearchName) Then
'                    txtName.set ""
'                    txtName().set strSearchName
'                End If
'
'                
'                If Not IsNull(strSearchDOB) Then
'                    txtDateOfBirth.Set ""
'                    txtDateOfBirth().set strSearchDOB
'                End If
'
'                If Not IsNull(strCardNumber) Then
'                     txtCardNumber().set ""
'                    txtCardNumber().set strCardNumber
'                End If
'
'                If TRIM(UCASE(strSearchBy)) = "CUSTOMER"  Then
'                    clickSearchByCustomer
'                ElseIf TRIM(UCASE(strSearchBy)) = "CARD" Then
'                    clickSearchByCard
'                End If
'
'                Wait 2
'
'                WaitForICallLoading
'                If Not IsNull(strExpectedMsg) Then
'                        If lblErrMessage.Exist(0) Then
'                                strActualMsg = lblErrMessage.GetROProperty("innertext")
'                        Else
'                                strActualMsg = lblMessage.GetROProperty("innertext")
'                        End If
'
'                            If  UCase(Trim(strExpectedMsg)) =  UCase(Trim(strActualMsg))Then
'                                    LogMessage "RSLT","Verification","The Expected Message is displayed. Expected:="&strExpectedMsg&" Actual:= "&strActualMsg,True
'                                    searchCustomer = True
'                            Else                        
'                                LogMessage "WARN","Verification","The Expected Message is not displayed. Expected:="&strExpectedMsg&" Actual:= "&strActualMsg,False
'                                searchCustomer = False
'                            End If
'                            Exit Function
'                  else
'                        If lblErrMessage.Exist(0) Then
'                                strActualMsg = lblErrMessage.GetROProperty("innertext")
'                                LogMessage "WARN","Verification","The Error message displayed. Expected :  ,  Actual:= "&strActualMsg,False
'                                searchCustomer=false
'                                Exit Function
'                        End If
'                End If
'                searchCustomer=true
'    End function
'
'    Public Function verifySearchResult(strSearchby,strCardNumber, strName, strCINandSuffix, strDOB,strProductTypeDesc, strVerifyStatus,strSearchResultMsg)
'                Dim bVerifyResult
'            
'                If ResultTableExists Then  ' The results table i.e header is available
'                    If Ucase(strSearchby)="CUSTOMER" Then
'                            Expected = "Expected Value(s): Name:- " & ArrayToString(strName,"|") & ",CIN/Suffix:- " & ArrayToString(strCINandSuffix,"|") & ", DOB:- " & ArrayToString(strDOB,"|") & ", VerifyStatus:- " & ArrayToString(strVerifyStatus,"|")
'                   elseif Ucase(strSearchby)="CARD" then
'                                Expected = "Expected Value(s):Card:-" & ArrayToString(strCardNumber,"|") & ", Name:- " & ArrayToString(strName,"|") & " ,CIN/Suffix:- " & ArrayToString(strCINandSuffix,"|") & ", VerifyStatus:- " & ArrayToString(strVerifyStatus,"|")
'                    End If
'
'                    
'                If Not IsNull(strSearchResultMsg) Then
'                        If lblSearchResultMessage.Exist(0) Then
'                                strActualMsg = lblSearchResultMessage.GetROProperty("innertext")
'                        Else
'                                strActualMsg = ""
'                        End If
'
'                            If  UCase(Trim(strSearchResultMsg)) =  UCase(Trim(strActualMsg))Then
'                                    LogMessage "RSLT","Verification","The Expected Message is displayed. Expected:="&strSearchResultMsg&" Actual:= "&strActualMsg,True
'                                    verifySearchResult = True
'                            Else                        
'                                LogMessage "WARN","Verification","The Expected Message is not displayed. Expected:="&strSearchResultMsg&" Actual:= "&strActualMsg,False
'                                verifySearchResult = False
'                            End If
'                            Exit Function
'                 else
'                        If lblSearchResultMessage.Exist(0) Then
'                                strActualMsg = lblSearchResultMessage.GetROProperty("innertext")
'                                LogMessage "WARN","Verification","The Result message displayed. Expected :  ,  Actual:= "&strActualMsg,False
'                                searchCustomer=false
'                                Exit Function
'                        End If
'            
'
'                End If
'
'                        Dim ResultCount
'                        'ResultCount =    tblCustSearchResultsContent.RowCount
'
'                                    If Not IsNull(strName) Then
'
'                                        strColName = "Name"  'Column name in the UI
'                                        intColNum = FindColumn(tblCustSearcResultsHeader, strColName)
'                    
'                                                If  intColNum > 0 Then
'                                                'ColName
'                                                    bVerifyResult =verifyTableColumnHasData (tblCustSearcResultsHeader,tblCustSearchResultsContent,intColNum,strName,"PARTIAL",strColName)
'                                                    
''                                               
'                                                    If bVerifyResult Then
'                                                                    LogMessage "RSLT","Verification","The search results have matching expected record(s)  "&Expected,True
'                                                    Else
'                                                                    LogMessage "WARN","Verification","One or more search results does not match with expected record(s)"&Expected,False
'                                                                    bVerifyCustomerSearchResult = False
'                                                    End If
'                                                            
'                                                Else                        
'                                                    bVerifyCustomerSearchResult = False
'                                                    LogMessage "WARN","Verification","Search Column Header name not available"&ColName,False
'                                                End If                                       
'                                    End If
'                                    If Not IsNull(strCINandSuffix) Then
'                                        strColName = "CIN/CIN Suffix"  'Column name in the UI
'                                        If Ucase(strSearchby)="CARD" then
'                                            strColName = "CIN/CIN Suffix"  'Column name in the UI
'                                        end If
'                                        intColNum = FindColumn(tblCustSearcResultsHeader, strColName)
'                    
'                                                If  intColNum > 0 Then
'                                                        bVerifyResult=verifyTableColumnHasData (tblCustSearcResultsHeader,tblCustSearchResultsContent,intColNum,strCINandSuffix,"PARTIAL",strColName)
'                                                Else                        
'                                                    bVerifyResult = False
'                                                    LogMessage "WARN","Verification","Search Column Header name not available"&strColName,False
'                                                End If                                       
'                                    End If
'                    
'                                    If Not IsNull(strDOB) Then
'                                        strColName = "Date of Birth"  'Column name in the UI
'                                        intColNum = FindColumn(tblCustSearcResultsHeader, strColName)
'                    
'                                                If  intColNum > 0 Then
'                                                        bVerifyResult=verifyTableColumnHasData (tblCustSearcResultsHeader,tblCustSearchResultsContent,intColNum,strDOB,"PARTIAL",strColName)
'                                                Else                        
'                                                    bVerifyResult = False
'                                                    LogMessage "WARN","Verification","Search Column Header name not available"&strColName,False
'                                                End If                                       
'                                    End If
'                    
'                                    If Not IsNull(strVerifyStatus) Then
'                                        strColName = "Verify"  'Column name in the UI
'                                        intColNum = FindColumn(tblCustSearcResultsHeader, strColName)
'                    
'                                                If  intColNum > 0 Then
'                                                        bVerifyResult=verifyTableColumnHasData (tblCustSearcResultsHeader,tblCustSearchResultsContent,intColNum,strVerifyStatus,"PARTIAL",strColName)
'                                                Else                        
'                                                    bVerifyResult = False
'                                                    LogMessage "WARN","Verification","Search Column Header name not available"&strColName,False
'                                                End If        
'                                    End If
'
'                                    If Not IsNull(strCardNumber) Then
'                                        strColName = "Card No."  'Column name in the UI
'                                        intColNum = FindColumn(tblCustSearcResultsHeader, strColName)
'                    
'                                                If  intColNum => 0 Then
'                                                        bVerifyResult= verifyTableColumnHasData (tblCustSearcResultsHeader,tblCustSearchResultsContent,intColNum,strCardNumber,"PARTIAL",strColName)
'                                                Else                        
'                                                    bVerifyResult = False
'                                                    LogMessage "WARN","Verification","Search Column Header name not available"&strColName,False
'                                                End If        
'                                    End If
'
'                                        If Not IsNull(strProductTypeDesc) Then
'                                        strColName = "Product Type Description"  'Column name in the UI
'                                        intColNum = FindColumn(tblCustSearcResultsHeader, strColName)
'                    
'                                                If  intColNum > 0 Then
'                                                        bVerifyResult=verifyTableColumnHasData (tblCustSearcResultsHeader,tblCustSearchResultsContent,intColNum,strProductTypeDesc,"PARTIAL",strColName)
'                                                Else                        
'                                                    bVerifyResult = False
'                                                    LogMessage "WARN","Verification","Search Column Header name not available"&strColName,False
'                                                End If        
'                                    End If
'
'                                                If bVerifyResult Then
'                                                                    LogMessage "RSLT","Verification","The search results have matching expected record(s)  "&Expected,True
'                                                                    bVerifyCustomerSearchResult=True
'                                                    Else
'                                                                    LogMessage "WARN","Verification","One or more search results does not match with expected record(s)"&Expected,False
'                                                                    bVerifyCustomerSearchResult = False
'                                                    End If
'                                                
'                Else
'                        LogMessage "WARN","Verification","Search Result Table does not exist. Expected search result cannot be verified"&Expected,False
'                        bVerifyCustomerSearchResult = False                    
'                End If
'
'                verifySearchResult = bVerifyCustomerSearchResult
'        End Function
'
'        Public function searchByCard( strCardNumber,strProductTypeDesc,strName,strCINandSuffix,strVerifyStatus,strExpectedMsg,bVerifyResult,strSearchMessage)
'            If not searchCustomer("CARD",null,null,null,strCardNumber,strExpectedMsg) Then
'            
'                searchByCard=false
'            else
'                    LogMessage "RSLT","Verification","Card Search executed succesfully",True
'            End If
'
'            If bVerifyResult Then
'                If not verifySearchResult("CARD",strCardNumber,strName,strCINandSuffix,null,strProductTypeDesc,strVerifyStatus,strSearchMessage) Then
'                searchByCard=false
'                    Exit function
'                End If
'            End If
'            searchByCard=true
'        End Function
'        '*****************************End of Function on the Screen **********************************************************
'
'End Class
'
