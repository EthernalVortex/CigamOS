call windows 0 0 80 21 80 18 Cigam - TextEditor

set SavingPath=Allprograms\TextEditor\SavingDirectory



call :New


:Str


batbox /g 30 20 /c 0x70 /a 179 /d " Line:%CursPos_Y%   Col:%CursPos_X% " /a 179 /d "      "


call :%LocalMode%



goto:Str

:KeyBoard
set/a CursPos_X_=%CursPos_X%+1
batbox /g !CursPos_X! !CursPos_Y! /c 0xa1 /d !Char_%CursPos_X%_%CursPos_Y%!

:GetKey
batbox /k_
if %errorlevel%==27 (
	batbox /g 1 1 /c 0xb9 /d "!TEXTMODE!" /w 150
	call Inv LocalMode Keyboard Mouse
	call :RefreshTextMode
	batbox /g 1 1 /c 0x07 /d "!TEXTMODE!"
	goto:eof
)
if %errorlevel%==327 (
	batbox /c 0xf0 /g %CursPos_X% %CursPos_Y% /d "!Char_%CursPos_X%_%CursPos_Y%!"
	if not !CursPos_Y!==!MinLine! set/a CursPos_Y-=1
	goto:eof
)
if %errorlevel%==335 (
	batbox /c 0xf0 /g %CursPos_X% %CursPos_Y% /d "!Char_%CursPos_X%_%CursPos_Y%!"
	if not !CursPos_Y!==!MaxLine! set/a CursPos_Y+=1
	goto:eof
)
if %errorlevel%==330 (
	batbox /c 0xf0 /g %CursPos_X% %CursPos_Y% /d "!Char_%CursPos_X%_%CursPos_Y%!"
	if not !CursPos_X!==!MinCol! set/a CursPos_X-=1
	goto:eof
)
if %errorlevel%==332 (
	batbox /c 0xf0 /g %CursPos_X% %CursPos_Y% /d "!Char_%CursPos_X%_%CursPos_Y%!"
	if not !CursPos_X!==!MaxCol! set/a CursPos_X+=1
	goto:eof
)
if %errorlevel%==8 (
	if %CursPos_X%==!MinCol! if %CursPos_Y%==!MinLine! goto:eof
	batbox /c 0xf0 /g %CursPos_X% %CursPos_Y% /d "!Char_%CursPos_X%_%CursPos_Y%!"
	set "Char_%CursPos_X%_%CursPos_Y%= "
	batbox /c 0xf0 /g %CursPos_X% %CursPos_Y% /d "!Char_%CursPos_X%_%CursPos_Y%!"
	set/a CursPos_X-=1
	batbox /c 0xf0 /g %CursPos_X% %CursPos_Y% /d "!Char_%CursPos_X%_%CursPos_Y%!"
	goto:eof
)

if not %errorlevel%==0 (
batbox /a %errorlevel%>TmpChar
set/p Key=<TmpChar
set Char_%CursPos_X%_%CursPos_Y%=%Key%
batbox /c 0xf0 /g %CursPos_X% %CursPos_Y% /d "!Char_%CursPos_X%_%CursPos_Y%!"
set/a CursPos_X+=1
)

goto:eof



:Mouse

FOR /F "tokens=1,2,3 delims=:" %%A in ('BatBox /y') DO (
SET y=%%B
SET x=%%A
set clic=%%C
)
set Clr=07
if %y%==1 (
	set Clr=70
	if %Clic%==1 (
		batbox /g 1 1 /c 0xb9 /d "!TEXTMODE!" /w 150
		call Inv LocalMode Keyboard Mouse
		call :RefreshTextMode
		batbox /g 1 1 /c 0x07 /d "!TEXTMODE!"
		goto:eof
	)
)
batbox /g 1 1 /c 0x%Clr% /d "!TEXTMODE!"

set Clr=70

if %y%==2 if %x% geq 1 if %x% leq 7 (
	set Clr=07
	if %Clic%==1 (
		batbox /g 1 2 /c 0xb9 /d " File " /w 150
		batbox /g 1 2 /c 0x07 /d " File "
		call :FileMenu
		set Clr=70
	)
)


