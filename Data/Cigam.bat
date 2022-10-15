@echo off
if [%1]==[Login] goto :%1
mode con cols=80 lines=25
setlocal enabledelayedexpansion
fstoggle 1


set "Espace=        "
cls
for /l %%$ in (5,1,75) do set batbox=!batbox! /g %%$ 21 /a 179
color 07
echo.
echo.
echo !Espace!  ___________________________________________________________   
echo !Espace! /   _______    _______    _______    _________   __    __   \
echo !Espace!³   /       \  ³       ³  /       \  ³    _    ³ ³  \  /  ³   ³\
echo !Espace!³  ³    __   ³ ³__   __³ ³    __   ³ ³   ³ ³   ³ ³   \/   ³   ³³
echo !Espace!³  ³   /  \  ³    ³ ³    ³   /  \  ³ ³   ³ ³   ³ ³ ³\  /³ ³   ³³
echo !Espace!³  ³  ³    ³_³    ³ ³    ³  ³    ³_³ ³   ³_³   ³ ³ ³ \/ ³ ³   ³³
echo !Espace!³  ³  ³           ³ ³    ³  ³        ³    _    ³ ³ ³    ³ ³   ³³
echo !Espace!³  ³  ³     _     ³ ³    ³  ³  ____  ³   ³ ³   ³ ³ ³    ³ ³   ³³
echo !Espace!³  ³  ³    ³ ³    ³ ³    ³  ³  \   ³ ³   ³ ³   ³ ³ ³    ³ ³   ³³
echo !Espace!³  ³   \__/  ³  __³ ³__  ³   \__³  ³ ³   ³ ³   ³ ³ ³    ³ ³   ³³
echo !Espace!³  ³         ³ ³       ³ ³         ³ ³   ³ ³   ³ ³ ³    ³ ³   ³³
echo !Espace!³   \_______/  ³_______³  \_______/  ³___³ ³___³ ³_³    ³_³   ³³
echo !Espace! \___________________________________________________________/\³
echo !Espace!  \__________________________________________________________\/
echo.
echo.
batbox !batbox!
For /l %%$ in (5,1,75) do (
	call :SetX
	batbox /g %%$ 21 /c 0x07 /a 219 /w !x!
)
goto :Cigam

:SetX
set/a x=%random%%%250
goto:eof

:Cigam

cls
color 30

