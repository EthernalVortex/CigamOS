setlocal enabledelayedexpansion
set PosX=%1
set PosY=%2
set Larg=%3
set Htr=%4
set TitleBarColor=%5
set WindowsFonColor=%6
set WindowsTitle=%7
set WindowsTitle=!WindowsTitle! %8
set WindowsTitle=!WindowsTitle! %9

set LongerSprite=
for /l %%$ in (1,1,%Larg%) do set LongerSprite= !LongerSprite!


set/a Debut=%PosY%
set/a Fin=%PosY%+%Htr%

For /l %%$ in (%debut%,1,%Fin%) do batbox /g !PosX! %%$ /c 0x%WindowsFonColor% /d "!LongerSprite!"
set/a Larg_=%Larg%-1
call Cadre %PosX% %PosY% %Larg_% %Htr% %WindowsFonColor%
batbox /g %PosX% %PosY% /c 0x%TitleBarColor% /d "%LongerSprite%"
batbox /g %PosX% %PosY% /c 0x%TitleBarColor% /d "%WindowsTitle%"

set/a CrossPos=(%PosX%+%Larg%)-3

batbox /g %CrossPos% %PosY% /c 0x47 /d " x "