#!/bin/bash

python3 aioquic/examples/http3_client.py --ca-certs aioquic/tests/pycacert.pem https://localhost:4433/ --quic-log ./qlogs/client