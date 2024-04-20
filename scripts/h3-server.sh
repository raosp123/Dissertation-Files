#!/bin/bash

python3 aioquic/examples/http3_server.py --certificate aioquic/tests/ssl_cert.pem --private-key aioquic/tests/ssl_key.pem --secrets-log tls-handshake-secrets/local-ssl-keylog-secrets.log --quic-log ./qlogs/server/