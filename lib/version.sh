#!/bin/bash
function version {

  if ! [[ -d /tmp/komodo-edit ]]; then
    git clone https://aur.archlinux.org/komodo-edit.git /tmp/komodo-edit
  else
    cd /tmp/komodo-edit
    git pull origin master
  fi

  export major=$(sed -n 's/_major=//p' /tmp/komodo-edit/PKGBUILD | sed 's/"//g')
  export minor=$(sed -n 's/_minor=//p' /tmp/komodo-edit/PKGBUILD)
}

export -f version
