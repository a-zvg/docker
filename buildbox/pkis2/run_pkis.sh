#!/bin/bash

WORKDIR="$(dirname $(realpath -s $0))/.."
WORKDIR="$(realpath -s $WORKDIR)"

export OPENSSL_ENGINES="$WORKDIR/_result/lib/engines-1.1/"
export LD_LIBRARY_PATH="$WORKDIR/_result/lib:$WORKDIR/_result/postgresql/lib"

set -x

if [[ `pgrep postgres | wc -l` == "0" ]]; then
     rm -f "$WORKDIR/_result/bin/db/postmaster.pid" "$WORKDIR/_result/bin/db_log/postmaster.pid"
     "$WORKDIR/helpers/postgresql/start_all_postgres.sh"
fi

if [[ `pgrep nginx | wc -l` == "0" ]]; then
     "$WORKDIR/helpers/nginx/scripts/run_nginx.sh"
fi

if [[ "$1" == "color" ]]; then
     "$WORKDIR/_result/bin/pki_service_2" "/home/user/r602_pki_service_2/config/pki_service_softtoken.config" 2>&1 | gawk '{ if($3 == "[error]") { print "\033[0;31m"$0"\033[0m" } else if($3 == "[warning]") { print "\033[0;33m"$0"\033[0m" } else print $0 }'
elif [[ "$1" == "gdb" ]]; then
     gdb --args "$WORKDIR/_result/bin/pki_service_2" "/home/user/r602_pki_service_2/config/pki_service_softtoken.config"
else
     "$WORKDIR/_result/bin/pki_service_2" "/home/user/r602_pki_service_2/config/pki_service_softtoken.config"
fi
