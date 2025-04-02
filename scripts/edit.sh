#!/bin/bash

set -e

pushd "$(dirname "$0")/.." >/dev/null

pushd "geogebra" >/dev/null
pushd "source/desktop" >/dev/null

gradle desktop:installDist

popd >/dev/null
popd >/dev/null

bash ./scripts/zip.sh

java -jar ./geogebra/source/desktop/desktop/build/install/desktop/lib/desktop.jar --showSplash=false ./esoteric-foundation-logo.ggb

bash ./scripts/unzip.sh
bash ./scripts/export.sh

popd >/dev/null
