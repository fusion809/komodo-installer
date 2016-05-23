#!/bin/bash
source "./lib/install.sh"

printf "\n\nGreetings, you seem to be using an operating system that is not officially supported by this installer. Despite this, provided you are using some distribution of Linux this installer can still be used to install Komodo Edit from its general Linux binary tarball, provided you have the following packages installed:
* dbus-glib
* GCC (most importantly its libraries)
* glibc
* GTK2
* libjpeg-turbo
This script will test for each of these dependencies and tell you which one you need to install. If a package is installed yet still this script returns a output indicating it is not, you may need to add the package's executable to your PATH.\n"

if ! `comex gcc`; then
  printf "GCC was not detected. Please install it, or if it is installed add its executable to your system PATH.\n"
fi

if ! [[ -d /usr/lib/gtk-2.0/ ]]; then
  printf "GTK2 development headers were not detected.\n"
fi

if ! [[ -f /usr/lib/pkgconfig/dbus-glib-*.pc ]]; then
  printf "dbus-glib does not seem to be installed!\n"
fi

if ! [[ -f /usr/lib/libresolv* ]]; then
  printf "glibc does not seem to be installed.\n"
fi

if ! [[ -f /usr/lib/libjpeg.so ]]; then
  printf "libjpeg-turbo does not seem to be installed!\n"
fi

printf "Have you installed all the dependencies? [y/n]\n If you answer y, komodo_install will be run!\n"
read depsyn

if [[ $depsyn == "y" ]]; then
  komodo_install
fi
