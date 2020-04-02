#!/bin/bash
# Config file and dest directory
dest=$(cat config.json | jq '.country')
if [ "$dest" = "null" ]; then
    dest="data"
fi
dest="${dest//\"}"
mkdir -p $dest
cp config.json $dest/
echo "Running... $dest"
# label-maker download -d $dest -c $dest/config.json
label-maker labels -s -d $dest -c $dest/config.json
label-maker images -d $dest -c $dest/config.json
# label-maker package -d $dest -c $dest/config.json