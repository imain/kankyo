#!/bin/bash

rm -f public_config.tar.gz
tar fchvz public_config.tar.gz \
    ~/.zshrc \
    ~/.zshenv \
    ~/.vimrc \
    ~/.vimrc.local \
    ~/.vimshrc \
    ~/.vim \
    ~/.tmux.conf \
    ~/.gitconfig \
    ~/.bash_profile \
    ~/.bashrc

rm -f private_config.tar.gz
tar fchvz private_config.tar.gz \
    ~/.ssh

rm private_config.tar.gz.gpg
gpg --symmetric --cipher-algo aes256 private_config.tar.gz

# Just for cleanup so its not lying around.
rm -f private_config.tar.gz

