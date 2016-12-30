#!/bin/bash
set -e

# file to monitor age of
file="/etc/ssl/mail/cert.pem"
process=$1

filemon(){
  while true; do
    age=$(stat -c %Y "$file")
    echo $age
    if [[ $age -ge $(( $(date +%s) - 10)) ]]; then
      kill $(pidof "$process")
    fi
    sleep 5
  done
}

echo "starting bg proc"
filemon > /dev/null 2>&1 &
echo "starting $@"
exec "$@"
