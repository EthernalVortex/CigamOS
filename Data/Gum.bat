set Clr=%1
set X1=%2
set/a X2=%2+%4
set Y1=%3
set/a Y2=%3+%5
set "Esp="
for /l %%$ in (1,1,%4) do set Esp= !Esp!
for /l %%Y in (%Y1%,1,%Y2%) do batbox /g !X1! %%Y /c 0x!Clr!0 /d "!Esp!"