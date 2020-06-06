#!/bin/bash
mkdir -p /usr/share/man/man1
cd "/project/"
./scripts/install-tools.sh
./scripts/init.sh
./scripts/create-installer.sh $version -e
