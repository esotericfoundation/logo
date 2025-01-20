#!/bin/bash
# Exports the logo to a PNG file.
npx tsx ./scripts/createSvg.ts

npx svgexport "Esoteric Foundation Logo.svg" "logo/png/512x512.png"
