#!/bin/bash

python3 aioquic/examples/http3_client.py --ca-certs aioquic/tests/pycacert.pem https://localhost:4433/ --quic-log ./qlogs/client -k


#Cloud: python3 aioquic/examples/http3_client.py --ca-certs aioquic/tests/pycacert.pem https://34.89.71.52/:4433/ --quic-log ./qlogs/client --secrets-log tls-handshake-secrets/local-ssl-keylog-secrets.log -k