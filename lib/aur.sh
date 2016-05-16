#!/bin/bash

. ./lib/test.sh

function komin {
  cd /tmp/komodo-edit
  makepkg -si --noconfirm
  cd .
}

export -f komin

# Install komodo-edit
function komaur {

  # Export env variables
  export AUR=https://aur.archlinux.org/cgit/aur.git/snapshot/
  export GIT=https://aur.archlinux.org/

  if comex yaourt; then                    # Install with yaourt if possible

    yaourt -S komodo-edit --noconfirm

  elif comex git; then                      # Install with git and makepkg otherwise

    git clone $GIT/komodo-edit.git /tmp/komodo-edit
    komin

  elif comex curl; then                     # Install with curl and makepkg otherwise

    curl -sL $AUR/komodo-edit.tar.gz | tar xz -C /tmp
    komin

  elif comex wget; then                     # Install with wget and makepkg otherwise

    wget -cqO- $AUR/komodo-edit.tar.gz | tar xz -C /tmp
    komin

  else                                      # Install curl and install with curl and makepkg otherwise

    sudo pacman -S curl --noconfirm
    curl -sL $AUR/komodo-edit.tar.gz | tar xz -C /tmp
    komin

  fi
}

export -f komaur
