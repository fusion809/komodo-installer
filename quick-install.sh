#!/bin/bash

# This is a quick install script to install Komodo ASAP
export REPO=https://github.com/fusion809/komodo-installer
export GHUB=$HOME/GitHub
export GHUBM=$HOME/GitHub/mine

if ! [[ -d $GHUB ]]; then
  mkdir $GHUB
fi

###########################################################################################################################################
# Get the komodo-installer repo if not present and update it, if not.
if [[ -d $GHUBM ]]; then
  cd $GHUBM

  if ! [[ -d $GHUBM/komodo-installer ]]; then                                                  # Get the repository, if necessary
    printf "Getting the komodo-installer repository locally ==>\n"

    ## git
    if which git >/dev/null 2>&1; then
      git clone $REPO $GHUBM/komodo-installer

    ## cURL
    elif which curl >/dev/null 2>&1; then
      curl -sL $REPO/archive/master.tar.gz | tar xz --transform=s/komodo-installer-master/komodo-installer/ -C $GHUBM

    ## wget
    elif which wget >/dev/null 2>&1; then
      wget -cqO- $REPO/archive/master.tar.gz | tar xz --transform=s/komodo-installer-master/komodo-installer/ -C $GHUBM
    fi
  else
    printf "Updating your local copy of komodo-installer"

    ## git
    if [[ -d $GHUBM/komodo-installer/.git ]]; then
      cd $GHUBM/komodo-installer
      git pull origin master
      cd .

    ## cURL
    elif which curl >/dev/null 2>&1; then
      rm -rf $GHUBM/komodo-installer
      curl -sL $REPO/archive/master.tar.gz | tar xz --transform=s/komodo-installer-master/komodo-installer/ -C $GHUBM

    ## wget
    elif which wget >/dev/null 2>&1; then
      rm -rf $GHUBM/komodo-installer
      wget -cqO- $REPO/archive/master.tar.gz | tar xz --transform=s/komodo-installer-master/komodo-installer/ -C $GHUBM
    fi
  fi

else
  cd $GHUB

  if ! [[ -d $GHUB/komodo-installer ]]; then                                                  # Get the repository, if necessary
    printf "Getting the komodo-installer repository locally ==>\n"

    ## git
    if which git >/dev/null 2>&1; then
      git clone $REPO $GHUB/komodo-installer

    ## cURL
    elif which curl >/dev/null 2>&1; then
      curl -sL $REPO/archive/master.tar.gz | tar xz --transform=s/komodo-installer-master/komodo-installer/ -C $GHUB

    ## wget
    elif which wget >/dev/null 2>&1; then
      wget -cqO- $REPO/archive/master.tar.gz | tar xz --transform=s/komodo-installer-master/komodo-installer/ -C $GHUB
    fi
  else
    printf "Updating your local copy of komodo-installer."

    ## git
    if [[ -d $GHUB/komodo-installer/.git ]]; then
      cd $GHUB/komodo-installer
      git pull origin master
      cd .

    ## cURL
    elif which curl >/dev/null 2>&1; then
      rm -rf $GHUB/komodo-installer
      curl -sL $REPO/archive/master.tar.gz | tar xz --transform=s/komodo-installer-master/komodo-installer/ -C $GHUB

    ## wget
    elif which wget >/dev/null 2>&1; then
      rm -rf $GHUB/komodo-installer
      wget -cqO- $REPO/archive/master.tar.gz | tar xz --transform=s/komodo-installer-master/komodo-installer/ -C $GHUB
    fi

  fi

fi
###########################################################################################################################################

# Run the main installer script
if [[ -d $GHUB/komodo-installer ]]; then
  cd $GHUB/komodo-installer
  ./installer.sh
elif [[ -d $GHUBM/komodo-installer ]]; then
  cd $GHUBM/komodo-installer
  ./installer.sh
fi
