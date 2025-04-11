#!/bin/bash

asy logo -f png -o 'output/logo'
asy logo -f svg -o 'output/logo'

asy logo -f png -u 'type = "circle"' -o 'output/logo-circle'
asy logo -f svg -u 'type = "circle"' -o 'output/logo-circle'

asy logo -f png -u 'type = "square-centered"' -o 'output/logo-square-centered'
asy logo -f svg -u 'type = "square-centered"' -o 'output/logo-square-centered'
