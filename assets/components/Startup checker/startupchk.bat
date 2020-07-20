@echo off
:Mane
title ACT Baseboard Checker
goto :CHKBaseboard1

:CHKBaseboard1
rem This will check ACT Baseboard's state

:SYSFILECHK
rem This will check for corrupted or missing ACT Baseboard system files (not Windows itself).


:SFCHK1
if exist "%systemdrive%\BaseboardOE\System\baseboard.vbs" (
	goto :SFCHK2
) else (
	startup.chkBaseboard.corrupt.vbs
	goto :END
)

:SFCHK2
if exist "%systemdrive%\BaseboardOE\cpl.applet" (
	goto :SFCHK3
) else (
	startup.chkBaseboard.corrupt.vbs
	goto :END
)

:SFCHK3
if exist "%systemdrive%\BaseboardOE\System\baseboardcatalog.exe" (
	goto :SFCHK4
) else (
	startup.chkBaseboard.corrupt.vbs
	goto :END
)

:SFCHK4
if exist "%systemdrive%\BaseboardOE\System\commoner.exe" (
	goto :SFCHK5
) else (
	startup.chkBaseboard.corrupt.vbs
	goto :END
)

:SFCHK5
if exist "%systemdrive%\BaseboardOE\System\DYNX\shortcutcontroller.exe" (
	goto :SFCHK6
) else (
	startup.chkBaseboard.corrupt.vbs
	goto :END
)

:SFCHK6
if exist "%systemdrive%\BaseboardOE\System\DYNX\startupchk.exe" (
	goto :SFCHK7
) else (
	startup.chkBaseboard.corrupt.vbs
	goto :END
)

:SFCHK7
if exist "%systemdrive%\BaseboardOE\System\moreapps.exe" (
	goto :SFCHK8
) else (
	startup.chkBaseboard.corrupt.vbs
	goto :END
)

:SFCHK8
if exist "%systemdrive%\BaseboardOE\System\OOBE\baseboard.oobe.exe" (
	goto :SFCHK9
) else (
	startup.chkBaseboard.corrupt.vbs
	goto :END
)

:SFCHK9
if exist "%systemdrive%\BaseboardOE\system\OOBE\baseboard.oobe.run.vbs" (
	goto :SFCHK10
) else (
	startup.chkBaseboard.corrupt.vbs
	goto :END
)

:SFCHK10
if exist "%systemdrive%\BaseboardOE\system\ThemeHelper\baseboard.greengrass.vbs" (
	goto :SFCHK11
) else (
	startup.chkBaseboard.corrupt.vbs
	goto :END
)

:SFCHK11
if exist "%systemdrive%\BaseboardOE\system\ThemeHelper\baseboard.nighttime.vbs" (
	goto :SFCHK12
) else (
	startup.chkBaseboard.corrupt.vbs
	goto :END
)

:SFCHK12
if exist "%systemdrive%\BaseboardOE\system\ThemeHelper\switchtoBaseboardDefault.exe" (
	goto :SFCHK13
) else (
	startup.chkBaseboard.corrupt.vbs
	goto :END
)

:SFCHK13
if exist "%systemdrive%\BaseboardOE\system\ThemeHelper\switchtoGreenGrass.exe" (
	goto :SFCHK14
) else (
	startup.chkBaseboard.corrupt.vbs
	goto :END
)

:SFCHK14
if exist "%systemdrive%\BaseboardOE\system\ThemeHelper\switchtoNightTime.exe" (
	goto :SFCHK15
) else (
	startup.chkBaseboard.corrupt.vbs
	goto :END
)

:SFCHK15
if exist "%systemdrive%\BaseboardOE\system\updater.exe" (
	goto :SFCHK16
) else (
	startup.chkBaseboard.corrupt.vbs
	goto :END
)

:SFCHK16
if exist "%systemdrive%\BaseboardOE\system\updater.ini" (
	goto :SFCHK17
) else (
	startup.chkBaseboard.corrupt.vbs
	goto :END
)

:SFCHK17
if exist "%systemdrive%\BaseboardOE\system\res.dll" (
	goto :CHKBaseboard2
) else (
	startup.chkBaseboard.corrupt.vbs
	goto :END
)


:END
exit
