FROM ubuntu:latest

COPY aioquic /opt/aioquic

COPY http3-setup.sh /opt/scripts/setup.sh

RUN apt-get update && apt-get install -y --no-install-recommends \
	python3 \
	libssl-dev \ 
	python3-dev \
	gcc \
	python3-pip \
	net-tools \
	screen \
	iproute2; \
	pip3 install --upgrade pip; \
	rm -rf /var/lib/apt/lists/*; \
	pip3 install aioquic; \
	pip3 install -e /opt/aioquic ;\
	pip3 install asgiref dnslib "flask<2.2" httpbin starlette "werkzeug<2.1" wsproto; \
	chmod +x /opt/scripts/setup.sh



	






