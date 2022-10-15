
call Windows 10 3 60 16 1f f1 Cigam - Google_translation
set Google_Spr=/c 0xf9 /g 0 0 /a 219 /c 0xf9 /g -1 -1 /a 219 /c 0xf9 /g -2 -1 /a 219 /c 0xf9 /g -3 -1 /a 219 /c 0xf9 /g -4 0 /a 219 /c 0xf9 /g -4 1 /a 219 /c 0xf9 /g -4 2 /a 219 /c 0xf9 /g -3 3 /a 219 /c 0xf9 /g -2 3 /a 219 /c 0xf9 /g -1 3 /a 219 /c 0xf9 /g 0 2 /a 219 /c 0xf9 /g -1 2 /a 219 /c 0xfc /g 2 0 /a 219 /c 0xfc /g 2 1 /a 219 /c 0xfc /g 2 2 /a 219 /c 0xfc /g 3 3 /a 219 /c 0xfc /g 4 3 /a 219 /c 0xfc /g 5 3 /a 219 /c 0xfc /g 4 0 /a 219 /c 0xfc /g 3 -1 /a 219 /c 0xfc /g 4 -1 /a 219 /c 0xfc /g 5 -1 /a 219 /c 0xfc /g 7 0 /a 219 /c 0xfc /g 6 0 /a 219 /c 0xfc /g 6 1 /a 219 /c 0xfc /g 6 2 /a 219 /c 0xff /g 4 0 /a 219 /c 0xff /g 7 0 /a 219 /c 0xfe /g 8 0 /a 219 /c 0xfe /g 8 1 /a 219 /c 0xfe /g 8 2 /a 219 /c 0xfe /g 9 3 /a 219 /c 0xfe /g 10 3 /a 219 /c 0xfe /g 12 3 /a 219 /c 0xfe /g 11 3 /a 219 /c 0xfe /g 12 2 /a 219 /c 0xfe /g 12 1 /a 219 /c 0xfe /g 12 0 /a 219 /c 0xfe /g 10 -1 /a 219 /c 0xfe /g 9 0 /a 219 /c 0xfe /g 9 -1 /a 219 /c 0xfe /g 11 -1 /a 219 /c 0xff /g 9 0 /a 219 /c 0xff /g 12 3 /a 219 /c 0xf9 /g 14 0 /a 219 /c 0xf9 /g 14 1 /a 219 /c 0xf9 /g 14 2 /a 219 /c 0xf9 /g 15 3 /a 219 /c 0xf9 /g 16 3 /a 219 /c 0xf9 /g 17 3 /a 219 /c 0xf9 /g 18 2 /a 219 /c 0xf9 /g 17 2 /a 219 /c 0xf9 /g 15 -1 /a 219 /c 0xf9 /g 16 -1 /a 219 /c 0xf9 /g 17 -1 /a 219 /c 0xf9 /g 18 0 /a 219 /c 0xf2 /g 20 -1 /a 219 /c 0xf2 /g 20 0 /a 219 /c 0xf2 /g 20 1 /a 219 /c 0xf2 /g 20 2 /a 219 /c 0xf2 /g 20 3 /a 219 /c 0xf2 /g 21 3 /a 219 /c 0xf2 /g 22 3 /a 219 /c 0xf2 /g 23 3 /a 219 /c 0xf2 /g 24 3 /a 219 /c 0xfc /g 26 3 /a 219 /c 0xfc /g 26 2 /a 219 /c 0xfc /g 26 1 /a 219 /c 0xfc /g 26 0 /a 219 /c 0xfc /g 26 -1 /a 219 /c 0xfc /g 27 -1 /a 219 /c 0xfc /g 28 -1 /a 219 /c 0xfc /g 29 -1 /a 219 /c 0xfc /g 30 -1 /a 219 /c 0xfc /g 28 1 /a 219 /c 0xfc /g 27 1 /a 219 /c 0xfc /g 29 1 /a 219 /c 0xfc /g 28 1 /a 219 /c 0xfc /g 29 1 /a 219 /c 0xfc /g 27 3 /a 219 /c 0xfc /g 28 3 /a 219 /c 0xfc /g 29 3 /a 219 /c 0xfc /g 30 3 /a 219 /c 0xff /g 30 -1 /a 219 /c 0xff /g 30 3 /a 219 /c 0xff /g 29 1 /a 219


call :Graph

set LangIn=fr
set LangOut=en

set TextIn=ClickHere...
set TextOut=

set CurrentMode=Mouse

