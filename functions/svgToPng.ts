import sharp from "sharp";

export async function convertSvgToPng(svgContent: string, outputFilePath: string, width: number, height: number) {
    await sharp(Buffer.from(svgContent))
        .resize(width, height)
        .png()
        .toFile(outputFilePath);
}
