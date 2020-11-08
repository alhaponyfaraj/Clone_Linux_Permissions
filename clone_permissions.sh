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

# dirs stuff
reference_dir=$(find $1 -type d)
target_dir=$(find $2 -type d)

chown --reference=$reference_dir $target_dir
chmod --reference=$reference_dir $target_dir
chgrp --reference=$reference_dir $target_dir

# files stuff
reference_file=$(find $1 -type f)
target_file=$(find $2 -type f)

chown --reference=$reference_file $target_file
chmod --reference=$reference_dir $target_file
chgrp --reference=$reference_dir $target_dir


