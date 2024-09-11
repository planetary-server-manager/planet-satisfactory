FROM ubuntu:latest

LABEL maintainer="thekraken8him"

ENV TIMEZONE=America/Los_Angeles \
    PUID=1000 \
    PGID=1000

EXPOSE 7777/tcp
EXPOSE 7777/udp

# Get base tools
RUN apt-get update
RUN apt-get install software-properties-common apt-transport-https curl lib32gcc-s1 -y

# Create root folders
RUN mkdir /steam && \
    mkdir /server && \
    mkdir /saves && \
    mkdir /backups

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
    chown -R satisfactory /backups && \
    chmod +x bootstrap.sh && \
    chmod +x server.sh

USER satisfactory

CMD ["/bin/bash", "bootstrap.sh"]