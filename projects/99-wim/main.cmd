echo 打包 wim
wimlib-imagex.exe capture "%X%" "%Z%\boot.wim" "WindowsPE" --boot --compress=lzx --rebuild