batbox /g 1 2 /c 0x%Clr% /d " File "

goto:eof


:FileMenu
set "Esp_=  "
set Task=UnDef
For /l %%$ in (1,1,10) do set "Esp_= !Esp_!"
for /l %%$ in (4,1,12) do batbox /g 2 %%$ /c 0x70 /d "!Esp_!"
call Cadre 2 4 12 8 70
call Line 10 2 14 70
batbox /g 2 10 /a 195 /g 14 10 /a 180

:GetFor
FOR /F "tokens=1,2,3 delims=:" %%A in ('BatBox /y') DO (
SET y=%%B
SET x=%%A
set clic=%%C
)
if %Clic%==1 (
	if %x% Gtr 14 Goto :Eof_File
	if %y% Gtr 12 Goto :Eof_File
)

set Clr=70
if %x% geq 3 if %x% leq 14 if %y%==5 (
	if %Clic%==1 (
		batbox /g 3 5 /c 0xb9 /d " New       " /w 150
		if !FileName!==Untitled!UntitledNbr! call :WouldYouSave
		set Task=New
		goto :Eof_File
	)
	set Clr=07
)

batbox /g 3 5 /c 0x%Clr% /d " New       "

set Clr=70
if %x% geq 3 if %x% leq 14 if %y%==6 (
	set Clr=07
	if %Clic%==1 (
		batbox /g 3 6 /c 0xb9 /d " Open...   " /w 150
		set Task=Open
		goto :Eof_File
	)
)

batbox /g 3 6 /c 0x%Clr% /d " Open...   "

set Clr=70
if %x% geq 3 if %x% leq 14 if %y%==7 (
	set Clr=07
	if %Clic%==1 (
		batbox /g 3 7 /c 0xb9 /d " save      " /w 150
		if %FileName%==Untitled%UntitledNbr% ( set Task=SaveAs & goto :Eof_File )
		call :Save Replace
		goto :Eof_File
	)
)

batbox /g 3 7 /c 0x%Clr% /d " save      "

set Clr=70
if %x% geq 3 if %x% leq 14 if %y%==8 (
	set Clr=07
	if %Clic%==1 (
		batbox /g 3 8 /c 0xb9 /d " Save as..." /w 150
		set Task=SaveAs
		goto :Eof_File
	)
)

batbox /g 3 8 /c 0x%Clr% /d " Save as..."

set Clr=70
if %x% geq 3 if %x% leq 14 if %y%==9 (
	set Clr=07
)

batbox /g 3 9 /c 0x%Clr% /d " Close     "

set Clr=70
if %x% geq 3 if %x% leq 14 if %y%==11 (
	set Clr=07
)

batbox /g 3 11 /c 0x%Clr% /d " Exit      "


goto :GetFor

:WouldYouSAve
for /l %%$ in (4,1,12) do batbox /g 2 %%$ /c 0x10 /d " !Esp_!"
Call :TextGum %MinCol% 14 %MinLine% 12

call windows 25 5 30 10 70 87 Untitled%UntitledNbr%


batbox /g 26 8 /c 0x80 /d "   This file is not saved   "

batbox /g 26 10 /c 0x80 /d "  Do you want to save it ?  "

set NoClicSavNT=/g 31 13 /c 0xf7 /d "  Yes   " /o 32 14 /c 0x80 /g 0 0 /a 223 /a 223 /a 223 /a 223 /a 223 /a 223 /a 223 /a 223 /g 7 -1 /a 220

set NoClicSav=/g 31 13 /c 0xf0 /d "  Yes   " /o 32 14 /c 0x80 /g 0 0 /a 223 /a 223 /a 223 /a 223 /a 223 /a 223 /a 223 /a 223 /g 7 -1 /a 220

set NoClicCan=/g 41 13 /c 0xf0 /d "   No   " /o 42 14 /c 0x80 /g 0 0 /a 223 /a 223 /a 223 /a 223 /a 223 /a 223 /a 223 /a 223 /g 7 -1 /a 220

set ClicSav=/g 31 13 /c 0x80 /d " " /g 32 13 /c 0xf0 /d "  Yes   " /g 31 14 /c 0x80 /d "         "

