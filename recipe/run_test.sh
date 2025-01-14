#!/usr/bin/env bash

cd tests
# Build tests, link against npth
export COMP_OPTIONS="-I${CONDA_PREFIX}/include -L${CONDA_PREFIX}/lib -lnpth -Wl,-rpath,${CONDA_PREFIX}/lib"
export COMP_OPTIONS="$COMP_OPTIONS -pthread"    # [linux]
$CC t-cond.c -o t-cond $COMP_OPTIONS
$CC t-fork.c -o t-fork $COMP_OPTIONS
$CC t-mutex.c -o t-mutex $COMP_OPTIONS
$CC t-thread.c -o t-thread $COMP_OPTIONS
# Run tests
./t-cond --verbose
./t-fork --verbose
./t-mutex --verbose
./t-thread --verbose