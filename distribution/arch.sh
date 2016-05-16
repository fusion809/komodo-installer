#!/bin/bash
if comex komodo; then                       # Check if Komodo Edit is already installed

  printf "Komodo Edit is already installed!"

else

  komodo-install
  
fi
