#!/bin/bash

# Start a new terminal after having launched this script to actually see the
# expected configuration take place. This stands expecially for fonts.

DIRECTORIES=(fonts nvim zsh)

for DIR in ${DIRECTORIES[@]}; do
    echo "stowing "$DIR
    stow -t ~ -D $DIR
    stow -t ~ $DIR
done

