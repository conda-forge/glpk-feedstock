cd w%ARCH%
copy config_VC config.h

:: Get the major minor version info (e.g. `4_60`)
python -c "import os; print('_'.join(os.environ['PKG_VERSION'].split('.')[:2]))" > temp.txt
set /p MAJ_MIN_VER=<temp.txt

nmake /f Makefile_VC
if errorlevel 1 exit 1

nmake /f Makefile_VC_DLL
if errorlevel 1 exit 1

copy glpsol.exe %LIBRARY_BIN%
if errorlevel 1 exit 1

copy ..\src\glpk.h %LIBRARY_INC%
if errorlevel 1 exit 1

copy glpk.lib %LIBRARY_LIB%\glpk_static.lib
if errorlevel 1 exit 1

copy glpk_%MAJ_MIN_VER%.lib %LIBRARY_LIB%\glpk.lib
if errorlevel 1 exit 1

copy glpk_%MAJ_MIN_VER%.dll %LIBRARY_BIN%
if errorlevel 1 exit 1

copy glpk_%MAJ_MIN_VER%.dll %LIBRARY_BIN%\glpk.dll
if errorlevel 1 exit 1
