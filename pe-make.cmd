@echo off
setlocal enabledelayedexpansion

title %~n0
cd /d "%~dp0"
set "PATH=%cd%\bin;%PATH%"
set "PATH=%cd%\cmd;%PATH%"

rem 提取wim
if exist "%cd%\sources\" rd /s /q "%cd%\sources"
for %%i in (%cd%\*.iso) do 7z.exe x "%%i" "sources\boot.wim" "sources\install.wim" -o"%cd%"

set roll=2
set wim=%cd%\sources\boot.wim
set installinfo=3
set install=%cd%\sources\install.wim

if exist "%cd%\storage" (rd /s /q "%cd%\storage")
md "%cd%\storage"
md "%cd%\storage\config"
md "%cd%\storage\X"
md "%cd%\storage\X\Program Files"
md "%cd%\storage\X\Program Files (x86)"
md "%cd%\storage\X\ProgramData"
md "%cd%\storage\X\Users"
md "%cd%\storage\X\Windows"

set "Z=%cd%"
set "S=%cd%\storage"
set "X=%cd%\storage\X"
set "C=%cd%\storage\config"

for /d %%i in (%cd%\projects\*) do (
	if exist "%%i\main.cmd" (
		echo.
		echo [94m执行 %%i\main.cmd [37m
		pushd "%%i"
		call "%%i\main.cmd"
		popd
	)
)

echo 清理文件
del /q "%cd%\bin\*.ini"
del /q "%cd%\bin\*.log"
rd /s /q "%cd%\storage"

echo 制作完成
