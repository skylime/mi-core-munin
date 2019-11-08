#!/bin/bash
# Configure htaccess users from mdata variable
if mdata-get nginx_auth >/dev/null 2>&1; then
	for auth in $(mdata-get nginx_auth 2>/dev/null); do
		echo ${auth} > /opt/local/etc/nginx/auth.htpasswd
	done
	gsed -i 's|#include auth.conf|include auth.conf|g' \
		/opt/local/etc/nginx/nginx.conf
fi


# Enable nginx
svcadm enable svc:/pkgsrc/nginx:default

# Configure SSL
/opt/core/bin/ssl-generator.sh /opt/local/etc/nginx/ssl nginx_ssl nginx svc:/pkgsrc/nginx:default

# Restart nginx to support new SSL certificate
svcadm restart svc:/pkgsrc/nginx:default
