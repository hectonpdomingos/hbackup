#!/bin/bash
#Script criado por Hecton P.Domingos
# redirecionando a porta 80 para a do squid 3128

dialog --inputbox "Interface" 10 60  \
               "eth0"  2> /tmp/interface.tmp ; inter=`cat '/tmp/interface.tmp'` ;
dialog --inputbox "Qual a porta a ser escutada?" 10 60  \
               "80"  2> /tmp/port.tmp ; \
port=`cat '/tmp/port.tmp'` ;  \
dialog --inputbox "Qual a porta a ser redirecionada?" 10 60  \
               "3128"  2> /tmp/redirec.tmp ; \
redirec=`cat '/tmp/redirec.tmp'` ;  \

iptables -t nat -A  PREROUTING -i $inter -p tcp --dport $port -j REDIRECT --to-port $redirec
echo -e "\a" ; sleep 1 ; echo -e "\a" ; sleep 1 ;;
