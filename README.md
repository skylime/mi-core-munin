# mi-core-munin

This repository is based on [Joyent mibe](https://github.com/joyent/mibe). Please note this repository should be build with the [mi-core-base](https://github.com/skylime/mi-core-base) mibe image.

## mdata variables

No mdata variable is required. Everything could be automatically generated on
provision state. We recommend a valid `nginx_ssl` certificate.

- `nginx_ssl`: ssl certificate for nginx web interface
- `nginx_auth`: htpasswd data to protect the web interface (newline seperated)
- `munin_admin`: admin password for munin admin interface

## services

- `80/tcp`: http webserver
- `443/tcp`: https webserver
