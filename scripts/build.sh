#!/bin/bash

rm -rf 'output'
mkdir -p 'output'

asy logo -f png -o './output/logo'
asy logo -f svg -o './output/logo'

asy logo -f png -u 'type = "circle"' -o './output/logo-circle'
asy logo -f svg -u 'type = "circle"' -o './output/logo-circle'

asy logo -f png -u 'type = "square-centered"' -o './output/logo-square-centered'
asy logo -f svg -u 'type = "square-centered"' -o './output/logo-square-centered'

# GitHub
# The border distance must be 5 so that the polygon is properly spaced in places such as organisation projects and organisation member profiles.
# This is because the logo is displayed in some locations with a slight border radius which could cause the polygon to not actually be the same distance from the top and bottom of the logo if its not properly distanced.
# This border radius needs to be exceeded by the distance from the polygon to the sides of the logo so that it is actually equally spaced from the top and bottom of the logo 
# A border distance of 5 just happens to be the smallest whole number where this is achieved in all places that the logo is displayed.
asy logo -f svg -u 'type = "square-equidistant"; borderDistance = 5' -o './output/logo-square-equidistant'
asy logo -f png -u 'type = "square-equidistant"; borderDistance = 5' -o './output/logo-square-equidistant'
