echo 右键删除-添加一个网络位置
ResHacker.exe -open "%X%\Windows\System32\zh-CN\shell32.dll.mui" -save "%X%\Windows\System32\zh-CN\shell32.dll.mui" -action delete -mask MENU,228, -log
