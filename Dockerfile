FROM ubuntu:latest



ADD ["https://github.com/PoC-Consortium/burstcoin/releases/download/1.3.6cg/burstcoin-1.3.6cg.zip", "/tmp"]


RUN \
	apt-get update && \
	apt-get install -y \
		zip default-jre && \
	mkdir -p /burst/burst_db && \
	mv /tmp/burstcoin-1.3.6cg.zip /burst/ && \
	unzip /burst/burstcoin-1.3.6cg.zip -d /burst/ && \
	rm /burst/burstcoin-1.3.6cg.zip && \
	ls /burst && \
	chmod +x /burst/burst.sh

ADD nxt.properties /burst/conf/


WORKDIR /burst
EXPOSE 8123/tcp 8125/tcp
VOLUME /burst/burst_db /burst/conf/

CMD /burst/burst.sh
