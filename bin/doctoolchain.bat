@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  docToolchain script for Windows
@rem
@rem ##########################################################################

set CMD_LINE_ARGS=%*

IF "%1"=="" GOTO :help
IF [%1]==[/?] GOTO :help

set SCRIPTDIR=%~dp0
set BASEDIR=%SCRIPTDIR%..\
set GRADLECMD=%BASEDIR%gradlew.bat
set WORKINGDIR=%cd%\

@rem Execute docToolchain

%GRADLECMD% --project-cache-dir %BASEDIR%.gradle -p %BASEDIR% -PdocDir=%WORKINGDIR%%1 %2 %3 %4 %5 %6 %7 %8 %9

goto :end

:help

echo Usage: doctoolchain docDir [option...] [task...]
echo
echo docDir - Absolute directory with the documentation.
echo
echo You can use the same options and tasks as in underlying gradle.
echo Use "doctoolchain . --help" to see available options.
echo Use "doctoolchain . tasks" to see available tasks.
echo
echo Examples:
echo
echo   Generate PDF:
echo     doctoolchain . generatePDF
echo
echo   Generate HTML:
echo     doctoolchain . generateHTML
echo
echo   Publish HTML to Confluence:
echo     doctoolchain . publishToConfluence -PconfluenceConfigFile=ConfluenceConfig.groovy --no-daemon -q
goto :end

:end
