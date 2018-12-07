#!/bin/sh

OWNDIR=`dirname "$(readlink -f "$0")"`
cd $OWNDIR

INSTALLDIR=$(D --window-icon=$CURRENTDIR/dolmade.png --image=$CURRENTDIR/dolmade.png --title "Installing Dolmades v1.0 - The Goglizer" --text "Select an installation directory" --file-selection --directory)


./udocker --quiet --repo="$PWD/../.dolmades/repo" run --user=$(whoami) --bindhome --volume=$OWNDIR:/install --hostenv runtime sh -c \
'cd "'$HOME'" && yad \
 --window-icon=/install/dolmade.png \
 --image=/install/dolmade.png \
 --sticky \
 --on-top \
 --center \
 --title "Installation of Dolmades v1.0 - The Goglizer" \
 --file-selection --directory'
