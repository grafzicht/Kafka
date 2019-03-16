FROM openjdk:8-jre-slim

COPY ./kafka_2.11-2.1.0.tgz /kafka/zip.tgz
COPY ./launch.sh /launch.sh

WORKDIR /kafka/
RUN tar -xvzf zip.tgz
RUN rm zip.tgz
RUN mv ./kafka_2.11-2.1.0/* ./
RUN rmdir ./kafka_2.11-2.1.0
RUN chmod a+x ./bin/*
RUN chmod a+r ./bin/*

COPY ./server.properties /kafka/config/server.properties

ENV KAFKA_HEAP_OPTS="-Xmx256M -Xms128M"

CMD /bin/bash /launch.sh