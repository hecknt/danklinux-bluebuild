#!/usr/bin/env bash

set -oue pipefail

# install terra repos
dnf5 -y install --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release{,-extras}

# disable all except terra-mesa
dnf5 -y config-manager setopt "*terra*".enabled=false
dnf5 -y config-manager setopt "terra-mesa".enabled=true

# replace system mesa drivers with terra mesa drivers
dnf5 -y swap --repo=terra-mesa mesa-filesystem mesa-filesystem
