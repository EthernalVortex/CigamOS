@echo off

:ndef
cls
echo.
set /p "_set=->> "
if not defined _set (goto:ndef)
for %%: in ("(=^(",")=^)") do (call set _set=%%_set:%%~:%%) 
for %%: in ("E = %%_set%%","WScript.Echo E") do >>_.Vbs (call echo.%%~:)
for /f "" %%: in ('cscript /nologo _.Vbs') do (call set _t=%%:)
echo.
if defined _t (call echo %%_t:,=.%%)>TempCalcResult
del _.vbs 2>nul


pause
goto :ndef