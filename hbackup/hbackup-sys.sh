#!/bin/bash
#Script criado por Hecton P.Domingos
# sempre execute como root
touch /tmp/iso.tmp
touch /tmp/gravadora.tmp
mkdir /home/backup
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
                   /etc/network /etc/apache2 /var/www/ /etc/cups/ /var/lib/mysql
/etc/ssh/ /etc/proftpd.conf /etc/services' \
              40 60 ;  
mkdir /tmp/backup-burn ;

dialog --inputbox "Velocidade a ser gravado o backup?" 10 60  \
               "4"  2> /tmp/velocidade.tmp ; velo=`cat '/tmp/velocidade.tmp'` ;
dialog --inputbox "Qual o dispositivo usado?" 10 60  \
               "/dev/hdc"  2> /tmp/gravadora.tmp ; \
gravadora=`cat '/tmp/gravadora.tmp'` ;  \
iso=`cat '/tmp/iso.tmp'` ; cp -r *.tar.gz /tmp/backup-burn ;  \
                tar -cvzf Backup-Arquivos-sistema-$data.tar.gz /var/lib/mysql \
/etc/passwd /etc/shadow /etc/groups /etc/lilo.conf /etc/fstab \
 /etc/sudoes  /etc/resolv.conf /etc/exports /etc/squid/  \
/etc/dhcp3 /etc/dhcpc /etc/dhcp.conf /etc/X11/xorg.conf /etc/network   \
/etc/apache2 /etc/init.d/bootmisc.sh /var/www/ /etc/cups/ /etc/ssh/ ~/.ssh/ /etc/services  \
/etc/proftpd.conf ;  sleep 5 ; \
cd /tmp/ ; mkisofs -r -J -o Backup.iso /tmp/backup-burn ; sleep 5 ; \
cdrecord -v -fs=16M speed=$velo dev=$gravadora /tmp/Backup.iso ; \
sleep 5 ; echo "QUEIMA DO CD COMPLETADO COM SUCESSO, CONFIRA O CD POR FAVOR" ;\
sleep 5 ;;
           
 2) tar -cvzf Backup-Arquivos-etc-$data.tar.gz /etc ; sleep 6 ; \
echo -e "\a" ; sleep 1 ; echo -e "\a" ; sleep 1 ;
  echo "Feito o backup do diretorio etc" ;  sleep 7 ;;
	   
	   3)  ;;
	   
           
           0) break ;;
      esac
done
