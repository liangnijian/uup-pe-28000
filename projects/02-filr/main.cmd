for %%a in ("%cd%\7z\*.7z") do (
	echo 解压 7z 中的 %%~nxa
	7z.exe  x "%%a" -y -o"%X%" >nul
)

echo.
echo 复制 PECMD
copy /y "%cd%\PECMD.EXE" "%X%\Windows\System32\PECMD.EXE"
if exist "%cd%\PECMD.INI" copy /y "%cd%\PECMD.INI" "%X%\Windows\PECMD.INI"
if exist "%cd%\PECMD-%zs%.INI" copy /y "%cd%\PECMD-%zs%.INI" "%X%\Windows\PECMD.INI"
