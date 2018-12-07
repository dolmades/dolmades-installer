#!/bin/sh
OWNDIR=`dirname "$(readlink -f "$0")"`
cd $OWNDIR
./udocker --repo="$PWD/../.dolmades/repo" run --user=$(whoami) --hostenv runtime sh -c 'yad "'$@'"'
