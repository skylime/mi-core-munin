#!/bin/bash

SETTINGS_FILE="/opt/munin_master_admin/munin_master_admin/settings.py"
MUNIN_ADMIN=${MUNIN_ADMIN:-$(mdata-get munin_admin 2>/dev/null)} || \
MUNIN_ADMIN=$(od -An -N8 -x /dev/random | head -1 | tr -d ' ');
mdata-put munin_admin ${MUNIN_ADMIN}

# Create secret for django
echo "SECRET_KEY = \"$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-100})\"" >> ${SETTINGS_FILE}

# Change path to sqlite database (delegated dataset)
echo "DATABASES = {'default': {'ENGINE': 'django.db.backends.sqlite3','NAME': '/var/munin_master_admin_db/db.sqlite3',}}" >> ${SETTINGS_FILE}

# Because we run the app on a subdirectory
echo "LOGIN_REDIRECT_URL = '/admin'" >> ${SETTINGS_FILE}
echo "LOGIN_URL  = '/admin/accounts/login/'"  >> ${SETTINGS_FILE}
echo "LOGOUT_URL = '/admin/accounts/logout/'" >> ${SETTINGS_FILE}

# Init django data and create admin user
(sudo -u www /opt/munin_master_admin/manage.py syncdb --noinput)

# Create superadmin user
echo "from django.contrib.auth.models import User; User.objects.create_superuser('admin', 'admin@example.com', '${MUNIN_ADMIN}')" \
	| /opt/munin_master_admin/manage.py shell

## Create cronjobs for munin_master_admin write_munin_config.py
CRON="4,9,14,19,24,29,34,39,44,49,54,59 * * * * (/opt/munin_master_admin/manage.py write_munin_config)"
(crontab -l 2>/dev/null || true; echo "$CRON" ) | sort | uniq | crontab
