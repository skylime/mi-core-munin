#!/bin/bash
## Create cronjobs for munin-master
CRON="0,5,10,15,20,25,30,35,40,45,50,55 * * * * (sudo -u munin /opt/local/bin/munin-cron)"
(crontab -l 2>/dev/null || true; echo "$CRON" ) | sort | uniq | crontab

## Create localhost config for munin
HOSTNAME=$(hostname)
echo -e "[${HOSTNAME}]\n    address 127.0.0.1\n    use_node_name yes\n" > /opt/local/etc/munin/munin-conf.d/localhost.conf

## Add logadm to rotate munin-master logfiles by default
logadm -r '/var/log/munin/munin-node.log'
logadm -w '/var/log/munin/*.log' -A 14d -p 1d -c -N -m 640

## Enable FCGI for munin-graph and munin-html
svcadm enable svc:/network/spawn-fcgi:munin-graph
svcadm enable svc:/network/spawn-fcgi:munin-html
