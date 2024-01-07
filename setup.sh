#!/bin/bash

DIRECTORIES=(fonts nvim zsh)

for DIR in ${DIRECTORIES[@]}; do
    echo "stowing "$DIR
    stow -t ~ -D $DIR
    stow -t ~ $DIR
done

