@ECHO OFF
IF NOT "%1"=="" GOTO ADDV
SET VAR=
FOR /F %%I IN ('DIR *.TXT /B /O:D') DO CALL %0 %%I
SET VAR
GOTO END

:ADDV
SET VAR=%VAR%!%1

:END
