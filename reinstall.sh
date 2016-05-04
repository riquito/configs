#!/bin/bash

# The absolute, canonical ( no ".." ) path to this script
FILEPATH=$(cd -P -- "$(dirname -- "$0")" && printf '%s\n' "$(pwd -P)/$(basename -- "$0")")
DIRNAME=$(dirname "$FILEPATH")
FILENAME=$(basename "$FILEPATH")

function backup()
{
    local path=$1

    # if $path exists and is not a symlink
    if [ -e $path ] && [ ! -h $path ]; then
        echo "backup $path in $path.bak"
        
        rm -fr $path.bak
        mv $path $path.bak
    fi
}

function linkify()
{
    local src=$1
    local dest=$2

    echo ln -sfn $src $dest
    ln -sfn $src $dest
}

for i in $(find $DIRNAME/src -mindepth 1 -maxdepth 1 \
        -name .config \
        -prune -o \
        -print); do

    dest="$HOME/$(basename "$i")"

    backup $dest
    linkify $i $dest
done

if [[ ! -d "$HOME/.config" ]]; then
    mkdir $HOME/.config
fi

for i in $(find $DIRNAME/src/.config -mindepth 1 -maxdepth 1 -print); do
    dest="$HOME/.config/$(basename "$i")"

    backup $dest
    linkify $i $dest
done

echo "... done"
