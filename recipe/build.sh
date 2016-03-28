#!/bin/bash

export LDFLAGS="-L${PREFIX}/lib"
export CFLAGS="${CFLAGS} -O3 -I${PREFIX}/include"

if [ "$(uname)" == "Darwin" ];
then
    export LD_LIBRARY_PATH=$PREFIX/lib:$LD_LIBRARY_PATH
    if [ $TRAVIS ];
    then
        brew uninstall gmp
    fi
fi

./configure --prefix=$PREFIX --with-gmp

make
make check
make install
