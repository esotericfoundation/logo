#!/bin/bash
# Exports the logo to a PNG file.
mkdir -p logo
mkdir -p logo/svg
mkdir -p logo/svg/square
mkdir -p logo/svg/cropped

npx tsx ./scripts/create.ts

inkscape ./logo/svg/logo.svg --export-area-drawing --export-plain-svg --export-filename="logo/svg/cropped/logo.svg"
rm ./logo/svg/logo.svg

mkdir -p logo/png
mkdir -p logo/png/cropped
mkdir -p logo/png/square

npx svgexport "./logo/svg/cropped/logo.svg" "logo/png/cropped/0.03125x.png" 0.03125x
npx svgexport "./logo/svg/cropped/logo.svg" "logo/png/cropped/0.0625x.png" 0.0625x
npx svgexport "./logo/svg/cropped/logo.svg" "logo/png/cropped/0.125x.png" 0.125x
npx svgexport "./logo/svg/cropped/logo.svg" "logo/png/cropped/0.25x.png" 0.25x
npx svgexport "./logo/svg/cropped/logo.svg" "logo/png/cropped/0.5x.png" 0.5x
npx svgexport "./logo/svg/cropped/logo.svg" "logo/png/cropped/1x.png"
npx svgexport "./logo/svg/cropped/logo.svg" "logo/png/cropped/2x.png" 2x
npx svgexport "./logo/svg/cropped/logo.svg" "logo/png/cropped/4x.png" 4x
npx svgexport "./logo/svg/cropped/logo.svg" "logo/png/cropped/8x.png" 8x

npx svgexport "./logo/svg/square/logo.svg" "logo/png/square/16x16.png" 16:
npx svgexport "./logo/svg/square/logo.svg" "logo/png/square/32x32.png" 32:
npx svgexport "./logo/svg/square/logo.svg" "logo/png/square/64x64.png" 64:
npx svgexport "./logo/svg/square/logo.svg" "logo/png/square/128x128.png" 128:
npx svgexport "./logo/svg/square/logo.svg" "logo/png/square/256x256.png" 256:
npx svgexport "./logo/svg/square/logo.svg" "logo/png/square/512x512.png" 512:
npx svgexport "./logo/svg/square/logo.svg" "logo/png/square/1024x1024.png" 1024:
npx svgexport "./logo/svg/square/logo.svg" "logo/png/square/2048x2048.png" 2048:
npx svgexport "./logo/svg/square/logo.svg" "logo/png/square/4096x4096.png" 4096:
