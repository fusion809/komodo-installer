#!/bin/bash

. ./lib/test.sh

# Install komodo-edit
function komaur {

  # Export env variables
  export AUR=https://aur.archlinux.org/cgit/aur.git/snapshot/
  export GIT=https://aur.archlinux.org/

  printf "Would you prefer to install Komodo Edit from the AUR or from my PKGBUILDs GitHub repository? [AUR/GitHub/?; GitHub is the default] "
  read choice

  if [[ $choice == "?" ]]; then

    printf 'If you opt to install Komodo from the AUR, the AUR helper `yaourt` will be used to install it. This means that when updates become available from the AUR you will be able to install them (along with packages updates from the pacman repositories and other AUR packages you have installed) by running `yaourt -Syua`.\nMy PKGBUILD for Komodo Edit should be up-to-date and uses a desktop configuration file with MimeType support for a wider variety of different file formats than that provided by the AUR.'

    printf "Would you prefer to install Komodo Edit from the AUR or from my PKGBUILDs GitHub repository? [AUR/GitHub; GitHub is the default] "
    read choice

  fi

  if [[ $choice == "AUR" ]]; then

    if comex yaourt; then                    # Install with yaourt if possible

      printf "Great you have yaourt already installed!"

    elif comex git; then                      # Install with git and makepkg otherwise

      printf "Ah, it seems you do not have yaourt installed, so I'm about to install it for you!"

      git clone $GIT/package-query.git /tmp/package-query
      git clone $GIT/yaourt.git /tmp/yaourt

      cd /tmp/package-query && makepkg -si --noconfirm
      cd /tmp/yaourt && makepkg -si --noconfirm

    elif comex curl; then                     # Install with curl and makepkg otherwise

      curl -sL $AUR/package-query.tar.gz | tar xz -C /tmp
      curl -sL $AUR/yaourt.tar.gz | tar xz -C /tmp
      cd /tmp/package-query && makepkg -si --noconfirm
      cd /tmp/yaourt && makepkg -si --noconfirm

    elif comex wget; then                     # Install with wget and makepkg otherwise

      wget -cqO- $AUR/package-query.tar.gz | tar xz -C /tmp
      wget -cqO- $AUR/yaourt.tar.gz | tar xz -C /tmp
      cd /tmp/package-query && makepkg -si --noconfirm
      cd /tmp/yaourt && makepkg -si --noconfirm

    else                                      # Install curl and install with curl and makepkg otherwise

      sudo pacman -S curl --noconfirm
      curl -sL $AUR/package-query.tar.gz | tar xz -C /tmp
      curl -sL $AUR/yaourt.tar.gz | tar xz -C /tmp
      cd /tmp/package-query && makepkg -si --noconfirm
      cd /tmp/yaourt && makepkg -si --noconfirm

    fi

    yaourt -S komodo-edit --noconfirm

  else # GitHub is the default

    if comex git; then

      git clone https://github.com/fusion809/PKGBUILDs.git /tmp/PKGBUILDs

    elif comex curl; then

      curl -sL https://github.com/fusion809/PKGBUILDs/archive/master.tar.gz | tar xz --transform=s/PKGBUILDs-master/PKGBUILDs -C /tmp

    elif comex wget; then

      wget -cqO- https://github.com/fusion809/PKGBUILDs/archive/master.tar.gz | tar xz --transform=s/PKGBUILDs-master/PKGBUILDs -C /tmp

    fi

    cd /tmp/PKGBUILDs/komodo-edit
    makepkg -si --noconfirm
  fi
}

export -f komaur
