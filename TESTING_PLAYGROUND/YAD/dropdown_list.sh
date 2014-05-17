set -o nounset

clear
set_env(){
    dir_self=`pwd`
    dir_data=$dir_self/TXT
    file_to=$dir_data/to.txt
    file_from=$dir_data/from.txt
}

str_to_arr(){
    local str="$1"
    local delimeter=${2:-'|'}
    IFS=$delimeter read -a arr <<< "$str"
}

file_to_str(){
    local file=$1
    #local arr=(`cat $file`)
    #local str="${arr[@]}"
local str=`cat $file`
    echo "$str"
}

print_dialog(){
    local str_to=$( echo `file_to_str $file_to` )
    local str_from=$( echo `file_to_str $file_from` )
#    echo $str_to str_to
#echo $str_to
#echo $str_from
 #   exit
 yad     --skip-taskbar \
            --form \
            --item-separator=' ' \
        --center --title="Print dialog" \
            --field="to":CB "$str_to" \
            --field="from":CB "$str_from" \
            --field="Attachment:FL" 
#        {--image,--window-icon}=/usr/share/icons/Tango/72x72/devices/printer1.png 
#            --form --item-separator=' ' \

#    exit



#working:     --field="from":CB "1 2 3" \
}


steps(){
    set_env
    print_dialog
}
steps
