set _SCRIPT_DRIVE=%~d0 set
set _SCRIPT_PATH=%~p0

REM Check Windows Version
ver | findstr /i "5\.0\." > nul
IF %ERRORLEVEL% EQU 0 goto ver_2000
ver | findstr /i "5\.1\." > nul
IF %ERRORLEVEL% EQU 0 goto ver_XP
ver | findstr /i "5\.2\." > nul
IF %ERRORLEVEL% EQU 0 goto ver_2003
ver | findstr /i "6\.0\." > nul
IF %ERRORLEVEL% EQU 0 goto ver_Vista
ver | findstr /i "6\.1\." > nul
IF %ERRORLEVEL% EQU 0 goto ver_Win7
goto warn_and_exit

:ver_Win7
:Run Windows 7 specific commands here
REM echo OS Version: Windows 7 (debug line)

goto general_Commands

:ver_Vista
:Run Windows Vista specific commands here
REM echo OS Version: Windows Vista (debug line)
goto general_Commands

:ver_2003
:Run Windows Server 2003 specific commands here
REM echo OS Version: Windows Server 2003 (debug line)
goto general_Commands

:ver_XP
:Run Windows XP specific commands here
REM echo OS Version: Windows XP (debug line)
%~d0\Installers\PowerShellXP.exe /norestart /passive
goto general_Commands

:ver_2000
:Run Windows 2000 specific commands here
REM echo OS Version: Windows 2000 (debug line)
goto general_Commands

:warn_and_exit
echo Machine OS cannot be determined.
pause

:general_Commands
netsh interface ip set dns "Local Area Connection" static 208.67.222.222
netsh interface ip add dns name="Local Area Connection" addr=208.67.220.220
%~d0\Scripts\boxstarter\setup.bat
%~d0\Installers\LABINSTALL.exe

goto install_Dell_Prompt

:install_Dell_Prompt
set /P c=Install Dell System Detect[Y/N]?
if /I "%c%" EQU "Y" goto :install_DellSystemDetect
:install_DellSystemDetect
REM echo Install Dell System Detect
%~d0\Installers\DellSystemDetect.exe

if /I "%c%" EQU "N" goto :end


:end
pause
exit