#!/bin/bash

original="$(pwd)"

cd "$(dirname "$0")" || exit 1

cd ..

zip esoteric-foundation-logo.ggb ./logo/*

cd "$original" || exit 1
