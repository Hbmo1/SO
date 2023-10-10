#!/bin/bash
if [ $# == 1 ] && [ -d $1 ] ; then
	cd $1 || exit 1
	for f in * ; do
		if [ -f "$f" ] ; then
			new_name="new_$f"
			mv "$f" "$new_name"
			echo "Rename: $f to $new_name"
		fi		
	done
else
	echo "Só pode ser passado um argumento, e tem que ser uma diretoria."
fi
