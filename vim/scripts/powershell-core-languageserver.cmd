@echo off
setlocal
set PSES_INSTALLED_PATH="%LOCALAPPDATA%\vim-lsp-settings\servers\powershell-languageserver"
set PSES_BUNDLE_PATH=%PSES_INSTALLED_PATH%
set SESSION_TEMP_PATH=%PSES_INSTALLED_PATH%\session
pwsh.exe -NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command "%PSES_BUNDLE_PATH: =` %\PowerShellEditorServices\Start-EditorServices.ps1" -BundledModulesPath '%PSES_BUNDLE_PATH%' -LogPath '%SESSION_TEMP_PATH%\logs.log' -SessionDetailsPath '%SESSION_TEMP_PATH%\session.json' -FeatureFlags @() -AdditionalModules @() -HostName 'My Client' -HostProfileId 'myclient' -HostVersion 1.0.0 -Stdio -LogLevel Normal

