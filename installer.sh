#!/bin/bash
# This script is the main script of this installer.

######################################################################################################
# This first section determines if the user passed the option "help" to the installer script.
if [[ "$1" == '-h' ]] || [[ "$1" == '--help' ]] || [[ "$1" == '?' ]]; then
  . ./help.sh
fi
######################################################################################################

######################################################################################################
# This section of the installer script detects the operating system
# and relevant hardware details.

# Distribution name. Previously lsb_release was used, but it failed on Docker containers so this
# substitute was made.
export LD=$(cat /etc/os-release | grep -w "NAME" | sed 's/NAME=//g' | sed 's/"//g')
# Installer directory
export RELDIR=$(dirname "$0" | sed 's|.||g')
if [[ -n $RELDIR ]]; then
  export INDIR="$PWD/$RELDIR"
else
  export INDIR=$PWD
fi
# Distribution version number, e.g., on Fedora 23 it returns 23
export VER=$(cat /etc/os-release | grep -w "VERSION_ID" | sed 's/VERSION_ID=//g' | sed 's/"//g')

######################################################################################################

source "./lib/test.sh"                        # Load the test functions
source "./lib/dest.sh"                        # Load the dest function
source "./lib/version.sh"                     # Load the version function
source "./lib/install.sh"                     # Load the komodo install function

# Load the distribution-specific libraries
if [[ $LD == "Arch Linux" ]] || [[ $LD == "Manjaro"* ]]; then
  . "./lib/aur.sh"
  . "./distribution/arch.sh"
elif [[ $LD == "CentOS"* ]]; then
  . "./distribution/centos.sh"
elif [[ $LD == "Debian"* ]]; then
  . "./distribution/debian.sh"
elif [[ $LD == "Fedora"* ]]; then
  . "./distribution/fedora.sh"
elif [[ $LD == "Mageia"* ]]; then
  . "./distribution/mageia.sh"
elif [[ $LD == "openSUSE"* ]]; then
  . "./distribution/opensuse.sh"
elif [[ $LD == "Sabayon"* ]]; then
  . "./distribution/sabayon.sh"
elif [[ $LD == "Ubuntu"* ]]; then
  . "./distribution/ubuntu.sh"
fi
