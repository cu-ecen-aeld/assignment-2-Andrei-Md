#!/bin/sh
####
# Input:
# Accepts the following arguments: the first argument is a full path to a file (including filename)
#  on the filesystem, referred to below as writefile; the second argument is a text string which
#  will be written within this file, referred to below as writestr
# 
# Output:
# Exits with value 1 error and print statements if any of the arguments above were not specified
# 
# Creates a new file with name and path writefile with content writestr,
# overwriting any existing file and creating the path if it doesn’t exist. 
# Exits with value 1 and error print statement if the file could not be created.
# 
####

# Check the input parameters
if [ "$#" -ne 2 ]; then
    echo "Illegal number of arguments"
    echo "expected: <writefile> <writestr>"
    exit 1
fi

WRITEFILE=$1
WRITESTR=$2

# create the file
if ! $(mkdir -p "$(dirname "$WRITEFILE")" && touch $WRITEFILE) ; then
   echo "The $WRITEFILE couldn't be created"
   exit 1
fi

# overwrite text in file
$(echo $WRITESTR > $WRITEFILE)

echo "success"
exit 0

