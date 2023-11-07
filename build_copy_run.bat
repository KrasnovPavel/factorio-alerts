set modName="AlertsList2"
set version="1.3.2"

del versions\%modName%_%version%.zip
cd src
xcopy *.* ..\versions\%modName%_%version% /s /y
cd ..\versions
"C:\Program Files\7-Zip\7z" a %modName%_%version%.zip %modName%_%version%\*.* -r

if NOT ["%errorlevel%"]==["0"] (
    pause
    exit /b %errorlevel%
)

copy %modName%_%version%.zip C:\Spiele\Factorio_NonSteam\mods_test /y

c:
cd C:\Spiele\Factorio_NonSteam\bin\x64\
call Factorio_local_mods_test.bat

if NOT ["%errorlevel%"]==["0"] (
    pause
    exit /b %errorlevel%
)