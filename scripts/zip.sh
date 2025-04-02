#!/bin/bash

set -e

original="$(pwd)"

cd "$(dirname "$0")"

cd ../logo

zip esoteric-foundation-logo.ggb *

mv *.ggb ../

cd "$original"
