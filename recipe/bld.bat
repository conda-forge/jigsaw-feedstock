set PATH=%PREFIX%\cmake-bin\bin;%PATH%

:: build and install JIGSAW
mkdir build
cd build

cmake -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX%  ^
      -DCMAKE_BUILD_TYPE=Release               ^
      %SRC_DIR%
if errorlevel 1 exit /b 1

cmake --build . --config Release --target INSTALL -- VERBOSE=1
if errorlevel 1 exit /b 1


:: unit tests
cd uni
dir
./test_1.exe
./test_2.exe
./test_3.exe
./test_4.exe
./test_5.exe
