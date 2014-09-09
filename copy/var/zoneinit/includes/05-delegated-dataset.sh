#!/bin/bash
UUID=$(mdata-get sdc:uuid)
DDS=zones/${UUID}/data

if zfs list ${DDS} 1>/dev/null 2>&1; then
	zfs create ${DDS}/munin   || true
	zfs set mountpoint=/var/munin ${DDS}/munin
	chown -R munin:munin /var/munin || true
fi
