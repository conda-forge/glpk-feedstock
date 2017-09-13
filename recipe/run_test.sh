export CFLAGS="${CFLAGS} -I${PREFIX}/include -L${PREFIX}/lib"

if [ "$(uname)" == "Darwin" ];
then
    export LDFLAGS="${LDFLAGS} -Wl,-rpath,${PREFIX}/lib"
elif [ "$(uname)" == "Linux" ];
then
    export LDFLAGS="${LDFLAGS} -Wl,-rpath=${PREFIX}/lib"
fi

cc ${CFLAGS} ${LDFLAGS} test.c -lglpk -o test.out

./test.out
