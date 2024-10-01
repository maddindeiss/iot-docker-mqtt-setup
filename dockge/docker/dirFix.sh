#!/bin/bash

echo "Create folders for Dockge"

[ -d ./volume ] || mkdir -p ./volume
[ -d ./volume/data ] || mkdir -p ./volume/data
[ -d ./volume/stacks ] || mkdir -p ./volume/stacks
