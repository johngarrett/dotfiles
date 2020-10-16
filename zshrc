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

antigen theme bira 
antigen apply

. ~/.zsh_aliases
export PATH="/usr/local/opt/icu4c/bin:$PATH:/usr/local/bin"

export ANDROID_SDK_ROOT=/opt/Android/SDK
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/tools
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools

export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"
export PATH="/home/garrepi/.gem/ruby/2.7.0/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
source /usr/share/nvm/init-nvm.sh
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$PATH:/home/garrepi/.nvm/versions/node/v10.13.0/bin"

export PS2DEV=~/.usr/local/ps2dev
export PS2SDK=$PS2DEV/ps2sdk
export GSKIT=$PS2DEV/gsKit
export PATH=$PATH:$PS2DEV/bin:$PS2DEV/ee/bin:$PS2DEV/iop/bin:$PS2DEV/dvp/bin:$PS2SDK/bin
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
