# mailcow: dockerized - 🐮 + 🐋 = 💕

[![Donate to the original author (not me)](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=JWBSYHF4SMC68)

Please see the official documentation for instructions => [mailcow.email/dockerized](https://mailcow.email/dockerized)

# warnings

this fork includes some personal changes, including SSL ciphers in nginx to allow DAVDroid to work, etc. one of the changes is a bad script to automate the retrieval of let-encrypt free SSL certificates. this should be moved to another container to make the whole thing self-contained (aha).

another thing missing is a backup script. this should exist within another container as well, connect to the various volumes and mariadb containers as needed, and push backups to a remote location that can be used for retrieval later. ideally there should also be a singular command to fetch backups from that location and immediately start docker-compose up -d from there. this would enable an instance to, for example, use very simple userdata scripts to restore from backup for disaster recovery.
