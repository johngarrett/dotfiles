#source ~/.antigen.zsh
source /usr/share/zsh/share/antigen.zsh


antigen use oh-my-zsh

antigen bundle git
antigen bundle pip
antigen bundle command-not-found

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

antigen bundle popstas/zsh-command-time
antigen bundle black7375/zsh-lazyenv
antigen bundle robertzk/send.zsh

DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"

# zsh-command-time
ZSH_COMMAND_TIME_MIN_SECONDS=3
ZSH_COMMAND_TIME_MSG="%s"
ZSH_COMMAND_TIME_COLOR="yellow"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#a9a9a9"

antigen theme bira 
antigen apply

export PATH=$PATH:/opt/local/bin
export PATH="$PATH:$HOME/bin"

export VISUAL=nvim
export EDITOR=nvim

export PATH=$PATH:/usr/local/lib:/usr/local/include:/Library/TeX/texbin

export PATH=$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# AMSEverywhere stuff
export CMAKE_EXPORT_COMPILE_COMMANDS=1
export NODE_EXTRA_CA_CERTS=~/dev/charles-ssl-proxying-certificate.pem

export FZF_DEFAULT_COMMAND='ag -g ""'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Doom Emacs
#~/.emacs.d/bin

# source pip packages (needed for cmakelint)
export PATH=$PATH:~/Library/Python/3.9/bin
