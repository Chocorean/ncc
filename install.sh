#!/bin/bash

mv secrets_example.txt secrets.txt
vim secrets.txt
if [[ -n $1 ]]
then
  sudo ln -s $(pwd)/ncc.sh /usr/local/bin/ncc
else
  sudo ln -s $(pwd)/ncc.sh "$1/ncc"
fi
