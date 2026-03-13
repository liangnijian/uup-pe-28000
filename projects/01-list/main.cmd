for %%a in ("%cd%\boot\*.txt") do (
	echo.
	echo 提取 boot 中的 %%~nxa 文件
	wimlib-imagex.exe extract "%wim%" %roll% @"%%a" --dest-dir="%X%" --nullglob --no-acls
)

for %%a in ("%cd%\install\*.txt") do (
	echo.
	echo 提取 install 中的 %%~nxa 文件
	wimlib-imagex.exe extract "%install%" %installinfo% @"%%a" --dest-dir="%X%" --nullglob --no-acls
)
