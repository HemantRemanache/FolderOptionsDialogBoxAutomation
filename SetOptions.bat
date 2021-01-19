set regPath="" 
for /f "tokens=*" %%s in (Intermediate.txt) do (
  set regPath=%%s
  GOTO :Test1
) 

:Test1
set myVariable=^"%regPath%^"

    REM Delete All View Settings
    REG delete "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags" /f
    REG delete "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\BagMRU" /f

    REM Set Default View To Detailed
    REG delete %myVariable% /f
    REG add %myVariable% /v LogicalViewMode /t REG_DWORD /d 0x00000001 /f


    REM Get Proper Distance From leftPane 
    REG delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Modules\GlobalSettings\Sizer" /f

    REG add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Modules\GlobalSettings\Sizer"
    REG add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Modules\GlobalSettings\Sizer" /v PageSpaceControlSizer /t REG_BINARY /d 9501000001000000 /f
	
    REM Setting the Window Location and size
    REG add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell" /v WinPos1366x768x96(1).bottom /t REG_DWORD /d 690 /f
    REG add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell" /v WinPos1366x768x96(1).left /t REG_DWORD /d 254 /f
    REG add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell" /v WinPos1366x768x96(1).right /t REG_DWORD /d 1369 /f
    REG add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell" /v WinPos1366x768x96(1).top /t REG_DWORD /d 5 /f

    REG add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell" /v MaxPos1366x768x96(1).x /t REG_DWORD /d 4294967295 /f
    REG add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell" /v MaxPos1366x768x96(1).y /t REG_DWORD /d 4294967295 /f
    REG add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell" /v MinPos1366x768x96(1).x /t REG_DWORD /d 4294967295 /f
    REG add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell" /v MinPos1366x768x96(1).y /t REG_DWORD /d 4294967295 /f

     REG add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell" /v HotKey /t REG_DWORD /d 0 /f
     REG add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell" /v ShowCmd /t REG_DWORD /d 1 /f
     REG add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell" /v WFlags /t REG_DWORD /d 0 /f


    REM Open File Explorer to "This PC"
    REG add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d 1 /f

    REM "Open folder in the same window"
    REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState" /v "Settings" /t REG_BINARY /d 0C0002000A01000060000000 /f

    REM "Show recently used files in Quick Access"  and "Show Frequently used Folders in Quick Access" 
    REG add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowRecent" /t REG_DWORD /d 0 /f
    REG add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowFrequent" /t REG_DWORD /d 0 /f

    REM "Always show icons, never thumbnails" option to be turned off 
    REG add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "IconsOnly" /t REG_DWORD /d 0 /f
    REM REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V IconsOnly /T REG_DWORD /D 0 /F
    
    REM "Always show menus " To be turned on always 
    REG add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AlwaysShowMenus" /t REG_DWORD /d 1 /f


   REM "Display File Size Information in folder tips"
   REG add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "FolderContentsInfoTip" /t  REG_DWORD /d 1 /f

   REM "Display Full Path in Title Bar"
   REG add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState" /v "FullPath" /t REG_DWORD /d 1 /f

   REM "Display Hidden Files and Folders"
   REG add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t REG_DWORD /d 1 /f

   REM "Hide Empty Drives"
   REG Add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideDrivesWithNoMedia" /t REG_DWORD /d 0 /f

   REM "Hide Extensions from known file types"
   REG Add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d 0 /f

   REM "Hide Folder merge conflicts"
   REG Add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideMergeConflicts" /t REG_DWORD /d 0 /f
	
   REM "Hide protected operating systems file"
   REG Add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSuperHidden" /t REG_DWORD /d 1 /f

   REM "launch folder windows in a separate process"
   REG Add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SeparateProcess" /t REG_DWORD /d 0 /f

   REM "Restore Previous folders at logon"
   REG Add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "PersistBrowsers" /t REG_DWORD /d 0 /f

   REM "Show encrypted or compressed NTFS files in color"
   REG Add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowEncryptCompressedColor" /t REG_DWORD /d 1 /f

   REM "Show popUp description for folder and desktop items
   REG Add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowInfoTip" /t REG_DWORD /d 1 /f

   REM "Show Preview handlers in preview pane"
   REG Add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowPreviewHandlers" /t REG_DWORD /d 1 /f

   REM "Show Status Bar"
   REG Add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowStatusBar" /t REG_DWORD /d 1 /f

   REM "Show Sync Provider Notifications"
   REG Add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSyncProviderNotifications" /t REG_DWORD /d 1 /f

   REM "Use Check Boxes to select Items"
   REG Add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AutoCheckSelect" /t REG_DWORD /d 0 /f

   REM "Use sharing Wizard"
   REG Add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SharingWizardOn" /t REG_DWORD /d 1 /f

   REM "Select the typed item in the window"
   REG Add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TypeAhead" /t REG_DWORD /d 0 /f

   REM "Always Show Availability Status"
   REG Add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "NavPaneShowAllCloudStates" /t REG_DWORD /d 0 /f

   REM "Expand to open Folder"
   REG Add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "NavPaneExpandToCurrentFolder" /t REG_DWORD /d 1 /f

   REM "Show All Folders."
   REG Add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "NavPaneShowAllFolders" /t REG_DWORD /d 1 /f

   REM "Show Drive Letter"
   REG Add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowDriveLettersFirst" /t REG_DWORD /d 0 /f

   REM Double click to open an Item
   REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V ShellState /T REG_BINARY /D 2400000037A8000000000000000000000000000001000000130000000000000042000000 /F


REM Restart Explorer.exe 
    REM taskkill /F /IM explorer.exe
    REM explorer.exe

    REM SHOW drive Letter ----Couldn't found
    REM SHOW libraries -- couldn't find 
    REM Open Each Folder in the Same Window   ---- STill doubtful
    REM REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState" /v "Settings" /t REG_BINARY /d 0C0002002A01000060000000 /f
    REM Default Value 0C0002000A01000060000000
    REM Display File Icon on thumbnails 
    REM https://answers.microsoft.com/en-us/windows/forum/windows_10-files-winpc/disable-windows-10-thumbnail-cache/ed8f5acf-861b-452d-b042-8f2ff8bb26d4
    
	




