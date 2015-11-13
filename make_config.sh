#!/bin/bash

rm config.tar.gz
tar fchvz config.tar.gz ~/.zshrc ~/.zshenv ~/.vimrc ~/.vimrc.local ~/.vimshrc ~/.tmux.conf ~/.ssh ~/.irssi ~/.bashrc ~/bin

rm config.tar.gz.gpg
gpg --symmetric --cipher-algo aes256 config.tar.gz

