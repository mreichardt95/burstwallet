FROM ubuntu:latest



ADD ["https://github.com/PoC-Consortium/burstcoin/releases/download/2.0.0/burstcoin-2.0.0.zip", "/tmp"]


RUN \
	apt-get update && \
	apt-get install -y \
		zip default-jre chrony && \
	mkdir -p /burst/burst_db && \
	mv /tmp/burstcoin-2.0.0.zip /burst/ && \
	unzip /burst/burstcoin-2.0.0.zip -d /burst/ && \
	rm /burst/burstcoin-2.0.0.zip && \
	mv /burst/burstcoin-2.0.0/* /burst/. && \
	chmod +x /burst/burst.sh

WORKDIR /burst
EXPOSE 8123/tcp 8125/tcp
VOLUME /burst/burst_db /burst/conf/

CMD /burst/burst.sh
