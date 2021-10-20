@echo off
echo *** Loading AutoSub, please wait ...
set API=%~1
set LANG=%~2
set INPUT=%3
set OUTPUT=%4
set REAL_OUTPUT=%5
set AUDITOK_PARAMS=%~6
echo %DATE% %TIME% autosub %API% %LANG% -i %INPUT% -o %OUTPUT% %AUDITOK_PARAMS% > gen.log
rem Append -F txt, if you want a text output
cd autosub
autosub %API% %LANG% -i %INPUT% -o %OUTPUT% %AUDITOK_PARAMS% -nsml