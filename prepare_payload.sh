#!/bin/bash

DOLMADES_VERSION="1.0"
OLDDIR=$PWD
PAYLOAD=$PWD/payload
export UDOCKER_DIR=$PAYLOAD/.dolmades/

function prepare_payload() {
	mkdir -p $PAYLOAD
	cd $PAYLOAD
	curl -L -o dolmades.tgz "https://github.com/dolmades/dolmades-cli/archive/v$DOLMADES_VERSION.tar.gz"
	tar -xzf dolmades.tgz
	sed -i.orig 's#HOME = .*$#HOME = "'$PAYLOAD'"#' $PAYLOAD/dolmades-cli-$DOLMADES_VERSION/config.py
	cd dolmades-cli-$DOLMADES_VERSION/
	mkdir -p $PAYLOAD/.dolmades
	./udocker install --force
	echo "Pulling images..."
	START=$(date +%s.%N)
	./udocker pull dolmades/runtime:$DOLMADES_VERSION
	./udocker pull dolmades/winestable:$DOLMADES_VERSION
	./udocker pull dolmades/winestaging:$DOLMADES_VERSION
	#./udocker --repo="$PAYLOAD/.dolmades/repo" pull dolmades/winedevel:$DOLMADES_VERSION
	END=$(date +%s.%N)
	echo "...done after "$(echo "$END - $START" | bc)" seconds"
	cp $OLDDIR/install.sh $PAYLOAD
	chmod +x $PAYLOAD/install.sh
	cp $OLDDIR/dolmade.png $PAYLOAD/dolmades-cli-$DOLMADES_VERSION/dolmade.png
	cp $OLDDIR/dlg?.sh $PAYLOAD/dolmades-cli-$DOLMADES_VERSION/
	chmod +x $PAYLOAD/dolmades-cli-$DOLMADES_VERSION/dlg?.sh
	cp $OLDDIR/{uninstall.sh,dolmades-wrapper.sh} $PAYLOAD/dolmades-cli-$DOLMADES_VERSION/
	chmod +x $PAYLOAD/dolmades-cli-$DOLMADES_VERSION/{uninstall.sh,dolmades-wrapper.sh}
	cp -r $OLDDIR/xdg $PAYLOAD/dolmades-cli-$DOLMADES_VERSION/
	chmod +x $PAYLOAD/dolmades-cli-$DOLMADES_VERSION/xdg/{install.sh,uninstall.sh}
}

rm -rf $PAYLOAD
prepare_payload
