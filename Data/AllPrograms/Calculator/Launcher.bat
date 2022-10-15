:: TITLE
::------------------
::
::
::
::------------------
::
:: [9] [8] [7]   [+]
:: 
:: [6] [5] [4]   [-]
::
:: [3] [2] [1]   [*]
:: 
::     [0]       [/]
::
:: [       =       ]
::
:: 17 lines 18 Col
call Windows 10 3 18 17 80 18 Calculator v1.0
set VarCalc=0.00
call :Screen
set x_=11
set y_=10
for /l %%$ in (9,-1,1) do (
	set Button_%%$_Emp_X=!x_!
	set Button_%%$_Emp_Y=!y_!
	if !x_!==17 (
		set/a y_+=2
		set x_=8
	)
	set/a x_+=3
)
set Button_0_Emp_X=14
set Button_0_Emp_Y=16
set Button_+_Emp_X=21
set Button_+_Emp_Y=10
set Button_-_Emp_X=24
set Button_-_Emp_Y=10
set Button_x_Emp_X=21
set Button_x_Emp_Y=12
set Button_/_Emp_X=24
set Button_/_Emp_Y=12
set Button_Pl_Emp_X=21
set Button_Pl_Emp_Y=14
set Button_Pr_Emp_X=24
set Button_Pr_Emp_Y=14
set Button_._Emp_X=21
set Button_._Emp_Y=16
set Button_AC_Emp_X=23
set Button_AC_Emp_Y=16
batbox /g 11 18 /c 0x8f /d "       =        "
for %%$ in (+,-,x,/,.) do (
	set WeshMorray=/d "%%$"
	if "%%$"=="x" set WeshMorray=/d "*"
	batbox /c 0x8f /g !Button_%%$_Emp_X! !Button_%%$_Emp_Y! !WeshMorray!
)
for /l %%$ in (0,1,9) do (
	batbox /c 0x8f /g !Button_%%$_Emp_X! !Button_%%$_Emp_Y! /d "%%$"
)
:CalcStr

FOR /F "tokens=1,2,3 delims=:" %%A in ('BatBox /y') DO (
SET y=%%B
SET x=%%A
set clic=%%C
)


set Clr=4f
if %y%==3 if %x% geq 25 if %x% leq 27 (
	set Clr=cf
	if !Clic!==1 (
		batbox /g 25 3 /c 0xc9 /d " x " /w 150
		For /l %%$ in (3,1,20) do batbox /c 0x30 /g 10 %%$ /d "                  "
		Set CallIco=True
		Goto :End
	)
)
batbox /g 25 3 /c 0x%Clr% /d " x "
if %y% geq 20 (
	call TaskBar
) else (
	call Time 33
	batbox /g 0 22 /c 0x8f /d "            " /g 0 23 /c 0x8f /d " S T A R T  " /g 0 24 /c 0x8f /d "            "
)
if %Callico%==True (
		call Windows 10 3 18 17 80 1 Calculator v1.0
		call :Screen
		set CallIco=False
	)
for /l %%$ in (0,1,9) do (
	set Clr=8f 
	if %x%==!Button_%%$_Emp_X! if %y%==!Button_%%$_Emp_Y! (
		set Clr=b0
		if !Clic!==1 (
			batbox /c 0xe9 /g !Button_%%$_Emp_X! !Button_%%$_Emp_Y! /d "%%$" /w 150
			if !VarCalc!==0.00 (
			set VarCalc=%%$
			) else (
				set VarCalc=!VarCalc!%%$
			)
			call :Screen
		)
	)
	batbox /c 0x!Clr! /g !Button_%%$_Emp_X! !Button_%%$_Emp_Y! /d "%%$"
)
for %%$ in (+,-,x,/,.,Pl,Pr) do (
	set Clr=8f
	set WeshMorray=/d "%%$"
	set Char=%%$
	if "%%$"=="x" set WeshMorray=/d "*"&set "Char=*"
	if "%%$"=="Pl" set WeshMorray=/d "("&set "Char=("
	if "%%$"=="Pr" set WeshMorray=/d ")"&set "Char=)"
	if %x%==!Button_%%$_Emp_X! if %y%==!Button_%%$_Emp_Y! (
		set Clr=b0
		if !Clic!==1 (
			batbox /c 0xe9 /g !Button_%%$_Emp_X! !Button_%%$_Emp_Y! !WeshMorray! /w 150
			if !VarCalc!==0.00 (
				set VarCalc=!Char!
			) else (
				set VarCalc=!varCalc!!Char!
			)
			call :Screen
		)
	)
	batbox /c 0x!Clr! /g !Button_%%$_Emp_X! !Button_%%$_Emp_Y! !WeshMorray!
)
set Clr=8f
if %y%==18 if %x% geq 11 if %x% leq 27 (
	set Clr=b0
	if !Clic!==1 (
		batbox /g 11 18 /c 0xe9 /d "       =        " /w 150
		call :DoTheCalcul %VarCalc%
	)
)
batbox /g 11 18 /c 0x%Clr% /d "       =        "
set Clr=4f
if %x% geq 24 if %x% leq 25 if %y%==16 (
	set Clr=b0
	if !Clic!==1 (
		batbox /g 24 16 /c 0xe9 /d "AC" /w 150
		call :Reset
	)
)
batbox /g 24 16 /c 0x%Clr% /d "AC"
goto :CalcStr

:DoTheCalcul
REM call AllPrograms\Calculator\EXE %1

REM set/p _Res_=<TmpCalc

for /f "delims=" %%a in ('AllPrograms\Calculator\Ex.bat %1') do set _Res_=%%a



call VarCnt %_Res_%
set/a PosX=26-%return%+1
::call aff %return%

For /l %%$ in (5,1,8) do batbox /g 11 %%$ /c 0xa2 /d "                "
if not "%_Res_:~0,3%"=="Com" (
	batbox /g %PosX% 6 /c 0xa2 /d "%_Res_%"
) else (
	batbox /g 11 6 /c 0xa2 /d "Error."
)
goto:eof

:Reset
set VarCalc=0.00
call :Screen
goto:eof

:Screen
call VarCnt %VarCalc%
set/a PosX=26-%return%+1
For /l %%$ in (5,1,8) do batbox /g 11 %%$ /c 0xa2 /d "                "
batbox /g %PosX% 6 /c 0xa2 /d "%VarCalc%"
goto:eof
:End