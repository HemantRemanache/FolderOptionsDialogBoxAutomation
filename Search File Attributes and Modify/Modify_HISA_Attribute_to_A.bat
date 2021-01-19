SETLOCAL ENABLEDELAYEDEXPANSION
CHCP 850
takeown /f %~dp0 /r /d y
for /f "delims=" %%s in ('DIR /B /S /ASH-D') do (
   TAKEOWN /F "%%s" 
   attrib -h -i -s "%%s"
   attrib +a "%%s"
)

pause
:End
