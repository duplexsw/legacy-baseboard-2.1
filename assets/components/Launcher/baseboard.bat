@echo off
:INIT
rem The ACT Baseboard initialization will now begin

:SYSFILECHK
rem This will check for corrupted or missing ACT Baseboard system files (not Windows itself).


:SFCHK1
if exist "%systemdrive%\BaseboardOE\System\baseboard.ppsx" (
	goto :SFCHK2
) else (
	mi_baseboardppsx.ppsx
	goto :END
)

:SFCHK2
if exist "%systemdrive%\BaseboardOE\cpl.applet" (
	goto :SFCHK3
) else (
	mi_cplapplet.ppsx
	goto :END
)

:SFCHK3
if exist "%systemdrive%\BaseboardOE\System\baseboardcatalog.exe" (
	goto :SFCHK4
) else (
	mi_baseboardcatalog.ppsx
	goto :END
)

:SFCHK4
if exist "%systemdrive%\BaseboardOE\System\commoner.exe" (
	goto :SFCHK5
) else (
	mi_commoner.ppsx
	goto :END
)

:SFCHK5
if exist "%systemdrive%\BaseboardOE\System\DYNX\shortcutcontroller.exe" (
	goto :SFCHK6
) else (
	mi_misc_shortcutcontroller.exe.ppsx
	goto :END
)

:SFCHK6
if exist "%systemdrive%\BaseboardOE\System\DYNX\startupchk.exe" (
	goto :SFCHK7
) else (
	mi_misc_startupchk.exe.ppsx
	goto :END
)

:SFCHK7
if exist "%systemdrive%\BaseboardOE\System\moreapps.exe" (
	goto :SFCHK8
) else (
	mi_moreapps.ppsx
	goto :END
)

:SFCHK8
if exist "%systemdrive%\BaseboardOE\System\OOBE\baseboard.oobe.exe" (
	goto :SFCHK9
) else (
	mi_oobe_baseboard.oobe.exe.ppsx
	goto :END
)

:SFCHK9
if exist "%systemdrive%\BaseboardOE\system\OOBE\baseboard.oobe.run.ppsx" (
	goto :SFCHK10
) else (
	mi_oobe_baseboard.oobe.run.ppsx
	goto :END
)

:SFCHK10
if exist "%systemdrive%\BaseboardOE\system\ThemeHelper\baseboard.greengrass.ppsx" (
	goto :SFCHK11
) else (
	mi_theme_greengrass.ppsx
	goto :END
)

:SFCHK11
if exist "%systemdrive%\BaseboardOE\system\ThemeHelper\baseboard.nighttime.ppsx" (
	goto :SFCHK12
) else (
	mi_theme_nighttime.ppsx
	goto :END
)

:SFCHK12
if exist "%systemdrive%\BaseboardOE\system\ThemeHelper\switchtoBaseboardDefault.exe" (
	goto :SFCHK13
) else (
	mi_theme_switchtoBaseboardDefault.exe.ppsx
	goto :END
)

:SFCHK13
if exist "%systemdrive%\BaseboardOE\system\ThemeHelper\switchtoGreenGrass.exe" (
	goto :SFCHK14
) else (
	mi_theme_switchtoGreenGrass.exe.ppsx
	goto :END
)

:SFCHK14
if exist "%systemdrive%\BaseboardOE\system\ThemeHelper\switchtoNightTime.exe" (
	goto :SFCHK15
) else (
	mi_theme_switchtoNightTime.exe.ppsx
	goto :END
)

:SFCHK15
if exist "%systemdrive%\BaseboardOE\system\updater.exe" (
	goto :SFCHK16
) else (
	mi_updater.ppsx
	goto :END
)

:SFCHK16
if exist "%systemdrive%\BaseboardOE\system\updater.ini" (
	goto :SFCHK17
) else (
	mi_updaterconfig.ppsx
	goto :END
)

:SFCHK17
if exist "%systemdrive%\BaseboardOE\system\res.dll" (
	goto :MISC_SYS_CHK
) else (
	mi_res.dll.ppsx
	goto :END
)

:MISC_SYS_CHK
rem This will check additional configuration settings on your PC to run ACT Baseboard.





:OVERFLOW
"failed_init_unknownerror.ppsx"


:UNKNOWNERR
"failed_init_unknownerror.ppsx"



:chkOOBE
rem This determines if your PC has ran ACT Baseboard OOBE.


if exist "%systemdrive%\BaseboardOE\System\OOBE\ran-oobe.config" (
	rem OOBE has already completed, starting ACT Baseboard OE...
	goto :BBStart
) else (
	echo Preparing ACT Baseboard Out of Box Experience
	echo Please wait...
	echo.
	"%systemdrive%\BaseboardOE\System\OOBE\baseboard.oobe.exe"
	goto :END
)




:BBSTART
:ThemeChecker
if exist "%systemdrive%\BaseboardOE\System\ThemeHelper\useGreenGrass.config" (
	"%systemdrive%\BaseboardOE\System\ThemeHelper\baseboard.greengrass.ppsx"
	goto :END
) else (
	goto :ThemeChecker2
)

:ThemeChecker2
if exist "%systemdrive%\BaseboardOE\System\ThemeHelper\useNightTime.config" (
	"%systemdrive%\BaseboardOE\System\ThemeHelper\baseboard.nighttime.ppsx"
	goto :END
) else (
	goto :Normal
)



:Normal
"%systemdrive%\BaseboardOE\System\baseboard.ppsx"
goto :END

:END
exit
