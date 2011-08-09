@ECHO OFF
CLS
rem Export DB to dump
rem Modified: 09/08/2011
rem by Alex Skrypnyk
rem Version 1.2
rem --------------------------------------
rem 
rem How it works:
rem  - Script tries to use project name as DB name, unless explicitly specified.
rem  - Script tries to use project name as DB username/password, unless explicitly specified.
rem  - Script tries to find your current copy of mysqldump.exe under c:\wamp directory.
rem  - Script will include DROP of database to the dump.
rem Prerequisites:
rem - this script must be located in subdir of main project dir (like \db)
rem - gzip.exe (http://gnuwin32.sourceforge.net/packages/gzip.htm) with this script
rem 
rem --------------------------------------

SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

rem ============== SETTINGS ==============
rem SET DBNAME=databasename
SET DBUSER=drupal
SET DBPASS=drupal
rem ========== END OF SETTINGS ===========

rem --------------------------------------
rem DO NOT CHANGE ANYTHING BELOW THIS LINE 
rem UNLESS YOU KNOW WHAT YOU ARE DOING
rem --------------------------------------

rem Gather all variables
rem Get DB name from project directory name, if not explicitly set in settings
if "%DBNAME%" == "" (
  for %%A in ("%~dp0..") do SET DBNAME=%%~nA
)
rem Set username as DB name, if not set
if "%DBUSER%" == "" (
  SET DBUSER=%DBNAME%
)
rem Set password as DB name, if not set
if "%DBPASS%" == "" (
  SET DBPASS=%DBNAME%
)

SET DUMPPATH=%TEMP%
rem Set gzip full path. Need to keep gzip in double quotes to prevent inline execution.
SET GZIP="%~dp0gzip.exe"


rem Path to the dir to output archive. Taken relative to script's dir.
SET OUTPATH=%~dp0
rem Get MYSQLDUMP filename
for /f %%A in ('dir /s /a /b c:\wamp\mysqldump.exe') do SET MYSQLDUMP=%%A

rem Set MySQL params string
SET MYSQLDUMPPARAMS=--databases %DBNAME% --user=%DBUSER% --password=%DBPASS% --add-drop-database --add-drop-table

rem Getting current date/time
FOR /f "tokens=1,2,3,4 delims=/ " %%a IN ('date /t') DO (
  SET NOWDATE=%%d%%b%%c
)
FOR /f "tokens=1,2,3 delims=: " %%a IN ('time /t') DO (
  SET NOWTIME=%%a%%b%%c
)
SET NOW=%NOWDATE%_%NOWTIME%

SET DUMPNAME=%DUMPPATH%\%DBNAME%_%NOW%.sql

rem Start processing
echo Script started
echo.
echo.
echo Starting database '%DBNAME%' dumping to 
echo %DUMPNAME%
echo.
%MYSQLDUMP% %MYSQLDUMPPARAMS%>%DUMPNAME%
echo Finished dumping database '%DBNAME%' to 
echo %DUMPNAME%
echo.
echo.
echo Starting archiving 
echo %DUMPNAME%
echo.

SET ZIPNAME=%DUMPPATH%\%DBNAME%.sql.gz

rem gzip will produce an error "Invalid argument" which is normal behavior.
%GZIP% -fqc %DUMPNAME%>%ZIPNAME%

echo Archived as 
echo %ZIPNAME%
echo.

echo Copying packed file 
echo %ZIPNAME% 
echo to 
echo %OUTPATH%
xcopy %ZIPNAME% %OUTPATH% /Y /R /Q
echo.

echo Cleaning up...
del /F /Q %DUMPNAME%
del /F /Q %ZIPNAME%

:end
echo.
echo Script finished
ENDLOCAL