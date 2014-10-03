# Changelog

## 14.2.1

### New

* version update to 14.2.1. [Thomas Merkel]
* create extra admin user and add readme file. [Thomas Merkel]

    - user called admin and mdata is munin_admin
    - readme file which some base details

* create extra user for django / nagiosadmin login. [Thomas Merkel]
* create ssl folder for nginx. [Thomas Merkel]
* add ssl certificate generation script alternative use mdata. [Thomas Merkel]
* only support ssl content for security reason. [Thomas Merkel]

### Other

* fixed error: now running syncdb as www user (was root before) [glatze]
* moved to munstrap ver 0.2, changed repo to motu81, added cronjob for erite_munin_config.py. [glatze]
* fixed port to 9000. [glatze]
* fixed errors, moved to v0.2. [glatze]
* fixed typo# [glatze]
* fixed error: now using hostname instead of mdata-get because mdata-get fails if no hostname is set in mdata. [glatze]
* fixed zoneinit errors, removed munin-conf.d. [glatze]
* integrated munin_master_admin (django) into core-monitor. [glatze]
* nginx listens now v6 port 80 too. [glatze]
* fixed munin-node errors /var/munin/run folder was missing. [glatze]
* changed base image uuid (errors with munin-node) [glatze]
* fixed user priv errors for /var/munin. [glatze]
* fixed errors. [glatze]
* fixed errors. [glatze]
* enable nginx. [glatze]
* fixed errors in customize. [glatze]
* added munstrap download from github repo and acivation to customize. [glatze]
* added nginx.conf, munin.conf and munstrap template. [glatze]
* addded make munin cron and delegated dataset shellscripts. [glatze]
* fixex erros in packages. [glatze]
* add customize script. [Thomas Merkel]
* add required pkgs. [Thomas Merkel]
* add license, manifest and motd. [Thomas Merkel]

