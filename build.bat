@echo.
@echo "==============================="
@echo "clean packaging output files"
@echo "==============================="

pushd packaging\bin_x86
del *.lib *.dll *.exp *.pdb
popd

pushd packaging\bin_x64
del *.lib *.dll *.exp *.pdb
popd


@echo.
@echo "==============================="
@echo "x86"
@echo "==============================="

setlocal
pushd openssl

CALL "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars32.bat"
C:\Perl64\bin\perl.exe Configure VC-WIN32

del *.lib *.dll *.exp *.pdb
nmake clean
nmake

xcopy *.lib ..\packaging\bin_x86\.
xcopy *.dll ..\packaging\bin_x86\.
xcopy *.exp ..\packaging\bin_x86\.
xcopy *.pdb ..\packaging\bin_x86\.

popd
endlocal
@echo.


@echo.
@echo "==============================="
@echo "x64"
@echo "==============================="

setlocal
pushd openssl

CALL "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat"
C:\Perl64\bin\perl.exe Configure VC-WIN64A

del *.lib *.dll *.exp *.pdb
nmake clean
nmake

xcopy *.lib ..\packaging\bin_x64\.
xcopy *.dll ..\packaging\bin_x64\.
xcopy *.exp ..\packaging\bin_x64\.
xcopy *.pdb ..\packaging\bin_x64\.

popd
endlocal
@echo.

