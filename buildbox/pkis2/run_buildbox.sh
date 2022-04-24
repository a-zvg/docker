#!/bin/bash

set -ex

#docker run -it --rm -v $PWD:$PWD -w $PWD --hostname buildbox -e http_proxy=$http_proxy buildbox:pkis2 bash
docker run -it --rm -v $PWD:$PWD -w $PWD --net host --hostname buildbox buildbox11:pkis2 bash
