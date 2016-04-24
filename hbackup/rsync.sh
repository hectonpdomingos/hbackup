#!/bin/sh
# Script criado por Hecton P.Domingos
# Script de backup, usando o rsync pra sincronizar os dados do servidor com o cliente

menu=$(
dialog --stdout  \
     --title 'Backup-Linux'\
     --menu  'Menu'\
     0 0 0  \
     1 'Criar Autenticação auto' \
     2 'Sincronizar' \
     0 'Sair' \
     
     [ $? ne 0 ] && break
     
     case "$menu" in
     
     #1) ssh-keygen -t dsa -f ~/.ssh/id_dsa ; \
     #cat ~/.sd/id_dsa.pud | ssh root@127.0.0.1 'cat - >> ~/.ssh/authorized_keys' ; \
     #cat ~/.ssh/id_dsa.pud >> ~/.ssh/authorized_keys ;;

     
     J)2) rsync -avz root@10.1.1.1:/usr/local/ /home/kurumin/rsync ;;

     0) break ;;
  esac
done  
