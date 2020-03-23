FROM jeanblanchard/alpine-glibc:latest

ENV SNELL_VERSION="1.1.0"
ENV SNELL_URI="https://github.com/surge-networks/snell/releases/download/2.0.0b7/snell-server-v2.0.0-b7-linux-amd64.zip"
ENV TZ=Asia/Shanghai

WORKDIR /tmp

COPY start.sh /start.sh
RUN apk add --update libstdc++ && rm -rf /var/cache/apk/* && \
    # wget https://github.com/surge-networks/snell/releases/download/v${SNELL_VERSION}/snell-server-v${SNELL_VERSION}-linux-amd64.zip && \
    # unzip snell-server-v${SNELL_VERSION}-linux-amd64.zip && \
    wget ${SNELL_URI} && \
    unzip snell-server-v2.0.0-b7-linux-amd64.zip && \
    # mv snell-server /usr/bin/ && rm snell-server-v${SNELL_VERSION}-linux-amd64.zip
    mv snell-server /usr/bin/ && rm snell-server-v2.0.0-b7-linux-amd64.zip

ENTRYPOINT /start.sh
