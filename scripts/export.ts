import { mkdirSync, readFileSync } from "fs";
import { convertSvgToPng } from "../functions/svgToPng.ts";
import { getFiles } from "esoteric-utility";

getFiles("logo/svg").forEach((fileName: string) => {
    const svg = readFileSync(fileName).toString();

    console.log(svg);

    for (const resolution of [16, 32, 64, 128, 256, 512, 1024, 2048, 4096]) {
        console.log("Exporting to PNG...")

        const type = fileName.match(/\w+-\w+-\w+/)[0];

        if (type === "cropped-square-big") {
            return;
        }
    
        mkdirSync("./logo/png", { recursive: true });
        mkdirSync(`./logo/png/${type}`, { recursive: true })
    
        convertSvgToPng(svg, `${fileName.replace("logo/svg", "logo/png").replace("/logo.svg", "")}/${resolution}x${resolution}.png`, resolution, resolution).catch(console.error);
    }
});
