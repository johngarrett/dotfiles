export ZSH="/Volumes/home/.oh-my-zsh"
ZSH_THEME="pi"
DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"
plugins=(git battery cargo colorize cp nmap osx python rust sudo swiftpm tmux xcode git-extras git-flow github virtualenv pip zsh-syntax-highlighting brew )
source $ZSH/oh-my-zsh.sh
. ~/.zsh_aliases
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH=~/pebble-dev/pebble-sdk-4.5-mac/bin:$PATH
