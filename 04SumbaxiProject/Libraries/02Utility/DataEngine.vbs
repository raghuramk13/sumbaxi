'+++++++++++++++++++++++++++++++++++ File Header Information ++++++++++++++++++++++++++++++++++++++++++++++
	'<Summary>  This file contains all the class declarations and 
								'functions for the  Data Handling. 
                                '</summary>

   '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Option Explicit

	Public function cDataEngine
	  set cDataEngine=new clsDataEngine
	End Function

   Class clsDataEngine
		   Private sub Class_Initialize
					
			End Sub

		   Public Function startDataEngine(strTestcaseName, strKWsheetPath, strDataSetFilter) '
			  Dim arrRawListData
			  Dim arrArgListData
			  Dim arrONDataSet
			  Dim arrKeywordSequence
			  Dim argDDAddedData
			 ' msgbox "data Engine"
		 
		   arrRawListData=cExcelDataEngine.fetchData (strTestcaseName, strKWsheetPath)
		'	strSQLStatement="Select  *  from ["& strTestcaseName &"$] where  ["& strTestcaseName &"$].Sequence <> '0' AND ["& strTestcaseName &"$].TestCase <>'NULL'  "

			'arrRawListData=cExcelDataEngine.FetchExcelValue (strSQLStatement,strKWsheetPath )
			   'Dim strDDSheet
			   'strDDSheet = "DDSheet"
			   argDDAddedData = addDataDrivenScenarios(arrRawListData, strKWsheetPath, strTestcaseName, strDataSetFilter)
			   argListData = formArgumentList(argDDAddedData)			   
			   arrONDataSet=filterONDataset(argListData)
				'msgbox "" & arrONDataSet(1, 4)
		
			   arrKeywordSequence=sequenceKeyword(arrONDataSet)
			   startDataEngine=	arrKeywordSequence
		
		   End Function
		
		   public Function fetchData (strTestcaseName, strKWsheetPath)
			  
			  ReDim MyRowData (10,20)
			 ' msgbox "data Engine"
			   fetchData=MyRowData
			  
		   End Function
		
		
		   Private Function formArgumentList(arrRawListData)
			  Dim iTotalRows, iTotalCols
		
			  iTotalRows=Ubound(arrRawListData)
			  iTotalCols=Ubound(arrRawListData,2)

			  Dim  strTempArg
			  ReDim arrArgListedData(cint(iTotalRows),cint(iArguments))
			  ReDim lstStrings(0)
			 For iCount=0 to iTotalRows
				 For iArg =iArguments to iTotalCols-1
					 strTempArg=null
					 strTempArg=arrRawListData(iCount,iArg)
					 If (isNull(strTempArg) or (strTempArg =null)) Then
						 Exit for
					else
						Redim Preserve lstStrings(iArg-iArguments)
						lstStrings(iArg-iArguments)=strTempArg
					 End If
				 Next
		
				 arrRawListData(iCount, iArguments)=lstStrings
		
			 Next
		
			 For iList=0 to Ubound(arrRawListData)
		
				 For iColList=0 to Ubound(arrArgListedData,2)
					 arrArgListedData(iList,iColList)=arrRawListData(iList,iColList)
				 Next
		
			 Next
		
			formArgumentList=arrArgListedData
		
		
		   End Function

		Private Function addDataDrivenScenarios(arrData, strDDExcelPath, strDDTestSheet, strDataSetFilter)

			  Dim iTotalRows, iTotalCols
			  Dim bDDFound
			  bDDFound = FALSE
			  Dim iMergeCount
			  iMergeCount = 0
			  ReDim array2D2(0,1)
		
			  iTotalRows = Ubound(arrData)
			  iTotalCols = Ubound(arrData, 2)

			  Dim  strTempArg
			  'ReDim Preserve arrData(cint(iTotalRows),cint(iArguments))
			  'ReDim lstStrings(0)
              ReDim arrayDDTest(0)
			  Dim arrMergedData
		

			 For iCount=0 to iTotalRows-1
                 strTempDDTestName = null
				 strTempDDTestName = arrData(iCount,iDataSet)
				 

				 If ( InStr(1, strTempDDTestName,"DD_", 1) = 1 And Not  itemExistsInArray(arrayDDTest, strTempDDTestName) ) Then
					 bDDFound = TRUE
					 addItemToArray arrayDDTest, strTempDDTestName
					 strDDExcelPath = arrData(iCount, giDDTestPath)
					 strDDSheet = arrData(iCount, giDDTestDDSheetName)
					 Print(strDDExcelPath)
					 Print(strDDSheet)

