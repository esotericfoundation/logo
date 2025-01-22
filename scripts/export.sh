#!/bin/bash
# Exports the logo to many file types.

npx tsx ./scripts/create.ts

grep -o '\"\S\+\"' ./types/BackgroundType.ts | sed 's/"//g' | while read -r background_type; do
    grep -o '\"\S\+\"' ./types/LogoSize.ts | sed 's/"//g' | while read -r logo_size; do
        file_name="$background_type-$logo_size"
        
        # Skip the loop if file_name is "cropped-square-big"
        if [ "$file_name" = "square-big" ]; then
            echo "Skipping:$file_name"
            continue
        fi

        if [ "$file_name" = "square-small" ]; then
            echo "Skipping:$file_name"
            continue
        fi
        
        echo "Processing:$file_name"

        mkdir -p logo/svg/cropped-$file_name

        inkscape ./logo/svg/uncropped-$file_name/logo.svg --export-area-drawing --export-plain-svg --export-filename="logo/svg/cropped-$file_name/logo.svg"
    done
done

npx tsx ./scripts/export.ts
