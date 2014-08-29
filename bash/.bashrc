# ~/.bashrc: executed by bash(1) for non-login shells.
# Add ~/bin to path

export PATH=$PATH:~/bin
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Set up prompt
PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] '

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

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

##### misc options #####
export VISUAL=vim
export EDITOR=vim
#export BROWSER=/usr/bin/chromium
#export OOO_FORCE_DESKTOP=gnome soffice
#export EMAIL=/usr/bin/claws-mail

# Java options
#export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=gasp'
#export JAVA_FONTS=/usr/share/fonts/TTF

# vi keybindings mode
set -o vi

# Fortune cowsay
/usr/games/fortune -s | cowsay -y -f sheep
echo

# Allows autocomplete for sudo
complete -cf sudo

# fast autocompletion
set show-all-if-ambiguous on

# man colors w/ less
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

##### functions #####

# move follow/copy follow
goto() { [ -d "$1" ] && cd "$1" || cd "$(dirname "$1")"; }
cpf() { cp "$@" && goto "$_"; }
mvf() { mv "$@" && goto "$_"; }

mkcd() {
	mkdir -p "$*"
	cd "$*"
}

httpurl() {
	ip=$(curl -s "http://www.whatismyip.org")
	echo "http://$ip:8080" | xsel -b
}

# functions
nicemount() { (echo "DEVICE PATH TYPE FLAGS" && mount | awk '$2=$4="";1') | column -t; }

weather() {
	curl -s "http://api.wunderground.com/auto/wui/geo/ForecastXML/index.xml?query=${@:-94044}" |\
	perl -ne '/<title>([^<]+)/&&printf "\x1B[0;34m%s\x1B[0m: ",$1;/<fcttext>([^<]+)/&&print $1,"\n"'
}
