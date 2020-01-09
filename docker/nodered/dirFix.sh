#!/bin/bash

echo "Create folders for NodeRed and fix permissions"

[ -d ./volumes/nodered ] || sudo mkdir -p ./volumes/nodered
[ -d ./volumes/nodered/data ] || sudo mkdir -p ./volumes/nodered/data

sudo chown -R $USER:$USER ./volumes/nodered/