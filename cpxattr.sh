#!/bin/bash
current="$PWD"
src="$current"/"$1"
dst="$current"/"$2"
Attr="$(getfattr --absolute-names  -d "$src" | grep -v '# file')"
tags="$(echo $Attr | cut -d'=' -f1)"
vals="$(echo $Attr | cut -d'=' -f2)"
setfattr -n $tags -v $vals "$dst"
