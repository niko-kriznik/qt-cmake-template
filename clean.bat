@echo off
setlocal

set APP=QtCMakeExample
set BUILD_DIR=build
set BIN_DIR=bin

:: Binaries
if exist %BUILD_DIR%         rmdir %BUILD_DIR% /S /Q > nul
if exist %BIN_DIR%\%APP%.exe del %BIN_DIR%\%APP%.exe > nul
:: MSVC++ files
if exist %BIN_DIR%\%APP%.exe.manifest del %BIN_DIR%\%APP%.exe.manifest > nul
if exist %BIN_DIR%\%APP%.ilk          del %BIN_DIR%\%APP%.ilk          > nul
if exist %BIN_DIR%\%APP%.pdb          del %BIN_DIR%\%APP%.pdb          > nul

endlocal
