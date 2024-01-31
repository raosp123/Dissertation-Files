sudo tcpdump -i lo udp port 4433 -X -w Desktop/Dissertation_repos/Dissertation-Files/test.pcap -vv



netcat:

echo "test" | nc -4u -w0 http3-server 4433


nc -lu4 4444