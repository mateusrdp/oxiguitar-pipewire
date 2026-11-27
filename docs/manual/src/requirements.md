# Requirements and assumptions

## Requirements

- OxiGuitar 0.23 or later, which reads plugin files as archives (the plugin asks for interface 1.3). See [the OxiGuitar manual](https://mateusrdp.github.io/oxiguitar/).
- Linux, on x86_64 or ARM64, with `libpipewire-0.3`, which every PipeWire desktop has.
- glibc 2.39 or newer, since the plugin is built on Ubuntu 24.04. PipeWire's headers don't build on Ubuntu 22.04. The AppImage, which is built on 22.04, plays through ALSA instead.

## Assumptions

- Your system's sound is working already. This plugin doesn't repair it.
- PipeWire is what your desktop uses. If it isn't, use the ALSA plugin.
