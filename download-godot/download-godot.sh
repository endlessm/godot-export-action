#!/bin/bash
set -ex

: "${VERSION:?godot_version must be set}"
: "${FLAVOR:?godot_flavor must be set}"

mkdir -p build && cd build

wget --progress=dot:giga -O Godot.zip "https://downloads.godotengine.org/?version=${VERSION}&flavor=${FLAVOR}&slug=linux.x86_64.zip&platform=linux.64"
unzip Godot.zip
rm Godot.zip
mv "Godot_v${VERSION}-${FLAVOR}_linux.x86_64" godot

# Tell Godot Engine to run in "self-contained" mode so it looks for
# templates in build/editor_data/ instead of in ~/.local/share/godot/
touch ._sc_
