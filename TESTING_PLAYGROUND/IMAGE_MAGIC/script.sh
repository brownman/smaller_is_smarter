set_env(){
    echo
}

url(){
    echo  http://www.commandlinefu.com/commands/tagged/41/imagemagick/sort-by-votes
}
help(){
    echo "[options]"
    cat $0  | grep "(){" | sed 's/(){//g' | tr -s ' '
}
# cmd=${1:-help}

#type $cmd && eval "$cmd"
steps(){
    set_env
    remove_background
}
file_source="${1:-source.png}"
file_target=target.png

echo "[file source] : _ $file_source _"
steps
echo /usr/bin/display $file_target
