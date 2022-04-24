#!/bin/bash

set -ex

docker run -it --rm -v $PWD:$PWD -w $PWD -e CONAN_USER_HOME=$PWD --hostname buildbox buildbox:conan bash
