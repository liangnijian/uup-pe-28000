call :start "Windows\System32" "Windows\System32\zh-CN" "mui"
call :start "Windows\System32" "Windows\SystemResources" "mun"
call :start "Windows\SysWOW64" "Windows\SysWOW64\zh-CN" "mui"
goto :EOF

:start
set source=%~1
set target=%~2
set suffix=%~3

if not exist "%X%\%target%" goto :EOF

echo.
md "%S%\supplement"
wimlib-imagex.exe extract "%install%" %installinfo% "\%target%" --dest-dir="%S%\supplement" --nullglob --no-acls

for %%i in (%target%) do set catalogue=%%~nxi
for /f "delims=" %%i in ('dir "%X%\%source%" /a:-d /b') do (
	set target-file=%%i.%suffix%
	if not exist "%X%\%target%\!target-file!" (
		if exist "%S%\supplement\%catalogue%\!target-file!" (
			echo 补全 %target%\!target-file!
			copy /y "%S%\supplement\%catalogue%\!target-file!" "%X%\%target%\!target-file!" >>nul
		)
	)
)
rd /s /q "%S%\supplement"

echo.
for /f "delims=" %%a in ('dir "%X%\%target%" /a:-d /b') do (
	set pass=0
	if exist "%X%\%source%\%%~nxa" set pass=1
	if exist "%X%\%source%\%%~na" set pass=1
	if "!pass!"=="0" (
		echo 清理 %target%\%%a
		del /f /q /a "%X%\%target%\%%a"
	)
)
goto :EOF
