# Credits

Thank you to the people whose work this plugin is built on.

## Code we use

| Project | Authors | What it does here | Licence |
| --- | --- | --- | --- |
| [OxiGuitar's plugin SDK](https://github.com/mateusrdp/oxiguitar) (`oxiguitar-plugin`, and `oxiguitar-plugin-test` for the tests) | Mateus Rocha de Paula and the OxiGuitar contributors | The plugin interface | MIT OR Apache-2.0 |
| [oxiguitar-audio-cpal](https://github.com/mateusrdp/oxiguitar-audio-cpal) | Mateus Rocha de Paula and the OxiGuitar contributors | The layer all four output plugins share | GPL-3.0-or-later |
| [cpal](https://github.com/RustAudio/cpal) | The RustAudio contributors | Devices and the audio stream, on every system | Apache-2.0 |
| [pipewire-rs](https://gitlab.freedesktop.org/pipewire/pipewire-rs) | The PipeWire contributors | Talks to PipeWire (`pipewire`, `libspa`) | MIT |
| [Rust](https://www.rust-lang.org/) and its standard library | The Rust Project | Everything else | MIT OR Apache-2.0 |

## The system

[PipeWire](https://pipewire.org/), by Wim Taymans and the PipeWire contributors: the sound server itself, on your computer. The plugin only calls it.

## Tools

| Tool | Use |
| --- | --- |
| [mdBook](https://github.com/rust-lang/mdBook) | Builds this manual |
| [cargo-deny](https://github.com/EmbarkStudios/cargo-deny) | Checks the licences of everything we build with |

## Thanks

To the RustAudio community for cpal, which turns four very different sound systems into one, and to the people behind PipeWire.
