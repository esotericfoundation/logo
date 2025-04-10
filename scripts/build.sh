#!/bin/bash

asy logo -f png
asy logo -f svg

asy logo -f png -u 'type = "circle"' -o 'logo-circle'
asy logo -f svg -u 'type = "circle"' -o 'logo-circle'

asy logo -f png -u 'type = "square-centered"' -o 'logo-square-centered'
asy logo -f svg -u 'type = "square-centered"' -o 'logo-square-centered'
