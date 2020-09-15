#!/usr/bin/env bash

set -x
set -e

# build and install JIGSAW
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} -DCMAKE_BUILD_TYPE=Release ..
cmake --build . --config Release --target install
cd ..

# unit tests
cd uni
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} -DCMAKE_BUILD_TYPE=Debug ..
cmake --build . --config Debug
for test in 1 2 3 4 5 6 7 8 9
do
  ./test_${test}
done
