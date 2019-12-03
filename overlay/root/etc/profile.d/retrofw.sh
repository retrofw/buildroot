#!/bin/sh

export TERM=vt100
export SDL_NOMOUSE=1
export HOME=/home/retrofw

resize > /dev/null
umask 022
mkdir -p $HOME/.opkg
alias ls='ls --color'
