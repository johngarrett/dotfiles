export ZSH="/home/garrepi/.oh-my-zsh"
ZSH_THEME="avit"
DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git battery cargo colorize cp nmap osx python rust sudo swiftpm tmux xcode git-extras git-flow github virtualenv pip zsh-syntax-highlighting archlinux docker git-extras ssh-agent vi-mode)
source $ZSH/oh-my-zsh.sh
. ~/.zsh_aliases
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH=~/pebble-dev/pebble-sdk-4.5-mac/bin:$PATH
source /home/garrepi/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
    autoload -U up-line-or-beginning-search
    zle -N up-line-or-beginning-search
    bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
    autoload -U down-line-or-beginning-search
    zle -N down-line-or-beginning-search
    bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi
