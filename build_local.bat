set modName="AlertsList2"
set version="1.2.1"

del versions\%modName%_%version%.zip
cd src
xcopy *.* ..\versions\%modName%_%version% /s /y
cd ..\versions
"C:\Program Files\7-Zip\7z" a %modName%_%version%.zip %modName%_%version%\*.* -r
pause