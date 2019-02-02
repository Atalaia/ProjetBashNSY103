#!/bin/sh

# On choisit si on veut convertir décimaux en romans ou romans en décimaux en tapant 1 ou 2
# Ensuite l'utilisateur écrit le décimal ou le roman à convertir
# Le décimal ou le roman saisi par l'utilisateur est passé en paramètre dans la méthode correpondante
# dec_to_roman ou roman_to_dec

echo -n “Convertir décimal en chiffre roman : tapez 1 // Convertir chiffre roman en décimal : tapez 2 "
read convert
if [ "$convert == “1” ]; then
    echo -n “Veuillez écrire le décimal que vous voulez convertir : "

    read dectorom

    dec_to_roman dectorom


elif [ "$convert == 2" ]; then

    echo -n Veuillez écrire le chiffre roman que vous voulez convertir : "

	 read romtodec	

	 roman_to_dec romtodec

else

    echo "Il faut taper 1 ou 2!! Pas $convert"

fi

# Méthode qui fait la conversion de décimaux en romans

function dec_to_roman(dectorom) {
    local values=( 1000 900 500 400 100 90 50 40 10 5 4 1 )
    local roman=(
        [1000]=M [900]=CM [500]=D [400]=CD 
         [100]=C  [90]=XC  [50]=L  [40]=XL 
          [10]=X   [9]=IX   [5]=V   [4]=IV   
           [1]=I
    )
    local nvmber=""
    local num=$1
    for value in ${values[@]}; do
        while (( num >= value )); do
            nvmber+=${roman[value]}
            ((num -= value))
        done
    done
    echo $nvmber
}


# Méthode qui fait la conversion de romans en décimaux 

function roman_to_dec() {
  local rnum=$1
  local n=0
  local prev=0
 
  for ((i=${#rnum}-1;i>=0;i--))
  do
    case "${rnum:$i:1}" in
    M)  a=1000 ;;
    D)  a=500 ;;
    C)  a=100 ;;
    L)  a=50 ;;
    X)  a=10 ;;
    V)  a=5 ;;
    I)  a=1 ;;
    esac
 
    if [[ $a -lt $prev ]]
    then
       let n-=a
    else
       let n+=a
    fi
 
    prev=$a
  done
 
  echo "$rnum = $n"
}
