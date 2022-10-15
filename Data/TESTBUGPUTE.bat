@echo off
setlocal enabledelayedexpansion

set x_=26
set y_=7
set LangPile=fr,en,es,de,it,pt
for %%$ in (%LangPile%) do (
	echo set Lang_!x_!_!y_!=%%$
	set Lang_!x_!_!y_!=%%$
	REM batbox /c 0xf9 /g !x_! !y_! /d "%%$"
	set/a x_+=3
)

set oldx=26
set oldy=7

echo -!Lang_26_6!-
pause