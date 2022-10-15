set/p DeskProg=<User\%userN%\Desktop
set IcoTotalNbr=0
:Str

for %%$ in (%DeskProg%) do set/a IcoTotalNbr+=1
set x_=5
set y_=1
set x_max=25
for /l %%$ in (1,1,%IcoTotalNbr%) do (
	set Ico_%%$_Emp_X=!x_!
	set Ico_%%$_Emp_Y=!y_!
	set Ico_%%$_Stat=Empty
	set/a X_+=12
	if !x_!==77 (
		set/a y_+=9
		set x_=5
	)
)
set IcoNbr=0
for %%$ in (%DeskProg%) do (
	set/a IcoNbr+=1
	FOR /F "delims=" %%a IN (!ProgPath!\%%$.ini) do set %%a
	set Ico_!IcoNbr!_Stat=!ProgramName!
	set Ico_!IcoNbr!_Path=!programPath!
	for /l %%£ in (!IcoNbr!,1,!IcoNbr!) do (
		set Ico_!IcoNbr!_Aff=Batbox /o !Ico_%%£_Emp_X! !Ico_%%£_Emp_Y! !ProgramIco!
		set/a Ico_!IcoNbr!_AffStat=!Ico_%%£_Emp_Y!+7
		set Ico_!IcoNbr!_AffStat=!Ico_%%£_Emp_X! !Ico_%%£_AffStat!
	)
)
For /l %%$ in (1,1,%IcoNbr%) do (
	!Ico_%%$_Aff!
	set Clr=37
	if "!Ico_%%$_Stat!"==" Empty " set Clr=3b
	batbox /c 0x!Clr! /g !Ico_%%$_AffStat! /d "!Ico_%%$_Stat!"
)