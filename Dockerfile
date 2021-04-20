# build from source code
FROM mozilla/sbt:latest
COPY . /app
WORKDIR /app
RUN sbt dist
RUN cd ./target/universal && \
    unzip playtest-1.0-SNAPSHOT.zip 

# keep the build version
FROM openjdk:jre-alpine
COPY --from=0 /app/target/universal/playtest-1.0-SNAPSHOT .
RUN apk add bash
EXPOSE 9000
CMD ["./bin/playtest"]
