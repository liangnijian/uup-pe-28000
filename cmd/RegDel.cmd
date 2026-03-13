set rcopt_subkey=
	if /i "x%~1"=="x/-s" (
	set rcopt_subkey=/va
	shift
)

set "param_key=%~1"
if "%param_key:~0,5%"=="HKLM\" set "param_key=%param_key:~5%"
set "tmp_key=HKLM\Tmp_%param_key%"

echo RegDel %*

if "x%~2"=="x" goto :FastDel
set "find_key=%~2"
for /f "delims=" %%a in ('reg query "%tmp_key%" /f "%find_key%"') do call :AsteriskDel "%%a"
goto :EOF

:FastDel
reg delete "%tmp_key%" %rcopt_subkey% /f
goto :EOF

:AsteriskDel
set "found_key=%~1"
if "%found_key:~0,23%" neq "HKEY_LOCAL_MACHINE\Tmp_" goto :EOF
set "tmp_key=HKEY_LOCAL_MACHINE\Tmp_%found_key:~23%"
reg delete "%found_key%" %rcopt_subkey% /f
goto :EOF
