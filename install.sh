#!/bin/zsh

for f in gvimrc vimrc; do
    ln -sf `pwd`/$f ~/.$f
done

if [[ ! -e ~/.vim ]]; then
  mkdir -p ~/.vim
fi

for f in autoload bundle colors; do
    ln -sf `pwd`/$f ~/.vim/$f
done
