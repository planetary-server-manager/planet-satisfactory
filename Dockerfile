FROM --platform=$BUILDPLATFORM ghcr.io/planetary-server-manager/planetary-steam-base:latest AS build
ARG TARGETOS
ARG TARGETARCH

LABEL maintainer="renegadespork"

EXPOSE 7777/tcp
EXPOSE 7777/udp

# Create root folders
RUN mkdir /saves

# Add scripts to container
COPY bootstrap.sh bootstrap.sh
COPY server.sh server.sh

# Fix Permissions
RUN usermod -l satisfactory ubuntu
RUN chown satisfactory bootstrap.sh && \
    chown satisfactory server.sh && \ 
    chown -R satisfactory /saves && \
    chmod +x bootstrap.sh && \
    chmod +x server.sh

CMD ["/bin/bash", "bootstrap.sh"]