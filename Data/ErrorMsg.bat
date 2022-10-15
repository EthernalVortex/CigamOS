Set Msg=%1

if not "%2"=="" set Msg=%Msg% %2
if not "%3"=="" set Msg=%Msg% %3
if not "%4"=="" set Msg=%Msg% %4
if not "%5"=="" set Msg=%Msg% %5
if not "%6"=="" set Msg=%Msg% %6
if not "%7"=="" set Msg=%Msg% %7
if not "%8"=="" set Msg=%Msg% %8
if not "%9"=="" set Msg=%Msg% %9
call VarCnt %Msg%
set/a Longer=%return%+2
set/a PosX=40-(%Longer%/2)
call Windows %PosX% 9 %Longer% 6 84 f8
set/a CrossPos=(%PosX%+%Longer%)-3
set /a CrossPos_=%CrossPos%+3
batbox /c 0x84 /g %PosX% 9 /d "[" /a 33 /d "] Error"
set/a Pos=%PosX%+1
batbox /g %Pos% 11 /c 0xf0 /d "%Msg%"
batbox /g 38 13 /c 0x80 /d " OK "
:GetFor
FOR /F "tokens=1,2,3 delims=:" %%A in ('BatBox /y') DO (
SET y=%%B
SET x=%%A
set clic=%%C
)
if %clic%==1 (
if %y%==13 if %x% geq 38 if %x% leq 42 (
	batbox /g 38 13 /c 0xb9 /d " OK " /w 100
	goto :Close
)
if %y%==9 if %x% Geq %CrossPos% if %x% Leq %CrossPos_% (
	batbox /c 0xc9 /g %CrossPos% 9 /d " x " /w 100
	goto :Close
)
)
set Clr=8
if %y%==13 if %x% geq 38 if %x% leq 42 set Clr=b
batbox /g 38 13 /c 0x%Clr%0 /d " OK "
set Clr=47
if %y%==9 if %x% Geq %CrossPos% if %x% Leq %CrossPos_% set Clr=cf
batbox /c 0x%Clr% /g %CrossPos% 9 /d " x "
goto :GetFor
:Close
for /l %%$ in (0,1,%Longer%) do set Wesh= !Wesh!
For /l %%$ in (9,1,15) do batbox /c 0x33 /g !PosX! %%$ /d "!Wesh!"







