FROM maven:3.5-jdk-8

RUN apt-get update && apt-get install -y netcat

WORKDIR /iri

RUN git clone -b v1.2.2 https://github.com/iotaledger/iri.git /iri/
RUN mvn clean package

COPY conf /iri/conf
COPY /bootstrap.sh /

WORKDIR /iri/data

VOLUME /iri/data

EXPOSE 14265
EXPOSE 14777/udp
EXPOSE 15777

ENTRYPOINT ["/bootstrap.sh"]
