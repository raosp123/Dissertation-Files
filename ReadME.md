Setup Commands:

```
pip install -e .
pip install asgiref dnslib "flask<2.2" httpbin starlette "werkzeug<2.1" wsproto

```



Testing Commands:

Server 
	`python examples/http3_server.py --certificate tests/ssl_cert.pem --private-key tests/ssl_key.pem --secrets-log ssl-keylog-secrets.log`

Client
	`python examples/http3_client.py --ca-certs tests/pycacert.pem https://localhost:4433/`


`--secrets-log ssl-keylog-secrets.log` - lets you output the secrets log file for the ssl certificate, used for wireshark decryption


The secrets log file for the client and server is the same:

SERVER_HANDSHAKE_TRAFFIC_SECRET 6e08b9a60e114c22abd52d2ea695f6d90c47e063c9a1ee7b3fe5d861663a15bf eb33ff072e6eeab6c74a27aba37ba1d27e8a37dfaa84058814a229b77953b2b5a9b0069e2a44b61cc6880eb75b63ea77
CLIENT_HANDSHAKE_TRAFFIC_SECRET 6e08b9a60e114c22abd52d2ea695f6d90c47e063c9a1ee7b3fe5d861663a15bf e987ad0cd665bb44ab9a84dcd066ad3db3c37dd1003362f5d09ecb23e21dda292e2e3c11e10721aabae4e8ca807c3c29
SERVER_TRAFFIC_SECRET_0 6e08b9a60e114c22abd52d2ea695f6d90c47e063c9a1ee7b3fe5d861663a15bf f4be0af828a45dc671be15c8482de37ecd43eba199494b3bc96299ea1b62658e0b5f0064e941cde921c65100f2368c12
CLIENT_TRAFFIC_SECRET_0 6e08b9a60e114c22abd52d2ea695f6d90c47e063c9a1ee7b3fe5d861663a15bf feb16e0174ba8147f0b0f0d4668725ab491ebcf6888bcfa010843b97ccc203e4b7f1ef14590981dace78168b889d765a


Wireshark TLS decryption setup:

