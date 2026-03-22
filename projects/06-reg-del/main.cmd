for /d %%a in ("%cd%\*") do (
	for %%b in ("%%a\*.reg") do (
		echo %%~nxa %%~nxb
		reg import "%%b"
	)
)
