FROM alpine:20191219
RUN apk update
RUN apk fetch openjdk8
RUN apk add openjdk8
RUN apk add --update --no-cache sshpass
ENV JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk
ENV PATH="$JAVA_HOME/bin:${PATH}"
RUN java -version
RUN apk add --no-cache bash
