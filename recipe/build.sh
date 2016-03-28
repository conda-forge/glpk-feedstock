#!/bin/bash

export LDFLAGS="-L${PREFIX}/lib"
export CFLAGS="${CFLAGS} -O3 -I${PREFIX}/include"
export LD_LIBRARY_PATH=$PREFIX/lib:$LD_LIBRARY_PATH
./configure --prefix=$PREFIX --with-gmp

make
make check
make install
