#!/bin/zsh

git submodule init
git submodule update --init --recursive
git submodule foreach "git checkout master"
git submodule foreach "git pull"
git submodule foreach "git submodule foreach \"git checkout master\""
git submodule foreach "git submodule foreach \"git pull\""

if [[ $(uname) == Darwin ]]; then
    defaults write org.vim.MacVim MMRenderer 2
    defaults write org.vim.MacVim MMZoomBoth 1
fi
