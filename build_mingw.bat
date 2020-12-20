@echo off
REM Store current working directory
set "workingDirectory=%cd%"

call clean.bat

echo -----------------------------------
echo    Setting up the environment...   
echo -----------------------------------
call set_mingw_env.bat
if NOT %ERRORLEVEL% EQU 0 goto :ErrorOccured

rmdir /Q/S build 2> nul
mkdir build
cd build

echo[
echo ----------------------
echo    Running CMake...   
echo ----------------------
REM `%*` redirects passed in arguments 
REM Example: `build_mingw.bat -DCMAKE_BUILD_TYPE=RELEASE`
cmake -G "MinGW Makefiles" %* ..
if NOT %ERRORLEVEL% EQU 0 goto :ErrorOccured

echo[
echo ------------------
echo    Compiling...   
echo ------------------
echo Using %NUMBER_OF_PROCESSORS% threads.
echo[
mingw32-make -j %NUMBER_OF_PROCESSORS%
if NOT %ERRORLEVEL% EQU 0 goto :ErrorOccured

echo[
echo ---------------------
echo    Build finished!   
echo ---------------------
REM Navigate back to working directory
cd %workingDirectory%
goto :eof

:ErrorOccured
echo[
echo ---------------------
echo    Error occurred!   
echo ---------------------
REM Navigate back to working directory
cd %workingDirectory%
goto :eof
