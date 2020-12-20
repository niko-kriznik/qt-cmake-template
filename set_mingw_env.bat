@echo off
set qt=%QT_MINGW_HOME%
REM Store current working directory
set "workingDirectory=%cd%"

echo[
echo Using:
echo  - Qt: %qt%

REM Qt environment
echo[
call "%qt%\bin\qtenv2.bat"

REM Navigate back to working directory
cd "%workingDirectory%"
