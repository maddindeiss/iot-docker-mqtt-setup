#!/bin/bash

echo "Create folders for NodeRed and fix permissions"

[ -d ./volumes/nodered ] || mkdir -p ./volumes/nodered
[ -d ./volumes/nodered/data ] || mkdir -p ./volumes/nodered/data
