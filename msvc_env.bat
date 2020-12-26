@echo off

:: Qt
set QT_PATH=%QT_MSVC_HOME%
:: Microsoft Visual C++
set VC_PATH=%VC_HOME%
:: Read more about MSVC++ versions here:
:: https://en.wikipedia.org/wiki/Microsoft_Visual_C%2B%2B
set MSVC_VERSION=14.22
:: Store working directory
set "WORKING_DIR=%cd%"

echo[
echo Using:
echo  - Qt: %QT_PATH%
echo  - Microsoft Visual C++: %VC_PATH%
echo  - MSVC++ version: %MSVC_VERSION%

:: Qt environment
echo[
call "%QT_PATH%\bin\qtenv2.bat"

:: Microsoft Visual C++ environment
echo[
call "%VC_PATH%\vcvarsall.bat" x64 -vcvars_ver=%MSVC_VERSION%

:: Navigate back to working directory
cd "%WORKING_DIR%"
