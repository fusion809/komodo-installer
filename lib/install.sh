#!/bin/bash

function komodo_install {
  # Determine the architecture we're on
  export ARCH=$(uname -m | sed 's/i[0-9]/x/g')

  # Determine the latest version of Komodo Edit
  version

  # Determines where the user likes to install Komodo to
  dest

  # Delete previous install attempt directories
  if [[ -d $SRC_DEST/Komodo-Edit-$major-$minor-linux-$ARCH ]]; then
    rm -rf $SRC_DEST/Komodo-Edit-$major-$minor-linux-$ARCH
  fi

  if [[ -d $INST_DEST ]]; then
    sudo rm -rf $INST_DEST
  fi

  # Get the source

  cd $SRC_DEST

  if ! [[ -f Komodo-Edit-$major-$minor-linux-$ARCH.tar.gz ]]; then
    curl -OsL http://downloads.activestate.com/Komodo/releases/$major/Komodo-Edit-$major-$minor-linux-$ARCH.tar.gz
  fi
  tar -xzf Komodo-Edit-$major-$minor-linux-$ARCH.tar.gz

  cp -a /tmp/komodo-edit/_install.py.patch \
        /tmp/komodo-edit/activestate.py.patch $SRC_DEST

  # package() function
  cd "$SRC_DEST/Komodo-Edit-$major-$minor-linux-$ARCH"

  if [[ $DEST_TYPE == "local" ]]; then

    ./install.sh -s -I $INST_DEST --dest-dir $INST_DEST 2>&1 > /dev/null
    sed -e "s|<%-INSTDIR-%>|$INST_DEST|g" \
      $INDIR/resources/komodo-edit.desktop > $HOME/.local/share/applications/komodo-edit.desktop

  else

    sudo ./install.sh -s -I $INST_DEST --dest-dir $INST_DEST 2>&1 > /dev/null

    sed -e "s|<%-INSTDIR-%>|$INST_DEST|g" $INDIR/resources/komodo-edit.desktop > $INDIR/resources/komodo-edit2.desktop

    sudo install -Dm644 $INDIR/resources/komodo-edit2.desktop /usr/share/applications/komodo-edit.desktop

    sudo ln -sf $INST_DEST/bin/komodo /usr/bin/komodo
  fi
}

export -f komodo_install
