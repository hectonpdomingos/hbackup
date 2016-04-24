#!/bin/sh
# script criado por Hecton Paulino Domingos


dialog --inputbox "Qual o grupo ou domino do compartilhamento?" 10 60  \
               "grupo"  2> /tmp/grupo.tmp ; grupo=`cat '/tmp/grupo.tmp'` ;

dialog --inputbox "Compartilhamento a nivel de diretorio ou usuario??" 10 60  \
               "users"  2> /tmp/nivel.tmp ; nivel=`cat '/tmp/nivel.tmp'` ;

dialog --inputbox "O compartilhamento sera visivel no ambiente de rede?" 10 60  \
               "yes"  2> /tmp/visivel.tmp ; visivel=`cat '/tmp/visivel.tmp'` ;

dialog --inputbox "O compartilhamento sera leitura e escrita?" 10 60  \
               "yes"  2> /tmp/escrita.tmp ; escrita=`cat '/tmp/escrita.tmp'` ;

dialog --inputbox "Coloque um cometario no compartilhamento?" 10 60  \
               "Compartilhada"  2> /tmp/coment.tmp ; coment=`cat '/tmp/coment.tmp'` 

dialog --inputbox "Qual a Pasta a ser compartilhada?" 10 60  \
               "$home"  2> /tmp/dir.tmp ; dir=`cat '/tmp/dir.tmp'` ;


echo "# Samba config file created using hbackup" > smb.conf
echo "# from 127.0.0.1 (127.0.0.1)" >> smb.conf
echo "# Date: 2007/09/20 22:09:22" >> smb.conf

echo "[global]" >> smb.conf
echo "	workgroup = $grupo" >> smb.conf
echo "	server string = %h server" >> smb.conf
echo "	obey pam restrictions = Yes" >> smb.conf
echo "	passdb backend = tdbsam" >> smb.conf
echo "	passwd program = /usr/bin/passwd %u" >> smb.conf
echo "	passwd chat = *Enter\snew\sUNIX\spassword:* %n\n *Retype\snew\sUNIX\spassword:* %n\n *password\supdated\ssuccessfully* ." >> smb.conf
echo "	syslog = 0" >> smb.conf
echo "	log file = /var/log/samba/log.%m" >> smb.conf
echo "	max log size = 1000" >> smb.conf
echo "	os level = 100" >> smb.conf
echo "	dns proxy = No" >> smb.conf
echo "	ldap ssl = no" >> smb.conf
echo "	panic action = /usr/share/samba/panic-action %d" >> smb.conf
echo "	invalid users = root" >> smb.conf
echo "     " >> smb.conf
echo "[homes]" >> smb.conf
echo "	comment = Home Directories" >> smb.conf
echo "	valid $users = %S" >> smb.conf
echo "	create mask = 0700" >> smb.conf
echo "	directory mask = 0700" >> smb.conf
echo "	browseable = $visivel" >> smb.conf
echo "   "
echo "[printers]" >> smb.conf
echo "	comment = All Printers" >> smb.conf
echo "	path = /var/spool/samba" >> smb.conf
echo "	create mask = 0700" >> smb.conf
echo "	printable = Yes" >> smb.conf
echo "	browseable = $visivel" >> smb.conf
echo "   " >> smb.conf
echo "[print$]" >> smb.conf
echo "	comment = Printer Drivers" >> smb.conf
echo "	path = /var/lib/samba/printers" >> smb.conf
echo "  " >> smb.conf
echo "[/$coment/]" >> smb.conf
echo "	comment = $coment" >> smb.conf
echo "	path = $dir" >> smb.conf
echo "	read only = $escrita" >> smb.conf
echo "	browseable = $visivel" >> smb.conf
echo "	hosts allow = 192.168.0.*" >> smb.conf
