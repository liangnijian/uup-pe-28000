@echo off

tzutil /s "China Standard Time"

for /f %%i in ('powershell -command "& { $today=Get-Date; $firstOfMonth=Get-Date -Year $today.Year -Month $today.Month -Day 1; $firstWednesday=$firstOfMonth; while ($firstWednesday.DayOfWeek -ne 'Wednesday') { $firstWednesday=$firstWednesday.AddDays(1) }; $secondWednesday=$firstWednesday.AddDays(7); $today.Date -eq $secondWednesday.Date }"') do set "result=%%i"
if "%result%"=="False" (
	echo 不是本月的第二个星期三
	exit /b 1
)

if "%~1"=="uup" call uup-iso.cmd

if "%~1"=="pe" call pe-make.cmd
