## Env vars.
PYPATH="/anaconda/bin"
export PYTHONPATH="$PYPATH:$PYTHONPATH"
HOMEBREW="/usr/local/bin:/usr/local/sbin"
export PATH=$PYPATH:$HOMEBREW:$PATH

## CL config.
# Prevent ^C from being echoed to the terminal when Ctrl+C is pressed.
stty -ctlecho
# CL vi
set -o vi
# Start VMD via CL
alias vmd="/Applications/VMD\ 1.9.1.app/Contents/MacOS/startup.command"
# Handy bash shortcuts
alias ll='ls -lhtr'
alias la='ls -latrh'
alias ugh='sudo $(history -p !-1)'
alias ~='cd ~'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias .-='cd -'

## Shortcuts for frequently visited paths.
BP="~/.bash_profile"
DB="$HOME/Dropbox"
RLOG="$DB/notes/current"
alias lipid="cd $DB/lipid"
alias opioid="cd $DB/opioid"
alias scripts="cd $DB/scripts"
alias class="cd $DB/class/f14"
alias ta="cd $DB/class/ta"

alias ipn="ipython notebook --pylab inline"

# why is this not a standard command on os x?
# arg 1: current name element 
# arg 2: replacement name element
# arg 3 to end: file(s) to apply replacement to.
f() {
    ARGS=( ${@} )
    FLZ=( "${ARGS[@]:2}" )
    for i in "${FLZ[@]}"; do
        RNM=$(echo $i | sed "s/$1/$2/g");
        cp $i $RNM;
        mv $i i-$i; 
    done
}


## Shortcuts for commonly performed tasks.
alias bp="vi $BP" 
alias sbp=". $BP"
alias rlog="vi $RLOG/rlog.txt"
alias rdir="cd $RLOG"
alias not="ssh -Y kmckiern@not0rious.stanford.edu"
alias vsp="ssh -Y kmckiern@vsp-compute-01.stanford.edu"
alias cert="ssh -Y kmckiern@certainty-d.stanford.edu"
alias hs="ssh -Y kmckiern@proclus.stanford.edu"
alias card="ssh -Y kmckiern@cardinal.stanford.edu"
alias corn="ssh -Y kmckiern@corn.stanford.edu"
alias bx3="ssh -Y kmckiern@biox3.stanford.edu"
alias titan="ssh -Y kmckiern@titan.ccs.ornl.gov"
alias mtitan="ssh -Y mlawrenz@titan.ccs.ornl.gov"
alias pbc="pwd | tr -d '\n' | pbcopy"
alias vj1="ssh -Y server@vijay-1.stanford.edu"

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
