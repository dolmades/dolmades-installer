#!/bin/sh

OWNDIR=`dirname "$(readlink -f "$0")"`
cd $OWNDIR

INSTALLDIR=$(D --window-icon=$CURRENTDIR/dolmade.png --image=$CURRENTDIR/dolmade.png --title "Installing Dolmades v1.0 - The Goglizer" --text "Select an installation directory" --file-selection --directory)

./udocker --quiet --repo="$PWD/../.dolmades/repo" run --user=$(whoami) --volume=$OWNDIR:/install --hostenv runtime sh -c \
'yad \
 --window-icon=/install/dolmade.png \
 --image=/install/dolmade.png \
 --sticky \
 --on-top \
 --center \
 --title "Installation of Dolmades v1.0 - The Goglizer" \
 --text "The version of dolmades you are trying to install is already installed! Please remove it first and try again!" \
 --wrap \
 --button=gtk-ok'
