echo 资源管理器隐藏组织栏
del /f /q /a "%X%\Windows\System32\UIRibbon.dll"
del /f /q /a "%X%\Windows\System32\UIRibbonRes.dll"
del /f /q /a "%X%\Windows\System32\zh-CN\UIRibbon.dll.mui"

reg delete "HKLM\Tmp_SOFTWARE\Classes\CLSID\{0F7434B6-59B6-4250-999E-D168D6AE4293}" /f
reg delete "HKLM\Tmp_SOFTWARE\Classes\CLSID\{32665929-D77E-4ab5-8C08-FBF409B8A233}" /f
reg delete "HKLM\Tmp_SOFTWARE\Classes\CLSID\{926749fa-2615-4987-8845-c33e65f2b957}" /f
reg delete "HKLM\Tmp_SOFTWARE\Classes\CLSID\{C608E099-892D-4628-B6A2-97257B014E2E}" /f
reg delete "HKLM\Tmp_SOFTWARE\Classes\WOW6432Node\CLSID\{0F7434B6-59B6-4250-999E-D168D6AE4293}" /f
reg delete "HKLM\Tmp_SOFTWARE\Classes\WOW6432Node\CLSID\{32665929-D77E-4ab5-8C08-FBF409B8A233}" /f
reg delete "HKLM\Tmp_SOFTWARE\Classes\WOW6432Node\CLSID\{926749fa-2615-4987-8845-c33e65f2b957}" /f
reg delete "HKLM\Tmp_SOFTWARE\Classes\WOW6432Node\CLSID\{C608E099-892D-4628-B6A2-97257B014E2E}" /f
reg delete "HKLM\Tmp_SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Publishers\{87d476fe-1a0f-4370-b785-60b028019693}" /f

call :run Windows\System32\shellstyle.dll
call :run Windows\Resources\Themes\aero\Shell\NormalColor\shellstyle.dll
goto :EOF

:run
set "shellstyle=%~1"
ResHacker.exe -open "%X%\%shellstyle%" -save "%S%\隐藏组织栏1.txt" -action extract -mask UIFILE,1, -log
for /f "delims=" %%i in (%S%\隐藏组织栏1.txt) do (
	set "content=%%i"
	echo !content!>>"%S%\隐藏组织栏2.txt"
	if "style resid="FolderBandStyle""=="!content:~1,-2!" (
		echo ^<Element padding="rect(0rp,0rp,0rp,-31rp)"/^> >>"%S%\隐藏组织栏2.txt"
		echo. >>"%S%\隐藏组织栏2.txt"
	)
)
ResHacker.exe -open "%X%\%shellstyle%" -save "%X%\%shellstyle%" -action addoverwrite -res "%S%\隐藏组织栏2.txt" -mask UIFILE,1, -log
del /q "%S%\隐藏组织栏1.txt"
del /q "%S%\隐藏组织栏2.txt"
goto :EOF
