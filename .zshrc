# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export TERM="xterm-256color"

#########################
# CUSTOM SETTINGS START #
#########################

# Aliases
which git 1>/dev/null && alias gstac="git stash clear"

which scp 1>/dev/null && alias cp=scp

which yay 1>/dev/null && alias yay-update="yay -Syyu --sudoloop --noconfirm"
which yay 1>/dev/null && alias yay-install="yay -S --sudoloop --noconfirm"
which yay 1>/dev/null && alias yay-clean='yay -Rns $(yay -Qtdq)'

alias rm='rm -I'

# Load powerlevel
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins
plugins=(git docker-compose)

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Add custom directories to PATH
export PATH="$PATH:.:./bin"
[ -d "$HOME/scripts" ] && export PATH=$PATH:$HOME/scripts
[ -d "$HOME/.local/bin" ] && export PATH=$PATH:$HOME/.local/bin
[ -d "/sbin" ] && export PATH=$PATH:/sbin
[ -d "$HOME/bin" ] && export PATH=$PATH:$HOME/bin

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:$HOME/.rvm/scripts/rvm"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# PATHs 
export PATH=$HOME/.gem/ruby/2.6.0/bin:$PATH
export ANDROID_HOME=~/Android/Sdk
export PATH=$PATH:$JAVA_HOME/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools

#######################
# CUSTOM SETTINGS END #
#######################

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/tmp/google-cloud-sdk/path.zsh.inc' ]; then . '/tmp/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/tmp/google-cloud-sdk/completion.zsh.inc' ]; then . '/tmp/google-cloud-sdk/completion.zsh.inc'; fi

