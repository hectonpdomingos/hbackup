#!/bin/sh
#Script criado por Hecton Paulino Domingos
#Script para Instalar programas via apt-get

data=$(date +%d-%m-%y)
 while : ; do
  
# Menu do programa, simples e funcional.
         menu=$(
        dialog --stdout               \
               --title 'Backup-Linux'  \
               --menu 'Menu-Instalando Programas' \
              0 0 0                   \
              1 'Instalar Squid' \
              2 'Instalar Samba'  \
              3 'Instalar DHCP'     \
              4 'Instalar Apache'        \
              5 'Instlar SWAT' \
              6 'Instalar Sarg'  \
              0 'Sair' )
         
      [ $? -ne 0 ] && break
 
# Disparo do menu, sem complicacao, 
      case "$menu" in

           1)  /usr/bin/apt-get install squid; sleep 7 ;;
           
	   2) /usr/bin/apt-get install samba;;
	   
	   3) /usr/bin/apt-get install dhcp3-server ;;
	              
           4) /usr/bin/apt-get install apache2 ;; 

           5) /usr/bin/apt-get install swat ;;
           
	   6) /usr/bin/apt-get install sarg ;;
                        

           0) break ;;
      esac
done

