#!/bin/sh
# script de backup criado por Hecton P.Domingos
mkdir /tmp/backup-burn

dialog --inputbox "Velocidade a ser gravado o backup?" 10 60  \
               "4"  2> /tmp/velocidade.tmp ; velo=`cat '/tmp/velocidade.tmp'` ;
dialog --inputbox "Qual o dispositivo usado?" 10 60  \
               "/dev/hdc"  2> /tmp/gravadora.tmp ; \
gravadora=`cat '/tmp/gravadora.tmp'` ;  \
iso=`cat '/tmp/iso.tmp'` ; cp -r *.tar.gz /tmp/backup-burn ;  \
cd /tmp/ ; mkisofs -r -J -o Backup.iso /tmp/backup-burn ; sleep 20 ; \
cdrecord -v -fs=16M speed=$velo dev=$gravadora /tmp/Backup.iso ;
sleep 10 ; echo "QUEIMA DO CD COMPLETADO COM SUCESSO, CONFIRA O CD POR FAVOR" ;\
sleep 10 ; \