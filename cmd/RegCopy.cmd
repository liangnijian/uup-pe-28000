set rcopt_subkey=/s
	if /i "x%~1"=="x/-s" (
	set rcopt_subkey=
	shift
)

set "param_key=%~1"
if "%param_key:~0,5%"=="HKLM\" set "param_key=%param_key:~5%"
set "src_key=HKLM\Src_%param_key%"
set "tmp_key=HKLM\Tmp_%param_key%"

echo RegCopy %*

if "x%~2"=="x" goto :FastCopy
set "find_key=%~2"
for /f "delims=" %%a in ('reg query "%src_key%" /f "%find_key%"') do call :AsteriskCopy "%%a"
goto :EOF

:FastCopy
reg copy "%src_key%" "%tmp_key%" %rcopt_subkey% /f
goto :EOF

:AsteriskCopy
set "found_key=%~1"
if "%found_key:~0,23%" neq "HKEY_LOCAL_MACHINE\Src_" goto :EOF
set "tmp_key=HKEY_LOCAL_MACHINE\Tmp_%found_key:~23%"
reg copy "%found_key%" "%tmp_key%" %rcopt_subkey% /f
goto :EOF
