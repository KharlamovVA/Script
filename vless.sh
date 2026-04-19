#!/bin/bash
set -e

G='\033[0;32m'
Y='\033[1;33m'
NC='\033[0m'
R='\033[0;31m'
C='\033[0;36m'

echo -e "${G}=== Xray Reality Install ===${NC}"

# Интерактивный выбор домена
echo -e "${Y}>> Enter SNI domain manually or select from list:${NC}"
echo -e "${C}1) Enter manually${NC}"
echo -e "${C}2) Select from list${NC}"
echo -n -e "${Y}Choose [1-2]: ${NC}"
read input_type

if [ "$input_type" = "2" ]; then
    echo -e "${C}Select country:${NC}"
    echo "1) Russia"
    echo "2) Kazakhstan"
    echo "3) Spain"
    echo "4) Netherlands"
    echo "5) France"
    echo "6) Sweden"
    echo "7) USA"
    echo "8) Germany"
    echo "9) UK"
    echo "10) Japan"
    echo -n -e "${Y}Enter number [1-10]: ${NC}"
    read country_choice

    case $country_choice in
        1)
            echo -e "${C}Russian domains:${NC}"
            echo "1) gosuslugi.ru"
            echo "2) rt.ru"
            echo "3) ozon.ru"
            echo "4) tinkoff.ru"
            echo -n -e "${Y}Select domain [1-4]: ${NC}"
            read domain_choice
            case $domain_choice in
                1) SNI_DOMAIN="gosuslugi.ru" ;;
                2) SNI_DOMAIN="rt.ru" ;;
                3) SNI_DOMAIN="ozon.ru" ;;
                4) SNI_DOMAIN="tinkoff.ru" ;;
                *) SNI_DOMAIN="gosuslugi.ru" ;;
            esac
            ;;
        2)
            echo -e "${C}Kazakhstan domains:${NC}"
            echo "1) egov.kz"
            echo "2) halykbank.kz"
            echo "3) kaspi.kz"
            echo -n -e "${Y}Select domain [1-3]: ${NC}"
            read domain_choice
            case $domain_choice in
                1) SNI_DOMAIN="egov.kz" ;;
                2) SNI_DOMAIN="halykbank.kz" ;;
                3) SNI_DOMAIN="kaspi.kz" ;;
                *) SNI_DOMAIN="egov.kz" ;;
            esac
            ;;
        3)
            echo -e "${C}Spain domains:${NC}"
            echo "1) sede.seat.gob.es"
            echo "2) santander.es"
            echo "3) movistar.es"
            echo -n -e "${Y}Select domain [1-3]: ${NC}"
            read domain_choice
            case $domain_choice in
                1) SNI_DOMAIN="sede.seat.gob.es" ;;
                2) SNI_DOMAIN="santander.es" ;;
                3) SNI_DOMAIN="movistar.es" ;;
                *) SNI_DOMAIN="sede.seat.gob.es" ;;
            esac
            ;;
        4)
            echo -e "${C}Netherlands domains:${NC}"
            echo "1) belastingdienst.nl"
            echo "2) ing.nl"
            echo "3) ziggo.nl"
            echo -n -e "${Y}Select domain [1-3]: ${NC}"
            read domain_choice
            case $domain_choice in
                1) SNI_DOMAIN="belastingdienst.nl" ;;
                2) SNI_DOMAIN="ing.nl" ;;
                3) SNI_DOMAIN="ziggo.nl" ;;
                *) SNI_DOMAIN="belastingdienst.nl" ;;
            esac
            ;;
        5)
            echo -e "${C}France domains:${NC}"
            echo "1) gouv.fr"
            echo "2) bnf.fr"
            echo "3) orange.fr"
            echo -n -e "${Y}Select domain [1-3]: ${NC}"
            read domain_choice
            case $domain_choice in
                1) SNI_DOMAIN="gouv.fr" ;;
                2) SNI_DOMAIN="bnf.fr" ;;
                3) SNI_DOMAIN="orange.fr" ;;
                *) SNI_DOMAIN="gouv.fr" ;;
            esac
            ;;
        6)
            echo -e "${C}Sweden domains:${NC}"
            echo "1) skatteverket.se"
            echo "2) swedbank.se"
            echo "3) telia.se"
            echo -n -e "${Y}Select domain [1-3]: ${NC}"
            read domain_choice
            case $domain_choice in
                1) SNI_DOMAIN="skatteverket.se" ;;
                2) SNI_DOMAIN="swedbank.se" ;;
                3) SNI_DOMAIN="telia.se" ;;
                *) SNI_DOMAIN="skatteverket.se" ;;
            esac
            ;;
        7)
            echo -e "${C}USA domains:${NC}"
            echo "1) whitehouse.gov"
            echo "2) google.com"
            echo "3) microsoft.com"
            echo -n -e "${Y}Select domain [1-3]: ${NC}"
            read domain_choice
            case $domain_choice in
                1) SNI_DOMAIN="whitehouse.gov" ;;
                2) SNI_DOMAIN="google.com" ;;
                3) SNI_DOMAIN="microsoft.com" ;;
                *) SNI_DOMAIN="whitehouse.gov" ;;
            esac
            ;;
        8)
            echo -e "${C}Germany domains:${NC}"
            echo "1) bund.de"
            echo "2) deutsche-bank.de"
            echo "3) telekom.de"
            echo -n -e "${Y}Select domain [1-3]: ${NC}"
            read domain_choice
            case $domain_choice in
                1) SNI_DOMAIN="bund.de" ;;
                2) SNI_DOMAIN="deutsche-bank.de" ;;
                3) SNI_DOMAIN="telekom.de" ;;
                *) SNI_DOMAIN="bund.de" ;;
            esac
            ;;
        9)
            echo -e "${C}UK domains:${NC}"
            echo "1) gov.uk"
            echo "2) bbc.co.uk"
            echo "3) barclays.co.uk"
            echo -n -e "${Y}Select domain [1-3]: ${NC}"
            read domain_choice
            case $domain_choice in
                1) SNI_DOMAIN="gov.uk" ;;
                2) SNI_DOMAIN="bbc.co.uk" ;;
                3) SNI_DOMAIN="barclays.co.uk" ;;
                *) SNI_DOMAIN="gov.uk" ;;
            esac
            ;;
        10)
            echo -e "${C}Japan domains:${NC}"
            echo "1) kantei.go.jp"
            echo "2) rakuten.co.jp"
            echo "3) docomo.ne.jp"
            echo -n -e "${Y}Select domain [1-3]: ${NC}"
            read domain_choice
            case $domain_choice in
                1) SNI_DOMAIN="kantei.go.jp" ;;
                2) SNI_DOMAIN="rakuten.co.jp" ;;
                3) SNI_DOMAIN="docomo.ne.jp" ;;
                *) SNI_DOMAIN="kantei.go.jp" ;;
            esac
            ;;
        *)
            SNI_DOMAIN="gosuslugi.ru"
            echo -e "${Y}Default: $SNI_DOMAIN${NC}"
            ;;
    esac
