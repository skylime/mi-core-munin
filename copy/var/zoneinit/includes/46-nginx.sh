#!/bin/bash
# Configure htaccess users from mdata variable
if mdata-get nginx_auth > /dev/null 2>&1; then
    for auth in $(mdata-get nginx_auth 2> /dev/null); do
        echo ${auth} > /opt/local/etc/nginx/auth.htpasswd
    done
    gsed -i 's|#include auth.conf|include auth.conf|g' \
        /opt/local/etc/nginx/nginx.conf
fi
# Create secret for HTTP IRC Notification API
IRC_SECRET_TOKEN=$(/opt/core/bin/mdata-create-password.sh -m irc_secret_token)
gsed -i "s|_IRC_SECRET_TOKEN_|${IRC_SECRET_TOKEN}|g" \
    /opt/local/etc/nginx/nginx.conf

# Enable nginx
svcadm enable svc:/pkgsrc/nginx:default

# Configure SSL
/opt/core/bin/ssl-generator.sh /opt/local/etc/nginx/ssl nginx_ssl nginx svc:/pkgsrc/nginx:default

# Restart nginx to support new SSL certificate
svcadm restart svc:/pkgsrc/nginx:default
