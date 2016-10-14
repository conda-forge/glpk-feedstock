cd w%ARCH%
copy config_VC config.h

:: Get the major minor version info (e.g. `4_60`)
python -c "import os; print('_'.join(os.environ['PKG_VERSION'].split('.')[:2]))" > temp.txt
set /p MAJ_MIN_VER=<temp.txt

nmake /f Makefile_VC
nmake /f Makefile_VC_DLL

copy glpsol.exe %LIBRARY_BIN%
copy ..\src\glpk.h %LIBRARY_INC%
copy glpk.lib %LIBRARY_LIB%
copy glpk_%MAJ_MIN_VER%.dll %LIBRARY_BIN%
copy glpk_%MAJ_MIN_VER%.dll %LIBRARY_BIN%\glpk.dll

if errorlevel 1 exit 1