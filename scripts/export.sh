#!/bin/bash
# Exports the logo to a PNG file.
npx tsx ./scripts/create.ts

mkdir logo/png
npx svgexport "./logo/svg/logo.svg" "logo/png/16x16.png" 16:
npx svgexport "./logo/svg/logo.svg" "logo/png/32x32.png" 32:
npx svgexport "./logo/svg/logo.svg" "logo/png/64x64.png" 64:
npx svgexport "./logo/svg/logo.svg" "logo/png/128x128.png" 128:
npx svgexport "./logo/svg/logo.svg" "logo/png/256x256.png" 256:
npx svgexport "./logo/svg/logo.svg" "logo/png/512x512.png" 512:
npx svgexport "./logo/svg/logo.svg" "logo/png/1024x1024.png" 1024:
npx svgexport "./logo/svg/logo.svg" "logo/png/2048x2048.png" 2048:
npx svgexport "./logo/svg/logo.svg" "logo/png/4096x4096.png" 4096:
