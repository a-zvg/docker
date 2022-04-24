#!/bin/bash

set -ex

BUILD=_build

if [ ! -d .conan ]; then
    patch -p0 < conan.patch
fi
mkdir -p "$BUILD"
pushd "$BUILD"
conan install .. --build=missing
popd
