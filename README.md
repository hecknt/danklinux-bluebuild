# Hec's personal Dank Linux Fedora Atomic builds

These are my personal (and currently very experimental) Universal Blue image builds, customized with my own personal additions to make my life easier. They are built with AvengeMedia's [Dank Linux](https://danklinux.com) and any dependencies. There are several images with different experiences in mind.

## Desktop Images

Currently, all desktop images are built off of Fedora 43. There is a basic default configuration for Niri, Hyprland, Ghostty, and Kitty that all new users will have automatically copied to their home directory.

- `danklinux` - An image built off of `ublue/base-main` with both Niri and Hyprland installed, along with [DankMaterialShell](https://github.com/AvengeMedia/DankMaterialShell/) and various other utilities, such as [Dolphin](https://apps.kde.org/dolphin/) to make the desktop feel more complete.
- `danklinux-dx` - Same as `danklinux`, but with a set of packages added to assist with virtual machines and development.
- `danklinux-steam` - Same as `danklinux`, but with Steam and other gaming packages installed.
- `danklinux-steam-dx` - Same as `danklinux-steam` and `danklinux-dx` combined.
- `danklinux-nvidia` - Same as `danklinux`, but built off of `ublue/base-nvidia` to give driver support for NVIDIA graphics cards.
- `danklinux-nvidia-dx` - Same as `danklinux-nvidia`, but with a set of packages added to assist with virtual machines and development.
- `danklinux-nvidia-steam` - Same as `danklinux-steam`, but with Steam and other gaming packages installed.
- `danklinux-nvidia-steam-dx` - Same as `danklinux-nvidia-steam` and `danklinux-nvidia-dx` combined.
- `danklinux-kernel-cachyos` - Same as `danklinux`, but built with the kernel used in [CachyOS](https://cachyos.org) installed instead of the default Fedora kernel. Also includes Steam and other gaming packages.
- `danklinux-kernel-cachyos-dx` - Same as `danklinux-kernel-cachos`, but with a set of packages added to assist with virtual machines and development.

## Installation

Install a base build of any Fedora Atomic or Universal Blue image (eg. Sericea, Kinoite, Aurora) and then switch to an image like so:

```
sudo bootc switch --enforce-container-sigpolicy ghcr.io/hecknt/danklinux-kernel-cachyos:latest
```

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/hecknt/danklinux
```
