#!/bin/bash

iniciar(){
modprobe iptable_nat
#echo 1 > /proc/sys/net/ipv4/ip_ipforward
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -m tcpmss --mss \
1400:1536 -j TCPMSS --clamp-mss-to-pmtu
}

parar(){
iptables -F -t nat
}

case "$1" in
"start") iniciar ;;
"stop") parar ;;
"restart") parar; iniciar ;;
*) echo "Use os parâmetros start ou stop"
esac
