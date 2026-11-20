# Installing

You need OxiGuitar first: [its manual](https://mateusrdp.github.io/oxiguitar/) says how to get it. This page is about the PipeWire audio output plugin.

## From a release

Each release on the [releases page](https://github.com/mateusrdp/oxiguitar-pipewire/releases) has a zip for each Linux processor (x86_64 and ARM64), a `.deb`, an `.rpm` and a Flatpak for each, and a `SHA256SUMS` file to check the downloads against. Take the file that matches your system.

## Copying the file yourself

A plugin is a single file ending in `.oxp`. Unzip the release for your system and put `audio-pipewire.oxp` in your plugins folder:

| System | Your plugins folder |
| --- | --- |
| Linux | `~/.local/share/oxiguitar/plugins/` |

Start OxiGuitar again. **Tools → Plugins…** lists what it found. The same menu switches a plugin off, and deleting the file removes it.

## Linux package managers

The package is called `oxiguitar-pipewire`. It lives in a signed package repository on GitHub Pages that you add once.

Debian, Ubuntu and relatives:

```sh
sudo install -d -m 0755 /etc/apt/keyrings
sudo curl -fsSL https://mateusrdp.github.io/oxiguitar-packages/oxiguitar.gpg -o /etc/apt/keyrings/oxiguitar.gpg
sudo curl -fsSL https://mateusrdp.github.io/oxiguitar-packages/oxiguitar.sources -o /etc/apt/sources.list.d/oxiguitar.sources
sudo apt update
sudo apt install oxiguitar-pipewire
```

Fedora and relatives:

```sh
sudo curl -fsSL https://mateusrdp.github.io/oxiguitar-packages/oxiguitar.repo -o /etc/yum.repos.d/oxiguitar.repo
sudo dnf install oxiguitar-pipewire
```

Normal system updates keep the plugin current from then on.

OxiGuitar's Flatpak is a sandbox that cannot see the system's plugin folders, so it needs the plugin as a Flatpak extension. Flathub comes first because Flatpak takes its runtime from there:

```sh
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --if-not-exists oxiguitar https://mateusrdp.github.io/oxiguitar-packages/flatpak/oxiguitar.flatpakrepo
flatpak install oxiguitar io.github.mateusrdp.OxiGuitar.Plugin.pipewire
```

`flatpak update` keeps it current and `flatpak remove` takes it away.
