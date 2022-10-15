@echo off
set Pile=
setlocal enabledelayedexpansion
for /l %%$ in (1,1,255) do (
	
	set Pile=!Pile!,%%$
	)
)
echo %Pile%>>type.txt
start type.txt