set Cigam_Logo=/c 0x34 /g 0 0 /a 219 /g -1 0 /a 219 /g -2 0 /a 219 /g -3 0 /a 219 /g -4 0 /a 219 /g -4 1 /a 219 /g -4 2 /a 219 /g -4 3 /a 219 /g -4 4 /a 219 /g -4 5 /a 219 /g -3 5 /a 219 /g -2 5 /a 219 /g -1 5 /a 219 /g 0 5 /a 219 /g 2 0 /a 219 /g 2 1 /a 219 /g 2 2 /a 219 /g 2 3 /a 219 /g 2 4 /a 219 /g 2 5 /a 219 /g 4 5 /a 219 /g 4 4 /a 219 /g 4 3 /a 219 /g 4 2 /a 219 /g 4 1 /a 219 /g 4 0 /a 219 /g 5 0 /a 219 /g 6 0 /a 219 /g 7 0 /a 219 /g 8 0 /a 219 /g 5 5 /a 219 /g 6 5 /a 219 /g 7 5 /a 219 /g 8 5 /a 219 /g 8 4 /a 219 /g 8 3 /a 219 /g 7 3 /a 219 /g 10 5 /a 219 /g 10 4 /a 219 /g 10 3 /a 219 /g 10 2 /a 219 /g 10 1 /a 219 /g 10 0 /a 219 /g 11 0 /a 219 /g 12 0 /a 219 /g 13 0 /a 219 /g 14 0 /a 219 /g 15 1 /a 219 /g 14 1 /a 219 /g 14 2 /a 219 /g 14 4 /a 219 /g 14 3 /a 219 /g 14 5 /a 219 /g 11 3 /a 219 /g 12 3 /a 219 /g 13 3 /a 219 /g 16 5 /a 219 /g 16 4 /a 219 /g 16 3 /a 219 /g 16 2 /a 219 /g 16 1 /a 219 /g 16 0 /a 219 /g 17 1 /a 219 /g 18 2 /a 219 /g 19 1 /a 219 /g 20 0 /a 219 /g 20 1 /a 219 /g 20 2 /a 219 /g 20 3 /a 219 /g 20 4 /a 219 /g 20 5 /a 219 /c 0x31 /g 1 1 /a 219 /g 1 0 /a 219 /g 1 -1 /a 219 /g 0 -1 /a 219 /g -1 -1 /a 219 /g -2 -1 /a 219 /g -3 -1 /a 219 /g -4 -1 /a 219 /g -5 -1 /a 219 /g -5 0 /a 219 /g -5 1 /a 219 /g -5 3 /a 219 /g -5 2 /a 219 /g -5 4 /a 219 /g -5 5 /a 219 /g -5 6 /a 219 /g -4 6 /a 219 /g -3 6 /a 219 /g -1 6 /a 219 /g 0 6 /a 219 /g 1 6 /a 219 /g -2 6 /a 219 /g 1 5 /a 219 /g 1 4 /a 219 /g 0 4 /a 219 /g -1 4 /a 219 /g -2 4 /a 219 /g -3 4 /a 219 /g -3 3 /a 219 /g -3 2 /a 219 /g -3 1 /a 219 /g -2 1 /a 219 /g 0 1 /a 219 /g -1 1 /a 219 /g 1 2 /a 219 /g 1 3 /a 219 /g 2 6 /a 219 /g 3 6 /a 219 /g 3 5 /a 219 /g 3 4 /a 219 /g 3 3 /a 219 /g 3 2 /a 219 /g 3 1 /a 219 /g 3 0 /a 219 /g 3 -1 /a 219 /g 2 -1 /a 219 /g 4 -1 /a 219 /g 5 -1 /a 219 /g 7 -1 /a 219 /g 8 -1 /a 219 /g 9 -1 /a 219 /g 9 0 /a 219 /g 9 1 /a 219 /g 8 1 /a 219 /g 7 1 /a 219 /g 7 1 /a 219 /g 6 1 /a 219 /g 5 1 /a 219 /g 6 -1 /a 219 /g 5 2 /a 219 /g 5 3 /a 219 /g 5 4 /a 219 /g 6 4 /a 219 /g 7 4 /a 219 /g 6 3 /a 219 /g 6 2 /a 219 /g 7 2 /a 219 /g 8 2 /a 219 /g 9 2 /a 219 /g 9 3 /a 219 /g 9 5 /a 219 /g 9 6 /a 219 /g 8 6 /a 219 /g 7 6 /a 219 /g 6 6 /a 219 /g 5 6 /a 219 /g 4 6 /a 219 /g 9 4 /a 219 /g 11 1 /a 219 /g 11 2 /a 219 /g 12 2 /a 219 /g 13 2 /a 219 /g 13 1 /a 219 /g 12 1 /a 219 /g 10 -1 /a 219 /g 11 -1 /a 219 /g 12 -1 /a 219 /g 13 -1 /a 219 /g 14 -1 /a 219 /g 14 -1 /a 219 /g 15 -1 /a 219 /g 15 0 /a 219 /g 15 0 /a 219 /g 15 1 /a 219 /g 15 2 /a 219 /g 15 3 /a 219 /g 15 4 /a 219 /g 15 5 /a 219 /g 15 6 /a 219 /g 14 6 /a 219 /g 13 6 /a 219 /g 12 5 /a 219 /g 13 5 /a 219 /g 13 4 /a 219 /g 12 4 /a 219 /g 11 4 /a 219 /g 11 5 /a 219 /g 11 6 /a 219 /g 10 6 /a 219 /g 16 6 /a 219 /g 18 6 /a 219 /g 17 6 /a 219 /g 17 5 /a 219 /g 17 4 /a 219 /g 17 3 /a 219 /g 17 3 /a 219 /g 17 2 /a 219 /g 18 3 /a 219 /g 19 2 /a 219 /c 0x33 /g 12 5 /a 219 /g 18 6 /a 219 /c 0x31 /g 19 3 /a 219 /g 19 4 /a 219 /g 19 6 /a 219 /g 19 5 /a 219 /g 20 6 /a 219 /g 21 6 /a 219 /g 21 5 /a 219 /g 21 4 /a 219 /g 21 3 /a 219 /g 21 2 /a 219 /g 21 1 /a 219 /g 21 0 /a 219 /g 21 -1 /a 219 /g 20 -1 /a 219 /g 19 0 /a 219 /g 18 1 /a 219 /g 17 0 /a 219 /g 16 -1 /a 219 /g 18 6 /a 219 /g 18 5 /a 219 /g 18 4 /a 219 /g 12 6 /a 219 /g 12 5 /a 219 /g 18 0 /a 219 /g 17 -1 /a 219 /g 18 -1 /a 219 /g 19 -1 /a 219 /g -2 2 /a 219 /g -2 3 /a 219 /g -1 3 /a 219 /g 0 3 /a 219 /g 0 2 /a 219 /g -1 2 /a 219 /g 22 -1 /a 219 /g 23 -1 /a 219 /g 24 -1 /a 219 /g 22 0 /a 219 /g 23 0 /a 219 /g 22 1 /a 219 /g 22 6 /a 219 /g 23 6 /a 219 /g 24 6 /a 219 /g 22 5 /a 219 /g 23 5 /a 219 /g 22 4 /a 219 /g -6 -1 /a 219 /g -7 -1 /a 219 /g -8 -1 /a 219 /g -8 0 /a 219 /g -7 0 /a 219 /g -6 0 /a 219 /c 0x33 /g -8 0 /a 219 /c 0x31 /g -6 1 /a 219 /g -6 5 /a 219 /g -6 6 /a 219 /g -7 6 /a 219 /g -6 4 /a 219 /g -7 5 /a 219 /g -8 6 /a 219 /c 0x37 /g 24 0 /a 219 /g 23 1 /a 219 /g 22 2 /a 219 /g 25 -1 /a 219 /g 25 6 /a 219 /g 25 7 /a 219 /g 24 7 /a 219 /g 23 7 /a 219 /g 22 7 /a 219 /g 21 7 /a 219 /g 20 7 /a 219 /g 19 7 /a 219 /g 18 7 /a 219 /g 16 7 /a 219 /g 17 7 /a 219 /g 15 7 /a 219 /g 13 7 /a 219 /g 13 7 /a 219 /g 11 7 /a 219 /g 10 7 /a 219 /g 8 7 /a 219 /g 8 7 /a 219 /g 6 7 /a 219 /g 5 7 /a 219 /g 4 7 /a 219 /g 2 7 /a 219 /g 0 7 /a 219 /g -1 7 /a 219 /g -3 7 /a 219 /g -5 7 /a 219 /g -6 7 /a 219 /g -8 7 /a 219 /g -9 7 /a 219 /g -7 7 /a 219 /g -4 7 /a 219 /g -2 7 /a 219 /g 1 7 /a 219 /g 3 7 /a 219 /g 7 7 /a 219 /g 9 7 /a 219 /g 12 7 /a 219 /g 14 7 /a 219 /g -9 6 /a 219 /g -6 2 /a 219 /g -7 1 /a 219 /g -8 0 /a 219 /g -9 -1 /a 219 /c 0x31 /g 8 7 /a 219 /g 9 7 /a 219 /g 7 7 /a 219 /g 10 7 /a 219 /g 11 7 /a 219 /c 0x71 /g 9 7 /a 177 /g 7 7 /a 177 /g 11 7 /a 177
set OS=/c 0x34 /g 0 0 /a 219 /g 0 1 /a 219 /g 0 2 /a 219 /g 1 0 /a 219 /g 1 3 /a 219 /g 2 3 /a 219 /g 2 2 /a 219 /g 2 1 /a 219 /g 5 1 /a 219 /g 5 0 /a 219 /g 6 0 /a 219 /g 6 2 /a 219 /g 6 3 /a 219 /g 5 3 /a 219
set Cross_1=/c 0xf3 /g 0 0 /a 219 /c 0xfb /g 0 1 /a 219 /g 1 1 /a 219 /g 1 0 /a 219 /g 2 1 /a 219 /g 1 2 /a 219 /c 0xf3 /g 0 2 /a 219 /g 2 2 /a 219 /g 2 0 /a 219
set Cross_2=/c 0xfb /g 0 0 /a 219 /g 1 1 /a 219 /g 2 0 /a 219 /g 2 2 /a 219 /g 0 2 /a 219 /c 0xf3 /g 0 1 /a 219 /g 1 2 /a 219 /g 2 1 /a 219 /g 1 0 /a 219
set Cross=1
set Load_1=" LOADING   "
set Load_2="           "
set Bar=/c 0xf3 /g 0 0 /a 219 /g 4 0 /a 219 /c 0x9b /g 1 0 /a 186 /g 2 0 /a 186 /g 3 0 /a 186
set BarX=32
set BarOp=+
batbox /o 31 4 %Cigam_Logo%
batbox /o 37 13 %OS%
call Cadre 30 18 21 2

