# Satisfactory Dedicated Server
PSM container image for Satisfactory. It provides tight integration with the [PSM API](https://github.com/planetary-server-manager/api-server).

## Get Started
1. Once you have [Docker](https://docs.docker.com/engine/install/) configured on your host, simply create a docker-compose.yaml file and paste in the contents of [docker-compose.yaml.example](./docker-compose.yaml.example).
2. In your docker-compose.yaml file, replace **{SAVE DIR}** and **{BACKUP DIR}** with the directories where you would like saves and backups to be placed.
    > **Note**: Docker must have read/write access to these directories.
3. In your terminal of choice, navigate to your docker-compose.yaml file and enter `docker compose up -d`.
4. After a few minutes, your server will be running.

## Claiming Server
> **IMPORTANT**: On first run, you **must** connect to and set up the server using the in-game Server Manager. If you don't and your server is exposed, someone else may be able to claim your server before you do.

## Configuration
I plan on adding some environment variable configuration at some point, but with the release of Satisfactory 1.0, the vast majority of configuration is handled through the in-game Server Manager. It's best to use that tool for configuration. 

## Updates
With each run, the container will automatically check Steam for updates to the server and install them if needed.

## Backups
Also on each run, the container will copy the contents of your **{SAVE DIR}** folder to a time-stamped folder in **{BACKUP DIR}**. This is helpful in case save files get deleted and/or you would like to revert to an older one.