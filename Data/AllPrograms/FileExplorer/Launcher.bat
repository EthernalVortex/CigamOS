call Windows 5 0 70 22 80 f8 Cigam File Explorer
call Line 20 5 74 f8
batbox /c 0xf8 /g 5 20 /a 195
batbox /c 0xf8 /g 74 20 /a 180
call Line 2 5 74 f8
batbox /c 0xf8 /g 5 2 /a 195
batbox /c 0xf8 /g 74 2 /a 180



set CurrentPage=0
set Current_Path=%1
:Reset
set DirNbr=0

set Dir!DirNbr!=%Current_Path%

:Refresh

batbox /g 30 11 /c 0x8e /d "     Loading...     "

call Cadre 30 10 20 2 8e

for /l %%P in (0,1,50) do for /l %%F in (0,1,16) do (
	set "File_Name_%%F_Page_%%P=_-_-_"
)

:Str

set FileNbr=0
set PageNbr=0

set x_=7
set y_=4
set PageCnt=0

for /f "delims=" %%I in ('dir /b "%Current_Path%*.*"') do (
	set Ext=%%~xI
	if not "!Ext!"=="" (
		set Ext=!Ext:~1,3!
		call :SetIco UnKnown !FileNbr! !PageNbr!
		if /i "!Ext!"=="exe" call :SetIco Exe !FileNbr! !PageNbr!
		if /i "!Ext!"=="bat" call :SetIco Bat !FileNbr! !PageNbr!
		if /i "!Ext!"=="ini" call :SetIco Ini !FileNbr! !PageNbr!
		if /i "!Ext!"=="lnk" call :SetIco Lnk !FileNbr! !PageNbr!
		if /i "!Ext!"=="dll" call :SetIco Dll !FileNbr! !PageNbr!
		if /i "!Ext!"=="c" call :SetIco c !FileNbr! !PageNbr!
		for %%$ in (wav,wmv,avi,mp3) do if /i !Ext!==%%$ call :SetIco Music !FileNbr! !PageNbr!
		for %%$ in (rar,zip,) do if /i !Ext!==%%$ call :SetIco Archive !FileNbr! !PageNbr!
		for %%$ in (txt,log) do if /i !Ext!==%%$ call :SetIco Text !FileNbr! !PageNbr!
	) else (
		set Ext=Directory
		for /f "delims=" %%$ in ('type CigamIconBank\Directory.ico') do set %%$
		set File_Ico_!FileNbr!_Page_!PageNbr!=!Ico!
	)
	set File_Name_!FileNbr!_Page_!PageNbr!=%%I
	set File_Type_!FileNbr!_Page_!PageNbr!=!Ext!
	set File_MinX_!FileNbr!_Page_!PageNbr!=!x_!
	set File_MinY_!FileNbr!_Page_!PageNbr!=!y_!
	set/a File_MaxX_!FileNbr!_Page_!PageNbr!=!x_!+6
	set/a File_MaxY_!FileNbr!_Page_!PageNbr!=!y_!+6
	set/a File_TitlePosX_!FileNbr!_Page_!PageNbr!=!x_!+1
	set/a File_TitlePosY_!FileNbr!_Page_!PageNbr!=!y_!+6
	set/a x_+=8
	if !x_!==71 set/a y_+=8&set x_=7
	set/a FileNbr+=1
	set/a PageCnt+=1
	if !PageCnt!==16 (
		set x_=7
		set y_=4
		set/a PageNbr+=1
		set PageCnt=0
		set FileNbr=0
	)

)



:RefreshCurrentPath

call Gum af 6 3 68 15 80
batbox /g 6 1 /c 0xf0 /a 16 /d "                                                                   "
batbox /g 6 1 /c 0xf0 /a 16 /d  %Current_Path%




for /l %%F in (0,1,16) do (
	if not "!File_Name_%%F_Page_%CurrentPage%!"=="_-_-_" (
		batbox /o !File_MinX_%%F_Page_%CurrentPage%! !File_MinY_%%F_Page_%CurrentPage%! !File_Ico_%%F_Page_%CurrentPage%!
		batbox /g !File_TitlePosX_%%F_Page_%CurrentPage%! !File_TitlePosY_%%F_Page_%CurrentPage%! /c 0xf0 /d "!File_Name_%%F_Page_%CurrentPage%:~0,7!"
		REM batbox /c 0x2a /g 0 0 /d "batbox /g !File_TitlePosX_%%F_Page_%CurrentPage%! !File_TitlePosY_%%F_Page_%CurrentPage%! /c 0xf0 /d "!File_Name_%%F_Page_%CurrentPage%:~0,6!""
	)
)

REM batbox /g 6 4 /c 0xf0 /d "[%Previous_Path%]"



:GetFor




FOR /F "tokens=1,2,3 delims=:" %%A in ('BatBox /y') DO (
SET y=%%B
SET x=%%A
set Clic=%%C
)



set Clr=f0

if %x% geq 5 if %x% leq 74 if %y%==1 (
	set Clr=52
	if %Clic%==1 (
	set Clr=f0
		batbox /g 6 1 /c 0xf0 /a 16 /d "                                                                   "
		batbox /c 0xf0 /g 6 1
		set/p Tmp_Path=^>
		if not exist %Tmp_Path%\*.* goto:Nope
		set Current_Path=%Tmp_Path%\
		goto :Reset
	)
)
:Nope
batbox /g 6 1 /c 0x%Clr% /a 16 /d  %Current_Path%

set Clr=72
set Clr_=80

