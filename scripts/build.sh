#!/bin/bash

mkdir 'output'

asy logo -f png -o 'logo' -cd 'output'
asy logo -f svg -o 'logo' -cd 'output'

asy logo -f png -u 'type = "circle"' -o 'logo-circle' -cd 'output'
asy logo -f svg -u 'type = "circle"' -o 'logo-circle' -cd 'output'

asy logo -f png -u 'type = "square-centered"' -o 'logo-square-centered' -cd 'output'
asy logo -f svg -u 'type = "square-centered"' -o 'logo-square-centered' -cd 'output'
