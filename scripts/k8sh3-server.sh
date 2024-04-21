#!/bin/bash

python3 /opt/aioquic/examples/http3_server.py --certificate /opt/aioquic/tests/ssl_cert.pem --private-key /opt/aioquic/tests/ssl_key.pem --secrets-log /opt/tls-handshake-secrets/local-ssl-keylog-secrets.log --quic-log /opt/qlogs/server/