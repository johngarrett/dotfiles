source ~/antigen.zsh

antigen use oh-my-zsh

antigen bundle z
antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle zdharma/fast-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle popstas/zsh-command-time
antigen bundle black7375/zsh-lazyenv

DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"

# zsh-command-time
ZSH_COMMAND_TIME_MSG="Execution time: %s sec"
ZSH_COMMAND_TIME_COLOR="yellow"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#a9a9a9"

antigen theme bira 
antigen cache-gen
antigen apply

. ~/.zsh_aliases

export ANDROID_SDK_ROOT=~/Library/Android/sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/tools
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools

export PATH="$PATH:/home/garrepi/packages/sourcekit-lsp/.build/debug/"

export SWIFTENV_ROOT="$HOME/.swiftenv"
export PATH="$SWIFTENV_ROOT/bin:$PATH"
export PATH=$PATH:/opt/local/bin
export PATH=$PATH:~/bin

export THEOS=~/theos
eval $(/opt/homebrew/bin/brew shellenv)
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH=$PATH:/opt/riscv/bin

export VISUAL=nvim
export EDITOR=nvim

export PATH=$PATH:/usr/local/lib:/usr/local/include:/Library/TeX/texbin

export PATH=$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin



eval "$(jenv init -)"
export PATH="$PATH:$HOME/.spicetify"

# opam configuration
[[ ! -r /Users/garrepi/.opam/opam-init/init.zsh ]] || source /Users/garrepi/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
