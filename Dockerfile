FROM ubuntu:latest

LABEL maintainer="thekraken8him"

ENV TIMEZONE=America/Los_Angeles \
    PUID=1000 \
    PGID=1000 \
    MAP_NAME=new-map \
    SERVER_NAME="Jellie Frontier Server" \
    DESCRIPTION="This is a containerized Satisfactory server deployed from the Jellie Frontier." \
    PUBLIC=true \
    STEAM=true \
    LAN=true \
    MAX_PLAYERS=0 \
    PASSWORD=\
    WHITELIST=false \
    PEACEFUL=false \
    SEED=null

EXPOSE 7770/tcp
EXPOSE 7770/udp

# Get base tools
RUN apt-get update
RUN apt-get install software-properties-common apt-transport-https curl lib32gcc-s1 -y

# Create root folders
RUN mkdir /steam && \
    mkdir /server && \
    mkdir /saves && \
    mkdir /config

# Set up SteamCMD
RUN curl -L --max-redirs 1 "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" -o /steam/steamcmd_linux.tar.gz && \
    tar -xf /steam/steamcmd_linux.tar.gz -C /steam && \
    rm /steam/steamcmd_linux.tar.gz

# Add scripts to container
COPY bootstrap.sh bootstrap.sh
COPY server.sh server.sh
COPY logo.txt logo.txt

# Fix Permissions
RUN usermod -l satisfactory ubuntu
RUN chown satisfactory bootstrap.sh && \
    chown satisfactory server.sh && \ 
    chown satisfactory logo.txt && \
    chown -R satisfactory /server && \
    chown -R satisfactory /steam && \
    chown -R satisfactory /saves && \
    chmod +x bootstrap.sh && \
    chmod +x server.sh

USER satisfactory

CMD ["/bin/bash", "bootstrap.sh"]