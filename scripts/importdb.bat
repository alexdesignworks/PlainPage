@ECHO OFF
CLS
rem Import DB to dump
rem Modified: 09/08/2011
rem by Alex Skrypnyk
rem Version 1.2
rem --------------------------------------
rem 
rem Usage:
rem importdb.bat dump.gz - imports specified dump
rem importdb.bat - imports default dump wich is taked from DB name.
rem 
rem How it works:
rem  - Script tries to use project name as DB name, unless explicitly specified.
rem  - Script tries to use project name as DB username/password, unless explicitly specified.
rem  - Script tries to find your current copy of mysql.exe under c:\wamp directory.
rem Prerequisites:
rem - this script must be located in subdir of main project dir (like \db)
rem - gzip.exe (http://gnuwin32.sourceforge.net/packages/gzip.htm) with this script
rem - the database must be 
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
rem Path to the dir to output archive. Defaults to current directory.
SET DIRPATH=%~dp0
rem Default input dump filename
SET DUMPGZ=%DIRPATH%%DBNAME%.sql.gz
rem Set gzip full path. Need to keep gzip in double quotes to prevent inline execution.
SET GZIP="%~dp0gzip.exe"
rem Temp unzipped filename
SET DUMPTEMPNAME=%TEMP%\db.sql

rem Path to mysql.exe
for /f %%A in ('dir /s /a /b c:\wamp\mysql.exe') do SET MYSQL=%%A
rem --------------------------------------
rem Start processing
echo Script started
echo.
echo.

rem Check input params
if [%1] NEQ [] (
  SET DUMPGZ=%1
) else (
  echo Using default dump %DUMPGZ%
  echo.
)

rem Check that input dump file exists
if not exist %DUMPGZ% (
  echo Specified dump file %DUMPGZ% does not exist.
  echo.
  echo Nothing to import.
  echo.
  goto end
)

rem Uzip file into temp file.
rem gzip will produce an error "Invalid argument" which is normal behavior.
%GZIP% -dkcfq %DUMPGZ% > %DUMPTEMPNAME%
rem Make sure that file was unzipped correctly
if not exist %DUMPTEMPNAME% (
  echo Error occured while processing temporary file 
  echo %DUMPTEMPNAME%.
  echo.
  goto end
) else (
  echo Processing temporary dump file 
  echo %DUMPTEMPNAME%
  echo.
)
echo.
echo.

rem Start import
echo Started import of file
echo %DUMPGZ%
echo.
echo Please wait for completion.
echo.

%MYSQL% --host=localhost --user=%DBUSER% --password=%DBPASS% --database=%DBNAME% < %DUMPTEMPNAME%

echo Completed import of 
echo %DUMPGZ%
echo.

rem Delete temp file
del %DUMPTEMPNAME%

:end
echo.
echo Script finished
ENDLOCAL