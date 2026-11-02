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

build() {
    cargo rustc --locked --release --features oxp --crate-type cdylib "$@"
}

case "$host" in
    *linux*)
        out="dist/$NAME-$version-linux-${host%%-*}.oxp"
        build
        cp "target/release/lib$LIBRARY.so" "$out"
        ;;
    *)
        echo "build-oxp.sh: $NAME is for Linux only (this is $host)" >&2
        exit 1
        ;;
esac
echo "$out"
