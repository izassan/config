powershell -Command Start-Process ^
    -FilePath "cmd" ^
    -ArgumentList "/c","%~dp0\.bin\link.bat" ^
    -Verb runas
