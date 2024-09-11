#!/bin/bash
echo "Welcome to the"
cat logo.txt

# Update SteamCMD and download latest server binary
echo "Updating SteamCMD and downloading latest server binary..."
cd /steam
./steamcmd.sh +force_install_dir /server +login anonymous +app_update 1690800 +quit

# Configure
ln -s /server/FactoryGame/Saved /saves

# Run server
cd /
./server.sh