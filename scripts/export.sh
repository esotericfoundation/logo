#!/bin/bash
# Exports the logo to a PNG file.
npx tsx ./scripts/create.ts

inkscape ./logo/svg/logo.svg --export-area-drawing --export-plain-svg --export-filename=logo/svg/cropped-logo.svg

mkdir logo/png
npx svgexport "./logo/svg/cropped-logo.svg" "logo/png/0.03125x.png" 0.03125x
npx svgexport "./logo/svg/cropped-logo.svg" "logo/png/0.0625x.png" 0.0625x
npx svgexport "./logo/svg/cropped-logo.svg" "logo/png/0.125x.png" 0.125x
npx svgexport "./logo/svg/cropped-logo.svg" "logo/png/0.25x.png" 0.25x
npx svgexport "./logo/svg/cropped-logo.svg" "logo/png/0.5x.png" 0.5x
npx svgexport "./logo/svg/cropped-logo.svg" "logo/png/1x.png"
npx svgexport "./logo/svg/cropped-logo.svg" "logo/png/2x.png" 2x
npx svgexport "./logo/svg/cropped-logo.svg" "logo/png/4x.png" 4x
npx svgexport "./logo/svg/cropped-logo.svg" "logo/png/8x.png" 8x
