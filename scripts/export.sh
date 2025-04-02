#!/bin/bash

set -e

pushd "$(dirname "$0")/.." >/dev/null

pushd "geogebra" >/dev/null

gradle desktop:installDist

popd >/dev/null

java -jar ./geogebra/desktop/build/install/desktop/lib/desktop.jar ./esoteric-foundation-logo.ggb --export=./esoteric-foundation-logo.svg

inkscape ./esoteric-foundation-logo.svg --export-area-drawing --export-plain-svg -o ./esoteric-foundation-logo.svg
inkscape ./esoteric-foundation-logo.svg -o ./esoteric-foundation-logo.png

popd >/dev/null
