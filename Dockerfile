FROM amd64/debian:stable AS builder
USER root
RUN apt-get update && apt-get install -y --no-install-recommends libcurl4-gnutls-dev\
    build-essential libz3-dev libexpat1-dev libssl-dev wget zlib1g-dev fuse \
    curl git libcrypto++-dev libsqlite3-dev ca-certificates cmake libfuse2t64\
    libwxgtk-webview3.2-dev libwxgtk3.2-dev libwxgtk-media3.2-dev file


COPY download.sh /tmp/download.sh
RUN chmod +x /tmp/download.sh && /tmp/download.sh
RUN tar -xzf tqsl.tar.gz && rm tqsl.tar.gz && mv tqsl-* /tmp/tqsl
WORKDIR /tmp/tqsl
ENV APPIMAGE_EXTRACT_AND_RUN=1
RUN sed -e 's/sudo //g' /tmp/tqsl/linux-make-appimage.sh > /tmp/tqsl/linux-appimage.sh && \
    chmod +x /tmp/tqsl/linux-appimage.sh && \
    /tmp/tqsl/linux-appimage.sh
RUN mv /tmp/tqsl/tqsl-*.AppImage /tqsl.AppImage
RUN mv /tmp/tqsl/apps/icons/key128.png /TrustedQSL.png

FROM scratch
COPY --from=builder /tqsl.AppImage /tqsl.AppImage
COPY --from=builder /TrustedQSL.png /TrustedQSL.png
