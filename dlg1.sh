#!/bin/sh

OWNDIR=`dirname "$(readlink -f "$0")"`
cd "$OWNDIR"

export UDOCKER_DIR="$(readlink -f $OWNDIR/../.dolmades/)"

./udocker --quiet run --user=$(whoami) --volume=$OWNDIR:/install --hostenv dolmades-runtime sh -c \
'yad --width=500 --height=400 \
 --window-icon=/install/dolmade.png \
 --image=/install/dolmade.png \
 --sticky \
 --on-top \
 --center \
 --title "Installation of Dolmades v1.0 - The Goglizer" \
 --text "This will install Dolmades v1.0 - The Goglizer on this machine" \
 --wrap --form --field="Do you accept the Apache license?:TXT" \
 "$(cat /install/LICENSE)" \
 --button=gtk-no:1 --button=gtk-yes:0'
