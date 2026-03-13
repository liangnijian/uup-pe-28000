for %%a in ("%cd%\DEFAULT\*.reg") do (
	echo DEFAULT %%~nxa
	reg import "%%a"
)

for %%a in ("%cd%\SOFTWARE\*.reg") do (
	echo SOFTWARE %%~nxa
	reg import "%%a"
)

for %%a in ("%cd%\SYSTEM\*.reg") do (
	echo SYSTEM %%~nxa
	reg import "%%a"
)
