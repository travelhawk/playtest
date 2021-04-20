FROM mozilla/sbt:latest

COPY . /app

WORKDIR /app

RUN sbt dist

RUN cd ./target/universal && \
    unzip playtest-1.0-SNAPSHOT.zip && \
RUN ./playtest-1.0-SNAPSHOT/bin/playtest