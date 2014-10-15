export CONDA=/home/kmckiern/anaconda/bin
export PATH=$CONDA:$HOME/local/pcre-8.34/bin:$HOME/local/swig-2.0.11/bin:/usr/local/cuda/bin:$HOME/opt/openmm/bin:$HOME/opt/gromacs-4.6.2/bin:$HOME/local/bin:$HOME/opt/cctools-4.1.2/bin/:$HOME/temp/dock6/bin/:$PATH
export LD_LIBRARY_PATH=$HOME/local/pcre-8.34/lib:$HOME/local/cuda/lib64:/home/kmckiern/local/openmm/lib:$LD_LIBRARY_PATH
export OPENMM_PLUGIN_DIR=/home/kmckiern/openmm/lib/plugins

alias ~='cd ~'
alias ..='cd ..'
alias ...='cd ../..'
alias .-='cd -'
alias brc='vi ~/.bashrc'
alias sbrc='. ~/.bashrc'
alias ll='ls -ltrh'
alias la='ls -ltrha'
alias kj="qstat | grep kmck | awk -F '.' '{print \$1}' | xargs qdel"

alias gromostop="cd /home/kmckiern/opt/gromacs-4.6.2/share/gromacs/top/"

# Prevent ^C from being echoed to the terminal when Ctrl+C is pressed.
stty -ctlecho
# CL vi
set -o vi

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[1;30m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
        PS1="\[\033[0;34m\]\\u@\h:\\W$ \[\033[0m\]"
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi