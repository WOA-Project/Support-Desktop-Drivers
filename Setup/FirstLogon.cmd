@echo off

REM System apps
dism.exe /Online /Add-ProvisioningPackage /PackagePath:%SystemDrive%\Windows\Provisioning\Packages\SPApps.ppkg
powershell -ExecutionPolicy Bypass -File \Windows\OEM\SPApps.ps1

cmd.exe /c \Windows\OEM\IHVSettingsFirstLogon.cmd