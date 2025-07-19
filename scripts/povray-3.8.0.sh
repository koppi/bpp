#!/usr/bin/env bash

sudo apt -y install build-essential devscripts automake libboost-dev libboost-thread-dev zlib1g-dev libpng-dev libjpeg-dev libtiff5-dev libopenexr-dev libsdl1.2-dev

export POV_DIR=povray-3.8.0

git clone https://github.com/bullet-physics-playground/povray povray-3.8.0

cd $POV_DIR

 cd unix/ ; ./prebuild.sh ; cd ../

bash bootstrap

export POV_CFG="--prefix=/opt/povray-3.8.0 --program-prefix=pov-3.8.0- --enable-watch-cursor"

./configure $POV_CFG COMPILED_BY="Jakob Flierl <jakob.flierl@gmail.com>"

make all

make check

sudo make install
