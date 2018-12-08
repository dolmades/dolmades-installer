#!/bin/sh

OWNDIR=`dirname "$(readlink -f "$0")"`
cd "$OWNDIR"

xdg-icon-resource uninstall --size 64 dolmades-dolmade-64.png dolmades-menu
xdg-icon-resource uninstall --size 22 dolmades-dolmade-22.png dolmades-menu
xdg-icon-resource uninstall --size 64 dolmades-remove-64.png dolmades-uninstall
xdg-icon-resource uninstall --size 22 dolmades-remove-22.png dolmades-uninstall

xdg-desktop-menu uninstall dolmades-dolmades.directory dolmades-dolmades.directory *.desktop
