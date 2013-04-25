#!/usr/bin/env zsh

for f in gvimrc vimrc; do
    ln -sfv $PWD/$f $HOME/.$f
done

if [[ ! -e $HOME/.vim ]]; then
  mkdir -p $HOME/.vim
fi

for f in autoload bundle colors compiler ftplugin indent syntax; do
    ln -sfv $PWD/$f $HOME/.vim/$f
done

pushd bundle/Command-T
rake make
popd
