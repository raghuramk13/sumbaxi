'[Verify default Statement date displayed]
Public Function VerifyDefaultStatementDate_Stmt(strStatementDate)
bVerifyStatementDate = True	
scrollPageDown 3
If Not IsNull(strStatementDate) Then
	'scrollPageDown 5
	If Not VerifyFieldValue(coStatements_Page.txtStatementDate(),strStatementDate,"Statement Date") Then
	   bVerifyStatementDate = False
	End If
End If
VerifyDefaultStatementDate_Stmt = bVerifyStatementDate
End Function

'[Set Statement Date from the dropdown]
Public Function SetStatementDate_Stmt(strStatementDate)
'scrollPageDown 4
SetStatementDate_Stmt = SetValue(coStatements_Page.txtStatementDate(),strStatementDate,"Statement Date")
End Function

'[Verify list of fields in statement summary section]
Public Function VerifyStmtSummaryFields_Stmt(arrLblValPairs,strProductType)
'scrollPageDown 4
  VerifyStmtSummaryFields_Stmt = VerifyIDLabelValuePairs(coStatements_Page.lblAccordionStatement,arrLblValPairs,strProductType,"Statements")
End Function

'[Enter Transaction Date in textbox displayed below statement Accordion]
Public Function SetTransactionDate_stmt(StrTransactionDate)
scrollPageDown 4
	SetTransactionDate_stmt = SetEditBoxInsideTable(coStatements_Page.tblStatementSummary(),StrTransactionDate)
End Function

'[Verify records displayed in statement Transaction Summary table searched based on Transaction Date]
Public Function VerifySearchBasedStmtTransSummary_stmt(StrExpValue)
 VerifySearchBasedStmtTransSummary_stmt = VerifySearchRecordsdisplayed(coStatements_Page.tblStatementSummaryHeader,coStatements_Page.tblStatementSummaryContent,"TRANSACTION DATE",StrExpValue)
End Function

'[Verify table row statement transaction summary displayed below statement Accordion]
Public Function VerifyStmtTransactionSummary_stmt(lstlstAccountData)
'scrollPageDown 5
 VerifyStmtTransactionSummary_stmt = VerifyTableSingleRowData(coStatements_Page.tblStatementSummaryHeader,coStatements_Page.tblStatementSummaryContent,lstlstAccountData,"Statement Transaction Summary")
End Function

'[Verify Pagination for table displayed statement transaction summary]
Public Function VerifyTablePagination_Stmt(NoOfRows)
 bVerifyPagination = False  
 Set objFristPage = SetObjectFirstPage(coStatements_Page.tblStatementPager)
 Set objPreviousPage = SetObjectPreviousPage(coStatements_Page.tblStatementPager)
 Set objNextPage = SetObjectNextPage(coStatements_Page.tblStatementPager)
 Set objLastPage = SetObjectLastPage(coStatements_Page.tblStatementPager)
 scrollPageDown 5
 bVerifyPagination = VerifytablePagination(coStatements_Page.tblStatementSummaryHeader,coStatements_Page.tblStatementSummaryContent,objFristPage,objPreviousPage,objNextPage,objLastPage,"TRANSACTION DATE",NoOfRows)
 If Not bVerifyPagination  Then
 	scrollPageDown 3
 	bVerifyPagination = VerifytablePagination(coStatements_Page.tblStatementSummaryHeader,coStatements_Page.tblStatementSummaryContent,objFristPage,objPreviousPage,objNextPage,objLastPage,"TRANSACTION DATE",NoOfRows)
 End If
 Set objFristPage = Nothing
 Set objPreviousPage = Nothing
 Set objNextPage = Nothing
 Set objLastPage = Nothing
 VerifyTablePagination_Stmt = bVerifyPagination 
End Function

