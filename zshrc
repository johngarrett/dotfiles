source ~/antigen.zsh

antigen use oh-my-zsh

antigen bundle z
antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle zdharma-continuum/fast-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle popstas/zsh-command-time
antigen bundle robertzk/send.zsh
antigen bundle lukechilds/zsh-nvm

DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"

# zsh-command-time
ZSH_COMMAND_TIME_MSG="Execution time: %s sec"
ZSH_COMMAND_TIME_COLOR="yellow"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#a9a9a9"

antigen theme bira 
antigen cache-gen
antigen apply

export NVM_LAZY_LOAD=true

export ANDROID_HOME=~/Library/Android/sdk
export ANDROID_SDK_ROOT=~/Library/Android/sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/tools
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools

#export PATH="$PATH:/home/garrepi/packages/sourcekit-lsp/.build/debug/"

#export SWIFTENV_ROOT="$HOME/.swiftenv"
#export PATH="$SWIFTENV_ROOT/bin:$PATH"

export PATH=$PATH:/opt/homebrew/bin
export PATH=$PATH:/opt/local/bin
export PATH=$PATH:~/bin

#export THEOS=~/theos
#eval $(/opt/homebrew/bin/brew shellenv)
#export PATH="$HOME/.jenv/bin:$PATH"
#eval "$(jenv init -)"
#export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
#export PATH=$PATH:/opt/riscv/bin

export VISUAL=nvim
export EDITOR=nvim

#export PATH=$PATH:/usr/local/lib:/usr/local/include:/Library/TeX/texbin

export PATH=$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin
export PATH=$PATH:~/script
export PATH=$PATH:~/bin

# colorize output for ctest
export GTEST_COLOR=1



#export PATH="$PATH:$HOME/.spicetify"
#export PATH="$PATH:$HOME/.local/share/firenvim"

# opam configuration
#[[ ! -r /Users/garrepi/.opam/opam-init/init.zsh ]] || source /Users/garrepi/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

#export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NODE_EXTRA_CA_CERTS=~/bundle.pem

gch() {
 git checkout “$(git branch — all | fzf| tr -d ‘[:space:]’)”
}

#### Added by green-restore install-tools
autoload -Uz compinit && compinit
####
