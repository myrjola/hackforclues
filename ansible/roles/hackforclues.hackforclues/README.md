HackForClues deployer
=====================================

Deploys the hackforclues service using nginx, postgresql and gunicorn.
Certificates are set up with Let's Encrypt.

Requirements
------------

Ubuntu Xenial server.


Role Variables
--------------

These secrets are good to store in a vault outside of the repo

- vault_hackforclues_secret_key: Django secret key
- vault_hackforclues_psql_password: password for postgres
- vault_hackforclues_hostname: Domain for the service
- vault_hackforclues_email: Email that is reported to letsencrypt

License
-------

MIT

Author Information
------------------

Martin Yrjölä <https://github.com/myrjola>
