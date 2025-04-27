#!/bin/bash
git submodule update --init

cd asymptote

./autogen.sh
./configure

make all
sudo make install