set ClicCan=/g 41 13 /c 0x80 /d " " /g 42 13 /c 0xf0 /d "   No   " /g 41 14 /c 0x80 /d "         "


:GetForWYS
FOR /F "tokens=1,2,3 delims=:" %%A in ('BatBox /y') DO (
SET y=%%B
SET x=%%A
set clic=%%C
)
set Clr=47
if %y%==5 if %x% geq 52 if %x% leq 54 (
	set Clr=cf
	if %Clic%==1 (
		batbox /g 52 5 /c 0xc9 /d " x " /w 150
		call :TextGum 25 55 5 15
		goto:eof
	)
)
batbox /g 52 5 /c 0x%Clr% /d " x "

set batbox=NoClicSav
if %y%==13 if %x% geq 31 if %x% leq 39 (
	set batbox=ClicSav
	if %Clic%==1 (
		batbox /g 32 13 /c 0x0f /d "  Save  " /w 150
		call :SaveAs
		call :TextGum 25 55 5 15
		goto:eof
	)
)
batbox !%batbox%!

set batbox=NoClicCan
if %y%==13 if %x% geq 41 if %x% leq 49 (
	set batbox=ClicCan
	if %Clic%==1 (
		batbox /g 42 13 /c 0x0f /d " Cancel " /w 150
		call :TextGum 25 55 5 15
		goto:eof
	)
)
batbox !%batbox%!

goto :GetForWYS

:Open
call Windows 20 4 40 12 70 87 Open...

call Cadre 21 5 37 10 8f

set Esp=
for /l %%$ in (1,1,36) do set Esp= !Esp!

set Page=1
set y_=6
set BarSpr=
for /l %%P in (1,1,299) do for /l %%F in (6,1,14) do set File_%%F_Page_%%P=.
for /l %%$ in (1,1,7) do set "BarSpr=!BarSpr! /c 0x0f /g 0 %%$ /a 177"

for /f "delims=" %%$ in ('dir/b %SavingPath%\*.cte') do (
	set File_!y_!_Page_!Page!=%%$
	set/a y_+=1
	if !y_!==15 (
		set y_=6
		set/a Page+=1
	)
)







set LocalPage=1

set /a BarTal=7/%page%

::
::set BarTal=1
::

set Bar=
for /l %%$ in (1,1,%BarTal%) do set Bar=!Bar! /c 0x0f /g 0 %%$ /a 219

for /l %%$ in (6,1,14) do batbox /g 22 %%$ /c 0x80 /d "%Esp%"

for /l %%$ in (6,1,14) do (
	if !File_%%$_Page_%LocalPage%!==UnDef set File_%%$_Page_%LocalPage%=.
	batbox /c 0x80 /g 22 %%$ /d "!File_%%$_Page_%LocalPage%!"
)

set oldY=000

::set Page=5
:GetForO
batbox /o 57 6 %BarSpr%

set/a max=7-%BarTal%
set /a PosY=5+((%max%*%LocalPage%)/%Page%)





batbox /o 57 %PosY% %Bar%

batbox /g 57 6 /c 0x70 /a 24
batbox /g 57 14 /c 0x70 /a 25

::batbox /c 0xa0 /g 0 0 /d "%LocalPage%/%Page%    PosY=%PosY%      "

FOR /F "tokens=1,2,3 delims=:" %%A in ('BatBox /y') DO (
SET y=%%B
SET x=%%A
set clic=%%C
)
if %Clic%==2 goto :Open
set Clr=70
if %x%==57 if %y%==6 (
	set Clr=07
	if %Clic%==1 (
		if not !LocalPage!==1 set/a LocalPage-=1
		call :RefPage
	)
)
batbox /g 57 6 /c 0x%Clr% /a 24
set Clr=70
if %x%==57 if %y%==14 (
	set Clr=07
	if %Clic%==1 (
		if not !LocalPage!==!Page! set/a LocalPage+=1
		for /l %%$ in (6,1,14) do batbox /g 22 %%$ /c 0x80 /d "%Esp%"
		call :RefPage
	)
)
batbox /g 57 14 /c 0x%Clr% /a 25

