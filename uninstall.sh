#!/bin/sh

OWNDIR=`dirname "$(readlink -f "$0")"`
cd "$OWNDIR"

./udocker --quiet --repo="$PWD/../.dolmades/repo" run --user=$(whoami) --volume=$OWNDIR:/install --hostenv dolmades-runtime sh -c \
'yad --width=500 --height=100 \
 --window-icon=/install/dolmade.png \
 --image=/install/dolmade.png \
 --sticky \
 --on-top \
 --center \
 --title "Uninstallation of Dolmades v1.0 - The Goglizer" \
 --text "This will remove Dolmades v1.0 - The Goglizer and all installed Win Apps from this machine!\nAre you sure?" \
 --button=gtk-no:1 --button=gtk-yes:0'

if [ "$?" -eq "0" ]; then
	"$OWNDIR/xdg/uninstall.sh"
	rm -rf "$OWNDIR/../"
fi
