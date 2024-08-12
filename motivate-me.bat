
@echo off

:no-option
if "%1" == "" goto :just-do-it

:too-many-options
if "%2" == "" goto :select-gif
echo please select a single option
goto :help

:select-gif
if /i %1 == -m goto :just-do-it
if /i %1 == --motivate goto :just-do-it
if /i %1 == -s goto :cheering-baby
if /i %1 == --success goto :cheering-baby
if /i %1 == -f goto :falling-child
if /i %1 == --failure goto :falling-child
if /i %1 == -h goto :help
if /i %1 == --help goto :help
echo did not understand option %1
goto :help

:help
echo options:
echo    -m --motivate   just do it
echo    -s --success    cheering baby
echo    -f --failure    falling child
exit /b 

:just-do-it
echo calling just-do-it.gif...
start /max just-do-it.gif
timeout /t 2 /nobreak > NUL
goto :terminate

:cheering-baby
echo calling cheering-baby.gif...
start /max cheering-baby.gif
timeout /t 3 /nobreak > NUL
goto :terminate

:falling-child
echo calling falling-child.gif...
start /max falling-child.gif
timeout /t 5 /nobreak > NUL
goto :terminate

:terminate
taskkill /f /fi "ImageName eq Photo*" /fi "Status eq Running" 1>nul 2>&1
exit /b 
