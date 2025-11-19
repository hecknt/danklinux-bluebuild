#!/usr/bin/env bash
set -ouex pipefail

# Add Flathub repos to image
mkdir -p /etc/flatpak/remotes.d
curl --retry 3 -Lo /etc/flatpak/remotes.d/flathub.flatpakrepo https://dl.flathub.org/repo/flathub.flatpakrepo

# Fedora flatpaks can go die. Please.
rm -rf /usr/lib/systemd/system/flatpak-add-fedora-repos.service
systemctl enable flatpak-add-flathub-repos.service
