#!/bin/bash


HOST_ID="default"

set -euo pipefail

while test $# -gt 0; do
	case "$1" in
	--server*)
		HOST_ID="server"
		shift
		;;
	
	--client*)
		HOST_ID="client"
		shift
		;;
		
	*)
		break
		;;
	esac
done	


if [[ "$HOST_ID" != "0" ]]; then

        if [[ "$HOST_ID" = "server" ]]; then
            echo "launching http3-tools in $HOST_ID mode"
            /usr/bin/screen -LdmS python3 /opt/aioquic/examples/http3_server.py --certificate /opt/aioquic/tests/ssl_cert.pem --private-key /opt/aioquic/tests/ssl_key.pem --secrets-log /opt/tls-handshake-secrets/local-ssl-keylog-secrets.log --quic-log /opt/qlogs/server/
        elif [[ "$HOST_ID" = "client" ]]; then
            echo "launching http3-tools in $HOST_ID mode"
            /usr/bin/screen -LdmS python3 /opt/aioquic/examples/http3_client.py --ca-certs /opt/aioquic/tests/pycacert.pem https://http3-server:4433/ --quic-log /opt/qlogs/client/ -k
        fi

		while true ; do
			sleep 600
			echo -e "Currently running server at $(date) is: \n\n$(ps -ef | grep "[p]ython" | awk '{print $8, $9}')"
   		done
		
    else
        echo "No host type specified, use flags --server or --client"
fi