@echo off
:: Remove autoplay settings for all drives
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers\UserChosenExecuteHandlers" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers\EventHandlersDefaultSelection" /f

:: Restore default behavior
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers" /v DisableAutoplay /t REG_DWORD /d 0 /f

:: Optional: Refresh Explorer to apply changes immediately
taskkill /f /im explorer.exe
start explorer.exe

echo Autoplay settings have been reset to default. Windows will ask what to do with new removable USB drives.
pause
