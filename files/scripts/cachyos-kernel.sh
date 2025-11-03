#!/usr/bin/env bash

set -ouex pipefail

# Remove Fedora kernel & remove leftover files
dnf -y remove kernel* && rm -r -f /usr/lib/modules/*

# Install CachyOS kernel & akmods
dnf -y install --setopt=install_weak_deps=False \
  kernel-cachyos \
  akmods || true # Use '|| true' to bypass the dracut error at the end. We rebuild the initramfs after this script anyways.

dnf -y install --setopt=install_weak_deps=False \
  kernel-cachyos-devel \
  kernel-cachyos-devel-matched

# Make sure that the kernel packages are listed as installed. If this command fails, then the script will exit with an error. 
dnf list --installed kernel-cachyos kernel-cachyos-core kernel-cachyos-devel kernel-cachyos-devel-matched kernel-cachyos-modules

# Install SCX stuff
dnf -y install --setopt=install_weak_deps=False \
  scx-scheds \
  scx-manager

# Install cachyos-settings over zram-generator-defaults
dnf -y swap zram-generator-defaults cachyos-settings

# Disable repos    
dnf -y copr disable bieszczaders/kernel-cachyos
dnf -y copr disable bieszczaders/kernel-cachyos-addons

# Cleanup
dnf clean all
