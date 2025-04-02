#!/bin/bash

set -e

pushd "$(dirname "$0")/.." >/dev/null

pushd "geogebra" >/dev/null
pushd "source/desktop" >/dev/null

gradle desktop:installDist

popd >/dev/null
popd >/dev/null

timeout 30s java -jar ./geogebra/source/desktop/desktop/build/install/desktop/lib/desktop.jar --showSplash=false --showAlgebraInput=false --showAlgebraInputTop=false --showAlgebraWindow=false --showSpreadsheet=false --showCAS=false --show3D=false --logLevel=TRACE ./esoteric-foundation-logo.ggb --export=./esoteric-foundation-logo.svg || echo "Timed out while exporting with GeoGebra"

inkscape ./esoteric-foundation-logo.svg --export-area-drawing --export-plain-svg -o ./esoteric-foundation-logo.svg
inkscape ./esoteric-foundation-logo.svg -o ./esoteric-foundation-logo.png

popd >/dev/null
