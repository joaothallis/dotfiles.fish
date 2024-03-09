# dotfiles

## Requirements

- [fish](https://fishshell.com/)

## Installation 

```fish
git clone --bare git@github.com:joaothallis/dotfiles.git $HOME/.dotfiles

git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no

# to solve conflicts accepting the dotfiles files
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME reset --hard

git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout

mkdir ~/Projects
git clone git@github.com:edentsai/tig-theme-molokai-like.git ~/Projects/tig-theme-molokai-like
```
