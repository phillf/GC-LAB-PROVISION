@echo off
set _SCRIPT_DRIVE=%~d0
set _SCRIPT_PATH=%~p0

REM Check Windows Version
ver | findstr /i "5\.1\." > nul
IF %ERRORLEVEL% EQU 0 goto ver_XP
ver | findstr /i "6\.0\." > nul
IF %ERRORLEVEL% EQU 0 goto ver_Vista
ver | findstr /i "6\.1\." > nul
IF %ERRORLEVEL% EQU 0 goto ver_Win7
goto warn_and_exit

:ver_Win7
:Run Windows 7 specific commands here
REM echo OS Version: Windows 7 (debug line) >
%~d0\Scripts\boxstarter\setup.bat
goto general_Commands

:ver_Vista
:Run Windows Vista specific commands here
REM echo OS Version: Windows Vista (debug line)
@%~d0\Scripts\boxstarter\setup.bat
goto general_Commands

:ver_XP
:Run Windows XP specific commands here
@echo OS Version: Windows XP (debug line)
@%~d0\Installers\LABINSTALL.exe
goto general_Commands

:warn_and_exit
echo Machine OS cannot be determined.
pause

:general_Commands
echo.
echo.
@echo Setting OpenDNS Family Sheild DNS Servers
echo.
@echo Adding Setting OpenDNS Family Sheild to Local Area Connection...
@netsh interface ip set dns "Local Area Connection" static 208.67.222.222
echo.
@echo Adding Setting OpenDNS Family Sheild to Local Area Connection...
@netsh interface ip add dns name="Local Area Connection" addr=208.6.220.220
echo.
@echo Adding OpenDNS Family Shield DNS Servers: DONE
echo.
echo.
goto install_Dell_Prompt

:install_Dell_Prompt
@set /P c=Install Dell System Detect[Y/N]?
if /I "%c%" == "N" goto end
REM echo Install Dell System Detect
@%~d0\Installers\DellSystemDetect.exe
goto end

:end
@echo This machine is now at baseline. Please finish configuring manually.
pause
exit