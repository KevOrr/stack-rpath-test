#!/usr/bin/env sh

set -eux

mkdir -p /tmp/mylib_d
gcc mylib.c -o /tmp/mylib_d/libmylib.dylib -shared
install_name_tool -id '@rpath/libmylib.dylib' /tmp/mylib_d/libmylib.dylib
stack purge
stack build
