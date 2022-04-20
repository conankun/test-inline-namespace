#!/bin/bash
rm test.o
rm main.o
rm dummy.o
rm libtest.so
echo "Compiling test.cc"
g++ -O0 -c -fpic -Wall -Wpedantic --whole-file -std=c++17 test.cc
g++ -O0 -c -fpic -Wall -Wpedantic --whole-file -std=c++17 dummy.cc
g++ -shared -o libtest.so dummy.o test.o
nm -C libtest.so | c++filt
echo "Compiling main.cc"
g++ -O0 -c -std=c++17 main.cc
echo "Linking"
g++ -L$(pwd) main.o -ltest
echo "new build: "
export LD_LIBRARY_PATH=$(pwd):$LD_LIBRARY_PATH
echo "LD_LIBRARY_PATH: ${LD_LIBRARY_PATH}"
./a.out
