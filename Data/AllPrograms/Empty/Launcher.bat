call windows 30 3 20 9 80 0 New Program
batbox /c 0x07
batbox /g 31 4&set/p IconN=Icon Name : 
batbox /g 31 6&set/p IconS=Icon Type : 
batbox /g 31 8&set/p IconP=Program Path : 


set/p Var_=<User\%UserN%\Desktop
For %%$ in (%var_%) do if not "%%$"=="Empty" set Var=!Var!,%%$

set Var=%Var%,%IconN%,Empty

echo %Var%>User\%UserN%\Desktop
(
echo ProgramName=%IconN%
echo ProgramIco=%IconS%
echo ProgramPath=%IconP%
)>User\%UserN%\Programs\%IconN%.ini

set CallIco=True

pause

