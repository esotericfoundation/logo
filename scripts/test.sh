#!/bin/bash

rm -rf 'test'
mkdir -p 'test'

asy logo -outformat png -outname './test/logo'
asy logo -outformat svg -outname './test/logo'

asy logo -outformat png -user 'type = "square-centered"' -outname './output/logo-square-centered'
asy logo -outformat svg -user 'type = "square-centered"' -outname './output/logo-square-centered'
