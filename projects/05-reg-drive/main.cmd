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
		wimlib-imagex.exe extract "%install%" %installinfo% "\Windows\INF\%%b" --dest-dir="%X%\Windows\INF" --nullglob --no-acls>>nul 2>&1
		wimlib-imagex.exe extract "%install%" %installinfo% "\Windows\System32\DriverStore\FileRepository\%%b*" --dest-dir="%X%\Windows\System32\DriverStore\FileRepository" --nullglob --no-acls>>nul 2>&1
		wimlib-imagex.exe extract "%install%" %installinfo% "\Windows\System32\DriverStore\zh-CN\%%b*" --dest-dir="%X%\Windows\System32\DriverStore\zh-CN" --nullglob --no-acls>>nul 2>&1

		call RegCopy "HKLM\DRIVERS\DriverDatabase\DriverInfFiles\%%b">>nul 2>&1
		call RegCopy HKLM\DRIVERS\DriverDatabase\DriverPackages,%%b*>>nul 2>&1
		call RegCopy "HKLM\SYSTEM\DriverDatabase\DriverInfFiles\%%b">>nul 2>&1
		call RegCopy HKLM\SYSTEM\DriverDatabase\DriverPackages,%%b*>>nul 2>&1

		if "%%b"=="monitor.inf" call RegCopy "HKLM\DRIVERS\DriverDatabase\DeviceIds\Monitor">>nul 2>&1
		if not "%%b"=="monitor.inf" (
			for /f "delims=" %%c in ('reg query "HKLM\Src_DRIVERS\DriverDatabase\DeviceIds" /s /f "%%b" ^|findstr /i "DriverDatabase\DeviceIds"') do (
				set DRIVERS_N=%%c
				set DRIVERS_N=!DRIVERS_N:HKEY_LOCAL_MACHINE\Src_=HKLM\!
				call RegCopy "!DRIVERS_N!">>nul 2>&1
			)
		)
	)
)
