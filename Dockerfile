FROM alpine:20191219
RUN apk update
RUN apk fetch openjdk8
RUN apk add openjdk8
RUN apk add --update --no-cache openssh sshpass
ENV JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk
ENV PATH="$JAVA_HOME/bin:${PATH}"
RUN java -version
RUN apk add --no-cache bash
RUN apk add curl
ENV USER=docker
ENV UID=1004
ENV GID=23456
RUN addgroup --gid "$GID" "$USER" \
    && adduser \
    --disabled-password \
    --gecos "" \
    --home "$(pwd)" \
    --ingroup "$USER" \
    --no-create-home \
    --uid "$UID" \
    "$USER"
