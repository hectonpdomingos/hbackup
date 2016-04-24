#!/bin/bash
#Script criado por Hecton P.Domingos
#

while : ; do
  
# Menu do programa, simples e funcional.
         menu=$(
        dialog --stdout               \
               --title 'Backup-Linux'  \
               --menu 'Menu    Tools   Hecton' \
              0 0 0                   \
              1 'Gerar Backup' \
              2 'Importar Backup'  \
              0 'Sair' )
         
         [ $? -ne 0 ] && break
 
# Disparo do menu, sem complicacao, 
           case "$menu" in

           1) dialog --inputbox "Informe o device" 10 60  \
               "hda"  2> /tmp/device.tmp ; dev=`cat '/tmp/device.tmp'` ; \
cd ~/
dd if=/dev/$dev of=backup.mbr bs=512 count=1 ; \
echo -e "\a" ; sleep 1 ; echo -e "\a" ; sleep 1 ;
             dialog --infobox 'Feito o Backup para sua pasta home' 10 40 ; sleep 2 ;;
           
	   2) dialog --inputbox "Informe o diretorio" 10 60  \
               "/home/$user"  2> /tmp/dir.tmp ; dir=`cat '/tmp/dir.tmp'` \
            dialog --inputbox "Informe o device" 10 60  \
               "hda"  2> /tmp/device.tmp ; dev=`cat '/tmp/device.tmp'` ; \
dd if=/$dir of=/dev/$dev ; \
echo -e "\a" ; sleep 1 ; echo -e "\a" ; sleep 1 ;
            dialog --infobox 'Feito a importação do arquivo da MBR' 10 40 ; sleep 2 ;;

           0) break ;;
      esac
done
