@echo off
call Windows 30 6 22 8 80 f8 Date/time settings
set CrossPos=49

batbox /g 32 8 /c 0xf0 /d "Time : %Time:~0,5%"
batbox /g 32 10 /c 0xf0 /d "Date : %Date%"



:GetFor

FOR /F "tokens=1,2,3 delims=:" %%A in ('BatBox /y') DO (
SET y=%%B
SET x=%%A
set clic=%%C
)
if %y% geq 23 call TaskBar&call Time 33

batbox /g 49 6 /c 0x47 /d " x "
if %y%==6 if %x% geq 49 if %x% leq 51 batbox /g 49 6 /c 0xcf /d " x "&if %Clic%==1 call :Crs&goto :End
batbox /g 39 12 /c 0x80 /d " OK "
if %y%==12 if %x% geq 39 if %x% leq 43 batbox /g 39 12 /c 0xb0 /d " OK "&if %Clic%==1 call :Ok&goto :End
goto :GetFor
:Ok
batbox /g 39 12 /c 0xb9 /d " OK " /w 100
goto:eof
:Crs
batbox /g 49 6 /c 0xc9 /d " x " /w 100
goto:eof
:End
set GumSpr=
for /l %%x in (0,1,22) do set "GumSpr= !GumSpr!"
for /l %%$ in (6,1,14) do batbox /c 0x30 /g 30 %%$ /d "%GumSpr%"


