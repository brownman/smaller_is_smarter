#debug: http://danielthat.blogspot.co.il/2012/10/how-to-send-email-from-command-line.html
#sendEmail -f from@gmail.com -t to@domain.com -u "This is my subject"  -m "Body of my message" -s smtp.gmail.com -o tls=yes -xu username -xp password

#http://www.cyberciti.biz/tips/linux-use-gmail-as-a-smarthost.html
reset
set -o nounset
set_env(){
    export dir_self=`pwd`
}

sourcing(){
### helper funcs
source  $dir_cfg/trap_err.cfg
    source $dir_cfg/str_to_arr.cfg
    source $dir_cfg/file_to_str.cfg
    source $dir_cfg/show_args.cfg
    source $dir_cfg/print_dialog.cfg
    source $dir_cfg/arr_print.cfg
### private params
    source $dir_conf/vars.conf

}
exporting(){
    export file_script=$dir_self/SH/gmail.sh
    export dir_txt=$dir_self/TXT
    export dir_cfg=$dir_self/CFG
    export dir_log=$dir_self/LOG
    export dir_conf=$dir_self/CONF

    ######compose a message: parameters
    export file_to=$dir_txt/to.txt
    export file_from=$dir_txt/from.txt
    export file_param=$dir_conf/vars.conf
    ######extensions:
    #monkey
    #translate
}

act(){

export arr=()
    str=`print_dialog`
    echo $?
    echo $str
    str_to_arr "$str"
    echo "${#arr[@]}"
#    ( set -e; show_args  )
#arr_print > /tmp/arr
#cat -n /tmp/arr
arr_print
local str_res=$(   show_args  )
local num_res=$?
echo
echo "[RESULTS]"
echo "$str_res"
echo "$num_res"

local cmd="$file_script \"${arr[@]}\""
#( trap trap_err ERR;  "$cmd")

echo  "[cmd] $cmd"
( trap trap_err ERR; eval  "$cmd" )
#show_args 
}

steps(){
    set_env
    exporting
    sourcing
    act
}
steps
echo the end
