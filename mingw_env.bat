@echo off

:: Qt
set QT_PATH=%QT_MINGW_HOME%
:: Store working directory
set "WORKING_DIR=%cd%"

echo[
echo Using:
echo  - Qt: %QT_PATH%

:: Qt environment
echo[
call "%QT_PATH%\bin\qtenv2.bat"

:: Navigate back to working directory
cd "%WORKING_DIR%"
