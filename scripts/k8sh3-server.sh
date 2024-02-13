#!/bin/bash

python3 /opt/aioquic/examples/http3_client.py --ca-certs /opt/aioquic/tests/pycacert.pem https://http3-server:4433/ -k