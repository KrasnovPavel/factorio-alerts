del versions\AlertsList2_1.2.0.zip
cd src
xcopy *.* ..\versions\AlertsList2_1.2.0 /s /y
cd ..\versions
"C:\Program Files\7-Zip\7z" a AlertsList2_1.2.0.zip AlertsList2_1.2.0\*.* -r
pause