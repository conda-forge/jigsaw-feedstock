:: Remove -GL from CXXFLAGS as this causes a fatal error
set "CXXFLAGS= -MD"

:: build and install JIGSAW
mkdir build
cd build

set CMAKE_FLAGS=-G "NMake Makefiles"
set CMAKE_FLAGS=%CMAKE_FLAGS% -DCMAKE_INSTALL_PREFIX=%PREFIX%
set CMAKE_FLAGS=%CMAKE_FLAGS% -DCMAKE_BUILD_TYPE=Release

cmake %CMAKE_FLAGS% ..
if errorlevel 1 exit /b 1

cmake --build . --config Release --target install
if errorlevel 1 exit 1

cd ..

:: unit tests
cd uni

mkdir build
cd build

cmake %CMAKE_FLAGS% ..
if errorlevel 1 exit /b 1

cmake --build . --config Release
if errorlevel 1 exit /b 1

dir

dir Release

.\Release\test_1.exe
if errorlevel 1 exit /b 1

.\Release\test_2.exe
if errorlevel 1 exit /b 1

.\Release\test_3.exe
if errorlevel 1 exit /b 1

.\Release\test_4.exe
if errorlevel 1 exit /b 1

.\Release\test_5.exe
if errorlevel 1 exit /b 1

.\Release\test_6.exe
if errorlevel 1 exit /b 1
