@echo off

\Windows\OEM\SilentProvisionerT.exe

REM System apps
powershell -ExecutionPolicy Bypass -File \Windows\OEM\Applications\SPApps.ps1

cmd.exe /c \Windows\OEM\IHVSettingsFirstLogon.cmd

\Windows\OEM\SilentProvisionerT.exe 1