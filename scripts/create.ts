import { mkdirSync, writeFileSync } from "fs";
import { logo } from "../functions/logo.ts";
import { backgroundTypes } from "../types/BackgroundType.ts";
import { logoSizes } from "../types/LogoSize.ts";
import { convertSvgToPng } from "../functions/svgToPng.ts";
import { cropSvg } from "../functions/cropSvg.ts";

for (const crop of [true, false]) {
    for (const backgroundType of backgroundTypes) {
        for (const logoSize of logoSizes) {
            if (backgroundType === "circle" && logoSize === "big") {
                continue;
            }

            let svg = logo(backgroundType, logoSize);

            if (crop) {
                svg = await cropSvg(svg);
            }
            
            const fileName = `${(crop ? "cropped" : "uncropped") + "-" + backgroundType + "-" + logoSize}`;

            const directory = `./logo/svg/${fileName}/`;

            mkdirSync(directory, { recursive: true });
            writeFileSync(`${directory}/logo.svg`, svg);

            for (const resolution of [16, 32, 64, 128, 256, 512, 1024, 2048, 4096]) {
                console.log("Exporting to PNG...")

                mkdirSync("./logo/png", { recursive: true });
                mkdirSync(`./logo/png/${fileName}`, { recursive: true })

                convertSvgToPng(svg, `./logo/png/${fileName}/${resolution}x${resolution}.png`, resolution, resolution).catch(console.error);
            }
        }
    }
}
