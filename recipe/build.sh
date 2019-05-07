#!/usr/bin/env bash

set -x
set -e

# build and install JIGSAW
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} -DCMAKE_BUILD_TYPE=BUILD_MODE ..
make
make install
cd ..

# unit tests
cd uni
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} -DCMAKE_BUILD_TYPE=BUILD_MODE ..
make
for test in 1 2 3 4 5
do
  ./test_${test}
done