batbox /g 13 12 /c 0xf9 /d "%LangIn%"
batbox /g 41 12 /c 0xf9 /d "%LangOut%"
:GetFor
FOR /F "tokens=1,2,3 delims=:" %%A in ('BatBox /y') DO (
SET y=%%B
SET x=%%A
set clic=%%C
)

if %x% geq 12 if %x% leq 38 if %y% geq 13 if %y% leq 17 (
	if %Clic%==1 call :TextMode
)

set Clr=47
if %x% geq 67 if %x% leq 69 if %y%==3 (
	set Clr=cf
	if %Clic%==1 (
		batbox /g 67 3 /c 0xcf /d " x " /w 25
		batbox /g 67 3 /c 0x47 /d " x " /w 25
		batbox /g 67 3 /c 0xcf /d " x " /w 25
		batbox /g 67 3 /c 0x47 /d " x " /w 25
		batbox /g 67 3 /c 0xcf /d " x " /w 25
		batbox /g 67 3 /c 0x47 /d " x " /w 25
		batbox /g 67 3 /c 0xcf /d " x " /w 25
		batbox /g 67 3 /c 0x47 /d " x " /w 25
		cls
		color 30
		set CallIco=True
		call TaskBar
		goto:eof
	)
)
batbox /g 67 3 /c 0x%Clr% /d " x "

if %y%==12 (
	set Clr=f9
	if %x% geq 13 if %x% leq 14 (
		set Clr=fc
		if %Clic%==1 (
			batbox /g 13 12 /c 0xf2 /d "%LangIn%" /w 150
			call :LangList
			set LangIn=!return!
			set Clr=f9
		)
	)
	batbox /g 13 12 /c 0x!Clr! /d "!LangIn!"
	set Clr=f9
	if %x% geq 41 if %x% leq 42 (
		set Clr=fc
		if %Clic%==1 (
			batbox /g 41 12 /c 0xf2 /d "%LangOut%" /w 150
			call :LangList
			set LangOut=!return!
			set Clr=f9
		)
	)
	batbox /g 41 12 /c 0x!Clr! /d "!LangOut!"
)
goto:GetFor







:LangList



set LangPile=fr,en,es,de,it,pt

call Windows 25 5 30 10 1f f1 Select language...

set x_=26
set y_=7

for %%$ in (%LangPile%) do (
	set Lang_!x_!_!y_!=%%$
	batbox /c 0xf9 /g !x_! !y_! /d "%%$"
	if !x_!==50 set/a y_+=1&set x_=23
	set/a x_+=3
)

set oldx=26
set oldy=7



:GetForLL



FOR /F "tokens=1,2,3 delims=:" %%A in ('BatBox /y') DO (
SET y=%%B
SET x=%%A
set clic=%%C
)

set Clr=47

if %x% geq 52 if %x% leq 54 if %y%==5 (
	set Clr=cf
	if %Clic%==1 (
		batbox /g 52 5 /c 0xcf /d " x " /25
		batbox /g 52 5 /c 0x47 /d " x " /25
		batbox /g 52 5 /c 0xcf /d " x " /25
		batbox /g 52 5 /c 0x47 /d " x " /25
		batbox /g 52 5 /c 0xcf /d " x " /25
		batbox /g 52 5 /c 0x47 /d " x " /25
		batbox /g 52 5 /c 0xcf /d " x " /25
		batbox /g 52 5 /c 0x47 /d " x " /25
		batbox /g 52 5 /c 0xcf /d " x " /25
		batbox /g 52 5 /c 0x47 /d " x " /25
		call Gum ff 25 5 30 10
		call :Graph
		goto:eof
	)
)


batbox /g 52 5 /c 0x!Clr! /d " x "

batbox /g 0 0 /c 0x07 /d "x=!x! y=!y! oldx=!oldx! oldy=!oldy!                 "

set Clr=f9


if not "!Lang_%x%_%y%!"=="" (
	batbox /g !x! !y! /c 0xfc /d "!Lang_%x%_%y%!"
	if %Clic%==1 (
		batbox /g !x! !y! /c 0xf2 /d "!Lang_%x%_%y%!" /w 250
		batbox /g 52 5 /c 0xcf /d " x " /25
		batbox /g 52 5 /c 0x47 /d " x " /25
		batbox /g 52 5 /c 0xcf /d " x " /25
		batbox /g 52 5 /c 0x47 /d " x " /25
		batbox /g 52 5 /c 0xcf /d " x " /25
		batbox /g 52 5 /c 0x47 /d " x " /25
		batbox /g 52 5 /c 0xcf /d " x " /25
		batbox /g 52 5 /c 0x47 /d " x " /25
		batbox /g 52 5 /c 0xcf /d " x " /25
		batbox /g 52 5 /c 0x47 /d " x " /25
		call Gum ff 25 5 30 10
		call :Graph
		set return=!Lang_%x%_%y%!
		goto:eof
		
	)
)
if not "!Lang_%oldx%_%oldy%!"=="" batbox /g !oldx! !oldy! /c 0xf9 /d "!Lang_%oldx%_%oldy%!"

