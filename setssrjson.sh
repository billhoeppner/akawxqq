#!/usr/bin/env bash
set_json(){
    cat > /etc/shadowsocks-r/config.json<<-EOF
{
    "server":"0.0.0.0",
    "server_ipv6": "[::]",
    "local_address":"127.0.0.1",
    "local_port":1080,
    "port_password":{
	    "$port":"abcd749748"
    },
    "timeout":120,
    "method":"none",
    "protocol": "auth_chain_d",
    "protocol_param": "",
    "obfs": "plain",
    "obfs_param": "",
    "redirect": "",
    "dns_ipv6": false,
    "fast_open": false,
    "workers": 1
}
EOF
 
}

if [ -f /etc/shadowsocks-r/config.json ]
then
    echo -e "json file existed."
    if grep -q '"server_port":' /etc/shadowsocks-r/config.json
    then
        port=`cat /etc/shadowsocks-r/config.json | grep '"server_port":' | grep -o '[0-9]\+'`
        echo -e "port is $port."
        set_json
        if grep -q $port /etc/shadowsocks-r/config.json
        then
            echo -e "json file edited successfully."
            /etc/init.d/shadowsocks-r restart
        else
            echo -e "[${red}Error${plain}] Edit jason file failed."
        fi
    elif grep -q '"port_password":' /etc/shadowsocks-r/config.json
    then
        echo -e "[${red}Error${plain}] The json file has already been edited."
    fi
fi
