#!/bin/bash

echo "Create folders for NodeRed"

[ -d ./volumes/nodered ] || mkdir -p ./volumes/nodered
[ -d ./volumes/nodered/data ] || mkdir -p ./volumes/nodered/data
