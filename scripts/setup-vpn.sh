#!/usr/bin/env bash
echo "Je suis le fichier openvpn."
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
echo "Les fichier de configuration OpenVPN existent, je lance."
# Start OpenVPN
chmod 600 /etc/openvpn/userpass.txt
openvpn --config /etc/openvpn/vpn.conf --cipher AES-256-GCM --insecure

# Affichez un message de succès
echo "OpenVPN lancement fait"