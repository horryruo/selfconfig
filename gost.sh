#!/usr/bin/env bash
# Wiki: https://docs.ginuerzh.xyz/gost/
# Usage: bash <(curl -s https://raw.githubusercontent.com/mixool/script/debian-9/gost.sh) -L=:8080
# Uninstall: systemctl stop gost; systemctl disable gost; rm -rf /etc/systemd/system/gost.service /usr/bin/gost

[[ $# != 0 ]] && METHOD=$(echo $@) || METHOD="-L=ss://AEAD_AES_128_GCM:$(tr -dc 'a-z0-9A-Z' </dev/urandom | head -c 16)@:$(shuf -i 10000-65535 -n1)"

URL="https://gitee.com/horrypure/better-cloudflare-ip/raw/master/gost-linux-amd64-2.11.1.gz"
rm -rf /usr/bin/gost
wget -O - $URL | gzip -d > /usr/bin/gost && chmod +x /usr/bin/gost
chmod +x /usr/bin/gost
chmod +x /usr/bin/gost
chmod +x /usr/bin/gost
cat <<EOF > /etc/systemd/system/gost.service
[Unit]
Description=gost
[Service]
ExecStart=/usr/bin/gost $METHOD
Restart=always
User=root
[Install]
WantedBy=multi-user.target
EOF

systemctl enable gost.service && systemctl daemon-reload && systemctl restart gost.service && systemctl status gost
