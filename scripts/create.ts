import { mkdirSync, writeFileSync } from "fs";
import { logo } from "../functions/logo.ts";
import { backgroundTypes } from "../types/BackgroundType.ts";
import { logoSizes } from "../types/LogoSize.ts";

for (const backgroundType of backgroundTypes) {
    for (const logoSize of logoSizes) {
        if (backgroundType === "circle" && logoSize === "big") {
            continue;
        }

        let svg = logo(backgroundType, logoSize);

        const fileName = `${"uncropped-" + backgroundType + "-" + logoSize}`;

        const directory = `./logo/svg/${fileName}/`;

        mkdirSync(directory, { recursive: true });
        writeFileSync(`${directory}/logo.svg`, svg);
    }
}
