#!/bin/bash
if comex komodo; then                       # Check if Komodo Edit is already installed

  printf "Komodo Edit is already installed!"
  version
  instver=$(komodo --version | sed "s/Komodo Edit //g" | sed "s/ .*//g")
  
  if ! [[ $major == $instver ]]; then
    komaur
  fi

else

  komaur

fi
