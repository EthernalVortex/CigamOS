set Title=%1
set "TextBox=%3 %4 %5 %6 %7 %8 %9"
set Gclr=%2

call VarCnt %TextBox%

set /a WinLarg=%return%+4

set/a WinPosX=40 - ( %WinLarg% / 2 )

call Windows %WinPosX% 5 %WinLarg% 6 80 70 %Title%

set/a TextPosX=%WinPosX%+2

set/a CrossPos=%WinLarg%+%WinPosX%-3
set/a CrossPosMax=%WinLarg%+%WinPosX%-1


batbox /g %TextPosX% 7 /c 0x70 /d "%TextBox%"

set Yes_NoClic=/g 0 0 /c 0xf0 /d "  Yes  " /c 0x70 /a 220 /g 1 1 /c 0x07 /a 220 /a 220 /a 220 /a 220 /a 220 /a 220 /a 220
set No_NoClic=/g 0 0 /c 0xf0 /d "  No   " /c 0x70 /a 220 /g 1 1 /c 0x07 /a 220 /a 220 /a 220 /a 220 /a 220 /a 220 /a 220
set Yes_YesClic=/g 0 0 /c 0x07 /a 219 /c 0xf0 /d "  Yes  " /g 1 1 /c 0x70 /d "       "
set No_YesClic=/g 0 0 /c 0x07 /a 219 /c 0xf0 /d "  No   " /g 1 1 /c 0x70 /d "       "
set Yes_Sel=/g 1 0  /d "  Yes  "
set No_Sel=/g 1 0  /d "  No   "

:Str
FOR /F "tokens=1,2,3 delims=:" %%A in ('BatBox /y') DO (
SET y=%%B
SET x=%%A
set clic=%%C
)


set Clr=47
if %y%==5 if %x% geq %CrossPos% if %x% leq %CrossPosMax% (
	set Clr=cf
	if %Clic%==1 (
		batbox /g %CrossPos% 5 /c 0xc9 /d " x " /w 150
		call :Gum
		set return=Cancel
		goto:eof
	)
)
batbox /g %CrossPos% 5 /c 0x%Clr% /d " x "

set Form=No
if %x% geq 32 if %x% leq 39 if %y%==9 (
	set Form=Yes
	if %Clic%==1 (
		batbox /o 32 9 /c 0xf0 %Yes_Sel% /w 25
		batbox /o 32 9 /c 0x0f %Yes_Sel% /w 25
		batbox /o 32 9 /c 0xf0 %Yes_Sel% /w 25
		batbox /o 32 9 /c 0x0f %Yes_Sel% /w 25
		batbox /o 32 9 /c 0xf0 %Yes_Sel% /w 25
		batbox /o 32 9 /c 0x0f %Yes_Sel% /w 25
		call :Gum
		set return=Y
		goto:eof
	)
)
batbox /o 32 9 !Yes_%Form%Clic!

set Form=No
if %x% geq 41 if %x% leq 48 if %y%==9 (
	set Form=Yes
	if %Clic%==1 (
		batbox /o 41 9 /c 0xf0 %No_Sel% /w 25
		batbox /o 41 9 /c 0x0f %No_Sel% /w 25
		batbox /o 41 9 /c 0xf0 %No_Sel% /w 25
		batbox /o 41 9 /c 0x0f %No_Sel% /w 25
		batbox /o 41 9 /c 0xf0 %No_Sel% /w 25
		batbox /o 41 9 /c 0x0f %No_Sel% /w 25
		call :Gum
		set return=N
		goto:eof
	)
)
batbox /o 41 9 !No_%Form%Clic!


goto:Str

:Gum
call Gum %Gclr% %WinPosX% 5 %WinLarg% 6
goto:eof






