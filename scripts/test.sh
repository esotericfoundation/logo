#!/bin/bash

rm -rf 'test'
mkdir -p 'test'

asy logo -outformat png -outname './test/logo'
asy logo -outformat svg -outname './test/logo'

asy logo -outformat png -user 'type = "circle"' -outname './test/logo-circle'
asy logo -outformat svg -user 'type = "circle"' -outname './test/logo-circle'

asy logo -outformat png -user 'type = "square-centered"' -outname './test/logo-square-centered'
asy logo -outformat svg -user 'type = "square-centered"' -outname './test/logo-square-centered'

asy logo -outformat svg -user 'type = "square-equidistant"' -outname './test/logo-square-equidistant'
asy logo -outformat png -user 'type = "square-equidistant"' -outname './test/logo-square-equidistant'
