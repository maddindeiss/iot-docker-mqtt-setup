#!/bin/bash

echo "Create folders for NodeRed"

[ -d ./volume ] || mkdir -p ./volume
[ -d ./volume/data ] || mkdir -p ./volume/data
