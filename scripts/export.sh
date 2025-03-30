#!/bin/bash

pushd "$(dirname "$0")/.." >/dev/null

pushd "geogebra" >/dev/null

gradle desktop:installDist

popd >/dev/null

java -jar ./geogebra/desktop/build/install/desktop/lib/desktop.jar ./esoteric-foundation-logo.ggb --export=./esoteric-foundation-logo.png

popd >/dev/null
