#!/bin/sh
###
# Input:
#  Accepts the following runtime arguments: the first argument is a path to a directory on the filesystem,
#    referred to below as filesdir; the second argument is a text string which will be searched within these files, referred to below as searchstr
#  
# Output:
#  Exits with return value 1 error and print statements if any of the parameters above were not specified
#  Exits with return value 1 error and print statements if filesdir does not represent a directory on the filesystem
#
#  Prints a message "The number of files are X and the number of matching lines are Y" 
#   where X is the number of files in the directory and all subdirectories
#         and Y is the number of matching lines found in respective files,
#   where a matching line refers to a line which contains searchstr (and may also contain additional content).
#
###


# Check the input parameters
if [ "$#" -ne 2 ]; then
    echo "Illegal number of arguments"
    echo "expected: <filesdir> <searchstr>"
    exit 1
fi


FILESDIR=$1
SEARCHSTR=$2

if [ ! -d $FILESDIR ]; then
    echo "$FILESDIR does not represent a directory on the filesystem!"
    exit 1   
fi

FILESNO=$( find $FILESDIR -type f | wc -l )
MATCHINGLINES=$(grep -rnwl $FILESDIR -e $SEARCHSTR | wc -l)

echo "The number of files are $FILESNO and the number of matching lines are $MATCHINGLINES"

echo "success"
exit 0


