# Architecture and strategy

The plugin gives OxiGuitar a list of devices and an audio stream. It is built on the `cpal` audio library, through a small layer that the other output plugins share, and it uses the PipeWire host of that library.

The strategy is one output plugin for each system's own sound API, so each can be installed, updated and left out on its own. OxiGuitar picks among the installed outputs.

## Current limitations

- **Needs glibc 2.39 or newer** (Debian 13, Ubuntu 24.04, Fedora 40 and later), because PipeWire's headers don't build on older systems. The AppImage plays through ALSA instead.
- **No JACK-style routing from OxiGuitar.** It plays to a device; patching it elsewhere is done with PipeWire's own tools.
- **Your system's sound must already work.** The plugin doesn't repair or configure PipeWire.

## Left out on purpose

- **A sound library of our own.** [cpal](https://github.com/RustAudio/cpal), the Rust audio library, already speaks every system's sound API. All four output plugins share a thin layer over it in OxiGuitar's repository.
- **One plugin for every system.** Each system's output is a plugin of its own, so each is built, tested, updated and left out on its own, and a Linux install carries no Windows code.
- **Recording.** The output plugins only play. OxiGuitar has no audio input.

## Where you can help

- **Testing on real hardware**, especially unusual sound cards, USB interfaces and Bluetooth headphones. Tell us what worked and what clicked.
- **Lower latency** settings, if you know PipeWire well.

Every change needs its tests and a row on the [Features](features.md) page; the [Testing](testing.md) page says how to run them.
