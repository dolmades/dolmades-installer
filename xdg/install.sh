#!/bin/sh

OWNDIR=`dirname "$(readlink -f "$0")"`
cd "$OWNDIR"

echo "Path=$(readlink -f "$OWNDIR"/../)" >> dolmades-dolmades-the_goglizer.desktop
echo "Path=$(readlink -f "$OWNDIR"/../)" >> dolmades-dolmades-uninstall.desktop

xdg-desktop-menu install \
 dolmades-dolmades.directory \
 dolmades-dolmades-the_goglizer.desktop \
 dolmades-dolmades-uninstall.desktop

xdg-icon-resource install --size 64 dolmades-dolmade-64.png dolmades-menu
xdg-icon-resource install --size 22 dolmades-dolmade-22.png dolmades-menu
xdg-icon-resource install --size 64 dolmades-remove-64.png dolmades-uninstall
xdg-icon-resource install --size 22 dolmades-remove-22.png dolmades-uninstall

#xdg-icon-resource install --size 64 dolmades-cook-64.png dolmades-cook
#xdg-icon-resource install --size 64 dolmades-ingredient-64.png dolmades-ingredient
#xdg-icon-resource install --size 64 dolmades-recipe-64.png dolmades-recipe
#xdg-icon-resource install --size 64 dolmades-tools-64.png dolmades-tools
#xdg-icon-resource install --size 64 dolmades-run-64.png dolmades-run
