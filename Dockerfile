FROM ubuntu:latest

COPY aioquic /opt/aioquic


COPY scripts/k8sh3-client.sh scripts/k8sh3-server.sh /opt/scripts/


RUN apt-get update && apt-get install -y --no-install-recommends \
	python3 \
	libssl-dev \ 
	python3-dev \
	gcc \
	python3-pip \
	net-tools \
	screen \
	netcat \
	dnsutils \
	iproute2; \
	pip3 install --upgrade pip; \
	rm -rf /var/lib/apt/lists/*; \
	pip3 install aioquic; \
	pip3 install -e /opt/aioquic ;\
	pip3 install asgiref dnslib "flask<2.2" httpbin starlette "werkzeug<2.1" wsproto; \
	chmod +x /opt/scripts/k8sh3-server.sh; \
	chmod +x /opt/scripts/k8sh3-client.sh; 



	






