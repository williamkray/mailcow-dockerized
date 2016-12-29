#!/usr/bin/env bash
set -e

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin

MAILCOW_HOSTNAME=$(hostname -f)

pushd /root/mailcow-dockerized/

	out="$(certbot renew)"

	if [[ "$out" == *"No renewals were attempted"* ]]; then

		echo "not today my good man."
		exit 0
	else

		mv data/assets/ssl/cert.{pem,pem.backup}
		mv data/assets/ssl/key.{pem,pem.backup}

		ln $(readlink -f /etc/letsencrypt/live/${MAILCOW_HOSTNAME}/fullchain.pem) data/assets/ssl/cert.pem
		ln $(readlink -f /etc/letsencrypt/live/${MAILCOW_HOSTNAME}/privkey.pem) data/assets/ssl/key.pem

		docker-compose restart {nginx,postfix,dovecot}-mailcow

	fi

popd
