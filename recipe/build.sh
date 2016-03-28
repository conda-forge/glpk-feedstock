#!/bin/bash

export LDFLAGS="-L${PREFIX}/lib"
export CFLAGS="${CFLAGS} -O3 -I${PREFIX}/include"

if [ "$(uname)" == "Darwin" ];
then
    export LD_LIBRARY_PATH=$PREFIX/lib:$LD_LIBRARY_PATH
    brew uninstall gmp
fi

./configure --prefix=$PREFIX --with-gmp

make
make check
make install
