echo 卸载注册表
reg unload HKLM\Src_DEFAULT
reg unload HKLM\Src_DRIVERS
reg unload HKLM\Src_SOFTWARE
reg unload HKLM\Src_SYSTEM

reg unload HKLM\Tmp_DEFAULT
reg unload HKLM\Tmp_DRIVERS
reg unload HKLM\Tmp_SOFTWARE
reg unload HKLM\Tmp_SYSTEM

echo 压缩注册表
ru.exe -accepteula -h "%X%\Windows\System32\config\DRIVERS"
ru.exe -accepteula -h "%X%\Windows\System32\config\SOFTWARE"
ru.exe -accepteula -h "%X%\Windows\System32\config\SYSTEM"
