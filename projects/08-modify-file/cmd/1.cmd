rem Win8 要删除 ieframe.dll.mun

echo 精简 ieframe.dll
copy /y "%X%\Windows\System32\dmdskres2.dll" "%S%\ieframe.dll" >nul
ResHacker.exe -open "%X%\Windows\System32\ieframe.dll" -save "%S%\MANIFEST.bin" -action extract -mask MANIFEST,123, -log
ResHacker.exe -open "%X%\Windows\System32\ieframe.dll" -save "%S%\MUI.bin" -action extract -mask MUI,1, -log
ResHacker.exe -open "%X%\Windows\System32\ieframe.dll" -save "%S%\TYPELIB.bin" -action extract -mask TYPELIB,1, -log
ResHacker.exe -open "%X%\Windows\System32\ieframe.dll" -save "%S%\VERSIONINFO.res" -action extract -mask VERSIONINFO,1, -log
ResHacker.exe -open "%S%\ieframe.dll" -save "%S%\ieframe.dll" -action addoverwrite -res "%S%\MANIFEST.bin" -mask MANIFEST,123, -log
ResHacker.exe -open "%S%\ieframe.dll" -save "%S%\ieframe.dll" -action addoverwrite -res "%S%\MUI.bin" -mask MUI,1, -log
ResHacker.exe -open "%S%\ieframe.dll" -save "%S%\ieframe.dll" -action addoverwrite -res "%S%\TYPELIB.bin" -mask TYPELIB,1, -log
ResHacker.exe -open "%S%\ieframe.dll" -save "%S%\ieframe.dll" -action addoverwrite -res "%S%\VERSIONINFO.res" -mask VERSIONINFO,1, -log
copy /y "%S%\ieframe.dll" "%X%\Windows\System32\ieframe.dll" >nul
del /f /q /a "%S%\ieframe.dll"
del /f /q /a "%S%\MANIFEST.bin"
del /f /q /a "%S%\MUI.bin"
del /f /q /a "%S%\TYPELIB.bin"
del /f /q /a "%S%\VERSIONINFO.res"

echo 精简 ieframe.dll.mui
copy /y "%X%\Windows\System32\dmdskres2.dll" "%S%\ieframe.dll.mui" >nul
ResHacker.exe -open "%X%\Windows\System32\zh-CN\ieframe.dll.mui" -save "%S%\MUI.bin" -action extract -mask MUI,1, -log
ResHacker.exe -open "%X%\Windows\System32\zh-CN\ieframe.dll.mui" -save "%S%\VERSIONINFO.res" -action extract -mask VERSIONINFO,1, -log
ResHacker.exe -open "%S%\ieframe.dll.mui" -save "%S%\ieframe.dll.mui" -action addoverwrite -res "%S%\MUI.bin" -mask MUI,1, -log
ResHacker.exe -open "%S%\ieframe.dll.mui" -save "%S%\ieframe.dll.mui" -action addoverwrite -res "%S%\VERSIONINFO.res" -mask VERSIONINFO,1, -log
copy /y "%S%\ieframe.dll.mui" "%X%\Windows\System32\zh-CN\ieframe.dll.mui" >nul
del /f /q /a "%S%\ieframe.dll.mui"
del /f /q /a "%S%\MUI.bin"
del /f /q /a "%S%\VERSIONINFO.res"

echo 精简 ieframe.dll.mun
copy /y "%X%\Windows\System32\dmdskres2.dll" "%S%\ieframe.dll.mun" >nul
ResHacker.exe -open "%X%\Windows\SystemResources\ieframe.dll.mun" -save "%S%\MANIFEST.bin" -action extract -mask MANIFEST,123, -log
ResHacker.exe -open "%X%\Windows\SystemResources\ieframe.dll.mun" -save "%S%\MUI.bin" -action extract -mask MUI,1, -log
ResHacker.exe -open "%X%\Windows\SystemResources\ieframe.dll.mun" -save "%S%\TYPELIB.bin" -action extract -mask TYPELIB,1, -log
ResHacker.exe -open "%X%\Windows\SystemResources\ieframe.dll.mun" -save "%S%\VERSIONINFO.res" -action extract -mask VERSIONINFO,1, -log
ResHacker.exe -open "%S%\ieframe.dll.mun" -save "%S%\ieframe.dll.mun" -action addoverwrite -res "%S%\MANIFEST.bin" -mask MANIFEST,123, -log
ResHacker.exe -open "%S%\ieframe.dll.mun" -save "%S%\ieframe.dll.mun" -action addoverwrite -res "%S%\MUI.bin" -mask MUI,1, -log
ResHacker.exe -open "%S%\ieframe.dll.mun" -save "%S%\ieframe.dll.mun" -action addoverwrite -res "%S%\TYPELIB.bin" -mask TYPELIB,1, -log
ResHacker.exe -open "%S%\ieframe.dll.mun" -save "%S%\ieframe.dll.mun" -action addoverwrite -res "%S%\VERSIONINFO.res" -mask VERSIONINFO,1, -log
copy /y "%S%\ieframe.dll.mun" "%X%\Windows\SystemResources\ieframe.dll.mun" >nul
del /f /q /a "%S%\ieframe.dll.mun"
del /f /q /a "%S%\MANIFEST.bin"
del /f /q /a "%S%\MUI.bin"
del /f /q /a "%S%\TYPELIB.bin"
del /f /q /a "%S%\VERSIONINFO.res"
