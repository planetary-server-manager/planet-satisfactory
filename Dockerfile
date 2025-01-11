FROM --platform=$BUILDPLATFORM ghcr.io/planetary-server-manager/planetary-steam-base:latest AS build
ARG TARGETOS
ARG TARGETARCH

LABEL maintainer="renegadespork"

EXPOSE 7777/tcp
EXPOSE 7777/udp

# Create root folders
RUN mkdir /saves

# Add scripts to container
COPY /scripts /scripts

# Fix Permissions
RUN usermod -l satisfactory ubuntu
RUN chown -R satisfactory /scripts && \
    chown -R satisfactory /saves && \
    chmod -R 770 /scripts

USER satisfactory

CMD ["/bin/bash", "/scripts/bootstrap.sh"]