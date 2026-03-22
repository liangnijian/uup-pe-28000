echo 删除不需要的 inf 注册表
wimlib-imagex.exe extract "%wim%" %roll% "\Windows\INF" --dest-dir="%S%" --nullglob --no-acls
for /f "delims=" %%a in ('dir "%S%\INF\*.inf" /a /b') do (
	if not exist "%X%\Windows\INF\%%a" (
		echo 删除 %%a
		call RegDel "HKLM\DRIVERS\DriverDatabase\DriverInfFiles\%%a">>nul 2>&1
		call RegDel HKLM\DRIVERS\DriverDatabase\DriverPackages,%%a*>>nul 2>&1
		call RegDel "HKLM\SYSTEM\DriverDatabase\DriverInfFiles\%%a">>nul 2>&1
		call RegDel HKLM\SYSTEM\DriverDatabase\DriverPackages,%%a*>>nul 2>&1
	)
)

for %%a in ("%cd%\inf\*.txt") do (
	echo.
	echo 处理 %%~nxa
	for /f "delims=" %%b in (%%a) do (
		echo 复制 %%b
		call :DriverDatabase "%%b">>nul 2>&1
	)
)
goto :EOF

:DriverDatabase
set ddf=%~1
wimlib-imagex.exe extract "%install%" %installinfo% "\Windows\INF\%ddf%" --dest-dir="%X%\Windows\INF" --nullglob --no-acls
wimlib-imagex.exe extract "%install%" %installinfo% "\Windows\System32\DriverStore\FileRepository\%ddf%*" --dest-dir="%X%\Windows\System32\DriverStore\FileRepository" --nullglob --no-acls
wimlib-imagex.exe extract "%install%" %installinfo% "\Windows\System32\DriverStore\zh-CN\%ddf%*" --dest-dir="%X%\Windows\System32\DriverStore\zh-CN" --nullglob --no-acls

for %%c in (%ddf%) do wimlib-imagex.exe extract "%install%" %installinfo% "\Windows\System32\drivers\%%~nc.sys" --dest-dir="%X%\Windows\System32\drivers" --nullglob --no-acls

call RegCopy "HKLM\DRIVERS\DriverDatabase\DriverInfFiles\%ddf%"
call RegCopy HKLM\DRIVERS\DriverDatabase\DriverPackages,%ddf%*
call RegCopy "HKLM\SYSTEM\DriverDatabase\DriverInfFiles\%ddf%"
call RegCopy HKLM\SYSTEM\DriverDatabase\DriverPackages,%ddf%*

if "%ddf%"=="monitor.inf" call RegCopy "HKLM\DRIVERS\DriverDatabase\DeviceIds\Monitor"
if not "%ddf%"=="monitor.inf" (
	for /f "delims=" %%c in ('reg query "HKLM\Src_DRIVERS\DriverDatabase\DeviceIds" /s /f "%ddf%" ^|findstr /i "DriverDatabase\DeviceIds"') do (
		set DRIVERS_N=%%c
		set DRIVERS_N=!DRIVERS_N:HKEY_LOCAL_MACHINE\Src_=HKLM\!
		call RegCopy "!DRIVERS_N!">>nul 2>&1
	)
)
goto :EOF