else
    echo -n -e "${Y}Enter SNI domain: ${NC}"
    read SNI_DOMAIN
    if [ -z "$SNI_DOMAIN" ]; then
        SNI_DOMAIN="gosuslugi.ru"
        echo -e "${Y}Default: $SNI_DOMAIN${NC}"
    fi
fi

echo -e "${G}✓ Selected SNI: $SNI_DOMAIN${NC}"

# Запрос порта
echo -n -e "${Y}Enter port [443]: ${NC}"
read XRAY_PORT
XRAY_PORT=${XRAY_PORT:-443}

# Обновление и установка
apt update && apt install -y curl openssl

# Установка Xray
echo -e "${Y}>> Installing Xray...${NC}"
bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install

SERVER_IP=$(curl -s ifconfig.me)
echo -e "${G}✓ Server IP: $SERVER_IP${NC}"

# Освобождение порта
fuser -k ${XRAY_PORT}/tcp 2>/dev/null || true
sleep 1

# Генерация ключей
echo -e "${Y}>> Generating keys...${NC}"
KEY_OUTPUT=$(/usr/local/bin/xray x25519)
PRIVATE_KEY=$(echo "$KEY_OUTPUT" | grep "PrivateKey:" | awk '{print $2}')
PUBLIC_KEY=$(echo "$KEY_OUTPUT" | grep "Password" | awk '{print $3}')

