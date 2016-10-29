#
# ~/.bashrc
source /etc/profile

alias ls='ls --color=auto'
alias cls='clear'
alias grep='grep --color=auto'
alias netbeans='/usr/local/netbeans-7.4/bin/netbeans'
alias bd='psql -h data.ime.usp.br -p 23001 -U u7577469 -d bd_7577469'
alias fuck='sudo $(history -p \!\!)'

shopt -s cdspell
shopt -s cdable_vars
shopt -s checkhash
shopt -s checkwinsize
shopt -s sourcepath
shopt -s no_empty_cmd_completion
shopt -s cmdhist
shopt -s histappend histreedit histverify
shopt -s extglob


# Normal Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

NC="\e[m"               # Color Reset

# Verifica se o shell � interativo.
if [ "$PS1" ]; then

  # Executa o ~/.bash_aliases, se existir.
  if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
  fi

  # Configura a apar�ncia do prompt do shell
  if [ "$(whoami)" = "root" ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[01;34m\] \w #\[\033[00m\] '
  else
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
  fi
  PS2='> '
  export PS1 PS2

  export PATH="$PATH:."
fi


function extract()      # Handy Extract Program
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1     ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1      ;;
            *.rar)       unrar x $1      ;;
            *.gz)        gunzip $1       ;;
            *.tar)       tar xvf $1      ;;
            *.tbz2)      tar xvjf $1     ;;
            *.tgz)       tar xvzf $1     ;;
            *.zip)       unzip $1        ;;
            *.Z)         uncompress $1   ;;
            *.7z)        7z x $1         ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}


if [ -n "${SSH_CONNECTION}" ]; then
    CNX=${Green}        # Connected on remote machine, via ssh (good).
elif [[ "${DISPLAY%%:0*}" != "" ]]; then
    CNX=${ALERT}        # Connected on remote machine, not via ssh (bad).
else
    CNX=${BCyan}        # Connected on local machine.
fi

export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:/sbin
export PATH=$PATH:$HOME/bin
#export PATH=$PATH:$HOME/private/tools
export LANGUAGE="en_US.utf8"
export LANG="en_US.utf8"
export GDM_LANG="en_US.utf8"

eval $(thefuck --alias)
alias pmac="ifconfig | sed -E \"s/ +/ /g\" | grep -E \"^[^ ].*HWaddr\" | awk '{print \$1 \"\\t\" \$NF}'"
