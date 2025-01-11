#!/bin/bash
cat logo.txt
# Update SteamCMD and download latest server binary
echo "Updating SteamCMD and downloading latest server binary..."
cd /steam
./steamcmd.sh +force_install_dir /server +login anonymous +app_update 1690800 +quit

# Backup saves
TIMESTAMP=$(date +%Y-%m-%d_%H-%M)
cp -r /home/ubuntu/.config/Epic/FactoryGame/Saved/SaveGames /backups/$TIMESTAMP

# Run server
cd /scripts
./server.sh