For /l %%$ in (0,1,150) do (
Batbox /o !BarX! 19 !Bar!
Set/a BarX!BarOp!=1
if !BarX!==46 set BarOp=-
if !BarX!==32 set BarOp=+
batbox /w 20
)



if not exist "User\CigamAccount.txt" call NewProfile



:Login
Cls
color 30
call Windows 25 3 30 11 80 78 Login
batbox /g 26 7 /c 0x70 /d "USERNAME"
call Cadre 35 6 18 2 70
batbox /g 26 10 /c 0x70 /d "PASSWORD"
call Cadre 35 9 18 2 70
set UserName_=
set HiddenPass=
set Password=
:LogStr

batbox /g 36 7 /c 0x70 /d "%UserName_%"

batbox /g 36 10 /c 0x70 /d "%HiddenPass%"



batbox /g 26 13 /c 0x80 /d "             OK             "

:GetFor

FOR /F "tokens=1,2 delims=:" %%A in ('BatBox /m') DO (
	SET y=%%B
	SET x=%%A
)

if %x% geq 35 if %x% leq 54 (
	if %y%==7 (
		batbox /g 36 7 /c 0x77 /d "%UserName_%"
		batbox /g 36 7 /c 0x73
		set/p UserName_=
		goto :LogStr
	)
	if %y%==10 (
		call :PassWord
		goto :LogStr
	)
)

