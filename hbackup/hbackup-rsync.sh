#!/bin/sh
#Sincronizando pasta para backup
#Script Criado por Hecton P.Domingos


dialog --inputbox "Informe a origem dos dados" 10 60  \
               "~/"  2> /tmp/origem.tmp ; orig=`cat '/tmp/origem.tmp'` ;
dialog --inputbox "Informe o dirtorio de destino" 10 60  \
               "/dev/hdc"  2> /tmp/destino.tmp ; \
dest=`cat '/tmp/destino.tmp'` ;  \


rsync -avz $orig $dest/ ;
#rsync -Cravzp $orig $dest/ ;
echo -e "\a" ; sleep 1 ; echo -e "\a" ; sleep 1 ;
dialog --infobox 'Feito o sincronismo para sua pasta destino' 5 40 ;



# rsync -avz $orig $dest/ root@192.168.0.1:/root/rem/ /kurumin/dest