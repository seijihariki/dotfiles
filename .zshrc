# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export TERM="xterm-256color"

# Aliases
which scp 1>/dev/null && alias cp=scp
which yay 1>/dev/null && alias update="yay -Syyu --sudoloop --noconfirm"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_NODE_VERSION_BACKGROUND='28'
POWERLEVEL9K_NODE_VERSION_FOREGROUND='15'
POWERLEVEL9K_BACKGROUND_JOBS_ICON='\uf0ae'
POWERLEVEL9K_VCS_STAGED_ICON='\u00b1'
POWERLEVEL9K_VCS_UNTRACKED_ICON='\u25CF'
POWERLEVEL9K_VCS_UNSTAGED_ICON='\u00b1'
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='\u2193'
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='\u2191'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'
POWERLEVEL9K_STATUS_OK_BACKGROUND="black"
POWERLEVEL9K_STATUS_OK_FOREGROUND="green"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="black"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="red"
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M}"

POWERLEVEL9K_CHANGESET_HASH_LENGTH=6
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX=" ❯ "


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive complet'ion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

alias rm='rm -I'
export PATH="$PATH:."
[ -d "$HOME/scripts" ] && export PATH=$PATH:$HOME/scripts
[ -d "$HOME/.local/bin" ] && export PATH=$PATH:$HOME/.local/bin
[ -d "/sbin" ] && export PATH=$PATH:/sbin
[ -d "$HOME/bin" ] && export PATH=$PATH:$HOME/bin

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
 export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:$HOME/.rvm/scripts/rvm"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias remake-prompt="set_prompt"

# Setup working environments
MODE="base"
mode() {
    if [ -z "$1" ]
    then
        echo "Usage: $0 <mode>"
    else
        mode_$1
        MODE="$1"
    fi
}

#TMOUT=5

elements=()


# Get prompt size
lp_size() {
    local LEFT_P="$(print_icon MULTILINE_FIRST_PROMPT_PREFIX)%f%b%k$(build_left_prompt)"
    local zero='%([BSUbfksu]|([FK]|){*})'
    echo "${#${(S%%)LEFT_P//$~zero/}}"
}

rp_size() {
    local LEFT_P="$RPROMPT_PREFIX%f%b%k$(build_right_prompt)%{$reset_color%}$RPROMPT_SUFFIX"
    local zero='%([BSUbfksu]|([FK]|){*})'
    echo "${#${(S%%)LEFT_P//$~zero/}}"
}

# Set elements
make_prompt_from_els() {
    local unsorted_els="$1"
    IFS=$'\n' els=($(sort -t\- -k 3 -g <<<"${unsorted_els[*]}"))
    unset IFS

    # Set elements for powerline
    POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=()
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
    for item in ${els}
    do
        local side=$(echo ${item} | cut -d\- -f4)
        local disp=$(echo ${item} | cut -d\- -f2)

        if [ ${side} = "l" ]
        then
            POWERLEVEL9K_LEFT_PROMPT_ELEMENTS+=("${disp}")
        else
            POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS+=("${disp}")
        fi
    done
}

set_prompt() {
    IFS=$'\n' priority_sorted=($(sort -r -t\- -k 1 -g <<<"${elements[*]}"))
    unset IFS

    IFS=$'\n' curr_els=("${elements[*]}")
    unset IFS

    make_prompt_from_els "${curr_els}"

    while [ $(($(lp_size) + $(rp_size))) -gt ${COLUMNS} ]
    do
        curr_els="$(echo ${curr_els} | sort -r -t\- -k 1 -g)"
        curr_els="$(echo ${curr_els} | tail -n +2)"
        make_prompt_from_els "${curr_els}"
    done
}

# Mode definitions
mode_base() {
    elements=('2-status-0-l' '5-background_jobs-1-l' '4-context-2-l' '0-dir-3-l' '1-vcs-4-l' '3-battery-5-l' '7-root_indicator-0-r' '6-time-1-r' )
    set_prompt
}

mode_coding() {
    elements=('2-status-0-l' '4-background_jobs-1-l' '0-dir-2-l' '1-vcs-3-l' '3-battery-4-l' '6-root_indicator-0-r' '5-time-1-r' )
    set_prompt
}

mode_testing() {
    elements=('1-status-0-l' '5-disk_usage-1-l' '6-swap-2-l' '4-load-3-l' '3-ram-4-l' '2-background_jobs-5-l' '0-dir-6-l' '7-vcs-7-l' '8-root_indicator-0-r' '9-time-1-r' )
#    TMOUT=1
    set_prompt
}

mode_hacking() {
    elements=('1-status-0-l' '2-background_jobs-1-l' '3-context-2-l' '0-dir-3-l' '5-public_ip-0-r' '4-root_indicator-1-r' '6-time-2-r')
    set_prompt
}

mode base

# Prompt refresh
#TRAPALRM() {
#    zle reset-prompt
#}

# Clear screen if resized
LAST_COLUMNS=0
#TRAPWINCH() {
#    if [ ${COLUMNS} -ne ${LAST_COLUMNS} ]
#    then
#        set_prompt
#        zle reset-prompt
#        clear
#        LAST_COLUMNS=${COLUMNS}
#    fi
#}

export PATH=$HOME/.gem/ruby/2.6.0/bin:$PATH
export ANDROID_HOME=~/Android/Sdk
export PATH=$PATH:$JAVA_HOME/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/tmp/google-cloud-sdk/path.zsh.inc' ]; then . '/tmp/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/tmp/google-cloud-sdk/completion.zsh.inc' ]; then . '/tmp/google-cloud-sdk/completion.zsh.inc'; fi
