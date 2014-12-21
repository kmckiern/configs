## Env vars.
PYPATH="/anaconda/bin"
export PYTHONPATH="$PYPATH:$PYTHONPATH"
HOMEBREW="/usr/local/bin:/usr/local/sbin"
export PATH=$PYPATH:$HOMEBREW:$PATH
#export PATH=$HOMEBREW:$PATH

## CL config.
# Prevent ^C from being echoed to the terminal when Ctrl+C is pressed.
stty -ctlecho
# forward search in bash
stty -ixon
# CL vi
set -o vi

# why is this not a standard command on os x?
# arg 1: current name element 
# arg 2: replacement name element
# arg 3 to end: file(s) to apply replacement to.
rnm() {
    ARGS=( ${@} )
    FLZ=( "${ARGS[@]:2}" )
    for i in "${FLZ[@]}"; do
        MATCH=${1:-‘’}
        REPLACE=${2:-‘NULL’}
        [[ -z $MATCH ]] && return 2 || :
            RNM=$(echo $i | sed "s/$MATCH/$REPLACE/g");
            cp -r $i $RNM;
            mv $i i-$i; 
    done
}

# for parsing
pref() {
    echo $(echo $1 | awk -F '.' '{print $1}');
}

## Colors.
export CLICOLOR=1
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='01;20'
export lscolors=exfxcxdxbxahafabagacad
RED="\033[1;31m";
NORM="\033[0;39m";
CYAN="\033[1;36m";
GRAY="\033[0;30m";
# To color and format the shell prompt. 
export PS1="\[${GRAY}\]\\u:\\W$ \[\033[0m\]"

if [ -f ~/.aliases ]; then
    source ~/.aliases
fi
