title cigamOS

::::::::::::::::::::
::   For Coding   ::
::::::::::::::::::::
@echo off
set userN=user
set ProgPath=User\%UserN%\Programs
mode con cols=80 lines=25
::::::::::::::::::::
:: End For Coding ::
::::::::::::::::::::

setlocal enabledelayedexpansion

for /l %%$ in (0,1,78) do (
	set TB1=!TB1! /c 0x3f /g %%$ 21 /d "_"
	set TB2=!TB2! /c 0x08 /g %%$ 22 /a 219
	set TB3=!TB3! /c 0x08 /g %%$ 23 /a 219
	set TB4=!TB4! /c 0x08 /g %%$ 24 /a 219
)
set TB1=Batbox %TB1%
set TB2=Batbox %TB2%
set TB3=Batbox %TB3%
set TB4=Batbox %TB4%
cls
color 30
set x=0
set y=0
set Clic=0
set CallIco=False
set Logoff=False
call TaskBar





call Icon


:Desktop


batbox /c 0xa0
FOR /F "tokens=1,2,3 delims=:" %%A in ('BatBox /y') DO (
SET y=%%B
SET x=%%A
set clic=%%C
)

::batbox /c 07 /g 0 0 /d "x=%x% y=%y% clic=%Clic%          "
batbox /c 0xa0
if %y% geq 20 ( call TaskBar) else ( call Time 33 &batbox /g 0 22 /c 0x8f /d "            " /g 0 23 /c 0x8f /d " S T A R T  " /g 0 24 /c 0x8f /d "            " )
if %Logoff%==True goto :Disconect
if %CallIco%==True (
	call Icon
	set CallIco=False
	goto :Desktop
)
For /l %%$ in (1,1,%IcoTotalNbr%) do (
	set/a x_max=!Ico_%%$_Emp_X!+8
	set/a y_max=!Ico_%%$_Emp_Y!+7
	set Clr=37
	if "!Ico_%%$_Stat!"==" Empty " set Clr=3b
	set/a Ico_!IcoNbr!_AffStat=!Ico_%%$_Emp_Y!+7
	set Ico_!IcoNbr!_AffStat=!Ico_%%$_Emp_X! !Ico_%%$_AffStat!
	if !x! Geq !Ico_%%$_Emp_X! if !x! Leq !x_max! if !y! Geq !Ico_%%$_Emp_Y! if !y! Leq !y_max! (
		set Clr=27
		if "!Ico_%%$_Stat!"==" Empty " set Clr=2b
		if %Clic%==1 (
			batbox /c 0x2e /g !Ico_%%$_AffStat! /d "!Ico_%%$_Stat!" /w 150
			if exist !Ico_%%$_path!\!Ico_%%$_Name!\Launcher.bat (
				call !Ico_%%$_path!\!Ico_%%$_Name!\Launcher.bat
				goto :Desktop
			) else (
			call ErrorMsg !Ico_%%$_Stat! launcher not found ...
			)
		)
		if %Clic%==2 (
			call :DeroulMenu %%$
			
		)
	)
	
	batbox /c 0x!Clr! /g !Ico_%%$_AffStat! /d "!Ico_%%$_Stat!"
)
goto :Desktop


:DeroulMenu

set SelectedIco=%1

if %x% Geq !Ico_6_Emp_X! set/a x-=15

set Esp=
for /l %%$ in (1,1,15) do set Esp= !Esp!

set /a Yt=%y%+5
for /l %%$ in (%y%,1,%Yt%) do batbox /g !x! %%$ /c 0xf0 /d "!Esp!"

call Cadre %x% %y% 15 5 f0

set Tmp=1

set "Lab_1_Text= Open        "
set "Lab_2_Text= Change icon "
set "Lab_3_Text= Rename      "
set "Lab_4_Text= Delete      "


For /l %%$ in (1,1,4) do (
	set /a Lab_%%$_Y=!y!+!Tmp!
	set/a Tmp+=1
)

set/a x+=1

set x_=%x%
set/a x_max=%x%+15
set y_=%y%
set /a y_max=%y%+5
set Task_=0

:GetForDM

FOR /F "tokens=1,2,3 delims=:" %%A in ('BatBox /y') DO (
SET y=%%B
SET x=%%A
set clic=%%C
)

if %Clic%==1 (
if %x% Lss %x_% goto :Eo_f
if %x% Gtr %x_max% goto :Eo_f
if %y% Lss %y_% goto :Eo_f
if %y% Gtr %y_max% goto :Eo_f
)




for /l %%$ in (1,1,4) do (

set Clr=f0

if !x! GEQ !x_! if !x_! leq !x_max! if !y!==!Lab_%%$_Y! (
set Clr=b0
if !Clic!==1 (
	batbox /g !x_! !Lab_%%$_Y! /c 0xe9 /d "!Lab_%%$_Text!" /w 150
	if %%$==1 (
		set Task_=1
		goto :Eo_f
	)
	if %%$==2 (
		set Task_=2
		goto :Eo_f
	)
)
)

batbox /g !x_! !Lab_%%$_Y! /c 0x!Clr! /d "!Lab_%%$_Text!"


)




goto:GetForDM

:Eo_f
set/a x_-=1
for /l %%$ in (%y_%,1,%Yt%) do batbox /g !x_! %%$ /c 0x30 /d " !Esp!"

Call Icon

if %Task_%==1 (
	if exist !Ico_%SelectedIco%_path!\!Ico_%SelectedIco%_Name!\Launcher.bat (
		call !Ico_%SelectedIco%_path!\!Ico_%SelectedIco%_Name!\Launcher.bat
	) else (
		call ErrorMsg !Ico_%SelectedIco%_Stat! launcher not found ...
		set CallIco=True
	)
)
	
if %Task_%==2 (
	Call :ChangeIcon !Ico_%SelectedIco%_Stat!
)
	

set Task_=0
set CallIco=True

goto:Desktop

:ChangeIcon
set LocalPage=1
set IcoName_=%1
for /f "delims=" %%$ in (%ProgPath%\%IcoName_%.ini) do set %%$
call Windows 25 2 41 16 80 70 Change Icon 
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
:GetForCI

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
	 set Clr=cf
	 if %Clic%==1 (
		batbox /g 63 2 /c 0xc9 /d " x " /w 150
		call Gum 3 25 2 41 16
		set CallIco=True
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
			for /f "delims=" %%$ in (!ProgPath!\!IcoName_!.ini) do set %%$
			Del/q !ProgPath!\!IcoName_!.ini
			for /f "delims=" %%$ in ('type CigamIconBank\!File_%y%_Page_%LocalPage%!') do set %%$
			(
			echo ProgramName=!ProgramName!
			echo ProgramIco=!Ico!
			echo ProgramPath=!ProgramPath!
			)>>!ProgPath!\!IcoName_!.ini
			cls
			color 30
			call TaskBar
			set CallIco=True
			goto:eof
		)
	)
)
goto :GetForCI

:Ref
for /l %%$ in (5,1,16) do batbox /g 27 %%$ /c 0x70 /d "                            "
for /l %%$ in (5,1,16) do (
if "!File_%%$_Page_%LocalPage%!"=="Undef" set File_%%$_Page_%LocalPage%=.
batbox /g 27 %%$ /c 0x70 /d "!File_%%$_Page_%LocalPage%!"
)
goto:eof





:Disconect
call Cigam Login

