## env vars
PYPATH="/anaconda/bin"
export PYTHONPATH="$PYPATH:$PYTHONPATH"
HOMEBREW="/usr/local/bin:/usr/local/sbin"
CUDA="/Developer/NVIDIA/cuda/bin"
export PATH=$PYPATH:$HOMEBREW:$CUDA:$PATH

## cl config
# Prevent ^C from being echoed to the terminal when Ctrl+C is pressed.
stty -ctlecho
# forward search in bash
stty -ixon
# CL vi
set -o vi

## colors
export CLICOLOR=1
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='01;31'
export lscolors=exfxcxdxbxahafabagacad
RED="\033[1;31m";
NORM="\033[0;39m";
CYAN="\033[1;36m";
GRAY="\033[0;30m";
# To color and format the shell prompt. 
export PS1="\[$GRAY\]\\W\$ \[\033[0m\]"

# sourcery
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi
if [ -f ~/.functions ]; then
    source ~/.functions
fi
# if [ -f ~/.inputrc ]; then
#     source ~/.inputrc
# fi
