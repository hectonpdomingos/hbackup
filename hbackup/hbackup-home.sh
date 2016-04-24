#!/bin/sh
#criando backups do diretorio home
dt=`date '+%H-%M-%d-%m-%Y'`
DATA1=`date '+%y-%m-%d'`
DATA=`date '+%y-%m-%d-%H.%M'`

mkdir /tmp/backup-$DATA1
cd /tmp/backup-$DATA1
touch /tmp/dir.tmp

 while : ; do

              submenu=$(
                 dialog --stdout               \
               --title 'Criando backup do Home'  \
               --menu 'Menu' \
              0 0 0                   \
              1 'Seu home' \
              2 'Todos os homes'  \
              3 'Escolha o home'     \
              4 'Sincronizar com Servidor' \
              0 'Sair'      )
          
# Disparo 
              [ $? -ne 0 ] && break
              case "$submenu" in
              
             1) tar -cvzf Backup-My-home-$dt.tar.gz  /home/$USER ; \
                sleep 8 ; echo "Feita a copia dos backups pra sua pasta Home"  ;
                 sleep 5 ;;
              
             2) cd /tmp/backup-$DATA1 ; tar -zcvf Backup-All-home-$dt.tar.gz \
              /home/ ; \
                sleep 8 ; echo "Feita a copia De todos os Homes" ; sleep 5 ;;
             
             
 
             3) dialog --inputbox "Qual o diretorio voce vai fazer o backup?" 10 60  \
               "/home/$USER/"  2> /tmp/dir.tmp ; dir=`cat '/tmp/dir.tmp'` ;   \
                tar -zcvf Backup-Select-$dt.tar.gz $dir \
               ; sleep 7 ; echo " Feito o  backup" ; sleep 5 ;;

   4) clear ; echo "Sincronizar diretorio com o diretorio remoto montado" ; \
 echo " " ;  \
echo " "  ;   \
echo "CUIDADO COM AS PERMISSOES DO DIRETORIO" ; \
echo " "  ; \
sleep 5 ; \
dialog --inputbox "Qual o diretorio Local voce vai Sincronizar?" 10 60 \
   "/home/$USER/"  2> /tmp/dirlocal.tmp ; dirlocal=`cat '/tmp/dirlocal.tmp'` ; \
dialog --inputbox "Diretorio remoto montado em" 10 60 \
   "/mnt/backup"  2> /tmp/dirmontado.tmp ; dirmontado=`cat \
'/tmp/dirmontado.tmp'` ; 
rsync -av $dirlocal $dirmontado \
               ; sleep 2 ;echo -e "\a" ; echo "sincronizados" ; sleep 2 ;;
             
             0) break ;;
      esac
done
