#!/bin/bash
#Script criado por Hecton P.Domingos
#

dialog --msgbox 'Recomendo antes de executar o processo, use o cfdisk pra ver quem é o seu device' 10 40
dialog --inputbox "Informe o device de origem" 10 60  \
               "hda"  2> /tmp/origem.tmp ; orig=`cat '/tmp/origem.tmp'` ; \

dialog --inputbox "Informe o device de destino" 10 60  \
               "hdb"  2> /tmp/devicedestino.tmp ; dest=`cat '/tmp/devicedestino.tmp'` ; \
dialog --msgbox 'assim que o processo tesminar aparecera uma tela de terminado.' 10 40
dd if=/dev/$orig of=/dev/$dest
dialog --msgbox 'Processo terminado confira a imagem.' 5 40