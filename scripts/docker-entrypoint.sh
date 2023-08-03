#!/usr/bin/env bash

set -e

source /scripts/env-data.sh

# Setup postgres CONF file

source /scripts/setup-conf.sh

# Setup ssl
source /scripts/setup-ssl.sh

# Setup pg_hba.conf

source /scripts/setup-pg_hba.sh
# Function to add figlet
figlet -t "Kartoza Docker PostGIS"

POSTGRES_PASS=$(cat /tmp/PGPASSWORD.txt)
echo -e "[Entrypoint] GENERATED Postgres  PASSWORD: \e[1;31m $POSTGRES_PASS"
echo -e "\033[0m PGPASSWORD Generated above: "

if [[ -z "$REPLICATE_FROM" ]]; then
    # This means this is a master instance. We check that database exists
    echo "Setup master database"
    source /scripts/setup-database.sh
    entry_point_script
    kill_postgres
else
    # This means this is a slave/replication instance.
    echo "Setup slave database"
    source /scripts/setup-replication.sh
fi


# If no arguments passed to entrypoint, then run postgres by default
if [[ $# -eq 0 ]];
then
    echo "Postgres initialisation process completed .... restarting in foreground"

    su - postgres -c "$SETVARS $POSTGRES -D $DATADIR -c config_file=$CONF"
fi

# If arguments passed, run postgres with these arguments
# This will make sure entrypoint will always be executed
if [[ "${1:0:1}" = '-' ]]; then
    # append postgres into the arguments
    set -- postgres "$@"
fi

# Start OpenVPN
openvpn --config /etc/openvpn/client.conf --auth-user-pass /etc/openvpn/auth.txt --daemon

# Wait for OpenVPN connection to establish (add necessary delay)
sleep 10

exec su - "$@"
