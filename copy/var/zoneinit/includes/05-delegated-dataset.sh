#!/bin/bash
UUID=$(mdata-get sdc:uuid)
DDS=zones/${UUID}/data

if zfs list ${DDS} 1>/dev/null 2>&1; then
	zfs create ${DDS}/munin   || true
	zfs create ${DDS}/munin-conf.d || true
	zfs create ${DDS}/munin_master_admin_db || true
	zfs set mountpoint=/var/munin ${DDS}/munin
	zfs set mountpoint=/opt/local/etc/munin/munin-conf.d ${DDS}/munin-conf.d
	zfs set mountpoint=/var/munin_master_admin_db ${DDS}/munin_master_admin_db
else
	mkdir -p /var/munin || true
	mkdir -p /opt/local/etc/munin/munin-conf.d || true
	mkdir -p /var/munin_master_admin_db || true
fi

# Setup permissions for default database folders and munin
mkdir -p /var/munin/run
chown -R munin:munin /var/munin || true
chown -R www:www /var/munin_master_admin_db || true
