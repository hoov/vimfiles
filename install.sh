#!/bin/zsh

for f in gvimrc vimrc; do
    ln -sfhv $PWD/$f $HOME/.$f
done

if [[ ! -e $HOME/.vim ]]; then
  mkdir -p $HOME/.vim
fi

for f in autoload bundle colors compiler indent syntax; do
    ln -sfhv $PWD/$f $HOME/.vim/$f
done

pushd bundle/Command-T
rake make
popd
