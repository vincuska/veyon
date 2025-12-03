@echo off
mode 25, 3
title Parancssor
setlocal enabledelayedexpansion

set "EXE=C:\Program Files\Veyon\veyon-cli.exe"

:loop
set /p ip=10.10.2.
"%EXE%" remoteaccess view 10.10.2.!ip!
goto loop