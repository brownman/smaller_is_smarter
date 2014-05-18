#!/bin/bash -e
#sendEmail -f advance.linux2@gmail.com -t advance.linux2@gmail.com -u "this is the test subject" -m "this is a test message" -s "smtp.gmail.com" -o tls=yes -xu advance.linux2 -xp $BASHRC_PASSWORD

#debug: http://danielthat.blogspot.co.il/2012/10/how-to-send-email-from-command-line.html
#bug: A temporary workaround is to edit the file /usr/bin/sendemail on line 1907 by changing 'SSLv3 TLSv1'in  to 'SSLv3',
#sendEmail -f from@gmail.com -t to@domain.com -u "This is my subject"  -m "Body of my message" -s smtp.gmail.com -o tls=yes -xu username -xp password


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
textArea="${arr[3]}"
Attachment="${arr[4]}"
Sndr_Uname="$BASHRC_USER"
Sndr_Passwd="$BASHRC_PASSWORD"
# Define mail server for sending mail [ IP:PORT or HOSTNAME:PORT ]
#RELAY_SERVER="smtp.gmail.com:587"

RELAY_SERVER="smtp.gmail.com"
Log_File=/tmp/log
#/var/log/sendmail.log
CC_TO=''
tls=auto

                     #-cc '${CC_TO}' \
#auto/yes
}


send(){
    local cmd=""
    if  [ -f "$Attachment" ];then
cmd="sendemail -v \
                     -f ${From_Mail} \
                     -t ${To_Mail}  \
                     -u '${Subject}' \
                     -m '${textArea}'  \
                     -a ${Attachment} \
                     -xu ${Sndr_Uname} \
                     -xp ${Sndr_Passwd} \
                     -o tls=${tls} \
                     -s ${RELAY_SERVER} \
                     -l ${Log_File}"
       
    else
        flite -t "no attachment"
        notify-send "no attachment"
cmd="sendemail -v \
                     -f ${From_Mail} \
                     -t ${To_Mail}  \
                     -u '${Subject}' \
                     -m '${textArea}'  \
                     -xu ${Sndr_Uname} \
                     -xp ${Sndr_Passwd} \
                     -o tls=${tls} \
                     -s ${RELAY_SERVER} \
                     -l ${Log_File}"

    fi
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
