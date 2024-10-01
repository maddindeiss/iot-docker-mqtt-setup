#!/bin/bash

echo "Create folders for Dockge"

[ -d ./volumes/dockge ] || mkdir -p ./volumes/dockge
[ -d ./volumes/dockge/data ] || mkdir -p ./volumes/dockge/data
[ -d ./volumes/dockge/stacks ] || mkdir -p ./volumes/dockge/stacks
