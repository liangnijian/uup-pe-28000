echo 破解-安全删除硬件并弹出媒体
binmay.exe -U "%X%\Windows\System32\DeviceSetupManager.dll"  -s u:SystemSetupInProgress -r u:DisableDeviceSetupMgr
