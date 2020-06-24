source ~/.antigen.zsh

antigen use oh-my-zsh

antigen bundle z
antigen bundle git
antigen bundle pip
antigen bundle brew
antigen bundle command-not-found
antigen bundle zdharma/fast-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle popstas/zsh-command-time

DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"

# zsh-command-time
ZSH_COMMAND_TIME_MSG="Execution time: %s sec"
ZSH_COMMAND_TIME_COLOR="yellow"

antigen theme agnoster
antigen apply

. ~/.zsh_aliases
export PATH="/usr/local/opt/icu4c/bin:$PATH:/usr/local/bin"
