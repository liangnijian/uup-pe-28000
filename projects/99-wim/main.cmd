echo 打包 wim
wimlib-imagex.exe capture "%X%" "%Z%\WinPE.wim" "WindowsPE" --boot --compress=lzx --rebuild
