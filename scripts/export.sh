#!/bin/bash
# Exports the logo to a PNG file.
npx tsx ./scripts/create.ts

npx svgexport "./logo/svg/logo.svg" "logo/png/512x512.png"
