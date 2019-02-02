#!/bin/bash


echo “Convertir décimal en chiffre roman : tapez 1 // Convertir chiffre roman en décimal : tapez 2"
read convert

if [ $convert == 1 ]; then

  echo “Veuillez écrire le décimal que vous voulez convertir :"
  read dectorom

  ./dectorom.sh dectorom

elif [ $convert == 2 ]; then

  echo “Veuillez écrire le roman que vous voulez convertir :"
  read romtodec
      
	./romantodec.sh romtodec

else

    echo "Il faut taper 1 ou 2!! Pas $convert"

fi