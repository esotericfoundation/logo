for d in ./.obsidian/plugins/*/ ; do (
    cd $d
    if [ $d != "./.obsidian/plugins/excalidraw/" ]; then
        npm run dev
    fi

    if [ $d = "./.obsidian/plugins/excalidraw/" ]; then
        npm run build

        cp -r ./dist/* .
    fi
); done
