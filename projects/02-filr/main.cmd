for %%a in ("%cd%\7z\*.7z") do (
	echo 解压 %%~nxa
	7z.exe  x "%%a" -y -o"%X%" >nul
)

echo.
echo 复制 PECMD
copy /y "%cd%\PECMD.EXE" "%X%\Windows\System32\PECMD.EXE"
copy /y "%cd%\PECMD.INI" "%X%\Windows\PECMD.INI"
