# Antigen and shell plugins
if [[ -r "$HOME/antigen.zsh" ]]; then
  source "$HOME/antigen.zsh"
elif [[ -r /usr/share/zsh/share/antigen.zsh ]]; then
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

  DISABLE_AUTO_UPDATE="true"
  COMPLETION_WAITING_DOTS="true"
  ZSH_COMMAND_TIME_MIN_SECONDS=3
  ZSH_COMMAND_TIME_MSG="%s"
  ZSH_COMMAND_TIME_COLOR="yellow"
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#a9a9a9"

  antigen theme bira
  antigen apply
fi

# Shared environment
typeset -U path PATH
path+=("$HOME/.local/bin" "$HOME/bin" "$HOME/script")

export VISUAL=nvim
export EDITOR=nvim
export GTEST_COLOR=1

export BUN_INSTALL="$HOME/.bun"
[[ -d "$BUN_INSTALL/bin" ]] && path+=("$BUN_INSTALL/bin")
[[ -f "$HOME/.fzf.zsh" ]] && source "$HOME/.fzf.zsh"

alias nr="npm run"

# nodenv is used on both macOS and Linux.
if [[ -d "$HOME/.nodenv/bin" ]]; then
  path=("$HOME/.nodenv/bin" $path)
fi
if command -v nodenv >/dev/null 2>&1; then
  eval "$(nodenv init - zsh)"
fi

case "$(uname -s)" in
  Darwin)
    if [[ -d "$HOME/Library/Android/sdk" ]]; then
      export ANDROID_HOME="$HOME/Library/Android/sdk"
      export ANDROID_SDK_ROOT="$ANDROID_HOME"
      path+=(
        "$ANDROID_SDK_ROOT/emulator"
        "$ANDROID_SDK_ROOT/tools"
        "$ANDROID_SDK_ROOT/tools/bin"
        "$ANDROID_SDK_ROOT/platform-tools"
      )
    fi

    [[ -d /opt/homebrew/bin ]] && path+=(/opt/homebrew/bin)
    [[ -d /opt/local/bin ]] && path+=(/opt/local/bin)
    [[ -d "/Applications/Visual Studio Code.app/Contents/Resources/app/bin" ]] && \
      path+=("/Applications/Visual Studio Code.app/Contents/Resources/app/bin")
    [[ -r "$HOME/.bun/_bun" ]] && source "$HOME/.bun/_bun"

    if [[ -r /opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh ]]; then
      source /opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh
    fi
    ;;
  Linux)
    export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR:-/run/user/$UID}/ssh-agent.socket"
    ;;
esac
