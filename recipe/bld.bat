cd w%ARCH%
copy config_VC config.h

nmake /f Makefile_VC
nmake /f Makefile_VC_DLL

copy glpsol.exe %LIBRARY_BIN%
copy ..\src\glpk.h %LIBRARY_INC%
copy glpk.lib %LIBRARY_LIB%
copy glpk_4_60.dll %LIBRARY_BIN%
copy glpk_4_60.dll %LIBRARY_BIN%\glpk.dll

if errorlevel 1 exit 1