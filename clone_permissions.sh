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
# check chown for dirs

if [ $? -eq 0 ]; then
   echo "Dirs owner clonechangedd successfully"
else
   echo "An error occured on dirs owner changing !"
   echo "exit status: $?"
fi

chmod --reference=$reference_dir $target_dir
# check chmod for dirs
if [ $? -eq 0 ]; then
   echo "Dirs permissions cloned successfully"
else
   echo "An error occured on dirs owner cloning ! "
   echo "exit status: $?"
fi

chgrp --reference=$reference_dir $target_dir
# check chgrp for dirs
if [ $? -eq 0 ]; then
   echo "Dirs group changed successfully"
else
   echo "An error occured on dirs group changing !"
   echo "exit status: $?"
fi


# files stuff
reference_file=$(find $1 -type f)
target_file=$(find $2 -type f)

chown --reference=$reference_file $target_file
# check chown for files
if [ $? -eq 0 ]; then
   echo "Files Owner changed successfully"
else
   echo "An error occured on files owner changing !"
   echo "exit status: $?"
fi


chmod --reference=$reference_dir $target_file
# check chmod for files
if [ $? -eq 0 ]; then
   echo "Files permissions cloned successfully"
else
   echo "An error occured on files permissions cloning !"
   echo "exit status: $?"
fi



chgrp --reference=$reference_dir $target_dir
# check chgrp for files
if [ $? -eq 0 ]; then
   echo "files group changed successfully"
else
   echo "An error occured on files group changing !"
   echo "exit status: $?"
fi
