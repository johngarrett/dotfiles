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

# Gen

`mkdir ~/.config`

`ln -s /Users/garrepi/dotfiles/alacritty.yml /Users/garrepi/.config/alacritty.yml`

`ln -s /Users/garrepi/dotfiles/tmux.conf /Users/garrepi/.tmux.conf`

install BlexMono font from folder

install antigen
`curl -L git.io/antigen > ~/antigen.zsh`

`ln -s /Users/garrepi/dotfiles/zshrc /Users/garrepi/.zshrc`

# neovim


install nvchad

```
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
```

```
rm ~/.config/nvim/lua/custom

ln -s ~/dotfiles/nvim/lua/custom ~/.config/nvim/lua
```

