#!/bin/bash
echo "Starting server..."
./server/FactoryServer.sh -log -multihome=0.0.0.0 -ini:Engine:[HTTPServer.Listeners]:DefaultBindAddress=any