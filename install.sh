#!/bin/bash
CURRENTDIR=$PWD

function myyad() {
	yad "$@"
}

cd $HOME

RET=$(myyad --width=500 --height=400 --window-icon=$CURRENTDIR/dolmade.png --image=$CURRENTDIR/dolmade.png --sticky --on-top --center --title "Installation of Dolmades v1.0 - The Goglizer" --text "This will install Dolmades v1.0 - The Goglizer on this machine." --wrap --form --field="Do you accept the Apache license?:TXT" "$(cat $CURRENTDIR/dolmades-cli-1.0/LICENSE)" --button=gtk-no:1 --button=gtk-yes:0)

if [[ "x$RET" == "x" ]]; then
	exit 1
fi

INSTALLDIR=$(myyad --window-icon=$CURRENTDIR/dolmade.png --image=$CURRENTDIR/dolmade.png --title "Installing Dolmades v1.0 - The Goglizer" --text "Select an installation directory" --file-selection --directory)

if [[ -d "$INSTALLDIR/dolmades-1.0" ]]; then
	myyad --text "This version of dolmades is installed already! Please remove it first and try again" --wrap --button=gtk-ok
	exit 1
else
	myyad --text "This version of dolmades isnnt installed already! Please remove it first and try again" --wrap --button=gtk-ok
fi
INSTALLDIR="$INSTALLDIR/dolmades-1.0"
mkdir "$INSTALLDIR"
cd "$INSTALLDIR"

echo "Copying files..."
mv $CURRENTDIR/.dolmades "$INSTALLDIR/.dolmades"
mv $CURRENTDIR/dolmade.png "$INSTALLDIR/dolmade.png"
mv $CURRENTDIR/dolmades-cli-1.0 "$INSTALLDIR/cli"

echo "Patching config..."
cat $INSTALLDIR/cli/config.py.orig | sed 's#DOLMADES_PATH = HOME + #DOLMADES_PATH = "'$INSTALLDIR'" + #' > cat $INSTALLDIR/cli/config.py

echo "Initializing dolmades..."
"$INSTALLDIR"/cli/dolmades init

echo "Done!"
