call windows 4 4 70 15 80 0 Cigam - Cmd.exe
batbox /g 71 4 /c 0x78 /d " x "

batbox /g 5 5 /c 0x07 /d "MagicDos Cigam OS v1.0"
batbox /g 5 6 /c 0x07 /d "Copyright (c) MagicDos 2014"
call line 7 5 65 07
set LocalPath=AllPrograms\CMD
set path=%path%;%cd%\;%cd%\%LocalPath%\

set Exit=False
set CLScreen=
for /l %%$ in (1,1,68) do set CLScreen= !CLScreen!
set Line=8
:Str
set Command=
batbox /g 5 %Line% /c 0x07 /d "%cd%" /d ">"&set/p Command=
if "%Command%"=="" goto :NoCom

call :FirstWorld %Command%

if exist %LocalPath%\%World%.bat (
call %LocalPath%\%command%
) else (
set/a Line+=1
batbox /g 5 !Line! /c 0x07 /d "Command error"
set/a Line+=1
)

if %Exit%==True goto :End

:NoCom
set/a Line+=1
goto :Str

:FirstWorld

set Fw=%1
set Tmp=_
set x=0
set World=
:Loop
if "%Tmp%"=="" (
	goto:eof
)
set Tmp=!Fw:~%x%,1!
set World=%World%%Tmp%
set/a x+=1
goto :Loop

:End
set CallIco=True