if %y%==13 if %x% geq 26 if %x% leq 54 (
	if exist "User\!userName_!\Data" (
		FOR /F "delims=" %%a IN (User\!userName_!\Data) do set %%a
		set/p Password=<TemPassFile
		if "%Password%"=="!PassW!" goto :Connect
		call ErrorMsg Username or password incorrect
		call Windows 25 3 30 11 80 78 Login
		batbox /g 26 7 /c 0x70 /d "USERNAME"
		call Cadre 35 6 18 2 70
		batbox /g 26 10 /c 0x70 /d "PASSWORD"
		call Cadre 35 9 18 2 70
	) else (
		Call ErrorMsg Username or password incorrect
		call Windows 25 3 30 11 80 78 Login
		batbox /g 26 7 /c 0x70 /d "USERNAME"
		call Cadre 35 6 18 2 70
		batbox /g 26 10 /c 0x70 /d "PASSWORD"
		call Cadre 35 9 18 2 70
	)
)

goto :LogStr


:PassWord
if exist TemPassFile del/q TemPassFile
batbox /c 0x73 /g 36 10
:PassLoop
batbox /g 36 10 /c 0x73 /d "%HiddenPass%"
batbox /k
set x=%errorlevel%
if %x%==13 goto:eof
if %x%==8 if not "%HiddenPass%"=="" ( call :Del&goto :PassLoop ) else ( goto :PassLoop )
call VarCnt %Hiddenpass%
batbox /a %x% >>log&del/q log
if not %return%==18 batbox /a %x% >>TemPassFile&set/p Password=<TemPassFile&set HiddenPass=%HiddenPass%*
goto :PassLoop
:Del
batbox /g 36 10 /c 0x77 /d "%HiddenPass%"
if exist TemPassFile set/p Password=<TemPassFile
call VarCnt %HiddenPass%
set /a Wmc=%return%-1
set Password=!Password:~0,%Wmc%!
if exist TemPassFile del/q TemPassFile
if not "%Password%"=="" set/p=%Password%< nul >>TemPassFile
set HiddenPass=!HiddenPass:~0,%Wmc%!
batbox /g 36 10 /c 0x73 /d "%HiddenPass%"
goto:eof
:Connect
cls
color 30

