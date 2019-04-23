# ~/.bashrc
source /etc/profile

#aliases
alias ls='ls --color=auto'
alias cls='clear'
alias grep='grep --color=auto'
alias netbeans='/usr/local/netbeans-7.4/bin/netbeans'
alias bd='psql -h data.ime.usp.br -p 23001 -U u7577469 -d bd_7577469'
alias fuck='sudo $(history -p \!\!)'
alias pmac="ifconfig | sed -E \"s/ +/ /g\" | grep -E \"^[^ ].*HWaddr\" | awk '{print \$1 \"\\t\" \$NF}'"
alias git_upload="git add --all; git commit; git push"
which scp 1>/dev/null && alias cp=scp

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
Black='\[\e[0;30m\]'        # Black
Red='\[\e[0;31m\]'          # Red
Green='\[\e[0;32m\]'        # Green
Yellow='\[\e[0;33m\]'       # Yellow
Blue='\[\e[0;34m\]'         # Blue
Purple='\[\e[0;35m\]'       # Purple
Cyan='\[\e[0;36m\]'         # Cyan
White='\[\e[0;37m\]'        # White
Ochre='\[\e[38;5;95m\]'     # Ochre

# Bold
BBlack='\[\e[1;30m\]'       # Black
BRed='\[\e[1;31m\]'         # Red
BGreen='\[\e[1;32m\]'       # Green
BYellow='\[\e[1;33m\]'      # Yellow
BBlue='\[\e[1;34m\]'        # Blue
BPurple='\[\e[1;35m\]'      # Purple
BCyan='\[\e[1;36m\]'        # Cyan
BWhite='\[\e[1;37m\]'       # White
BOchre='\[\e[38;5;95m\]'    # Ochre

# Background
On_Black='\[\e[40m\]'       # Black
On_Red='\[\e[41m\]'         # Red
On_Green='\[\e[42m\]'       # Green
On_Yellow='\[\e[43m\]'      # Yellow
On_Blue='\[\e[44m\]'        # Blue
On_Purple='\[\e[45m\]'      # Purple
On_Cyan='\[\e[46m\]'        # Cyan
On_White='\[\e[47m\]'       # White
On_Ochre='\[\e[38;5;95m\]'  # Ochre

NC="\[\e[m\]"               # Color Reset

# Functions for prompt

# Purple-enc info

function pinfo () {
  echo -e "$Purple($NC$@$Purple)$NC "
}

# Git functions

function git_color {
  local git_status="$(git status 2> /dev/null)"

  if [[ ! $git_status =~ "working directory clean" ]]; then
    echo -e $Red
  elif [[ $git_status =~ "Your branch is ahead of" ]]; then
    echo -e $Yellow
  elif [[ $git_status =~ "nothing to commit" ]]; then
    echo -e $Green
  else
    echo -e $Ochre
  fi
}

function git_branch {
  local git_status="$(git status 2> /dev/null)"
  local on_branch="On branch ([^${IFS}]*)"
  local on_commit="HEAD detached at ([^${IFS}]*)"

  if [[ $git_status =~ $on_branch ]]; then
    local branch=${BASH_REMATCH[1]}
    echo -e "$(pinfo git)$(pinfo $(git_color)$branch)"
  elif [[ $git_status =~ $on_commit ]]; then
    local commit=${BASH_REMATCH[1]}
    echo -e "$(pinfo git)$(pinfo $(git_color)$commit)"
  fi
}

# Complex prompt build

function build_prompt {
  local EXIT="$?"
  PS1=''
  
  # Base prompt
  PS1+="${debian_chroot:+($debian_chroot)}$PCOLOR\u@\h $BBlue\w "
  
  # Extra info
  PS1+="$(pinfo 'Jobs: \j')"
  
  # VCS info
  PS1+="$(git_branch)"

  # Start second line
  PS1+="\n"

  # Last command exit code
  if [ $EXIT != 0 ]; then
    PS1+="$(pinfo $Red$EXIT)"
  else
    PS1+="$(pinfo $Green$EXIT)"
  fi

  # Second line
  PS1+="$BBlue$PTAG$NC "
}

# If shell is interactive
if [ "$PS1" ]; then

  # Get aliases
  if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
  fi

  # Set shell prompt
  PTAG="\$"
  PCOLOR="$BGreen"

  if [ "$(whoami)" = "root" ]; then
    PCOLOR="$BRed"
    PTAG="#"
  fi

  export PS1 PS2
  PS2='> '

  export PATH="$PATH:."

  PROMPT_COMMAND=build_prompt
fi

# Utility functions
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

[ -d "$HOME/scripts" ] && export PATH=$PATH:$HOME/scripts
[ -d "$HOME/.local/bin" ] && export PATH=$PATH:$HOME/.local/bin
[ -d "/sbin" ] && export PATH=$PATH:/sbin
[ -d "$HOME/bin" ] && export PATH=$PATH:$HOME/bin

# Set language
export LANGUAGE="en_US.utf8"
export LANG="en_US.utf8"
export GDM_LANG="en_US.utf8"

# Necessary for thefuck
if [ "$(which thefuck)" ]; then
    eval $(thefuck --alias)
fi

# Disable bell
if [ -n "$DISPLAY" ]; then
  xset b off
fi

