# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export TERM="xterm-256color"
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
TMOUT=5
base() {
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
    POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status background_jobs root_indicator context dir vcs battery)
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time)
    POWERLEVEL9K_CHANGESET_HASH_LENGTH=6
    POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
    POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
    POWERLEVEL9K_PROMPT_ON_NEWLINE=true
    POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
    POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX=" ❯ "
}

coding() {
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
    POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status root_indicator dir vcs battery)
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time)
    POWERLEVEL9K_CHANGESET_HASH_LENGTH=6
    POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
    POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
    POWERLEVEL9K_PROMPT_ON_NEWLINE=true
    POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
    POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX=" ❯ "
}

testing() {
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
    POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status disk_usage swap load ram background_jobs root_indicator vcs dir)
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time)
    POWERLEVEL9K_CHANGESET_HASH_LENGTH=6
    POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
    POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
    POWERLEVEL9K_PROMPT_ON_NEWLINE=true
    POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
    POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX=" ❯ "
    TMOUT=1
}

hacking() {
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
    POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status background_jobs context root_indicator dir)
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(public_ip time)
    POWERLEVEL9K_CHANGESET_HASH_LENGTH=6
    POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
    POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
    POWERLEVEL9K_PROMPT_ON_NEWLINE=true
    POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
    POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX=" ❯ "
}

base

# Get prompt size
lp_size() {
    LEFT_P="$(print_icon MULTILINE_FIRST_PROMPT_PREFIX)%f%b%k$(build_left_prompt)"
    local zero='%([BSUbfksu]|([FK]|){*})'
    echo "${#${(S%%)LEFT_P//$~zero/}}"
}

rp_size() {
    LEFT_P="$RPROMPT_PREFIX%f%b%k$(build_right_prompt)%{$reset_color%}$RPROMPT_SUFFIX"
    local zero='%([BSUbfksu]|([FK]|){*})'
    echo "${#${(S%%)LEFT_P//$~zero/}}"
}

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

alias rm='rm -I'
export PATH="$PATH:."
export PATH=$PATH:$HOME/bin
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

TRAPALRM() {
    zle reset-prompt
}

# Clear screen if resized
LAST_COLUMNS=0
TRAPWINCH() {
    if [ ${COLUMNS} -ne ${LAST_COLUMNS} ]
    then
        clear
        zle reset-prompt
        LAST_COLUMNS=${COLUMNS}
    fi
}
