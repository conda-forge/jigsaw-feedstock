:: Remove -GL from CXXFLAGS as this causes a fatal error
set "CXXFLAGS= -MD"

:: build and install JIGSAW
mkdir build
cd build

set CMAKE_FLAGS=-G "NMake Makefiles" ^
                -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
                -DCMAKE_PREFIX_PATH:PATH="%LIBRARY_PREFIX%" ^
                -DCMAKE_BUILD_TYPE=Release

cmake %CMAKE_FLAGS% ..
if errorlevel 1 exit /b 1

cmake --build . --config Release --target install
if errorlevel 1 exit 1

:: Move dll to bin directory
move %LIBRARY_LIB%\jigsaw.dll %LIBRARY_BIN% || exit 1

cd ..

:: unit tests
cd uni

mkdir build
cd build

cmake %CMAKE_FLAGS% ..
if errorlevel 1 exit /b 1

cmake --build . --config Release
if errorlevel 1 exit /b 1

.\test_1.exe
if errorlevel 1 exit /b 1

.\test_2.exe
if errorlevel 1 exit /b 1

.\test_3.exe
if errorlevel 1 exit /b 1

.\test_4.exe
if errorlevel 1 exit /b 1

.\test_5.exe
if errorlevel 1 exit /b 1

.\test_6.exe
if errorlevel 1 exit /b 1

.\test_7.exe
if errorlevel 1 exit /b 1

.\test_8.exe
if errorlevel 1 exit /b 1

.\test_9.exe
if errorlevel 1 exit /b 1
