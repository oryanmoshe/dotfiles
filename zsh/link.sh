#!/bin/bash
ln -Ffs "$(pwd)/"$(basename "$(dirname "${BASH_SOURCE[0]}")")"/.zsh" ~/.zsh
ln -Ffs ~/.zsh/.zshrc ~/.zshrc
