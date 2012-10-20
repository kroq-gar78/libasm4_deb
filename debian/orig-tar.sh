#!/bin/sh

set -eu

VERSION=$2
TAR=../asm4_$VERSION.orig.tar.gz
DIR=asm-$VERSION
TAG=$(echo "ASM_$VERSION" | sed -re's,\.,_,g')

svn export svn://svn.forge.objectweb.org/svnroot/asm/tags/${TAG}/ $DIR
tar -c -z -f $TAR --exclude '*.jar' $DIR
rm -rf $DIR ../listing.php

# move to directory 'tarballs'
if [ -r .svn/deb-layout ]; then
  . .svn/deb-layout
  mv $TAR $origDir && echo "moved $TAR to $origDir"
fi

