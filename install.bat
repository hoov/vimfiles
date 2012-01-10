@echo off
SET VIMSRC=%~dp0

FOR %%f IN (gvimrc vimrc) DO (
    del "%USERPROFILE%\_%%f"
    mklink "%USERPROFILE%\_%%f" "%VIMSRC%%%f"
)

SET VIMFILES=%USERPROFILE%\vimfiles

IF NOT EXIST "%VIMFILES%" (
    mkdir "%VIMFILES%"
)

FOR %%f IN (autoload bundle colors compiler indent syntax) DO (
    IF NOT EXIST "%VIMFILES%\%%f" (
        mklink /J "%VIMFILES%\%%f" "%VIMSRC%%%f"
    ) ELSE (
        echo %VIMFILES%\%%f already exists; skipping
    )
)
