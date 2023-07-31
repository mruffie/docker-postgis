#!/bin/bash
#Saut le ligne LF
export PGPASSWORD=${POSTGRES_PASS}

psql -d gis -p 5432 -U docker -h localhost -f /tests/init.sql
