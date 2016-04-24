#!/bin/sh
#Script criado por Hecton P.Domingos
#Transferindo arquivos via ssh sincronizando com rsync 

              dialog                                            \
              --title 'Backup via ssh e rsync' \
              --msgbox '\nVou primeiro estabelecer a conexao com o servidor
ssh, asntes de sincronizar os backups, e importante lembrar que as permissoes
devem estar setadas para o usuario que fara a conexao, se nao tiver, havera
 erros graves, nao sera feita a copia da pasta do backup, revise primeiro 
as pemisoes no servidor, depois tente fazer o backup. Importante!!!
E necessario que tenha instalado no sistema o rsync!!! ' \
              40 60 ;  
              dialog                                            \
              --title 'Insira os dados' \
              --msgbox '\nPara estabelecer s conexao com o servidor ssh
preciso que voce me forneca os parametros corretos para a conexao.
Primeiro preciso que voce me  forneca o login que fara a conexao 
depois o login remoto seguido do IP da maquina mais a pasta remota
mais a pasta local..... '\
  40 60 ;
dialog --inputbox "Login Local pra cria a conexao" 10 60  \
               "$USER"  2> /tmp/user.tmp ; user=`cat '/tmp/user.tmp'` ;
dialog --inputbox "Login remoto + IP + pasta remota" 10 60  \
               "$USER@192.168.0.1:/home/"  2> /tmp/loginremoto.tmp ; \
loginippasta=`cat '/tmp/loginremoto.tmp'` ;  \
dialog --inputbox "Pasta Local a ser feito o backup" 10 60  \
               "/home/$USER"  2> /tmp/pastalocal.tmp ;    \
pastalocal=`cat '/tmp/pastalocal.tmp'` ;
 rsync -av --rsh=ssh -l $user $pastalocal $loginippasta \
