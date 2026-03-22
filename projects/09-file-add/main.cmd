for /d %%a in ("%cd%\cmd\*") do (
	if exist "%%a\main.cmd" (
		echo.
		echo [93m[执行][37m \%%~nxa\main.cmd
		pushd "%%a"
		call "%%a\main.cmd"
		popd
	)
)
