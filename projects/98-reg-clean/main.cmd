echo 清理注册表日志
for /f "delims=" %%i in ('dir "%X%\Windows\System32\config" /a:h /b') do (
	echo 删除 %%i
	del /f /q /a "%X%\Windows\System32\config\%%i"
)
