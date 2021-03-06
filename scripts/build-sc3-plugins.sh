#!/bin/bash

buildfolder='build/sc3-plugins'
cd ~/git/dots
[ ! -d 'build' ] && mkdir "build"
[ ! -d $buildfolder ] && git clone --recurse-submodules http://github.com/supercollider/sc3-plugins $buildfolder
[ ! -d "$buildfolder/build" ] && mkdir "$buildfolder/build"
cd "$buildfolder/build"

echo "pwd: $(pwd)"

# for both scsynth and supernova plugins; omit -DSUPERNOVA=ON to build only scsynth plugins
cmake -DSC_PATH=../../supercollider -DCMAKE_BUILD_TYPE=Release -DSUPERNOVA=ON ..
cmake --build . --config Release
# to install the plugins - note: linux users likely need sudo
sudo cmake --build . --config Release --target install
