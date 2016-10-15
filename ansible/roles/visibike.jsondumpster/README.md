Visibike JSONdumpster deployer
=====================================

Deploys the jsondumpster service using nginx, postgresql and gunicorn.
Certificates are set up with Let's Encrypt.

Requirements
------------

Ubuntu Xenial server.


Role Variables
--------------

These secrets are good to store in a vault outside of the repo

- vault_jsondumpster_secret_key: Django secret key
- vault_jsondumpster_psql_password: password for postgres
- vault_jsondumpster_hostname: Domain for the service
- vault_jsondumpster_email: Email that is reported to letsencrypt

License
-------

MIT

Author Information
------------------

Martin Yrjölä <https://bitbucket.org/myrjola/>
