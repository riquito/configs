#!/bin/bash

# The absolute, canonical ( no ".." ) path to this script
FILEPATH=$(cd -P -- "$(dirname -- "$0")" && printf '%s\n' "$(pwd -P)/$(basename -- "$0")")
DIRNAME=$(dirname "$FILEPATH")
FILENAME=$(basename "$FILEPATH")

for i in $(find $DIRNAME -mindepth 1 -maxdepth 1 \
	   -name .git -o \
           -name $FILENAME \
           -prune -o \
           -print); do
    
    dest="$HOME/$(basename "$i")"

    if [ -e $dest ] && [ ! -h $dest ]; then
        echo "backup $dest in $dest.bak"
        rm -fr $dest.bak
        mv $dest $dest.bak
    fi

    echo ln -sfn $i $dest
    ln -sfn $i $dest

done

echo "... done"
