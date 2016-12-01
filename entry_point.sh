#!/bin/sh
set -e

# Check if required environment variable
if [ -z "${TOR_SITE}" ]; then
	echo "TOR_SITE envrionment variable is not set"
	exit 1
fi

if [ -z "${TOR_SITE_PORT}" ]; then
	echo "TOR_SITE_PORT envrionment variable is not set"
	exit 1
fi

# Start tor daemon - Configuration is in /etc/tor/torrc and is set to daemonize TOR
tor

if [ $? -ne 0 ]; then
	echo "tor did not start properly - Exiting"
	exit $?
fi
# Start socat
socat TCP-L:5000,fork,reuseaddr SOCKS4A:127.0.0.1:${TOR_SITE}:${TOR_SITE_PORT},socksport=9050