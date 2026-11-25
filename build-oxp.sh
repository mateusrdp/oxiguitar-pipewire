#!/usr/bin/env bash
# SPDX-License-Identifier: GPL-3.0-or-later
# Copyright (C) 2026 Mateus Rocha de Paula and the OxiGuitar contributors
#
# Builds the plugin's release file for the system this runs on:
#
#   dist/audio-pipewire-VERSION-SYSTEM-ARCH.oxp
#
# such as dist/audio-pipewire-0.1.0-linux-x86_64.oxp, named the way OxiGuitar's plugins
# are (docs/plugins/template in github.com/mateusrdp/oxiguitar). This plugin is for Linux only (its manifest says so).
# .github/workflows/release.yml runs it.

set -euo pipefail

# The plugin's file name, and the crate's library name (the package's name
# with _ for -).
NAME=audio-pipewire
LIBRARY=oxiguitar_audio_pipewire_plugin

cd "$(dirname "$0")"
version="$(cargo pkgid)"
version="${version##*[#@]}"
host="$(rustc -vV | sed -n 's/^host: //p')"
mkdir -p dist

# pack LIBRARY OUT [MANIFEST]: the plugin file OUT (mateusrdp/oxiguitar#347),
# an uncompressed tar archive holding MANIFEST (default manifest.json) as
# manifest.json first, the library second as plugin.so, plugin.dll or
# plugin.dylib, then the ui and assets folders beside the manifest, if
# there are any. COPYFILE_DISABLE keeps macOS's tar from adding ._ files.
pack() {
    local ext="${1##*.}" manifest="${3:-manifest.json}" stage folder
    local more=()
    stage="$(mktemp -d)"
    cp "$manifest" "$stage/manifest.json"
    cp "$1" "$stage/plugin.$ext"
    for folder in ui assets; do
        if [[ -d "$(dirname "$manifest")/$folder" ]]; then
            cp -R "$(dirname "$manifest")/$folder" "$stage/"
            more+=("$folder")
        fi
    done
    (cd "$stage" && COPYFILE_DISABLE=1 tar --format=ustar -cf - manifest.json "plugin.$ext" ${more[@]+"${more[@]}"}) > "$2"
    rm -rf "$stage"
}

build() {
    cargo rustc --locked --release --features oxp --crate-type cdylib "$@"
}

case "$host" in
    *linux*)
        out="dist/$NAME-$version-linux-${host%%-*}.oxp"
        build
        pack "target/release/lib$LIBRARY.so" "$out"
        ;;
    *)
        echo "build-oxp.sh: $NAME is for Linux only (this is $host)" >&2
        exit 1
        ;;
esac
echo "$out"
