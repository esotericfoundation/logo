#!/bin/bash

original="$(pwd)"

cd "$(dirname "$0")" || exit 1

cd ../logo

zip esoteric-foundation-logo.ggb *

cd "$original" || exit 1
