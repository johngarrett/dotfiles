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

export ANDROID_SDK_ROOT=/opt/Android/SDK
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/tools
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
export PATH="$PATH:/home/garrepi/.nvm/versions/node/v10.13.0/bin/node"
