#!/bin/bash
# Config file and dest directory
dest=$(cat config.json | jq '.country')
dest="${dest//\"}_background"
configFile="config.json"
if [ ! -d "$dest" ]; then
    mkdir $dest
fi
cp $configFile $dest/
# label-maker download -d $dest -c $dest/$configFile
# label-maker labels -d $dest -c $dest/$configFile
label-maker images -d $dest -c $dest/$configFile
label-maker package -d $dest -c $dest/$configFile