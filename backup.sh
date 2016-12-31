#!/usr/bin/env bash

installdir="$pwd"

pushd /
  tar cvzf /tmp/mailcow-dockerized-backup_$(date +%s).tar.gz "$pwd/* /var/lib/docker/volumes/mailcow*"
popd
