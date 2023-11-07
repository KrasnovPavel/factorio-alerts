@echo off

set modName="AlertsList2"
set version="1.3.3"

del versions\%modName%_%version%.zip /q
del versions\%modName%_%version%\*.* /s /q
rmdir versions\%modName%_%version%\ /s /q

cd src

xcopy *.* ..\versions\%modName%_%version% /s /y /i

cd ..\versions

"C:\Program Files\7-Zip\7z" a %modName%_%version%.zip %modName%_%version%\*.* -r

cd ..

if NOT ["%errorlevel%"]==["0"] (
    pause
    exit /b %errorlevel%
)