sudo tcpdump -i lo udp port 4433 -X -w Desktop/Dissertation_repos/Dissertation-Files/test.pcap -vv

sudo tcpdump -i lo udp port 4433 -X -w /opt/test.pcap -vv

netcat:

echo "test" | nc -4u -w0 http3-server 4433


nc -lu4 4444



### AIOQuic testing

1. start the server with `./scripts/h3-client.sh` and `./scripts/h3-server.sh`

2. Run `sudo tcpdump -i lo udp port 4433 -X -w Desktop/Dissertation_repos/Dissertation-Files/test.pcap -vv`

3. Start wireshark and decrypt packet `wireshark -otls.keylog_file:"pcap-tests/local_test/local-ssl-keylog-secrets.log" -r "pcap-tests/local_test/local_test.pcap" -Y udp -dudp.port==4433,quic -Y quic`



### Qlog - Qvis

1. Enable debugging in output by prepending `PCAPDEBUG=true node out/main.js`

2. Run the following in the pcap2qlog folder - `PCAPDEBUG=true node out/main.js --input=../Dissertation-Files/pcap-tests/local_test/local_test.pcap --secret=../Dissertation-Files/pcap-tests/local_test/local-ssl-keylog-secrets.log --output=local.qlog`


issue here states: https://github.com/quiclog/pcap2qlog/issues/11

that there is something wrong with either the json output of tshark, or the json parser in the pcap2qlog tool.


3. Instead we try decrypt with tshark first, then pass to qvis 
`shark --no-duplicate-keys -r ../Dissertation-Files/pcap-tests/local_test/local_test.pcap -T json -o tls.keylog_file:../Dissertation-Files/pcap-tests/local_test/local-ssl-keylog-secrets.log > output.json`

4. `PCAPDEBUG=true node out/main.js --input=../Dissertation-Files/pcap-tests/local_test/decrypted_local.pcap --output=local.qlog`




#### Problems with it


1. It seems the tshark json formatting is different to what the pcap2qlog expects "https://github.com/quiclog/pcap2qlog/issues"