if %x% geq 22 if %x% leq 56 if %y% geq 6 if %y% leq 14 (
	
	if not %y%==OldY batbox /g 22 %OldY% /c 0x80 /d "!File_%OldY%_Page_%LocalPage%!"
	set OldY=%y%
	if not "!File_%y%_Page_%LocalPage%!"=="." batbox /g 22 %y% /c 0x53 /d "!File_%y%_Page_%LocalPage%!"
	if %Clic%==1 if not "!File_%y%_Page_%LocalPage%!"=="." (
	batbox /g 22 %y% /c 0xb9 /d "!File_%y%_Page_%LocalPage%!" /w 100
	for /l %%$ in (4,1,16) do batbox /g 20 %%$ /c 0x10 /d "%Esp%    "
	for /f "delims=" %%$ in (!SavingPath!\!File_%y%_Page_%LocalPage%!) do set %%$
	call :TextGum !MinCol! !MaxCol! !MinLine! !MaxLine!
	goto:eof
	)
)

set Clr=47

if %y%==4 if %x% geq 57 if %x% leq 59 (
	set Clr=cf
	if %Clic%==1 (
		batbox /g 57 4 /c 0xc9 /d " x " /w 150
		for /l %%$ in (4,1,16) do batbox /g 20 %%$ /c 0x10 /d "%Esp%    "
		call :TextGum 20 60 4 16
		goto:eof
	)
)

batbox /g 57 4 /c 0x%Clr% /d " x "

goto :GetForO

:RefPage
for /l %%$ in (6,1,14) do batbox /g 22 %%$ /c 0x80 /d "%Esp%"
		for /l %%$ in (6,1,14) do (
			if not defined File_%%$_Page_%LocalPage% set File_%%$_Page_%LocalPage%=.
			batbox /c 0x80 /g 22 %%$ /d "!File_%%$_Page_%LocalPage%!"
		)
goto:eof


:Eof_File
for /l %%$ in (4,1,12) do batbox /g 2 %%$ /c 0x10 /d " !Esp_!"

Call :TextGum %MinCol% 14 %MinLine% 12
batbox /g 1 2 /c 0x70 /d " File "
if not %Task%==UnDef (
	Call :%Task%
	set Task=UnDef
)





goto:eof

:SaveAs
call windows 25 5 30 10 70 87 Save as ...

batbox /g 26 7 /c 0x80 /d "                            "
batbox /g 26 7 /c 0x80 /d "   Enter the file name :    "

call Cadre 26 9 27 2 80


set FileN=%FileName%


set NoClicSavNT=/g 31 13 /c 0xf7 /d "  Save  " /o 32 14 /c 0x80 /g 0 0 /a 223 /a 223 /a 223 /a 223 /a 223 /a 223 /a 223 /a 223 /g 7 -1 /a 220

set NoClicSav=/g 31 13 /c 0xf0 /d "  Save  " /o 32 14 /c 0x80 /g 0 0 /a 223 /a 223 /a 223 /a 223 /a 223 /a 223 /a 223 /a 223 /g 7 -1 /a 220

set NoClicCan=/g 41 13 /c 0xf0 /d " Cancel " /o 42 14 /c 0x80 /g 0 0 /a 223 /a 223 /a 223 /a 223 /a 223 /a 223 /a 223 /a 223 /g 7 -1 /a 220

set ClicSav=/g 31 13 /c 0x80 /d " " /g 32 13 /c 0xf0 /d "  Save  " /g 31 14 /c 0x80 /d "         "

set ClicCan=/g 41 13 /c 0x80 /d " " /g 42 13 /c 0xf0 /d " Cancel " /g 41 14 /c 0x80 /d "         "

:GetForSA
FOR /F "tokens=1,2,3 delims=:" %%A in ('BatBox /y') DO (
SET y=%%B
SET x=%%A
set clic=%%C
)

set Clr=47
if %y%==5 if %x% geq 52 if %x% leq 54 (
	set Clr=cf
	if %Clic%==1 (
		batbox /g 52 5 /c 0xc9 /d " x " /w 150
		call :TextGum 25 55 5 15
		goto:eof
	)
)
batbox /g 52 5 /c 0x%Clr% /d " x "


