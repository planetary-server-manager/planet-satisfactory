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

# Auto Updates
Automatic updates are turned **on** by default. This will ensure the container always downloads the latest server version every time it starts. If you would like to stay on your current version and disable auto updates, set **AUTO_UPDATE** to **false**.

> **Note**: **AUTO_UPDATE** must be set to **true** for the first run of the container, otherwise no server will be downloaded.

# Map Backups
### Enable Backups
Automatic backups are turned **off** by default. To utilize automatic backups, you will need to do the following:
* Set the **BACKUPS** environment variable to **true**.
* Map the **/backups** volume to your host.

> If you would rather do your own backups manually, your (live) save is contained in the volume mapped to `/home/ubuntu/.config/Epic/FactoryGame/Saved/SaveGames`. I **highly** recommend stopping your server before saving to avoid world corruption.

### How Backups Work
If **BACKUPS** is set to **true**, then each time the container is run, it will automatically create a backup of your **WORLD_NAME** in the **/backups** folder. Each backup will be named the date and time it was created (%Y-%m-%d_%H-%M-%S format). 

> **Example**: If your map is saved on January 2nd, 2024 at exactly 3:45am, the backup will be called **"20204-01-02_03-45-00"**.

# Volumes
> :warning: **Important**: It is highly recommended that you map these volumes to your host machine. Otherwise all save data and configuration will be lost when the container is deleted/updated.

| Path | Description |
| --- | --- |
| /server | This contains all your server files including configuration, worlds, and the server binary itself. |
| /backups | This contains all map backups (if they are enabled). See [Map Backups](#map-backups) for more information. |

## Configuration
I plan on adding some environment variable configuration at some point, but with the release of Satisfactory 1.0, the vast majority of configuration is handled through the in-game Server Manager. It's best to use that tool for configuration. 