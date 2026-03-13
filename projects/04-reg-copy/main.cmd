echo 处理 Winners
reg delete HKEY_LOCAL_MACHINE\Tmp_SOFTWARE\Microsoft\Windows\CurrentVersion\SideBySide\Winners /f
for /f "delims=" %%i in (%cd%\Winners.txt) do (call RegCopy HKLM\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners,%%i)

for %%a in ("%cd%\SOFTWARE\*.txt") do (
	echo.
	echo 处理 SOFTWARE 中的 %%~nxa 文件
	for /f "delims=" %%b in (%%a) do (call RegCopy "%%b")
)

for %%a in ("%cd%\SYSTEM\*.txt") do (
	echo.
	echo 处理 SYSTEM 中的 %%~nxa 文件
	for /f "delims=" %%b in (%%a) do (call RegCopy "%%b")
)

echo 处理当前版本
call RegDel /-s "HKLM\Software\Microsoft\Windows NT\CurrentVersion"
call RegCopy /-s "HKLM\Software\Microsoft\Windows NT\CurrentVersion"
goto :EOF
