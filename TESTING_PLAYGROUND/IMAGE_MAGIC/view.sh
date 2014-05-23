file=$1
if [ -f "$file" ];then
display $file
else
echo "Please supply a file"
fi

