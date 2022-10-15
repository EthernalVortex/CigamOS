Set VrStr=%1
if not "%2"=="" set VrStr=%VrStr% %2
if not "%3"=="" set VrStr=%VrStr% %3
if not "%4"=="" set VrStr=%VrStr% %4
if not "%5"=="" set VrStr=%VrStr% %5
if not "%6"=="" set VrStr=%VrStr% %6
if not "%7"=="" set VrStr=%VrStr% %7
if not "%8"=="" set VrStr=%VrStr% %8
if not "%9"=="" set VrStr=%VrStr% %9
set VrLgr=0
:Loop
If "%VrStr%" EQU "" set "return=%VrLgr%"&goto:End
Set "VrStr=%VrStr:~0,-1%"
Set /a VrLgr+=1
Goto :Loop
:End