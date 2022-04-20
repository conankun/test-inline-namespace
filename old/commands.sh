#!/bin/bash
rm a.out
g++ -O0 -c -std=c++17 test.cc main.cc && g++ test.o main.o
echo "Old version"
./a.out
rm test.o
cp ../new/libtest.so .
g++ -L$(pwd) main.o -ltest
echo "Link the new version with old object file: "
export LD_LIBRARY_PATH=$(pwd):${LD_LIBRARY_PATH}
./a.out

