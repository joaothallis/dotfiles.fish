# dotfiles

## Requirements

- [fish](https://fishshell.com/)

## Installation 

```fish
git clone --bare git@github.com:joaothallis/dotfiles.git $HOME/.dotfiles

abbr --add config 'git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

config config --local status.showUntrackedFiles no

# to solve conflicts accepting the dotfiles files
config reset --hard

config checkout

mkdir ~/Projects
git clone git@github.com:edentsai/tig-theme-molokai-like.git ~/Projects/tig-theme-molokai-like
```
