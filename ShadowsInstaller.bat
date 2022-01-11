@echo off
title Shadow's Installer
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
md "C:\Program Files (x86)\ShadowsInstaller"
curl https://shadowocto.github.io/Installer/Installer.bat> C:\Program Files (x86)\ShadowsInstaller\Installer.bat
curl https://shadowocto.github.io/Installer/Install.lnk> C:\Windows\System32\Install.lnk
cls
color 0a
echo Install Complete! Press Win + R and type "Install" to start installing programs.
pause>nul
