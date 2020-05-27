#!/bin/sh
jumpToDir() {
  dirname=$(find $HOME \( -path $HOME'/aur' -o -path $HOME'/texmf' \)  -prune \
    -o -type d -not -path '*/\.*' \
    | sed -e "s|^$HOME|~|" \
    | fzf \
    | sed -e "s|^~|$HOME|")

  [ -z $dirname ] || cd $dirname && true
}
