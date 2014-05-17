#!/bin/bash
 
arrayA=(1 2 3 4 5 6 7 8 9 10) #Dichiarazione di un Array contenente 10 elementi
declare -a arrayB     #Dichiarazione di un Array vuoto
declare -a arrayC    #Dichiarazione di un Array vuoto
 
for i in ${arrayA[@]};do    #Passo ogni elemento $ArrayA all'interno di $i
arrayB[$i]=$(($i**2))    #Il valore di $i viene utilizzato come indice dell'ArrayB che al suo interno verrà messo il quadrato.
arrayC[$i]=$(($i**3))    #Il valore di $i viene utilizzato come indice dell'ArrayC che al suo interno verrà messo il cubo.
done
 
echo "Array con ${arrayA[@]} valori normali."
echo "Array con ${arrayB[@]} valori al quadrato."
echo "Array con ${arrayC[@]} valori al cubo."
 
exit 0
- See more at: http://toshidex.org/2013/01/16/progetto-bash-array-parte-pratica-i/#sthash.XTueiXYT.dpuf
