FROM casjaysdevdocker/alpine:latest as build

ARG LICENSE=WTFPL \
  IMAGE_NAME=mpd \
  TIMEZONE=America/New_York \
  PORT=

ENV SHELL=/bin/bash \
  TERM=xterm-256color \
  HOSTNAME=${HOSTNAME:-casjaysdev-$IMAGE_NAME} \
  TZ=$TIMEZONE

RUN mkdir -p /bin/ /config/ /data/ && \
  rm -Rf /bin/.gitkeep /config/.gitkeep /data/.gitkeep && \
  apk update -U --no-cache

COPY ./bin/. /usr/local/bin/
COPY ./config/. /config/
COPY ./data/. /data/

FROM scratch
ARG BUILD_DATE="$(date +'%Y-%m-%d %H:%M')"

LABEL org.label-schema.name="mpd" \
  org.label-schema.description="Containerized version of mpd" \
  org.label-schema.url="https://hub.docker.com/r/casjaysdevdocker/mpd" \
  org.label-schema.vcs-url="https://github.com/casjaysdevdocker/mpd" \
  org.label-schema.build-date=$BUILD_DATE \
  org.label-schema.version=$BUILD_DATE \
  org.label-schema.vcs-ref=$BUILD_DATE \
  org.label-schema.license="$LICENSE" \
  org.label-schema.vcs-type="Git" \
  org.label-schema.schema-version="latest" \
  org.label-schema.vendor="CasjaysDev" \
  maintainer="CasjaysDev <docker-admin@casjaysdev.com>"

ENV SHELL="/bin/bash" \
  TERM="xterm-256color" \
  HOSTNAME="casjaysdev-mpd" \
  TZ="${TZ:-America/New_York}"

WORKDIR /root

VOLUME ["/root","/config","/data"]

EXPOSE $PORT

COPY --from=build /. /

HEALTHCHECK --interval=15s --timeout=3s CMD ["/usr/local/bin/entrypoint-mpd.sh", "healthcheck"]

ENTRYPOINT ["/usr/local/bin/entrypoint-mpd.sh"]

