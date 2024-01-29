#!/usr/bin/env sh

if [ $# -ne 1 ]; then
    echo "USAGE: $0 {stack | cabal}" >&2
    exit 2
fi

set -eux

mkdir -p /tmp/mylib_d
gcc mylib.c -o /tmp/mylib_d/libmylib.dylib -shared
install_name_tool -id '@rpath/libmylib.dylib' /tmp/mylib_d/libmylib.dylib

case $1 in
    stack)
        stack purge
        stack build
        ;;
    cabal)
        cabal build all
        ;;
    *)
        echo "USAGE: $0 {stack | cabal}" >&2
        exit 2
esac
