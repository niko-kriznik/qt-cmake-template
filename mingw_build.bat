@echo off
setlocal

set BUILD_DIR=build
:: Store working directory
set "WORKING_DIR=%cd%"

cls
call clean.bat

echo -----------------------------------
echo    Setting up the environment...   
echo -----------------------------------
call mingw_env.bat
if not %ERRORLEVEL% EQU 0 goto :ErrorOccured

if exist %BUILD_DIR% rmdir %BUILD_DIR% /S /Q > nul
mkdir    %BUILD_DIR%                         > nul
cd       %BUILD_DIR%                         > nul
if not %ERRORLEVEL% EQU 0 goto :ErrorOccured

echo[
echo ----------------------
echo    Running CMake...   
echo ----------------------
:: `%*` redirects passed in arguments 
:: Example: `mingw_build.bat -DCMAKE_BUILD_TYPE=RELEASE`
cmake -G "MinGW Makefiles" %* ..
if not %ERRORLEVEL% EQU 0 goto :ErrorOccured

echo[
echo -------------------------------
echo    Compiling (%NUMBER_OF_PROCESSORS% threads)...   
echo -------------------------------
echo[
mingw32-make -j %NUMBER_OF_PROCESSORS%
if not %ERRORLEVEL% EQU 0 goto :ErrorOccured

echo[
echo ---------------------
echo    Build finished!   
echo ---------------------
:: Navigate back to working directory
cd %WORKING_DIR%

endlocal
pause
goto :eof

:ErrorOccured
echo[
echo ---------------------
echo    Error occurred!   
echo ---------------------
:: Navigate back to working directory
cd %WORKING_DIR%

endlocal
pause
goto :eof
