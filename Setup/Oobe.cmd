@echo off

REM Second boot drivers
\Windows\OEM\devcon.exe update \Windows\OEM\Drivers\qcmbb.wp8994.inf QCMS\QCOM0EA0
\Windows\OEM\devcon.exe update \Windows\OEM\Drivers\ChargeArbitration.inf Root\CAD
for /f "delims=*" %%f in ('dir /b /s \Windows\System32\DriverStore\FileRepository\qcxhcifilter*.inf') do \Windows\OEM\devcon.exe update %%f URS\QCOM24B6^&HOST

devcon status @QCMS\QCOM0EA0\*1 | findstr "43" > nul
if %errorlevel%==0 (
    \Windows\OEM\devcon.exe remove @QCMS\QCOM0EA0\*1
    \Windows\OEM\devcon.exe dp_add \Windows\OEM\Drivers\qcmbbnull.inf
    \Windows\OEM\devcon.exe rescan
)

devcon status @QCMS\QCOM0EA0\*0 | findstr "43" > nul
if %errorlevel%==0 (
    \Windows\OEM\devcon.exe remove @QCMS\QCOM0EA0\*0
    \Windows\OEM\devcon.exe dp_add \Windows\OEM\Drivers\qcmbbnull.inf
    \Windows\OEM\devcon.exe rescan
)

cmd.exe /c \Windows\OEM\IHVDriversOobe.cmd