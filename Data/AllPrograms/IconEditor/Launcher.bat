:Skip
Call Windows 20 0 40 21 80 28 Cigam - IconEditor

set SavingPath=CigamIconBank
set Quit=False

call :New.InitVar


call :DrawZone

call :Pincel_Pal



call :Color_Pal


call :Select_Pal


:GetFor

batbox /g 51 7 /c 0x%Bg%%Fg% /a %CharCode%





FOR /F "tokens=1,2,3 delims=:" %%A in ('BatBox /y') DO (
SET y=%%B
SET x=%%A
set clic=%%C
)

set Clr=47
if %x% geq 57 if %x% leq 59 if %y%==0 (
	set Clr=cf
	if %Clic%==1 (
		batbox /g 57 0 /c 0xc9 /d " x " /w 150
		call :WYS
		if not "%return%"=="Cancel" (
			cls
			color 30
			set CallIco=True
			call TaskBar
			goto:eof
		)
		call :DrawZone
		call :Pincel_Pal
		call :Color_Pal
		call :Select_Pal
	)
)

batbox /g 57 0 /c 0x%Clr% /d " x "

set Clr=70
set Clr_=27
if %x%==37 if %y%==11 (
	set Clr=07
	if %Clic%==1 (
		batbox /g 37 11 /c 0x70 /a 17 /w 12
		batbox /g 37 11 /c 0x07 /a 17 /w 12
		batbox /g 37 11 /c 0x70 /a 17 /w 12
		batbox /g 37 11 /c 0x07 /a 17 /w 12
		Call Inv BgFg Bg Fg
		set Clr_=2e
	)
)

batbox /g 37 11 /c 0x%Clr% /a 17

set Clr=70

if %x%==42 if %y%==11 (
	set Clr=07
	if %Clic%==1 (
		batbox /g 42 11 /c 0x70 /a 16 /w 12
		batbox /g 42 11 /c 0x07 /a 16 /w 12
		batbox /g 42 11 /c 0x70 /a 16 /w 12
		batbox /g 42 11 /c 0x07 /a 16 /w 12
		Call Inv BgFg Bg Fg
		set Clr_=2e
	)
)
batbox /g 42 11 /c 0x%Clr% /a 16

batbox /g 39 11 /c 0x%Clr_% /d "%BgFg%"

if %x% geq 36 if %x% leq 43 if %y% geq 4 if %y% leq 9 (
	if not "%x%%y%"=="%Old_%" if not %Old_%==000 (
		set/a TmpX=%x%-36
		set/a TmpY=%y%-4
		
		batbox /g %Old_X% %Old_Y% !Pix_%TmpX%_%TmpY%!
	)
	set Old_=%x%%y%
	set Old_X=%x%
	set Old_Y=%y%
	batbox /g %x% %y% /c 0xf0 /a %CharCode%
	if %clic%==1 (
	set /a TmpX=%x%-36
	set /a TmpY=%y%-4
	set Pix_%TmpX%_%TmpY%=/c 0x%Bg%%Fg% /a %CharCode%
	batbox /g %x% %y% /c 0x%Bg%%Fg% /a %CharCode%
	)

)


if %x% geq 24 if %x% leq 30 if %y% geq 4 if %y% leq 10 (
	if %Clic%==1 if defined Color_%x%_%y% set %BgFg%=!Color_%x%_%y%!
)



if %Clic%==2 goto :Skip

if %x% geq 22 if %x% leq 57 if %y% geq 14 if %y% leq 19 (
	
	REM pause
	if not "%Old%"=="%x%%y%" if not "%Old%"=="000" batbox /g %x_% %y_% /c 0x!Color_%x_%_%y_%! /a !Pincel_%x_%_%y_%!
	REM pause
	set x_=%x%
	set y_=%y%
	set Old=%x%%y%
	batbox /g %x% %y% /c 0x4e /a !Pincel_%x%_%y%!
	if %Clic%==1 (
	batbox /g %x% %y% /c 0x52 /a !Pincel_%x%_%y%!
	if defined ColX batbox /g %ColX% %ColY% /c 0x70 /a !Pincel_%ColX%_%ColY%!
	call :ResetPincel
	set ColX=%x%
	set ColY=%y%
	set Color_%x%_%y%=52
	set CharCode=!Pincel_%x%_%y%!
	)
)

set Clr=70
if %y%==1 if %x% Geq 21 if %x% leq 26 (
	set Clr=07
	if %Clic%==1 (
		call :FileMenu
	)
)
batbox /g 21 1 /c 0x%Clr% /d " File "

