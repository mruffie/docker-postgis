#!/usr/bin/env bash

# Verifiez que le fichier de configuration OpenVPN existe
if [ ! -f "/etc/openvpn/vpn.conf" ]; then
    echo "Le fichier de configuration OpenVPN existe pas."
    #exit 1
fi
# Verifiez que le fichier de userpass existe
if [ ! -f "/etc/openvpn/userpass.txt" ]; then
    echo "Le fichier userpass OpenVPN existe pas."
    #exit 1
fi

# Start OpenVPN
openvpn --config /etc/openvpn/vpn.conf --auth-user-pass /etc/openvpn/userpass.txt --daemon

# Affichez un message de succès
echo "OpenVPN lancement fait"