'					 Dim  strSQLQuery 
'					 If  strDataSetFilter = "*" Then
'						 strSQLQuery =   "Select * from ["& strDDSheet &"$] where  ["& strDDSheet &"$].RecordType <> 'NULL'  AND  ["& strDDSheet &"$].Sequence <> '0' AND  ["& strDDSheet &"$].RecordType LIKE 'KWD%'"'"    '$Satheesh
'   					 Else
'					     strSQLQuery =   "Select * from ["& strDDSheet &"$] where  ["& strDDSheet &"$].RecordType <> 'NULL'  AND  ["& strDDSheet &"$].Sequence <> '0' AND  ["& strDDSheet &"$].RecordType LIKE 'KWD%' AND  ["& strDDSheet &"$].DataSet = '"&strDataSetFilter&"'"    '$Satheesh
'    				 End If

				
				Dim DD_KWexe
			    DD_KWexe = Environment.Value("DD_KWexe") 'global variable' NEED TO CHANGE

					  If  DD_KWexe = True Then
						 strSQLQuery =   "Select * from ["& strDDSheet &"$] where  ["& strDDSheet &"$].RecordType <> 'NULL'  AND  ["& strDDSheet &"$].Sequence <> '0' AND  ["& strDDSheet &"$].RecordType LIKE 'KWD%' Order By  ["& strDDSheet &"$].Sequence"'"    '$Satheesh
   					 Else
					     strSQLQuery =   "Select * from ["& strDDSheet &"$] where  ["& strDDSheet &"$].RecordType <> 'NULL'  AND  ["& strDDSheet &"$].Sequence <> '0' AND  ["& strDDSheet &"$].RecordType LIKE 'KWD%' AND  ["& strDDSheet &"$].DataSet = '"&strDataSetFilter&"' Order By  ["& strDDSheet &"$].Sequence"    '$Satheesh
    				 End If
               
					Dim arrRawDDData

					If  (bHasKWDNext ) Then
						arrRawDDData = cExcelDataEngine.FetchExcelValue (strSQLQuery,strDDExcelPath )
					else
						arrRawDDData = cExcelDataEngine.getKWDDataFromDDSheet(strDDExcelPath,strDDSheet)
					End If

					 Dim arrDDRowWise
					 arrDDRowWise = arrangeDDSheetDataRowWise(arrRawDDData,strDDExcelPath, strDDTestSheet, strDDSheet, strTempDDTestName)
                     
					 If  iMergeCount =0 Then
						  arrMergedData = mergeTwoDimensionalArrays (array2D2, arrDDRowWise )
					else
						   arrMergedData = mergeTwoDimensionalArrays (arrMergedData, arrDDRowWise )
					 End If

					 iMergeCount = iMergeCount + 1

					 'Print(strTempArg)
				 End If				 
		
			 Next
			 		If  bDDFound Then
						addDataDrivenScenarios = arrMergedData
						Exit Function
					else
					   addDataDrivenScenarios = arrData
					   Exit Function
					   					 
					End If
			
			Exit Function
        		
		   End Function

		   Private Function arrangeDDSheetDataRowWise(arrData,strDDExcelPath, strDDTestSheet, strDDSheet, strTempDDTestName)
			  Dim iTotalRows
			  Dim arrayDD(0,1)
			  
			  Dim iCount
			  iCount = 0
              		
			  iTotalRows=Ubound(arrData)
    	
			 For iRowCount=0 to iTotalRows
					 Dim arrRawRowData
					 arrRawRowData = returnColumnValuesForARow (arrData, iRowCount)

					 Dim strRecordType
					 strRecordType = arrRawRowData(giDDDataSheetRecordType)

					  Dim strDatasetONOFF
					 strDatasetONOFF = arrRawRowData(giDDDataSheetDataSetONOFF)

					 If  (Trim(Ucase(strRecordType)) = "KWD" And Trim(Ucase(strDatasetONOFF)) = "ON" )Then

						Dim strDataSeqNo
						strDataSeqNo = arrRawRowData(giDDDataSheetSequence)

                        Dim arrDDRowExtendedKWD				
						arrDDRowExtendedKWD =  addExtendedKWD(arrData, iRowCount, strDataSeqNo)
						
						Dim arrDDRowExtendedKWDFinal
						arrDDRowExtendedKWDFinal = append1DArrayWith1DArray(arrRawRowData, arrDDRowExtendedKWD)
						
						Dim arrSplitData
						arrSplitData = splitDDRowDataIntoKeywords(arrDDRowExtendedKWDFinal,strDDExcelPath, strDDTestSheet, strDDSheet, strTempDDTestName)
						
						Dim arrMergedData                     
						
						If  iCount =0 Then
							arrMergedData = mergeTwoDimensionalArrays (arrayDD, arrSplitData )
						else
							arrMergedData = mergeTwoDimensionalArrays (arrMergedData, arrSplitData )
						End If
						
						iCount = iCount + 1
                    
					 End If					 

			 Next			
		
			  arrangeDDSheetDataRowWise = arrMergedData
			 Exit Function
		
		   End Function

		   Private Function addExtendedKWD(arrData, iRowCount, strDataSeqNo)

			Dim iTotalRows
			ReDim arrayDD(0)
			Dim arrMergedData
			Dim iCount
			iCount = 0
			Dim strSeqNo
			   
			  iTotalRows = Ubound(arrData)
    	
			 For iCount = iRowCount+1 to iTotalRows

					 Dim arrRawRowData
					 arrRawRowData = returnColumnValuesForARow (arrData, iCount)

					Dim strCurrentDataSeqNo
					strCurrentDataSeqNo = arrRawRowData(giDDDataSheetSequence)

					Dim strDataType
					strDataType = arrRawRowData(giDDDataSheetRecordType)

					If  ( (strCurrentDataSeqNo = strDataSeqNo) And (Trim(Ucase(strDataType) )= "KWD_NEXT") ) Then

						arrRawRowData = removeFirstNElements1DArray (arrRawRowData, giDDDataSheetKWConfigStart )

						If  iCount = iRowCount+1 Then
							arrMergedData = append1DArrayWith1DArray(arrayDD, arrRawRowData)
						else
						   arrMergedData = append1DArrayWith1DArray(arrMergedData, arrRawRowData)
						End If
					else
					  addExtendedKWD = arrMergedData
					  Exit Function
					End If

			 Next			
		
			  addExtendedKWD = arrMergedData
			 Exit Function
		
		   End Function
			'Function were we sort, map & verify the KW in the excel
		   Private Function splitDDRowDataIntoKeywords(arrRawRowData, strDDExcelPath, strDDTestSheet, strDDSheet, strTempDDTestName)
                ReDim array2DDDRows (0,1)
				Dim iRowCount
				iRowCount = 0
								
				Dim strTableName
				strTableName =  "KeywordClassMap"
            	
				Dim strColumnName
				strColumnName = "Keyword"

				Dim arrKWPool
				arrKWPool = cExcelDataEngine.fetchRowValuesForAColumn(strTableName, strColumnName, gstrKeywordClassMap)				

				Dim strDDDataSetName
                strDDDataSetName = strTempDDTestName & "|" & arrRawRowData(giDDDataSheetDataSet)

				Dim strDDDataSetONOFF
                strDDDataSetONOFF = arrRawRowData(giDDDataSheetDataSetONOFF)

				Dim strDSSequence
                strDSSequence = arrRawRowData(giDDDataSheetSequence)

				Dim arrDSONOFFDetails
                arrDSONOFFDetails = Array (strDDDataSetName, strDDDataSetONOFF)	

				Dim arrKWIRaw
				arrKWIRaw = fetchKeywordInfoForDataSet(strDDExcelPath, strDDSheet, strDSSequence)

				Dim arrayKWDetails
				arrayKWDetails = cExcelDataEngine.fetchDetailsOfKeyword(strTempDDTestName, strDDExcelPath, strDDTestSheet)

				For iCount = giDDDataSheetKWConfigStart  to Ubound(arrRawRowData)
					  
			         If  ( itemExistsInArray(arrKWPool, arrRawRowData(iCount)) ) Then
                         
							 Dim  strKeywordName
							 ReDim arrKWArgs(0)
	
							 strKeywordName = arrRawRowData(iCount)
							 addItemToArray arrKWArgs, strKeywordName
	
							 For iInnerCount = iCount+1 to Ubound(arrRawRowData)
	
								 If  ( Not (itemExistsInArray(arrKWPool, arrRawRowData(iInnerCount)) ) ) Then
									 addItemToArray arrKWArgs, arrRawRowData(iInnerCount)
								 else
									iCount = iInnerCount -1									
									Exit For
								 End If

							 Next
							 	   
							'Dim arrKWIRaw
							'arrKWIRaw = fetchKeywordInfoForDataSet(strDDExcelPath, strDDSheet, strDSSequence)
	
							
							Dim arrKWInfo
                            arrKWInfo = fetchKeywordExceptionInfoForNthKeyword (arrKWIRaw, iRowCount )
	
							Dim arrayWithKWInfo
							arrayWithKWInfo = insertArrayIntoArray (arrKWArgs, arrKWInfo, giDDDataSheetRecordType)
	
							Dim arrayWithDSONOFF
							arrayWithDSONOFF = insertArrayIntoArray (arrayWithKWInfo, arrDSONOFFDetails, giDDDataSheetDataSet)

