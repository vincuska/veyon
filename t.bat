@echo off
setlocal enabledelayedexpansion

for /f "tokens=1" %%A in ('arp -a ^| findstr /R "^[ ]*[0-9]"') do (
    set "ip=%%A"
    set "host="

    for /f "tokens=1* delims=: " %%B in ('nslookup %%A 2^>nul ^| findstr /I "Name"') do (
        for /f "tokens=* delims= " %%D in ("%%C") do set "host=%%D"
    )

    if defined host (
        echo !host! | findstr /I "-000" >nul
        if not errorlevel 1 (
            for /f "tokens=1 delims=-." %%E in ("!host!") do (
                set "first=%%E"
                set "room=!first:~3!"
                echo !ip! - !room!
            )
        )
    )
)


endlocal
