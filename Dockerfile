FROM blitznote/debase:16.04

RUN apt-get update && apt-get install -y git libboost-all-dev build-essential libgmp-dev zlib1g-dev libbz2-dev libmysql++-dev

RUN git clone https://github.com/lytedev/ghostpp /opt/ghostpp && \
	cd /opt/ghostpp && \
	cd bncsutil/src/bncsutil/ && \
	make && make install && \
	cd ../../../StormLib/stormlib/ && \
	make && make install && \
	cd ../../ghost && \
	make

RUN mkdir -p /opt/ghostpp

WORKDIR /opt/ghostpp
ENTRYPOINT /opt/ghostpp/ghost/ghost++
CMD ["/opt/ghostpp/ghost.cfg"]
