#!/bin/bash

WORKDIR="$(dirname $(realpath -s $0))/.."
WORKDIR="$(realpath -s $WORKDIR)"

export LD_LIBRARY_PATH="$WORKDIR/_result/lib:$WORKDIR/_result/postgresql/lib"

set -x

rm -f "$WORKDIR/_result/bin/db/postmaster.pid" "$WORKDIR/_result/bin/db_log/postmaster.pid"

if [[ "$1" == "color" ]]; then
     "$WORKDIR/_result/bin/cluster_manager_app" "/home/user/r602_pki_service_2/config/cluster_manager.config" 2>&1 | gawk '{ if($3 == "[error]") { print "\033[0;31m"$0"\033[0m" } else if($3 == "[warning]") { print "\033[0;33m"$0"\033[0m" } else print $0 }'
elif [[ "$1" == "gdb" ]]; then
     gdb --args "$WORKDIR/_result/bin/cluster_manager_app" "/home/user/r602_pki_service_2/config/cluster_manager.config"
else
     "$WORKDIR/_result/bin/cluster_manager_app" "/home/user/r602_pki_service_2/config/cluster_manager.config"
fi