if %x% geq 6 if %x% leq 12 if %y%==3 (
	set Clr=27
	set Clr_=08
	if %Clic%==1 if not %DirNbr%==0 (
		batbox /g 6 3 /c 0x2e /a 17 /c 0x0f /d " Back "
		call :Prev
		goto :Refresh
	)
)
if %DirNbr%==0 (
	set Clr=78
	set Clr_=87
)
batbox /g 6 3 /c 0x%Clr% /a 17 /c 0x%Clr_% /d " Back "

set Clr=80

if %x% geq 14 if %x% leq 23 if %y%==3 (
	set Clr=08
	if %Clic%==1 (
		batbox /g 14 3 /c 0x0f /d " Refresh " /w 100
		goto :Refresh
	)
)

batbox /g 14 3 /c 0x%Clr% /d " Refresh "

for /l %%F in (0,1,16) do (
	if not "!File_Name_%%F_Page_%CurrentPage%!"=="_-_-_" (
		set Clr=f0
		if !x! Geq !File_MinX_%%F_Page_%CurrentPage%! if !x! Leq !File_MaxX_%%F_Page_%CurrentPage%! if !y! Geq !File_MinY_%%F_Page_%CurrentPage%! if !y! Leq !File_MaxY_%%F_Page_%CurrentPage%! (
			set Clr=27
			batbox /g 6 21 /c 0xf0 /d "                                                                    "
			set Fn=!File_Name_%%F_Page_%CurrentPage%:~0,41!
			if not "!File_Type_%%F_Page_%CurrentPage%!"=="Directory" set Fn=!Fn:~0,-4!
			batbox /g 6 21 /c 0xf0 /d "FILE : " /c 0xf9 /d "!Fn!" /c 0xf0 /g 55 21 /d "TYPE : " /c 0xf9 /d "!File_Type_%%F_Page_%CurrentPage%!"
			if !Clic!==1 (
				if "!File_Type_%%F_Page_%CurrentPage%!"=="Directory" (
					batbox /g !File_TitlePosX_%%F_Page_%CurrentPage%! !File_TitlePosY_%%F_Page_%CurrentPage%! /c 0x2e /d "!File_Name_%%F_Page_%CurrentPage%!"
					set "Current_Path=!Current_Path!!File_Name_%%F_Page_%CurrentPage%!\"
					set/a DirNbr+=1
					set "Dir!DirNbr!=!Current_Path!"
					goto :Refresh
				) else (
					batbox /g !File_TitlePosX_%%F_Page_%CurrentPage%! !File_TitlePosY_%%F_Page_%CurrentPage%! /c 0x2e /d "!File_Name_%%F_Page_%CurrentPage%!"
					
					call :FormatExt !File_Type_%%F_Page_%CurrentPage%!
					if "!return!"=="None" (
						call MsgBoxYesNo Unknown_format f Can't open '!File_Name_%%F_Page_%CurrentPage%!', Open with windows ?
						if "!return!"=="Y" start "" "!Current_Path!!File_Name_%%F_Page_%CurrentPage%!"
						goto:RefreshCurrentPath
					) else (
						call AllPrograms\!return!\Launcher !Current_Path!!File_Name_%%F_Page_%CurrentPage%!
						call Windows 5 0 70 22 80 f8 Cigam File Explorer
						call Line 20 5 74 f8
						batbox /c 0xf8 /g 5 20 /a 195
						batbox /c 0xf8 /g 74 20 /a 180
						call Line 2 5 74 f8
						batbox /c 0xf8 /g 5 2 /a 195
						batbox /c 0xf8 /g 74 2 /a 180
						goto :Refresh
					)
				)
			)
		)
		batbox /g !File_TitlePosX_%%F_Page_%CurrentPage%! !File_TitlePosY_%%F_Page_%CurrentPage%! /c 0x!Clr! /d "!File_Name_%%F_Page_%CurrentPage%:~0,7!"
	)
)


set Clr=80
if %x%==72 if %y%==4 (
	set Clr=70
	if %Clic%==1 (
		set/a CurrentPage-=1
		goto :RefreshCurrentPath
	)
)
batbox /g 72 4 /c 0x%Clr% /a 30
set Clr=80
if %x%==72 if %y%==18 (
	set Clr=70
	if %Clic%==1 (
		set/a CurrentPage+=1
		goto :RefreshCurrentPath
	)
)
batbox /g 72 18 /c 0x%Clr% /a 31


set Clr=47
if %y%==0 if %x% geq 72 if %x% leq 74 (
	set Clr=cf
	if %Clic%==1 (
		for /l %%$ in (1,1,3) do (
			batbox /g 72 0 /c 0x47 /d " x " /w 25
			batbox /g 72 0 /c 0xcf /d " x " /w 25
		)
		cls
		color 30
		call TaskBar
		set CallIco=True
		goto:eof
	)
)
batbox /g 72 0 /c 0x%Clr% /d " x "


goto:GetFor

:FormatExt

set Type=%1

set Cnt=0
for /f "delims=" %%$ in ('dir/b AllPrograms') do (
	for /f "delims=" %%_ in ('type AllPrograms\%%$\Extension') do (
		set KnownExt_!Cnt!=%%_
		set ProgOpener_!Cnt!=%%$
		set/a Cnt+=1
	)
)
set/a Cnt-=1

for /l %%$ in (0,1,%Cnt%) do (
	if "!Type!"=="!KnownExt_%%$!" (
		set return=!ProgOpener_%%$!
		goto:eof
	)
)

set return=None

goto:eof

:Prev
set/a DirNbr-=1
set Current_Path=!Dir%DirNbr%!
goto:eof

:SetIco
for /f "delims=" %%$ in ('type CigamIconBank\%1.ico') do set %%$
set File_Ico_%2_Page_%3=!Ico!
goto:eof


