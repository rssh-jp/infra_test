#!/bin/sh

iptables -F

# 初期化
iptables -P INPUT DROP
iptables -P FORWARD DROP

ALLOW_IP=192.168.56.1
LOCAL_IP=192.168.56.200

# 初期化の後に呼ぶように
iptables -A INPUT -p tcp -s $ALLOW_IP -d $LOCAL_IP --dport 22 -j ACCEPT
iptables -A OUTPUT -p tcp -s $LOCAL_IP --sport 22 -d $ALLOW_IP -j ACCEPT

iptables -N LOGGING
iptables -A LOGGING -j LOG --log-level warning --log-prefix "DROP:" -m limit
iptables -A LOGGING -j DROP
iptables -A INPUT -j LOGGING

