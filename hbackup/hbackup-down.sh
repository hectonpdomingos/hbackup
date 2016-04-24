#!/bin/bash
#Script criado por Hecton P.Domingos hectonsuport@yahoo.com.br
#

while : ; do
  
# Menu do programa, simples e funcional.
         menu=$(
        dialog --stdout               \
               --title 'Backup-Linux Baixar Pre-confs'  \
               --menu 'Menu    Tools   Hecton' \
              0 0 0                   \
              1 'Squid' \
              2 'Samba'  \
              3 'DHCP'     \
              4 'Fstab'   \
              5 'Source.list' \
              0 'Sair' )
         
      [ $? -ne 0 ] && break
 
# Disparo do menu, sem complicacao, 
      case "$menu" in

           1) dialog                    \
              --title 'Hbackup - Baixar Squid'  \
              --msgbox 'Baixar uma pre-conf do squid que coloquei no servidor ftp do geocities
http://geocities.yahoo.com.br/hectonsuport, os arquivos estão compactados em zip.  ' 10 50 \
 
wget http://geocities.yahoo.com.br/hectonsuport/files/compactados/squid.zip ;;
           
	   2)  dialog                    \
              --title 'Hbackup - Baixar Samba'  \
              --msgbox 'Baixar uma pre-conf do samba que coloquei no servidor ftp do geocities
http://geocities.yahoo.com.br/hectonsuport, os arquivos estão compactados em zip.  ' 10 50 \
 
wget http://geocities.yahoo.com.br/hectonsuport/files/compactados/samba.zip ;;


            3) dialog                    \
              --title 'Hbackup - Baixar DHCP'  \
              --msgbox 'Baixar uma pre-conf do DHCP que coloquei no servidor ftp do geocities
http://geocities.yahoo.com.br/hectonsuport, os arquivos estão compactados em zip.  ' 10 50 \
 
wget http://geocities.yahoo.com.br/hectonsuport/files/compactados/dhcp.zip ;;



            4)  dialog                    \
              --title 'Hbackup - Baixar fstab'  \
              --msgbox 'Baixar uma pre-conf do fstab que coloquei no servidor ftp do geocities
http://geocities.yahoo.com.br/hectonsuport, os arquivos estão compactados em zip. ela inclui
os parametros do ntfs-3g.  ' 10 50 \
 
wget http://geocities.yahoo.com.br/hectonsuport/files/compactados/fstab.zip ;;



            5) dialog                    \
              --title 'Hbackup - Baixar Source.list'  \
              --msgbox 'Baixar uma pre-conf do source.list que coloquei no servidor ftp do geocities
http://geocities.yahoo.com.br/hectonsuport, os arquivos estão compactados em zip.  ' 10 50 \
 
wget http://geocities.yahoo.com.br/hectonsuport/files/compactados/source.list.zip ;;


            0) break ;;
      esac
done
