#!/bin/bash
#Script criado por Hecton P.Domingos
#

data=$(date +%d-%m-%y)

 while : ; do
  
# Menu do programa, simples e funcional.
         menu=$(
        dialog --stdout               \
               --title 'Backup dos arquivos de sistema'  \
               --menu 'Menu' \
              0 0 0                   \
              1 'Arquivos ja listados' \
              2 'Todo /etc'  \
              3 'Selecionar arquivos'     \
              0 'Sair'      )
         
      [ $? -ne 0 ] && break
 
# Disparo do menu, sem complicacao, 
      case "$menu" in

           1)  dialog                                            \
              --title 'Backup dos arquivos listados abaixo' \
              --msgbox '\nVou criar o backup dos diretorios e arquivos listados  
                    /etc/passwd /etc/shadow  /etc/groups /etc/lilo.conf /etc/fstab     /etc/sudoes /etc/resolv.conf /etc/exports /etc/squid.conf 
                   /etc/dhcp3 /etc/dhcpc /etc/dhcp.conf /etc/X11/xorg.conf 
                   /etc/networks /etc/apache2 /var/www/ /etc/cups/ /var/lib/mysql ' \
              40 60 ;   \
                tar -cvzf Backup-Arquivos-sistema-$data.tar.gz /var/lib/mysql \
/etc/passwd /etc/shadow /etc/groups /etc/lilo.conf /etc/fstab \
 /etc/sudoes  /etc/resolv.conf /etc/exports /etc/squid.conf  \
/etc/dhcp3 /etc/dhcpc /etc/dhcp.conf /etc/X11/xorg.conf /etc/networks   \
/etc/apache2 /var/www/ /etc/cups/ ;;
           
	   2) hbackup-sys.sh ;;
	   
	   3) hbackup-mbr.sh ;;
	   
           
           0) break ;;
      esac
done