'							Dim arrayKWDetails
'							arrayKWDetails = cExcelDataEngine.fetchDetailsOfKeyword(strKeywordName, cStr(iRowCount+1), strTempDDTestName, strDDExcelPath, strDDTestSheet)

							Dim strMachine
							strMachine = arrayKWDetails(iRowCount, giDDTestMachine)

							Dim strSeq
							strSeq = arrayKWDetails (iRowCount, giDDTestSequence)

							Dim arrayWithMachine
							arrayWithMachine = insertArrayIntoArray (arrayWithDSONOFF, Array (strMachine), giDDDataSheetRecordType)

							Dim arrayWithSequece
							arrayWithSequece = insertArrayIntoArray (arrayWithMachine, Array (strSeq), giDDDataSheetKWConfigStart)

                            'Insert Empty col
							Dim strEmpty
							addItemToArray arrayWithSequece, strEmpty

	
							Dim arrayTemp
	
							If  iRowCount =0 Then
								arrayTemp = appendTwoDimensionalArray (array2DDDRows,arrayWithSequece )
							else
								   arrayTemp = appendTwoDimensionalArray (arrayTemp,arrayWithSequece )
	
							End If
																		  
							iRowCount = iRowCount +1							
                        
					 End If					 
			
				 Next
                 	
				splitDDRowDataIntoKeywords=arrayTemp
				Exit Function
			
		   End Function

			Private Function fetchKeywordInfoForDataSet(strDDExcelPath, strDDSheet, strSequence)

			    'strSequence = "1"
				

				Dim arrSequence
				arrSequence = cExcelDataEngine.	fetchRowValuesForAColumnBasedOnQuery(strDDSheet, "Sequence", strDDExcelPath, "RecordType", "KWI")
				strSequence = fetchRelevantSequence(arrSequence, strSequence )		

				Dim strSQLQuery
				strSQLQuery =   "Select  *  from ["& strDDSheet &"$] where  ["& strDDSheet &"$].RecordType <>'NULL'   AND  ["& strDDSheet &"$].RecordType Like  'KWI%'   AND  ["& strDDSheet &"$].Sequence = '" & strSequence &"'"
            	
				Dim arrKWI
				arrKWI = cExcelDataEngine.FetchExcelValue (strSQLQuery,strDDExcelPath )

                fetchKeywordInfoForDataSet = addExtendedKWI(arrKWI)

				Exit Function

			End Function

			Private Function addExtendedKWI(arr2DKWI)

				Dim iTotalRows
				ReDim arrayDD(0)
				Dim arrMergedData
				Dim iCount
				iCount = 0
				Dim strSeqNo
				   
				 iTotalRows = Ubound(arr2DKWI,1)
			
				 For iCount = 0 to iTotalRows
	
						 Dim arrRawRowData
						 arrRawRowData = returnColumnValuesForARow (arr2DKWI, iCount)
                    	
						If  ( iCount = 0 ) Then							
							arrMergedData = append1DArrayWith1DArray(arrayDD, arrRawRowData)
						else
							arrRawRowData = removeFirstNElements1DArray (arrRawRowData, giDDDataSheetKWConfigStart )
							arrMergedData = append1DArrayWith1DArray(arrMergedData, arrRawRowData)
						End If					
	
				 Next			
			
				  addExtendedKWI = arrMergedData
				 Exit Function
			
		   End Function


			Private Function fetchRelevantSequence(arrSequence, strSequence )

			    If (itemExistsInArray (arrSequence, strSequence ))Then
                    fetchRelevantSequence = strSequence
					Exit Function
				End If
				
			  Dim iSeq
			  iSeq = CInt(strSequence) - 1

			  For iCount = iSeq to 1 Step -1
					 If   (itemExistsInArray (arrSequence, cStr(iCount)) )Then
                        fetchRelevantSequence = iCount
						Exit Function
					End if

			  Next

			  fetchRelevantSequence = NULL
            
			 Exit Function

			End Function

		   Private Function isKeyword(strKeywordName)

				Dim strTableName
				strTableName =  "KeywordClassMap"
            	
				Dim strColumnName
				strColumnName = "Keyword"

				Dim arrKW
				arrKW = cExcelDataEngine.fetchRowValuesForAColumn(strTableName, strColumnName, gstrKeywordClassMap)
     
				isKeyword = itemExistsInArray(arrKW, strKeywordName)

				Exit Function

		   End Function

		   Private Function fetchKeywordExceptionInfoForNthKeyword (array1DSource, iKeywordRank )
				  Dim iTotalCols 
				  ReDim arrString(0)  
				
				  iTotalCols =  Ubound(array1DSource)
			
				   For  iColCount = giDDDataSheetKWConfigStart to iTotalCols
					   Dim strTemp
					   strTemp = array1DSource ( iColCount)
			
					   If ( Not isEmpty (strTemp) ) Then
						   addItemToArray arrString, strTemp
					   End If
							 
				   Next
			
				   ReDim arrNthKWInfo(0)
			
				   For  iCount = (iKeywordRank * giTestDDKWConfigDetailsCount) to ((iKeywordRank *giTestDDKWConfigDetailsCount)+ (giTestDDKWConfigDetailsCount-1))
					   Dim strTempVal
					   strTempVal = arrString (iCount)
			
					   If ( Not isEmpty (strTempVal) ) Then
						   addItemToArray arrNthKWInfo, strTempVal
					   End If
							 
				   Next 					 
				
			
				  fetchKeywordExceptionInfoForNthKeyword =  arrNthKWInfo
				  Exit Function
			End Function

		
		   Private Function filterONDataset(arrListData)
				  ReDim arrTempData(0)
				  Dim strFirstDSONOFF 
				 strFirstDSONOFF =arrListData(0,iDataSetONOFF)
				 iRowCount =Ubound(arrListData,1)
				 iColCount =Ubound(arrListData,2)
				 ReDim lstValidData(5,5)
				ReDim lstValidData(Cint(iRowCount),Cint(iColCount))
				'msgbox strFirstDSONOFF
