Dim bcBrowserApplication
Set bcBrowserApplication = cBrowserApplication()

Public Function cBrowserApplication()
   Set cBrowserApplication=new clsBrowserApplication
End Function

Class clsBrowserApplication

	Public Function setBaseAppState_BDT()
	
		'[Added By  on : 6th Oct 2016]
		
		'#  [Reason:]
		'#	To control total execution time during batch run, 
		'# 	If the total execution time > 110 Minutes (1 Hr 50Mins) ,currently chrome gets crashed: 
		'# 	It is an Iserve application issue
		'# 	If the execution time reaches the Max time limit , then Setting bLogoff = True & bCloseBrowsers = True]
		
		If Not bAppState Then
			bLogOff = False
			bCloseBrowsers = False
			If (Environment.Value("intTotalExecutionTime") > Environment.Value("intMaxLogoutTimeInSeconds")) Then
				Print VbTab & VbTab & "Closing All Browsers as it is reached max timeout limit i.e ["& Environment.Value("intMaxLogoutTimeInSeconds") & "] Seconds."
				Environment.Value("intTotalExecutionTime") = 0
				Environment.Value("intBrowserLaunchCounter") = 0
				bLogOff = True
				bCloseBrowsers = True
			End If
		Else
			Environment.Value("intBrowserLaunchCounter") = 0
		End If
		
		'==================================================================
	
		Print VbTab & VbTab & "AppState Enter : "& Now
	  
		If bSetBaseState Then
	  
			If CheckNull(gstrBackUpChromeLog) Then
				gstrApplicationURL = "--enable-logging --v=1 "&gstrApplicationURL
			End If
			
			If Not bAppState Then	'[Below if block modified By ]
				'[This block will work when application run starts for 1st Time during batch run]
		    	If Environment.Value("intBrowserLaunchCounter") = 0 Then	
		    		bCloseBrowsers = True
		    		CloseBrowsers()
					Launch "website",gstrApplicationURL 'This need to change to strUrl
					bCloseBrowsers = False
					Environment.Value("intBrowserLaunchCounter") = Environment.Value("intBrowserLaunchCounter") + 1
				'[This block will work when User already logged in and want to go back to home page in same session during batch run]
				ElseIf Not bLogOff Then 
					clickBacktoHomePage
				'[This block will work when total execution time reaches maxlogout time ,given in OBATF_Config.vbs file]
				ElseIf bLogOff Then
					LogOff()
					CloseBrowsers()
					Launch "website",gstrApplicationURL 'This need to change to strUrl
					Environment.Value("intBrowserLaunchCounter") = Environment.Value("intBrowserLaunchCounter") + 1
				End If
			Else
				'Check if I call browser exists
				With Browser("micclass:=Browser","title:=ICall.*").Page("micclass:=Page","title:=ICall")
					If .Exist(1) Then
						Set oDesc = Description.Create()		'close if any  browser dialog open
						oDesc("micclass").Value = "WebElement"
						oDesc("class").Value = "v-button-caption"
						oDesc("innertext").Value = "OK|Close|Yes|Cancel"
						Dim intCount:intCount=0
						bHome=.WebElement("class:=v-window v-widget v-readonly").Exist(1)
						
						Print "AppState While"& Now
						
						While bHome
							set lstChilds=.ChildObjects(oDesc)
							If lstChilds.count<>0 Then
								lstChilds(0).highlight
								lstChilds(0).click
								wait 1
							End If
							intCount=intCount+1
							If intCount=5 Then
								 Browser("micclass:=Browser","title:=ICall.*").Close
							End If
							bHome=.WebElement("class:=v-window v-widget v-readonly").Exist(1)
						Wend
						
						Print "AppState While End"& Now
					 Else
						'Print "AppState CloseAllOpen : "& Now	'[Commented By ]
						'CloseAllOpenBrowsers() 	'[Commented By ]
						Print "AppState Close : "& Now
						bCloseBrowsers = True
						CloseBrowsers()
						Print "AppState Relaunch : "& Now
						relaunchAppURL()
						Print "AppState Exit : "& Now
						Exit Function
					End If
				End With
			
				'go to home page
				bHomePage = Browser("Browser_iCall_Login").Page("iCall_Login").WebEdit("txtUserId").Exist(1)
			
				If bHomePage Then
					LogMessage"RSLT", "AppState Verification","Login page is displayed.",true	
				ElseIf bcCustomerOverview.btnBackToHomepage.exist(1) Then
					bcCustomerOverview.btnBackToHomepage.Click
					WaitForIcallLoading
					wait 1
					'Verify Icall Landing page is visible
					If bAppStateLogout Then
						 bLogoutLink=Browser("Browser_iCall_Home").Page("iCall_Logout").WebElement("lnklogout").Exist(1)
						If bLogoutLink Then
							Browser("Browser_iCall_Home").Page("iCall_Logout").WebElement("lnklogout").Click
						End If
						wait 1
						
						'***************This step is added for capturing chrome logs for iCall -- 
						copyChromeLog()
					Else	
						If bcCustomerSearch.pageExists()Then
							LogMessage"RSLT", "AppState Verification","Customer Search page is displayed.",true						
						 Else
							LogMessage"WARN", "AppState Verification","Some error occured",false
							logOff()
							relaunchAppURL()
						End If
				  	End If
				 Else
					logOff()
					relaunchAppURL()
				End If
				
			End If
			
		End If

		If Err <> 0 Then
			Dim strErrorMessage
			strErrorMessage="Error #" & cStr(err.number) & "," & err.Description 
			LogMessage "RSLT", "Keyword Execution","Failed to launch Application"&strErrorMessage, false
			runKey = False
		Else
			runKey = True
		End If
		
		Print VbTab & VbTab & "AppState Exit : "& Now
		
   End Function
   
	Public Sub logOff()

		If bLogOff = True Then
		'If bSetBaseState = True And bLogOff = True Then
		
			Set oDesc = Description.Create()
			oDesc("micclass").Value = "WebElement"
			oDesc("class").Value = "v-button-caption"
			oDesc("innertext").Value = "OK|Close|Cancel"
		
			iMaxLoop = 0
			
	  		If Browser("Browser_iCall_Home").Exist(1) Then
	  		
				bDlgExist = Browser("Browser_iCall_Home").Page("iCall_Activities").WebElement("dlgVerification").Exist(1)
				
				While  bDlgExist
					Set lstChilds = Browser("Browser_iCall_Home").Page("iCall_Activities").ChildObjects(oDesc)
					If lstChilds.count <> 0 Then
						lstChilds(0).click
						Wait(3)
					End If
					iMaxLoop = iMaxLoop + 1
					If iMaxLoop = 4 Then
						'CloseAllOpenBrowsers()
						bCloseBrowsers = True
						CloseBrowsers()	
						Exit Sub
					End If
					bDlgExist = Browser("Browser_iCall_Home").Page("iCall_Activities").WebElement("dlgVerification").Exist(1)
				Wend
				
				bLogout = Browser("Browser_iCall_Home").Page("iCall_Logout").WebElement("lnklogout").Exist(1)
				
				If bLogout Then
					Browser("Browser_iCall_Home").Page("iCall_Logout").WebElement("lnklogout").Click
					If Browser("Browser_iCall_Home").Page("iCall_Logout").WebButton("html id:=logoutYes_button").Exist(2) Then
						Browser("Browser_iCall_Home").Page("iCall_Logout").WebButton("html id:=logoutYes_button").Click
						Wait 1
					End If
				End If
				
	
				'***************This step is added for capturing chrome logs for iCall -- 
				copyChromeLog()

			End If
			
			'If bAppState Then
			
			'[Comment By ]
			
			'CloseAllOpenBrowsers()
			'CloseBrowsers()
			'==========================
			
			'End If	
		End If
	End Sub

	Public Function relaunchAppURL()
		Launch "website",gstrApplicationURL 'This need to change to strUrl
		If Dialog("Internet Explorer").Exist(1) Then
			Dialog("Internet Explorer").Close
			relaunchAppURL()
		End If
	End Function
   
	Public Function setBaseAppState(strUrl)
	  Print "AppState Enter"& Now
	  If bSetBaseState = True Then
		  If  CheckNull(gstrBackUpChromeLog) Then
			gstrApplicationURL="--enable-logging --v=1 "&gstrApplicationURL
		  End If
	'		  	If Browser("Browser_iCall_Home").Page("iCall_Logout").WebElement("lblCommunicationProblem").Exist(1) Then
	'				Browser("Browser_iCall_Home").Close
	'			End If 
	
			If not bAppState Then
				logOff()'
	            Launch "website",gstrApplicationURL 'This need to change to strUrl
			 Else
					'Check if I call browser exists
				'close if any  browser dialog open
				Set oDesc = Description.Create()
				oDesc("micclass").Value = "WebElement"
				oDesc("class").Value = "v-button-caption"
				oDesc("innertext").Value = "OK|Ok|Close|Yes|Cancel"
				Dim intCount:intCount=0
				bHome=Browser("Browser_iCall_Home").Page("iCall_Activities").WebElement("class:=v-window v-widget v-readonly").Exist(1)
				While  bHome
						set lstChilds=Browser("Browser_iCall_Home").Page("iCall_Activities").WebElement("class:=v-window v-widget v-readonly").ChildObjects(oDesc)
					
						If lstChilds.count<>0 Then
							lstChilds(0).highlight
							lstChilds(0).click
							wait 1
						End If
						intCount=intCount+1
						If intCount=5 Then
							 Browser("Browser_iCall_Home").Close
						End If
						bHome=Browser("Browser_iCall_Home").Page("iCall_Activities").WebElement("class:=v-window v-widget v-readonly").Exist(1)
				Wend
			
	
				'go to home page
				bHomePage=Browser("Browser_iCall_Login").Page("iCall_Login").WebEdit("txtUserId").Exist(1)
				If bHomePage Then
						LogMessage"RSLT", "AppState Verification","Login page is displayed.",true	
	
				elseIf bcCustomerOverview.btnBackToHomepage.exist(1) Then
					bcCustomerOverview.btnBackToHomepage.Click
					WaitForIcallLoading
					wait 1
					'Verify Icall Landing page is visible
					If bAppStateLogout Then
						 bLogoutLink=Browser("Browser_iCall_Home").Page("iCall_Logout").WebElement("lnklogout").Exist(1)
						If bLogoutLink Then
							Browser("Browser_iCall_Home").Page("iCall_Logout").WebElement("lnklogout").Click
						End If
						WaitForReady
						'***************This step is added for capturing chrome logs for iCall -- 
						copyChromeLog()
					Else
						bHomePage=Browser("Browser_iCall_Login").Page("iCall_Login").WebEdit("txtUserId").Exist(1)
						If bcCustomerSearch.pageExists() OR  bHomePage Then
							LogMessage"RSLT", "AppState Verification","Customer Search page is displayed.",true						
						 else
								LogMessage"WARN", "AppState Verification","Some error occured",false
								logOff()'
								relaunchAppURL ()
	'								If gstrKeyword<>"LoginICALL" Then
	'									bcLoginICALLScreen.signIn gstrDefaultUserType, gstrDefaultUserName, gstrDefaultPassword,"SUCCESS",NULL
	'								End If
						End If
					  End If
				 elseIf cUserProfile.pageExists() Then
							LogMessage"RSLT", "AppState Verification","Customer Profile Admin page is displayed.",true 
						If bAppStateLogout Then
							bLogoutLink=Browser("Browser_iCall_Home").Page("iCall_Logout").WebElement("lnklogout").Exist(1)
							If  bLogoutLink Then
								Browser("Browser_iCall_Home").Page("iCall_Logout").WebElement("lnklogout").Click
							End If
							WaitForReady
							'***************This step is added for capturing chrome logs for iCall -- 
							copyChromeLog()
						End If
				else
						logOff()'
						relaunchAppURL ()
	'						If gstrKeyword<>"LoginICALL" AND not isEmpty(gstrKeyword) Then
	'								bcLoginICALLScreen.signIn gstrDefaultUserType, gstrDefaultUserName, gstrDefaultPassword,"SUCCESS",NULL
	'						End If
				End If
	
			End If
	  End If
	
	'Set the opened browser to Maximize state
	Browser("micclass:=Browser").Sync
	'Set objIE = Browser("micclass:=Browser").GetROProperty("hwnd")
	'	hWnd = Browser("micclass:=Browser").GetROProperty("hwnd")
	'	Window("hwnd:="& hWnd).Maximize
	
	' Browser("Browser_iCall_Login").FullScreen
	   
		If Err <> 0 Then
			Dim strErrorMessage
		 ' MsgBox "Error # " & CStr(Err.Number) & " " & Err.Description
	
			strErrorMessage="Error #" & cStr(err.number) & "," & err.Description 
			LogMessage "RSLT", "Keyword Execution","Failed to launch Application"&strErrorMessage, false
			runKey =False
		else
			runKey =True
		end if 
		 Print "AppState Exit"& Now
	End Function
	
	Private Sub copyChromeLog()
		If CheckNull(gstrBackUpChromeLog) Then
			Set objFSo = CreateObject("Scripting.FileSystemObject")
			dateTimeNow = DotNetFactory.CreateInstance( "System.DateTime" ).Now.ToString( "ddMMyyHHmmss" )
			strFileName = gstrCurrentProjectDir & "\06Temp\Chrome\chrome_debug_"&dateTimeNow&".log"
			objFSO.CopyFile "C:\Users\iservetestcenter\AppData\Local\Google\Chrome\User Data\chrome_debug.log", strFileName
		End If
   End Sub

End Class
