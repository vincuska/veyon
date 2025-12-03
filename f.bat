@echo off
mode 35, 25
title Parancssor
setlocal enabledelayedexpansion

set /p room=$ 
echo.

for /l %%i in (0,1,18) do (
    set "num=00%%i"
    set "num=!num:~-3!"
    set "host=BOT%room%-!num!.bot.local"

    set "found=0"

    for /f "delims=" %%A in ('nslookup !host! 2^>nul') do (
        echo %%A | findstr /c:"can't find" >nul
        if errorlevel 1 (
            for /f "tokens=2 delims=: " %%B in ('echo %%A ^| find "Address:"') do (
                set "ip=%%B"
                set "lastoctet=!ip:~-1!"

                if not "!lastoctet!"=="1" (
                    echo !host! - %%B
                    set "found=1"
                )
            )
        )
    )
)