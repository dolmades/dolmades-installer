#!/bin/sh

OWNDIR=`dirname "$(readlink -f "$0")"`
cd "$OWNDIR"

export UDOCKER_DIR="$(readlink -f $OWNDIR/../.dolmades/)"

./udocker --quiet run --user=$(whoami) --volume=$OWNDIR:/install --hostenv dolmades-runtime sh -c \
'yad \
 --window-icon=/install/dolmade.png \
 --image=/install/dolmade.png \
 --sticky \
 --on-top \
 --center \
 --title "Installation of Dolmades v1.0 - The Goglizer" \
 --text "Installation succeeded!" \
 --wrap \
 --button=gtk-ok'
