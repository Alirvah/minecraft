#!/bin/bash

mkdir -p ~/minecraft && cd ~/minecraft

version=$(curl -s https://papermc.io/api/v2/projects/paper | jq -r .versions[-1])
build=$(curl -s https://papermc.io/api/v2/projects/paper/versions/$version | jq -r .builds[-1])
appname=$(curl -s https://papermc.io/api/v2/projects/paper/versions/$version/builds/$build | jq -r .downloads.application.name)

downloadLink=$(echo "https://papermc.io/api/v2/projects/paper/versions/$version/builds/$build/downloads/$appname")
wget $downloadLink -O $appname

java -Xms2G -Xmx4G -jar $appname