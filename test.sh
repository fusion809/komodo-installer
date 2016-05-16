export RELDIR=$(dirname "$0" | sed 's|.||g')
if [[ -n $RELDIR ]]; then
  export INDIR="$PWD/$RELDIR"
else
  export INDIR=$PWD
fi
echo $INDIR
