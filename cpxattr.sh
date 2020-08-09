#!/bin/bash
current="$PWD"
src="$current"/"$1"
dst="$current"/"$2"
Attr="$(getfattr --absolute-names  -d "$src" | grep -v '# file')"
lines="$(echo "$Attr" | wc -l)"
for (( i=1; i <=$lines; i++ ))
do
    tags="$(echo "$Attr" | cut -d'=' -f1 | sed $i'q;d')"
    val="$(echo "$Attr" | cut -d'=' -f2 | sed $i'q;d')"
    setfattr -n $tags -v $val "$dst"
done