call Windows 20 7 43 3 80 78 Login

batbox /g 21 9 /c 0x70 /d "Loading your personal settings ...   1/5" /w 1500
batbox /g 21 9 /c 0x70 /d "Loading your personal settings ...   2/5" /w 1000
batbox /g 21 9 /c 0x70 /d "Loading your personal settings ...   3/5" /w 700
batbox /g 21 9 /c 0x70 /d "Loading your personal settings ...   4/5" /w 1800
batbox /g 21 9 /c 0x70 /d "Loading your personal settings ...   5/5" /w 800


cls
color 30
set ProgPath=User\%UserN%\Programs
if not exist User\%UserN%\Desktop (
	(
	echo Computer,Calculator,MusicPlayer,Empty
	)>>User\%UserN%\Desktop
)
if not exist User\%UserN%\Programs\*.* (
	md !ProgPath!
	(
	echo ProgramName=Computer
	echo ProgramIco=/c 0x37 /g 0 0 /a 219 /g 1 0 /a 219 /g 2 0 /a 219 /g 3 0 /a 219 /g 4 0 /a 219 /g 5 0 /a 219 /g 6 0 /a 219 /g 7 0 /a 219 /g 0 1 /a 219 /g 0 2 /a 219 /g 0 3 /a 219 /g 0 4 /a 219 /g 0 5 /a 219 /g 1 5 /a 219 /g 2 5 /a 219 /g 4 5 /a 219 /g 5 5 /a 219 /g 7 5 /a 219 /g 7 4 /a 219 /g 7 3 /a 219 /g 7 1 /a 219 /g 7 2 /a 219 /g 6 5 /a 219 /g 3 5 /a 219 /c 0x30 /g 2 4 /a 219 /g 4 4 /a 219 /g 5 4 /a 219 /g 6 4 /a 219 /g 6 3 /a 219 /g 6 2 /a 219 /g 6 1 /a 219 /g 5 1 /a 219 /g 4 1 /a 219 /g 3 1 /a 219 /g 1 1 /a 219 /g 2 1 /a 219 /g 1 2 /a 219 /g 1 3 /a 219 /g 1 4 /a 219 /g 3 4 /a 219 /g 4 5 /a 219 /g 3 5 /a 219 /c 0x70 /g 1 5 /a 205 /g 2 5 /a 205 /g 5 5 /a 205 /g 6 5 /a 205 /c 0x79 /g 5 2 /a 219 /g 5 3 /a 219 /g 4 2 /a 219 /g 4 3 /a 219 /g 3 2 /a 219 /g 3 3 /a 219 /c 0x71 /g 2 2 /a 219 /g 2 3 /a 219
	echo ProgramPath=AllPrograms\Computer
	)>>!ProgPath!\Computer.ini
	(
	echo ProgramName=Calculator
	echo ProgramIco=/c 0x37 /g 0 0 /a 219 /g 1 0 /a 219 /g 3 0 /a 219 /g 2 0 /a 219 /g 4 0 /a 219 /g 5 0 /a 219 /g 6 0 /a 219 /g 7 0 /a 219 /g 0 1 /a 219 /g 0 2 /a 219 /g 0 3 /a 219 /g 0 4 /a 219 /g 0 5 /a 219 /g 0 5 /a 219 /g 2 5 /a 219 /g 1 5 /a 219 /g 3 5 /a 219 /g 4 5 /a 219 /g 5 5 /a 219 /g 6 5 /a 219 /g 7 5 /a 219 /g 7 4 /a 219 /g 7 3 /a 219 /g 7 2 /a 219 /g 7 1 /a 219 /g 6 2 /a 219 /g 6 3 /a 219 /g 6 4 /a 219 /g 4 2 /a 219 /g 4 3 /a 219 /g 4 4 /a 219 /g 2 2 /a 219 /g 2 3 /a 219 /g 2 4 /a 219 /c 0x3a /g 6 1 /a 219 /g 5 1 /a 219 /g 4 1 /a 219 /g 3 1 /a 219 /g 2 1 /a 219 /g 1 1 /a 219 /c 0x74 /g 1 4 /a 15 /g 1 3 /a 15 /g 1 2 /a 15 /g 3 2 /a 15 /g 3 3 /a 15 /g 3 4 /a 15 /g 5 4 /a 15 /g 5 3 /a 15 /g 5 2 /a 15
	echo ProgramPath=AllPrograms\Calculator
	)>>!ProgPath!\Calculator.ini
	(
	echo ProgramName=MusicPlayer
	echo ProgramIco=/c 0x37 /g 0 0 /a 219 /g 1 0 /a 219 /g 2 0 /a 219 /g 3 0 /a 219 /g 4 0 /a 219 /g 4 0 /a 219 /g 5 0 /a 219 /g 6 0 /a 219 /g 7 0 /a 219 /g 0 1 /a 219 /g 0 2 /a 219 /g 0 3 /a 219 /g 0 4 /a 219 /g 0 5 /a 219 /g 1 5 /a 219 /g 2 5 /a 219 /g 3 5 /a 219 /g 4 5 /a 219 /g 6 5 /a 219 /g 7 5 /a 219 /g 7 4 /a 219 /g 7 3 /a 219 /g 7 2 /a 219 /g 7 1 /a 219 /g 5 5 /a 219 /c 0x3d /g 1 3 /a 219 /g 2 3 /a 219 /g 2 2 /a 219 /g 2 1 /a 219 /g 3 1 /a 219 /g 4 1 /a 219 /g 5 1 /a 219 /g 5 2 /a 219 /g 5 3 /a 219 /g 5 4 /a 219 /g 4 4 /a 219 /c 0x37 /g 2 4 /a 219 /g 3 4 /a 219 /g 1 4 /a 219 /g 3 3 /a 219 /g 4 3 /a 219 /g 4 3 /a 219 /g 4 2 /a 219 /g 3 2 /a 219 /g 1 2 /a 219 /g 1 1 /a 219 /g 6 1 /a 219 /g 6 2 /a 219 /g 6 3 /a 219 /g 6 4 /a 219
	echo ProgramPath=AllPrograms\MusicPlayer
	)>>!ProgPath!\MusicPlayer.ini
	(
	echo ProgramName= Empty 
	echo ProgramIco=/c 0x37 /g 0 0 /a 219 /g 1 0 /a 219 /g 2 0 /a 219 /g 3 0 /a 219 /g 4 0 /a 219 /g 5 0 /a 219 /g 6 0 /a 219 /g 7 0 /a 219 /g 0 1 /a 219 /g 0 2 /a 219 /g 0 3 /a 219 /g 0 4 /a 219 /g 0 5 /a 219 /g 1 5 /a 219 /g 3 5 /a 219 /g 4 5 /a 219 /g 5 5 /a 219 /g 5 5 /a 219 /g 6 5 /a 219 /g 7 5 /a 219 /g 7 4 /a 219 /g 7 2 /a 219 /g 7 1 /a 219 /g 7 3 /a 219 /g 2 5 /a 219 /g 4 3 /a 219 /g 3 2 /a 219 /g 4 2 /a 219 /g 3 3 /a 219 /g 5 1 /a 219 /g 2 1 /a 219 /g 2 4 /a 219 /g 5 4 /a 219 /c 0x33 /g 2 4 /a 219 /g 5 4 /a 219 /g 5 1 /a 219 /g 2 1 /a 219
	echo ProgramPath=AllPrograms\Empty
	)>>!ProgPath!\Empty.ini
)


call Desktop %UserN%

goto :Login









