@echo off

tzutil /s "China Standard Time"



if "%~1"=="uup" call uup-iso.cmd

if "%~1"=="pe" call pe-make.cmd