set oldx=!x!
set oldy=!y!

goto:GetForLL


:TextMode
batbox /g 13 18 /c 0xf7 /d "*press ESC to mouse mode"

set CursPosX=13
set CursPosY=14



:GetKey
batbox /g 0 0 /c 0x07 /d "%CursPosY%"
batbox /c 0x0f /g %CursPosX% %CursPosY% /d "!LangInChar_%CursPosX%_%CursPosY%!"

batbox /k
if %errorlevel%==27 (
	batbox /c 0xf0 /g %CursPosX% %CursPosY% /d "!LangInChar_%CursPosX%_%CursPosY%!"
	batbox /g 13 18 /c 0xff /d "*press ESC to mouse mode"
	call :Translate
	goto:eof
)
if %errorlevel%==327 (
	batbox /c 0xf0 /g %CursPosX% %CursPosY% /d "!LangInChar_%CursPosX%_%CursPosY%!"
	if not !CursPosY!==14 set/a CursPosY-=1
	goto:Getkey
)
if %errorlevel%==335 (
	batbox /c 0xf0 /g %CursPosX% %CursPosY% /d "!LangInChar_%CursPosX%_%CursPosY%!"
	if not !CursPosY!==16 set/a CursPosY+=1
	goto:Getkey
)
if %errorlevel%==330 (
	batbox /c 0xf0 /g %CursPosX% %CursPosY% /d "!LangInChar_%CursPosX%_%CursPosY%!"
	if not !CursPosX!==13 set/a CursPosX-=1
	goto:Getkey
)
if %errorlevel%==332 (
	batbox /c 0xf0 /g %CursPosX% %CursPosY% /d "!LangInChar_%CursPosX%_%CursPosY%!"
	if not !CursPosX!==37 set/a CursPosX+=1
	goto:Getkey
)
if %errorlevel%==8 (
	if %CursPosX%==13 if %CursPosY%==14 goto:GetKey
	batbox /c 0xf0 /g %CursPosX% %CursPosY% /d "!LangInChar_%CursPosX%_%CursPosY%!"
	set "LangInChar_%CursPosX%_%CursPosY%= "
	batbox /c 0xf0 /g %CursPosX% %CursPosY% /d "!LangInChar_%CursPosX%_%CursPosY%!"
	set/a CursPosX-=1
	batbox /c 0xf0 /g %CursPosX% %CursPosY% /d "!LangInChar_%CursPosX%_%CursPosY%!"
	goto:Getkey
)

batbox /a %errorlevel%>TmpChar
set/p Key=<TmpChar
set LangInChar_%CursPosX%_%CursPosY%=%Key%
batbox /c 0xf0 /g %CursPosX% %CursPosY% /d "!LangInChar_%CursPosX%_%CursPosY%!"
set/a CursPosX+=1

goto:Getkey

:Translate

set "Text="

for /l %%Y in (14,1,16) do for /l %%X in (13,1,37) do (
	REM if not "!LangInChar_%%X_%%Y!"==" "
	set Text=!Text!!LangInChar_%%X_%%Y!
)

batbox /g 41 14 /c 0xf0 /d "Wait..."

echo %Text%>AllPrograms\Translater\TmpTrlog.txt
cd AllPrograms
cd Translater
call Translate -lang fr en -file "TmpTrlog.txt"
cd..
cd..
batbox /g 41 14 /c 0xff /d "Wait..."
batbox /g 41 14 /c 0xf0 /d "%traduction%"
goto:eof

:Graph

for /l %%X in (13,1,37) do for /l %%Y in (14,1,16) do (
	if not defined LangInChar_%%X_%%Y set "LangInChar_%%X_%%Y= "
	batbox /g %%X %%Y /c 0xf0 /d "!LangInChar_%%X_%%Y!"
)

batbox /o 27 6 %Google_Spr%

batbox /g 30 11 /c 0xf0 /d "    TRANSLATION     "

call Cadre 12 13 26 4 f8
call Cadre 40 13 26 4 f7
goto:eof







