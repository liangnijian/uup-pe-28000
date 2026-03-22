echo 补充 StateRepository 服务
wimlib-imagex.exe extract "%install%" %installinfo% @"%cd%\StateRepositoryfile.txt" --dest-dir="%X%" --nullglob --no-acls
for /f "delims=" %%a in (%cd%\StateRepositoryreg.txt) do (call RegCopy "%%a")

rem 创建 AppRepository 文件夹
rem md %X%\ProgramData\Microsoft
rem md %X%\ProgramData\Microsoft\Windows
rem md %X%\ProgramData\Microsoft\Windows\AppRepository
