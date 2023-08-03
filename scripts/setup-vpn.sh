#!/usr/bin/env bash

# Start OpenVPN
openvpn --config /etc/openvpn/vpn.conf --auth-user-pass /etc/openvpn/userpass.txt --daemon
