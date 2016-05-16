#!/bin/bash
function dest {
  export PRG=$HOME/Programs
  printf "Where do you want to store the binary tarball contents? [Leave empty for $PRG] "
  read SRC_DEST

  if ! [[ -n $SRC_DEST ]]; then
    SRC_DEST=$PRG
  fi

  printf "Do you want to install Komodo Edit locally or system-wide? [local/system, default: system] "
  read DEST_TYPE

  printf "Where do you want to install Komodo Edit? [Leave empty for $SRC_DEST (local) and /opt (system)] "
  read INST_DEST

  if ! [[ -n $INST_DEST ]]; then
    if [[ $DEST_TYPE == "local" ]]; then
      INST_DEST=$SRC_DEST
    else
      INST_DEST=/opt/komodo-edit
    fi
  fi

  if ! [[ -d $INST_DEST ]]; then
    mkdir -p $INST_DEST
  fi

  export SRC_DEST
  export DEST_TYPE
  export INST_DEST
}

export -f dest
