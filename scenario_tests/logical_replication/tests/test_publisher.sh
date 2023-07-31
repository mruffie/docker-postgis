#!/usr/bin/env bash
#Saut le ligne LF
set -e

source /scripts/env-data.sh

# execute tests
pushd /tests

PGHOST=localhost \
PGDATABASE=gis \
PYTHONPATH=/lib \
  python3 -m unittest -v test_logical_replication.TestReplicationPublisher
