# To be sure we've SSL enabled by default we will create a self-signed
# certificate as fallback. This will allow us to enable nginx or any
# webserver.

# Self-signed certificate generator
/opt/core/bin/ssl-selfsigned.sh -d /opt/local/etc/nginx/ssl/ -f nginx
