@echo off
set app=QtCMakeExample

REM Binaries
rmdir /Q/S build 2> nul
del bin\%app%.exe 2> nul
REM MSVC files
del bin\%app%.exe.manifest 2> nul
del bin\%app%.ilk 2> nul
del bin\%app%.pdb 2> nul
