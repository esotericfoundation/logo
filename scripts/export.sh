#!/bin/bash

pushd "$(dirname "$0")/.." >/dev/null

pushd "geogebra" >/dev/null
pushd "source/desktop" >/dev/null

gradle desktop:installDist

popd >/dev/null
popd >/dev/null

java -jar ./geogebra/source/desktop/desktop/build/install/desktop/lib/desktop.jar ./esoteric-foundation-logo.ggb --export=./esoteric-foundation-logo.svg

inkscape ./esoteric-foundation-logo.svg --export-area-drawing --export-plain-svg -o ./esoteric-foundation-logo.svg
inkscape ./esoteric-foundation-logo.svg -o ./esoteric-foundation-logo.png

popd >/dev/null
