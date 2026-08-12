if [ -r "$HOME/antigen.zsh" ]; then
  source "$HOME/antigen.zsh"
elif [ -r /usr/share/zsh/share/antigen.zsh ]; then
  source /usr/share/zsh/share/antigen.zsh
fi

if typeset -f antigen >/dev/null 2>&1; then
  antigen use oh-my-zsh

antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle zdharma-continuum/fast-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle popstas/zsh-command-time
antigen bundle robertzk/send.zsh
#antigen bundle lukechilds/zsh-nvm

DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"

# zsh-command-time
ZSH_COMMAND_TIME_MIN_SECONDS=3
ZSH_COMMAND_TIME_MSG="%s"
ZSH_COMMAND_TIME_COLOR="yellow"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#a9a9a9"

antigen theme bira 
  antigen apply
fi

#export NVM_LAZY_LOAD=true

export ANDROID_HOME=~/Library/Android/sdk
export ANDROID_SDK_ROOT=~/Library/Android/sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/tools
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools

#export PATH="$PATH:/home/garrepi/packages/sourcekit-lsp/.build/debug/"

#export SWIFTENV_ROOT="$HOME/.swiftenv"
#export PATH="$SWIFTENV_ROOT/bin:$PATH"

if [ -d /opt/homebrew/bin ]; then export PATH="$PATH:/opt/homebrew/bin"; fi
if [ -d /opt/local/bin ]; then export PATH="$PATH:/opt/local/bin"; fi
export PATH=$PATH:~/bin

#export THEOS=~/theos
#eval $(/opt/homebrew/bin/brew shellenv)
if command -v jenv >/dev/null 2>&1; then
  export PATH="$HOME/.jenv/bin:$PATH"
  eval "$(jenv init -)"
fi
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

gch() {
 git checkout “$(git branch — all | fzf| tr -d ‘[:space:]’)”
}

#### Added by green-restore install-tools
#autoload -Uz compinit && compinit
####

#export PATH=$PATH:/Users/garrepi/Library/Python/3.9/bin

alias nr="npm run"

if command -v nodenv >/dev/null 2>&1; then
  eval "$(nodenv init - zsh)"
fi
#source ~/.work/zshrc

#source ~/dotfiles/gco_completion.sh

# bun completions
[ -s "/Users/garrepi/.bun/_bun" ] && source "/Users/garrepi/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# gdal-env
if [ -r /opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh ]; then
  source /opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh
fi

# Created by `pipx` on 2026-03-16 04:52:59
export PATH="$PATH:/Users/garrepi/.local/bin"

