@echo off
set qt=%QT_MSVC_HOME%
set vc=%VC_HOME%
REM Store current working directory
set "workingDirectory=%cd%"

echo[
echo Using:
echo  - Qt: %qt%
echo  - Visual Studio: %vc%

REM Qt environment
echo[
call "%qt%\bin\qtenv2.bat"

REM Visual Studio environment
echo[
call "%vc%\vcvarsall.bat" x64 -vcvars_ver=14.22

REM Navigate back to working directory
cd "%workingDirectory%"
