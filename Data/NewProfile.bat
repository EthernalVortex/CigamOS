cls
color 30

call Windows 25 3 30 17 80 78 Create new account


set UserName_=
set HiddenPass=
set Password=
set HiddenPass_=
set Password_=

set AllValues=False
batbox /g 26 7 /c 0x70 /d "USERNAME"
call Cadre 35 6 18 2 70
batbox /g 26 10 /c 0x70 /d "PASSWORD"
call Cadre 35 9 18 2 70
batbox /g 26 13 /c 0x70 /d "CONFIRM "
call Cadre 35 12 18 2 70
:Str




batbox /g 36 7 /c 0x70 /d "%UserName_%"

batbox /g 36 10 /c 0x70 /d "%HiddenPass%"

batbox /g 36 13 /c 0x70 /d "%HiddenPass_%"


if not "%Password%"=="%Password_%" (
batbox /g 26 16 /c 0x74 /d "[" /a 33 /d "] Password are different "
) else (
batbox /g 26 16 /c 0x77 /d "                           "
)



if not "%UserName_%"=="" if not "%HiddenPass%"=="" if "%Password%"=="%Password_%" ( set AllValues=True ) else ( set AllValues=False )
set Clr_=7
if %AllValues%==True set Clr_=0
batbox /g 26 19 /c 0x8%Clr_% /d "           CREATE           "


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
	)
	if %y%==10 call :PassWord
	if %y%==13 call :Password_
)
if %AllValues%==True (
	if %y%==19 if %x% geq 26 if %x% leq 54 (
		batbox /g 26 19 /c 0xb9 /d "           CREATE           " /w 100
		goto :Create
	)
)

goto:Str




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
if not "%Password%"=="" set/p=%Password%<nul >>TemPassFile
set HiddenPass=!HiddenPass:~0,%Wmc%!
batbox /g 36 10 /c 0x73 /d "%HiddenPass%"
goto:eof

:Password_
if exist TemPassFile_ del/q TemPassFile_
batbox /c 0x73 /g 36 13
:PassLoop_
batbox /g 36 13 /c 0x73 /d "%HiddenPass_%"
batbox /k
set x=%errorlevel%
if %x%==13 goto:eof
if %x%==8 if not "%HiddenPass_%"=="" ( call :Del_&goto :PassLoop_ ) else ( goto :PassLoop_ )
call VarCnt %Hiddenpass%
batbox /a %x% >>log&del/q log
if not %return%==18 batbox /a %x% >>TemPassFile_&set/p Password_=<TemPassFile_&set HiddenPass_=%HiddenPass_%*
goto :PassLoop_
:Del_
batbox /g 36 13 /c 0x77 /d "%HiddenPass_%"
if exist TemPassFile_ set/p Password_=<TemPassFile_
call VarCnt %HiddenPass_%
set /a Wmc=%return%-1
set Password_=!Password_:~0,%Wmc%!
if exist TemPassFile_ del/q TemPassFile_
if not "%Password_%"=="" set/p=%Password_%<nul >>TemPassFile_
set HiddenPass_=!HiddenPass_:~0,%Wmc%!
batbox /g 36 13 /c 0x73 /d "%HiddenPass_%"
goto:eof


:FirstAcc
(
echo ------ CIGAM ACCOUNT LOG FILE ------
echo First account : %UserName_%
echo Created the   : %Date% at %time:~0,5%
echo ------------------------------------
) >>User\CigamAccount.txt


:Create
if not exist User\CigamAccount.txt call :FirstAcc

MD User\%UserName_%

(
echo UserN=%UserName_%
echo PassW=%Password%
)>>User\%UserName_%\Data

For %%$ in (TemPassFile_,TemPassFile) do if exist %%$ del/q %%$
cls
color 30













