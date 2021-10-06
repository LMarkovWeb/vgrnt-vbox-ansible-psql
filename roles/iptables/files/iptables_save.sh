#!/bin/bash

#
export WAN=eth0

#
export LAN1=eth1
export IP_RANGE_3=192.168.10.0/24


# delete rules
iptables -F

#------------
#-- rules ---
#------------

# localhost
iptables -A INPUT  -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# all output connection to internet
iptables -A OUTPUT -o $WAN -j ACCEPT

# allow ssh connect from company network
iptables -A INPUT -i $WAN -p tcp --dport 22 -s $IP_RANGE_1 -j ACCEPT

iptables -t filter -A INPUT -s $IP_RANGE_1 -j ACCEPT
iptables -t filter -A INPUT -s $IP_RANGE_2 -j ACCEPT
iptables -t filter -A INPUT -s $IP_RANGE_3 -j ACCEPT
iptables -t filter -A INPUT -s $IP_RANGE_4 -j ACCEPT

# PostgreSQL listen on TCP port 5432
iptables -A INPUT -p tcp --dport 5432 -s $IP_RANGE_1 -j ACCEPT
iptables -A INPUT -p tcp --dport 5432 -s $IP_RANGE_2 -j ACCEPT
iptables -A INPUT -p tcp --dport 5432 -s $IP_RANGE_3 -j ACCEPT
iptables -A INPUT -p tcp --dport 5432 -s $IP_RANGE_4 -j ACCEPT

# allow ping
iptables -A INPUT -p icmp -m icmp --icmp-type 3 -j ACCEPT
iptables -A INPUT -p icmp -m icmp --icmp-type 8 -j ACCEPT

iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

# block all input traffic
iptables -P INPUT DROP
iptables -P FORWARD DROP

# save rules
service iptables save  > /etc/sysconfig/iptables

systemctl restart iptables.service