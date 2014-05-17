#!/bin/bash
 
declare -A userpass  #Dichiarazione di un Array associativo
 
userpass=( ["Ennio"]="123456"
["Pippo"]="1q2w3e4r"
["Luigi"]="B0sc0l4nd14" )   #Array associativo
 
echo "Login: "
read username
 
echo "Password: "
read -s password
 
if [[ ${userpass[$username]} == $password ]]; then
echo "Login eseguito con successo!"
else
echo "No no. Non puoi entrare!"
fi
- See more at: http://toshidex.org/2013/01/16/progetto-bash-array-parte-pratica-i/#sthash.XTueiXYT.dpuf
