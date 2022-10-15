call Windows 5 1 70 19 80 f8 Computer

for /f "delims=" %%$ in ('type CigamIconBank\Driver.ico') do set %%$
set Driver_Ico=!Ico!
set DrvPile=a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z
set DrvPile=A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z

batbox /g 7 19 /c 0xb9 /d "                                                                  "
batbox /g 7 19 /c 0xb9 /d "Driver Name..."
batbox /g 69 19 /c 0x9b /d "(_:)"

call Line 11 6 73 f7

:DriverMenu




batbox /g 10 10 /c 0xf0

set DriveNbr=0
for %%$ in (%DrvPile%) do (
	set Drive=%%$
	set Drive_%%$=False
	if exist !Drive!: (
		set Drive_%%$=!Drive!:
		Dir %%$: > Name.txt
        Set /P name=<Name.txt
        Set name=!name:~39!
		REM set "Drive_Name_%%$=Lecteur !Drive_%%$!"
		if "!Drive_%%$!"=="D:" set name=DVD/RW '!name!'
		set "Drive_Name_%%$=!name!
		REM batbox /d "Drive !Drive!: found, "
		set/a DriveNbr+=1
	)
)

REM batbox /c 0xf6 /d "(%DriveNbr%) found(s)."

set x_=7
set y_=11

REM batbox /o %x_% %y_% %Driver_Ico%


for %%$ in (%DrvPile%) do (
	if not !Drive_%%$!==False if not !Drive_%%$!==C: (
		
		set Drive_%%$_MinX=!x_!
		set/a Drive_%%$_MaxX=!x_!+6
		set Drive_%%$_MinY=!y_!
		set/a Drive_%%$_MaxY=!y_!+6
		set/a Drive_%%$_TitlePosY=!Drive_%%$_MaxY!
		set/a Drive_%%$_TitlePosX=!Drive_%%$_MinX!
		set/a Drive_%%$_LetterPosX=!x_!+2
		set/a Drive_%%$_LetterPosY=!y_!+4
		batbox /o !x_! !y_! !Driver_Ico!
		batbox /g !Drive_%%$_LetterPosX! !Drive_%%$_LetterPosY! /c 0x84 /d "(!Drive_%%$:~0,1!)"
		REM batbox /g !Drive_%%$_TitlePosX! !Drive_%%$_TitlePosY! /c 0xf0 /d "!Drive_Name_%%$!"
		set/a x_+=8
	)
)

set x_=7
set y_=4
set Drive_Name_C=Hard Disk
set Drive_C_MinX=!x_!
set/a Drive_C_MaxX=!x_!+6
set Drive_C_MinY=!y_!
set/a Drive_C_MaxY=!y_!+6
set /a Drive_C_TitlePosY=!Drive_C_MaxY!
set /a Drive_C_TitlePosX=!Drive_C_MinX!
set/a Drive_C_LetterPosX=!x_!+2
set/a Drive_C_LetterPosY=!y_!+4
batbox /o !x_! !y_! !Driver_Ico!
batbox /g !Drive_C_LetterPosX! !Drive_C_LetterPosY! /C 0x84 /d "(!Drive_C:~0,1!)"
REM batbox /g !Drive_C_TitlePosX! !Drive_C_TitlePosY! /C 0xf0 /d "!Drive_Name_C!"


:GetFor

batbox /c 0xf8 /g 6 3 /d "Cigam" /a 169 /d " OS  -  Copyright (C) MagicDos 2014"


FOR /F "tokens=1,2,3 delims=:" %%A in ('BatBox /y') DO (
SET y=%%B
SET x=%%A
set clic=%%C
)

set Clr=47
if %y%==1 if %x% geq 72 if %x% leq 74 (
	set Clr=cf
	if %Clic%==1 (
		for /l %%$ in (1,1,3) do (
			batbox /g 72 1 /c 0x47 /d " x " /w 25
			batbox /g 72 1 /c 0xcf /d " x " /w 25
		)
		cls
		color 30
		call TaskBar
		set CallIco=True
		goto:eof
	)
)
batbox /g 72 1 /c 0x%Clr% /d " x "

set Clr=f9
if %y%==3 if %x% geq 55 if %x% leq 72 (
	set Clr=fc
	if %Clic%==1 (
		batbox /g 55 3 /c 0xf2 /d "www.magicdos.fr" /w 250
		start http://www.magicdos.fr/
	)
)

batbox /g 55 3 /c 0x%Clr% /d "www.magicdos.96.lt"


for %%$ in (%DrvPile%) do (
	if not !Drive_%%$!==False (
		set Clr=f0
		set name=!Drive_Name_%%$!
		call VarCnt !name!
		if !return! Gtr 7 (
			set name=!name:~0,6!~
		)
		if !x! geq !Drive_%%$_MinX! if !x! leq !Drive_%%$_MaxX! if !y! geq !Drive_%%$_MinY! if !y! leq !Drive_%%$_MaxY! (
			set Clr=20
			if !Clic!==1 (
				batbox /g !Drive_%%$_TitlePosX! !Drive_%%$_TitlePosY! /c 0x2e /d "!name!"
				call AllPrograms\FileExplorer\Launcher !Drive_%%$!\
				REM call AllPrograms\FileExplorer\Launcher %UserProfile%\Desktop\
				cls
				color 30
				call TaskBar
				set CallIco=True
				goto:eof
			)
			batbox /g 7 19 /c 0xb9 /d "                                                                  "
			batbox /g 7 19 /c 0xb9 /d "!Drive_Name_%%$!" 
			batbox /g 69 19 /c 0x9b /d "(!Drive_%%$!)"
		)
		
		batbox /g !Drive_%%$_TitlePosX! !Drive_%%$_TitlePosY! /c 0x!Clr! /d "!name!"
	)
)




















goto :GetFor