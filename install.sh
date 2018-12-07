#!/bin/bash
CURRENTDIR=$PWD

cd $HOME

RET=$($CURRENTDIR/dolmades-cli-1.0/dlg1.sh)

if [[ "x$RET" == "x" ]]; then
	exit 1
fi

INSTALLDIR=$($CURRENTDIR/dolmades-cli-1.0/dlg2.sh)

if [[ -d "$INSTALLDIR/dolmades-1.0" ]]; then
	$CURRENTDIR/dolmades-cli-1.0/dlg3.sh
	exit 1
fi

if [[ "x$INSTALLDIR" == "x" ]]; then
        exit 1
fi

INSTALLDIR="$INSTALLDIR/dolmades-1.0"
mkdir "$INSTALLDIR" && cd "$INSTALLDIR"

echo "Copying files..."
mv $CURRENTDIR/dolmade.png "$INSTALLDIR/dolmade.png" && \
mv $CURRENTDIR/dolmades-cli-1.0 "$INSTALLDIR/cli" && \
rm -rf $CURRENTDIR/.dolmades/repo/containers/* && \
mv $CURRENTDIR/.dolmades "$INSTALLDIR/.dolmades" 

echo "Patching config..."
cat "$INSTALLDIR/cli/config.py.orig" | sed 's#DOLMADES_PATH = HOME + #DOLMADES_PATH = "'$INSTALLDIR'" + #' > "$INSTALLDIR/cli/config.py"

echo "Initializing dolmades..."
"$INSTALLDIR"/cli/dolmades init

echo "Done!"
