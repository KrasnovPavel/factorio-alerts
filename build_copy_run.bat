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

if NOT ["%errorlevel%"]==["0"] (
    pause
    exit /b %errorlevel%
)

copy %modName%_%version%.zip C:\Spiele\Factorio_NonSteam\mods_test /y

cd ..

c:
cd C:\Spiele\Factorio_NonSteam\bin\x64\
call factorio.exe --config=C:\Spiele\Factorio_NonSteam\config\config.ini --load-game "Alerts Test"

e:

if NOT ["%errorlevel%"]==["0"] (
    pause
    exit /b %errorlevel%
)