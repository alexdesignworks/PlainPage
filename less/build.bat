@echo off
rem lessc plainpage.less ../css/plainpage.css 
call lessc plainpage.less plainpage.css
if %ERRORLEVEL% EQU 0 (
    echo === PASS ===
) else (
    echo === FAIL ===
	pause
)