'			 If UBound(arrListData)=1 Then '$Satheesh
			If UBound(arrListData)=0 Then 
					Select Case strFirstDSONOFF
		
					Case "ON"
						'Print("DataSet is ON")
						filterONDataset=arrListData
		
					Case "OFF"
						'Print("DataSet is OFF")
						arrTempData= empty
		
					Default
					'Print("Provide valid data sets")
					 LogMessage "RSLT", "Input Validations", "At least One Data Set should be ON , Please provide valida data",false
		
					End Select
		
			else
						 Dim strDSOuter, strDSInner, strSeqOuter, strSeqInner, strDSONOFF, strCurrentDS,strDS
						 ReDim arrlstDSOFF (0)
						 Dim iRowOuter,iCount,iCountDSOFF,iCountON
						
						 For iCount  =0 to Ubound(arrListData)
							 strDS=arrListData(iCount,iDataSet)
							 strDSONOFF=arrListData(iCount,iDataSetONOFF)
							' Print("" &strDS& " " &strDSONOFF )
							 If strComp(Trim(Ucase(strDSONOFF)),"OFF")=0 Then
								 iCountDSOFF=iCountDSOFF+1
								 ReDim preserve arrlstDSOFF(cInt(iCountDSOFF))
								 arrlstDSOFF(iCountDSOFF-1)=strDS
							 End If
						 Next
		
							iCountON=0
							iRowCount =0
						 For iRowOuter =0 to (Ubound(arrListData))
								 strCurrentDataSet=arrListData(iRowOuter,iDataSet)
								 'Print(arrayfind(arrlstDSOFF,strCurrentDataSet))
								 If not (arrayfind(arrlstDSOFF,strCurrentDataSet)) Then
										For iCol =0 to Ubound(arrListData,2)
											 lstValidData(iRowCount,iCol)=arrListData(iRowOuter,iCol)
										Next
										iRowCount=iRowCount+1
								 End If
						 Next
		
						 If Ubound(lstValidData)=0 Then
							 LogMessage "RSLT", "Input Validations", "At least One Data Set should be ON",false
							 Print("At least One Data Set should be on")
						 else
								filterONDataset= lstValidData
						 End If
			 End If
		
		
		   End Function			
		
		   Private Function sequenceKeyword(arrONDataSet)
			  Dim strCurrentSequence, strCurrentKeyword,iColCount
			  Dim arrTempSeq
			  Dim arrDataSeq 
			  reDim arrTemp(1,1)
			  
			  iRowCount=0
		
			  For iCount =0 to ubound(arrONDataSet)
				  strCurrentSequence=arrONDataSet(iCount,iSequence)
				   If  strCurrentSequence<>0 Then
					 iRowCount=iRowCount+1
				   End If
			  Next
		
			  ReDim arrTemp(cint(iRowCount),cint(UBound(arrONDataSet,2)))
		
			  iRowCount=0
			  For iCount=0 to UBound(arrONDataSet)
		
				  strCurrentSequence=arrONDataSet(iCount,iSequence)
				  If  strCurrentSequence<>0 Then
					  For iColCount=0 to Ubound(arrONDataSet,2)
						  arrTemp(iRowCount,iColCount)=arrONDataSet(iCount,iColCount)
					  Next
					 iRowCount=iRowCount+1
				   End If
			  Next
		
			  arrDataSeq=arrSortSequence(arrTemp)
		
			sequenceKeyword=arrDataSeq
		
		   End Function
		
		
		  Private Function arrSortSequence(arrData)
			   '== This function sorts Testdata based on Sequence and DataSet
			   For iCount =0 to (Ubound(arrData,1)-1)
				dim iCurrentSeq, strCurrentKeyword,strCurrentDS
				Dim iInnerSeq, strInnerKeyword,iInnerSeqNext,strNextDS
				iCurrentSeq=arrData(iCount,iSequence)
				strCurrentKeyword=arrData(iCount,iKeyword)
				strCurrentDS=arrData(iCount,iDataSet)
				iNextSeq=""
			
				iNextSeq=arrData(iCount,iSequence)
			
					For iInner=0 to (Ubound(arrData,1)-2)
						iInnerSeq=arrData(iInner,iSequence)
						iInnerSeqNext=arrData(iInner+1,iSequence)
						strNextDS=arrData(iInner+1,iDataSet)
						strInnerDS=arrData(iInner,iDataSet)
						If strcomp(strCurrentDS,strNextDS)=0 Then
							If(cint( iInnerSeq)>cint (iInnerSeqNext))Then
								SwapRows arrData,iInner,iInner+1
							End If
						End If
				
					Next
			
				Next
		
				arrSortSequence=sortDataSet(arrData)
		
			End Function
		
		Private Function sortDataSet(lstValidDataSets)
				Dim strCurrentDS, strNextDS, iRow, iDSCount
				ReDim arrsortDS(cint(Ubound(lstValidDataSets,1)),cint(Ubound(lstValidDataSets,2)))
				iRow=0
				ReDim arrDS(1)
				iDSCount=0
				For iDS=0 to Ubound( lstValidDataSets)
					strDS=lstValidDataSets (iDS,iDataSet)
					If not ArrayFind (arrDS,strDS) Then
						iDSCount=iDSCount+1
						Redim Preserve arrDS(cint(iDSCount))
						arrDS(iDSCount-1)=lstValidDataSets(iDS,iDataSet)
					End If
		
				Next
		
			   For iRowOuter=0 to Ubound(arrDS)
				  
				   strCurrentDS=arrDS (iRowOuter)
				  
			
				   For iRowInner=0 to Ubound(lstValidDataSets)
					   strNextDS=lstValidDataSets (iRowInner,iDataSet)
					   If strComp(strCurrentDS,strNextDS)=0 Then
			
						   For iCol=0 to Ubound(lstValidDataSets,2)
							   arrsortDS(iRow,iCol)=lstValidDataSets(iRowInner,iCol)
							Next
			
						 iRow=iRow+1
					   End If
				   Next
			
			 Next
			sortDataSet=arrsortDS
			End Function
		
			Private Sub SwapRows(ary,row1,row2)
			  '== This procedure swaps two rows of an array 
			  Dim x,tempvar
			  For x = 0 to Ubound(ary,2)
				tempvar = ary(row1,x)    
				ary(row1,x) = ary(row2,x)
				ary(row2,x) = tempvar
			  Next
			End Sub  'SwapRows

End Class
'+++++++++++++++++++++++++++++++++++++++++Data Engine Class Ends+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


