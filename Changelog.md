# Changelog

## %%version%% (unreleased)

### New

* Enable nginx config for cgi wrapper. [Thomas Merkel]
* Provide new manifest.json file. [Thomas Merkel]
* Provide new spawn-fcgi feature for munin-graph. [Thomas Merkel]

  To support the munin zoom function provide a new fcgi wrapper.

### Fix

* Switch to `hostname` command to support also zones without an hostname but UUID. [Thomas Merkel]
* Fix problem if you don&#x27;t use a delegate dataset for Munin. [Thomas Merkel]

  This fix the problem in issue #1

### Other

* Fix FCGI service start and nginx socket path. [Thomas Merkel]
* Remove unused gunicorn.xml import from the configure script and fix issue for gtar and tar. [Thomas Merkel]
* Switch to new core-base image version and rename to mi-core-munin. [Thomas Merkel]

  This image provides only munin so we should rename it to &quot;mi-core-munin&quot;. Switching to the newest mi-core-base image and copy the gunicorn.xml to the autoinclude and start folder.

## 14.2.2

### New

* version update. [Thomas Merkel]

### Fix

* typo in manifest file. [Thomas Merkel]
* add login logout url as variable. [Thomas Merkel]

### Other

* version update of munin_master interface. [Thomas Merkel]
* Also support the pull request (latest version of munin_master_admin) [Thomas Merkel]

    So be sure the proxy header script name is set correctly

* To support the pull request which supports authentication we need to modify the LOGIN_REDIRECT_URL. [Thomas Merkel]

    https://github.com/motu81/munin_master_admin/pull/2

* Merge remote-tracking branch 'motu81/master' [Thomas Merkel]

## 14.2.1 (2014-10-03)

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

