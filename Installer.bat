@echo off
title Shadow's Installer
set /p program="Installer>Install "

curl https://shadowocto.github.io/Installer/Main.raw> C:\temp\Installer.bat && start C:\temp\Installer.bat %program% && timeout /t 1 && del C:\temp\Installer.bat
exit