set Clr=80
if %y%==10 if %x% geq 26 if %x% leq 51 (
	set Clr=58
	if %Clic%==1 (
		batbox /c 0x88 /g 27 10 /d "%FileName%
		batbox /c 0x85 /g 27 10
		set/p FileN=
	)
)
batbox /c 0x%Clr% /g 27 10 /d "%FileN%"


set batbox=NoClicSav
if %y%==13 if %x% geq 31 if %x% leq 39 (
	set batbox=ClicSav
	if %Clic%==1 if not %FileN%==Untitled%UntitledNbr% (
		batbox /g 32 13 /c 0x0f /d "  Save  " /w 150
		set "Replace=None"
		if %FileN%==%FileName% set Replace=Replace
		set FileName=%FileN%
		call :FileNameAff
		call :Save %Replace%
		call :TextGum 25 55 5 15
		goto:eof
	)
)

if %FileN%==Untitled%UntitledNbr% set batbox=NoClicSavNT
batbox !%batbox%!


set batbox=NoClicCan
if %y%==13 if %x% geq 41 if %x% leq 49 (
	set batbox=ClicCan
	if %Clic%==1 (
		batbox /g 42 13 /c 0x0f /d " Cancel " /w 150
		call :TextGum 25 55 5 15
		goto:eof
	)
)
batbox !%batbox%!
goto :GetForSA

:Save

if [%1]==[Replace] Del/q !SavingPath!\!FileName!.cte

for /l %%X in (%MinCol%,1,%MaxCol%) do for /l %%Y in (!MinLine!,1,!MaxLine!) do echo "Char_%%X_%%Y=!Char_%%X_%%Y!">>!SavingPath!\!FileName!.cte

goto:eof

:TextGum

For /l %%X in (%1,1,%2) do for /l %%Y in (%3,1,%4) do batbox /g %%X %%Y /c 0x17 /d "!Char_%%X_%%Y!"

goto:eof

:New
set x=1
:For
if not exist "!SavingPath!\Untitled%x%.cte" (
	set FileName=Untitled%x%
	set UntitledNbr=%x%
	goto :EndFor
)
set/a x+=1
goto :For
:EndFor
set "TEXTMODE=                           Loading Please Wait...                             "
batbox /g 1 1 /c 0x0a /d "!TEXTMODE!"
for /l %%$ in (1,1,78) do batbox /g %%$ 2 /c 0x70 /d " "
batbox /g 1 2 /c 0x70 /d " File "
call Cadre 1 3 77 16 07
for /l %%$ in (1,1,78) do batbox /g %%$ 20 /c 0x70 /d " "
set MinLine=5
set MaxLine=18
set MinCol=3
set MaxCol=75
set CursPos_X=3
set CursPos_Y=5
set maxPct=0
set/a Pmax=%MaxCol%+%MaxLine%


for /l %%X in (%MinCol%,1,%MaxCol%) do for /l %%Y in (!MinLine!,1,!MaxLine!) do set "Char_%%X_%%Y= "
for /l %%X in (%MinCol%,1,%MaxCol%) do (
for /l %%Y in (!MinLine!,1,!MaxLine!) do (
	batbox /g %%X %%Y /c 0x17 /d "!Char_%%X_%%Y!"
	set /a "Pct=( 100 * ( %%X + %%Y ) ) / !Pmax!"
	if !Pct! Geq !MaxPct! set MaxPct=!Pct!
	if !Pct! Geq !MaxPct! batbox /g 50 1 /c 0x0a /d "!Pct!" /a 37 /d "    "
)
)
set LocalMode=Keyboard
call :RefreshTextMode
batbox /g 1 1 /c 0x07 /d "!TEXTMODE!"
call :FileNameAff
goto:eof

:FileNameAff

call VarCnt %FileName%

set/a PosX=40-((%return%+2)/2)

batbox /g %PosX% 3 /c 0x70 /d " %FileName% "


goto:eof

:RefreshTextMode

if %LocalMode%==Mouse set "TEXTMODE=                         Clic here to 'keyboard' mode                         "
if %LocalMode%==Keyboard set "TEXTMODE=                          Press ESC to 'mouse' mode                           "

goto:eof










