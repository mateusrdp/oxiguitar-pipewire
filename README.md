# oxiguitar-pipewire

The PipeWire audio output plugin for [OxiGuitar](https://github.com/mateusrdp/oxiguitar), a free, open-source guitar tablature and score viewer, editor and player for Windows, macOS and Linux. It plays OxiGuitar's sound through PipeWire, the sound system of current Linux desktops, with the lowest latency of the Linux outputs.

In plain words: OxiGuitar works out the sound, and an output plugin hands it to the operating system's sound system on time, batch after batch. Every system has its own sound system, so each gets its own plugin. The [manual](https://mateusrdp.github.io/oxiguitar-pipewire/) explains latency and buffers.

- Plugin file `audio-pipewire.oxp`, id `oxiguitar.audio-pipewire`, Linux only (x86_64 and ARM64). It needs `libpipewire-0.3` at run time, which every PipeWire desktop has. Where PipeWire is not running, OxiGuitar uses oxiguitar-alsa.
- It is built on Ubuntu 24.04 (PipeWire's headers do not build on 22.04), so it needs glibc 2.39 or newer; the AppImage, which is built on 22.04, plays through ALSA instead.
- It shares its code with the other outputs, oxiguitar-alsa, oxiguitar-wasapi and oxiguitar-coreaudio: a stream on one of cpal's hosts, in [oxiguitar-audio-cpal](https://github.com/mateusrdp/oxiguitar-audio-cpal), which this plugin depends on by tag.
- It plays sound only on your machine: it uploads and downloads nothing.

## Manual

The manual is at <https://mateusrdp.github.io/oxiguitar-pipewire/>. Its source is in [docs/manual](docs/manual). It covers what the plugin is for, how it works, what it needs and how to install it.

## Install

Every [release](https://github.com/mateusrdp/oxiguitar-pipewire/releases) holds a zip per Linux processor (x86_64 and ARM64), a `.deb` and an `.rpm` for each, and a `SHA256SUMS` file. The [manual's install page](https://mateusrdp.github.io/oxiguitar-pipewire/install.html) says which one to use and how to keep it updated. The plugin needs OxiGuitar 0.11 or later (plugin interface 1.4).

## Build and test

Rust 1.99 or later from [rustup](https://rustup.rs). The plugin SDK comes from OxiGuitar's repository by git tag (`v0.11.0`); nothing of OxiGuitar's is on crates.io.

```sh
cargo test          # unit tests, and the contract suite on the built .oxp file (needs libasound2-dev, libpipewire-0.3-dev and libclang-dev on Debian and Ubuntu)
./build-oxp.sh      # dist/audio-pipewire-VERSION-SYSTEM-ARCH.oxp
python3 scripts/test-all.py   # every test, as the manual's Testing page says
```

## History

This plugin lived in the OxiGuitar repository until its version 0.11.0. Its history came along; an issue number such as `mateusrdp/oxiguitar#123` in an old commit message is in that repository.

## Credits

Built on [cpal](https://github.com/RustAudio/cpal) (Apache-2.0) and [pipewire-rs](https://gitlab.freedesktop.org/pipewire/pipewire-rs) (MIT), through OxiGuitar's shared `oxiguitar-audio-cpal` layer, and OxiGuitar's plugin SDK. Thanks to the RustAudio community and the PipeWire project. The manual's [Credits](https://mateusrdp.github.io/oxiguitar-pipewire/credits.html) page lists every project with its authors and licence. Thank you to all of them.

## Licence

GPL-3.0-or-later. See LICENSE. Contributions are welcome under the same terms; see [CONTRIBUTING.md](CONTRIBUTING.md).
