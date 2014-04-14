# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    export GREP_COLOR="1;33"
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

##### aliases #####
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias volup='amixer sset PCM 30+'
alias voldown='amixer sset PCM 30-'
alias du='du -c -h'
alias df='df -h'
alias ping='ping -c 5'
alias mkdir='mkdir -p -v'
alias tmux='tmux -2'
#alias x='xinit'
#alias xm='xinit musca'
#alias webshare='python -m SimpleHTTPServer' # use quickserve :)

# cd
alias home='cd ~'
alias back='cd $OLDPWD'
alias ..='cd ..'
alias :q='exit'

# video
#alias screengrab='ffmpeg -f x11grab -s 800x600 -r 25 -i :0.0 -sameq ~/tmp/out.mpg'
