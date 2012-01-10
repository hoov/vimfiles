@echo on
SET VIMSRC=%~dp0

FOR %%f IN (gvimrc vimrc) DO (
    del "%USERPROFILE%\_%%f"
    mklink /H "%USERPROFILE%\_%%f" "%VIMSRC%%%f"
)

SET VIMFILES=%USERPROFILE%\vimfiles

IF NOT EXIST "%VIMFILES%" (
    mkdir "%VIMFILES%"
)

FOR %%f IN (autoload bundle colors compiler indent syntax) DO (
    mklink /J "%VIMFILES%\%%f" "%VIMSRC%%%f"
)
