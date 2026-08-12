# Dotfiles

Supports macOS, Debian/Ubuntu, and Arch Linux.

## Setup

```bash
git clone --recurse-submodules git@github.com:johngarrett/dotfiles.git
cd dotfiles
./setup.sh
```

The setup script installs Git, curl, zsh, tmux, Neovim, and Alacritty using
Homebrew, apt, or pacman. Existing configuration files are moved to timestamped
backups before symlinks are created. Run `prefix-I` inside tmux to install TPM
plugins.

Neovim is tracked as a submodule from the personal NvChad repository and pinned
to the configuration commit used on the development machine. That commit must
be available from the remote before a fresh clone can initialize the submodule.

## Older manual notes

install alacritty
```bash
brew install --cask alacritty --no-quarantine
```
install neovim
`brew install neovim`

install tmux
`brew install tmux`

install fzf
`brew install fzf`

install fzf keybindings
`$(brew --prefix)/opt/fzf/install`

install easy move + resize
```bash
brew install --cask easy-move-plus-resize
```

install ranger
`brew install ranger`

install chrome
`brew install --cask google-chrome`

install [cursorcerer](https://doomlaser.com/cursorcerer-hide-your-cursor-at-will/)
# Gen

`mkdir ~/.config`

`ln -s /Users/garrepi/dotfiles/alacritty.yml /Users/garrepi/.config/alacritty.yml`

`ln -s /Users/garrepi/dotfiles/tmux.conf /Users/garrepi/.tmux.conf`

install BlexMono font from folder

install antigen
`curl -L git.io/antigen > ~/antigen.zsh`

`ln -s /Users/garrepi/dotfiles/zshrc /Users/garrepi/.zshrc`

install nvm
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
```

# neovim

install nvchad

```
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
```

```
rm ~/.config/nvim/lua/custom

ln -s ~/dotfiles/nvim/lua/custom ~/.config/nvim/lua
```
