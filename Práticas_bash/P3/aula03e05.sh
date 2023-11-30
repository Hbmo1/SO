#!/bin/bash
# For all the files in a folder, show their properties
if [ $# == 1 ] && [ -d $1 ]; then
	for f in $1/*; do
		file "$f"
	done
else
	echo "Só é aceite 1 argumento, e tem que ser uma diretoria"
fi