if %Quit%==True (
	cls
	color 30
	set CallIco=True
	call TaskBar
	goto:eof
)
goto :Getfor

:WYS

call MsgBoxYesNo '%FileName%' Would you save current file ?

if "%return%"=="Y" (
	if "%FileName%"=="Untitled" (
		call :SaveAs
	) else (
		call :Save
	)
)

goto:eof


:FileMenu
set "Esp=          "
for /l %%$ in (2,1,7) do batbox /g 21 %%$ /c 0x70 /d "!Esp!"
call Cadre 21 2 10 6 70

call Line 6 21 31 70

batbox /g 21 6 /c 0x70 /a 195
batbox /g 31 6 /c 0x70 /a 180

set Task=0

:GetForFile

FOR /F "tokens=1,2,3 delims=:" %%A in ('BatBox /y') DO (
SET y=%%B
SET x=%%A
set clic=%%C
)
if %Clic%==2 goto :FileMenu
if %Clic%==1 if %y% Gtr 7 goto :Eof_
if %Clic%==1 if %x% Gtr 31 goto :Eof_
if %Clic%==1 if %y%==1 if %x% Geq 21 if %x% leq 26 batbox /g 21 1 /c 0x70 /d " File " &goto :Eof_


set Clr=70

if %x% geq 22 if %x% leq 32 if %y%==3 (
	set Clr=07
	if %Clic%==1 (
		batbox /g 22 3 /c 0xa0 /d "New...   " /w 150
		call :New.InitVar
		call :DrawZone
		goto :Eof_
	)
)

batbox /g 22 3 /c 0x%Clr% /d "New...   "

set Clr=70

if %x% geq 22 if %x% leq 32 if %y%==4 (
	set Clr=07
	if %Clic%==1 (
		batbox /g 22 4 /c 0xa0 /d "Open...  " /w 150
		set Task=Open
		goto :Eof_
	)
)

batbox /g 22 4 /c 0x%Clr% /d "Open...  "
set Clr=70

if %x% geq 22 if %x% leq 32 if %y%==5 (
	set Clr=07
	if %Clic%==1 (
		batbox /g 22 5 /c 0xa0 /d "Save     " /w 150
		if "%FileName%"=="Untitled" (
			set Task=SaveAs
			goto :Eof_
		) else (
			set Task=Save
			goto :Eof_
		)
	)
)

batbox /g 22 5 /c 0x%Clr% /d "Save     "
set Clr=70

if %x% geq 22 if %x% leq 32 if %y%==7 (
	set Clr=07
	if %Clic%==1 (
		batbox /g 22 7 /c 0xa0 /d "Quit     " /w 150
		call :WYS
		if not "%return%"=="Cancel" (
			cls
			color 30
			set CallIco=True
			set Quit=True
			call TaskBar
			goto :Eof_
		)
		goto :Eof_
	)
)

batbox /g 22 7 /c 0x%Clr% /d "Quit     "

goto :GetForFile

:Eof_

for /l %%$ in (2,1,8) do batbox /g 21 %%$ /c 0x20 /d "   !Esp!"
call :Color_Pal

if not %Task%==0 (
	call :%Task%
	set Task=0
)

goto:eof

:SaveAs
call windows 25 5 30 9 70 87 Save as ...
batbox /g 26 7 /c 0x80 /d "                            "
batbox /g 26 7 /c 0x80 /d "   Enter the file name :    "

call Cadre 26 9 27 2 80


set FileN=%FileName%



:GetForSa
FOR /F "tokens=1,2,3 delims=:" %%A in ('BatBox /y') DO (
SET y=%%B
SET x=%%A
set clic=%%C
)
if %Clic%==2 goto :SaveAs

set Clr=47

if %x% geq 52 if %x% leq 54 if %y%==5 (
	set Clr=cf
	if %Clic%==1 (
		batbox /g 52 5 /c 0x47 /d " x " /w 25
		batbox /g 52 5 /c 0xcf /d " x " /w 25
		batbox /g 52 5 /c 0x47 /d " x " /w 25
		batbox /g 52 5 /c 0xcf /d " x " /w 25
		for /l %%$ in (5,1,14) do batbox /g 25 %%$ /c 0x20 /d "                              "
		call :Color_Pal
		call :DrawZone
		call :RefreshDZ
		call :Select_Pal
		call :Pincel_Pal
		goto:eof
	)
)

batbox /g 52 5 /c 0x%Clr% /d " x "

set Clr=80
if %x% geq 26 if %x% leq 54 if %y%==10 (
	set Clr=52
	if %Clic%==1 (
		batbox /g 27 10 /c 0x88 /d "%FileN%"
		batbox /g 27 10 /c 0x83&set/p FileN=
	)
)

