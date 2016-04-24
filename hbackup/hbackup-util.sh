#!/bin/sh
#Script criado por Hecton P.Domingos
#

 while : ; do
  
# Menu do programa, simples e funcional.
         menu=$(
        dialog --stdout               \
               --title 'Backup-Linux'  \
               --menu 'Menu    Tools   Hecton' \
              0 0 0                   \
              1 'e2fsck' \
              2 'Compartilhar net'  \
              3 'Add dir samba'     \
              4 'Kill User'   \
              5 'Atribuir IP' \
              6 'Baixar Pre-Confs'  \
	      7 'Conf Fstab' \
              8 'Montar Compartilhamento' \
              0 'Sair' )
         
      [ $? -ne 0 ] && break
 
# Disparo do menu, sem complicacao, 
      case "$menu" in

           1) ./hbackup-home.sh ;;
           
	   2)      
                dialog --inputbox "Qual placa de rede esta a internet?" 10 60  \
               "eth0"  2> /tmp/placa.tmp ; placa=`cat '/tmp/placa.tmp'` ;

                   modprobe iptable_nat
                   echo 1 > /proc/sys/net/ipv4/ip_ipforward
                   iptables -t nat -A POSTROUTING -o $placa -j MASQUERADE
                   iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -m tcpmss --mss \
                   1400:1536 -j TCPMSS --clamp-mss-to-pmtu ;
                echo -e "\a" ; sleep 1 ; echo -e "\a" ; sleep 1 ;
               dialog --infobox "Concluido o compartilhamento" 10 60 ; sleep 2 ;;
	   
	   3) ./hbackup-smb.sh ;;

           4)  dialog --inputbox "Informe o usuario que vc deseja matar todos os processos" 10 60  \
               "?"  2> /tmp/user.tmp ; user=`cat '/tmp/user.tmp'` ;
kill -9 `ps -fu $user |awk '{ print $2 }'|grep -v PID` ;;
	    
           5) dialog --inputbox "Qual placa deseja atribuir o IP?" 10 60  \
              "eth0"  2> /tmp/placa.tmp ; placa=`cat '/tmp/placa.tmp'` ; 
             dialog --inputbox "Qual IP deseja atribuir?" 10 60  \
              "10.1.1.1"  2> /tmp/ip.tmp ; ip=`cat '/tmp/ip.tmp'` ;
              dialog --inputbox "Mascara de subrede" ; \
              "255.0.0.0"  2> /tmp/mask.tmp ; mask=`cat '/tmp/mask.tmp'` ;
              dialog --inputbox "Qual Gateway deseja atribuir?" 10 60  \
              "gateway"  2> /tmp/gateway.tmp ; gateway=`cat '/tmp/gateway.tmp'` ;
               
              dialog --inputbox "Qual DNS?" 10 60  \
              "servidor 200.010.55.12"  2> /tmp/dns.tmp ; dns=`cat '/tmp/dns.tmp'` ;

              ifconfig $placa $ip netmask $mask up ;
              route del default   ;
              route add default gw $gateway dev $placa ;
              cat /tmp/dns.tmp >> /etc/resolv.conf ;;

            6) ./hbackup-down.sh ;;
            
           7)  dialog --inputbox "Informe o device?" 10 60  \
              "/dev/hdaX"  2> /tmp/fstab.tmp ; fstab=`cat '/tmp/fstab.tmp'` ;
            dialog --inputbox "Qual o ponto de montagem?" 10 60  \
              "/mnt/hdaX"  2> /tmp/ponto.tmp ; ponto=`cat '/tmp/ponto.tmp'` ;
            dialog --inputbox "Informe o sistema de arquivos a ser montado.
            /dev/hda5 /mnt/hda5 reiserfs noauto,users,exec 0 0
# Entrada para montar a particao NTFS em modo leitura e escrita utilizando o ntfs-3g:
 ntfs-3g silent,locale=pt_BR.iso88591,umask=0 0 0" 10 60  \
              "ntfs-3g silent,locale=pt_BR.iso88591,umask=0 0 0"  2> /tmp/sis.tmp ; sis=`cat '/tmp/sis.tmp'` ;
echo "#montagem criado pelo hbackup"
echo "$fstab $ponto $sis" >> /etc/fstab
             
            dialog --infobox "Concluido a configuração - $fstab $ponto $sis" 10 60 ; sleep 2 ;;



            8)  dialog --inputbox "Informe o ip da maquina do compartilhamento" 10 60  \
              "10.1.1."  2> /tmp/ipcomp.tmp ; ipcomp=`cat '/tmp/ipcomp.tmp'` ;
             dialog --inputbox "Qual o cmpartilhamento dejesa montar?" 10 60  \
              "c"  2> /tmp/compart.tmp ; compart=`cat '/tmp/compart.tmp'` ;
               dialog --inputbox "Onde deseja montar o compartilhamento?" 10 60  \
              "/mnt/comp-rede"  2> /tmp/mountcompart.tmp ; mountcompart=`cat '/tmp/mountcompart.tmp'` ;
              
              mkdir $mountcompart

            dialog --inputbox "informe o usuario da maquina remota" 10 60  \
              "administrador"  2> /tmp/useremot.tmp ; useremot=`cat '/tmp/useremot.tmp'` ;

       dialog                                           \
     --title 'Passwords'                         \
     --passwordbox 'Por favor, confirme a senha:'   0 0 \
2> /tmp/userpass.tmp ; userpass=`cat '/tmp/userpass.tmp'` ;
 
mount -t smbfs //$ipcomp/$compart $mountcompart -o username=$useremot,password=$userpass

;;
            0) break ;;
      esac
done

