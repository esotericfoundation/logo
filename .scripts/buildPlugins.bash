for d in ./.obsidian/plugins/*/ ; do (
    echo "Building $d"

    cd $d
    if [ $d != "./.obsidian/plugins/excalidraw/" ]; then
        npm run dev
    fi

    if [ $d = "./.obsidian/plugins/excalidraw/" ]; then
        npm run build

        echo "Copying excalidraw files"
        cp -r ./dist/* .
    fi
); done
