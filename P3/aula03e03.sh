#!/bin/bash
# This script checks the existence of a file
echo "Checking..."
if [[ $# -ne 1 ]] ; then
        echo "Too many args"
        exit 1
fi

if [[ -f $1 ]] && ! [[ -d $1 ]] ; then
        echo "$1 existe."
        ls -l $1
else
        echo "$1 nao existe"
fi
echo "...done."

