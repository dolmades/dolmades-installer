#!/bin/bash
$PWD/dolmades-cli-1.0/udocker --repo="$PWD/.dolmades/repo" create --name=dolmades-runtime dolmades/runtime:1.0

RET=$($PWD/dolmades-cli-1.0/dlg1.sh)

if [[ "x$RET" == "x" ]]; then
	exit 1
fi

INSTALLDIR=$($PWD/dolmades-cli-1.0/dlg2.sh)

if [[ "x$INSTALLDIR" == "x" ]]; then
        exit 1
fi

if [[ -d "$INSTALLDIR/dolmades-1.0" ]]; then
	$PWD/dolmades-cli-1.0/dlg3.sh
	exit 1
fi

INSTALLDIR="$INSTALLDIR/dolmades-1.0"
mkdir "$INSTALLDIR" 

echo "Copying files..."
mv $PWD/dolmades-cli-1.0 "$INSTALLDIR/cli" && \
mv $PWD/.dolmades "$INSTALLDIR/.dolmades" 

echo "Patching config..."
cat "$INSTALLDIR/cli/config.py.orig" | sed 's#DOLMADES_PATH = HOME + #DOLMADES_PATH = "'$INSTALLDIR'" + #' > "$INSTALLDIR/cli/config.py"

echo "Initializing dolmades..."
"$INSTALLDIR"/cli/dolmades init

echo "Done!"
"$INSTALLDIR"/cli/dlg5.sh