batbox /g 27 10 /c 0x%Clr% /d "%FileN%"


set Clr=70
if %x% geq 26 if %x% leq 54 if %y%==13 (
	set Clr=07
	if %Clic%==1 if not "%FileN%"=="%FileName%" (
		batbox /g 26 13 /c 0x70 /d "            OK              " /w 25
		batbox /g 26 13 /c 0x07 /d "            OK              " /w 25
		batbox /g 26 13 /c 0x70 /d "            OK              " /w 25
		batbox /g 26 13 /c 0x07 /d "            OK              " /w 25
		batbox /g 26 13 /c 0x70 /d "            OK              " /w 25
		batbox /g 26 13 /c 0x07 /d "            OK              " /w 25
		set FileName=%FileN%
		call :Save
		for /l %%$ in (5,1,14) do batbox /g 25 %%$ /c 0x20 /d "                              "
		call :Color_Pal
		call :DrawZone
		call :RefreshDZ
		call :Select_Pal
		call :Pincel_Pal
		goto:eof
	)
)

if "%FileN%"=="%FileName%" set Clr=78
batbox /g 26 13 /c 0x%Clr% /d "            OK              "


goto :GetForSa

:Save
if exist "%SavingPath%\%FileName%.ico" del/q "%SavingPath%\%FileName%.ico"

for /l %%X in (0,1,7) do for /l %%Y in (0,1,5) do echo Pix_%%X_%%Y=!Pix_%%X_%%Y!>>%SavingPath%\%FileName%.ico
set "Ico="
for /l %%X in (0,1,7) do for /l %%Y in (0,1,5) do set Ico=!Ico! /g %%X %%Y !Pix_%%X_%%Y!
echo Ico=!Ico! >>%SavingPath%\%FileName%.ico

goto:eof

:Select_Pal
set "Esp=        "

for /l %%$ in (4,1,11) do batbox /g 48 %%$ /c 0x70 /d "!Esp!"
call Cadre 47 3 9 8 70

batbox /g 48 5 /c 0x70 /d "Selected"
goto:eof

:Color_Pal
set "Esp=       "
for /l %%$ in (4,1,11) do batbox /g 24 %%$ /c 0x70 /d "!Esp!"
call Cadre 23 3 8 8 70
set x__=24
set y__=4
for %%$ in (%ColorPile%) do (
	batbox /g !x__! !y__! /c 0x0%%$ /a 219
	set Color_!x__!_!y__!=%%$
	if !x__!==30 (
	set x__=22
	set/a y__+=2
	)
	set/a x__+=2
)
goto:eof

:Open
set LocalPage=1
call Windows 25 2 41 16 80 70 Open... 
call Cadre 26 4 30 13 7f
set FonBar=
for /l %%$ in (1,1,10) do set FonBar=!FonBar! /g 0 %%$ /c 0x07 /a 177
set y_=5
set Page=1
for /l %%N in (5,1,16) do for /l %%P in (1,1,99) do set File_%%N_Page_%%P=Undef
set FileNbr=0
for /f "delims=" %%$ in ('dir /b CigamIconBank\*.ico') do (
	set File_!y_!_Page_!Page!=%%$
	set/a y_+=1
	set/a FileNbr+=1
	if !y_!==16 set/a Page+=1&set y_=5
)
set /a BarTal=10/%Page%
set Bar=
for /l %%$ in (1,1,%BarTal%) do set Bar=!Bar! /g 0 %%$ /c 0x0f /a 219
batbox /g 55 5 /c 0xf0 /a 24
batbox /g 55 16 /c 0xf0 /a 25
set OldY=000
call :Ref
:GetForO

batbox /o 55 5 %FonBar%
set/a max=10-%BarTal%
set/a PosY=5+( ( %max% * %LocalPage% ) / %Page% )
batbox /o 55 %PosY% %Bar%
FOR /F "tokens=1,2,3 delims=:" %%A in ('BatBox /y') DO (
SET y=%%B
SET x=%%A
set clic=%%C
)

set Clr=47
if %x% geq 63 if %x% leq 65 if %y%==2 (
	set Clr=Cf
	if %Clic%==1 (
		batbox /g 63 2 /c 0xc9 /d " x " /w 150
		call Gum 3 25 2 41 16
		Call Windows 20 0 40 21 80 28 Cigam - IconEditor
		batbox /g 21 1 /c 0x70 /d "                                      "
		call :DrawZone
		call :Pincel_Pal
		call :Color_Pal
		call :Select_Pal
		call :RefreshDZ
		goto:eof
	)
)
batbox /g 63 2 /c 0x%Clr% /d " x "

