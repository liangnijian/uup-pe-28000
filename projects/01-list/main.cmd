for %%i in ("%cd%\boot\*.txt") do (
	echo.
	echo 提取 boot\%%~nxi
	wimlib-imagex.exe extract "%wim%" %roll% @"%%i" --dest-dir="%X%" --nullglob --no-acls>nul
)

for %%i in ("%cd%\install\*.txt") do (
	echo.
	echo 提取 install\%%~nxi
	wimlib-imagex.exe extract "%install%" %installinfo% @"%%i" --dest-dir="%X%" --nullglob --no-acls>nul
)
