#!/bin/sh

template="template"

genPDE() {
  if [ -d ./$2 ]
  then
    echo "$2 already exists."
  else
    cp -r $1/ $2/
    mv ./$2/$1.pde ./$2/$2.pde
    echo "$2 was made."
    ls -a $2
  fi
}

case "$#" in
  "0" )
    sketch="sketch_"`date "+%y%m%d_%H%M"`
    genPDE $template $sketch
  ;;
  "1" )
    filename=$1
    genPDE $template $filename
  ;;
  "2" )
    sourcefile=$1
    newfile=$2
    genPDE $sourcefile $newfile
  ;;
  * )
    echo "usage:"
    echo "  $0            : make new sketch."
    echo "  $0 new        : copy template and make new PDE"
    echo "  $0 source new : copy source and make new PDE"
  ;;
esac
