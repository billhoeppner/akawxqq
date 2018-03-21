#!/usr/bin/env bash
if [ -f /etc/shadowsocks-r/config.json ]
then
    if grep -Fxq '"server_port":' /etc/shadowsocks-r/config.json
    then
        port=cat /etc/shadowsocks-r/config.json | grep '"server_port":' | grep -o '[0-9]\+'
    elif grep -Fxq '"port_password":' /etc/shadowsocks-r/config.json
    then
        echo -c "[${red}Error${plain}] The json file has been edited already."
    fi
fi
