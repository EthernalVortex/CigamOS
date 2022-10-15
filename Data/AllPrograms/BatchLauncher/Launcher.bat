call Windows 20 4 40 13 80 07 Cigam - BatchLauncher

Set File_To_Exe=%1

batbox /g 22 6 /c 0x0f /d "Batch file runner for CigamOS"

call Cadre 22 8 35 2 0f

batbox /g 23 9 /c 0x07 /d "%File_To_Exe%"
batbox /g 22 13 /c 0x8e /d "                RUN                 "


:GetFor
FOR /F "tokens=1,2,3 delims=:" %%A in ('BatBox /y') DO (
SET y=%%B
SET x=%%A
set clic=%%C
)

set Clr=47
if %x% geq 57 if %x% leq 59 if %y%==4 (
	set Clr=cf
	if %Clic%==1 (
		batbox /g 57 4 /c 0xcf /d " x " /w 50
		batbox /g 57 4 /c 0x47 /d " x " /w 50
		batbox /g 57 4 /c 0xcf /d " x " /w 50
		batbox /g 57 4 /c 0x47 /d " x " /w 50
		batbox /g 57 4 /c 0xcf /d " x " /w 50
		batbox /g 57 4 /c 0x47 /d " x " /w 50
		batbox /g 57 4 /c 0xcf /d " x " /w 50
		batbox /g 57 4 /c 0x47 /d " x " /w 50
		call Gum f 20 4 40 12
		goto:eof
	)
)
batbox /g 57 4 /c 0x%Clr% /d " x "

set Clr=8e
if %x% geq 22 if %x% leq 58 if %y%==13 (
	set Clr=76
	if %Clic%==1 (
		batbox /g 22 13 /c 0xf0 /d "                RUN                 " /w 100
		call :Run
		call Gum f 20 4 40 12
		goto:eof
	)
)
batbox /g 22 13 /c 0x%Clr% /d "                RUN                 "

set Clr=07

if %x% geq 23 if %x% leq 57 if %y%==9 (
	set Clr=f0
	if %Clic%==1 (
		batbox /g 23 9 /c 0x00 /d "%File_To_Exe%" /c 0x0f /g 23 9
		set/p TemPath=
		if not exist !TemPath! (
			call :Invalid
			goto :EndIf
		)
		echo '!TemPath:~-3!'
		if /i not "!TemPath:~-3!"=="bat" (
			call :Invalid
			goto :Endif
		)
		
		set File_To_Exe=!TemPath!
	)
)
:EndIf
batbox /g 23 9 /c 0x%Clr% /d "%File_To_Exe%"

goto :GetFor

:Invalid
batbox /g 22 11 /c 0x0c /d "Invalid file..." /w 2000
batbox /g 22 11 /c 0x00 /d "Invalid file..." /c 0x07
goto:eof


:Run
batbox /g 22 13 /c 0x00 /d "                RUN                 "

batbox /g 22 13 /c 0x07 /d "Verification..." /w 500

set Nbr=0
set Alert=False

for %%$ in (exit,cd) do (
	find /i "%%$" !File_To_Exe! > nul
	if !errorlevel!==0 set Alert=True
)


if %Alert%==True (
	batbox /g 22 13 /c 0x07 /d "Verification..." /c 0x0a /d "   OK" /w 500
	batbox /g 22 14 /c 0x07 /d "This file contain one or more "
	batbox /g 22 15 /c 0x07 /d "elements able to crash the system "
	call :YN
	batbox /a !errorlevel! /d "  ..." /w 150
	if "!return!"=="Y" (
		goto :RunOk
	)
) else (
	goto:RunOk
)



goto:eof

:YN
batbox /g 22 16 /c 0x0c /d "Run this file ? [Y/N] "

batbox /k
if %errorlevel%==121 set return=Y&goto:eof
if %errorlevel%==89 set return=Y&goto:eof
if %errorlevel%==110 set return=N&goto:eof
if %errorlevel%==78 set return=N&goto:eof

goto:YN



:RunOk
cls
color 07
echo Starting...
batbox /w 1500
cls

call %File_To_Exe%

cls
color 07
echo End...
batbox /w 1500

cls
color 30
call TaskBar
goto:eof

