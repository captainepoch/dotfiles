#!/usr/bin/env bash

unameOut="$(uname -s)"
case "${unameOut}" in
	Linux*)
		machine=vscodium
	;;
	Darwin*)
		machine=code
	;;
esac

if [ "$1" = "b" ]; then
	"$machine" --list-extensions > extensions.txt
elif [ "$1" = "i" ]; then
	while IFS='' read -r EXT || [[ -n "$EXT" ]]; do
		"$machine" --install-extension "$EXT"
	done < "extensions.txt"
fi
