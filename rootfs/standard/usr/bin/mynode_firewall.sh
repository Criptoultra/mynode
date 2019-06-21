#!/bin/bash

set -e
set -x

# Add default rules
ufw default deny incoming
ufw default allow outgoing

# Add firewall rules
ufw allow 22    comment 'allow SSH'
ufw allow 80    comment 'allow WWW'
ufw allow 1900  comment 'allow SSDP for UPnP discovery'
ufw allow 10009 comment 'allow Lightning gRPC'
ufw allow 10080 comment 'allow Lightning REST RPC'
ufw allow 9735  comment 'allow Lightning'
ufw allow 8333  comment 'allow Bitcoin mainnet'
ufw allow 18333 comment 'allow Bitcoin testnet'
ufw allow 3000  comment 'allow LndHub'
ufw allow 3002  comment 'allow BTC RPC Explorer'
ufw allow 3004  comment 'allow LND Admin'
ufw allow 3010  comment 'allow RTL'
ufw allow 50001 comment 'allow Electrum Server'
ufw allow 50002 comment 'allow Electrum Server'
ufw allow 56881 comment 'allow myNode QuickSync'
ufw allow 51413 comment 'allow myNode QuickSync'
ufw allow 6771  comment 'allow myNode QuickSync (LPD)'
ufw allow from 127.0.0.1 comment 'allow from localhost'
ufw allow from ::1 comment 'allow from localhost'

# Enable UFW
ufw --force enable

# Make sure ufw is enabled at boot
systemctl enable ufw

# Check UFW status
ufw status

# Success
exit 0