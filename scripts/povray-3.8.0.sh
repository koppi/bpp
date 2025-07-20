#!/usr/bin/env bash

export POV_DIR=povray-3.8.0
export POV_CFG="--prefix=/opt/povray-3.8.0 --program-prefix=pov-3.8.0- --enable-watch-cursor"

sudo apt -y install build-essential devscripts automake libboost-dev libboost-thread-dev zlib1g-dev libpng-dev libjpeg-dev libtiff5-dev libopenexr-dev libsdl1.2-dev

git clone https://github.com/bullet-physics-playground/povray $POV_DIR

cd $POV_DIR

 cd unix/ ; ./prebuild.sh ; cd ../

bash bootstrap

./configure $POV_CFG COMPILED_BY="Jakob Flierl <jakob.flierl@gmail.com>"

make all

make check

sudo make install
