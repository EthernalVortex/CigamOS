set Clr=3f
if not [%5]==[] set Clr=%5
set PosX=%1
set PosY=%2
set /a MaxX=%3+%PosX%
set /a MaxY=%4+%PosY%
for /l %%$ in (%PosX%,1,%MaxX%) do batbox /c 0x%Clr% /g %%$ !PosY! /a 196 /g %%$ !MaxY! /a 196
for /l %%$ in (%PosY%,1,%MaxY%) do batbox /c 0x%Clr% /g !PosX! %%$ /a 179 /g !MaxX! %%$ /a 179
batbox /g %PosX% %PosY% /a 218 /g %PosX% %MaxY% /a 192 /g %MaxX% %PosY% /a 191 /g %MaxX% %MaxY% /a 217
