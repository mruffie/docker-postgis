#!/usr/bin/env bash

set -e
# Start OpenVPN
openvpn --config /etc/openvpn/vpn.conf --auth-user-pass /etc/openvpn/userpass.txt --daemon

# Wait for OpenVPN connection to establish (add necessary delay)
sleep 10

# Start PostgreSQL
exec su - "$@"
