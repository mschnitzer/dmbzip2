#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: dmbzip2 [Branch]"
    exit 1
fi

BRANCH=$1
TMPPATH="/tmp/dmbzip2"
CURRPATH=$PWD
UNPACKPATH="docmanager-$BRANCH"
BZ2NAME="docmanager.tar.bz2"

rm -r $TMPPATH
mkdir $TMPPATH
cd $TMPPATH
wget https://github.com/openSUSE/docmanager/archive/$BRANCH.zip
unzip $BRANCH.zip
mv $UNPACKPATH docmanager
tar cfj $BZ2NAME docmanager
mv $BZ2NAME $CURRPATH
cd $CURRPATH
rm -r $TMPPATH