if [ -z "$PRIVATE_KEY" ] || [ -z "$PUBLIC_KEY" ]; then
    echo -e "${R}Error: Failed to generate keys${NC}"
    exit 1
fi

UUID=$(/usr/local/bin/xray uuid)
SHORT_ID=$(openssl rand -hex 8)

echo -e "${G}✓ UUID: $UUID${NC}"
echo -e "${G}✓ Private Key: $PRIVATE_KEY${NC}"
echo -e "${G}✓ Public Key: $PUBLIC_KEY${NC}"
echo -e "${G}✓ Short ID: $SHORT_ID${NC}"

mkdir -p /root/xray_client_data

# Создание конфига
echo -e "${Y}>> Creating Xray config...${NC}"
cat > /usr/local/etc/xray/config.json << EOF
{
  "log": {
    "loglevel": "warning"
  },
  "inbounds": [
    {
      "port": $XRAY_PORT,
      "protocol": "vless",
      "settings": {
        "clients": [
          {
            "id": "$UUID",
            "flow": "xtls-rprx-vision"
          }
        ],
        "decryption": "none"
      },
      "streamSettings": {
        "network": "tcp",
        "security": "reality",
        "realitySettings": {
          "dest": "$SNI_DOMAIN:443",
          "serverNames": [
            "$SNI_DOMAIN"
          ],
          "privateKey": "$PRIVATE_KEY",
          "shortIds": [
            "$SHORT_ID"
          ],
          "fingerprint": "chrome"
        }
      }
    }
  ],
  "outbounds": [
    {
      "protocol": "freedom"
    }
  ]
}
EOF

# Проверка конфига
if /usr/local/bin/xray run -test -config /usr/local/etc/xray/config.json > /dev/null 2>&1; then
    echo -e "${G}✓ Config is valid${NC}"
else
    echo -e "${R}Error: Invalid config${NC}"
    exit 1
fi

# Настройка прав для порта
if [ "$XRAY_PORT" -lt 1024 ]; then
    sed -i 's/User=nobody/User=root/' /etc/systemd/system/xray.service 2>/dev/null || true
    systemctl daemon-reload
fi

# Настройка firewall
if command -v ufw > /dev/null 2>&1; then
    ufw allow 22/tcp 2>/dev/null || true
    ufw allow $XRAY_PORT/tcp 2>/dev/null || true
    echo "y" | ufw enable 2>/dev/null || true
fi

# Запуск
systemctl restart xray
systemctl enable xray > /dev/null 2>&1
sleep 2

if systemctl is-active --quiet xray; then
    echo -e "${G}✓ Xray is running${NC}"
else
    echo -e "${R}Error: Xray failed to start${NC}"
    journalctl -u xray -n 20 --no-pager
    exit 1
fi

# VLESS ссылка
VLESS_URI="vless://$UUID@$SERVER_IP:$XRAY_PORT?encryption=none&flow=xtls-rprx-vision&security=reality&sni=$SNI_DOMAIN&fp=chrome&pbk=$PUBLIC_KEY&sid=$SHORT_ID&type=tcp#Xray_Reality"

echo "$VLESS_URI" > /root/xray_client_data/vless_link.txt
echo "$SNI_DOMAIN" > /root/xray_client_data/sni_domain.txt
echo "$PUBLIC_KEY" > /root/xray_client_data/public_key.txt

echo ""
echo -e "${G}========================================${NC}"
echo -e "${G}         INSTALLATION COMPLETE          ${NC}"
echo -e "${G}========================================${NC}"
echo -e "${C}SNI Domain: $SNI_DOMAIN${NC}"
echo -e "${C}Port: $XRAY_PORT${NC}"
echo ""
echo -e "${G}VLESS Link:${NC}"
echo -e "${Y}$VLESS_URI${NC}"
echo ""
echo -e "${G}Saved to: /root/xray_client_data/vless_link.txt${NC}"
echo ""
systemctl status xray --no-pager | grep Active