# macOS
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

