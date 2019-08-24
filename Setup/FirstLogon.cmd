@echo off

\Windows\OEM\SilentProvisionerT.exe

REM System apps
dism.exe /Online /Add-ProvisioningPackage /PackagePath:%SystemDrive%\Windows\Provisioning\Packages\SPApps.ppkg
powershell -ExecutionPolicy Bypass -File \Windows\OEM\Applications\SPApps.ps1

cmd.exe /c \Windows\OEM\IHVSettingsFirstLogon.cmd

\Windows\OEM\SilentProvisionerT.exe 1