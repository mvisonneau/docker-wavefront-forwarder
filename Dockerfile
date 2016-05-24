FROM java:8u92-jre-alpine

# CONFD
ADD https://github.com/kelseyhightower/confd/releases/download/v0.11.0/confd-0.11.0-linux-amd64 /usr/local/bin/confd
ADD confd /etc/confd

RUN \
apk add --update bash && rm -rf /var/cache/apk/* && \
chmod +x /usr/local/bin/confd && \
mkdir -p /opt/wavefront/conf

ADD bin /opt/wavefront/bin

# RUNTIME
EXPOSE 2878
ADD docker-entrypoint /docker-entrypoint
ADD docker-entrypoint.d /docker-entrypoint.d
ENTRYPOINT ["/docker-entrypoint"]
