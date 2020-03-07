[![Build Status](https://travis-ci.org/IlaMac/2Component_GL.svg?branch=cpp-cmake)](https://travis-ci.org/IlaMac/2Component_GL)
# 2Component_GL

This project uses the build script written by DavidAce to generate the correct envinroment (in terms of libraries, dependencies, compilers) to run the program on any clusters (it is designed in particular for Tetralith and Kraken).

The program is compiled by launching:

./build.sh

To see the opstional flags available type:

./build.sh -h

Usually, for this program the flags needed are:

--enable-h5pp

and depending on the cluster:

--enable-shared

If some problems occur try first of to clear the cmake and the libraries by launching:

./build.sh -c  --clear-libs=h5pp
