echo 处理 Winners
reg delete HKEY_LOCAL_MACHINE\Tmp_SOFTWARE\Microsoft\Windows\CurrentVersion\SideBySide\Winners /f
for /f "delims=" %%i in (%cd%\Winners.txt) do (call RegCopy HKLM\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners,%%i)

echo 复制必要的注册表
for /d %%a in ("%cd%\*") do (
	for %%b in ("%%a\*.txt") do (
		echo 复制 %%~nxa\%%~nxb
		for /f "delims=" %%c in (%%b) do (call RegCopy "%%c")
		echo.
	)
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
