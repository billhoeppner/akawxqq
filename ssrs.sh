if /etc/init.d/shadowsocks-r status | grep -Eqi 'running'
then
    :
else
    /etc/init.d/shadowsocks-r start
    if /etc/init.d/shadowsocks-r status | grep -Eqi 'running'
    then
        :
    else
        reboot
    fi
fi
