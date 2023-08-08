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

`ln -s /Users/johngarrett/dotfiles/alacritty.yml /Users/johngarrett/.config/alacritty.yml`

`ln -s /Users/johngarrett/dotfiles/tmux.conf /Users/johngarrett/.tmux.conf`

install BlexMono font from folder

install antigen
`curl -L git.io/antigen > ~/antigen.zsh`

`ln -s /Users/johngarrett/dotfiles/zshrc /Users/johngarrett/.zshrc`

# neovim

` ln -s /Users/johngarrett/dotfiles/nvim ~/.config/`

install vim plug
`curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`

`:PlugInstall`

install packer

`git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim`

 `:PackerInstall`
