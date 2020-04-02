#!/bin/bash
# Config file and dest directory
dest=$(cat config.json | jq '.country')
if [ "$dest" = "null" ]; then
    dest="pakistan"
fi
dest="${dest//\"}"
configFile="config.json"
cp $configFile $dest/
echo "Running... $dest"
# label-maker download -d $dest -c $dest/$configFile
label-maker labels -s -d $dest -c $dest/$configFile
label-maker images -d $dest -c $dest/$configFile
# label-maker package -d $dest -c $dest/$configFile