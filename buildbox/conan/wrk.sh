#!/usr/bin/env bash

set -x

wrk --duration 10s --threads 4 --connections 10000 http://0.0.0.0:9980
