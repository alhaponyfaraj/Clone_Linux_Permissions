#!/bin/bash
 
################################################################
##                                                            ##
##            Clone permissions of a file structure           ##
##                       Faraj Alhapony                       ##
##                                                            ##
################################################################

Dir_Check=(
  $1
  $2
)

for dir in "${Dir_Check[@]}";
do 
    if [ ! -d $dir ] 
    then

        echo "Directory " ${dir} " DOES NOT exists."
        break 
        exit 9999 # die with error code 9999
    fi
done
