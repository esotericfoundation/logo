#!/bin/bash

rm -rf 'test'
mkdir -p 'test'

asy logo -outformat png -outname './test/logo'
asy logo -outformat svg -outname './test/logo'
