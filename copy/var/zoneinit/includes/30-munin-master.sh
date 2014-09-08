#!/bin/bash
##Create cronjobs for munin-master
CRON="0,5,10,15,20,25,30,35,40,45,50,55 * * * * (sudo -u munin /opt/local/bin/munin-cron)"
(crontab -l 2>/dev/null || true; echo "$CRON" ) | sort | uniq | crontab
