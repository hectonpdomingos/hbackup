#!/bin/sh
 while : ; do
  
# Menu do programa, simples e funcional.
         menu=$(
        dialog --stdout               \
               --title 'Transferindo arquivos via SSH com o SHFS'  \
               --menu 'Menu' \
              0 0 0                   \
              1 'Instalar o ' \
              2 'Backup dos arquivos do sitema'  \
              0 'Sair' )
         
      [ $? -ne 0 ] && break
 
# Disparo do menu, sem complicacao, 
      case "$menu" in

           1) ./hbackup-home.sh ;;
           
	   2) ./hbackup-sys.sh ;;
           0) break ;;
      esac
done
