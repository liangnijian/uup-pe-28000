echo 清理 cat 文件
set "catclean=%X%\Windows\System32\CatRoot\{F750E6C3-38EE-11D1-85E5-00C04FC295EE}"
for /f "delims=" %%i in ('dir "%catclean%\*zh-CN*" /a /b') do del /f /q /a "%catclean%\%%i"

set catold=
for /f "delims=" %%a in ('dir "%catclean%" /a /b /o:-n') do (
	set catname=%%a
	for /f "tokens=4 delims=~" %%b in ("%%a") do (
		set catver=%%b
		set catver=!catver:~0,-4!
	)
	for %%c in (!catver!) do set catnex=!catname:%%c=*!
	if not "!catver!"=="" (
		if "!catnex!"=="!catold!" (
			echo 删除 %%a
			del /f /q /a "%catclean%\%%a"
		)
	)
	set catold=!catnex!
)
