#!/bin/bash

export LDFLAGS="${LDFLAGS} -L${PREFIX}/lib"
export CFLAGS="${CFLAGS} -O3 -I${PREFIX}/include"

if [ "$(uname)" == "Darwin" ];
then
    export LDFLAGS="${LDFLAGS} -Wl,-rpath,${PREFIX}/lib"
elif [ "$(uname)" == "Linux" ];
then
    export LDFLAGS="${LDFLAGS} -Wl,-rpath=${PREFIX}/lib"
fi

./configure --prefix="${PREFIX}" --with-gmp

make
make check
make install
