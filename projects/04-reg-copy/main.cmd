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

echo 替换必要的注册表项目
regfind.exe -p HKEY_LOCAL_MACHINE\Tmp_SOFTWARE -y C:\ -y -r X:\ > nul 2>&1
regfind.exe -p HKEY_LOCAL_MACHINE\Tmp_SOFTWARE -y D:\ -y -r X:\ > nul 2>&1
regfind.exe -p HKEY_LOCAL_MACHINE\Tmp_SOFTWARE -y Interactive User -r > nul 2>&1
regfind.exe -p HKEY_LOCAL_MACHINE\Tmp_SOFTWARE -y  X:\$windows.~bt\ -r  X:\ > nul 2>&1
regfind.exe -p HKEY_LOCAL_MACHINE\Tmp_SYSTEM -y  X:\$windows.~bt\ -r  X:\ > nul 2>&1
