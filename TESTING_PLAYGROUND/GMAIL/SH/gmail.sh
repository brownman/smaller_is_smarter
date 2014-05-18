#!/bin/bash -e
#url: https://packages.debian.org/unstable/mail/sendemail
#depend_package: sendemail libio-socket-ssl-perl libnet-ssleay-perl
#source: http://caspian.dotconf.net/menu/Software/SendEmail/sendEmail-v1.56.tar.gz

#extra:
# Define CC to (Note: for multiple CC use ,(comma) as seperator )
# CC_TO="loginrahul90@gmail.com"

set -o nounset
trap trap_err ERR


set_vars(){
#`MSG`

From_Mail="${arr[0]}"
To_Mail="${arr[1]}"
Subject="${arr[2]}"
Sndr_Uname="$LOGNAME"
Sndr_Passwd="$BASHRC_PASSWORD"
# Define mail server for sending mail [ IP:PORT or HOSTNAME:PORT ]
#RELAY_SERVER="smtp.gmail.com:587"

RELAY_SERVER="smtp.gmail.com"
Log_File=/tmp/log
#/var/log/sendmail.log
MSG="hi \n bye"
CC_TO=''
tls=no

                     #-cc '${CC_TO}' \
#auto/yes
}


send(){
local cmd="sendemail -v -f ${From_Mail} \
                     -t ${To_Mail} -u '${Subject}' \
                     -m '$MSG'  \
                     -xu ${Sndr_Uname} \
                     -xp ${Sndr_Passwd} \
                     -o tls=$tls \
                     -s ${RELAY_SERVER} \
                     -l ${Log_File}"
echo "[cmd] $cmd"
eval "$cmd"
}

steps(){
type arr_print &>/dev/null  && { arr_print; } 
set_vars
send
}
arr=( $@ )
steps
