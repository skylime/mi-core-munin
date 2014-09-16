#!/bin/bash

SETTINGS_FILE="/opt/munin_master_admin/munin_master_admin/settings.py"

/opt/local/bin/python -c "from django.utils.crypto import get_random_string;print 'SECRET_KEY = r\"' + get_random_string(50, 'abcdefghijklmnopqrstuvwxyz0123456789\!@#$%^&*(-_=+)') + '\"'" >> ${SETTINGS_FILE}

# Change path to sqlite database (delegated dataset)
echo "DATABASES = {'default': {'ENGINE': 'django.db.backends.sqlite3','NAME': '/var/munin_master_admin_db/db.sqlite3',}}" >> ${SETTINGS_FILE}

# Init django data and create admin user
/opt/munin_master_admin/manage.py syncdb --noinput
