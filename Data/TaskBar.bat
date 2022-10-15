for /l %%$ in (1,1,4) do !TB%%$!
batbox /g 0 22 /c 0x8f /d "          "
batbox /g 0 23 /c 0x8f /d " S T A R T"
batbox /g 0 24 /c 0x8f /d "          "
call Column 12 22 24 8f
call Column 71 22 24 8f
batbox /g 73 23 /c 0x8f /d "%Time:~0,5%"

call Time 33

if %y% geq 22 if %x% geq 71 call Time 6f&if %Clic%==1 call TimeWindows.bat&set CallIco=True

if %y% geq 22 if %x% leq 12 (
	batbox /g 0 22 /c 0x7f /d "            "
	batbox /g 0 23 /c 0x7f /d " S T A R T  "
	batbox /g 0 24 /c 0x7f /d "            "
	if %Clic%==1 (
		call :StartMenu
		for /l %%$ in (12,1,21) do batbox /c 0x33 /g 0 %%$ /d " !Esp!"
		set CallIco=True
		!Act!
	)
)
goto :End


:StartMenu

set "Esp=             "
for /l %%$ in (12,1,21) do batbox /c 0x80 /g 0 %%$ /d " !Esp!"

call Cadre 0 12 13 9 8f
batbox /c 0x8e /g 1 13 /d " %UserN%"
call Line 14 0 12 8f
batbox /g 0 14 /a 195 /g 13 14 /a 180

batbox /g 1 16 /d "All Programs"
batbox /g 1 18 /d "  Settings  "
batbox /g 1 20 /d "    Exit    "

:GetFor
FOR /F "tokens=1,2,3 delims=:" %%A in ('BatBox /y') DO (
SET y=%%B
SET x=%%A
set clic=%%C
)
if %Clic%==1 (
	if %x% Geq 14 goto:eof
	if %y% leq 11 goto:eof
	if %y% geq 21 goto:eof
)
set Clr=8f
if %y%==16 (
	set Clr=b0
	if %Clic%==1 (
		batbox /c 0xb9 /g 1 16 /d "All Programs" /w 150
	)
)
batbox /c 0x%Clr% /g 1 16 /d "All Programs"

set Clr=8f
if %y%==18 (
	set Clr=b0
	if %Clic%==1 (
		batbox /c 0xb9 /g 1 18 /d "  Settings  " /w 150
	)
)
batbox /c 0x%Clr% /g 1 18 /d "  Settings  "

set Clr=8f
if %y%==20 (
	set Clr=b0
	if %Clic%==1 (
		batbox /c 0xb9 /g 1 20 /d "    Exit    " /w 150
		set Act=call :QuitMenu
		goto:eof
	)
)
batbox /c 0x%Clr% /g 1 20 /d "    Exit    "

goto :GetFor

:QuitMenu



call Windows 30 7 22 7 80 f Exit Menu

batbox /g 31 9 /c 0xf0 /d "   Close Account    "
batbox /g 31 11 /c 0xf0 /d " Shutdown Computer  "
batbox /g 31 13 /c 0xf0 /d " Go Back To Windows "

:ForGet
FOR /F "tokens=1,2,3 delims=:" %%A in ('BatBox /y') DO (
SET y=%%B
SET x=%%A
set clic=%%C
)

if %x% geq 30 if %x% leq 50 (
	set Clr=f0
	if %y%==9 (
		set Clr=b0
		if %Clic%==1 (
			batbox /g 31 9 /c 0xb9 /d "   Close Account    " /w 150
			set Logoff=True
			goto:eof
		)
	)
	batbox /g 31 9 /c 0x!Clr! /d "   Close Account    "
	
	set Clr=f0
	if %y%==11 (
		set Clr=b0
		if %Clic%==1 (
			batbox /g 31 11 /c 0xb9 /d " Shutdown Computer  " /w 150
			shutdown -s -t 00
		)
	)
	batbox /g 31 11 /c 0x!Clr! /d " Shutdown Computer  "
	
	set Clr=f0
	if %y%==13 (
		set Clr=b0
		if %Clic%==1 (
			set "Espace=        "
			batbox /g 31 13 /c 0xb9 /d " Go Back To Windows " /w 150
			cls
			color 07
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
			echo !Espace!                 * THANKS FOR USING CIGAM OS *
			echo.
			echo.
			echo.
			echo !Espace!                    [ PRESS A KEY TO QUIT ]
			pause>nul
			exit

		)
	)
	batbox /g 31 13 /c 0x!Clr! /d " Go Back To Windows "
)

set Clr=47
if %y%==7 if %x% geq 49 if %x% leq 51 (
	set Clr=cf
	if %Clic%==1 (
		batbox /g 49 7 /c 0xc9 /d " x " /w 150
		set "Esp=                      "
		for /l %%$ in (7,1,14) do batbox /g 30 %%$ /c 0x33 /d "!Esp!"
		goto:eof
	)
)
batbox /g 49 7 /c 0x%Clr% /d " x "

goto :ForGet






:End