set Clr=f0
if %x%==55 if %y%==5 (
	set Clr=0f
	if %Clic%==1 (
		batbox /g 55 5 /c 0xB9 /a 24 /W 150
		if not %LocalPage%==1 set/a LocalPage-=1
		call :Ref
	)
)
batbox /g 55 5 /c 0x%Clr% /a 24 
set Clr=f0
if %x%==55 if %y%==16 (
	set Clr=0f
	if %Clic%==1 (
		batbox /g 55 16 /c 0xB9 /a 25 /W 150
		if not %LocalPage%==%Page% set/a LocalPage+=1
		call :Ref
	)
)
batbox /g 55 16 /c 0x%Clr% /a 25
if %x% Geq 26 if %x% leq 54 if %y% geq 5 if %y% leq 16 (
	if not !y!==!OldY! batbox /g 27 %OldY% /c 0x70 /d "!File_%OldY%_Page_%LocalPage%!"
	set OldY=!y!
	if not "!File_%y%_Page_%LocalPage%!"=="." (
		batbox /g 27 !y! /c 0x53 /d "!File_%y%_Page_%LocalPage%!"
		for /f "delims=" %%$ in ('type CigamIconBank\!File_%y%_Page_%LocalPage%!') do set %%$
		set TmpIco=!Ico!
		batbox /o 57 8 !TmpIco!
		if %Clic%==1 (
			batbox /g 27 !y! /c 0xe9 /d "!File_%y%_Page_%LocalPage%!" /w 150
			for /f "delims=" %%$ in ('type CigamIconBank\!File_%y%_Page_%LocalPage%!') do set %%$
			call Gum 3 25 2 41 16
			Call Windows 20 0 40 21 80 28 Cigam - IconEditor
			batbox /g 21 1 /c 0x70 /d "                                      "
			call :DrawZone
			call :Pincel_Pal
			call :Color_Pal
			call :Select_Pal
			call :RefreshDZ
			goto:eof
		)
	)
)
goto :GetForO

:Ref
for /l %%$ in (5,1,16) do batbox /g 27 %%$ /c 0x70 /d "                            "
for /l %%$ in (5,1,16) do (
if "!File_%%$_Page_%LocalPage%!"=="Undef" set File_%%$_Page_%LocalPage%=.
batbox /g 27 %%$ /c 0x70 /d "!File_%%$_Page_%LocalPage%!"
)
goto:eof

:Pincel_Pal
call Cadre 21 13 37 7 70


call :ResetPincel

set x__=22
set y__=14
for %%$ in (%PincelPile%) do (
	set Pincel_!x__!_!y__!=%%$
	
	batbox /g !x__! !y__! /c 0x70 /a %%$
	
	if !x__!==57 (
		set x__=21
		set/a y__+=1
	)
	set/a x__+=1
)
goto:eof

:DrawZone
set "Esp=        "
set Y=4
set/a Fin=%y%+6
for /l %%$ in (%Y%,1,%Fin%) do batbox /g 36 %%$ /c 0xf0 /d "!Esp!"
call Cadre 35 3 9 7 0e
goto:eof

:New.InitVar
set FileName=Untitled
batbox /g 21 1 /c 0x70 /d "                                      "
set PincelPile=1,2,3,4,5,6,11,12,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,254
set ColorPile=0,1,2,3,4,5,6,7,8,9,a,b,c,d,e,f
set CharCode=219
set Fg=0
set Bg=f

for /l %%X in (0,1,7) do for /l %%Y in (0,1,5) do set Pix_%%X_%%Y=/c 0x0f /a 219

call :RefreshDZ

set Old_=000
set Old_X=36
set Old_Y=4
set Old=000
set BgFg=Fg

batbox /g 37 11 /c 0x70 /a 17
batbox /g 42 11 /c 0x70 /a 16

batbox /g 21 1 /c 0x70 /d " File "
goto:eof
:RefreshDZ
for /l %%X in (0,1,7) do for /l %%Y in (0,1,5) do (
	set/a TmpX=36+%%X
	set/a TmpY=4+%%Y
	batbox /g !TmpX! !TmpY! !Pix_%%X_%%Y!
)
goto:eof

:ResetPincel
set x__=22
set y__=14
for %%$ in (%PincelPile%) do (
	
	set Color_!x__!_!y__!=70
		if !x__!==57 (
		set x__=21
		set/a y__+=1
	)
	set/a x__+=1
)
goto:eof