FROM ubuntu:latest



ADD ["https://github.com/burst-team/burstcoin/releases/download/1.2.9/burstcoin-1.2.9.zip", "/tmp"]


RUN \
	apt-get update && \
	apt-get install -y \
		zip default-jre && \
	mkdir -p /burst/burst_db && \
	mv /tmp/burstcoin-1.2.9.zip /burst/ && \
	unzip /burst/burstcoin-1.2.9.zip -d /burst/ && \
	rm /burst/burstcoin-1.2.9.zip && \
	ls /burst && \
	chmod +x /burst/run.sh

ADD nxt.properties /burst/conf/


WORKDIR /burst
EXPOSE 8123/tcp 8125/tcp
VOLUME /burst/burst_db

CMD /burst/run.sh